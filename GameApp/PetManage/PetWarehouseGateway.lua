-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetWarehouseGateway.lua

local Class = require("Core.Framework.Class")
local LoggerManager = require("Core.Log.LoggerManager")
local Const = require("Common.Const.Const")
local ClientSwitch = require("Common.ClientSwitch")
local Time = require("Core.Common.Time")
local TimerManager = require("Core.Timer.TimerManager")
local PetInfo = require("CustomTypes.PetInfo")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetWarehouseDataAdapter = require("GameApp.PetManage.PetWarehouseDataAdapter")
local Utils = require("Common.Utils.Utils")
local logger = LoggerManager.getLogger("PetWarehouseGateway")
local PetWarehouseGateway = Class.LightClass("PetWarehouseGateway")

function PetWarehouseGateway:ctor()
	self.player = nil
	self.requestSequence = 0
end

function PetWarehouseGateway:bindPlayer(player)
	self.player = player
end

function PetWarehouseGateway:unbindPlayer(player)
	if player == nil or self.player == player then
		self.player = nil
	end
end

function PetWarehouseGateway:_newRequest(action, petIds)
	self.requestSequence = self.requestSequence + 1

	return {
		requestId = self.requestSequence,
		action = action,
		petIds = petIds,
		status = PetWarehouseConst.STATE.REQUESTING
	}
end

function PetWarehouseGateway:_sendPlayerMessage(messageName, operation, ...)
	local player = self.player

	if not player or player.destroyed or not player.server then
		operation.status = PetWarehouseConst.STATE.FAILED
		operation.reason = PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

		logger:warn("warehouse request dropped, player unavailable: requestId=%s action=%s", tostring(operation.requestId), tostring(operation.action))

		return false
	end

	local ok, err = pcall(player.serverMsg, player, messageName, ...)

	if not ok then
		operation.status = PetWarehouseConst.STATE.FAILED
		operation.reason = PetWarehouseConst.REASON.TRANSPORT_ERROR

		logger:error("warehouse rpc failed: requestId=%s action=%s rpc=%s error=%s", tostring(operation.requestId), tostring(operation.action), tostring(messageName), tostring(err))

		return false
	end

	operation.status = PetWarehouseConst.STATE.WAITING_SERVER

	return true
end

function PetWarehouseGateway:_clearDetailTimer(operation)
	local timerId = operation.detailTimer

	operation.detailTimer = nil

	if timerId ~= nil then
		TimerManager.removeTimer(timerId)
	end
end

function PetWarehouseGateway:_readDetailSendInterval()
	if not ClientSwitch.ClientMsCallRateLimitEnable then
		return 0
	end

	local windowMs = tonumber(ClientSwitch.ClientMsCallRateLimitWindowMs) or 1000
	local maxCount = tonumber(ClientSwitch.ClientMsCallRateLimitMaxCount) or 20

	if windowMs <= 0 or maxCount <= 0 then
		return 0
	end

	return windowMs / maxCount / 1000
end

function PetWarehouseGateway:_finishPetDetails(operation)
	if operation.finished then
		return
	end

	operation.finished = true

	self:_clearDetailTimer(operation)

	if operation.cancelled then
		operation.status = PetWarehouseConst.STATE.FAILED
		operation.reason = operation.reason or PetWarehouseConst.REASON.PLAYER_UNAVAILABLE
	elseif next(operation.failedIds) == nil then
		operation.status = PetWarehouseConst.STATE.SUCCEEDED
	elseif next(operation.infos) ~= nil then
		operation.status = PetWarehouseConst.STATE.PARTIALLY_SUCCEEDED
		operation.reason = operation.reason or PetWarehouseConst.REASON.TRANSPORT_ERROR
	else
		operation.status = PetWarehouseConst.STATE.FAILED
		operation.reason = operation.reason or PetWarehouseConst.REASON.TRANSPORT_ERROR
	end

	if operation.callback then
		operation.callback(operation)
	end
end

