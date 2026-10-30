-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagement\\Component\\PetWarehouseLeftBatchComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local UIConst = require("Const.UIConst")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local PetManagementUtils = require("Utils.PetManagementUtils")
local Utils = require("Common.Utils.Utils")
local PetWarehouseLeftBatchComponent = Class.LightClass("PetWarehouseLeftBatchComponent", UIComponent)

function PetWarehouseLeftBatchComponent:ctor(ctrl)
	PetWarehouseLeftBatchComponent.super.ctor(self, ctrl, nil, {
		needLoadRes = true
	})

	self.container = self.view.leftOpenSelectUContainer
	self.player = pg.me
	self.sessionVersion = 0

	self:refreshVisibility()
end

function PetWarehouseLeftBatchComponent:isCurrent()
	if self._destroyed or not self.ctrl then
		return false
	end

	local rightBatch = self.ctrl.petWarehouse and self.ctrl.petWarehouse.batch

	return self.player ~= nil and self.player == pg.me and not self.player.destroyed and self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE and self.ctrl.inReleaseMode == true and self.ctrl.isDragging ~= true and (not rightBatch or not rightBatch.active)
end

function PetWarehouseLeftBatchComponent:canInteract()
	return self:isCurrent() and not self.ctrl.isDragging and not self.ctrl.onMoveDisplay and not self.player.isRecycling and not self.ctrl.boxPets:isManagementForbidden()
end

function PetWarehouseLeftBatchComponent:shouldHideLegacyReleaseBar()
	if self._destroyed or not self.ctrl then
		return false
	end

	local rightBatch = self.ctrl.petWarehouse and self.ctrl.petWarehouse.batch

	return self.player ~= nil and self.player == pg.me and self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE and self.ctrl.inReleaseMode == true and (not rightBatch or not rightBatch.active)
end

function PetWarehouseLeftBatchComponent:refreshVisibility()
	if self._destroyed or IsNil(self.container) then
		return
	end

	local visible = self:isCurrent()

	if self._visible ~= visible then
		self.sessionVersion = self.sessionVersion + 1
	end

	self._visible = visible

	if not visible and NotNil(self.selector) then
		self.selector:ClosePopup(true)
	end

	self.container:SetActive(visible)

	if visible and not self._loaded and not self._loading then
		if self.container:CheckURLLoaded() then
			self:onContentLoaded(self.container.content)
		else
			self._loading = true

			self.container:LoadDefaultUrlManually(function(content)
				self:onContentLoaded(content)
			end)
		end
	end

	if NotNil(self.view.pbReleaseUWidget) then
		self.view.pbReleaseUWidget:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, self:shouldHideLegacyReleaseBar())
	end

	if visible and self._loaded then
		self:refresh()
	end
end

