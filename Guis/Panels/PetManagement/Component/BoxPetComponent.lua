-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagement\\Component\\BoxPetComponent.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local NoticeDef = require("Common.NoticeDef")
local TimeUtils = require("Common.Utils.TimeUtils")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("BoxPetComponent")
local UIConst = require("Const.UIConst")
local HotkeyConst = require("Const.HotkeyConst")
local ItemUtils = require("Common.Utils.ItemUtils")
local AbilityConst = require("Common.Const.AbilityConst")
local lume = require("Core.Common.lume")
local Class = require("Core.Framework.Class")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetConfigData = require("Data.pet_config_data")
local PetData = require("Data.pet_data")
local UIComponent = require("Guis.Helper.UIComponent")
local BoxPetComponent = Class.LightClass("BoxPetComponent", UIComponent)
local ClientTextUtils = require("Utils.ClientTextUtils")
local AddressDataConst = require("Const.AddressDataConst")
local ClientConst = require("Const.ClientConst")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local Time = require("Core.Common.Time")
local SysConfigData = require("Data.sys_config_data")
local TimerManager = require("Core.Timer.TimerManager")
local PetManagementUtils = require("Utils.PetManagementUtils")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local BUTTON_PAGE_NORMAL = 0
local BUTTON_PAGE_SELECTED = 5
local DRAG_STATE_NORMAL = 0
local DRAG_STATE_DRAGGING = 1
local DRAG_STATE_SOURCE = 2
local PET_HEAD_NORMAL_ANCHORED_Y = 224
local PET_HEAD_ADDON_SIZE = 256
local PET_HEAD_ANIMATION_SCALE_RESET_PATHS = {
	"Normal",
	"Normal/Mask/Icon",
	"Normal/Bgselect01",
	"Normal/Bgselect02"
}

function BoxPetComponent:findObjects()
	self.root = self.view.root
	self.boxPetFilterList = self.view.boxPetFilterList
	self.boxPetNew = self.view.boxPetNewList
	self.boxPetNewListContainers = {}

	for i = 0, 23 do
		self.boxPetNewListContainers[i] = self.view.boxPetNewList.transform:GetChild(i).transform:GetComponent("UContainer")
	end

	self._showingNormalList = true
	self.boxSelector = self.view.boxSelector
	self.btnLeftUButton = self.view.btnLeftUButton
	self.btnRightUButton = self.view.btnRightUButton
	self.dragReleaseUWidget = self.view.dragReleaseUWidget
	self.btnReleaseUButton = self.view.btnReleaseUButton
	self.btnCloseUButton = self.view.btnCloseUButton
	self.startReleaseBtn = self.view.startReleaseBtn
	self.btnFilterUButton = self.view.btnFilterUButton
	self.midPanelUComponent = self.view.midPanelUComponent
	self.btnFilter1UButton = self.view.btnFilter1UButton
	self.btnCleanFilterUButton = self.view.btnCleanFilterUButton

	local objectReference = self.midPanelUComponent.transform:GetComponent("ObjectReference")

	self.lockAnimation = objectReference:GetRefValue("lockAnimation")
	self.pbFilter2UComponent = objectReference:GetRefValue("pbFilter2UComponent")

	self.ctrl:showNormalList(true)

	self.btnInfoUButton = self.view.btnInfoUButton
	self.txtSelectedUSDFText = self.view.txtSelectedUSDFText
	self.btnBox2UButton = self.view.btnBox2UButton
	self.btnDisplayUButton = self.view.btnDisplayUButton
	self.btnViewUButton = self.view.btnViewUButton
	self.btnView2UButton = self.view.btnView2UButton
	self.txtNumUSDFText = self.view.txtNumUSDFText
	self.autoFilterBtnUContainer = self.view.autoFilterBtnUContainer
	self.normalListBtnCaches = {}
	self.filterListBtnCaches = {}
	self.batchReleaseSelectCountIndex = 0

	self:modifyBatchReleasePetIds(nil, nil, true)

	local objectReference = self.dragReleaseUWidget:GetComponent("ObjectReference")

	if objectReference then
		self.dragAreaUButton = objectReference:GetRefValue("dragAreaUButton")
	end
end

function BoxPetComponent:initView()
	self:addListener()
	self:refreshPetList()
	self:refreshBoxSelector()
	self:renderReleasePanel()
end

function BoxPetComponent:addListener()
	function self.btnLeftUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		self:switchBoxPages(true, true)
	end

	function self.btnRightUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		self:switchBoxPages(false, true)
	end

	function self.btnReleaseUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		if self:isManagementForbidden() then
			return
		end

		self:startReleaseMode()
		self.ctrl:openManagePage(true)
	end

	function self.btnCloseUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		self:endReleaseMode()
		self.ctrl:openManagePage(false)
	end

	function self.startReleaseBtn.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		self:doBatchRelease()
	end

	function self.btnFilterUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		if self.model.inAutoFilterMode then
			return
		end

		self:openFilterPanel()
	end

	function self.btnFilter1UButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		if self.model.inAutoFilterMode then
			return
		end

		self:openFilterPanel()
	end

	function self.btnCleanFilterUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		if self.autoFilterBtn then
			self.autoFilterBtn.isSelected = false
		end

		self:endFilter()
	end

	function self.boxPetFilterList.luaRenderItem(button, index, data)
		self:bindFilterListBtnCache(button, data)
		self:setBoxPetListData(button, index, data)

		button.navForceNonInteractable = self._showingNormalList == true
	end
end

function BoxPetComponent:isReleaseForbidden()
	return self.model:isHomePetMode() or self:isManagementForbidden()
end

function BoxPetComponent:isManagementForbidden()
	if self.model.worldRacingTrackId then
		return true
	end

	local fightPets = self.ctrl and self.ctrl.fightPets

	return fightPets and (fightPets.isRogueMode or fightPets.isBossRushMode) or false
end

function BoxPetComponent:enterHomePetMode()
	if self.ctrl.onMoveDisplay or self.ctrl.isDragging then
		return
	end

	self.boxSelector:ClosePopup(true)
	self.model:setHomePetMode(true)
	self:clearDragBatchReleasePetIds()
	self:modifyBatchReleasePetIds(nil, nil, true)
	self:endFilter()

	local firstHomePetInfo

	for _, petInfo in ipairs(self.petInfos or {}) do
		if petInfo.id then
			firstHomePetInfo = petInfo

			break
		end
	end

	if firstHomePetInfo then
		self.model:setCurSelectPetId(firstHomePetInfo.id)
	else
		self.model:setCurSelectPetId()
	end

	self:selectItemIfExists(self.model.curSelectPetId)

	if self.model.curSelectPetId then
		self.ctrl:showPetInfo(self.model:setUpPetInfo(pg.me:getPetInfo(self.model.curSelectPetId)), true)
	else
		self.ctrl:showPetInfo()
	end

	self:_focusFirstHomePetForGamepad()

	if self.ctrl.refreshConsoleBarState then
		self.ctrl:refreshConsoleBarState()
	end
end

function BoxPetComponent:_getFirstHomePetButton()
	if not self.ctrl or not self.ctrl.inFilterMode then
		return nil
	end

	local filterList = self.boxPetFilterList

	if IsNil(filterList) or not filterList.GetAllButtons then
		return nil
	end

	local buttons = filterList:GetAllButtons()

	if not buttons then
		return nil
	end

	local length = buttons.Length

	if not length or length <= 0 then
		return nil
	end

	for i = 0, length - 1 do
		local btn = buttons[i]

		if not IsNil(btn) then
			local data = btn.dataFromUList

			if Utils.isTable(data) and data.id and not data.isEmpty then
				return btn
			end
		end
	end

	return nil
end

function BoxPetComponent:_focusFirstHomePetForGamepad()
	if not pg or not pg.game or not pg.game.input then
		return
	end

	if not pg.game.input:isUsingGamepad() then
		return
	end

	if not self.ctrl or not self.ctrl.startFrameTimer then
		return
	end

	self.ctrl:startFrameTimer(function()
		if not self.model or not self.model:isHomePetMode() then
			return
		end

		if not pg.game.input:isUsingGamepad() then
			return
		end

		local btn = self:_getFirstHomePetButton()

		if IsNil(btn) then
			return
		end

		if btn.isNavFocused then
			return
		end

		if btn.TryNavFocus then
			btn:TryNavFocus()

			return
		end

		local navMgr = pg.global and pg.global.navMgr

		if navMgr and navMgr.FocusItem then
			navMgr:FocusItem(btn)
		end
	end, 1)
end

function BoxPetComponent:refreshCurrentBoxPetSelection()
	local firstPetIndex, firstPetInfo

	for index, petInfo in ipairs(self.petInfos or {}) do
		if petInfo and petInfo.id then
			firstPetIndex = index - 1
			firstPetInfo = petInfo

			break
		end
	end

	if firstPetInfo then
		self:refreshPetSelectedStatus(firstPetIndex, nil, firstPetInfo)

		return
	end

	self.model:setCurSelectPetId()
	self:selectItemIfExists()
	self.ctrl.fightPets:selectItemIfExists()
	self.ctrl.explorePets:selectItemIfExists()
	self.ctrl:showPetInfo()
end

function BoxPetComponent:exitHomePetMode(skipRestoreSelection)
	if not self.model:isHomePetMode() then
		return false
	end

	self.model:setHomePetMode(false)
	self.model:setCurSelectPetId()

	self.homePetFilterActive = false
	self.showLabelInfo = nil

	self.model:setSelectSortId(0)
	self.model:setFilter({})

	self.ctrl.inFilterMode = false

	LuaUIUtils.setUIVisible(self.view.btnBoxUButton, true)
	LuaUIUtils.setUIVisible(self.view.btnBox2UButton, true)
	self.ctrl.boxLists:muteBoxButtons(false)
	self.root:TryChangePage("State", 0)
	self.ctrl:showNormalList(true)
	self.ctrl:refreshPetBox()

	if not skipRestoreSelection then
		self:refreshCurrentBoxPetSelection()
	end

	if self.ctrl.refreshBaseNavigationSubArea then
		self.ctrl:refreshBaseNavigationSubArea(1)
	end

	if self.ctrl.refreshConsoleBarState then
		self.ctrl:refreshConsoleBarState()
	end

	return true
end

function BoxPetComponent:refreshReleaseAvailability()
	self.btnReleaseUButton.interactable = not self:isManagementForbidden()

	if self:isReleaseForbidden() then
		self:activeDragReleaseArea(false)
	end
end

function BoxPetComponent:applyMidListsNavInteractable(showingNormal)
	self._showingNormalList = showingNormal and true or false

	for i = 0, #self.boxPetNewListContainers do
		local container = self.boxPetNewListContainers[i]
		local uBtn = container and container.content and container.content:GetComponent("UButton")

		if uBtn then
			uBtn.navForceNonInteractable = not self._showingNormalList
		end
	end

	if self.boxPetFilterList then
		local btns = self.boxPetFilterList:GetAllButtons()

		for i = 0, btns.Length - 1 do
			btns[i].navForceNonInteractable = self._showingNormalList
		end
	end
end

function BoxPetComponent:setTemporaryStorageButtonNavDisabled(disabled)
	local button = self.temporaryStorageButton

	if IsNil(button) then
		return
	end

	button.navForceNonInteractable = disabled == true or self.temporaryStorageButtonNavForceNonInteractable == true
end

function BoxPetComponent:clearTemporaryStorageButtonNav()
	self:setTemporaryStorageButtonNavDisabled(false)

	self.temporaryStorageButton = nil
	self.temporaryStorageButtonNavForceNonInteractable = nil
	self.temporaryStorageContainer = nil
	self.temporaryStorageUrl = nil
end

function BoxPetComponent:shouldUsePetHeadTemporaryStorage()
	return pg.game.input:isUsingGamepad()
end

function BoxPetComponent:storePetHeadTemporaryStorage(button, data, reason)
	if self.ctrl.inFilterMode then
		return false
	end

	if IsNil(button) or IsNil(button.gameObject) then
		return false
	end

	if self.temporaryStorageButton == button then
		return true
	end

	local container = button.gameObject.transform.parent:GetComponent("UContainer")

	if IsNil(container) then
		return false
	end

	self.temporaryStorageButton = button
	self.temporaryStorageButtonNavForceNonInteractable = button.navForceNonInteractable
	self.temporaryStorageContainer = container
	self.temporaryStorageUrl = AddressDataConst.PET_NORMAL_SLOT

	CS.XGUI.Tool.UTemporaryStorage.Store(button.gameObject, AddressDataConst.PET_NORMAL_SLOT)

	container.enableTemporaryStorage = true

	return true
end

function BoxPetComponent:prepareDraggingPetTemporaryStorageForBoxSwitch()
	return self:storePetHeadTemporaryStorage(self.draggingSourceButton, self.draggingSourceData, "hoverSwitchBox")
end

function BoxPetComponent:markSuppressPetHeadRestoreAni(petId)
	if petId == nil then
		return
	end

	self._suppressPetHeadRestoreAniPetId = petId
	self._suppressPetHeadRestoreAniUntil = Time.millisecondCache + 500
end

function BoxPetComponent:shouldSuppressPetHeadRestoreAni(data)
	if data == nil or data.id == nil then
		return false
	end

	if self._suppressPetHeadRestoreAniPetId ~= data.id then
		return false
	end

	if self._suppressPetHeadRestoreAniUntil ~= nil and Time.millisecondCache > self._suppressPetHeadRestoreAniUntil then
		self._suppressPetHeadRestoreAniPetId = nil
		self._suppressPetHeadRestoreAniUntil = nil

		return false
	end

	return true
end

function BoxPetComponent:markSuppressPetHeadIconAni(petId)
	self:markSuppressPetHeadRestoreAni(petId)
end

function BoxPetComponent:shouldSuppressPetHeadIconAni(data)
	return self:shouldSuppressPetHeadRestoreAni(data)
end

function BoxPetComponent:openFilterPanel()
	pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_FILTER, {
		sortId = self.model:getSelectSortId(),
		isDescending = self.model:getSortSwitchStatus(),
		filter = self.model:getFilter(),
		isAutoFilter = self.ctrl.intelligentFilterId ~= nil or self.ctrl.isWorldRacingIntelligentFilter == true,
		doFilterCallback = function(filter, sortId, isDescending, showLabelInfo)
			self.showLabelInfo = showLabelInfo

			self.model:setSelectSortId(sortId)
			self.model:setSortSwitchStatus(isDescending)
			self.model:setFilter(filter)

			if pg.global.ui:checkUIOpen(UIConst.UI_ID_PET_MANAGEMENT) then
				self:startFilter()
			end
		end
	})
	self.boxSelector:ClosePopup()
end

function BoxPetComponent:getBoxPetSlotIndexByButton(button)
	if IsNil(button) then
		return nil
	end

	for i = 0, #self.boxPetNewListContainers do
		local container = self.boxPetNewListContainers[i]
		local uBtn = container and container.content and container.content:GetComponent("UButton")

		if uBtn == button then
			return i
		end
	end

	return nil
end

function BoxPetComponent:findNextOccupiedBagSlot(fromSlot, petInfos)
	petInfos = petInfos or self.petInfos

	if not Utils.isTable(petInfos) then
		return 0
	end

	local count = #petInfos

	if count <= 0 then
		return 0
	end

	local startSlot = tonumber(fromSlot) or 0

	if startSlot < 0 then
		startSlot = 0
	end

	if startSlot > count - 1 then
		startSlot = count - 1
	end

	local function isOccupied(slot)
		local petInfo = petInfos[slot + 1]

		return petInfo and petInfo.id and petInfo.isEmpty ~= true
	end

	for slot = startSlot + 1, count - 1 do
		if isOccupied(slot) then
			return slot
		end
	end

	for slot = startSlot, count - 1 do
		if not isOccupied(slot) then
			return slot
		end
	end

	return startSlot
end

function BoxPetComponent:getBoxPetButtonBySlot(slot)
	if slot == nil then
		return nil
	end

	local container = self.boxPetNewListContainers[slot]

	return container and container.content and container.content:GetComponent("UButton") or nil
end

function BoxPetComponent:tryRestoreBoxSwitchFocusSlotNow(slot)
	local navMgr = pg.global.navMgr

	if not navMgr then
		return false
	end

	local newBtn = self:getBoxPetButtonBySlot(slot)

	if IsNil(newBtn) then
		return false
	end

	local focused = newBtn.isNavFocused

	focused = focused or newBtn:TryNavFocus()

	if focused and navMgr.IsDragging then
		self._navDraggingFocusSlot = slot
	end

	return focused
end

function BoxPetComponent:tryRestoreBoxDragFocusSlotNow(slot)
	local navMgr = pg.global.navMgr

	if not navMgr or not navMgr.IsDragging then
		return
	end

	self:tryRestoreBoxSwitchFocusSlotNow(slot)
end

function BoxPetComponent:restoreBoxNavFocusSlot(slot, navConfirm, allowDragging)
	self.ctrl:startFrameTimer(function()
		local navMgr = pg.global.navMgr
		local isDragging = navMgr and navMgr.IsDragging

		if isDragging and not allowDragging then
			return
		end

		local newBtn = self:getBoxPetButtonBySlot(slot)

		if IsNil(newBtn) then
			return
		end

		local focused = newBtn.isNavFocused

		if not newBtn.isNavFocused then
			focused = newBtn:TryNavFocus()
		end

		if focused and isDragging then
			self._navDraggingFocusSlot = slot
		elseif focused and navConfirm then
			newBtn:OnClickSimulate(true)
		end
	end, 1)
end

function BoxPetComponent:beginNavSwitchBoxFocusKeep()
	self._navSwitchBoxFocusSlot = nil

	local navMgr = pg.global.navMgr

	if not navMgr or not pg.game.input:isUsingGamepad() or self.ctrl.inFilterMode then
		return nil
	end

	local navSwitchFocusSlot

	if navMgr.CurrentFocusedGroupName == "ComPetList" then
		navSwitchFocusSlot = self:getBoxPetSlotIndexByButton(navMgr.CurrentFocusedUContent)
	end

	if navSwitchFocusSlot == nil and navMgr.IsDragging then
		navSwitchFocusSlot = self._navDraggingFocusSlot
	end

	self._navSwitchBoxFocusSlot = navSwitchFocusSlot

	return navSwitchFocusSlot
end

function BoxPetComponent:endNavSwitchBoxFocusKeep(slot, navConfirm)
	self._navSwitchBoxFocusSlot = nil

	if slot == nil then
		return
	end

	local navMgr = pg.global.navMgr
	local isDragging = navMgr and navMgr.IsDragging

	self:restoreBoxNavFocusSlot(slot, navConfirm and not isDragging, isDragging)
