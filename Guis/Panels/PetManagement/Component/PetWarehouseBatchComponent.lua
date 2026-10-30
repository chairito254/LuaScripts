-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagement\\Component\\PetWarehouseBatchComponent.lua

local Class = require("Core.Framework.Class")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ItemUtils = require("Common.Utils.ItemUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local Const = require("Common.Const.Const")
local UIConst = require("Const.UIConst")
local PetWarehouseBatchComponent = Class.LightClass("PetWarehouseBatchComponent")

function PetWarehouseBatchComponent:ctor(owner)
	self.owner = owner
	self.active = false
	self.selected = {}
	self.selectionOrder = 0
end

function PetWarehouseBatchComponent:bind()
	local refs = self.owner.objectReference

	self.panel = self.owner.transform:GetComponent("UComponent")
	self.enterButton = refs:GetRefValue("btnRelease2UButton")
	self.closeButton = refs:GetRefValue("btnClose2UButton")
	self.moveButton = refs:GetRefValue("moveBtn2UButton")
	self.releaseButton = refs:GetRefValue("releasingBtn2UButton")
	self.selectButton = refs:GetRefValue("selectNumberUButton")

	local function bindClick(button, callback)
		if NotNil(button) then
			button.luaClick = callback
		end
	end

	bindClick(self.enterButton, function()
		self:enter()
	end)
	bindClick(self.closeButton, function()
		self:leave()
		self.owner:refreshWarehouse()
	end)
	bindClick(self.moveButton, function()
		self:moveOut()
	end)
	bindClick(self.releaseButton, function()
		self:release()
	end)
	bindClick(self.selectButton, function()
		self:toggleFirst()
	end)
	self:refreshUI()
end

function PetWarehouseBatchComponent:isCurrent()
	return self.active and not self.owner._destroyed and self.owner._visible and self.owner.manager == self.manager and self.manager:getPlayer() == self.player and self.player ~= nil and not self.player.destroyed
end

function PetWarehouseBatchComponent:isBusy()
	return self.request ~= nil or self.operation ~= nil
end

function PetWarehouseBatchComponent:setLeftControlsHidden(hidden)
	local view = self.owner.ctrl.view

	if not view then
		return
	end

	for _, key in ipairs({
		"btnReleaseUButton",
		"btnFilterUButton",
		"btnFilter1UButton",
		"btnCleanFilterUButton",
		"btnBoxUButton",
		"btnBox2UButton"
	}) do
		local button = view[key]

		if NotNil(button) then
			button:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, hidden)
		end
	end

	if not hidden then
		local boxPets = self.owner.ctrl.boxPets

		if boxPets and boxPets.refreshHomeSelectorState then
			boxPets:refreshHomeSelectorState()
		end
	end
end

function PetWarehouseBatchComponent:enter()
	if self.active or not self.owner._visible or self.owner._destroyed then
		return
	end

	local ctrl = self.owner.ctrl

	if ctrl.isDragging or ctrl.onMoveDisplay then
		return
	end

	if ctrl.boxPets and ctrl.boxPets:isManagementForbidden() then
		return
	end

	self.manager = self.owner.manager
	self.player = self.manager and self.manager:getPlayer()

	if not self.player then
		return
	end

	if ctrl.inReleaseMode and ctrl.boxPets then
		ctrl.boxPets:endReleaseMode()
		ctrl:openManagePage(false)
	end

	self.active = true

	if self.owner.activeDragReleaseArea then
		self.owner:activeDragReleaseArea(false)
		self.owner:invalidateDragReleaseSession()
	end

	if self.owner.filter then
		self.owner.filter:invalidate()
	end

	self.selected = {}
	self.selectionOrder = 0

	self.owner:clearPetSelection()
	self:setLeftControlsHidden(true)
	self.owner:refreshWarehouse()
	self:refreshUI()
	self.owner.ctrl:refreshConsoleBarState()
	self.owner.ctrl:_refreshTopRightTabsState()
end

function PetWarehouseBatchComponent:_closeDetailWaiting(context)
	if context == nil or context.waitingClosed then
		return
	end

	context.waitingClosed = true

	local waiting = context.waiting
	local handle = context.waitingHandle

	if waiting and handle then
		waiting:close(handle)
	end
end

function PetWarehouseBatchComponent:clearRequest()
	local context = self.request

	self.request = nil

	if context == nil then
		return
	end

	self:_closeDetailWaiting(context)

	local operation = context.detailOperation

	context.detailOperation = nil

	local gateway = self.manager and self.manager.gateway

	if gateway and operation then
		gateway:cancelPetDetails(operation)
	end
end