function PetWarehouseLeftBatchComponent:onContentLoaded(content)
	if self._destroyed then
		return
	end

	self._loading = false

	if IsNil(content) then
		return
	end

	local refs = content:GetComponent("ObjectReference")

	self.filterButton = refs:GetRefValue("btnFilterUButton")
	self.filterButton2 = refs:GetRefValue("btnFilterUButton2")
	self.cleanFilterButton = refs:GetRefValue("btnCleanFilterUButton")
	self.selectorPanel = refs:GetRefValue("selectorPanelUComponent")
	self.tidyButton = refs:GetRefValue("btnBoxUButton")
	self.selector = refs:GetRefValue("selectorUSelector")
	self.boxName = refs:GetRefValue("txtNameUSDFText")
	self.placeholder = refs:GetRefValue("placeHolderUSDFText")
	self.selectButton = refs:GetRefValue("selectNumberUButton")
	self.selectText = refs:GetRefValue("selectNumberUSDFText")
	self.releaseButton = refs:GetRefValue("releasingBtn2UButton")
	self.releaseText = refs:GetRefValue("releasingBtn2USDFText")
	self.moveButton = refs:GetRefValue("btnMoveUButton")
	self.moveText = refs:GetRefValue("btnMoveUSDFText")
	self.closeButton = refs:GetRefValue("btnClose2UButton")

	if NotNil(self.selectText) then
		self.selectText.disabledLocalization = true
	end

	if NotNil(self.releaseText) then
		self.releaseText.disabledLocalization = true
	end

	if NotNil(self.moveText) then
		self.moveText.disabledLocalization = true
	end

	local function openBagFilter()
		if not self.model.inAutoFilterMode then
			if NotNil(self.selector) then
				self.selector:ClosePopup(true)
			end

			self.ctrl.boxPets:openFilterPanel()
		end
	end

	self:bindButton(self.filterButton, openBagFilter)
	self:bindButton(self.filterButton2, openBagFilter)
	self:bindButton(self.cleanFilterButton, function()
		self.ctrl.boxPets:endFilter()
	end)
	self:bindButton(self.tidyButton, function()
		if not self.ctrl.inFilterMode and not self.model:isHomePetMode() then
			self.selector:ClosePopup(true)
			pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_TIDY_UP, {
				boxId = self.model:getSelectBoxId()
			})
		end
	end)
	self:bindButton(self.selectButton, function()
		self:toggleFirst()
	end)
	self:bindButton(self.releaseButton, function()
		local version = self.sessionVersion
		local selectedIds = {}

		for id in pairs(self.ctrl.boxPets.batchReleasePetIds or {}) do
			selectedIds[#selectedIds + 1] = id
		end

		self.ctrl.boxPets:doBatchRelease(function()
			if not self:canInteract() or self.sessionVersion ~= version then
				return false
			end

			for _, id in ipairs(selectedIds) do
				local pet = self.player.pets[id]
				local inWarehouse = self.player.warehousePetBoxMap and self.player.warehousePetBoxMap:getPetIndex(id)

				if not pet or inWarehouse or not self.player.petBoxMap:getPetIndex(id) or self.ctrl.boxPets:getIsInUse(self.model:setUpPetInfo(pet)) then
					pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.PET_UNAVAILABLE))

					return false
				end
			end

			return true
		end)
	end)
	self:bindButton(self.moveButton, function()
		self:moveIn()
	end)
	self:bindButton(self.closeButton, function()
		self.ctrl.boxPets:endReleaseMode()
		self.ctrl:openManagePage(false)
	end)

	self._loaded = true

	self:refreshVisibility()
end