end

function BoxPetComponent:refreshPetList(isHoverIn, isManual)
	if self.ctrl.petWarehouse then
		self.ctrl.petWarehouse:clearPetSelection(PetWarehouseConst.DOMAIN.BAG)
	end

	self.inFightPetInfos = self.model:getGroupInfoById(self.model:getSelectGroupId())
	self.inExplorePetInfos = self.model:getExploreGroupInfoById(self.model:getSelectGroupId())

	self:rebuildBlockedFormationPetIdSet()
	self:pruneBatchReleasePetIds()

	local selectBoxId = self.model:getSelectBoxId()
	local petInfos

	if self.ctrl.inFilterMode then
		if isHoverIn then
			petInfos = self.model:getBoxInfoById(selectBoxId, isHoverIn)
		else
			petInfos = self.model:getFilteredPetsInfo(selectBoxId)
		end
	else
		petInfos = self.model:getBoxInfoById(selectBoxId)
	end

	self.petInfos = petInfos

	if self.ctrl.inFilterMode then
		self.boxPetFilterList:SetList(petInfos)
	end

	if self._navMoveFocusPending and self._navFocusSlot == nil and pg.game.input:isUsingGamepad() then
		for i = 0, #self.boxPetNewListContainers do
			local container = self.boxPetNewListContainers[i]
			local curBtn = container and container.content and container.content:GetComponent("UButton")

			if curBtn and curBtn.isNavFocused then
				self._navFocusSlot = i

				break
			end
		end
	end

	local extraPetInfo
	local normalListLastIndex = -1

	if not self.ctrl.inFilterMode then
		extraPetInfo = not isHoverIn and petInfos or self.model:getBoxInfoById(selectBoxId, isHoverIn)
		normalListLastIndex = #self.boxPetNewListContainers
	end

	local focusSlotRebuilt = false
	local defaultFocusSlot = self.ctrl._initGamepadFocusSlot or 0

	for i = 0, normalListLastIndex do
		local data = extraPetInfo[i + 1]
		local container = self.boxPetNewListContainers[i]
		local newUrl = (not data or data.isEmpty) and AddressDataConst.PET_EMPTY_SLOT or AddressDataConst.PET_NORMAL_SLOT

		if self._navMoveFocusPending and i == self._navFocusSlot and container.url ~= newUrl then
			focusSlotRebuilt = true
		end

		if self.temporaryStorageContainer == container then
			self:setTemporaryStorageButtonNavDisabled(newUrl ~= self.temporaryStorageUrl)
		end

		local switchFocusSlotRebuilt = self._navSwitchBoxFocusSlot ~= nil and i == self._navSwitchBoxFocusSlot and container.url ~= newUrl

		if pg.global.navMgr and (switchFocusSlotRebuilt or self._navMoveFocusPending and not pg.global.navMgr.IsDragging) then
			pg.global.navMgr:ClearFocus()
		end

		container.url = newUrl

		if data then
			local uBtn = container.content:GetComponent("UButton")

			if data.id then
				self.normalListBtnCaches[data.id] = uBtn
			end

			self:setBoxPetListData(uBtn, i, data, isManual)

			uBtn.dataFromUList = data

			if i == defaultFocusSlot then
				uBtn:SetNavItemPriorityOverride(99)
			else
				uBtn:ClearNavItemPriorityOverride()
			end
		end

		if switchFocusSlotRebuilt then
			self:tryRestoreBoxSwitchFocusSlotNow(i)
		end
	end

	self:tryConsumePendingSelectByDrop()

	if focusSlotRebuilt then
		local slot = self._navFocusSlot

		self.ctrl:startFrameTimer(function()
			if pg.global.navMgr and pg.global.navMgr.IsDragging then
				return
			end

			local container = self.boxPetNewListContainers[slot]
			local newBtn = container and container.content and container.content:GetComponent("UButton")

			if not IsNil(newBtn) and not newBtn.isNavFocused then
				newBtn:TryNavFocus()
			end
		end, 1)
	end

	if self.ctrl.inReleaseMode then
		self:refreshSelectAllBtn()
	end

	self._battleBadgeSnap = self:snapshotBattleBadges()

	if self.ctrl.warehouseLeftBatch then
		self.ctrl.warehouseLeftBatch:refresh()
	end
end

function BoxPetComponent:selectSlot(index)
	if self.ctrl.inFilterMode then
		local btns = self.boxPetFilterList:GetAllButtons()

		if btns.Length <= 0 then
			return
		end

		if not btns[index - 1] then
			return
		end

		btns[index - 1].luaPress()
	else
		local uBtn = self.boxPetNewListContainers[index - 1].content:GetComponent("UButton")

		uBtn.luaPress()
	end
end

function BoxPetComponent:refreshEvolveState(petBtn, inBatch, data)
	LuaUIUtils.renderPetHeadEvolveArrow(petBtn, inBatch, data)
end

function BoxPetComponent:disablePetsDrag()
	for i = 0, 23 do
		local container = self.boxPetNewListContainers[i]

		if NotNil(container) and NotNil(container.content) then
			local uBtn = container.content:GetComponent("UButton")

			if NotNil(uBtn) then
				uBtn.draggable = false
			end
		end
	end

	if self.boxPetFilterList then
		local filterButtons = self.boxPetFilterList:GetAllButtons()

		for i = 0, filterButtons.Length - 1 do
			local filterButton = filterButtons[i]

			if NotNil(filterButton) then
				filterButton.draggable = false
			end
		end
	end
end

function BoxPetComponent:enablePetsDrag()
	for i = 0, 23 do
		local container = self.boxPetNewListContainers[i]

		if NotNil(container) and NotNil(container.content) then
			local uBtn = container.content:GetComponent("UButton")

			if NotNil(uBtn) then
				local data = uBtn.dataFromUList

				uBtn.draggable = data ~= nil and data.isEmpty ~= true and not self.model:isHomePetMode()
			end
		end
	end

	if self.boxPetFilterList then
		local filterButtons = self.boxPetFilterList:GetAllButtons()

		for i = 0, filterButtons.Length - 1 do
			local filterButton = filterButtons[i]

			if NotNil(filterButton) then
				local data = filterButton.dataFromUList

				filterButton.draggable = data ~= nil and data.isEmpty ~= true and not self.model:isHomePetMode()
			end
		end
	end
end

function BoxPetComponent:refreshPetHomeState(button, data)
	local showHome = self.model:isHomePetMode() and data.id ~= nil and not data.isEmpty

	button:TryChangePage("Home", showHome and 1 or 0)

	local objectReference = button:GetComponent("ObjectReference")
	local inHomeUContainer = objectReference and objectReference:GetRefValue("inHomeUContainer")

	if IsNil(inHomeUContainer) then
		return
	end

	if not showHome then
		inHomeUContainer:DestroyContent()

		return
	end

	local function refreshHomeText(widget)
		if IsNil(button) or IsNil(widget) or not self.model:isHomePetMode() then
			return
		end

		local currentData = button.dataFromUList

		if not currentData or not currentData.id or currentData.isEmpty then
			return
		end

		local contentReference = widget:GetComponent("ObjectReference")
		local txtHomeUSDFText = contentReference and contentReference:GetRefValue("txtHomeUSDFText")

		if NotNil(txtHomeUSDFText) then
			txtHomeUSDFText:SetActive(self.ctrl.inReleaseMode == true)

			local textKey = currentData.isInHomeCamp and "PET_MANAGEMENT_HOME_CAMP_PET_STATUS" or "NOT_CAN_REALSE_INHOMELAND"

			ClientTextUtils.setText(txtHomeUSDFText, pg.getGameString(textKey))
		end
	end

	if inHomeUContainer:CheckURLLoaded() then
		refreshHomeText(inHomeUContainer.content)
	else
		inHomeUContainer:LoadDefaultUrlManually(refreshHomeText)
	end
end

function BoxPetComponent:setBoxPetListData(button, index, data, isManual)
	button.name = index + 1
	button.dataFromUList = data
	button.enabledTooltip = false
	button.enabledDraggingClick = false

	self:refreshPetHomeState(button, data)

	local suppressRestoreAni = self:shouldSuppressPetHeadRestoreAni(data)
	local disableAllTweenEffect = button.disableAllTweenEffect == true

	if suppressRestoreAni then
		button.disableAllTweenEffect = true
	end

	button.isSelected = false

	button:TryChangePage("button", 0, suppressRestoreAni)

	local boxId

	if not data.isEmpty then
		boxId = self.model:findBoxIdByPetId(data.id)
	end

	function button.luaPress()
		self:cardPressEvent(button, index, data)

		if boxId then
			self.model:redDot_RecordPetState(data.id)
			self.model:redDot_refreshSlot(boxId, data.id)
		end
	end

	function button.luaHover()
		local isInUse = not data.isEmpty and self:getIsInUse(data) or false

		self:onHover(button, data.isEmpty, isInUse)
	end

	function button.luaUnhover()
		self:onUnHover(button)
	end

	if data.isEmpty then
		button.luaClick = nil

		self:refreshBoxPetGamepadAction(button)

		if suppressRestoreAni then
			button.disableAllTweenEffect = disableAllTweenEffect
		end

		LuaUIUtils.tryClearPetHeadIconInUBUtton(button)

		button.draggable = false

		return
	end

	local isNewPet = self.model:redDot_GetPetState(data.id)

	if boxId then
		self.model:redDot_SetPetRedDot(boxId, data.id, button, isNewPet)
	end

	local shouldSelect = data.id == self.model.curSelectPetId

	if self:canConsumePendingSelectByDrop(data.id) then
		shouldSelect = true
	end

	if shouldSelect then
		button.isSelected = true

		button:TryChangePage("button", 5, suppressRestoreAni)
	end

	if not self.btnFunctionCache then
		self.btnFunctionCache = {}
	end

	self.btnFunctionCache[button] = function(navConfirm)
		if self.model:isHomePetMode() then
			return
		end

		if self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE and not self.ctrl.inReleaseMode and self.ctrl.petWarehouse then
			return
		end

		local isInUse = self:getIsInUse(data)

		if self.ctrl.inReleaseMode and not isInUse and not navConfirm then
			if self.batchReleasePetIds[data.id] then
				self:modifyBatchReleasePetIds(data.id, nil)
				button:TryChangePage("Batch", 3)
				self:refreshEvolveState(button, true, data)
			else
				self:modifyBatchReleasePetIds(data.id, 1)
				button:TryChangePage("Batch", 1)
				self:refreshEvolveState(button, true, data)
			end
		end
	end
	button.luaClick = self.btnFunctionCache[button]

	self:refreshBoxPetGamepadAction(button)

	local objectReference = button:GetComponent("ObjectReference")
	local battleNumUContainer = objectReference:GetRefValue("battleNumUContainer")
	local panelCharListUContainer = objectReference:GetRefValue("panelCharListUContainer")
	local panelCPUContainer = objectReference:GetRefValue("panelCPUContainer")
	local listCharUContainer = objectReference:GetRefValue("listCharUContainer")
	local praiseUWidget = objectReference:GetRefValue("praiseUWidget")
	local superRecommendUContainer = objectReference:GetRefValue("superRecommendUContainer")
	local abilityContentUContainer = objectReference:GetRefValue("abilityContentUContainer")
	local inRacingPetList = self:isInRacingPetList()

	listCharUContainer:LoadDefaultUrlManually()

	local exploreSkillEquipped = listCharUContainer.content:GetComponent("UList")
	local iconInBoxUImage = objectReference:GetRefValue("iconInBoxUImage")
	local sourceStateApplied = self:isSourceDragStateApplied(data.id)

	if sourceStateApplied then
		button:TryChangePage("DragState", 2, suppressRestoreAni)
	else
		button:TryChangePage("DragState", 0, suppressRestoreAni)
	end

	local suppressIconAni = suppressRestoreAni
	local isHomePetMode = self.model:isHomePetMode()
	local extraData = {
		inFilterMode = self.ctrl.inFilterMode,
		isShowIconAni = isManual and not suppressIconAni,
		isHomePetMode = isHomePetMode
	}

	LuaUIUtils.renderPetHead(button, data, extraData)
	button:TryChangePage("isBoss", 0)

	if panelCharListUContainer.content then
		panelCharListUContainer.content.gameObject:SetActiveEx(not inRacingPetList and self.showAllPetCardsElementIconFlag)
	end

	if panelCPUContainer.content then
		panelCPUContainer.content.gameObject:SetActiveEx(not inRacingPetList and not self.showAllPetCardsElementIconFlag)
	end

	self:showFilterLabel(button, data)

	function button.luaBeginDrag()
		if self.ctrl.onMoveDisplay or self.model:isHomePetMode() then
			return
		end

		local useTemporaryStorage = self:shouldUsePetHeadTemporaryStorage()

		if self.view.animation and self.view.animation.isPlaying then
			local clip = self.view.animation.clip

			if clip then
				UIUtils.SampleAnimation(self.view.animation, clip.length, clip.name)
				self.view.animation:Stop()
			end
		end

		if useTemporaryStorage and not self.ctrl.inFilterMode then
			self:storePetHeadTemporaryStorage(button, data, "beginDrag")
		end

		self:beginDrag(button, data)
	end

	function button.luaEndDrag(dropWidget, rayBox)
		local dragData = self.draggingSourceButton == button and self.draggingSourceData or data
		local hasTemporaryStorage = self.temporaryStorageButton == button

		local function clearTemporaryStorage()
			if not hasTemporaryStorage then
				return
			end

			local container = self.temporaryStorageContainer or button.gameObject.transform.parent:GetComponent("UContainer")

			if NotNil(container) then
				container.enableTemporaryStorage = false
			end

			CS.XGUI.Tool.UTemporaryStorage.ManualDestroy()
			self:restorePetHeadAfterTemporaryStorage(container, button)
			self:clearTemporaryStorageButtonNav()
		end

		local isValidDrag = not self.ctrl.onMoveDisplay and self.draggingSourceButton == button and dragData ~= nil and self.draggingPetId == dragData.id

		if not isValidDrag then
			self:clearDraggingInfo()
			clearTemporaryStorage()

			return
		end

		if hasTemporaryStorage then
			self:markSuppressPetHeadRestoreAni(dragData.id)
		end

		self:endDrag(button, dropWidget, rayBox, dragData)
		self:clearDraggingInfo()
		clearTemporaryStorage()
	end

	local isInUse = self:getIsInUse(data)
	local fightPets = self.ctrl.fightPets
	local isRogueMode = fightPets and fightPets.isRogueMode
	local isBossRushMode = fightPets and fightPets.isBossRushMode
	local isNpcDuelMode = fightPets and fightPets.isNpcDuelMode

	function exploreSkillEquipped.luaRenderItem(b, i, d)
		b:TryChangePage("Char", d.index - 1)
		b:TryChangePage("Quality", d.quality)
	end

	local exploreIndexes = {}

	if inRacingPetList then
		local flyLevel = data.exploreSkillIndexLevel and data.exploreSkillIndexLevel[AbilityConst.SPECIFIC_ABILITY_INDEX_GLIDE] or 0

		if flyLevel > 0 then
			exploreIndexes[1] = {
				index = AbilityConst.SPECIFIC_ABILITY_INDEX_GLIDE,
				quality = flyLevel
			}
		end
	else
		for k, v in pairs(self.inExplorePetInfos) do
			if v.id == data.id then
				exploreIndexes[#exploreIndexes + 1] = {
					index = k,
					quality = data.exploreSkillIndexLevel[k]
				}
			end
		end
	end

	if #exploreIndexes > 0 and (inRacingPetList or self.ctrl.inReleaseMode) then
		exploreSkillEquipped.gameObject:SetActiveEx(true)
		exploreSkillEquipped:SetList(exploreIndexes)
	else
		exploreSkillEquipped.gameObject:SetActiveEx(false)
	end

	button.draggable = not self.ctrl.onMoveDisplay and not self.model:isHomePetMode()

	local battleNum = -1
	local fightPetIds

	if isRogueMode then
		fightPetIds = fightPets.rogueBattlePetIds
	else
		fightPetIds = self.inFightPetInfos
	end

	for i, v in pairs(fightPetIds) do
		if v.id == data.id or v == data.id then
			battleNum = i - 1

			break
		end
	end

	if battleNum == -1 then
		if battleNumUContainer:CheckURLLoaded() then
			battleNumUContainer:DestroyContent()
		end
	elseif battleNumUContainer:CheckURLLoaded() then
		battleNumUContainer.content:TryChangePage("number", battleNum)
	else
		battleNumUContainer:LoadDefaultUrlManually(function(widget)
			widget:TryChangePage("number", battleNum)
		end)
	end

	local txtUsedUSDFText = objectReference:GetRefValue("txtUsedUSDFText")

	if txtUsedUSDFText then
		txtUsedUSDFText:SetActive(false)
	end

	local showBoxBanned = false

	if self.ctrl.inReleaseMode then
		if isInUse then
			button:TryChangePage("state", 1)
			button:TryChangePage("Batch", 0)
			self:refreshEvolveState(button, false, data)

			if txtUsedUSDFText then
				txtUsedUSDFText:SetActive(true)
			end

			showBoxBanned = self:displayFavoriteState(button, txtUsedUSDFText, data)
		else
			if self.batchReleasePetIds[data.id] then
				button:TryChangePage("Batch", 1)
				self:refreshEvolveState(button, true, data)
			else
				button:TryChangePage("Batch", 3)
				self:refreshEvolveState(button, true, data)
			end

			LuaUIUtils.setPetHeadBoxBanned(button, false)
		end

		if self.ctrl.inFilterMode then
			local inCurrentBox = self.model:checkBoxContainsPet(self.model:getSelectBoxId(), data.id)

			if isInUse then
				inCurrentBox = false
			end

			iconInBoxUImage.gameObject:SetActiveEx(inCurrentBox)
		else
			iconInBoxUImage.gameObject:SetActiveEx(false)
		end
	else
		button:TryChangePage("Batch", 0)
		self:refreshEvolveState(button, false, data)
		iconInBoxUImage.gameObject:SetActiveEx(false)
		LuaUIUtils.setPetHeadBoxBanned(button, false)
	end

	local showRacingRecommend = inRacingPetList and not self.ctrl:isWorldRacingExplorePage()
	local racingSuperRecommend = showRacingRecommend and data.worldRacingSuperRecommend == 1
	local racingRecommend = showRacingRecommend and not racingSuperRecommend and data.worldRacingRecommend == 1

	if racingSuperRecommend or racingRecommend then
		local iconEvolveUImage = objectReference:GetRefValue("iconEvolveUImage")

		if iconEvolveUImage and iconEvolveUImage.gameObject.activeSelf then
			if self.ctrl.inFilterMode then
				iconEvolveUImage.gameObject:SetActiveEx(false)
			else
				racingSuperRecommend = false
				racingRecommend = false
			end
		end
	end

	if superRecommendUContainer then
		superRecommendUContainer:SetActive(racingSuperRecommend)

		if racingSuperRecommend then
			superRecommendUContainer:LoadDefaultUrlManually()
		end
	end

	if praiseUWidget then
		if inRacingPetList then
			praiseUWidget:SetActive(racingRecommend or racingSuperRecommend and superRecommendUContainer == nil)
		elseif self.ctrl.intelligentFilterId and self.model.intelligentRecommendTemplateIds then
			praiseUWidget:SetActive(self.model.intelligentRecommendTemplateIds[data.templateId] == true)
		elseif isRogueMode and not self.ctrl.inReleaseMode then
			praiseUWidget:SetActive(fightPets:checkRogueElementMatch(data.elementNames))
		elseif isBossRushMode and not self.ctrl.inReleaseMode then
			praiseUWidget:SetActive(fightPets:checkBossRushElementMatch(data.elementNames))
		elseif isNpcDuelMode and not self.ctrl.inReleaseMode then
			praiseUWidget:SetActive(fightPets:checkNpcDuelElementMatch(data.elementNames))
		else
			praiseUWidget:SetActive(false)
		end
	end

	if abilityContentUContainer then
		local pData = inRacingPetList and PetData[data.templateId] or nil
		local exploreAbilityDefine

		if pData then
			local _, define = self.model:getVisibleExploreAbilityType(data.templateId)

			exploreAbilityDefine = define
		end

		abilityContentUContainer:SetActive(exploreAbilityDefine ~= nil)

		if exploreAbilityDefine then
			abilityContentUContainer:LoadDefaultUrlManually()

			local abilityComponent = abilityContentUContainer.content and abilityContentUContainer.content:GetComponent("UComponent")

			if abilityComponent then
				local iconUImage = abilityComponent.icon

				if iconUImage then
					local exploreAbilityList = pData.exploreAbilityList
					local exploreAbilityId = exploreAbilityList and exploreAbilityList[1]

					iconUImage.url = exploreAbilityId and LuaUIUtils.getSkillIconByAbilityId(exploreAbilityId) or ""
				end

				ClientTextUtils.setTextWithId(abilityComponent.title, exploreAbilityDefine.exploreAbilityName)
			end
		end
	end

	local objectReference = button:GetComponent("ObjectReference")
	local iconFavUContainer = objectReference:GetRefValue("iconFavUContainer")
	local petInfo = data.id and pg.me:getPetInfo(data.id)
	local favoriteType = petInfo and petInfo.favoriteType or 0

	if favoriteType > 0 then
		local iconFavContObjRef = iconFavUContainer.content:GetComponent("ObjectReference")

		if not iconFavUContainer.content.gameObject.activeSelf then
			iconFavUContainer.content.gameObject:SetActiveEx(true)

			local iconFavUImage = iconFavContObjRef:GetRefValue("iconFavUImage")

			iconFavUImage.renderOpacity = 1
		end

		local iconUImage = iconFavContObjRef:GetRefValue("iconUImage")

		if iconUImage then
			iconUImage.url = PetManagementUtils.getPetFavoriteIconUrl(favoriteType)
		end
	else
		iconFavUContainer.content.gameObject:SetActiveEx(false)
	end

	if suppressRestoreAni then
		button.disableAllTweenEffect = disableAllTweenEffect
	end
