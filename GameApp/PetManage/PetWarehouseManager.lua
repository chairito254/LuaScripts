-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetWarehouseManager.lua

local Class = require("Core.Framework.Class")
local LoggerManager = require("Core.Log.LoggerManager")
local Time = require("Core.Common.Time")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetWarehouseDataAdapter = require("GameApp.PetManage.PetWarehouseDataAdapter")
local PetWarehouseOperationCoordinator = require("GameApp.PetManage.PetWarehouseOperationCoordinator")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local logger = LoggerManager.getLogger("PetWarehouseManager")
local PetWarehouseManager = Class.LightClass("PetWarehouseManager")

function PetWarehouseManager:ctor(gateway)
	self.gateway = gateway
	self.coordinator = PetWarehouseOperationCoordinator(self, gateway)
	self.listeners = {}
	self.player = nil
	self.snapshot = PetWarehouseDataAdapter:buildSnapshot(nil)
	self.revision = 0
end

function PetWarehouseManager:subscribe(listener)
	if type(listener) ~= "function" then
		return nil
	end

	self.listeners[#self.listeners + 1] = listener

	return listener
end

function PetWarehouseManager:unsubscribe(listener)
	for index = #self.listeners, 1, -1 do
		if self.listeners[index] == listener then
			table.remove(self.listeners, index)
		end
	end
end

function PetWarehouseManager:_hasListener(listener)
	for index = 1, #self.listeners do
		if self.listeners[index] == listener then
			return true
		end
	end

	return false
end

function PetWarehouseManager:_notify(reason)
	local count = #self.listeners

	if count == 0 then
		return
	end

	local payload = {
		reason = reason,
		revision = self.revision,
		snapshot = self.snapshot
	}
	local dispatchList = {}

	for index = 1, count do
		dispatchList[index] = self.listeners[index]
	end

	for index = 1, count do
		local listener = dispatchList[index]

		if self:_hasListener(listener) then
			listener(payload)
		end
	end
end

function PetWarehouseManager:onPlayerInit(player)
	if self.player == player then
		self:refresh("playerInit")

		return
	end

	self.player = player

	self.gateway:bindPlayer(player)
	self.coordinator:clear("playerReplaced")
	self:refresh("playerInit")
end

function PetWarehouseManager:onPlayerDestroy(player)
	if player ~= nil and player ~= self.player then
		return
	end

	self.coordinator:clear("playerDestroyed")
	self.gateway:unbindPlayer(player)

	self.player = nil
	self.snapshot = PetWarehouseDataAdapter:buildSnapshot(nil)
	self.revision = self.revision + 1

	self:_notify("playerDestroyed")
end

local function isSnapshotSessionCurrent(manager, player)
	return manager.player == player
end

function PetWarehouseManager:refresh(reason)
	reason = reason or "refresh"

	if self.refreshingSnapshot then
		self.pendingRefreshReason = reason

		return
	end

	self.refreshingSnapshot = true

	repeat
		self.pendingRefreshReason = nil

		local player = self.player
		local snapshot = PetWarehouseDataAdapter:buildSnapshot(player)

		if isSnapshotSessionCurrent(self, player) and isSnapshotSessionCurrent(self, player) and self.pendingRefreshReason == nil then
			local previous = self.snapshot

			self.snapshot = snapshot
			self.revision = self.revision + 1
			snapshot.revision = self.revision
			self.refreshingSnapshot = false

			self:_clearMovedInPetNewRedDots(previous, snapshot)
			self.coordinator:onSnapshot(snapshot)
			self:_notify(reason)
		end

		reason = self.pendingRefreshReason
	until reason == nil

	self.refreshingSnapshot = false
end

function PetWarehouseManager:_clearMovedInPetNewRedDots(previous, current)
	local player = self.player

	if player == nil or player.deletePetRedDotRecords == nil then
		return
	end

	local petIds = PetWarehouseDataAdapter:collectMovedInPetIds(previous, current)

	if not Utils.isTable(petIds) or #petIds == 0 then
		return
	end

	player:deletePetRedDotRecords(Const.CLIENT_KEY.PET_NEW_RED_DOT, petIds)
end

function PetWarehouseManager:onPlayerDataChanged(reason)
	self:refresh(reason or "playerDataChanged")
end

function PetWarehouseManager:getSnapshot()
	return self.snapshot
end

function PetWarehouseManager:getPlayer()
	return self.player
end

function PetWarehouseManager:getRevision()
	return self.revision
end

function PetWarehouseManager:getPetSummary(petId)
	return self.snapshot.summaries[petId]
end

function PetWarehouseManager:getPetDomain(petId)
	return PetWarehouseDataAdapter:getDomain(self.snapshot, petId)
end

function PetWarehouseManager:getTotalPetCount()
	local count = 0

	for _, box in ipairs(self.snapshot.boxes or {}) do
		count = count + math.max(tonumber(box.count) or 0, 0)
	end

	return count
end

function PetWarehouseManager:requestPetDetails(petIds, callback, forRecycle)
	if self.player == nil or self.player.destroyed then
		local operation = {
			cancelled = true,
			status = PetWarehouseConst.STATE.FAILED,
			reason = PetWarehouseConst.REASON.PLAYER_UNAVAILABLE,
			infos = {},
			failedIds = {}
		}

		if callback then
			callback(operation)
		end

		return operation
	end

	return self.gateway:queryPetDetails(petIds, callback, forRecycle)
end

function PetWarehouseManager:ensurePetDetails(petIds, callback, forRecycle)
	return self:requestPetDetails(petIds, callback, forRecycle)
end

function PetWarehouseManager:getPetInfo(petId, sourcePetInfo)
	return PetWarehouseDataAdapter:getFullInfo(self.player, petId, sourcePetInfo)
end

function PetWarehouseManager:_startPetOperation(action, petIds, options)
	local coordinator = self.coordinator
	local operation, reason = coordinator:start(action, petIds, options, true)

	if not operation or coordinator.activeOperation ~= operation then
		return operation, reason
	end

	local waiting = pg.game and pg.game.commonWaiting

	if not waiting then
		coordinator:stop(operation, PetWarehouseConst.REASON.TRANSPORT_ERROR)

		return operation
	end

	operation.waitingSystem = waiting

	local handle = waiting:openUntilClosed(nil, function(readyHandle)
		if coordinator.activeOperation == operation and operation.waitingHandle == readyHandle and waiting:isReady(readyHandle) then
			coordinator:startSending(operation)
		end
	end, function()
		coordinator:stop(operation, PetWarehouseConst.REASON.TRANSPORT_ERROR)
	end)

	if coordinator.activeOperation ~= operation then
		if handle then
			waiting:close(handle, "operationFinished")
		end

		return operation
	end

	operation.waitingHandle = handle

	if not handle then
		coordinator:stop(operation, PetWarehouseConst.REASON.TRANSPORT_ERROR)
	end

	return operation
end

function PetWarehouseManager:startTransfer(action, petIds, options)
	return self:_startPetOperation(action, petIds, options)
end

function PetWarehouseManager:startBoxAction(action, boxId, value)
	return self.coordinator:startBoxAction(action, boxId, value)
end

function PetWarehouseManager:renameBox(boxId, newName)
	return self.coordinator:startBoxAction(PetWarehouseConst.ACTION.RENAME_BOX, boxId, newName)
end

function PetWarehouseManager:setWarehouseBoxLocked(boxId, locked)
	return self.coordinator:startBoxAction(PetWarehouseConst.ACTION.SWITCH_BOX_LOCK, boxId, locked)
end

function PetWarehouseManager:unlockWarehouseBox(boxId)
	return self.coordinator:startBoxAction(PetWarehouseConst.ACTION.UNLOCK_BOX, boxId)
end

function PetWarehouseManager:getBox(domain, boxId)
	return PetWarehouseDataAdapter:getBox(self.snapshot, domain, boxId)
end

function PetWarehouseManager:getWarehouseBoxes()
	return PetWarehouseDataAdapter:collectVisibleWarehouseBoxes(self.snapshot)
end

function PetWarehouseManager:subscribeOperation(listener)
	return self.coordinator:subscribe(listener)
end

function PetWarehouseManager:unsubscribeOperation(listener)
	self.coordinator:unsubscribe(listener)
end

function PetWarehouseManager:reconcile()
	self:refresh("reconcile")
	self.coordinator:reconcile(self.snapshot)
end

function PetWarehouseManager:tick()
	self.coordinator:tick(Time.secondCache)
end

function PetWarehouseManager:clear(reason)
	local hadPlayer = self.player ~= nil

	self.coordinator:clear(reason or "clear")
	self.gateway:unbindPlayer(self.player)

	self.player = nil

	if not hadPlayer then
		return
	end

	self.snapshot = PetWarehouseDataAdapter:buildSnapshot(nil)
	self.revision = self.revision + 1

	self:_notify(reason or "clear")
end

function PetWarehouseManager:destroy()
	self:clear("destroy")

	self.listeners = {}
	self.gateway = nil
	self.coordinator = nil

	logger:debug("warehouse manager destroyed")
end

return PetWarehouseManager
