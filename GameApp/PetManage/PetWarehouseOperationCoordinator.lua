-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetWarehouseOperationCoordinator.lua

local Class = require("Core.Framework.Class")
local LoggerManager = require("Core.Log.LoggerManager")
local Time = require("Core.Common.Time")
local lume = require("Core.Common.lume")
local Utils = require("Common.Utils.Utils")
local NoticeDef = require("Common.NoticeDef")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetWarehouseDataAdapter = require("GameApp.PetManage.PetWarehouseDataAdapter")
local Const = require("Common.Const.Const")
local logger = LoggerManager.getLogger("PetWarehouseOperationCoordinator")
local PetWarehouseOperationCoordinator = Class.LightClass("PetWarehouseOperationCoordinator")

PetWarehouseOperationCoordinator.TARGET_DOMAIN = {
	[PetWarehouseConst.ACTION.MOVE_IN] = PetWarehouseConst.DOMAIN.WAREHOUSE,
	[PetWarehouseConst.ACTION.MOVE_OUT] = PetWarehouseConst.DOMAIN.BAG
}
PetWarehouseOperationCoordinator.TARGET_MAP_FIELD = {
	[PetWarehouseConst.ACTION.MOVE_IN] = "warehousePetBoxMap",
	[PetWarehouseConst.ACTION.MOVE_OUT] = "petBoxMap"
}
PetWarehouseOperationCoordinator.BOX_TARGET_FIELD = {
	[PetWarehouseConst.ACTION.RENAME_BOX] = "warehousePetBoxMap",
	[PetWarehouseConst.ACTION.SWITCH_BOX_LOCK] = "warehousePetBoxMap",
	[PetWarehouseConst.ACTION.UNLOCK_BOX] = "warehousePetBoxMap"
}
PetWarehouseOperationCoordinator.PENDING_STATE = {
	[PetWarehouseConst.STATE.VALIDATING] = true,
	[PetWarehouseConst.STATE.REQUESTING] = true,
	[PetWarehouseConst.STATE.WAITING_SERVER] = true,
	[PetWarehouseConst.STATE.APPLYING_RESULT] = true
}

function PetWarehouseOperationCoordinator:ctor(manager, gateway)
	self.manager = manager
	self.gateway = gateway
	self.activeOperation = nil
	self.operationSequence = 0
	self.listeners = {}
	self.applying = false
	self.pendingSnapshot = nil
	self.transferOperations = {}
	self.pendingBoxOperations = {}
end