end

function BoxPetComponent:refreshBoxPetsActions()
	for i = 0, #(self.boxPetNewListContainers or {}) do
		local container = self.boxPetNewListContainers[i]
		local uBtn = container and container.content and container.content:GetComponent("UButton")

		if NotNil(uBtn) then
			self:refreshBoxPetGamepadAction(uBtn)
		end
	end

	if not self.boxPetFilterList then
		return
	end

	local buttons = self.boxPetFilterList:GetAllButtons()

	if not buttons then
		return
	end

	for i = 0, buttons.Length - 1 do
		self:refreshBoxPetGamepadAction(buttons[i])
	end
end

function BoxPetComponent:refreshBoxPetGamepadAction(button)
	if IsNil(button) then
		return
	end

	local data = button.dataFromUList

	if not self.ctrl or self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE or not data or data.isEmpty then
		button:RemoveLuaGamepadHotkey()

		return
	end

	button:SetGamepadAction(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth, nil, function()
		if self.ctrl.inReleaseMode then
			if button.luaClick then
				button.luaClick()
			end
		elseif button.luaPress then
			button.luaPress()
		end

		return false
	end)
	button:SetHotkeyActiveOnlyInCurrentItem(true)
end

function BoxPetComponent:clearAllTempStorageGo()
	return
end

function BoxPetComponent:clearData()
	self.boxLockHintHideFlag = nil
	self.autoFilterBtn = nil
end

function BoxPetComponent:renderExploreSkillPoints(button, data)
	if not self.showAllPetCardsElementIconFlag then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local panelCharListUContainer = objectReference:GetRefValue("panelCharListUContainer")

	panelCharListUContainer:LoadDefaultUrlManually()

	local listCharUList = panelCharListUContainer.content:GetComponent("UList")
	local tempExploreLevelAllData = {}

	for k, v in pairs(data.exploreSkillsLevel) do
		local temp = {
			exploreName = k,
			exploreLevel = v
		}

		tempExploreLevelAllData[#tempExploreLevelAllData + 1] = temp
	end

	function listCharUList.luaRenderItem(button1, _, data1)
		button1:TryChangePage("PetChar", AbilityConst.SPECIFIC_ABILITY_NAME_2_INDEX[data1.exploreName])
		button1:TryChangePage("quality", data1.exploreLevel - 1)
	end

	listCharUList:SetList(tempExploreLevelAllData)
end

function BoxPetComponent:isWarehousePetDragActive()
	local warehouse = self.ctrl and self.ctrl.petWarehouse

	if not warehouse then
		return false
	end

	return warehouse._draggingPetId ~= nil
end

function BoxPetComponent:cardPressEvent(button, index, data)
	if self:isWarehousePetDragActive() then
		return
	end

	self:clearPendingSelectByDrop()
	self:refreshPetSelectedStatus(index, button, data)
	self:onHover(button, data.isEmpty)

	if self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE and not self.ctrl.inReleaseMode and self.ctrl.petWarehouse and data and data.id and not data.isEmpty then
		self:scheduleWarehouseBagTip(button, data.id)
	end
end

function BoxPetComponent:scheduleWarehouseBagTip(button, petId)
	self._warehouseTipPressToken = (self._warehouseTipPressToken or 0) + 1

	local token = self._warehouseTipPressToken

	self:startFrameTimer(function()
		if token ~= self._warehouseTipPressToken or self.ctrl.isDragging then
			return
		end

		if self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE or self.ctrl.inReleaseMode then
			return
		end

		if self.ctrl.petWarehouse then
			self.ctrl.petWarehouse:selectPet(petId, button, PetWarehouseConst.DOMAIN.BAG)
		end
	end, 2)
end

function BoxPetComponent:closeAllPetTooltips()
	local function closeBtn(uBtn)
		if IsNil(uBtn) then
			return
		end

		uBtn.enabledTooltip = false

		function uBtn.luaRenderTooltip(btn, popup)
			if NotNil(popup) and NotNil(popup.gameObject) then
				popup.gameObject:SetActiveEx(false)
			end

			btn:CloseTooltip()
		end

		uBtn:CloseTooltip()
	end

	if self.boxPetNewListContainers then
		for i = 0, #self.boxPetNewListContainers do
			local container = self.boxPetNewListContainers[i]

			if NotNil(container) and NotNil(container.content) then
				closeBtn(container.content:GetComponent("UButton"))
			end
		end
	end

	if self.boxPetFilterList then
		local buttons = self.boxPetFilterList:GetAllButtons()

		if buttons then
			for i = 0, buttons.Length - 1 do
				closeBtn(buttons[i])
			end
		end
	end
end

function BoxPetComponent:clearAllSelectFrames()
	if self.ctrl.inFilterMode then
		local boxButtons = self.boxPetFilterList:GetAllButtons()

		for i = 0, boxButtons.Length - 1 do
			boxButtons[i]:TryChangePage("button", 0)

			boxButtons[i].isSelected = false
		end
	else
		for i = 0, #self.boxPetNewListContainers do
			local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

			uBtn:TryChangePage("button", 0)

			uBtn.isSelected = false
		end
	end
end

function BoxPetComponent:refreshPetSelectedStatus(index, selectedButton, selectedData)
	if self:isWarehousePetDragActive() then
		self:selectItemIfExists(self.ctrl.petWarehouse._bagSelectPetIdBeforeDrag)

		return
	end

	local buttons, lastIndex

	if self.ctrl.inFilterMode then
		buttons = self.boxPetFilterList:GetAllButtons()
		lastIndex = buttons.Length - 1
	else
		buttons = {}

		for i = 0, #self.boxPetNewListContainers do
			local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

			buttons[i] = uBtn
		end

		lastIndex = #buttons
	end

	local selectData = selectedData
	local selectButton = selectedButton

	if self.ctrl.inFilterMode and selectData == nil and index ~= nil then
		selectData = self.petInfos and self.petInfos[index + 1]

		local _, btn = self.boxPetFilterList:TryGetChildAt(index)

		selectButton = btn
	end

	local findIndex

	self._playDragButtons = self._playDragButtons or {}

	for i = 0, lastIndex do
		if not self._playDragButtons[i] then
			buttons[i]:TryChangePage("button", 0)
		end

		local isTarget

		if selectButton then
			isTarget = buttons[i] == selectButton
		elseif index ~= nil then
			isTarget = i == index
		end

		if isTarget then
			buttons[i]:TryChangePage("button", 5)

			buttons[i].isSelected = true
			findIndex = i
			self._playDragButtons[i] = buttons[i]

			self.ctrl:startTimer(function()
				self._playDragButtons[i] = nil
			end, 1)
		else
			buttons[i].isSelected = false
		end
	end

	local dataToShow = selectData

	if not dataToShow and findIndex and buttons[findIndex] then
		dataToShow = buttons[findIndex].dataFromUList
	end

	if not dataToShow then
		return
	end

	if self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE then
		self.ctrl:showPetInfo(dataToShow)
	end

	if dataToShow.id then
		self.model:setCurSelectPetId(dataToShow.id)
	else
		self.model:setCurSelectPetId()
	end

	self.ctrl.fightPets:selectItemIfExists(self.model.curSelectPetId)
	self.ctrl.explorePets:selectItemIfExists(self.model.curSelectPetId)
end

function BoxPetComponent:selectItemIfExists(petId)
	if self:isWarehousePetDragActive() then
		petId = self.ctrl.petWarehouse._bagSelectPetIdBeforeDrag
	end

	local buttons, lastIndex

	if self.ctrl.inFilterMode then
		buttons = self.boxPetFilterList:GetAllButtons()

		if buttons.Length <= 0 then
			return
		end

		lastIndex = buttons.Length - 1
	else
		buttons = {}

		for i = 0, #self.boxPetNewListContainers do
			local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

			buttons[i] = uBtn
		end

		lastIndex = #buttons
	end

	for i = 0, lastIndex do
		local btnData = buttons[i].dataFromUList

		if btnData and btnData.id and btnData.id == petId then
			buttons[i]:TryChangePage("button", 5)

			buttons[i].isSelected = true
		else
			buttons[i]:TryChangePage("button", 0)

			buttons[i].isSelected = false
		end
	end
end

function BoxPetComponent:markPendingSelectByDrop(petId, targetBoxIndex, targetSlotIndex)
	if not petId or not targetBoxIndex or not targetSlotIndex then
		return
	end

	self:clearPendingSelectByDrop()

	self._pendingSelectPetId = petId
	self._pendingSelectTargetBoxIndex = targetBoxIndex
	self._pendingSelectTargetSlotIndex = targetSlotIndex
	self._pendingSelectClearTimer = self.ctrl:startTimer(function()
		self:clearPendingSelectByDrop(petId, true)
	end, 3)
end

function BoxPetComponent:clearPendingSelectByDrop(petId, skipKillTimer)
	if petId and self._pendingSelectPetId ~= petId then
		return
	end

	self._pendingSelectPetId = nil
	self._pendingSelectTargetBoxIndex = nil
	self._pendingSelectTargetSlotIndex = nil

	local timerId = self._pendingSelectClearTimer

	self._pendingSelectClearTimer = nil

	if timerId and not skipKillTimer and self.ctrl then
		self.ctrl:killTimer(timerId)
	end
end

function BoxPetComponent:canConsumePendingSelectByDrop(petId)
	if not petId or petId ~= self._pendingSelectPetId then
		return false
	end

	local targetBoxIndex = self._pendingSelectTargetBoxIndex
	local targetSlotIndex = self._pendingSelectTargetSlotIndex

	if not targetBoxIndex or not targetSlotIndex then
		return false
	end

	if self.model:findPetIdByBoxIndexAndSlotIndex(targetBoxIndex, targetSlotIndex) ~= petId then
		return false
	end

	return true
end

function BoxPetComponent:tryConsumePendingSelectByDrop()
	local petId = self._pendingSelectPetId

	if not petId or not self.petInfos then
		return false
	end

	if not self:canConsumePendingSelectByDrop(petId) then
		return false
	end

	for i = 1, #self.petInfos do
		local data = self.petInfos[i]

		if data and data.id == petId then
			local index = i - 1

			if self.ctrl.inFilterMode then
				if not self.petInfos or not self.petInfos[index + 1] then
					return false
				end
			elseif not self.boxPetNewListContainers[index] or not self.boxPetNewListContainers[index].content then
				return false
			end

			self:clearPendingSelectByDrop(petId)
			self:refreshPetSelectedStatus(index)

			return true
		end
	end

	return false
end

function BoxPetComponent:refreshBoxSelector()
	local petBoxMap = pg.me.petBoxMap
	local boxInfos = self.model:getBoxInfos()
	local selectBoxId = self.model:getSelectBoxId()
	local isHomePetMode = self.model:isHomePetMode()
	local objRef = self.boxSelector:GetComponent("ObjectReference")
	local boxName = objRef:GetRefValue("boxName")
	local lockUButton = objRef:GetRefValue("lockUButton")
	local txtNameUText = objRef:GetRefValue("txtNameUText")
	local customName = petBoxMap[selectBoxId].customName
	local count = petBoxMap[selectBoxId].count
	local slotCount = petBoxMap[selectBoxId].slotCount
	local boxInfo = petBoxMap[selectBoxId]
	local isManualLocked = boxInfo:isManualLocked()
	local countStr = string.format("(%d/%d)", count, slotCount)
	local boxNameContent = ""

	if isHomePetMode then
		boxNameContent = string.format("%s (%d)", pg.getGameString("PET_MANAGEMENT_HOME_WAREHOUSE"), self.model:countHomePets())
	elseif customName and customName ~= "" then
		boxNameContent = string.format("%s %s", customName, countStr)
	else
		boxNameContent = string.format("%s %s %s", pg.getGameString("DEFAULT_PET_BOX_NAME"), selectBoxId, countStr)
	end

	ClientTextUtils.setText(boxName, boxNameContent)
	ClientTextUtils.setText(txtNameUText, boxNameContent)

	local displayCode = PetManagementDataHelper.BoxLockState.UNLOCKED

	if not isHomePetMode then
		displayCode = PetManagementUtils.getBoxLockState(boxInfo)

		if displayCode == PetManagementDataHelper.BoxLockState.TEMP_LOCKED then
			displayCode = PetManagementDataHelper.BoxLockState.LOCKED
		end
	end

	lockUButton:TryChangePage("Lock", displayCode)

	if self.ctrl.inFilterMode then
		self.ctrl:showBoxLock(PetManagementDataHelper.BoxLockState.UNLOCKED, true)
	else
		self.ctrl:showBoxLock(displayCode)

		if not self.ctrl.inReleaseMode then
			local preLockStatusCode = self.model:getBoxManualRecordStatusByIndex(selectBoxId)
			local manualCode = isManualLocked and 1 or 0

			if preLockStatusCode ~= manualCode then
				if manualCode == 1 then
					self.lockAnimation:Play("VX_Pb_PetManage_PetList_Lock")
				end

				self.model:setBoxManualRecordStatusByIndex(selectBoxId, manualCode)
			end
		end
	end

	function lockUButton.luaClick()
		if self.model:isHomePetMode() then
			return
		end

		if self.ctrl.onMoveDisplay then
			return
		end

		self:boxLockBtnFunction(selectBoxId, true)
	end

	if self.ctrl then
		-- block empty
	end

	function self.boxSelector.luaOnSelectorClose()
		self.boxSelector:TryChangePage("expand", 0)
	end

	PetManagementDataHelper.setBoxSelectorLuaRenderPopup(self.boxSelector, {
		selectItemOnFinishRender = true,
		boxInfos = boxInfos,
		boxNameContent = boxNameContent,
		selectBoxId = selectBoxId,
		onRenderPopup = function(popup, list)
			self:_onBoxSelectorLuaRenderPopup(popup, list)
		end,
		canInteract = function()
			return not self.ctrl.onMoveDisplay
		end,
		renderItemLockState = function(button, _, boxIdx)
			button:TryChangePage("Lock", PetManagementUtils.getBoxLockState(petBoxMap[boxIdx]))
		end,
		onSelectBox = function(boxIdx)
			self:switchBoxToIdx(boxIdx, true)
		end,
		onLockBox = function(boxIdx)
			self:boxLockBtnFunction(boxIdx)
		end,
		onRenameBox = function(boxIdx)
			self:_onRenameBox(boxIdx)
		end,
		onRenderItemExtra = function(boxIdx, button)
			self.model:redDot_SetBoxRedDot(boxIdx, button)
		end
	})
	self.boxSelector:SetOptions(boxInfos)
	self:refreshHomeSelectorState()

	if self.boxSelector.isPopup then
		self:refreshLockStatusWhenPopup()
	end

	if self.ctrl.warehouseLeftBatch then
		self.ctrl.warehouseLeftBatch:refresh()
	end
end

function BoxPetComponent:refreshHomeSelectorState()
	if IsNil(self.boxSelector) then
		return
	end

	local isHomePetMode = self.model:isHomePetMode()

	self.boxSelector:TryChangePage("Home", isHomePetMode and 1 or 0)

	if isHomePetMode then
		self.root:TryChangePage("State", self.homePetFilterActive and 1 or 0)
	end

	local warehouseBatch = self.ctrl.petWarehouse and self.ctrl.petWarehouse.batch
	local hideBoxManagement = isHomePetMode or self.ctrl.inFilterMode or self.ctrl:isWorldRacingExplorePage() or warehouseBatch and warehouseBatch.active or false

	self.view.btnBoxUButton:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, hideBoxManagement)
	self.view.btnBox2UButton:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, hideBoxManagement)

	local showBoxManagement = not isHomePetMode and not self.ctrl.inFilterMode and not self.ctrl:isWorldRacingExplorePage()

	LuaUIUtils.setUIVisible(self.view.btnBoxUButton, showBoxManagement)
	LuaUIUtils.setUIVisible(self.view.btnBox2UButton, showBoxManagement)
	self.ctrl:refreshMultiSelectBtnForbidden()