function PetWarehouseBatchComponent:leave(destroying)
	local context = self.request

	self:clearRequest()

	local wasActive = self.active

	if wasActive and self.owner.filter then
		self.owner.filter:invalidate()
	end

	self.active = false
	self.selected = {}
	self.request = nil
	self.operation = nil
	self.player = nil
	self.manager = nil

	if wasActive and not destroying then
		self:setLeftControlsHidden(false)
	end

	if context and context.confirming then
		pg.global.ui:close(UIConst.UI_ID_PET_MANAGEMENT_FREE)
	end

	if not destroying then
		self:refreshUI()
		self.owner.ctrl:refreshConsoleBarState()
		self.owner.ctrl:_refreshTopRightTabsState()
	end
end

function PetWarehouseBatchComponent:getSelectedIds()
	local ids = {}

	for petId in pairs(self.selected) do
		ids[#ids + 1] = petId
	end

	table.sort(ids, function(a, b)
		return self.selected[a] < self.selected[b]
	end)

	return ids
end

function PetWarehouseBatchComponent:canSelect(petId)
	local snapshot = self.manager:getSnapshot()

	if self.manager:getPetDomain(petId) ~= PetWarehouseConst.DOMAIN.WAREHOUSE then
		return false
	end

	local summary = snapshot.summaries and snapshot.summaries[petId]

	if not summary then
		return false
	end

	if self.owner.isWarehousePetInUse and self.owner:isWarehousePetInUse(summary) then
		return false
	end

	return true
end

function PetWarehouseBatchComponent:toggle(petId)
	if not self:isCurrent() or self:isBusy() then
		return
	end

	if self.selected[petId] then
		self.selected[petId] = nil
	elseif self:canSelect(petId) then
		self.selectionOrder = self.selectionOrder + 1
		self.selected[petId] = self.selectionOrder
	else
		local snapshot = self.manager:getSnapshot()
		local summary = snapshot and snapshot.summaries and snapshot.summaries[petId]

		if summary and self.owner.isWarehousePetInUse and self.owner:isWarehousePetInUse(summary) and self.owner.notifyWarehouseManageBlocked then
			self.owner:notifyWarehouseManageBlocked(summary)
		end

		return
	end

	self.owner:refreshWarehouse()
	self:refreshUI()
end

function PetWarehouseBatchComponent:getFirstIds()
	local ids = {}

	if not self:isCurrent() then
		return ids
	end

	if self.owner.filter and self.owner.filter.active then
		for _, data in ipairs(self.owner.filter:getResults()) do
			if self:canSelect(data.id) then
				ids[#ids + 1] = data.id
			end
		end

		return ids
	end

	local boxes = self.manager:getWarehouseBoxes()
	local box = boxes[self.owner.currentBoxIndex]

	if not box then
		return ids
	end

	local snapshot = self.manager:getSnapshot()
	local boxKey = PetWarehouseConst.DOMAIN.WAREHOUSE .. ":" .. tostring(box.id)
	local slotPetIds = snapshot.petIdsByBoxSlot and snapshot.petIdsByBoxSlot[boxKey] or {}
	local inBox = {}

	for slot, petId in pairs(slotPetIds) do
		if self:canSelect(petId) then
			inBox[#inBox + 1] = {
				id = petId,
				slot = slot
			}
		end
	end

	table.sort(inBox, function(a, b)
		return a.slot < b.slot
	end)

	for _, info in ipairs(inBox) do
		ids[#ids + 1] = info.id
	end

	return ids
end

function PetWarehouseBatchComponent:toggleFirst()
	if not self:isCurrent() or self:isBusy() then
		return
	end

	local ids = self:getFirstIds()
	local allSelected = #ids > 0

	for _, petId in ipairs(ids) do
		if not self.selected[petId] then
			allSelected = false

			break
		end
	end

	if allSelected then
		for _, petId in ipairs(ids) do
			self.selected[petId] = nil
		end
	else
		for _, petId in ipairs(ids) do
			if not self.selected[petId] then
				self.selectionOrder = self.selectionOrder + 1
				self.selected[petId] = self.selectionOrder
			end
		end
	end

	self.owner:refreshWarehouse()
	self:refreshUI()
end

function PetWarehouseBatchComponent:refreshUI()
	self.owner:refreshBatchDimming()

	if IsNil(self.panel) then
		return
	end

	self.panel:TryChangePage("RightFilter", self.owner:getRightFilterPage())

	local count = #self:getSelectedIds()

	local function setButton(button, key, number, enabled)
		if IsNil(button) then
			return
		end

		local refs = button:GetComponent("ObjectReference")
		local text = refs and refs:GetRefValue("txtNameUText")

		if NotNil(text) then
			ClientTextUtils.setText(text, pg.getFormatText(pg.getGameString(key), tostring(number)))
		end

		button.interactable = enabled
	end

	local enabled = self.active and not self:isBusy()

	setButton(self.moveButton, PetWarehouseConst.PetWarehouseText.BATCH_MOVE_OUT, count, enabled and count > 0)
	setButton(self.releaseButton, PetWarehouseConst.PetWarehouseText.BATCH_RELEASE, count, enabled and count > 0)

	if NotNil(self.selectButton) then
		local refs = self.selectButton:GetComponent("ObjectReference")
		local text = refs and refs:GetRefValue("txtNameUText")

		if NotNil(text) then
			ClientTextUtils.setText(text, pg.getGameString(PetWarehouseConst.PetWarehouseText.SELECT_ALLPAGE))
		end

		self.selectButton.interactable = enabled

		local firstIds = self:getFirstIds()
		local allSelected = #firstIds > 0

		for _, petId in ipairs(firstIds) do
			if not self.selected[petId] then
				allSelected = false

				break
			end
		end

		self.selectButton.isSelected = allSelected
	end

	if self.owner.filter then
		self.owner.filter:refreshUI()
	end
end

function PetWarehouseBatchComponent:onSnapshot()
	if not self.active then
		return
	end

	if not self:isCurrent() then
		self:leave()

		return
	end

	for petId in pairs(self.selected) do
		if not self:canSelect(petId) or self.owner.filter and self.owner.filter.active and not self.owner.filter:contains(petId) then
			self.selected[petId] = nil
		end
	end

	self:tryPrepareRelease()
	self:refreshUI()
end

function PetWarehouseBatchComponent:onOperation(operation)
	if not self:isCurrent() or operation ~= self.operation then
		return
	end

	local state = operation.status

	if state == PetWarehouseConst.STATE.SUCCEEDED or state == PetWarehouseConst.STATE.PARTIALLY_SUCCEEDED or state == PetWarehouseConst.STATE.FAILED or state == PetWarehouseConst.STATE.UNKNOWN then
		self.operation = nil

		if state ~= PetWarehouseConst.STATE.SUCCEEDED and not operation.failureNoticeShown then
			self.owner:showOperationFailure(operation.action, operation.reason)
		end

		self:onSnapshot()
		self.owner:refreshWarehouse()
	end
end

function PetWarehouseBatchComponent:submit(action, ids)
	if action == PetWarehouseConst.ACTION.RECYCLE then
		local started, reason = pg.game.petManage:tryRecyclePet(ids, Const.CALL_WAREHOUSE_PET_TIMEOUT)

		if not started then
			self.owner:showRecycleStartFailure(reason)
		end

		self:refreshUI()

		return started, reason
	end

	local operation, reason

	if action == PetWarehouseConst.ACTION.MOVE_OUT then
		if self.owner and self.owner.requestMoveOut then
			self.owner:requestMoveOut(ids, self.owner:getMoveOutTransferOptions())
			self:refreshUI()

			return
		end

		local options

		if self.owner and self.owner.getMoveOutTransferOptions then
			options = self.owner:getMoveOutTransferOptions()
		end

		operation, reason = self.manager:startTransfer(action, ids, options)
	end

	if not operation or operation.status == PetWarehouseConst.STATE.FAILED then
		if not operation or not operation.failureNoticeShown then
			self.owner:showOperationFailure(action, reason or operation and operation.reason)
		end
	else
		self.operation = operation

		self:onOperation(operation)

		if action == PetWarehouseConst.ACTION.MOVE_OUT and self.owner.trackMoveOut then
			self.owner:trackMoveOut(operation)
		end
	end

	self:refreshUI()
end

function PetWarehouseBatchComponent:moveOut()
	if not self:isCurrent() or self:isBusy() then
		return
	end

	local ids = self:getSelectedIds()

	if #ids > 0 then
		self:submit(PetWarehouseConst.ACTION.MOVE_OUT, ids)
	end
end

function PetWarehouseBatchComponent:validateRelease(context, selectedIds)
	if not self:isCurrent() or self.request ~= context then
		return false
	end

	for _, petId in ipairs(selectedIds or context.ids) do
		local pet = context.petInfos and context.petInfos[petId]

		if not self:canSelect(petId) or not pet then
			pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.PET_UNAVAILABLE))

			return false
		end

		if not self.owner:checkReleasePet(pet) then
			return false
		end
	end

	if selectedIds and self.manager:getTotalPetCount() <= #selectedIds then
		pg.global.showConfirmMsgRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TITLE), pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_WARN_TIP), nil, true)

		return false
	end

	return true