function PetWarehouseOperationCoordinator:subscribe(listener)
	if type(listener) ~= "function" then
		return nil
	end

	self.listeners[#self.listeners + 1] = listener

	return listener
end

function PetWarehouseOperationCoordinator:unsubscribe(listener)
	for index = #self.listeners, 1, -1 do
		if self.listeners[index] == listener then
			table.remove(self.listeners, index)
		end
	end
end

function PetWarehouseOperationCoordinator:_hasListener(listener)
	for index = 1, #self.listeners do
		if self.listeners[index] == listener then
			return true
		end
	end

	return false
end

function PetWarehouseOperationCoordinator:_notify(operation)
	local count = #self.listeners

	if count == 0 then
		return
	end

	local dispatchList = {}

	for index = 1, count do
		dispatchList[index] = self.listeners[index]
	end

	for index = 1, count do
		local listener = dispatchList[index]

		if self:_hasListener(listener) then
			listener(operation)
		end
	end
end

function PetWarehouseOperationCoordinator:_setState(operation, state, reason)
	operation.status = state
	operation.reason = reason

	self:_notify(operation)
end

function PetWarehouseOperationCoordinator:_getPetBlockReason(petId)
	if self.activeOperation and self.activeOperation.pendingIds[petId] == true then
		return PetWarehouseConst.REASON.BUSY
	end

	self:_pruneTransferOperations(Time.secondCache)

	for _, operation in pairs(self.transferOperations) do
		if operation.timedOut and operation.pendingIds[petId] then
			return PetWarehouseConst.REASON.LATE_RESULT_PENDING
		end
	end

	return nil
end

function PetWarehouseOperationCoordinator:_pruneTransferOperations(now)
	for operationId, operation in pairs(self.transferOperations) do
		if operation.lateResultUntil and now >= operation.lateResultUntil then
			self.transferOperations[operationId] = nil
		end
	end
end

function PetWarehouseOperationCoordinator:_getTransferFinalState(operation)
	if next(operation.pendingIds) ~= nil then
		if next(operation.completedIds) ~= nil then
			return PetWarehouseConst.STATE.PARTIALLY_SUCCEEDED
		end

		return PetWarehouseConst.STATE.UNKNOWN
	end

	if next(operation.completedIds) ~= nil then
		if next(operation.failedIds) ~= nil or next(operation.unsentIds) ~= nil then
			return PetWarehouseConst.STATE.PARTIALLY_SUCCEEDED
		end

		return PetWarehouseConst.STATE.SUCCEEDED
	end

	if next(operation.failedIds) ~= nil then
		return PetWarehouseConst.STATE.FAILED
	end

	return PetWarehouseConst.STATE.UNKNOWN
end

function PetWarehouseOperationCoordinator:_finishTransfer(operation, reason)
	if self.transferOperations[operation.operationId] ~= operation then
		return
	end

	self.transferOperations[operation.operationId] = nil

	if self.activeOperation == operation then
		self.activeOperation = nil
	end

	self:_closeWaiting(operation)
	self:_setState(operation, self:_getTransferFinalState(operation), reason)
end

function PetWarehouseOperationCoordinator:_stopTransfer(operation, now, reason)
	operation.timedOut = true
	operation.lateResultUntil = now + PetWarehouseConst.DEFAULT_LATE_RESULT_RETENTION_SECONDS

	for petId in pairs(operation.pendingIds) do
		if not operation.sentIds[petId] then
			operation.pendingIds[petId] = nil
			operation.unsentIds[petId] = reason
		end
	end

	if self.activeOperation == operation then
		self.activeOperation = nil
	end

	if next(operation.pendingIds) == nil then
		self.transferOperations[operation.operationId] = nil
	end

	self:_closeWaiting(operation)
	self:_setState(operation, self:_getTransferFinalState(operation), reason)
end

function PetWarehouseOperationCoordinator:_advanceTransferInner(operation, notifyProgress)
	if operation.timedOut then
		if next(operation.pendingIds) == nil then
			self:_finishTransfer(operation, PetWarehouseConst.REASON.LATE_RESULT_RESOLVED)
		elseif notifyProgress then
			self:_setState(operation, self:_getTransferFinalState(operation), operation.reason)
		end

		return
	end

	if self.activeOperation ~= operation then
		return
	end

	local batch = operation.sentBatches[operation.batchIndex]

	if not batch or batch.sending then
		return
	end

	local settled = batch.resultReceived == true

	for petId in pairs(batch.ids) do
		if operation.pendingIds[petId] then
			settled = false

			break
		end
	end

	if not settled then
		if notifyProgress then
			self:_notify(operation)
		end

		return
	end

	operation.batchIndex = operation.batchIndex + 1

	if operation.batchIndex <= #operation.batches then
		self:_sendTransferBatch(operation)

		return
	end

	self:_finishTransfer(operation, operation.failureReason)
end

function PetWarehouseOperationCoordinator:_advanceTransfer(operation, notifyProgress)
	if self.transferOperations[operation.operationId] ~= operation then
		return
	end

	operation.notifyProgress = operation.notifyProgress or notifyProgress
	operation.advanceRequested = true

	if operation.advancing then
		return
	end

	operation.advancing = true

	repeat
		operation.advanceRequested = false

		local shouldNotify = operation.notifyProgress

		operation.notifyProgress = false

		self:_advanceTransferInner(operation, shouldNotify)
	until not operation.advanceRequested or self.transferOperations[operation.operationId] ~= operation

	operation.advancing = false
end

function PetWarehouseOperationCoordinator:_applyTransferSnapshot(operation, snapshot, notifyProgress)
	if self.transferOperations[operation.operationId] ~= operation then
		return
	end

	for petId in pairs(operation.sentIds) do
		if operation.pendingIds[petId] then
			local domain = PetWarehouseDataAdapter:getDomain(snapshot, petId)

			if domain == self.TARGET_DOMAIN[operation.action] then
				operation.observedTargetIds[petId] = true
			end

			if operation.successfulIds[petId] and operation.observedTargetIds[petId] then
				operation.pendingIds[petId] = nil
				operation.completedIds[petId] = true
				notifyProgress = true
			end
		end
	end

	self:_advanceTransfer(operation, notifyProgress)
end

function PetWarehouseOperationCoordinator:_reconcileTransferOperations(snapshot)
	self:_pruneTransferOperations(Time.secondCache)

	local operations = {}

	for _, operation in pairs(self.transferOperations) do
		if operation.timedOut then
			operations[#operations + 1] = operation
		end
	end

	for _, operation in ipairs(operations) do
		self:_applyTransferSnapshot(operation, snapshot)
	end
end

function PetWarehouseOperationCoordinator:_validate(action, petIds, options)
	local normalized, reason = PetWarehouseDataAdapter:normalizePetIds(petIds)

	if not normalized then
		return nil, reason
	end

	if not self.TARGET_DOMAIN[action] then
		return nil, PetWarehouseConst.REASON.ACTION_NOT_SUPPORTED
	end

	local player = self.manager:getPlayer()

	if not player or player.destroyed then
		return nil, PetWarehouseConst.REASON.PLAYER_UNAVAILABLE
	end

	local snapshot = self.manager:getSnapshot()
	local accepted = {}

	for _, petId in ipairs(normalized) do
		local skip = false
		local blockReason = self:_getPetBlockReason(petId)

		if blockReason then
			return nil, blockReason
		end

		local domain = PetWarehouseDataAdapter:getDomain(snapshot, petId)

		if action == PetWarehouseConst.ACTION.MOVE_IN and domain ~= PetWarehouseConst.DOMAIN.BAG then
			return nil, PetWarehouseConst.REASON.DOMAIN_CONFLICT
		end

		if action == PetWarehouseConst.ACTION.MOVE_IN and (lume.find(player.petPrepareList, petId) ~= nil or lume.find(player.petExploreList, petId) ~= nil) then
			skip = true
		end

		if not skip and action == PetWarehouseConst.ACTION.MOVE_OUT and domain ~= PetWarehouseConst.DOMAIN.WAREHOUSE then
			return nil, PetWarehouseConst.REASON.DOMAIN_CONFLICT
		end

		if not skip and action == PetWarehouseConst.ACTION.MOVE_OUT then
			local location = snapshot.locations[petId]
			local box = PetWarehouseDataAdapter:getWarehouseBox(snapshot, location.boxId)

			if not box then
				return nil, PetWarehouseConst.REASON.BOX_NOT_FOUND
			end
		end

		if not skip then
			accepted[#accepted + 1] = petId
		end
	end

	if #accepted == 0 then
		if action == PetWarehouseConst.ACTION.MOVE_IN then
			return nil, PetWarehouseConst.REASON.IN_FORMATION
		end

		return nil, PetWarehouseConst.REASON.EMPTY_IDS
	end

	normalized = accepted

	local targetMapField = self.TARGET_MAP_FIELD[action]

	if targetMapField then
		local emptySlot

		if action == PetWarehouseConst.ACTION.MOVE_OUT then
			emptySlot = PetWarehouseDataAdapter:getValidEmptySlot(player[targetMapField])
		else
			emptySlot = PetWarehouseDataAdapter:getManualWritableEmptySlot(player[targetMapField])
		end

		if emptySlot < #normalized then
			local fitted = {}

			for i = 1, emptySlot do
				fitted[i] = normalized[i]
			end

			if #fitted == 0 then
				return nil, PetWarehouseConst.REASON.TARGET_FULL
			end

			normalized = fitted
		end
	end

	return normalized
end

function PetWarehouseOperationCoordinator:_sendTransferBatch(operation)
	if self.activeOperation ~= operation or operation.timedOut then
		return
	end

	local batchId = operation.batchIndex
	local petIds = operation.batches[batchId]

	if not petIds then
		self:_finishTransfer(operation, operation.failureReason)

		return
	end

	if operation.waitingSystem and not operation.waitingSystem:isReady(operation.waitingHandle) then
		self:_stopTransfer(operation, Time.secondCache, PetWarehouseConst.REASON.TRANSPORT_ERROR)

		return
	end

	if operation.action ~= PetWarehouseConst.ACTION.MOVE_IN and operation.action ~= PetWarehouseConst.ACTION.MOVE_OUT then
		self:_stopTransfer(operation, Time.secondCache, PetWarehouseConst.REASON.TRANSPORT_ERROR)

		return
	end

	local batch = {
		sending = true,
		resultReceived = false,
		ids = {}
	}

	operation.sentBatches[batchId] = batch
	operation.currentBatchIds = batch.ids

	for _, petId in ipairs(petIds) do
		batch.ids[petId] = true
		operation.sentIds[petId] = true
	end

	operation.sentAt = Time.secondCache
	operation.status = PetWarehouseConst.STATE.REQUESTING

	local gatewayOperation

	if operation.action == PetWarehouseConst.ACTION.MOVE_IN then
		gatewayOperation = self.gateway:moveIn(petIds, operation.targetBoxId, operation.allowOverflow, operation.targetSlot, operation.operationId, batchId)
	else
		gatewayOperation = self.gateway:moveOut(petIds, operation.targetBoxId, operation.targetSlot, operation.operationId, batchId)
	end

	batch.sending = false

	if self.activeOperation ~= operation or self.transferOperations[operation.operationId] ~= operation then
		return
	end

	operation.gatewayOperation = gatewayOperation

	if batch.resultReceived or gatewayOperation and gatewayOperation.status == PetWarehouseConst.STATE.WAITING_SERVER then
		operation.status = PetWarehouseConst.STATE.WAITING_SERVER

		self:_applyTransferSnapshot(operation, self.manager:getSnapshot(), true)

		return
	end

	local reason = gatewayOperation and gatewayOperation.reason or PetWarehouseConst.REASON.TRANSPORT_ERROR

	if reason == PetWarehouseConst.REASON.PLAYER_UNAVAILABLE then
		operation.sentBatches[batchId] = nil
		operation.currentBatchIds = {}

		for petId in pairs(batch.ids) do
			operation.sentIds[petId] = nil
		end
	end

	self:_stopTransfer(operation, Time.secondCache, reason)
end

function PetWarehouseOperationCoordinator:_closeWaiting(operation)
	local waiting = operation.waitingSystem
	local handle = operation.waitingHandle

	operation.waitingSystem = nil

	if waiting and handle then
		waiting:close(handle, "operationFinished")
	end
end

function PetWarehouseOperationCoordinator:startSending(operation)
	if self.activeOperation ~= operation or operation.timedOut or operation.sentAt then
		return false
	end

	operation.waitingForReady = false

	self:_sendTransferBatch(operation)

	return true
end

function PetWarehouseOperationCoordinator:stop(operation, reason)
	if self.activeOperation ~= operation or not operation.isTransfer then
		return false
	end

	self:_stopTransfer(operation, Time.secondCache, reason or PetWarehouseConst.REASON.TRANSPORT_ERROR)

	return true
end

function PetWarehouseOperationCoordinator:start(action, petIds, options, deferStart)
	if self.activeOperation then
		return nil, PetWarehouseConst.REASON.BUSY
	end

	local normalized, reason = self:_validate(action, petIds, options)

	if not normalized then
		return nil, reason
	end

	self.operationSequence = self.operationSequence + 1

	local batchLimit = Const.BATCH_OPERATE_WARE_PET_LIMIT
	local operation = {
		isTransfer = true,
		batchIndex = 1,
		operationId = self.operationSequence,
		action = action,
		petIds = normalized,
		pendingIds = {},
		completedIds = {},
		failedIds = {},
		batches = PetWarehouseDataAdapter:chunkPetIds(normalized, batchLimit),
		batchLimit = batchLimit,
		status = PetWarehouseConst.STATE.VALIDATING,
		startedAt = Time.secondCache,
		timeoutSeconds = PetWarehouseConst.DEFAULT_TIMEOUT_SECONDS,
		targetBoxId = options and options.targetBoxId,
		allowOverflow = options and options.allowOverflow == true,
		targetSlot = options and options.targetSlot,
		waitingForReady = deferStart == true,
		sentBatches = {},
		sentIds = {},
		successfulIds = {},
		observedTargetIds = {},
		unsentIds = {}
	}

	for _, petId in ipairs(normalized) do
		operation.pendingIds[petId] = true
	end

	self.transferOperations[operation.operationId] = operation
	self.activeOperation = operation

	self:_notify(operation)

	if not deferStart then
		self:startSending(operation)
	end

	return operation
end

function PetWarehouseOperationCoordinator:_validateBoxAction(action, boxId, value)
	if not PetWarehouseConst.BOX_ACTION[action] then
		return nil, PetWarehouseConst.REASON.ACTION_NOT_SUPPORTED
	end

	if PetWarehouseConst.NOT_IMPLEMENTED_ACTION[action] then
		return nil, PetWarehouseConst.REASON.ACTION_NOT_SUPPORTED
	end

	if not self.BOX_TARGET_FIELD[action] then
		return nil, PetWarehouseConst.REASON.ACTION_NOT_SUPPORTED
	end

	local player = self.manager:getPlayer()

	if not player or player.destroyed then
		return nil, PetWarehouseConst.REASON.PLAYER_UNAVAILABLE
	end

	if type(boxId) ~= "number" or boxId ~= boxId or boxId <= 0 then
		return nil, PetWarehouseConst.REASON.BOX_NOT_FOUND
	end

	local snapshot = self.manager:getSnapshot()
	local box = PetWarehouseDataAdapter:getWarehouseBox(snapshot, boxId)

	if not box then
		return nil, PetWarehouseConst.REASON.BOX_NOT_FOUND
	end

	if action == PetWarehouseConst.ACTION.RENAME_BOX then
		if type(value) ~= "string" or value == "" then
			return nil, PetWarehouseConst.REASON.INVALID_BOX_ARGUMENT
		end

		if value == box.customName then
			return nil, PetWarehouseConst.REASON.BOX_STATE_UNCHANGED
		end
	elseif action == PetWarehouseConst.ACTION.SWITCH_BOX_LOCK then
		if type(value) ~= "boolean" then
			return nil, PetWarehouseConst.REASON.INVALID_BOX_ARGUMENT
		end

		if value == box.locked then
			return nil, PetWarehouseConst.REASON.BOX_STATE_UNCHANGED
		end
	elseif action == PetWarehouseConst.ACTION.UNLOCK_BOX then
		if box.needUnlock ~= true then
			return nil, PetWarehouseConst.REASON.INVALID_BOX_ARGUMENT
		end

		if not PetWarehouseDataAdapter:getFirstPayableWarehouseBox(snapshot) then
			return nil, PetWarehouseConst.REASON.NO_NEED_UNLOCK_BOX
		end

		local itemId = PetWarehouseDataAdapter:getNextUnlockCost(player)

		if not itemId then
			return nil, PetWarehouseConst.REASON.UNLOCK_CONFIG_MISSING
		end
	end

	return box
end

function PetWarehouseOperationCoordinator:startBoxAction(action, boxId, value)
	if self.activeOperation then
		return nil, PetWarehouseConst.REASON.BUSY
	end

	local box, reason = self:_validateBoxAction(action, boxId, value)

	if not box then
		return nil, reason
	end

	self.operationSequence = self.operationSequence + 1

	local operation = {
		batchIndex = 1,
		operationId = self.operationSequence,
		action = action,
		boxId = boxId,
		boxKey = box.boxKey,
		boxDomain = box.domain,
		currentName = box.customName,
		currentLocked = box.locked,
		petIds = {},
		pendingIds = {},
		completedIds = {},
		failedIds = {},
		batches = {},
		status = PetWarehouseConst.STATE.VALIDATING,
		startedAt = Time.secondCache,
		timeoutSeconds = PetWarehouseConst.DEFAULT_TIMEOUT_SECONDS
	}

	if action == PetWarehouseConst.ACTION.RENAME_BOX then
		operation.newName = value
	elseif action == PetWarehouseConst.ACTION.SWITCH_BOX_LOCK then
		operation.locked = value
	elseif action == PetWarehouseConst.ACTION.UNLOCK_BOX then
		local first = PetWarehouseDataAdapter:getFirstPayableWarehouseBox(self.manager:getSnapshot())

		operation.unlockBoxId = first and first.id or boxId
	end

	self.activeOperation = operation

	self:_notify(operation)
	self:_sendBoxAction(operation)

	return operation
end

function PetWarehouseOperationCoordinator:_sendBoxAction(operation)
	operation.sentAt = Time.secondCache
	operation.status = PetWarehouseConst.STATE.REQUESTING

	local gatewayOperation

	if operation.action == PetWarehouseConst.ACTION.RENAME_BOX then
		gatewayOperation = self.gateway:renameBox(operation.boxId, operation.newName)
	elseif operation.action == PetWarehouseConst.ACTION.UNLOCK_BOX then
		gatewayOperation = self.gateway:unlockBox(operation.unlockBoxId or operation.boxId)
	else
		gatewayOperation = self.gateway:setBoxLocked(operation.boxId, operation.locked)
	end

	operation.gatewayOperation = gatewayOperation

	if gatewayOperation and gatewayOperation.status == PetWarehouseConst.STATE.WAITING_SERVER then
		self:_setState(operation, PetWarehouseConst.STATE.WAITING_SERVER)

		return
	end

	local reason = gatewayOperation and gatewayOperation.reason or PetWarehouseConst.REASON.TRANSPORT_ERROR

	self:_setState(operation, PetWarehouseConst.STATE.FAILED, reason)

	self.activeOperation = nil
end

function PetWarehouseOperationCoordinator:_isBoxApplied(operation, snapshot)
	local box = PetWarehouseDataAdapter:getWarehouseBox(snapshot, operation.boxId)

	if not box then
		return false
	end

	if operation.action == PetWarehouseConst.ACTION.RENAME_BOX then
		return box.customName == operation.newName
	end

	if operation.action == PetWarehouseConst.ACTION.UNLOCK_BOX then
		local unlocked = PetWarehouseDataAdapter:getWarehouseBox(snapshot, operation.unlockBoxId or operation.boxId)

		return unlocked ~= nil and unlocked.needUnlock ~= true
	end

	return box.locked == operation.locked
end

function PetWarehouseOperationCoordinator:_pruneBoxOperations(now)
	for boxKey, pending in pairs(self.pendingBoxOperations) do
		if now >= pending.expiresAt then
			self.pendingBoxOperations[boxKey] = nil
		end
	end
end

function PetWarehouseOperationCoordinator:_reconcileBoxOperations(snapshot)
	self:_pruneBoxOperations(Time.secondCache)

	local resolved = {}

	for boxKey, pending in pairs(self.pendingBoxOperations) do
		if self:_isBoxApplied(pending.operation, snapshot) then
			self.pendingBoxOperations[boxKey] = nil
			resolved[#resolved + 1] = pending.operation
		end
	end

	for _, operation in ipairs(resolved) do
		self:_setState(operation, PetWarehouseConst.STATE.SUCCEEDED, PetWarehouseConst.REASON.LATE_RESULT_RESOLVED)
	end
end

function PetWarehouseOperationCoordinator:_applySnapshotInner(operation, snapshot)
	if not self.activeOperation or self.activeOperation.operationId ~= operation.operationId then
		return
	end

	if operation.isTransfer then
		self:_applyTransferSnapshot(operation, snapshot)

		return
	end

	if operation.status ~= PetWarehouseConst.STATE.WAITING_SERVER then
		return
	end

	if operation.boxId ~= nil then
		if self:_isBoxApplied(operation, snapshot) then
			operation.completedIds[operation.boxKey] = true
			operation.status = PetWarehouseConst.STATE.APPLYING_RESULT

			self:_setState(operation, PetWarehouseConst.STATE.SUCCEEDED)

			self.activeOperation = nil
		end

		return
	end
end

function PetWarehouseOperationCoordinator:_applySnapshot(operation, snapshot)
	if self.applying then
		self.pendingSnapshot = snapshot

		return
	end

	self.applying = true

	self:_applySnapshotInner(operation, snapshot)

	self.applying = false

	local pendingSnapshot = self.pendingSnapshot

	self.pendingSnapshot = nil

	if pendingSnapshot ~= nil and self.activeOperation ~= nil then
		self:_applySnapshot(self.activeOperation, pendingSnapshot)
	end
end

function PetWarehouseOperationCoordinator:_onTransferResult(action, operationId, batchId, status, operatedPetIds, reasonNoticeId)
	if type(operationId) ~= "number" or operationId ~= operationId or operationId <= 0 or operationId % 1 ~= 0 or type(batchId) ~= "number" or batchId ~= batchId or batchId <= 0 or batchId % 1 ~= 0 or type(status) ~= "boolean" then
		return false
	end

	self:_pruneTransferOperations(Time.secondCache)

	local operation = self.transferOperations[operationId]

	if not operation or operation.action ~= action then
		return false
	end

	local batch = operation.sentBatches[batchId]

	if not batch or batch.resultReceived then
		return false
	end

	if operatedPetIds == nil and action == PetWarehouseConst.ACTION.MOVE_IN and status == false then
		operatedPetIds = {}
	end

	if not Utils.isTable(operatedPetIds) then
		return false
	end

	local successfulIds = {}
	local count = 0
	local length = #operatedPetIds

	for index, petId in pairs(operatedPetIds) do
		if type(index) ~= "number" or index % 1 ~= 0 or index < 1 or length < index then
			return false
		end

		local petIdType = type(petId)

		if petIdType ~= "string" and petIdType ~= "number" or petId ~= petId or not batch.ids[petId] or successfulIds[petId] then
			return false
		end

		count = count + 1
		successfulIds[petId] = true
	end

	if count ~= length then
		return false
	end

	local hasPositiveNotice = type(reasonNoticeId) == "number" and reasonNoticeId == reasonNoticeId and reasonNoticeId > 0
	local reason = PetWarehouseConst.REASON.TRANSPORT_ERROR

	if hasPositiveNotice then
		if reasonNoticeId == NoticeDef.PET_MOVETARGET_AREA_NOT_ENOUGHT or reasonNoticeId == NoticeDef.PET_BAG_FULL then
			reason = PetWarehouseConst.REASON.TARGET_FULL
		elseif reasonNoticeId == NoticeDef.PET_WAREHOUSE_BOX_EXPIRED then
			reason = PetWarehouseConst.REASON.BOX_LOCKED
		end
	end

	batch.resultReceived = true
	batch.serviceStatus = status

	local hasFailure = false

	for petId in pairs(batch.ids) do
		if successfulIds[petId] then
			operation.successfulIds[petId] = true
		else
			operation.pendingIds[petId] = nil
			operation.failedIds[petId] = reason
			hasFailure = true
		end
	end

	local noticeToShow

	if hasFailure then
		operation.failureReason = operation.failureReason or reason

		if not operation.failureNoticeShown and hasPositiveNotice then
			operation.failureNoticeShown = true

			local hasStandaloneNotice = false

			if action == PetWarehouseConst.ACTION.MOVE_OUT and reasonNoticeId == NoticeDef.PET_WAREHOUSE_BATCH_MOVE_OUT_LIMIT then
				hasStandaloneNotice = true
			elseif action == PetWarehouseConst.ACTION.MOVE_IN and reasonNoticeId == NoticeDef.PET_WAREHOUSE_BATCH_MOVE_IN_LIMIT then
				hasStandaloneNotice = true
			end

			if self.activeOperation == operation and not operation.timedOut and not hasStandaloneNotice then
				noticeToShow = reasonNoticeId
			end
		end
	end

	self:_applyTransferSnapshot(operation, self.manager:getSnapshot(), true)

	return true, noticeToShow
end

function PetWarehouseOperationCoordinator:onMoveInResult(operationId, batchId, status, reasonNoticeId, operatedPetIds)
	return self:_onTransferResult(PetWarehouseConst.ACTION.MOVE_IN, operationId, batchId, status, operatedPetIds, reasonNoticeId)
end

function PetWarehouseOperationCoordinator:onMoveOutResult(operationId, batchId, status, operatedPetIds, reasonNoticeId)
	return self:_onTransferResult(PetWarehouseConst.ACTION.MOVE_OUT, operationId, batchId, status, operatedPetIds, reasonNoticeId)
end

function PetWarehouseOperationCoordinator:onSnapshot(snapshot)
	self:_reconcileBoxOperations(snapshot)
	self:_reconcileTransferOperations(snapshot)

	if not self.activeOperation then
		self.applying = false
		self.pendingSnapshot = nil

		return
	end

	self:_applySnapshot(self.activeOperation, snapshot)
end

function PetWarehouseOperationCoordinator:reconcile(snapshot)
	self:_reconcileBoxOperations(snapshot)
	self:_reconcileTransferOperations(snapshot)

	if not self.activeOperation then
		return
	end

	if self.activeOperation.status == PetWarehouseConst.STATE.UNKNOWN then
		if self.activeOperation.boxId ~= nil then
			self.pendingBoxOperations[self.activeOperation.boxKey] = {
				operation = self.activeOperation,
				expiresAt = Time.secondCache + PetWarehouseConst.DEFAULT_LATE_RESULT_RETENTION_SECONDS
			}
		end

		self.activeOperation = nil

		return
	end

	self:_applySnapshot(self.activeOperation, snapshot)
end

function PetWarehouseOperationCoordinator:tick(now)
	local currentTime = now or Time.secondCache

	self:_pruneBoxOperations(currentTime)
	self:_pruneTransferOperations(currentTime)

	local operation = self.activeOperation

	if not operation then
		return
	end

	if not self.PENDING_STATE[operation.status] then
		return
	end

	if operation.waitingForReady then
		return
	end

	local elapsedFrom = operation.sentAt or operation.startedAt

	if not elapsedFrom or currentTime - elapsedFrom < operation.timeoutSeconds then
		return
	end

	logger:warn("warehouse operation timeout: operationId=%s action=%s", tostring(operation.operationId), tostring(operation.action))

	if operation.isTransfer then
		self:_stopTransfer(operation, currentTime, PetWarehouseConst.REASON.REQUEST_TIMEOUT)

		return
	end

	if operation.boxId ~= nil then
		self.pendingBoxOperations[operation.boxKey] = {
			operation = operation,
			expiresAt = currentTime + PetWarehouseConst.DEFAULT_LATE_RESULT_RETENTION_SECONDS
		}

		self:_setState(operation, PetWarehouseConst.STATE.UNKNOWN, PetWarehouseConst.REASON.REQUEST_TIMEOUT)

		self.activeOperation = nil

		return
	end
end

function PetWarehouseOperationCoordinator:clear(reason)
	local operation = self.activeOperation

	self.activeOperation = nil
	self.applying = false
	self.pendingSnapshot = nil
	self.transferOperations = {}
	self.pendingBoxOperations = {}

	if operation then
		self:_closeWaiting(operation)
		self:_setState(operation, PetWarehouseConst.STATE.UNKNOWN, reason)
	end
end

return PetWarehouseOperationCoordinator