end

function BoxPetComponent:refreshSingleBoxSelectorItemName(index, newName)
	local btn = self:_getBoxSelectorRowButton(index)

	if IsNil(btn) then
		return
	end

	local objectReference1 = btn:GetComponent("ObjectReference")

	if IsNil(objectReference1) then
		return
	end

	local nameUText = objectReference1:GetRefValue("nameUText")

	ClientTextUtils.setText(nameUText, newName)
end

function BoxPetComponent:_getBoxSelectorRowButton(boxIdx)
	local popupInst = self.boxSelector:GetPopupInstance()

	if IsNil(popupInst) then
		return nil
	end

	local objectReference = popupInst:GetComponent("ObjectReference")

	if IsNil(objectReference) then
		return nil
	end

	local listUList = objectReference:GetRefValue("listUList")

	if IsNil(listUList) then
		return nil
	end

	local petBoxMapSequence = pg.me.petBoxMap.sequence:getRawTable()
	local childIndex

	for i = 1, #petBoxMapSequence do
		if petBoxMapSequence[i] == boxIdx then
			childIndex = i - 1

			break
		end
	end

	if not childIndex then
		return nil
	end

	local _, btn = listUList:TryGetChildAt(childIndex)

	return btn
end

function BoxPetComponent:_restoreBoxSelectorFocus(snapshot, boxIdx)
	self.boxSelector:InteractPopup(true)
	self.ctrl:startFrameTimer(function()
		if not snapshot then
			return
		end

		local newRowButton = self:_getBoxSelectorRowButton(boxIdx)

		if not IsNil(newRowButton) then
			snapshot:SetTopEnteredGroupAndTarget(newRowButton)
			snapshot:SetTopSuppressSelectOnRestore(false)
		end

		pg.global.navMgr:RestoreFocusStackSnapshot(snapshot)
	end, 1)
end

function BoxPetComponent:switchBoxToIdx(index, isManual)
	if self.ctrl.inFilterMode and not isManual then
		return
	end

	if self.draggingPetId and not self:prepareDraggingPetTemporaryStorageForBoxSwitch() then
		return
	end

	local exitedHomePetMode = self:exitHomePetMode(true)

	self:clearCurBoxPetNewTags()

	local navMgr = pg.global.navMgr
	local currentFocusedGroupName = navMgr and navMgr.CurrentFocusedGroupName
	local navSwitchFocusSlot

	if not exitedHomePetMode then
		navSwitchFocusSlot = self:beginNavSwitchBoxFocusKeep()
	end

	self.model:setSelectBoxId(index)
	self.ctrl:onBoxMapSequenceChanged(isManual)

	local autoSelectFocusedPet = self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE

	self:endNavSwitchBoxFocusKeep(navSwitchFocusSlot, autoSelectFocusedPet)
	self.boxSelector:ClosePopup()

	if not exitedHomePetMode and navSwitchFocusSlot == nil and navMgr and currentFocusedGroupName == "ComPetList" and pg.game.input:isUsingGamepad() then
		local currentFocusedUContent = navMgr.CurrentFocusedUContent

		if currentFocusedUContent and not navMgr.IsDragging then
			currentFocusedUContent:OnClickSimulate(true)
		end
	end

	if exitedHomePetMode then
		self:refreshCurrentBoxPetSelection()
	end

	self.view.animationWidget:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
end

function BoxPetComponent:getIndexOfSelectedBoxIdInSequence()
	local petBoxMapSequence = pg.me.petBoxMap.sequence:getRawTable()
	local boxId = self.model:getSelectBoxId()
	local indexOfSequence

	for i = 1, #petBoxMapSequence do
		if boxId == petBoxMapSequence[i] then
			indexOfSequence = i

			return petBoxMapSequence, indexOfSequence
		end
	end

	return petBoxMapSequence, indexOfSequence
end

function BoxPetComponent:switchBoxPages(isPre, isManual)
	if self.ctrl.inFilterMode then
		return
	end

	local sequence, indexOfSequence = self:getIndexOfSelectedBoxIdInSequence()

	if not indexOfSequence then
		return
	end

	local index = isPre and indexOfSequence - 1 or indexOfSequence + 1

	if index < 1 then
		index = #sequence
	end

	if index > #sequence then
		index = 1
	end

	self:switchBoxToIdx(sequence[index], isManual)
end

function BoxPetComponent:canShowDragReleaseArea()
	if not self.ctrl then
		return false
	end

	if self:isReleaseForbidden() then
		return false
	end

	if self.ctrl.inReleaseMode then
		return self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE
	end

	return true
end

function BoxPetComponent:refreshDragReleaseCompanions()
	if self.ctrl and self.ctrl.warehouseLeftBatch then
		self.ctrl.warehouseLeftBatch:refreshVisibility()
	end
end

function BoxPetComponent:invalidateDragReleaseSession()
	self._dragReleaseSession = (self._dragReleaseSession or 0) + 1
	self._dragReleaseToken = nil
end

function BoxPetComponent:isDragReleaseContextValid(token)
	if self._destroyed or not self.ctrl or token == nil then
		return false
	end

	if token.id ~= self._dragReleaseSession then
		return false
	end

	if token.player ~= pg.me or token.player and token.player.destroyed then
		return false
	end

	if token.page ~= self.ctrl.currentPage then
		return false
	end

	if self:isReleaseForbidden() then
		return false
	end

	return true
end

function BoxPetComponent:activeDragReleaseArea(active)
	active = active and self:canShowDragReleaseArea()

	local objectReference = self.dragReleaseUWidget:GetComponent("ObjectReference")

	if objectReference then
		self.dragAreaUButton = objectReference:GetRefValue("dragAreaUButton")
	end

	if active then
		self.dragReleaseUWidget.gameObject:SetActiveEx(true)
		self.dragAreaUButton.gameObject:SetActiveEx(true)
		self.root:TryChangePage("StateDel", 1)
		self.dragAreaUButton:TryChangePage("StateDel", 1)

		function self.dragAreaUButton.luaHover()
			if self.draggingPetId ~= nil then
				self.root:TryChangePage("StateDel", 2)
				self.dragAreaUButton:TryChangePage("StateDel", 2)
			end
		end

		function self.dragAreaUButton.luaUnhover()
			if self.draggingPetId ~= nil then
				self.root:TryChangePage("StateDel", 1)
				self.dragAreaUButton:TryChangePage("StateDel", 1)
			end
		end

		function self.dragAreaUButton.luaClick()
			if self.draggingPetId == nil then
				return
			end

			self:tryReleaseDraggingPet()
			pg.global.navMgr:CancelNavDrag()
		end

		self:refreshDragReleaseCompanions()
	else
		if self.dragAreaUButton then
			self.dragAreaUButton.luaHover = nil
			self.dragAreaUButton.luaUnhover = nil
			self.dragAreaUButton.luaClick = nil

			self.dragAreaUButton:TryChangePage("StateDel", 0)
			self.dragAreaUButton.gameObject:SetActiveEx(false)
		end

		self.root:TryChangePage("StateDel", 0)
		self.dragReleaseUWidget.gameObject:SetActiveEx(false)
		self:refreshDragReleaseCompanions()
	end
end

function BoxPetComponent:getStableButtonPage(button)
	if IsNil(button) then
		return BUTTON_PAGE_NORMAL
	end

	local _, curPage = button:TryGetCurrentPage("button")

	if button.isSelected == true or curPage == BUTTON_PAGE_SELECTED then
		return BUTTON_PAGE_SELECTED
	end

	return BUTTON_PAGE_NORMAL
end

function BoxPetComponent:stopButtonAnimation(button)
	if IsNil(button) then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")

	if IsNil(objectReference) then
		return
	end

	local btnAnimation = objectReference:GetRefValue("btnAnimation")

	if IsNil(btnAnimation) or not btnAnimation.isPlaying then
		return
	end

	btnAnimation:Stop()
end

function BoxPetComponent:resetButtonAnimationTransform(button)
	if IsNil(button) or IsNil(button.gameObject) then
		return
	end

	local rootTransform = button.gameObject.transform

	if IsNil(rootTransform) then
		return
	end

	for _, path in ipairs(PET_HEAD_ANIMATION_SCALE_RESET_PATHS) do
		local transform = rootTransform:Find(path)

		if NotNil(transform) then
			transform.localScale = Vector3(1, 1, 1)
		end
	end

	local normalTransform = rootTransform:Find("Normal")

	if NotNil(normalTransform) then
		local normalRectTransform = normalTransform:GetComponent("RectTransform")

		if NotNil(normalRectTransform) then
			local anchoredPosition = normalRectTransform.anchoredPosition

			normalRectTransform.anchoredPosition = Vector2(anchoredPosition.x, PET_HEAD_NORMAL_ANCHORED_Y)
		end
	end

	local addonTransform = rootTransform:Find("Addon")

	if NotNil(addonTransform) then
		local addonRectTransform = addonTransform:GetComponent("RectTransform")

		if NotNil(addonRectTransform) then
			addonRectTransform.sizeDelta = Vector2(PET_HEAD_ADDON_SIZE, PET_HEAD_ADDON_SIZE)
		end
	end
end

function BoxPetComponent:applyButtonDragVisualState(button, dragStatePage)
	if IsNil(button) then
		return
	end

	self:stopButtonAnimation(button)
	self:resetButtonAnimationTransform(button)

	local buttonPage = self:getStableButtonPage(button)
	local disableAllTweenEffect = button.disableAllTweenEffect == true

	button.disableAllTweenEffect = true

	button:TryChangePage("button", buttonPage, true)
	button:TryChangePage("DragState", dragStatePage, true)

	button.disableAllTweenEffect = disableAllTweenEffect
end

function BoxPetComponent:isDropOnSourceButton(targetBoxIndex, targetSlotIndex, petId)
	if targetBoxIndex == nil or targetSlotIndex == nil or petId == nil then
		return false
	end

	if self.draggingSourceBoxIndex ~= targetBoxIndex then
		return false
	end

	if self.draggingSourceSlotIndex ~= targetSlotIndex then
		return false
	end

	if self.draggingSourcePetId ~= petId then
		return false
	end

	return true
end

function BoxPetComponent:restoreSourceButtonAfterDragCancel(button, data)
	if IsNil(button) then
		return
	end

	local token = (self._boxPetSelfDropRestoreToken or 0) + 1

	self._boxPetSelfDropRestoreToken = token

	local petId = data and data.id

	local function restore()
		if self._boxPetSelfDropRestoreToken ~= token then
			return
		end

		if IsNil(button) then
			return
		end

		local buttonData = button.dataFromUList

		if petId ~= nil and (buttonData == nil or buttonData.id ~= petId) then
			return
		end

		self:applyButtonDragVisualState(button, DRAG_STATE_NORMAL)
	end

	restore()

	if self.ctrl then
		self.ctrl:startFrameTimer(restore, 1)
		self.ctrl:startFrameTimer(restore, 2)
	end

	self:tryOpenWarehouseBagTipAfterCancelDrag(button, data)
end

function BoxPetComponent:tryOpenWarehouseBagTipAfterCancelDrag(button, data)
	if not self.ctrl then
		return
	end

	if self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE then
		return
	end

	if self.ctrl.inReleaseMode then
		return
	end

	if not data or not data.id or data.isEmpty then
		return
	end

	if not self.ctrl.petWarehouse then
		return
	end

	self:scheduleWarehouseBagTip(button, data.id)
end

function BoxPetComponent:restorePetHeadAfterTemporaryStorage(container, fallbackButton)
	local button = fallbackButton

	if NotNil(container) and NotNil(container.content) then
		local contentButton = container.content:GetComponent("UButton")

		if NotNil(contentButton) then
			button = contentButton
		end
	end

	self:applyButtonDragVisualState(button, DRAG_STATE_NORMAL)
end

function BoxPetComponent:isSourceDragStateApplied(petId)
	return petId ~= nil and self.draggingPetId == petId and self._boxPetSourceDragStatePetId == petId
end

function BoxPetComponent:beginDrag(button, data)
	self._warehouseTipPressToken = (self._warehouseTipPressToken or 0) + 1

	self:closeAllPetTooltips()

	if self.ctrl.petWarehouse then
		self.ctrl.petWarehouse:clearPetSelection()
	end

	self.ctrl:setIsDragging(true)

	button.replicaWidget.name = button.name
	button.replicaWidget.gameObject.transform.localScale = Vector3(1.25, 1.25, 1.25)

	local sourceSlotIndex = self:getBoxPetSlotIndexByButton(button)

	self.draggingPetId = data.id
	self._boxPetTraceVisualPetId = data.id
	self._boxPetSelfDropRestoreToken = (self._boxPetSelfDropRestoreToken or 0) + 1
	self.draggingSourceButton = button
	self.draggingSourceData = data
	self.draggingSourceBoxIndex = self.model:getSelectBoxId()
	self.draggingSourceSlotIndex = sourceSlotIndex ~= nil and sourceSlotIndex + 1 or tonumber(button.name)
	self.draggingSourcePetId = data.id
	self._boxPetSourceDragStatePetId = nil
	self._suppressPetHeadRestoreAniPetId = nil
	self._suppressPetHeadRestoreAniUntil = nil
	self._boxPetReplicaDragToken = (self._boxPetReplicaDragToken or 0) + 1

	local replicaDragToken = self._boxPetReplicaDragToken

	if pg.game.input:isUsingGamepad() then
		self._navDraggingFocusSlot = sourceSlotIndex
	end

	self.ctrl.draggingReplicaWidget = button.replicaWidget
	self.ctrl.draggingReplicaWidgetType = self.ctrl.DRAGGING_REPLICA_WIDGET.PET_BOX_CARD
	self.ctrl.boxIdRecord = self.draggingSourceBoxIndex

	local objectReference = button.replicaWidget:GetComponent("ObjectReference")
	local replicaFrameReady = false
	local replicaIconReady = data.isEmpty == true
	local replicaIconUImage
	local replicaBgselect01UImage = objectReference:GetRefValue("bgselect01UImage")
	local replicaFrameSelectUImage = objectReference:GetRefValue("frameSelectUImage")

	local function setReplicaPendingVisualsOpacity(opacity)
		if NotNil(replicaIconUImage) then
			replicaIconUImage.renderOpacity = opacity
		end

		if NotNil(replicaBgselect01UImage) then
			replicaBgselect01UImage.renderOpacity = opacity
		end

		if NotNil(replicaFrameSelectUImage) then
			replicaFrameSelectUImage.renderOpacity = opacity
		end
	end

	button.replicaWidget.renderOpacity = 0

	setReplicaPendingVisualsOpacity(0)

	local function showReplicaWidgetDragState()
		if not replicaFrameReady or not replicaIconReady then
			return
		end

		if self._boxPetReplicaDragToken ~= replicaDragToken then
			return
		end

		if self.draggingPetId ~= data.id then
			return
		end

		if IsNil(button) or IsNil(button.replicaWidget) then
			return
		end

		if self._boxPetSourceDragStatePetId ~= data.id then
			self:applyButtonDragVisualState(button, DRAG_STATE_SOURCE)

			self._boxPetSourceDragStatePetId = data.id
		end

		setReplicaPendingVisualsOpacity(1)

		button.replicaWidget.renderOpacity = 1
	end

	self.ctrl:startFrameTimer(function()
		replicaFrameReady = true

		showReplicaWidgetDragState()
	end, 1)

	if not data.isEmpty then
		replicaIconUImage = objectReference:GetRefValue("iconUImage")

		if NotNil(replicaIconUImage) then
			local iconUrl = LuaUIUtils.getPetIcon(data.iconName, LuaUIUtils.PET_ICON, data.label, data.gender)

			replicaIconUImage.renderOpacity = 0
			replicaIconUImage.url = nil

			replicaIconUImage:SetUrlWithCallback(iconUrl, function()
				replicaIconReady = true

				showReplicaWidgetDragState()
			end)
		else
			replicaIconReady = true
		end
	end

	self:prepareDragBatchReleasePetIds(data.id)

	local dragBatchReleasePetIds = self:getDragBatchReleasePetIds(data.id)

	self.batchCount = 0

	local extendPetIds = {}

	for petId, order in pairs(dragBatchReleasePetIds) do
		self.batchCount = self.batchCount + 1

		if petId ~= data.id then
			table.insert(extendPetIds, petId)
		end
	end

	table.sort(extendPetIds, function(a, b)
		return a < b
	end)

	local url = AddressDataConst.TOPLOGO_COMP_RES_PET_HEAD

	button:AddReplicaWidgetExtendLoadCont(url, function(extendUWidget)
		if self._boxPetReplicaDragToken ~= replicaDragToken or self.draggingPetId ~= data.id then
			return
		end

		if extendUWidget then
			local root = extendUWidget.gameObject.transform
			local objectReference = root:GetComponent("ObjectReference")
			local DragIntoBoxCell3 = objectReference:GetRefValue("DragIntoBoxCell3")
			local DragIntoBoxCell2 = objectReference:GetRefValue("dragIntoBoxCell2")
			local progressUProgress = objectReference:GetRefValue("progressUProgress")

			extendUWidget.gameObject:SetActiveEx(true)

			self.dragProgressUProgress = progressUProgress

			self:refreshOnDragPro(0)

			if self.batchCount == 0 or not self.ctrl.inReleaseMode then
				DragIntoBoxCell2:SetActive(false)
				DragIntoBoxCell3:SetActive(false)
			else
				local intoBoxCellList = {
					DragIntoBoxCell2,
					DragIntoBoxCell3
				}

				for order = 1, #intoBoxCellList do
					local subPetId = extendPetIds[order]
					local subPetInfo = subPetId and pg.me and pg.me:getPetInfo(subPetId)

					if subPetInfo then
						intoBoxCellList[order]:SetActive(order <= self.batchCount - 1)

						if order <= self.batchCount - 1 then
							local subObjectReference = intoBoxCellList[order]:GetComponent("ObjectReference")
							local iconUImage = subObjectReference:GetRefValue("iconUImage")
							local iconName = self.model:getPetIconName(subPetInfo)

							iconUImage:SetUrlWithCallback(LuaUIUtils.getPetIcon(iconName, LuaUIUtils.PET_ICON, subPetInfo.label, subPetInfo.gender), nil)
						end
					else
						intoBoxCellList[order]:SetActive(false)
					end
				end
			end
		end
	end)

	if self:canShowDragReleaseArea() then
		self:activeDragReleaseArea(true)

		if self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE then
			self.ctrl.petDetails:showRightPanel(false)
			self.ctrl.boxLists:showAlterBoxList(true)
		end
	end

	if self.ctrl.inReleaseMode and self.batchReleasePetIds[data.id] then
		local numUSDFText = objectReference:GetRefValue("numUSDFText")

		button.replicaWidget:TryChangePage("Batch", 2)
		self:refreshEvolveState(button.replicaWidget, true, data)
		ClientTextUtils.setText(numUSDFText, self.batchCount)
	end

	local replicaDisableAllTweenEffect = button.replicaWidget.disableAllTweenEffect == true

	button.replicaWidget.disableAllTweenEffect = true

	button.replicaWidget:TryChangePage("DragState", DRAG_STATE_DRAGGING, true)

	button.replicaWidget.disableAllTweenEffect = replicaDisableAllTweenEffect

	if not replicaIconReady or not replicaFrameReady then
		setReplicaPendingVisualsOpacity(0)
	end

	showReplicaWidgetDragState()
	self.ctrl:highLightExploreSlot(false, data.exploreSkillsLevel)
	self:renderExploreSkillPoints(button.replicaWidget, data)

	local function replicaIsValid()
		if self._boxPetReplicaDragToken ~= replicaDragToken then
			return false
		end

		if self.draggingPetId ~= data.id then
			return false
		end

		if IsNil(button) or IsNil(button.replicaWidget) then
			return false
		end

		return true
	end

	self:applyDraggingReplicaFilterLabel(button, data, replicaIsValid)
