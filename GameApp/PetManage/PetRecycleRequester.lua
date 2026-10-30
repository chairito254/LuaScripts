-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetRecycleRequester.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local ItemConstSourceData = require("Data.item_const_source_data")
local Const = require("Common.Const.Const")
local UNITY_EDITOR = UNITY_EDITOR
local weakValueMeta = {
	__mode = "v"
}
local PetRecycleRequester = Class.LiteClass("PetRecycleRequester")

function PetRecycleRequester:ctor(owner)
	self.owner = owner
	self.pendingBatches = {}
	self.pendingPetIds = {}
end

function PetRecycleRequester:start(petIds, batchTimeout)
	if self.activeContext then
		return false, "busy"
	end

	if Utils.isNilOrEmptyTable(petIds) then
		return false, "empty"
	end

	if self.owner:hasRecyclingPet(petIds) then
		return false, "petPending"
	end

	local player = pg.me

	if not player or player.destroyed or not player.server then
		return false, "unavailable"
	end

	if player.isRecycling then
		return false, "busy"
	end

	local snapshot, selected = {}, {}

	for _, petId in ipairs(petIds) do
		if self.pendingPetIds[petId] then
			return false, "petPending"
		end

		if not selected[petId] then
			selected[petId] = true
			snapshot[#snapshot + 1] = petId
		end
	end

	local batchCount = math.ceil(#snapshot / Const.RECYCLE_PET_BATCH_SIZE)

	if batchCount <= 1 then
		local ok = pcall(player.serverMsg, player, "RPC_CS_RecyclePet", snapshot, 0)

		if not ok then
			return false, "sendFailed"
		end

		return true
	end

	local batchReqSystem = pg.game.serialBatchRequest

	if not batchReqSystem then
		return false, "unavailable"
	end

	local context = {
		playerRef = setmetatable({
			player
		}, weakValueMeta),
		petIds = snapshot,
		batchRequest = batchReqSystem
	}

	self.activeContext = context

	self.owner:markRecyclingPets(snapshot)
	player:refreshRecyclingStatus(true)

	local taskId, reason = context.batchRequest:start({
		items = snapshot,
		batchSize = Const.RECYCLE_PET_BATCH_SIZE,
		batchTimeout = batchTimeout or Const.BATCH_REQUEST_DEFAULT_TIMEOUT_SECONDS,
		maxRetries = Const.BATCH_REQUEST_DEFAULT_RETRY_COUNT,
		player = player,
		rewardSource = ItemConstSourceData.ITEM_SOURCE_RECYCLE_PET,
		sendBatch = function(items, clientBatch, batch)
			return self:sendBatch(context, items, clientBatch, batch)
		end,
		onFinished = function(summary)
			self:onFinished(context, summary)
		end
	})

	context.taskId = taskId

	if not taskId then
		self.activeContext = nil

		self.owner:unmarkRecyclingPets(snapshot)
		player:refreshRecyclingStatus(false)

		return false, reason
	end

	if UNITY_EDITOR and Const.OpenBatchRequestDebug and self.activeContext == context then
		local BatchRequestTest = require("GameApp.BatchRequest.BatchRequestTest")
		local testError

		context.test, testError = BatchRequestTest.take(player, math.ceil(#snapshot / Const.RECYCLE_PET_BATCH_SIZE), Const.BATCH_REQUEST_DEFAULT_RETRY_COUNT)

		if testError then
			context.batchRequest:cancel(taskId, "testInvalidBatch")
			pg.global.ui.tips:showTextTip(testError)

			return false, "testInvalidBatch"
		end
	end

	return true
end

function PetRecycleRequester:sendBatch(context, petIds, clientBatch, batch)
	local player = context.playerRef[1]

	if self.activeContext ~= context or not player or player.destroyed or player ~= pg.me or not player.server then
		batch.noLateTracking = true

		return false
	end

	batch.noLateTracking = nil

	local pending = {
		context = context,
		petIds = petIds
	}

	self.pendingBatches[clientBatch] = pending

	for _, petId in ipairs(petIds) do
		self.pendingPetIds[petId] = clientBatch
	end

	local function beforeFunc(reason)
		if self.activeContext == context and self.pendingBatches[clientBatch] == pending then
			self:releaseBatch(clientBatch)
			context.batchRequest:onBatchFailed(clientBatch, reason)
		end
	end

	local function attemptFailedFunc(reason)
		if self.activeContext == context and self.pendingBatches[clientBatch] == pending then
			context.batchRequest:onBatchAttemptFailed(clientBatch, reason)
		end
	end

	if context.test and not context.test:beforeSend(clientBatch, player, beforeFunc, batch, attemptFailedFunc) then
		return true
	end

	local ok = pcall(player.serverMsg, player, "RPC_CS_RecyclePet", petIds, clientBatch)

	if not ok then
		batch.noLateTracking = true

		self:releaseBatch(clientBatch)

		return false
	end

	if context.test then
		context.test:onRealSend(clientBatch)
		context.test:afterSend(clientBatch, player)
	end

	return true
end

function PetRecycleRequester:releaseBatch(clientBatch)
	local pending = self.pendingBatches[clientBatch]

	if not pending then
		return
	end

	self.pendingBatches[clientBatch] = nil

	local releasedPetIds = {}

	for _, petId in ipairs(pending.petIds) do
		if self.pendingPetIds[petId] == clientBatch then
			self.pendingPetIds[petId] = nil
			releasedPetIds[#releasedPetIds + 1] = petId
		end
	end

	if #releasedPetIds > 0 then
		self.owner:unmarkRecyclingPets(releasedPetIds)
	end
end

function PetRecycleRequester:onCompleted(player, releasedPetInfos, clientBatch, completedItemDict)
	if not clientBatch or clientBatch == 0 then
		return false
	end

	local pending = self.pendingBatches[clientBatch]

	if not pending then
		local batchReqSystem = pg.game and pg.game.serialBatchRequest

		if batchReqSystem and batchReqSystem.onBatchCompleted then
			batchReqSystem:onBatchCompleted(clientBatch, releasedPetInfos, completedItemDict)
		end

		return true
	end

	if not player or player.destroyed or pending.context.playerRef[1] ~= player or player ~= pg.me then
		return true
	end

	if pending.context.test then
		pending.context.test:onCompleted(clientBatch)
	end

	local wasActive = self.activeContext == pending.context

	self:releaseBatch(clientBatch)

	local accepted = pending.context.batchRequest:onBatchCompleted(clientBatch, releasedPetInfos, completedItemDict)

	if not accepted and not wasActive then
		self.owner:refreshRecyclePetList(player)
	end

	return true
end

function PetRecycleRequester:onFinished(context, summary)
	if self.activeContext ~= context then
		return
	end

	self.activeContext = nil

	if context.test then
		local skippedClientBatch = context.test:finish(summary)

		if skippedClientBatch then
			self:releaseBatch(skippedClientBatch)
		end
	end

	local player = context.playerRef[1]
	local isCurrentPlayer = player and not player.destroyed and player == pg.me

	if player and not player.destroyed then
		player:refreshRecyclingStatus(false)
	end

	self.owner:unmarkRecyclingPets(context.petIds)

	for clientBatch, pending in pairs(self.pendingBatches) do
		if pending.context == context then
			if isCurrentPlayer then
				self.owner:markRecyclingPets(pending.petIds)
			else
				self:releaseBatch(clientBatch)
			end
		end
	end

	if isCurrentPlayer and summary.reason ~= "logout" and summary.reason ~= "cleared" and summary.reason ~= "destroyed" and summary.reason ~= "playerDestroyed" then
		self.owner:refreshRecyclePetList(player)
	end
end

function PetRecycleRequester:clear(reason)
	if UNITY_EDITOR then
		local BatchRequestTest = require("GameApp.BatchRequest.BatchRequestTest")

		BatchRequestTest.clear()
	end

	local context = self.activeContext

	if context then
		context.batchRequest:cancel(context.taskId, reason)

		if self.activeContext == context then
			self:onFinished(context, {
				reason = reason
			})
		end
	end

	for clientBatch in pairs(self.pendingBatches) do
		self:releaseBatch(clientBatch)
	end
end

return PetRecycleRequester