end

function PetWarehouseBatchComponent:_showDetailWaitTimeout()
	pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.DETAIL_WAIT_TIMEOUT)
end

function PetWarehouseBatchComponent:release(ids)
	if not self:isCurrent() or self:isBusy() then
		return
	end

	ids = ids or self:getSelectedIds()

	if #ids == 0 then
		return
	end

	local context = {
		ids = ids,
		manager = self.manager
	}

	self.request = context

	local waiting = pg.game and pg.game.commonWaiting

	if not waiting or not waiting.openUntilClosed then
		self:clearRequest()
		self:_showDetailWaitTimeout()
		self:refreshUI()

		return
	end

	context.waiting = waiting

	local function onClosed(reason)
		if context.waitingClosed then
			return
		end

		context.waitingClosed = true

		local unavailable = reason == "waitingUnavailable"

		self:clearRequest()

		if unavailable then
			self:_showDetailWaitTimeout()
		end

		self:refreshUI()
	end

	local handle = waiting:openUntilClosed(nil, function(readyHandle)
		if self.request ~= context or context.waitingClosed or context.waitingHandle ~= readyHandle then
			return
		end

		if not waiting:isReady(readyHandle) then
			return
		end

		self:_queryReleaseDetails(context)
	end, onClosed)

	if self.request ~= context then
		return
	end

	context.waitingHandle = handle

	if not handle then
		self:clearRequest()
		self:_showDetailWaitTimeout()
		self:refreshUI()

		return
	end

	self:refreshUI()