end

function BoxPetComponent:checkReleasePet(petId)
	local petInfo = pg.me:getPetInfo(petId)

	if not petInfo then
		return false
	end

	if petInfo.isSealed then
		pg.global.showBubbleMessage(NoticeDef.PET_BOND_RELEASE_BANNED)

		return false
	end

	local isInBattle = pg.game.petManage:getPetIsInBattle(petId)

	if isInBattle then
		pg.global.showBubbleMessageById(NoticeDef.CANNOT_RELEASE_BATTLE_PET)

		return false
	end

	local isValidFavorite = petInfo.favoriteType > 0

	if isValidFavorite then
		pg.global.showBubbleMessageById(NoticeDef.PET_FAVORITE)

		return false
	end

	local isSpecial = LuaUIUtils.tableContains(PetConfigData.forbidReleasePet, petInfo.templateId)

	if isSpecial then
		pg.global.showBubbleMessageById(NoticeDef.PET_FORBIDDEN)

		return false
	end

	local isInHomeland = pg.me:isPetPutInHomeland(petInfo)

	if isInHomeland then
		pg.global.showBubbleMessageById(NoticeDef.PET_IN_HOMELAND)

		return false
	end

	local isDispatch = pg.me:isPetActivityDispatching(petInfo)

	if isDispatch then
		local tipDecs = pg.getGameString("DISPATCH_TASK_FORBIDDEN")

		pg.global.ui.tips:showTextTip(tipDecs)

		return false
	end

	if Utils.isTable(self.inExplorePetInfos) then
		for _, v in pairs(self.inExplorePetInfos) do
			if v.id == petId then
				pg.global.showBubbleMessageRaw(pg.getGameString("CANNOT_RELEASE_EXPLORE_PET"))

				return false
			end
		end
	end

	return true
end

function BoxPetComponent:tryReleaseDraggingPet()
	if not self:canShowDragReleaseArea() then
		return
	end

	if self.ctrl.inReleaseMode then
		local ids = self:getDragBatchReleasePetIds(self.draggingPetId)

		if lume.count(ids) == 0 and self.draggingPetId then
			ids = {
				[self.draggingPetId] = 1
			}
		end

		if lume.count(ids) == 0 then
			return
		end

		if Utils.isTable(ids) then
			for releasePetId, _ in pairs(ids) do
				local petInfo = pg.me:getPetInfo(releasePetId)

				if petInfo and not self:checkReleasePet(releasePetId) then
					return
				end
			end
		end

		self._dragReleaseSession = (self._dragReleaseSession or 0) + 1

		local token = {
			id = self._dragReleaseSession,
			player = pg.me,
			page = self.ctrl.currentPage
		}

		self._dragReleaseToken = token

		self:doBatchRelease(function()
			return self:isDragReleaseContextValid(token)
		end, ids)
		pg.game.audio:triggerEvent("ui_petmanagement_release")

		return
	end

	local petId = self.draggingPetId

	if petId == nil then
		return
	end

	if not self:checkReleasePet(petId) then
		return
	end

	local petInfo = pg.me:getPetInfo(petId)

	if not petInfo then
		return
	end

	local infos = {}

	infos.title = pg.getGameString("FREE_PET_TITLE")
	infos.tip = pg.getGameString("RELEASE_TIP")

	if pg.game.petManage:hasPetCultivationByInfo(petInfo) then
		infos.tip = pg.getGameString("PET_RELEASE_TIP_ENHANCED") .. infos.tip
	end

	infos.disableGoodbye = false
	self._dragReleaseSession = (self._dragReleaseSession or 0) + 1

	local token = {
		id = self._dragReleaseSession,
		player = pg.me,
		page = self.ctrl.currentPage
	}

	self._dragReleaseToken = token

	if self.model:checkIfOnlyOnePetLeft() then
		infos.tip = pg.getGameString("RELEASE_WARN_TIP")
		infos.disableGoodbye = true

		pg.global.showConfirmMsgRaw(infos.title, infos.tip, nil, infos.disableGoodbye)
	else
		infos.petList = {
			petId
		}

		local recycleBack = ItemUtils.getBatchRecyclePetClientDisplayItem(pg.me, infos.petList)

		pg.global.showCommonTipUse(infos.title, infos.tip, recycleBack, function()
			if not self:isDragReleaseContextValid(token) then
				return
			end

			pg.game.petManage:tryRecyclePet(infos.petList)
		end, function()
			return
		end, true)
	end

	pg.game.audio:triggerEvent("ui_petmanagement_release")
end

function BoxPetComponent:endDrag(button, dropWidget, rayBox, data)
	local draggingPetPetId = self.draggingPetId

	self.dragProgressUProgress = nil

	button.replicaWidget:ClearReplicaWidgetExtendLoadCont()

	if self.temporaryStorageButton ~= button then
		self:applyButtonDragVisualState(button, DRAG_STATE_NORMAL)
	end

	self._boxPetSourceDragStatePetId = nil

	self.ctrl:highLightExploreSlot(true, nil)

	if rayBox ~= nil and rayBox.gameObject.name == "ReleaseRayBox" and draggingPetPetId ~= nil then
		self:tryReleaseDraggingPet()

		return
	end

	if dropWidget == nil then
		self:restoreSourceButtonAfterDragCancel(button, data)

		return
	end

	if self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE and self.ctrl.petWarehouse and self.ctrl.petWarehouse:isWarehouseDropTarget(dropWidget, rayBox) then
		self.ctrl.petWarehouse:handlePetDrop(draggingPetPetId, dropWidget)

		return
	end

	local dropName = dropWidget.gameObject.name

	if self.ctrl.fightPets and self.ctrl.fightPets.isRogueMode and self.ctrl.fightPets:onBoxPetDropToRogueSlot(draggingPetPetId, dropWidget, data) then
		return
	end

	local isFightPet = self.model:checkTryToGroup(dropName)

	if isFightPet then
		if not self.model.worldRacingTrackId and not pg.me:checkCanControlPetWithEnoughSpaceByTemplateId(data.templateId) then
			self.ctrl.fightPets:resetDragState()

			return
		end

		self.ctrl.fightPets:markPendingSelectByDrop(draggingPetPetId)

		local slotIndex = self.model.worldRacingTrackId and dropWidget.dataFromUList.index

		self.model:modifyPrepareFormation(dropName, draggingPetPetId, slotIndex)
		pg.game.audio:triggerEvent("ui_petmanagement_box_place")
		self.ctrl.fightPets:resetDragState()

		if self.ctrl.inReleaseMode and self.batchReleasePetIds[draggingPetPetId] then
			self:modifyBatchReleasePetIds(draggingPetPetId, nil)
		end

		return
	end

	if string.find(dropName, "Explore_") then
		local splits = string.split(dropName, "_")

		if splits[2] == "1" and not data.exploreSkillsLevel.canClimb then
			return
		elseif splits[2] == "2" and not data.exploreSkillsLevel.canGlide then
			return
		elseif splits[2] == "3" and not data.exploreSkillsLevel.canSwim then
			return
		end

		self.model:modifyExplorePrepareFormation(tonumber(string.split(dropName, "_")[2]), draggingPetPetId)
		pg.game.audio:triggerEvent("ui_petmanagement_box_place")
		self.ctrl.explorePets:resetDragState()

		if self.ctrl.inReleaseMode and self.batchReleasePetIds[draggingPetPetId] then
			self:modifyBatchReleasePetIds(draggingPetPetId, nil)
		end

		return
	end

	local isBox = string.find(dropName, "Box")
	local dropNameNum = isBox == nil and tonumber(dropName) or tonumber(string.sub(dropName, 4))

	if rayBox.gameObject.name == "PetBoxRayBox" then
		local slotId = self.model:getFirstValidSlotByBoxId(dropNameNum)
		local showMovedBoxAfterDrop = self:shouldShowMovedBoxAfterDrop(dropNameNum)
		local result = self:dealMultiPick(draggingPetPetId, dropNameNum, slotId, showMovedBoxAfterDrop)

		if result == -1 then
			self.ctrl.boxLists:resetDragState()
		end

		return
	end

	if dropWidget.transform.parent.name == "Content" then
		dropWidget:TryChangePage("DragState", 0)

		return
	end

	local targetSlotIndex = dropNameNum
	local targetBoxIndex = self.model:getSelectBoxId()

	if not targetSlotIndex then
		return
	end

	if self:isDropOnSourceButton(targetBoxIndex, targetSlotIndex, draggingPetPetId) then
		self:restoreSourceButtonAfterDragCancel(button, data)

		return
	end

	local result = self:dealMultiPick(draggingPetPetId, targetBoxIndex, targetSlotIndex)

	if result and result == -1 then
		dropWidget:TryChangePage("DragState", 0)
	end
end

function BoxPetComponent:shouldShowMovedBoxAfterDrop(targetBoxIndex)
	if self.model and self.model.getSelectBoxId then
		local currentBoxIndex = self.model:getSelectBoxId()

		if currentBoxIndex == targetBoxIndex then
			return true
		end
	end

	local dragFromBoxIndex = self.ctrl and self.ctrl.boxIdRecord

	if dragFromBoxIndex then
		return dragFromBoxIndex == targetBoxIndex
	end

	return false
end

function BoxPetComponent:clearDragBatchReleasePetIds()
	self.dragBatchReleasePetIds = nil
end

function BoxPetComponent:prepareDragBatchReleasePetIds(petId)
	self:clearDragBatchReleasePetIds()
	self:pruneBatchReleasePetIds()

	if not self.ctrl.inReleaseMode or not petId then
		return
	end

	self.dragBatchReleasePetIds = {}

	if self.batchReleasePetIds and self.batchReleasePetIds[petId] then
		for releasePetId, order in pairs(self.batchReleasePetIds) do
			self.dragBatchReleasePetIds[releasePetId] = order
		end
	else
		self.dragBatchReleasePetIds[petId] = 1
	end
end

function BoxPetComponent:getDragBatchReleasePetIds(curPickPetId)
	if self.dragBatchReleasePetIds then
		return self.dragBatchReleasePetIds
	end

	if curPickPetId then
		return {
			[curPickPetId] = 1
		}
	end

	return {}
end