function PetWarehouseGateway:_queryPetDetailsBatch(operation, batchIndex)
	if operation.finished then
		return
	end

	local player = self.player

	if player ~= operation.player or player == nil or player.destroyed then
		operation.cancelled = true
		operation.reason = PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

		self:_finishPetDetails(operation)

		return
	end

	local petIds = operation.batches[batchIndex]

	if petIds == nil then
		self:_finishPetDetails(operation)

		return
	end

	operation.batchId = batchIndex
	operation.status = PetWarehouseConst.STATE.WAITING_SERVER

	local fields = {}

	if operation.forRecycle and player.simplifyPets and player.simplifyPets.getRecyclePetAttrs then
		fields = player.simplifyPets:getRecyclePetAttrs()
	end

	local function onResponse(retStatus, response)
		if operation.finished then
			return
		end

		if self.player ~= operation.player or player.destroyed then
			operation.cancelled = true
			operation.reason = PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

			self:_finishPetDetails(operation)

			return
		end

		if not Utils.isTable(retStatus) or retStatus.status ~= true then
			for _, petId in ipairs(petIds) do
				operation.failedIds[petId] = PetWarehouseConst.REASON.TRANSPORT_ERROR
			end

			operation.reason = retStatus and (retStatus.reason or retStatus.errmsg) or PetWarehouseConst.REASON.TRANSPORT_ERROR

			self:_schedulePetDetailsBatch(operation, batchIndex + 1)

			return
		end

		local responseInfos = Utils.isTable(response) and response.PetInfos or nil

		for _, petId in ipairs(petIds) do
			local rawInfo = responseInfos and responseInfos[petId]

			if not Utils.isTable(rawInfo) then
				operation.failedIds[petId] = PetWarehouseConst.REASON.PET_NOT_FOUND
			else
				local source = rawInfo

				if operation.forRecycle then
					local summary = player.simplifyPets and player.simplifyPets[petId]

					if summary == nil or summary.id ~= petId then
						operation.failedIds[petId] = PetWarehouseConst.REASON.PET_NOT_FOUND
					else
						local snapshot = summary.getRawTable and summary:getRawTable()

						if not Utils.isTable(snapshot) then
							operation.failedIds[petId] = PetWarehouseConst.REASON.PET_NOT_FOUND
						else
							source = snapshot

							table.merge(source, rawInfo)
						end
					end
				end

				if operation.failedIds[petId] == nil then
					operation.infos[petId] = PetInfo(source)
				end
			end
		end

		self:_schedulePetDetailsBatch(operation, batchIndex + 1)
	end

	operation.lastDetailSendAt = Time.getTickSecond()

	player:callService("PetWarehouseService", "getPetInfos", {
		player.uid,
		petIds,
		fields
	}, onResponse, {
		callerId = player.uid,
		timeout = Const.CALL_WAREHOUSE_PET_TIMEOUT,
		hint = player.uid
	})
end

function PetWarehouseGateway:queryPetDetails(petIds, callback, forRecycle)
	local operation = self:_newRequest(PetWarehouseConst.ACTION.SYNC_DETAIL, petIds)

	operation.callback = callback
	operation.forRecycle = forRecycle == true
	operation.infos = {}
	operation.failedIds = {}
	operation.cancelled = false
	operation.player = self.player

	local normalized, reason = PetWarehouseDataAdapter:normalizePetIds(petIds)

	if normalized == nil then
		operation.petIds = {}
		operation.status = PetWarehouseConst.STATE.FAILED
		operation.reason = reason
		operation.finished = true

		if callback then
			callback(operation)
		end

		return operation
	end

	operation.petIds = normalized

	local batchLimit = Const.BATCH_OPERATE_WARE_PET_LIMIT

	if forRecycle == true and self.player and self.player.simplifyPets and self.player.simplifyPets.getRecyclePetAttrs then
		batchLimit = Const.RECYCLE_PET_BATCH_SIZE
	end

	operation.batches = PetWarehouseDataAdapter:chunkPetIds(normalized, batchLimit)
	operation.detailSendInterval = self:_readDetailSendInterval()
	operation.status = PetWarehouseConst.STATE.WAITING_SERVER

	self:_queryPetDetailsBatch(operation, 1)

	return operation