end

function PetWarehouseBatchComponent:_queryReleaseDetails(context)
	if self.request ~= context or not self:isCurrent() then
		self:clearRequest()
		self:refreshUI()

		return
	end

	local operation = self.manager:requestPetDetails(context.ids, function(result)
		if self.request ~= context then
			return
		end

		self:_applyReleaseDetails(context, result)
	end, true)

	if self.request ~= context then
		return
	end

	context.detailOperation = operation

	if operation == nil then
		self:clearRequest()
		self:_showDetailWaitTimeout()
		self:refreshUI()
	end
end

function PetWarehouseBatchComponent:_applyReleaseDetails(context, result)
	if self.request ~= context then
		return
	end

	local cancelled = result == nil or result.cancelled == true or result.reason == PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

	if not self:isCurrent() or cancelled then
		self:clearRequest()
		self:refreshUI()

		return
	end

	local infos = result.infos or {}
	local kept = {}
	local failed = false

	for _, petId in ipairs(context.ids) do
		if infos[petId] then
			kept[#kept + 1] = petId
		else
			failed = true
			self.selected[petId] = nil
		end
	end

	if #kept == 0 then
		self:clearRequest()
		self:_showDetailWaitTimeout()
		self:refreshUI()

		return
	end

	context.ids = kept
	context.petInfos = infos

	self:_closeDetailWaiting(context)

	context.ready = true

	if failed then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.PET_UNAVAILABLE))
	end

	self:refreshUI()
	self:tryPrepareRelease()
end

function PetWarehouseBatchComponent:tryPrepareRelease()
	local context = self.request

	if not context or context.confirming or not context.ready then
		return
	end

	if not self:isCurrent() then
		self:leave()

		return
	end

	if not self:validateRelease(context) then
		self:clearRequest()
		self:refreshUI()

		return
	end

	local selected = {}

	for index, petId in ipairs(context.ids) do
		selected[petId] = index
	end

	context.confirming = true

	pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_FREE, {
		richTextColor = "#FDDA0D",
		freePetIds = selected,
		petInfos = context.petInfos,
		ensureCb = function(tips, selectedPetIds, onReleaseStarted)
			self:confirmRelease(context, tips, selectedPetIds, onReleaseStarted)
		end
	}, function()
		if self.request ~= context then
			pg.global.ui:close(UIConst.UI_ID_PET_MANAGEMENT_FREE)
		end
	end, function()
		if self.request == context then
			self:clearRequest()
			self:refreshUI()
		end
	end)
end

function PetWarehouseBatchComponent:confirmRelease(context, tips, selectedPetIds, onReleaseStarted)
	if self.request ~= context then
		return
	end

	local ids = {}
	local selected = {}
	local petInfos = {}

	for _, petId in ipairs(context.ids) do
		if selectedPetIds[petId] then
			ids[#ids + 1] = petId
			selected[petId] = true
			petInfos[petId] = context.petInfos[petId]
		end
	end

	if #ids == 0 or not self:validateRelease(context, ids) then
		return
	end

	local key = PetManagementDataHelper.containsAtLeastOneRarePet(selected, petInfos) and PetWarehouseConst.PetWarehouseText.BATCH_RARE_CONFIRM or PetWarehouseConst.PetWarehouseText.BATCH_RELEASE_CONFIRM
	local tip = tips or pg.getFormatText(pg.getGameString(key), tostring(#ids))
	local rewards = ItemUtils.getBatchRecyclePetClientDisplayItem(self.player, ids, petInfos)

	pg.global.showCommonTipUse(pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TITLE), tip, rewards, function()
		if not self:validateRelease(context, ids) then
			return
		end

		local started = self:submit(PetWarehouseConst.ACTION.RECYCLE, ids)

		if started and onReleaseStarted then
			onReleaseStarted()
		end
	end, nil, true)
end

return PetWarehouseBatchComponent