function PetWarehouseLeftBatchComponent:getSelectedMoveInIds()
	local ids = {}
	local selected = self.ctrl and self.ctrl.boxPets and self.ctrl.boxPets.batchReleasePetIds

	if not Utils.isTable(selected) then
		return ids
	end

	local ordered = {}

	for petId, order in pairs(selected) do
		ordered[#ordered + 1] = {
			petId = petId,
			order = order
		}
	end

	table.sort(ordered, function(left, right)
		return left.order < right.order
	end)

	for _, item in ipairs(ordered) do
		ids[#ids + 1] = item.petId
	end

	return ids
end

function PetWarehouseLeftBatchComponent:moveIn()
	if not self:canInteract() then
		return
	end

	local ids = self:getSelectedMoveInIds()

	if #ids == 0 then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.BATCH_SELECT_FIRST))

		return
	end

	local warehouse = self.ctrl.petWarehouse

	if warehouse and warehouse.requestMoveIn then
		warehouse:requestMoveIn(ids)
	end
end

function PetWarehouseLeftBatchComponent:bindButton(button, callback)
	if NotNil(button) then
		function button.luaClick()
			if self:canInteract() then
				callback()
			end
		end
	end
end

function PetWarehouseLeftBatchComponent:getFirstPetIds()
	local ids = {}

	if not self:isCurrent() or self.model:isHomePetMode() then
		return ids
	end

	local player = self.player
	local map = player.petBoxMap
	local seen = {}

	local function append(data)
		local id = data and data.id

		if not id or seen[id] or not player.pets[id] or not map:getPetIndex(id) then
			return
		end

		if player.warehousePetBoxMap and player.warehousePetBoxMap:getPetIndex(id) then
			return
		end

		if not self.ctrl.boxPets:getIsInUse(data) then
			seen[id] = true
			ids[#ids + 1] = id
		end
	end

	if self.ctrl.inFilterMode then
		for _, data in ipairs(self.ctrl.boxPets.petInfos or {}) do
			append(data)
		end
	else
		local boxId = self.model:getSelectBoxId()
		local box = map[boxId]

		if box then
			for slot = 1, box.slotCount do
				local pet = player.pets[box[slot]]

				if pet then
					append(self.model:setUpPetInfo(pet))
				end
			end
		end
	end

	return ids
end

function PetWarehouseLeftBatchComponent:isFirstSelected(ids)
	if #ids == 0 then
		return false
	end

	local selected = self.ctrl.boxPets.batchReleasePetIds or {}

	for _, id in ipairs(ids) do
		if not selected[id] then
			return false
		end
	end

	return true
end

function PetWarehouseLeftBatchComponent:toggleFirst()
	if not self:canInteract() then
		return
	end

	local ids = self:getFirstPetIds()
	local clear = self:isFirstSelected(ids)
	local boxPets = self.ctrl.boxPets

	if clear then
		for _, id in ipairs(ids) do
			boxPets:modifyBatchReleasePetIds(id, nil, false, true)
		end
	else
		for _, id in ipairs(ids) do
			boxPets:modifyBatchReleasePetIds(id, 1, false, true)
		end
	end

	boxPets:refreshPetList()
	boxPets:refreshBatchReleasePanelState()
end

function PetWarehouseLeftBatchComponent:refreshSelector()
	local boxId = self.model:getSelectBoxId()
	local box = self.player.petBoxMap[boxId]

	if IsNil(self.selector) or not box then
		return
	end

	local name = box.customName

	if not name or name == "" then
		name = pg.getGameString("DEFAULT_PET_BOX_NAME") .. " " .. tostring(boxId)
	end

	local title = string.format("%s (%d/%d)", name, box.count, box.slotCount)

	ClientTextUtils.setText(self.boxName, title)
	ClientTextUtils.setText(self.placeholder, title)

	local boxInfos = self.model:getBoxInfos()
	local selectedIndex = -1

	for index, info in ipairs(boxInfos) do
		if info.idx == boxId then
			selectedIndex = index - 1
		end
	end

	PetManagementDataHelper.setBoxSelectorLuaRenderPopup(self.selector, {
		selectItemOnFinishRender = true,
		boxInfos = boxInfos,
		boxNameContent = title,
		selectBoxId = boxId,
		onRenderPopup = function(popup, list)
			self.popup = popup
			self.popupList = list
		end,
		canInteract = function()
			return self:canInteract() and not self.ctrl.inFilterMode
		end,
		renderItemLockState = function(button, _, id)
			button:TryChangePage("Lock", PetManagementUtils.getBoxLockState(self.player.petBoxMap[id]))
		end,
		onSelectBox = function(id)
			self.selector:ClosePopup(true)
			self.ctrl.boxPets:switchBoxToIdx(id, true)
		end,
		onLockBox = function(id)
			self.selector:ClosePopup(true)
			self.ctrl.boxPets:boxLockBtnFunction(id, true)
		end,
		onRenameBox = function(id)
			self.selector:ClosePopup(true)
			self.ctrl:showRename(self.model.RENAME_FOR_BOX, id)
		end
	})
	self.selector:SetOptions(boxInfos)
	self.selector:ForceSelect(selectedIndex, false)

	if self.selector.isPopup and NotNil(self.popup) and NotNil(self.popupList) then
		self.selector.luaRenderPopup(self.popup, self.popupList)
	end

	local refs = self.selector:GetComponent("ObjectReference")
	local lockButton = refs and refs:GetRefValue("lockUButton")

	if NotNil(lockButton) then
		lockButton:TryChangePage("Lock", PetManagementUtils.getBoxLockState(box))
		self:bindButton(lockButton, function()
			if not self.ctrl.inFilterMode then
				self.ctrl.boxPets:boxLockBtnFunction(boxId, true)
			end
		end)
	end
end

function PetWarehouseLeftBatchComponent:refresh()
	if not self._loaded or not self:isCurrent() then
		return
	end

	local count = 0

	for _ in pairs(self.ctrl.boxPets.batchReleasePetIds or {}) do
		count = count + 1
	end

	ClientTextUtils.setText(self.selectText, pg.getGameString(PetWarehouseConst.PetWarehouseText.SELECT_ALLPAGE))
	ClientTextUtils.setText(self.releaseText, pg.getFormatText(pg.getGameString(PetWarehouseConst.PetWarehouseText.BATCH_RELEASE), tostring(count)))

	local enabled = self:canInteract()

	self._lastCanInteract = enabled

	if NotNil(self.selectButton) then
		local ids = self:getFirstPetIds()

		self.selectButton.interactable = enabled and #ids > 0
		self.selectButton.isSelected = self:isFirstSelected(ids)

		self.selectButton:TryChangePage("button", self.selectButton.isSelected and 5 or 0)
	end

	if NotNil(self.releaseButton) then
		self.releaseButton.interactable = enabled and count > 0 and not self.ctrl.boxPets:isReleaseForbidden()
	end

	if NotNil(self.moveText) then
		ClientTextUtils.setText(self.moveText, pg.getFormatText(pg.getGameString(PetWarehouseConst.PetWarehouseText.BATCH_MOVE_IN), tostring(count)))
	end

	if NotNil(self.moveButton) then
		self.moveButton.interactable = enabled and count > 0
	end

	if NotNil(self.filterButton) then
		self.filterButton.interactable = enabled and not self.model.inAutoFilterMode
	end

	if NotNil(self.filterButton2) then
		self.filterButton2.interactable = enabled and not self.model.inAutoFilterMode
	end

	if NotNil(self.cleanFilterButton) then
		self.cleanFilterButton.interactable = enabled
	end

	if NotNil(self.tidyButton) then
		self.tidyButton.interactable = enabled and not self.ctrl.inFilterMode and not self.model:isHomePetMode()
	end

	if NotNil(self.selector) then
		self.selector.interactable = enabled and not self.ctrl.inFilterMode and not self.model:isHomePetMode()
	end

	self:refreshSelectorPanelState()
	self:refreshSelector()

	if NotNil(self.tidyButton) then
		self.tidyButton:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, self.ctrl.inFilterMode == true)
	end
end

function PetWarehouseLeftBatchComponent:refreshSelectorPanelState()
	local selectorState = 0

	if self.ctrl.inFilterMode then
		selectorState = 1
	end

	if NotNil(self.selectorPanel) then
		self.selectorPanel:TryChangePage("State", selectorState)
	end

	if selectorState == 1 and NotNil(self.selector) then
		self.selector:ClosePopup(true)
	end
end

function PetWarehouseLeftBatchComponent:tick()
	if self._destroyed then
		return
	end

	if self._visible ~= self:isCurrent() then
		self:refreshVisibility()
	elseif self._visible and self._lastCanInteract ~= self:canInteract() then
		self:refresh()
	end
end

function PetWarehouseLeftBatchComponent:onDestroy()
	self._destroyed = true
	self.sessionVersion = self.sessionVersion + 1

	if NotNil(self.selector) then
		self.selector:ClosePopup(true)
	end

	if NotNil(self.container) then
		self.container:SetActive(false)
	end
end

return PetWarehouseLeftBatchComponent