function BoxPetComponent:collectIncomingMovePetIds(curPickPetId, targetBoxIndex)
	local incoming = {}

	if not self.ctrl.inReleaseMode then
		if curPickPetId then
			incoming[1] = curPickPetId
		end

		return incoming
	end

	local dragBatchReleasePetIds = self:getDragBatchReleasePetIds(curPickPetId)
	local sortedArray = {}

	if Utils.isTable(dragBatchReleasePetIds) then
		for petId, order in pairs(dragBatchReleasePetIds) do
			sortedArray[#sortedArray + 1] = {
				petId = petId,
				order = order
			}
		end

		table.sort(sortedArray, function(a, b)
			return a.order < b.order
		end)
	end

	for _, pair in ipairs(sortedArray) do
		local boxId = self.model:findBoxIdByPetId(pair.petId)

		if boxId ~= targetBoxIndex then
			incoming[#incoming + 1] = pair.petId
		end
	end

	if #incoming == 0 and curPickPetId then
		incoming[1] = curPickPetId
	end

	return incoming
end

function BoxPetComponent:tryMovePetsWithOverflow(petIds, targetBoxIndex, targetSlotIndex, showMovedBoxAfterDrop)
	local petBoxMap = pg and pg.me and pg.me.petBoxMap

	if not Utils.isTable(petIds) or #petIds == 0 or not petBoxMap then
		return
	end

	local hasTargetBox = targetBoxIndex ~= nil and (not self.ctrl or not self.ctrl.inFilterMode)
	local targetBox = hasTargetBox and petBoxMap[targetBoxIndex] or nil
	local targetEmpty = 0

	if hasTargetBox and targetBox and targetBox.canManualMove and targetBox:canManualMove() then
		targetEmpty = math.max((tonumber(targetBox.slotCount) or 0) - (tonumber(targetBox.count) or 0), 0)
	end

	local totalEmpty = 0

	if petBoxMap.getManualWritableEmptySlot then
		totalEmpty = tonumber(petBoxMap:getManualWritableEmptySlot()) or 0
	end

	if hasTargetBox then
		totalEmpty = math.max(totalEmpty, targetEmpty)
	end

	local plan = PetManagementUtils.buildMoveOverflowPlan(#petIds, targetEmpty, totalEmpty, hasTargetBox)

	local function applyMove(fitCount, allowOverflow)
		local fitted = {}
		local limit = math.min(fitCount or 0, #petIds)

		for i = 1, limit do
			fitted[i] = petIds[i]
		end

		if #fitted <= 0 then
			PetManagementUtils.notifyMoveTargetAreaNotEnough()

			return
		end

		local slots = PetManagementUtils.collectManualWritableSlots(petBoxMap, targetBoxIndex, targetSlotIndex, #fitted, allowOverflow)
		local movePetIds = {}
		local targetBoxIds = {}
		local targetSlotIds = {}

		for i = 1, #fitted do
			local slot = slots[i]

			if slot then
				movePetIds[#movePetIds + 1] = fitted[i]
				targetBoxIds[#targetBoxIds + 1] = slot.boxId
				targetSlotIds[#targetSlotIds + 1] = slot.slot
			end
		end

		if #movePetIds > 0 then
			self:switchBoxPets(movePetIds, targetBoxIds, targetSlotIds, showMovedBoxAfterDrop)

			return
		end

		PetManagementUtils.notifyMoveTargetAreaNotEnough()
	end

	if not plan.needConfirm then
		applyMove(plan.fitCount, plan.allowOverflow == true)

		return
	end

	PetManagementUtils.showMoveOverflowConfirm(plan, {
		onTargetOnly = function()
			local count = PetManagementUtils.takeMoveOverflowFit(plan, true)

			if not count then
				return
			end

			applyMove(count, false)
		end,
		onOverflow = function()
			local count = PetManagementUtils.takeMoveOverflowFit(plan, false)

			if not count then
				return
			end

			applyMove(count, true)
		end
	})
end

function BoxPetComponent:dealMultiPick(curPickPetId, targetBoxIndex, targetSlotIndex, showMovedBoxAfterDrop)
	local petBoxMap = pg and pg.me and pg.me.petBoxMap

	if self.ctrl and self.ctrl.inFilterMode then
		local incoming = self:collectIncomingMovePetIds(curPickPetId, targetBoxIndex)

		self:tryMovePetsWithOverflow(incoming, targetBoxIndex, targetSlotIndex, showMovedBoxAfterDrop)

		return
	end

	local targetBoxInfo = petBoxMap and targetBoxIndex and petBoxMap[targetBoxIndex]

	if not targetBoxInfo then
		pg.global.showBubbleMessageRaw(pg.getGameString("PET_MANAGEMENT_BOX_FULL"))

		return -1
	end

	if targetBoxInfo:isTempLocked() then
		pg.global.showBubbleMessageRaw(pg.getGameString("BATTLEPASS_PET_BOX_LOCKED"))

		return -1
	end

	if not self.ctrl.inReleaseMode then
		if targetSlotIndex then
			self:switchBoxPets({
				curPickPetId
			}, {
				targetBoxIndex
			}, {
				targetSlotIndex
			}, showMovedBoxAfterDrop)

			return
		end

		self:tryMovePetsWithOverflow({
			curPickPetId
		}, targetBoxIndex, targetSlotIndex, showMovedBoxAfterDrop)

		return
	end

	local dragBatchReleasePetIds = self:getDragBatchReleasePetIds(curPickPetId)
	local belongBoxIdTable = {}

	if Utils.isTable(dragBatchReleasePetIds) then
		for petId, _ in pairs(dragBatchReleasePetIds) do
			local boxId = self.model:findBoxIdByPetId(petId)

			if not belongBoxIdTable[boxId] then
				belongBoxIdTable[boxId] = {}
			end

			belongBoxIdTable[boxId][#belongBoxIdTable[boxId] + 1] = petId
		end
	end

	local containsOtherBoxPet = false

	for boxId, _ in pairs(belongBoxIdTable) do
		if boxId ~= targetBoxIndex then
			containsOtherBoxPet = true

			break
		end
	end

	if not containsOtherBoxPet then
		if not targetSlotIndex then
			self:tryMovePetsWithOverflow({
				curPickPetId
			}, targetBoxIndex, targetSlotIndex, showMovedBoxAfterDrop)

			return
		end

		self:switchBoxPets({
			curPickPetId
		}, {
			targetBoxIndex
		}, {
			targetSlotIndex
		}, showMovedBoxAfterDrop)

		return
	end

	local incoming = self:collectIncomingMovePetIds(curPickPetId, targetBoxIndex)
	local remain = self.model:getRemainSlotsCountByBoxId(targetBoxIndex)

	if targetSlotIndex and remain >= #incoming then
		local slots = self.model:getSlotsIndexByNumRequired(targetBoxIndex, #incoming, targetSlotIndex)
		local petIds = {}
		local targetBoxIds = {}
		local targetSlotIds = {}

		for i = 1, #incoming do
			petIds[#petIds + 1] = incoming[i]
			targetBoxIds[#targetBoxIds + 1] = targetBoxIndex
			targetSlotIds[#targetSlotIds + 1] = slots[i]
		end

		self:switchBoxPets(petIds, targetBoxIds, targetSlotIds, showMovedBoxAfterDrop)

		return
	end

	self:tryMovePetsWithOverflow(incoming, targetBoxIndex, targetSlotIndex, showMovedBoxAfterDrop)
end

function BoxPetComponent:onHover(button, isEmpty, isInUse)
	if not self.ctrl then
		return
	end

	if pg.global.navMgr and pg.global.navMgr.IsDragging and pg.game.input:isUsingGamepad() then
		local slot = self:getBoxPetSlotIndexByButton(button)

		if slot ~= nil then
			self._navDraggingFocusSlot = slot
		end
	end

	local STATE = self.ctrl.CONSOLE_BAR_STATE

	self.ctrl:recordHoveredButton(self, button, isEmpty, isInUse)
	self.ctrl:setConsoleBarState(STATE.IN_EMPTY_PET_BOX, isEmpty == true)
	self.ctrl:setConsoleBarState(STATE.CAN_START_DRAG, false)
	self.ctrl:setConsoleBarState(STATE.CAN_DROP, false)

	if not self.ctrl.isDragging then
		if isEmpty ~= true and button.draggable == true then
			self.ctrl:setConsoleBarState(STATE.CAN_START_DRAG, true)
		end

		return
	end

	if not IsNil(self.ctrl.draggingReplicaWidget) and self.ctrl.draggingReplicaWidget.name ~= button.name and (self.ctrl.draggingReplicaWidgetType == self.ctrl.DRAGGING_REPLICA_WIDGET.PET_BOX_CARD or self.ctrl.draggingReplicaWidgetType == self.ctrl.DRAGGING_REPLICA_WIDGET.WAREHOUSE_CARD) then
		self.ctrl.draggingReplicaWidget:TryChangePage("DragState", 4)
		self.ctrl:setConsoleBarState(STATE.CAN_DROP, true)
	end
end

function BoxPetComponent:onUnHover(button)
	if not self.ctrl then
		return
	end

	local STATE = self.ctrl.CONSOLE_BAR_STATE

	self.ctrl:clearHoveredButton(self, button)
	self.ctrl:setConsoleBarState(STATE.CAN_START_DRAG, false)
	self.ctrl:setConsoleBarState(STATE.CAN_DROP, false)
	self.ctrl:setConsoleBarState(STATE.IN_EMPTY_PET_BOX, false)

	if self.ctrl.isDragging == true and not IsNil(self.ctrl.draggingReplicaWidget) and self.ctrl.draggingReplicaWidget.name ~= button.name and (self.ctrl.draggingReplicaWidgetType == self.ctrl.DRAGGING_REPLICA_WIDGET.PET_BOX_CARD or self.ctrl.draggingReplicaWidgetType == self.ctrl.DRAGGING_REPLICA_WIDGET.WAREHOUSE_CARD) then
		self.ctrl.draggingReplicaWidget:TryChangePage("DragState", 1)
		button:TryChangePage("DragState", 0)
	end
end

function BoxPetComponent:switchBoxPets(petIds, targetBoxIndexes, targetSlotIndexes, showMovedBoxAfterDrop)
	local validPetIds = {}
	local validTargetBoxIndexes = {}
	local validTargetSlotIndexes = {}

	for i, petId in ipairs(petIds or EMPTY_TABLE) do
		local targetBoxIndex = targetBoxIndexes and targetBoxIndexes[i]
		local targetSlotIndex = targetSlotIndexes and targetSlotIndexes[i]
		local targetPetId = self.model:findPetIdByBoxIndexAndSlotIndex(targetBoxIndex, targetSlotIndex)

		if targetPetId ~= petId then
			validPetIds[#validPetIds + 1] = petId
			validTargetBoxIndexes[#validTargetBoxIndexes + 1] = targetBoxIndex
			validTargetSlotIndexes[#validTargetSlotIndexes + 1] = targetSlotIndex
		end
	end

	if #validPetIds <= 0 then
		return
	end

	if not self.ctrl:recordSwitchBoxPets(validPetIds, validTargetBoxIndexes, validTargetSlotIndexes, showMovedBoxAfterDrop) then
		return
	end

	pg.game.audio:triggerEvent("ui_petmanagement_box_place")

	if not self.ctrl.inReleaseMode and #validPetIds == 1 and targetBoxIndexes and targetSlotIndexes then
		self:markPendingSelectByDrop(validPetIds[1], validTargetBoxIndexes[1], validTargetSlotIndexes[1])
	end

	if pg.game.input:isUsingGamepad() then
		self._navMoveFocusPending = true
		self._navFocusSlot = nil
	end

	for i, petId in ipairs(validPetIds) do
		pg.me:serverMsg("RPC_CS_PetBoxMovePet", petId, validTargetBoxIndexes[i], validTargetSlotIndexes[i], PetWarehouseConst.BOX_TYPE_BY_DOMAIN[PetWarehouseConst.DOMAIN.BAG])
	end
end

function BoxPetComponent:clearNavMoveFocus()
	self._navMoveFocusPending = nil
	self._navFocusSlot = nil

	self:clearPendingSelectByDrop()
end

function BoxPetComponent:clearDraggingInfo()
	self.draggingPetId = nil
	self.draggingSourceButton = nil
	self.draggingSourceData = nil
	self.draggingSourceBoxIndex = nil
	self.draggingSourceSlotIndex = nil
	self.draggingSourcePetId = nil
	self._boxPetSourceDragStatePetId = nil
	self._navDraggingFocusSlot = nil

	self:clearDragBatchReleasePetIds()

	self.ctrl.draggingReplicaWidget = nil
	self.ctrl.draggingReplicaWidgetType = nil

	self:activeDragReleaseArea(false)

	if self.ctrl.currentPage ~= UIConst.PetMgrTabType.WAREHOUSE then
		self.ctrl.petDetails:showRightPanel(true)

		if not self.ctrl.inReleaseMode then
			self.ctrl.boxLists:showAlterBoxList(false)
		end
	end

	self.ctrl:setIsDragging(false)
	self:closeAllPetTooltips()

	if self.ctrl.petWarehouse then
		self.ctrl.petWarehouse:clearPetSelection()
	end

	if self.ctrl.boxIdRecord then
		self.ctrl.boxIdRecord = nil

		if self.ctrl.inFilterMode then
			self.ctrl:showNormalList(false)
		end
	end

	if self.ctrl.boxLists.hoverTimer then
		self.ctrl:killTimer(self.ctrl.boxLists.hoverTimer)

		self.ctrl.boxLists.hoverTimer = nil
	end
end

function BoxPetComponent:checkFramesExists()
	local boxButtons, lastIndex
	local findIt = false

	if self.ctrl.inFilterMode then
		boxButtons = self.boxPetFilterList:GetAllButtons()
		lastIndex = boxButtons.Length - 1
	else
		boxButtons = {}

		for i = 0, #self.boxPetNewListContainers do
			local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

			boxButtons[i] = uBtn
		end

		lastIndex = #boxButtons
	end

	for i = 0, lastIndex do
		local _, page = boxButtons[i]:TryGetCurrentPage("button")

		if page == 5 then
			findIt = true

			break
		end
	end

	return findIt
end

function BoxPetComponent:startReleaseMode()
	local warehouseBatch = self.ctrl.petWarehouse and self.ctrl.petWarehouse.batch

	if warehouseBatch and warehouseBatch.active then
		return
	end

	if self:isManagementForbidden() then
		return
	end

	if self.ctrl.petWarehouse then
		self.ctrl.petWarehouse:clearPetSelection()
	end

	self:clearDragBatchReleasePetIds()

	self.batchReleasePetIds = {}
	self.btnReleaseUButton.renderOpacity = 0

	self.btnReleaseUButton:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, true)
	self.root:TryChangePage("Destroy", 1)

	self.ctrl.inReleaseMode = true

	self.ctrl:refreshPetBox()

	if self.ctrl.onReleaseModeChange then
		self.ctrl:onReleaseModeChange(true)
	end

	self.view.pbFilterRectTransform.parent = self.view.batchReleaseFilterParent
	self.view.pbFilterRectTransform.anchoredPosition = Vector2.zero
	self.view.pbFilter2RectTransform.parent = self.view.batchReleaseFilterParent
	self.view.pbFilter2RectTransform.anchoredPosition = Vector2.zero

	TimerManager.addTimer(0.1, function()
		self.btnViewUButton:TryChangePage("button", 4)
		self.btnView2UButton:SetActive(true)
	end)
end

function BoxPetComponent:endReleaseMode()
	self:clearDragBatchReleasePetIds()

	self.btnReleaseUButton.renderOpacity = 1

	self.btnReleaseUButton:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, false)

	self.ctrl.inReleaseMode = false

	self.ctrl:refreshPetBox()
	self:modifyBatchReleasePetIds(nil, nil, true)
	self.root:TryChangePage("Destroy", 0)

	if self.ctrl.onReleaseModeChange then
		self.ctrl:onReleaseModeChange(false)
	end

	self.view.pbFilterRectTransform.parent = self.view.normalFilterParent
	self.view.pbFilterRectTransform.anchoredPosition = Vector2.zero
	self.view.pbFilter2RectTransform.parent = self.view.normalFilterParent
	self.view.pbFilter2RectTransform.anchoredPosition = Vector2.zero
end

function BoxPetComponent:tryRecycleBatchPets(petList, onReleaseStarted)
	local started, reason = pg.game.petManage:tryRecyclePet(petList)

	if started and onReleaseStarted then
		onReleaseStarted()
	end

	return started, reason
end

function BoxPetComponent:doBatchRelease(isContextValid, petIdMap)
	if isContextValid and not isContextValid() then
		return
	end

	if self:isReleaseForbidden() then
		return
	end

	local infos = {}

	infos.petList = {}

	local selectedSnapshot = {}

	for petId, order in pairs(petIdMap or self.batchReleasePetIds) do
		if not self.model:isPetInLockedBox(petId) then
			infos.petList[#infos.petList + 1] = petId
			selectedSnapshot[petId] = order
		end
	end

	if #infos.petList <= 0 then
		pg.global.showBubbleMessageRaw(pg.getGameString("CHOOSE_RELEASE_PUPPET"))
	else
		pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_FREE, {
			richTextColor = "#FDDA0D",
			freePetIds = selectedSnapshot,
			ensureCb = function(tips, selectedPetIds, onReleaseStarted)
				if isContextValid and not isContextValid() then
					return
				end

				local selectedPetList = {}

				for petId in pairs(selectedPetIds) do
					selectedPetList[#selectedPetList + 1] = petId
				end

				if #selectedPetList == 0 then
					return
				end

				local tip = tips or pg.getFormatText(pg.getGameString(PetWarehouseConst.PetWarehouseText.BATCH_RELEASE_CONFIRM), tostring(#selectedPetList))
				local recycleBack = ItemUtils.getBatchRecyclePetClientDisplayItem(pg.me, selectedPetList)

				pg.global.showCommonTipUse(pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TITLE), tip, recycleBack, function()
					if isContextValid and not isContextValid() then
						return
					end

					self:tryRecycleBatchPets(selectedPetList, onReleaseStarted)
				end, nil, true)
			end
		})
	end
end

function BoxPetComponent:boxLockBtnFunction(boxId, ignorePopup)
	local boxPetInfo = pg.me.petBoxMap[boxId]

	local function popupFunc()
		local hintShowTs = pg.global.prefsCacheUtils:getInt("boxLockHintHideFlagTs", 0, ClientConst.CACHE_TYPE_FLAG.USER)

		if hintShowTs + 86400 <= Time.secondCache then
			if not ignorePopup then
				self.boxSelector:InteractPopup(false)
			end

			pg.global.showConfirmMsgRaw(pg.getGameString("LOCK_BOX"), pg.getGameString("LOCK_BOX_TIPS"), function()
				pg.me:serverMsg("RPC_CS_PetBoxSwitchLocked", boxId, not boxPetInfo:isManualLocked(), Const.PetBoxType.PET_BOX)

				if not ignorePopup then
					self.boxSelector:InteractPopup(true)
				end

				if self.boxLockHintHideFlag then
					pg.global.prefsCacheUtils:setInt("boxLockHintHideFlagTs", Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
					pg.global.prefsCacheUtils:save()
				end
			end, nil, function()
				if not ignorePopup then
					self.boxSelector:InteractPopup(true)
				end
			end, nil, nil, {
				hint = true,
				hintDesc = string.format(pg.getGameString("DISABLE_HINT"), 1),
				hintCb = function(isSelected)
					if isSelected then
						self.boxLockHintHideFlag = true
					else
						self.boxLockHintHideFlag = nil
					end
				end
			})
		else
			pg.me:serverMsg("RPC_CS_PetBoxSwitchLocked", boxId, not boxPetInfo:isManualLocked(), Const.PetBoxType.PET_BOX)
		end
	end

	PetManagementDataHelper.sendSwitchPetBoxManualLocked(boxId, popupFunc)
end

function BoxPetComponent:refreshLockStatusWhenPopup()
	if self.boxSelectorTempList == nil then
		return
	end

	local petBoxMap = pg.me.petBoxMap
	local btns = self.boxSelectorTempList:GetAllButtons()

	for i = 0, btns.Length - 1 do
		local objectReference = btns[i]:GetComponent("ObjectReference")
		local lockUButton1 = objectReference:GetRefValue("lockUButton1")
		local lockState = PetManagementUtils.getBoxLockState(petBoxMap[btns[i].dataFromUList.idx])

		btns[i]:TryChangePage("Lock", lockState)
	end
end

function BoxPetComponent:startFilter(buttonOptional)
	local warehouseBatch = self.ctrl.petWarehouse and self.ctrl.petWarehouse.batch

	if warehouseBatch and warehouseBatch.active then
		return
	end

	self.homePetFilterActive = self.model:isHomePetMode()
	self.ctrl.inFilterMode = true

	LuaUIUtils.setUIVisible(self.view.btnBoxUButton, false)
	LuaUIUtils.setUIVisible(self.view.btnBox2UButton, false)
	self.ctrl.boxLists:muteBoxButtons(not self.model:isHomePetMode())

	if self.ctrl:checkUIVisible() then
		self.ctrl:refreshPetBox()
	end

	if self:shouldShowExploreSkillIconsOnBagCards() then
		self:showAllPetCardsElementIcon(true)
	else
		self:showAllPetCardsElementIcon(false)
	end

	self.root:TryChangePage("State", 1)

	if self.showAutoFilter then
		self.midPanelUComponent:TryChangePage("State", 3)
	elseif self.model.worldRacingTrackId ~= nil then
		self.midPanelUComponent:TryChangePage("State", 1)
	end

	self.ctrl:showNormalList(false)

	if self.ctrl.refreshBaseNavigationSubArea then
		self.ctrl:refreshBaseNavigationSubArea(1)
	end
end

function BoxPetComponent:endFilter()
	local isHomePetMode = self.model:isHomePetMode()

	self.homePetFilterActive = false
	self.showLabelInfo = nil

	if self.model.inAutoFilterMode then
		self.model.inAutoFilterMode = false
		self.showLabelInfo = nil
		self.model.intelligentSortKeys = nil

		self.model:setSelectSortId(0)
		self.model:setFilter({})
	else
		self.model:setSelectSortId(0)
		self.model:setFilter({})
	end

	self.ctrl.inFilterMode = isHomePetMode

	local showBoxManagement = not isHomePetMode and not self.ctrl:isWorldRacingExplorePage()

	LuaUIUtils.setUIVisible(self.view.btnBoxUButton, showBoxManagement)
	LuaUIUtils.setUIVisible(self.view.btnBox2UButton, showBoxManagement)
	self.ctrl.boxLists:muteBoxButtons(false)
	self.ctrl:refreshPetBox()

	if self:shouldShowExploreSkillIconsOnBagCards() then
		self:showAllPetCardsElementIcon(true)
	else
		self:showAllPetCardsElementIcon(false)
	end

	self.root:TryChangePage("State", 0)

	if self.showAutoFilter then
		self.midPanelUComponent:TryChangePage("State", 2)
	elseif self.model.worldRacingTrackId ~= nil then
		self.midPanelUComponent:TryChangePage("State", 0)
	end

	self.ctrl:showNormalList(not isHomePetMode)

	if self.ctrl.refreshBaseNavigationSubArea then
		self.ctrl:refreshBaseNavigationSubArea(1)
	end
end

function BoxPetComponent:endAutoFilter()
	if self.model.inAutoFilterMode then
		self.model.inAutoFilterMode = false
		self.model.intelligentSortKeys = nil

		self.pbFilter2UComponent:TryChangePage("button", 0)
		self:endFilter()
	end
end

function BoxPetComponent:applyIntelligentFilter(filterId)
	local success = self.model:applyIntelligentFilter(filterId)

	if not success then
		return
	end

	self:enterAutoFilterMode()
end

function BoxPetComponent:applyIntelligentFilterByPetRef(recommendPetRef, recommendElemts)
	local success = self.model:applyIntelligentFilterByPetRef(recommendPetRef, recommendElemts)

	if not success then
		return
	end

	self:enterAutoFilterMode()
end

function BoxPetComponent:applyWorldRacingIntelligentFilter()
	local trackId = self.model.worldRacingTrackId

	if trackId == nil then
		return
	end

	local success = self.model:applyWorldRacingIntelligentFilter(trackId)

	if not success then
		return
	end

	self:enterAutoFilterMode()
end

function BoxPetComponent:enterAutoFilterMode()
	self.model.inAutoFilterMode = true
	self.showLabelInfo = true

	self.pbFilter2UComponent:TryChangePage("button", 4)
	self:startFilter()
end

function BoxPetComponent:refreshMidPanelFilterState()
	local filterPage = self.ctrl.inFilterMode and 1 or 0

	self.midPanelUComponent:TryChangePage("State", self.showAutoFilter and filterPage + 2 or filterPage)
end

function BoxPetComponent:refreshAutoFilterBtnTip()
	if self.model.worldRacingTrackId == nil then
		return
	end

	if self.autoFilterTipUBaseText == nil then
		return
	end

	ClientTextUtils.setText(self.autoFilterTipUBaseText, pg.getGameString(self.model.inAutoFilterMode and "PET_MANAGEMENT_AUTO_FILTER_ON" or "PET_MANAGEMENT_AUTO_FILTER_OFF"))
end

function BoxPetComponent:refreshAutoFilterBtnState()
	if self.model.worldRacingTrackId == nil then
		return
	end

	if self.autoFilterBtn ~= nil then
		self.autoFilterBtn.isSelected = self.model.inAutoFilterMode == true
	end

	self:refreshAutoFilterBtnTip()
end

function BoxPetComponent:showAutoFilterBtn(show)
	self.showAutoFilter = show

	LuaUIUtils.setUIVisible(self.view.recommendUContainer, self.model.worldRacingTrackId == nil and show)

	local container = self.autoFilterBtnUContainer

	if not container then
		return
	end

	LuaUIUtils.setUIVisible(container, show)

	if not show then
		return
	end

	local function bindAutoFilterBtn(content)
		function content.luaClick()
			if self.model.inAutoFilterMode then
				ClientTextUtils.setText(self.autoFilterTipUBaseText, pg.getGameString("PET_MANAGEMENT_AUTO_FILTER_OFF"))
				self:endAutoFilter()
			elseif self.ctrl.isWorldRacingIntelligentFilter then
				ClientTextUtils.setText(self.autoFilterTipUBaseText, pg.getGameString("PET_MANAGEMENT_AUTO_FILTER_ON"))
				self:applyWorldRacingIntelligentFilter()
			elseif self.ctrl.fightPets.isNpcDuelMode and self.ctrl.recommendPetRef then
				ClientTextUtils.setText(self.autoFilterTipUBaseText, pg.getGameString("PET_MANAGEMENT_AUTO_FILTER_ON"))
				self:applyIntelligentFilterByPetRef(self.ctrl.recommendPetRef, self.ctrl.recommendedElements)
			elseif self.ctrl.intelligentFilterId then
				ClientTextUtils.setText(self.autoFilterTipUBaseText, pg.getGameString("PET_MANAGEMENT_AUTO_FILTER_ON"))
				self:applyIntelligentFilter(self.ctrl.intelligentFilterId)
			end
		end

		local objectReference = content:GetComponent("ObjectReference")

		self.autoFilterTipUBaseText = objectReference:GetRefValue("autoFilterTipUBaseText")
		self.autoFilterBtn = content
		self.autoFilterBtn.isSelected = true

		self:refreshAutoFilterBtnState()
	end

	if container:CheckURLLoaded() then
		bindAutoFilterBtn(container.content)
	else
		container:LoadDefaultUrlManually(function(content)
			bindAutoFilterBtn(content)
		end)
	end

	if not self.view.recommendUContainer:CheckURLLoaded() then
		self.view.recommendUContainer:LoadDefaultUrlManually(function()
			local content = self.view.recommendUContainer.content
			local objectReference = content:GetComponent("ObjectReference")
			local textUBaseText = objectReference:GetRefValue("textUBaseText")

			ClientTextUtils.setText(textUBaseText, pg.getGameString("RECOMMEND_PET_POPUP_TITLE"))

			function content.luaClick()
				local fightPets = self.ctrl.fightPets

				if self.ctrl.isWorldRacingIntelligentFilter then
					return
				elseif fightPets and fightPets.isRogueMode and fightPets.rogueLevelId then
					pg.global.ui:open(UIConst.UI_ID_RECOMMEND_PET, {
						isRogue = true,
						levelId = fightPets.rogueLevelId
					})
				elseif self.ctrl.recommendPetRef then
					pg.global.ui:open(UIConst.UI_ID_RECOMMEND_PET, {
						isNpcDuel = true,
						recommendPet = self.ctrl.recommendPetRef
					})
				else
					pg.global.ui:open(UIConst.UI_ID_RECOMMEND_PET, {
						intelligentFilterId = self.ctrl.intelligentFilterId
					})
				end
			end
		end)
	end
end

function BoxPetComponent:hideFilterWhenSwitchBackToFightList()
	if not self.ctrl.inFilterMode then
		return
	end

	self.view.btnCleanFilterUButton.luaClick()
end

function BoxPetComponent:refreshSingleCardFavoriteState(petId, favoriteType, data)
	local btns, lastIndex

	if self.ctrl.inFilterMode then
		btns = self.boxPetFilterList:GetAllButtons()
		lastIndex = btns.Length - 1
	else
		btns = {}

		for i = 0, #self.boxPetNewListContainers do
			local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

			btns[i] = uBtn
		end

		lastIndex = #btns
	end

	for i = 0, lastIndex do
		if not btns[i].dataFromUList.isEmpty then
			local objectReference = btns[i]:GetComponent("ObjectReference")
			local iconFavUContainer = objectReference:GetRefValue("iconFavUContainer")
			local petIdDisplay = objectReference:GetRefValue("petIdDisplay")
			local txtUsedUSDFText = objectReference:GetRefValue("txtUsedUSDFText")

			if petIdDisplay.gameObject.name == petId then
				if favoriteType > 0 then
					if self.ctrl.inReleaseMode and txtUsedUSDFText then
						txtUsedUSDFText:SetActive(true)
					end

					iconFavUContainer.content.gameObject:SetActiveEx(true)
					iconFavUContainer.content:InvokeCallback(CS.XGUI.EInvokeTime.User2)

					if self.ctrl.inReleaseMode and self.batchReleasePetIds[petId] then
						self:modifyBatchReleasePetIds(petId, nil)
					end

					if self.ctrl.inReleaseMode then
						btns[i]:TryChangePage("state", 1)
					end

					self:refreshEvolveState(btns[i], false, btns[i].dataFromUList)

					local iconFavContObjRef = iconFavUContainer.content:GetComponent("ObjectReference")
					local iconUImage = iconFavContObjRef:GetRefValue("iconUImage")

					if iconUImage then
						iconUImage.url = PetManagementUtils.getPetFavoriteIconUrl(favoriteType)
					end
				else
					if txtUsedUSDFText then
						txtUsedUSDFText:SetActive(false)
					end

					iconFavUContainer.content:InvokeCallback(CS.XGUI.EInvokeTime.User1)

					if self.ctrl.inReleaseMode then
						btns[i]:TryChangePage("state", 0)
					else
						iconFavUContainer.content.gameObject:SetActiveEx(false)
					end
				end

				local isInUse = self:getIsInUse(data)

				if self.ctrl.inReleaseMode then
					if isInUse then
						btns[i]:TryChangePage("state", 1)
						btns[i]:TryChangePage("Batch", 0)

						if txtUsedUSDFText then
							txtUsedUSDFText:SetActive(true)
						end

						self:displayFavoriteState(btns[i], txtUsedUSDFText, data)
					else
						btns[i]:TryChangePage("Batch", 3)
						LuaUIUtils.setPetHeadBoxBanned(btns[i], false)
					end
				else
					LuaUIUtils.setPetHeadBoxBanned(btns[i], false)
				end
			end
		end
	end
end

function BoxPetComponent:displayFavoriteState(button, txtUsedUSDFText, data)
	if self.model:isHomePetMode() then
		if NotNil(txtUsedUSDFText) then
			ClientTextUtils.setText(txtUsedUSDFText, "")
			txtUsedUSDFText:SetActive(false)
		end

		LuaUIUtils.setPetHeadBoxBanned(button, false)

		return false
	end

	local lockStatus = self.model:getLockStatus(data)
	local isValidFavorite = lockStatus.isValidFavorite
	local inBattle = lockStatus.inBattle or lockStatus.inRogue
	local inExplore = lockStatus.inExplore
	local isSpecial = lockStatus.isSpecial
	local isInHomeland = lockStatus.isInHomeland
	local isActivityDipatching = lockStatus.isActivityDipatching
	local isSealed = lockStatus.isSealed
	local isBoxLocked = lockStatus.isBoxLocked
	local usedTxtKey = ""

	if inBattle then
		usedTxtKey = "NOT_CAN_REALSE_INBATTLE"
	elseif isSealed then
		usedTxtKey = "PET_IN_STORING"
	elseif isSpecial then
		usedTxtKey = "NOT_CAN_REALSE_INFORBID"
	elseif isInHomeland then
		usedTxtKey = "NOT_CAN_REALSE_INHOMELAND"
	elseif isActivityDipatching then
		usedTxtKey = "NOT_CAN_REALSE_INACTIVITY_DISPATCH"
	elseif inExplore then
		usedTxtKey = "NOT_CAN_REALSE_INEXPLORE"
	elseif isValidFavorite then
		usedTxtKey = "NOT_CAN_REALSE_INFAVORITE"
	elseif isBoxLocked then
		usedTxtKey = "RANDOM_SHOP_SAVED"
	end

	local showBoxBanned = usedTxtKey == "RANDOM_SHOP_SAVED"

	if NotNil(txtUsedUSDFText) then
		if showBoxBanned then
			txtUsedUSDFText:SetActive(false)
			ClientTextUtils.setText(txtUsedUSDFText, "")
		else
			ClientTextUtils.setText(txtUsedUSDFText, pg.getGameString(usedTxtKey) or "")
		end
	end

	if showBoxBanned then
		LuaUIUtils.setPetHeadBoxBanned(button, true, pg.getGameString(usedTxtKey))
	else
		LuaUIUtils.setPetHeadBoxBanned(button, false)
	end

	if NotNil(button) and button.GetComponent then
		local headReference = button:GetComponent("ObjectReference")
		local iconInBoxUImage = headReference and headReference.GetRefValue and headReference:GetRefValue("iconInBoxUImage")

		if NotNil(iconInBoxUImage) and NotNil(iconInBoxUImage.gameObject) then
			iconInBoxUImage.gameObject:SetActiveEx(false)
		end
	end

	return showBoxBanned
end

function BoxPetComponent:checkCurrentPetInfosContainsPet(isFight, exploreSlotIndex)
	for i = 1, #self.petInfos do
		local valid = true

		if not self.petInfos[i].isEmpty then
			if not isFight and self.petInfos[i].exploreSkillsLevel[AbilityConst.SPECIFIC_ABILITY_INDEX_2_NAME[exploreSlotIndex]] == nil then
				valid = false
			end

			if valid then
				return true
			end
		end
	end

	return false
end

function BoxPetComponent:snapshotBattleBadges()
	local fight = {}
	local explore = {}
	local fightPetIds = self.inFightPetInfos

	if fightPetIds then
		local i = 0

		for _, v in pairs(fightPetIds) do
			i = i + 1

			local id = Utils.isTable(v) and v.id or v

			if id then
				fight[id] = i
			end
		end
	end

	local explorePetInfos = self.inExplorePetInfos

	if explorePetInfos then
		for k, v in pairs(explorePetInfos) do
			local id = Utils.isTable(v) and v.id or v

			if id then
				explore[id] = (explore[id] and explore[id] .. "," or "") .. tostring(k)
			end
		end
	end

	return {
		fight = fight,
		explore = explore
	}
end

local function collectBadgeDiff(prev, new, changed)
	for _, scope in ipairs({
		"fight",
		"explore"
	}) do
		local p = prev[scope]
		local n = new[scope]

		for id, v in pairs(p) do
			if n[id] ~= v then
				changed[id] = true
			end
		end

		for id, v in pairs(n) do
			if p[id] ~= v then
				changed[id] = true
			end
		end
	end
end

local function samePetSequence(a, b)
	if not a or not b then
		return false
	end

	if #a ~= #b then
		return false
	end

	for i = 1, #a do
		local da, db = a[i], b[i]

		if (da.id or false) ~= (db.id or false) then
			return false
		end

		if da.isEmpty == true ~= (db.isEmpty == true) then
			return false
		end
	end

	return true
end

function BoxPetComponent:tryRefreshChangedBattleBadges()
	if not self._battleBadgeSnap then
		return false
	end

	local fightPets = self.ctrl and self.ctrl.fightPets

	if fightPets and (fightPets.isRogueMode or fightPets.isBossRushMode or fightPets.isNpcDuelMode) then
		return false
	end

	local newList = self:getCurrentDisplayPetInfos()

	if not samePetSequence(self.petInfos, newList) then
		return false
	end

	local prev = self._battleBadgeSnap

	self.petInfos = newList
	self.inFightPetInfos = self.model:getGroupInfoById(self.model:getSelectGroupId())
	self.inExplorePetInfos = self.model:getExploreGroupInfoById(self.model:getSelectGroupId())

	self:rebuildBlockedFormationPetIdSet()

	local new = self:snapshotBattleBadges()
	local changed = {}

	collectBadgeDiff(prev, new, changed)

	self._battleBadgeSnap = new

	for petId in pairs(changed) do
		self:refreshChangedBoxItem(petId)
	end

	if self.ctrl.inReleaseMode then
		self:refreshSelectAllBtn()
	end

	return true
end

function BoxPetComponent:getCurrentDisplayPetInfos()
	if self.ctrl.inFilterMode then
		return self.model:getFilteredPetsInfo(self.model:getSelectBoxId())
	end

	return self.model:getBoxInfoById(self.model:getSelectBoxId())
end

function BoxPetComponent:refreshChangedBoxItem(petId)
	local index = self:getListIndexByPetId(petId)

	if index == nil then
		return
	end

	local data = self.petInfos[index + 1]

	if not data then
		return
	end

	if self.ctrl.inFilterMode then
		if data.id then
			local _, btn = self.boxPetFilterList:TryGetChildAt(index)

			self.filterListBtnCaches[data.id] = btn
		end

		self.boxPetFilterList:SetElement(index, data)
	else
		local uBtn = self.boxPetNewListContainers[index].content:GetComponent("UButton")

		if data.id then
			self.normalListBtnCaches[data.id] = uBtn
		end

		self:setBoxPetListData(uBtn, index, data)
	end
end

function BoxPetComponent:isPetCpChanged(petId)
	if not petId then
		return false
	end

	local function findCachedCp(list)
		if not list then
			return nil
		end

		for i = 1, #list do
			local v = list[i]

			if Utils.isTable(v) and v.id == petId then
				return v.cp
			end
		end

		return nil
	end

	local cachedCp = findCachedCp(self.petInfos)

	if cachedCp == nil then
		cachedCp = findCachedCp(self.inFightPetInfos)
	end

	if cachedCp == nil then
		cachedCp = findCachedCp(self.inExplorePetInfos)
	end

	if cachedCp == nil then
		return false
	end

	return self.model:getCpValue(petId) ~= cachedCp
end

function BoxPetComponent:refreshBoxBtnByPetId(petId)
	local index = self:getListIndexByPetId(petId)

	if index == nil then
		return
	end

	if self.ctrl.inFilterMode then
		if self.petInfos[index + 1].id then
			local _, btn = self.boxPetFilterList:TryGetChildAt(index)

			self.filterListBtnCaches[self.petInfos[index + 1].id] = btn
		end

		self.boxPetFilterList:RefreshElement(index)
	else
		local uBtn = self.boxPetNewListContainers[index].content:GetComponent("UButton")

		if self.petInfos[index + 1].id then
			self.normalListBtnCaches[self.petInfos[index + 1].id] = uBtn
		end

		self:setBoxPetListData(uBtn, index, self.petInfos[index + 1])
	end
end

function BoxPetComponent:isInRacingPetList()
	return self.model.worldRacingTrackId ~= nil and not self.ctrl:isWorldRacingExplorePage()
end

function BoxPetComponent:showAllPetCardsElementIcon(show)
	local btns, lastIndex

	if self.ctrl.inFilterMode then
		btns = self.boxPetFilterList:GetAllButtons()
		lastIndex = btns.Length - 1
	else
		btns = {}

		for i = 0, #self.boxPetNewListContainers do
			local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

			btns[i] = uBtn
		end

		lastIndex = #btns
	end

	self.showAllPetCardsElementIconFlag = show

	local inRacingPetList = self:isInRacingPetList()

	for i = 0, lastIndex do
		if not btns[i].dataFromUList.isEmpty then
			local objectReference = btns[i]:GetComponent("ObjectReference")
			local petIdDisplay = objectReference:GetRefValue("petIdDisplay")
			local panelCharListUContainer = objectReference:GetRefValue("panelCharListUContainer")
			local panelCPUContainer = objectReference:GetRefValue("panelCPUContainer")

			if petIdDisplay.gameObject.name ~= "Null" then
				if panelCharListUContainer.content then
					panelCharListUContainer.content.gameObject:SetActiveEx(not inRacingPetList and show)
				end

				if panelCPUContainer.content then
					panelCPUContainer.content.gameObject:SetActiveEx(not inRacingPetList and not show)
				end
			elseif panelCharListUContainer.content then
				panelCharListUContainer.content.gameObject:SetActiveEx(false)
			end
		end
	end
end

function BoxPetComponent:shouldShowExploreSkillIconsOnBagCards()
	if not self.ctrl or self.ctrl.currentPage == UIConst.PetMgrTabType.WAREHOUSE then
		return false
	end

	local root = self.view and self.view.root

	if not root or not root.TryGetCurrentPage then
		return false
	end

	local _, page = root:TryGetCurrentPage("ListType")

	return page == 1
end

function BoxPetComponent:restoreDefaultHeadOverlayOnWarehouseTab()
	self:showAllPetCardsElementIcon(false)

	if self:isInRacingPetList() then
		return
	end

	local btns, lastIndex

	if self.ctrl.inFilterMode then
		if not self.boxPetFilterList then
			return
		end

		btns = self.boxPetFilterList:GetAllButtons()
		lastIndex = btns.Length - 1
	else
		btns = {}

		for i = 0, #self.boxPetNewListContainers do
			local container = self.boxPetNewListContainers[i]
			local uBtn = container and container.content and container.content:GetComponent("UButton")

			btns[i] = uBtn
		end

		lastIndex = #btns
	end

	for i = 0, lastIndex do
		local button = btns[i]
		local data = button and button.dataFromUList

		if data and not data.isEmpty then
			self:showFilterLabel(button, data)
		end
	end
end

function BoxPetComponent:getListIndexByPetId(petId)
	if not self.boxPetFilterList then
		return nil
	end

	if not self.boxPetNewListContainers then
		return nil
	end

	if self.ctrl.inFilterMode then
		if not self.petInfos then
			return nil
		end

		for i = 1, #self.petInfos do
			local data = self.petInfos[i]

			if data and data.id == petId then
				local _, btn = self.boxPetFilterList:TryGetChildAt(i - 1)

				return i - 1, btn
			end
		end

		return nil, nil
	end

	local buttons = {}

	for i = 0, #self.boxPetNewListContainers do
		local uBtn = self.boxPetNewListContainers[i].content:GetComponent("UButton")

		buttons[i] = uBtn
	end

	local lastIndex = #buttons

	for i = 0, lastIndex do
		local objectReference = buttons[i]:GetComponent("ObjectReference")
		local petIdDisplay = objectReference:GetRefValue("petIdDisplay")

		if petIdDisplay.gameObject.name == petId then
			return i, buttons[i]
		end
	end

	return nil, nil
end

function BoxPetComponent:playAniEventByBoxIndexAndSlotIndex(boxIndex, slotIndex)
	if not self.boxPetFilterList then
		return
	end

	if not self.boxPetNewListContainers then
		return
	end

	local boxId = self.model:getSelectBoxId()

	if boxId ~= boxIndex then
		return
	end

	if self.ctrl.inFilterMode then
		local _, button = self.boxPetFilterList:TryGetChildAt(slotIndex - 1)

		if not button then
			return
		end

		button:InvokeCallback(CS.XGUI.EInvokeTime.User1)
	else
		local button = self.boxPetNewListContainers[slotIndex - 1].content:GetComponent("UButton")

		if not button then
			return
		end

		button:InvokeCallback(CS.XGUI.EInvokeTime.User1)
	end
end

function BoxPetComponent:applyDraggingReplicaFilterLabel(button, data, isValid)
	if IsNil(button) then
		return
	end

	if IsNil(button.replicaWidget) then
		return
	end

	self:showFilterLabel(button.replicaWidget, data, isValid)
end

function BoxPetComponent:showFilterLabel(btn, data, isValid)
	local sortCondition = self.model:getSelectSortId()
	local objectReference = btn:GetComponent("ObjectReference")
	local panelCPUContainer = objectReference:GetRefValue("panelCPUContainer")
	local panelCharListUContainer = objectReference:GetRefValue("panelCharListUContainer")
	local txtBoxUImage = objectReference:GetRefValue("txtBoxUImage")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local petQualityUContainer = objectReference:GetRefValue("petQualityUContainer")
	local petRareUContainer = objectReference:GetRefValue("petRareUContainer")
	local petRareNmlUContainer = objectReference:GetRefValue("petRareNmlUContainer")
	local panelAbilityUContainer = objectReference:GetRefValue("panelAbilityUContainer")

	if not self.showLabelInfo then
		panelCPUContainer:SetActive(true)

		panelCharListUContainer.renderOpacity = 1
		txtBoxUImage.renderOpacity = 0

		petQualityUContainer:DestroyContent()
		petRareUContainer:DestroyContent()
		petRareNmlUContainer:DestroyContent()
		panelAbilityUContainer:DestroyContent()

		return
	end

	if PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 0 then
		panelCPUContainer:SetActive(true)

		panelCharListUContainer.renderOpacity = 1
		txtBoxUImage.renderOpacity = 0

		petQualityUContainer:DestroyContent()
		petRareUContainer:DestroyContent()
		petRareNmlUContainer:DestroyContent()
		panelAbilityUContainer:DestroyContent()
	elseif PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 1 then
		panelCPUContainer:SetActive(false)

		panelCharListUContainer.renderOpacity = 0
		txtBoxUImage.renderOpacity = 1

		petQualityUContainer:DestroyContent()
		petRareUContainer:DestroyContent()
		petRareNmlUContainer:DestroyContent()
		panelAbilityUContainer:DestroyContent()
		txtNameUSDFText:SetActive(true)

		if sortCondition == PetManagementDataHelper.SORT_IDX.TIME then
			local seconds = (Time.secondCache * 1000 - data.time) / 1000

			ClientTextUtils.setText(txtNameUSDFText, TimeUtils.getFormatStringDay(seconds))
		elseif sortCondition == PetManagementDataHelper.SORT_IDX.BOOK_NUM then
			ClientTextUtils.setText(txtNameUSDFText, PetManagementUtils.getDisplayBookNumberText(data))
		elseif sortCondition == PetManagementDataHelper.SORT_IDX.LEVEL then
			ClientTextUtils.setText(txtNameUSDFText, ClientTextUtils.formatShortLevel(data.level))
		else
			ClientTextUtils.setText(txtNameUSDFText, "")

			txtBoxUImage.renderOpacity = 0

			txtNameUSDFText:SetActive(false)
		end
	elseif PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 2 then
		panelCPUContainer:SetActive(false)

		panelCharListUContainer.renderOpacity = 0
		txtBoxUImage.renderOpacity = 0

		PetManagementUtils.applyPetQualityRatingText(petQualityUContainer, data, isValid)
		petRareUContainer:DestroyContent()
		petRareNmlUContainer:DestroyContent()
		panelAbilityUContainer:DestroyContent()
	elseif PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 4 then
		panelCPUContainer:SetActive(true)

		panelCharListUContainer.renderOpacity = 1
		txtBoxUImage.renderOpacity = 0

		petQualityUContainer:DestroyContent()
		petRareUContainer:DestroyContent()
		petRareNmlUContainer:DestroyContent()

		local petTypeUrl = data.petTypeUrl

		if petTypeUrl then
			panelAbilityUContainer:SetActive(true)

			if panelAbilityUContainer:CheckURLLoaded() then
				local objectReference = panelAbilityUContainer.content:GetComponent("ObjectReference")
				local iconUImage = objectReference:GetRefValue("iconUImage")

				iconUImage.url = petTypeUrl
			else
				panelAbilityUContainer:LoadDefaultUrlManually(function()
					local objectReference = panelAbilityUContainer.content:GetComponent("ObjectReference")
					local iconUImage = objectReference:GetRefValue("iconUImage")

					iconUImage.url = petTypeUrl
				end)
			end
		else
			panelAbilityUContainer:DestroyContent()
		end
	else
		panelCPUContainer:SetActive(false)

		panelCharListUContainer.renderOpacity = 0
		txtBoxUImage.renderOpacity = 0

		petQualityUContainer:DestroyContent()
		petRareUContainer:DestroyContent()
		panelAbilityUContainer:DestroyContent()

		if data.hasRareFeature == 1 then
			petRareUContainer:LoadDefaultUrlManually()
			petRareNmlUContainer:DestroyContent()
		else
			petRareUContainer:DestroyContent()
			petRareNmlUContainer:LoadDefaultUrlManually()
		end
	end
end

function BoxPetComponent:pruneBatchReleasePetIds()
	local player = pg.me

	if not self.batchReleasePetIds or not player or not player.petBoxMap then
		return
	end

	local changed = false

	for petId in pairs(self.batchReleasePetIds) do
		local inWarehouse = player.warehousePetBoxMap and player.warehousePetBoxMap:getPetIndex(petId) ~= nil
		local petInfo = player:getPetInfo(petId, true)
		local isInUse = petInfo and self:getIsInUse(petInfo) or false

		if inWarehouse or player.petBoxMap:getPetIndex(petId) == nil or isInUse then
			self.batchReleasePetIds[petId] = nil
			changed = true
		end
	end

	if changed and self.ctrl.inReleaseMode then
		self:refreshBatchReleasePanelState()
	end
end

function BoxPetComponent:refreshBatchReleasePanelState()
	if next(self.batchReleasePetIds) then
		ClientTextUtils.setText(self.txtNumUSDFText, lume.count(self.batchReleasePetIds))
		ClientTextUtils.setText(self.txtSelectedUSDFText, pg.getGameString("PET_MANAGEMENT_CHOOSE"))
		self.btnViewUButton:TryChangePage("button", 0)
		self.btnView2UButton:SetActive(false)
	else
		ClientTextUtils.setText(self.txtNumUSDFText, self.model:countTotalPets())
		ClientTextUtils.setText(self.txtSelectedUSDFText, pg.getGameString("PET_MANAGEMENT_HAVE"))
		self.btnViewUButton:TryChangePage("button", 4)
		self.btnView2UButton:SetActive(true)
	end

	if self.ctrl.warehouseLeftBatch then
		self.ctrl.warehouseLeftBatch:refresh()
	end
end

function BoxPetComponent:modifyBatchReleasePetIds(key, value, clear, skipRefresh)
	if not clear and not self.batchReleasePetIds then
		return
	end

	if clear then
		self.batchReleasePetIds = {}

		if not skipRefresh then
			self.btnDisplayUButton:TryChangePage("Display", 0)
		end
	else
		if not key then
			return
		end

		if value then
			self.batchReleaseSelectCountIndex = self.batchReleaseSelectCountIndex + value
			self.batchReleasePetIds[key] = self.batchReleaseSelectCountIndex
		else
			self.batchReleasePetIds[key] = nil
		end

		if not skipRefresh then
			if self.model:containsAllElements(self.petInfos, self.batchReleasePetIds) then
				self.btnDisplayUButton:TryChangePage("Display", 1)
			else
				self.btnDisplayUButton:TryChangePage("Display", 0)
			end
		end
	end

	if not skipRefresh then
		self:refreshBatchReleasePanelState()
	end
end

function BoxPetComponent:renderReleasePanel()
	self.btnInfoUButton.enabledTooltip = false

	function self.btnInfoUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		pg.global.ui.tips:openPetManagementReleaseDesc()
	end

	ClientTextUtils.setText(self.txtNumUSDFText, self.model:countTotalPets())
	self.btnViewUButton:TryChangePage("button", 4)
	self.btnView2UButton:SetActive(true)
	ClientTextUtils.setText(self.txtSelectedUSDFText, pg.getGameString("PET_MANAGEMENT_HAVE"))

	function self.btnBox2UButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		if self.model:isHomePetMode() then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_TIDY_UP, {
			boxId = self.model:getSelectBoxId()
		})
	end

	self.btnDisplayUButton:TryChangePage("Display", 0)

	function self.btnViewUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_RELEASE_REVIEW, {
			releasePetIds = self.batchReleasePetIds,
			closeCb = function(releasePetIds)
				self.batchReleasePetIds = releasePetIds or self.batchReleasePetIds

				self:refreshPetList()
				self:refreshSelectAllBtn()
			end
		})
	end

	function self.btnView2UButton.luaClick()
		pg.global.showBubbleMessageRaw(pg.getGameString("SELECT_NO_PET"))
	end

	self:activeDragReleaseArea(false)
end

function BoxPetComponent:refreshSelectAllBtn()
	self.btnDisplayUButton.interactable = not self.model:isHomePetMode()
	self.startReleaseBtn.interactable = not self:isReleaseForbidden()

	local atLeastOneValid = false

	for _, data in pairs(self.petInfos) do
		if data.id then
			local isInUse = self:getIsInUse(data)

			if not isInUse then
				atLeastOneValid = true
			end
		end
	end

	if atLeastOneValid then
		self.btnDisplayUButton:TryChangePage("Display", self.model:containsAllElements(self.petInfos, self.batchReleasePetIds) and 1 or 0)
	else
		self.btnDisplayUButton:TryChangePage("Display", 0)
	end
end

function BoxPetComponent:clearCurBoxPetNewTags()
	local petBoxMap = pg.me.petBoxMap
	local boxId = self.model:getSelectBoxId()
	local box = petBoxMap[boxId]

	for i = 1, box.slotCount do
		local petId = box[i]

		if petId then
			self.model:redDot_RecordPetState(petId)
			self.model:redDot_refreshSlot(boxId, petId)
		end
	end
end

function BoxPetComponent:refreshOnDragPro(val)
	if IsNil(self.dragProgressUProgress) then
		self.dragProgressUProgress = nil

		return
	end

	self.dragProgressUProgress.value = val

	self.dragProgressUProgress:SetActive(val > 0.001)
end

local function addBlockedFormationPetIds(set, petList)
	if not petList then
		return
	end

	for _, petInfo in pairs(petList) do
		local petId = Utils.isTable(petInfo) and petInfo.id or petInfo

		if petId and petId ~= "" then
			set[petId] = true
		end
	end
end

function BoxPetComponent:rebuildBlockedFormationPetIdSet()
	local set = {}

	addBlockedFormationPetIds(set, self.inFightPetInfos)
	addBlockedFormationPetIds(set, self.inExplorePetInfos)

	local fightPets = self.ctrl and self.ctrl.fightPets

	if fightPets then
		addBlockedFormationPetIds(set, fightPets.rogueBattlePetIds)
	end

	self.blockedFormationPetIdSet = set
end

function BoxPetComponent:isPetInBlockedFormation(data)
	if not data or not data.id then
		return false
	end

	local set = self.blockedFormationPetIdSet

	if not set then
		self:rebuildBlockedFormationPetIdSet()

		set = self.blockedFormationPetIdSet
	end

	return set[data.id] == true
end

function BoxPetComponent:getIsInUse(data)
	if self:isPetInBlockedFormation(data) then
		return true
	end

	local lockStatus = self.model:getLockStatus(data)

	if not lockStatus then
		return false
	end

	return lockStatus.isValidFavorite or lockStatus.inBattle or lockStatus.inExplore or lockStatus.isSpecial or lockStatus.isInHomeland or lockStatus.isInHomeCamp or lockStatus.isActivityDipatching or lockStatus.inRogue or lockStatus.isSealed or lockStatus.isBoxLocked
end

function BoxPetComponent:bindFilterListBtnCache(button, data)
	if IsNil(button) or not data or not data.id then
		return
	end

	local prevId = button.dataFromUList and button.dataFromUList.id

	if prevId and prevId ~= data.id and self.filterListBtnCaches[prevId] == button then
		self.filterListBtnCaches[prevId] = nil
	end

	self.filterListBtnCaches[data.id] = button
end

function BoxPetComponent:updateButtonPage(dataId, page, data)
	local button

	if self.ctrl.inFilterMode then
		button = self.filterListBtnCaches[dataId]
	else
		button = self.normalListBtnCaches[dataId]
	end

	if IsNil(button) then
		return
	end

	local bound = button.dataFromUList

	if not bound or bound.id ~= dataId then
		return
	end

	button:TryChangePage("Batch", page)
	self:refreshEvolveState(button, page == 1 or page == 2 or page == 3, data)
end

function BoxPetComponent:refreshVisibleBatchSelectPages()
	local function apply(button)
		if IsNil(button) then
			return
		end

		local data = button.dataFromUList

		if not data or not data.id or data.isEmpty then
			return
		end

		if not self.ctrl.inReleaseMode then
			return
		end

		if self:getIsInUse(data) then
			button:TryChangePage("state", 1)
			button:TryChangePage("Batch", 0)
			self:refreshEvolveState(button, false, data)
		elseif self.batchReleasePetIds[data.id] then
			button:TryChangePage("Batch", 1)
			self:refreshEvolveState(button, true, data)
		else
			button:TryChangePage("Batch", 3)
			self:refreshEvolveState(button, true, data)
		end
	end

	if self.ctrl.inFilterMode then
		if not self.boxPetFilterList then
			return
		end

		local btns = self.boxPetFilterList:GetAllButtons()

		if not btns then
			return
		end

		for i = 0, btns.Length - 1 do
			apply(btns[i])
		end
	else
		for i = 0, #self.boxPetNewListContainers do
			local container = self.boxPetNewListContainers[i]

			if container and container.content then
				apply(container.content:GetComponent("UButton"))
			end
		end
	end
end

function BoxPetComponent:onClickDisplay()
	if self.model:isHomePetMode() then
		return
	end

	self:pruneBatchReleasePetIds()

	local validDatas = {}
	local batchReleasePetIds = self.batchReleasePetIds or {}
	local isAllSelected = true

	for _, data in pairs(self.petInfos) do
		if data.id then
			local isInUse = self:getIsInUse(data)

			if not isInUse then
				validDatas[#validDatas + 1] = data

				if not batchReleasePetIds[data.id] then
					isAllSelected = false
				end
			end
		end
	end

	if isAllSelected then
		for _, data in pairs(self.petInfos) do
			if data.id then
				self:modifyBatchReleasePetIds(data.id, nil, nil, true)
			end
		end

		self.btnDisplayUButton:TryChangePage("Display", 0)
	else
		for _, data in ipairs(validDatas) do
			self:modifyBatchReleasePetIds(data.id, 1, nil, true)
		end

		self.btnDisplayUButton:TryChangePage("Display", 1)
	end

	self:refreshVisibleBatchSelectPages()
	self:refreshBatchReleasePanelState()
end

function BoxPetComponent:onDestroy()
	self:invalidateDragReleaseSession()
	self:clearCurBoxPetNewTags()
	self:clearPendingSelectByDrop()
	self:clearDragBatchReleasePetIds()

	self.btnFunctionCache = {}
	self.normalListBtnCaches = {}

	UIComponent.onDestroy(self)
end

function BoxPetComponent:_onBoxSelectorLuaRenderPopup(popup, list)
	self.boxSelector:TryChangePage("expand", 1)

	self.boxSelectorTempList = list

	local popupObjectReference = popup:GetComponent("ObjectReference")

	if IsNil(popupObjectReference) then
		return
	end

	local btnHomeUButton = popupObjectReference:GetRefValue("btnHomeUButton")

	if IsNil(btnHomeUButton) then
		return
	end

	btnHomeUButton:SetActiveFastest(true, true)
	btnHomeUButton:TryChangePage("Home", 1, true)
	btnHomeUButton:SetActiveFastest(true, true)

	local buttonObjectReference = btnHomeUButton:GetComponent("ObjectReference")
	local txtNameUSDFText = buttonObjectReference and buttonObjectReference:GetRefValue("txtNameUSDFText")

	if NotNil(txtNameUSDFText) then
		ClientTextUtils.setText(txtNameUSDFText, pg.getGameString("PET_MANAGEMENT_HOME_WAREHOUSE"))
	end

	function btnHomeUButton.luaClick()
		if self.ctrl.onMoveDisplay then
			return
		end

		self:enterHomePetMode()
	end
end

function BoxPetComponent:_onRenameBox(boxIdx)
	local focusSnapshot = pg.global.navMgr:SaveFocusStackSnapshot()

	self.ctrl:showRename(self.model.RENAME_FOR_BOX, boxIdx, function()
		self:_restoreBoxSelectorFocus(focusSnapshot, boxIdx)
	end, function()
		self:_restoreBoxSelectorFocus(focusSnapshot, boxIdx)
	end, function()
		self.ctrl:startFrameTimer(function()
			self.boxSelector:ClosePopup(true)
		end, 1)
	end)
end

return BoxPetComponent