end

function PetWarehouseGateway:_schedulePetDetailsBatch(operation, batchIndex)
	if operation.finished then
		return
	end

	self:_clearDetailTimer(operation)

	local delay = 0
	local interval = operation.detailSendInterval or 0

	if interval > 0 and operation.lastDetailSendAt ~= nil then
		delay = interval - (Time.getTickSecond() - operation.lastDetailSendAt)

		if delay < 0 then
			delay = 0
		end
	end

	if delay <= 0 then
		self:_queryPetDetailsBatch(operation, batchIndex)

		return
	end

	operation.detailTimer = TimerManager.addTimer(delay, function()
		operation.detailTimer = nil

		if operation.finished then
			return
		end

		self:_queryPetDetailsBatch(operation, batchIndex)
	end)
end

function PetWarehouseGateway:cancelPetDetails(operation)
	if operation == nil or operation.finished then
		return
	end

	operation.cancelled = true

	if operation.reason == nil then
		operation.reason = PetWarehouseConst.REASON.PLAYER_UNAVAILABLE
	end

	self:_finishPetDetails(operation)
end

function PetWarehouseGateway:moveIn(petIds, targetBoxId, allowOverflow, targetSlot, operationId, batchId)
	local operation = self:_newRequest(PetWarehouseConst.ACTION.MOVE_IN, petIds)

	operation.targetBoxId = targetBoxId
	operation.allowOverflow = allowOverflow == true
	operation.targetSlot = tonumber(targetSlot) or 0
	operation.operationId = tonumber(operationId) or 0
	operation.batchId = tonumber(batchId) or 0

	self:_sendPlayerMessage("RPC_CS_WarehouseBoxMoveIn", operation, petIds, tonumber(targetBoxId) or 0, operation.allowOverflow, operation.targetSlot, operation.operationId, operation.batchId)

	return operation
end

function PetWarehouseGateway:moveOut(petIds, targetBoxId, targetSlot, operationId, batchId)
	local operation = self:_newRequest(PetWarehouseConst.ACTION.MOVE_OUT, petIds)

	operation.targetBoxId = tonumber(targetBoxId) or 0
	operation.targetSlot = tonumber(targetSlot) or 0
	operation.operationId = tonumber(operationId) or 0
	operation.batchId = tonumber(batchId) or 0

	self:_sendPlayerMessage("RPC_CS_WarehouseBoxMoveOut", operation, petIds, operation.targetBoxId, operation.targetSlot, operation.operationId, operation.batchId)

	return operation
end

function PetWarehouseGateway:renameBox(boxId, newName)
	local operation = self:_newRequest(PetWarehouseConst.ACTION.RENAME_BOX, nil)

	operation.boxId = boxId
	operation.newName = newName

	self:_sendPlayerMessage("RPC_CS_PetBoxRename", operation, boxId, newName, PetWarehouseConst.BOX_TYPE_BY_DOMAIN[PetWarehouseConst.DOMAIN.WAREHOUSE])

	return operation
end

function PetWarehouseGateway:setBoxLocked(boxId, locked)
	local operation = self:_newRequest(PetWarehouseConst.ACTION.SWITCH_BOX_LOCK, nil)

	operation.boxId = boxId
	operation.locked = locked

	self:_sendPlayerMessage("RPC_CS_PetBoxSwitchLocked", operation, boxId, locked, PetWarehouseConst.BOX_TYPE_BY_DOMAIN[PetWarehouseConst.DOMAIN.WAREHOUSE])

	return operation
end

function PetWarehouseGateway:unlockBox(boxId)
	local operation = self:_newRequest(PetWarehouseConst.ACTION.UNLOCK_BOX, nil)

	operation.boxId = boxId

	self:_sendPlayerMessage("RPC_CS_WarehouseBoxUnlock", operation)

	return operation
end

function PetWarehouseGateway:clear(reason)
	self.player = nil
	self.clearReason = reason
end

function PetWarehouseGateway:dispose()
	self:clear("disposed")
end

return PetWarehouseGateway
