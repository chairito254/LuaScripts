-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagement\\Component\\PetWarehouseComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetData = require("Data.pet_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetInfoTipPresenter = require("Guis.Utils.PetInfoTipPresenter")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local PetWarehouseDataAdapter = require("GameApp.PetManage.PetWarehouseDataAdapter")
local PetWarehouseTipsComponent = require("Guis.Panels.PetManagement.Component.PetWarehouseTipsComponent")
local PetWarehouseBatchComponent = require("Guis.Panels.PetManagement.Component.PetWarehouseBatchComponent")
local PetWarehouseFilterComponent = require("Guis.Panels.PetManagement.Component.PetWarehouseFilterComponent")
local ItemUtils = require("Common.Utils.ItemUtils")
local PetConfigData = require("Data.pet_config_data")
local UIConst = require("Const.UIConst")
local HotkeyConst = require("Const.HotkeyConst")
local NoticeDef = require("Common.NoticeDef")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local TimerManager = require("Core.Timer.TimerManager")
local Const = require("Common.Const.Const")
local PetManagementUtils = require("Utils.PetManagementUtils")
local Utils = require("Common.Utils.Utils")
local AddressDataConst = require("Const.AddressDataConst")
local PetWarehouseComponent = Class.LightClass("PetWarehouseComponent", UIComponent)

function PetWarehouseComponent:ctor(ctrl)
	PetWarehouseComponent.super.ctor(self, ctrl)

	self.manager = pg.game.petManage and pg.game.petManage.petWarehouseManager

	function self._managerListener()
		self:followMoveInDestination()
		self:followMoveOutDestination()
		self.batch:onSnapshot()
		self:refreshWarehouse()

		if not pg.me or not pg.me.isRecycling then
			self:refreshBagAfterWarehouseChange()
		end

		self:tryOpenSelectedPetDetails()
		self:tryCompletePendingDragRelease()
	end

	self._loaded = false
	self._visible = false
	self.currentBoxIndex = 1
	self._selectedPetId = nil
	self._selectedPetInfo = nil
	self._selectedButton = nil
	self._selectionVersion = 0
	self._openedSelectionVersion = nil
	self._detailWaitTimerId = nil
	self._detailWaitToken = 0
	self._detailWaitPetId = nil
	self._detailWaitSelectionVersion = nil
	self._releaseConfirmation = nil
	self._boxActionContext = nil
	self._moveInNavigation = nil
	self._moveInBagFocus = nil

	function self._boxOperationListener(operation)
		if self._destroyed or not self._visible then
			return
		end

		self:followMoveInDestination(operation)
		self.batch:onOperation(operation)
		self:onBoxActionCompleted(operation)
	end

	self.petInfoTipPresenter = PetInfoTipPresenter.new(self, nil, {})
	self.tips = PetWarehouseTipsComponent.new(self)
	self.batch = PetWarehouseBatchComponent.new(self)
	self.filter = PetWarehouseFilterComponent.new(self)
	self._warehouseCrownStateById = {}
end

function PetWarehouseComponent:onCreate()
	local container = self.view.warehouseUContainer

	if not container then
		return
	end

	self.refUContainer = container

	if self.manager then
		self.manager:subscribeOperation(self._boxOperationListener)
	end
end

function PetWarehouseComponent:onUContainerLoaded(isSuccess, content)
	if self._destroyed then
		return false
	end

	self._loading = false

	if not isSuccess then
		return false
	end

	content = content or self.refUContainer.content

	if IsNil(content) then
		return false
	end

	self:setTransform(content.transform)

	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.rightListUList = self.objectReference:GetRefValue("rightListUList")
	self.txtNumberUSDFText = self.objectReference:GetRefValue("txtNumberUSDFText")
	self.placeHolderUSDFText = self.objectReference:GetRefValue("placeHolderUSDFText")
	self.btnLeftUButton = self.objectReference:GetRefValue("btnLeftUButton")
	self.btnRightUButton = self.objectReference:GetRefValue("btnRightUButton")
	self.listSelectorUSelector = self.objectReference:GetRefValue("listSelectorUSelector")
	self.lockUButton = self.objectReference:GetRefValue("lockUWidget")
	self.leftHotKeyContent = self.objectReference:GetRefValue("leftHotKeyContent")
	self.rightHotKeyContent = self.objectReference:GetRefValue("rightHotKeyContent")
	self.dragAreaUButton = self.objectReference:GetRefValue("dragAreaUButton")
	self.btnSortBoxUButton = self.objectReference:GetRefValue("btnSortBoxUButton")

	if NotNil(self.btnSortBoxUButton) then
		function self.btnSortBoxUButton.luaClick()
			self:openTidyUp()
		end
	end

	self:activeDragReleaseArea(false)
	self:registerWarehouseListeners()
	self.batch:bind()
	self.filter:bind()

	self._loaded = true

	self:refreshWarehouse()
	self:refreshComponentVisible()

	return true
end

function PetWarehouseComponent:decorateWarehouseHeadData(data)
	if not data or data.isEmpty then
		return data
	end

	local petConfig = PetData[data.templateId] or {}

	data.iconName = data.iconName or petConfig.iconName

	if not data.elementNames or #data.elementNames == 0 then
		local _, elementNames = LuaUIUtils.getElementInfo(petConfig.elementType)

		data.elementNames = elementNames or {}
	end

	data.label = data.label or 0
	data.gender = data.gender or 0
	data.cp = data.cp or 0
	data.hpRatio = data.hpRatio or 1
	data.isFavorite = data.isFavorite == true or (data.favoriteType or 0) > 0
	data.isBoss = Utils.isLabelElite(data.label)
	data.isShiny = Utils.isLabelShiny(data.label)
	data.isDark = Utils.isLabelDark(data.label)
	data.isRainbow = Utils.isRainbowTypeByTemplateId(data.templateId)
	data.isCatchReportingStatus = Utils.isPetCatchReporting(pg and pg.me, data.id) == true

	if data.crownState == nil then
		local cachedCrownState = self._warehouseCrownStateById and self._warehouseCrownStateById[data.id]

		if cachedCrownState ~= nil then
			data.crownState = cachedCrownState
		end
	end

	return data
end

function PetWarehouseComponent:refreshWarehousePetCrown(button, data, petInfo)
	if IsNil(button) then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")

	if IsNil(objectReference) then
		return
	end

	local petCrownUContainer = objectReference:GetRefValue("petCrownUContainer")

	if not data or data.isEmpty or not data.id then
		LuaUIUtils.refreshPetCrownContainer(petCrownUContainer, UIConst.PET_CROWN_STATE.NONE)

		return
	end

	local extraData = {
		petInfo = petInfo,
		crownState = data.crownState
	}
	local crownState = LuaUIUtils.resolvePetCrownState(petInfo, data, extraData)

	data.crownState = crownState

	if not self._warehouseCrownStateById then
		self._warehouseCrownStateById = {}
	end

	self._warehouseCrownStateById[data.id] = crownState

	LuaUIUtils.refreshPetCrownContainer(petCrownUContainer, crownState)
end

function PetWarehouseComponent:cacheWarehousePetCrownsFromBag(petIds)
	if not Utils.isTable(petIds) then
		return
	end

	if not self._warehouseCrownStateById then
		self._warehouseCrownStateById = {}
	end

	for index = 1, #petIds do
		local petId = petIds[index]

		if petId then
			local petInfo = self.manager and self.manager:getPetInfo(petId)

			if petInfo == nil and pg and pg.me and pg.me.pets then
				petInfo = pg.me.pets[petId]
			end

			if petInfo then
				self._warehouseCrownStateById[petId] = LuaUIUtils.resolvePetCrownState(petInfo, {
					id = petId
				}, nil)
			end
		end
	end
end

function PetWarehouseComponent:showWarehouseSortLabel(btn, data, isValid)
	local objectReference = btn:GetComponent("ObjectReference")

	if IsNil(objectReference) then
		return
	end

	local panelCPUContainer = objectReference:GetRefValue("panelCPUContainer")
	local panelCharListUContainer = objectReference:GetRefValue("panelCharListUContainer")
	local txtBoxUImage = objectReference:GetRefValue("txtBoxUImage")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local petQualityUContainer = objectReference:GetRefValue("petQualityUContainer")
	local petRareUContainer = objectReference:GetRefValue("petRareUContainer")
	local petRareNmlUContainer = objectReference:GetRefValue("petRareNmlUContainer")
	local panelAbilityUContainer = objectReference:GetRefValue("panelAbilityUContainer")
	local showLabelInfo = self.filter and self.filter.showLabelInfo == true
	local sortCondition = self.filter and self.filter.query and self.filter.query.sortId or 0

	if not showLabelInfo then
		if NotNil(panelCPUContainer) then
			panelCPUContainer:SetActive(true)
		end

		if NotNil(panelCharListUContainer) then
			panelCharListUContainer.renderOpacity = 1
		end

		if NotNil(txtBoxUImage) then
			txtBoxUImage.renderOpacity = 0
		end

		if NotNil(petQualityUContainer) then
			petQualityUContainer:DestroyContent()
		end

		if NotNil(petRareUContainer) then
			petRareUContainer:DestroyContent()
		end

		if NotNil(petRareNmlUContainer) then
			petRareNmlUContainer:DestroyContent()
		end

		if NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:DestroyContent()
		end

		return
	end

	local labelType = PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition]

	if labelType == 0 then
		if NotNil(panelCPUContainer) then
			panelCPUContainer:SetActive(true)
		end

		if NotNil(panelCharListUContainer) then
			panelCharListUContainer.renderOpacity = 1
		end

		if NotNil(txtBoxUImage) then
			txtBoxUImage.renderOpacity = 0
		end

		if NotNil(petQualityUContainer) then
			petQualityUContainer:DestroyContent()
		end

		if NotNil(petRareUContainer) then
			petRareUContainer:DestroyContent()
		end

		if NotNil(petRareNmlUContainer) then
			petRareNmlUContainer:DestroyContent()
		end

		if NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:DestroyContent()
		end
	elseif labelType == 1 then
		if NotNil(panelCPUContainer) then
			panelCPUContainer:SetActive(false)
		end

		if NotNil(panelCharListUContainer) then
			panelCharListUContainer.renderOpacity = 0
		end

		if NotNil(txtBoxUImage) then
			txtBoxUImage.renderOpacity = 1
		end

		if NotNil(petQualityUContainer) then
			petQualityUContainer:DestroyContent()
		end

		if NotNil(petRareUContainer) then
			petRareUContainer:DestroyContent()
		end

		if NotNil(petRareNmlUContainer) then
			petRareNmlUContainer:DestroyContent()
		end

		if NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:DestroyContent()
		end

		if NotNil(txtNameUSDFText) then
			txtNameUSDFText:SetActive(true)

			local SORT_IDX = PetManagementDataHelper.SORT_IDX

			if sortCondition == SORT_IDX.TIME then
				local seconds = (Time.secondCache * 1000 - (data.time or 0)) / 1000

				ClientTextUtils.setText(txtNameUSDFText, TimeUtils.getFormatStringDay(seconds))
			elseif sortCondition == SORT_IDX.BOOK_NUM then
				ClientTextUtils.setText(txtNameUSDFText, PetManagementUtils.getDisplayBookNumberText(data))
			elseif sortCondition == SORT_IDX.LEVEL then
				ClientTextUtils.setText(txtNameUSDFText, ClientTextUtils.formatShortLevel(data.level))
			else
				ClientTextUtils.setText(txtNameUSDFText, "")

				txtBoxUImage.renderOpacity = 0

				txtNameUSDFText:SetActive(false)
			end
		end
	elseif labelType == 2 then
		if NotNil(panelCPUContainer) then
			panelCPUContainer:SetActive(false)
		end

		if NotNil(panelCharListUContainer) then
			panelCharListUContainer.renderOpacity = 0
		end

		if NotNil(txtBoxUImage) then
			txtBoxUImage.renderOpacity = 0
		end

		if NotNil(petQualityUContainer) then
			PetManagementUtils.applyPetQualityRatingText(petQualityUContainer, data, isValid)
		end

		if NotNil(petRareUContainer) then
			petRareUContainer:DestroyContent()
		end

		if NotNil(petRareNmlUContainer) then
			petRareNmlUContainer:DestroyContent()
		end

		if NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:DestroyContent()
		end
	elseif labelType == 4 then
		if NotNil(panelCPUContainer) then
			panelCPUContainer:SetActive(true)
		end

		if NotNil(panelCharListUContainer) then
			panelCharListUContainer.renderOpacity = 1
		end

		if NotNil(txtBoxUImage) then
			txtBoxUImage.renderOpacity = 0
		end

		if NotNil(petQualityUContainer) then
			petQualityUContainer:DestroyContent()
		end

		if NotNil(petRareUContainer) then
			petRareUContainer:DestroyContent()
		end

		if NotNil(petRareNmlUContainer) then
			petRareNmlUContainer:DestroyContent()
		end

		local petTypeUrl = data.petTypeUrl

		if petTypeUrl and NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:SetActive(true)

			if panelAbilityUContainer:CheckURLLoaded() then
				local refs = panelAbilityUContainer.content:GetComponent("ObjectReference")
				local iconUImage = refs:GetRefValue("iconUImage")

				iconUImage.url = petTypeUrl
			else
				panelAbilityUContainer:LoadDefaultUrlManually(function()
					local refs = panelAbilityUContainer.content:GetComponent("ObjectReference")
					local iconUImage = refs:GetRefValue("iconUImage")

					iconUImage.url = petTypeUrl
				end)
			end
		elseif NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:DestroyContent()
		end
	else
		if NotNil(panelCPUContainer) then
			panelCPUContainer:SetActive(false)
		end

		if NotNil(panelCharListUContainer) then
			panelCharListUContainer.renderOpacity = 0
		end

		if NotNil(txtBoxUImage) then
			txtBoxUImage.renderOpacity = 0
		end

		if NotNil(petQualityUContainer) then
			petQualityUContainer:DestroyContent()
		end

		if NotNil(panelAbilityUContainer) then
			panelAbilityUContainer:DestroyContent()
		end

		if data.hasRareFeature == 1 then
			if NotNil(petRareUContainer) then
				petRareUContainer:LoadDefaultUrlManually()
			end

			if NotNil(petRareNmlUContainer) then
				petRareNmlUContainer:DestroyContent()
			end
		else
			if NotNil(petRareUContainer) then
				petRareUContainer:DestroyContent()
			end

			if NotNil(petRareNmlUContainer) then
				petRareNmlUContainer:LoadDefaultUrlManually()
			end
		end
	end
end

function PetWarehouseComponent:applyDraggingReplicaSortLabel(button, data, isValid)
	if IsNil(button) then
		return
	end

	if IsNil(button.replicaWidget) then
		return
	end

	self:showWarehouseSortLabel(button.replicaWidget, data, isValid)
end

function PetWarehouseComponent:refreshWarehouseHeadExtras(button, data)
	local refs = button:GetComponent("ObjectReference")

	if IsNil(refs) then
		return
	end

	local iconFav = refs:GetRefValue("iconFavUContainer")

	if NotNil(iconFav) and NotNil(iconFav.content) then
		iconFav.content.gameObject:SetActiveEx(data and data.isFavorite == true)
	end
end

function PetWarehouseComponent:isSnapshotPetInLockedBox(petId)
	local manager = self.manager

	if not manager or not manager.getSnapshot or not petId then
		return false
	end

	local snapshot = manager:getSnapshot()
	local location = snapshot and snapshot.locations and snapshot.locations[petId]

	return location ~= nil and location.inLockedBox == true
end

function PetWarehouseComponent:isWarehousePetInLockedBox(petId)
	local manager = self.manager

	if not manager or not manager.getSnapshot or not petId then
		return false
	end

	local snapshot = manager:getSnapshot()
	local location = snapshot and snapshot.locations and snapshot.locations[petId]

	if not location or location.domain ~= PetWarehouseConst.DOMAIN.WAREHOUSE then
		return false
	end

	return location.inLockedBox == true
end

function PetWarehouseComponent:getWarehouseLockStatus(data)
	local favoriteType = tonumber(data.favoriteType) or 0
	local isForbidden = false

	if PetConfigData.forbidReleasePet and LuaUIUtils.tableContains then
		isForbidden = LuaUIUtils.tableContains(PetConfigData.forbidReleasePet, data.templateId) == true
	end

	local isBoxLocked = data.inLockedBox == true

	if data.inLockedBox == nil and data.id then
		isBoxLocked = self:isWarehousePetInLockedBox(data.id)
	end

	return {
		inRogue = false,
		isActivityDipatching = false,
		isInHomeCamp = false,
		isInHomeland = false,
		inExplore = false,
		inBattle = false,
		isValidFavorite = favoriteType > 0,
		favoriteType = favoriteType,
		isSpecial = isForbidden,
		isSealed = data.isSealed == true,
		isBoxLocked = isBoxLocked
	}
end

function PetWarehouseComponent:isWarehousePetInUse(data)
	if not data or data.isEmpty then
		return false
	end

	local lockStatus = self:getWarehouseLockStatus(data)

	return lockStatus.isValidFavorite or lockStatus.inBattle or lockStatus.inExplore or lockStatus.isSpecial or lockStatus.isInHomeland or lockStatus.isInHomeCamp or lockStatus.isActivityDipatching or lockStatus.inRogue or lockStatus.isSealed or lockStatus.isBoxLocked
end

function PetWarehouseComponent:displayWarehouseUsedState(button, txtUsedUSDFText, data)
	local lockStatus = self:getWarehouseLockStatus(data)
	local usedTxtKey = ""

	if lockStatus.inBattle or lockStatus.inRogue then
		usedTxtKey = "NOT_CAN_REALSE_INBATTLE"
	elseif lockStatus.isSealed then
		usedTxtKey = "PET_IN_STORING"
	elseif lockStatus.isSpecial then
		usedTxtKey = "NOT_CAN_REALSE_INFORBID"
	elseif lockStatus.isInHomeland then
		usedTxtKey = "NOT_CAN_REALSE_INHOMELAND"
	elseif lockStatus.isActivityDipatching then
		usedTxtKey = "NOT_CAN_REALSE_INACTIVITY_DISPATCH"
	elseif lockStatus.inExplore then
		usedTxtKey = "NOT_CAN_REALSE_INEXPLORE"
	elseif lockStatus.isValidFavorite then
		usedTxtKey = "NOT_CAN_REALSE_INFAVORITE"
	elseif lockStatus.isBoxLocked then
		usedTxtKey = "RANDOM_SHOP_SAVED"
	end

	local showBoxBanned = usedTxtKey == "RANDOM_SHOP_SAVED"

	if NotNil(txtUsedUSDFText) then
		if showBoxBanned then
			txtUsedUSDFText:SetActive(false)
			ClientTextUtils.setText(txtUsedUSDFText, "")
		else
			ClientTextUtils.setText(txtUsedUSDFText, usedTxtKey ~= "" and pg.getGameString(usedTxtKey) or "")
		end
	end

	if showBoxBanned then
		LuaUIUtils.setPetHeadBoxBanned(button, true, pg.getGameString(usedTxtKey))
	else
		LuaUIUtils.setPetHeadBoxBanned(button, false)
	end
end

function PetWarehouseComponent:notifyWarehouseManageBlocked(data)
	if not data then
		return
	end

	local lockStatus = self:getWarehouseLockStatus(data)
	local usedTxtKey = ""

	if lockStatus.inBattle or lockStatus.inRogue then
		usedTxtKey = "NOT_CAN_REALSE_INBATTLE"
	elseif lockStatus.isSealed then
		usedTxtKey = "PET_IN_STORING"
	elseif lockStatus.isSpecial then
		usedTxtKey = "NOT_CAN_REALSE_INFORBID"
	elseif lockStatus.isInHomeland then
		usedTxtKey = "NOT_CAN_REALSE_INHOMELAND"
	elseif lockStatus.isActivityDipatching then
		usedTxtKey = "NOT_CAN_REALSE_INACTIVITY_DISPATCH"
	elseif lockStatus.inExplore then
		usedTxtKey = "NOT_CAN_REALSE_INEXPLORE"
	elseif lockStatus.isValidFavorite then
		usedTxtKey = "NOT_CAN_REALSE_INFAVORITE"
	elseif lockStatus.isBoxLocked then
		usedTxtKey = "RANDOM_SHOP_SAVED"
	end

	if usedTxtKey ~= "" then
		pg.global.showBubbleMessageRaw(pg.getGameString(usedTxtKey))
	end
end

function PetWarehouseComponent:applyWarehousePetSelectedVisual(button, data)
	if IsNil(button) or not button.TryChangePage then
		return
	end

	local selected = false

	if data and not data.isEmpty and self._selectedPetDomain == PetWarehouseConst.DOMAIN.WAREHOUSE and self._selectedPetId ~= nil and self._selectedPetId == data.id then
		selected = true
	end

	local page = 0

	if selected then
		page = 5
	end

	button.isSelected = selected

	button:TryChangePage("button", page)
end

function PetWarehouseComponent:syncVisibleWarehousePetSelection()
	local list = self.rightListUList

	if not list or not list.GetAllButtons then
		return
	end

	local buttons = list:GetAllButtons()

	if not buttons then
		return
	end

	local lastIndex = buttons.Length and buttons.Length - 1 or #buttons

	for i = 0, lastIndex do
		local itemButton = buttons[i]

		if itemButton then
			self:applyWarehousePetSelectedVisual(itemButton, itemButton.dataFromUList)
		end
	end
end

function PetWarehouseComponent:applyWarehouseManageVisual(button, data)
	if not button or not data then
		return
	end

	local objectReference = button.GetComponent and button:GetComponent("ObjectReference")
	local txtUsed = objectReference and objectReference.GetRefValue and objectReference:GetRefValue("txtUsedUSDFText")
	local inBatch = self.batch and self.batch.active == true

	if data.isEmpty or not inBatch then
		if button.TryChangePage then
			button:TryChangePage("Batch", 0)
			button:TryChangePage("state", 0)
		end

		if txtUsed and txtUsed.SetActive then
			txtUsed:SetActive(false)
		end

		if not data.isEmpty and LuaUIUtils.renderPetHeadEvolveArrow then
			LuaUIUtils.renderPetHeadEvolveArrow(button, false, data)
		end

		LuaUIUtils.setPetHeadBoxBanned(button, false)

		return
	end

	local inUse = self:isWarehousePetInUse(data)

	if inUse then
		button:TryChangePage("state", 1)
		button:TryChangePage("Batch", 0)

		if txtUsed and txtUsed.SetActive then
			txtUsed:SetActive(true)
		end

		self:displayWarehouseUsedState(button, txtUsed, data)

		if LuaUIUtils.renderPetHeadEvolveArrow then
			LuaUIUtils.renderPetHeadEvolveArrow(button, false, data)
		end

		return
	end

	button:TryChangePage("state", 0)

	if txtUsed and txtUsed.SetActive then
		txtUsed:SetActive(false)
	end

	LuaUIUtils.setPetHeadBoxBanned(button, false)

	local selected = self.batch.selected and self.batch.selected[data.id]

	button:TryChangePage("Batch", selected and 1 or 3)

	if LuaUIUtils.renderPetHeadEvolveArrow then
		LuaUIUtils.renderPetHeadEvolveArrow(button, true, data)
	end
end

function PetWarehouseComponent:openTidyUp()
	if self._destroyed or not self._visible or not self.manager then
		return
	end

	if self.ctrl and (self.ctrl.isDragging or self.ctrl.onMoveDisplay) then
		return
	end

	local boxes = self.manager:getWarehouseBoxes() or {}
	local box = boxes[self.currentBoxIndex]

	if not box then
		return
	end

	if box.needUnlock or box.tempLocked then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_TIDY_UP, {
		boxId = box.id,
		boxType = PetWarehouseConst.BOX_TYPE_BY_DOMAIN[PetWarehouseConst.DOMAIN.WAREHOUSE]
	})
end

function PetWarehouseComponent:registerWarehouseListeners()
	if self.lockUButton then
		function self.lockUButton.luaClick()
			local boxes = self.manager and self.manager:getWarehouseBoxes() or {}
			local box = boxes[self.currentBoxIndex]

			if not box then
				return
			end

			if box.tempLocked == true then
				self:showWarehouseTempLockedNotice()

				return
			end

			if box.needUnlock then
				self:tryUnlockWarehouseBox(box.id)

				return
			end

			self:toggleWarehouseBoxLock(box.id)
		end
	end

	if self.btnLeftUButton then
		function self.btnLeftUButton.luaClick()
			self:switchBox(-1)
		end
	end

	if self.btnRightUButton then
		function self.btnRightUButton.luaClick()
			self:switchBox(1)
		end
	end

	if self.leftHotKeyContent then
		self.leftHotKeyContent:SetHotKeyPaths("<Keyboard>/z")
	end

	if self.rightHotKeyContent then
		self.rightHotKeyContent:SetHotKeyPaths("<Keyboard>/c")
	end

	if self.ctrl and self.ctrl.bindHotKeyPerform then
		self.ctrl:bindHotKeyPerform("Raw/KeyboardZ", function()
			self:switchBox(-1)
		end, self.btnLeftUButton and self.btnLeftUButton.gameObject, "petWarehousePreviousBox")
		self.ctrl:bindHotKeyPerform("Raw/KeyboardC", function()
			self:switchBox(1)
		end, self.btnRightUButton and self.btnRightUButton.gameObject, "petWarehouseNextBox")
	end
end

function PetWarehouseComponent:getCurrentGamepadPet()
	local navMgr = pg.global.navMgr

	if not navMgr then
		return nil
	end

	local groupName = navMgr.CurrentFocusedGroupName

	if groupName ~= "ComPetList" and groupName ~= "WarehouseRightPanel" then
		return nil
	end

	local focusedContent = navMgr.CurrentFocusedUContent

	if IsNil(focusedContent) then
		return nil
	end

	local petData = focusedContent.dataFromUList

	if not petData or petData.isEmpty or petData.id == nil then
		return nil
	end

	local petDomain = petData._warehouseSlot and PetWarehouseConst.DOMAIN.WAREHOUSE or PetWarehouseConst.DOMAIN.BAG

	return petData, petDomain
end

function PetWarehouseComponent:canHandleFocusedPetAction()
	if self._destroyed or not self._visible or not self.manager then
		return false
	end

	if self.batch and self.batch.active then
		return false
	end

	if self.ctrl and self.ctrl.isDragging then
		return false
	end

	return true
end

function PetWarehouseComponent:getFocusedMoveInPetIds(petId)
	local ids = {}
	local boxPets = self.ctrl and self.ctrl.boxPets

	if self.ctrl and self.ctrl.inReleaseMode and boxPets and Utils.isTable(boxPets.batchReleasePetIds) then
		local ordered = {}

		for selectedId, order in pairs(boxPets.batchReleasePetIds) do
			ordered[#ordered + 1] = {
				petId = selectedId,
				order = order
			}
		end

		table.sort(ordered, function(left, right)
			return left.order < right.order
		end)

		for _, item in ipairs(ordered) do
			ids[#ids + 1] = item.petId
		end
	end

	if #ids == 0 and petId then
		ids[1] = petId
	end

	return ids
end

function PetWarehouseComponent:moveFocusedPet()
	if not self:canHandleFocusedPetAction() then
		return
	end

	local petData, petDomain = self:getCurrentGamepadPet()

	if not petData then
		return
	end

	local petId = petData.id

	if self.manager:getPetDomain(petId) ~= petDomain then
		return
	end

	if petDomain == PetWarehouseConst.DOMAIN.BAG then
		self:requestMoveIn(self:getFocusedMoveInPetIds(petId))

		return
	end

	self:requestMoveOut({
		petId
	}, self:getMoveOutTransferOptions())
end

function PetWarehouseComponent:releaseBagManagePets(petId)
	local boxPets = self.ctrl and self.ctrl.boxPets

	if not boxPets or not boxPets.doBatchRelease then
		return
	end

	if boxPets.isReleaseForbidden and boxPets:isReleaseForbidden() then
		return
	end

	local ids = self:getFocusedMoveInPetIds(petId)

	if #ids == 0 then
		return
	end

	local petIdMap = {}

	for index = 1, #ids do
		petIdMap[ids[index]] = index
	end

	self:trackMoveInBagFocus(ids)
	boxPets:doBatchRelease(function()
		return self:canHandleFocusedPetAction() and self.ctrl and self.ctrl.inReleaseMode == true
	end, petIdMap)
end

function PetWarehouseComponent:releaseFocusedPet()
	if not self:canHandleFocusedPetAction() then
		return
	end

	local petData, petDomain = self:getCurrentGamepadPet()

	if not petData then
		return
	end

	local petId = petData.id
	local player = self.manager:getPlayer()

	if not player or self.manager:getPetDomain(petId) ~= petDomain then
		return
	end

	if petDomain == PetWarehouseConst.DOMAIN.BAG and self.ctrl and self.ctrl.inReleaseMode then
		self:releaseBagManagePets(petId)

		return
	end

	if petDomain == PetWarehouseConst.DOMAIN.BAG then
		self:trackMoveInBagFocus({
			petId
		})
	end

	self:releasePet(petId, petDomain, player)
end

function PetWarehouseComponent:getWrappedWarehouseBoxIndex(currentIndex, offset, count)
	if not count or count <= 0 then
		return currentIndex
	end

	local index = currentIndex or 1
	local step = offset or 0
	local nextIndex = index + step

	if nextIndex < 1 then
		return count
	end

	if count < nextIndex then
		return 1
	end

	return nextIndex
end

function PetWarehouseComponent:isSwitchableWarehouseBox(box)
	if not Utils.isTable(box) then
		return false
	end

	if box.needUnlock == true then
		return false
	end

	return true
end

function PetWarehouseComponent:collectSwitchableWarehouseBoxIndexes(boxes)
	local indexes = {}

	if not Utils.isTable(boxes) then
		return indexes
	end

	for index = 1, #boxes do
		if self:isSwitchableWarehouseBox(boxes[index]) then
			indexes[#indexes + 1] = index
		end
	end

	return indexes
end

function PetWarehouseComponent:getNextSwitchableWarehouseBoxIndex(currentIndex, offset, boxes)
	local indexes = self:collectSwitchableWarehouseBoxIndexes(boxes)
	local count = #indexes

	if count == 0 then
		return currentIndex
	end

	local position

	for index = 1, count do
		if indexes[index] == currentIndex then
			position = index

			break
		end
	end

	local step = offset or 0

	if step == 0 then
		return currentIndex
	end

	local nextPosition

	if position ~= nil then
		nextPosition = self:getWrappedWarehouseBoxIndex(position, step, count)
	elseif step > 0 then
		for index = 1, count do
			if indexes[index] > (currentIndex or 0) then
				nextPosition = index

				break
			end
		end

		if nextPosition == nil then
			nextPosition = 1
		end
	else
		for index = count, 1, -1 do
			if indexes[index] < (currentIndex or 0) then
				nextPosition = index

				break
			end
		end

		if nextPosition == nil then
			nextPosition = count
		end
	end

	return indexes[nextPosition]
end

function PetWarehouseComponent:shouldEnableWarehouseBoxArrows()
	if self.filter and self.filter.active then
		return false
	end

	local boxes = self.manager and self.manager:getWarehouseBoxes()

	if not Utils.isTable(boxes) then
		return false
	end

	local indexes = self:collectSwitchableWarehouseBoxIndexes(boxes)

	if #indexes > 1 then
		return true
	end

	if #indexes ~= 1 then
		return false
	end

	local currentBox = boxes[self.currentBoxIndex]

	if currentBox and not self:isSwitchableWarehouseBox(currentBox) then
		return true
	end

	return false
end

function PetWarehouseComponent:isWarehouseSelectorPopupOpen()
	local selector = self.listSelectorUSelector

	return NotNil(selector) and selector.isPopup == true
end

function PetWarehouseComponent:getWarehouseAreaRect()
	local rects = self:collectWarehousePointerRects()

	if Utils.isTable(rects) and #rects > 0 then
		return rects[1]
	end

	return nil
end

function PetWarehouseComponent:collectWarehousePointerRects()
	local rects = {}

	local function add(widget)
		if NotNil(widget) and widget.rectTransform then
			rects[#rects + 1] = widget.rectTransform
		end
	end

	add(self.uWidget)
	add(self.refUContainer)
	add(self.rightListUList)

	return rects
end

function PetWarehouseComponent:isPointerInWarehouseArea()
	local rects = self:collectWarehousePointerRects()

	if not Utils.isTable(rects) or #rects == 0 then
		return false
	end

	local mouse = UnityInput.mousePosition
	local camera = CS.XGUI.UWidget.uiCamera

	for index = 1, #rects do
		if CS.UnityEngine.RectTransformUtility.RectangleContainsScreenPoint(rects[index], mouse, camera) then
			return true
		end
	end

	return false
end

function PetWarehouseComponent:shouldWarehouseListConsumeScroll()
	return self.filter and self.filter.active == true
end

function PetWarehouseComponent:refreshWarehouseListScroll()
	local list = self.rightListUList

	if IsNil(list) then
		return
	end

	local listScrolls = self:shouldWarehouseListConsumeScroll()

	if list.SetScrollDisabled then
		list:SetScrollDisabled(not listScrolls)
	end

	local listener

	if list.GetComponent then
		listener = list:GetComponent("ScrollEventListener")
	end

	if IsNil(listener) then
		local go = list.gameObject

		if NotNil(go) and go.GetComponent then
			listener = go:GetComponent("ScrollEventListener")
		end
	end

	if NotNil(listener) then
		listener.enabled = listScrolls
	end
end

function PetWarehouseComponent:canSwitchWarehouseBoxByScroll()
	if self._destroyed or not self._visible or not self._loaded then
		return false
	end

	if self.filter and self.filter.active then
		return false
	end

	if self.ctrl and (self.ctrl.isDragging or self.ctrl.onMoveDisplay) then
		return false
	end

	if self:isWarehouseSelectorPopupOpen() then
		return false
	end

	return true
end

function PetWarehouseComponent:handleWarehouseBoxScroll(isPre)
	if self._destroyed or not self._visible then
		return nil
	end

	if self:isWarehouseSelectorPopupOpen() then
		return "pass"
	end

	if not self:isPointerInWarehouseArea() then
		return nil
	end

	if isPre ~= nil and self:canSwitchWarehouseBoxByScroll() then
		self:switchBox(isPre and -1 or 1)
	end

	return "consume"
end

function PetWarehouseComponent:switchBox(offset)
	if self.filter and self.filter.active then
		return
	end

	local boxes = self.manager and self.manager:getWarehouseBoxes()

	if not Utils.isTable(boxes) or #boxes == 0 then
		return
	end

	local nextIndex = self:getNextSwitchableWarehouseBoxIndex(self.currentBoxIndex, offset, boxes)

	if nextIndex == self.currentBoxIndex then
		return
	end

	self:clearPetSelection()

	self.currentBoxIndex = nextIndex

	self:refreshWarehouse()
end

function PetWarehouseComponent:switchBoxToId(boxId)
	local boxes = self.manager and self.manager:getWarehouseBoxes() or {}

	for index, box in ipairs(boxes) do
		if tostring(box.id) == tostring(boxId) then
			if self.currentBoxIndex ~= index then
				self:clearPetSelection()

				self.currentBoxIndex = index

				self:refreshWarehouse()
			end

			return
		end
	end
end

function PetWarehouseComponent:keepWarehouseSelectorPlaceholder(selector)
	if not selector or selector.selectedIndex == nil or selector.selectedIndex < 0 then
		return
	end

	selector:ForceSelect(-1, false)

	if self.placeHolderUSDFText then
		self.placeHolderUSDFText.visibility = CS.XGUI.EVisibility.SelfHitTestInvisible
	end
end

function PetWarehouseComponent:setWarehouseRenameButtonColor(editButton, isSelected)
	if IsNil(editButton) then
		return
	end

	local page = 0

	if isSelected then
		page = 1
	end

	editButton:TryChangePage("ColorBtn", page)
end

function PetWarehouseComponent:applyDisplayedWarehouseBoxItem(button, editButton, selected)
	if IsNil(button) then
		return
	end

	local selectedPage = 5
	local isDisplayed = false

	if selected then
		isDisplayed = true
	end

	if isDisplayed then
		local keepingPage = false

		function button.luaTryChangePage(controllerName, pageIndex)
			if controllerName ~= "button" then
				return
			end

			if pageIndex == selectedPage or button.isSelected ~= true or keepingPage then
				return
			end

			keepingPage = true

			button:TryChangePage("button", selectedPage)

			keepingPage = false
		end

		button.isSelected = true

		button:TryChangePage("button", selectedPage)
	else
		button.luaTryChangePage = nil
		button.isSelected = false

		button:TryChangePage("button", 0)
	end

	self:setWarehouseRenameButtonColor(editButton, isDisplayed)
end

function PetWarehouseComponent:keepUnlockBoxBackground(button)
	if IsNil(button) then
		return
	end

	button.isSelected = false
	button.buttonType = CS.XGUI.EButtonType.Default
	button.enableAutoTransition = false

	local keepingPage = false

	function button.luaTryChangePage(controllerName, pageIndex)
		if controllerName ~= "button" then
			return
		end

		if keepingPage then
			return
		end

		if pageIndex ~= 0 then
			keepingPage = true
			button.isSelected = false

			button:TryChangePage("button", 0)

			keepingPage = false
		end
	end

	button:TryChangePage("button", 0)
end

function PetWarehouseComponent:getDefaultWarehouseBoxName(boxId)
	return pg.getGameString(PetWarehouseConst.PetWarehouseText.TAB_NAME) .. tostring(boxId)
end

function PetWarehouseComponent:refreshBoxSelector(boxes, currentBox)
	if self.lockUButton then
		self.lockUButton.interactable = currentBox ~= nil

		local showLocked = currentBox and (currentBox.needUnlock or currentBox.locked or currentBox.tempLocked)

		self.lockUButton:TryChangePage("Lock", showLocked and 1 or 0)
	end

	if not self.listSelectorUSelector then
		return
	end

	local player = self.manager and self.manager:getPlayer()
	local costItemId, costItemNum = PetWarehouseDataAdapter:getNextUnlockCost(player)
	local costText = PetWarehouseDataAdapter:formatUnlockCostText(costItemId, costItemNum)
	local boxInfos = {}

	for index, box in ipairs(boxes) do
		local name = box.customName

		if not name or name == "" then
			name = self:getDefaultWarehouseBoxName(box.id)
		end

		local needUnlock = box.needUnlock == true
		local tempLocked = box.tempLocked == true

		boxInfos[index] = {
			idx = box.id,
			tIndex = needUnlock and 1 or 0,
			needUnlock = needUnlock,
			tempLocked = tempLocked,
			label = string.format("%s (%d/%d)", name, box.count, box.slotCount),
			customName = box.customName,
			countNum = string.format("%d/%d", box.count, box.slotCount),
			count = box.count,
			slotCount = box.slotCount,
			locked = box.locked,
			costText = costText
		}
	end

	local function renderPopup(popup)
		local popupReference = popup:GetComponent("ObjectReference")
		local warehouseList = popupReference and popupReference:GetRefValue("warehouseListUList")

		if not warehouseList then
			return
		end

		function warehouseList.luaCheckCanSelected(data)
			if data and (data.needUnlock or data.tIndex == 1) then
				return false
			end

			return true
		end

		function warehouseList.luaRenderItem(button, _, data)
			local itemReference = button:GetComponent("ObjectReference")

			if itemReference then
				local numText = itemReference:GetRefValue("numUText")
				local nameText = itemReference:GetRefValue("nameUText")

				if data.needUnlock or data.tIndex == 1 then
					ClientTextUtils.setText(nameText, pg.getGameString(PetWarehouseConst.PetWarehouseText.UNLOCK_NEW_BOX))
					ClientTextUtils.setText(numText, data.costText or "")

					function button.luaClick()
						self:tryUnlockWarehouseBox(data.idx)
					end

					self:keepUnlockBoxBackground(button)

					return
				end

				local lockButton = itemReference:GetRefValue("lockUButton1")
				local editButton = itemReference:GetRefValue("btnEditUButton")

				ClientTextUtils.setText(numText, data.countNum)
				ClientTextUtils.setText(nameText, data.customName ~= "" and data.customName or self:getDefaultWarehouseBoxName(data.idx))

				if lockButton then
					lockButton:TryChangePage("Lock", (data.locked or data.tempLocked) and 1 or 0)

					if data.tempLocked == true then
						function lockButton.luaClick()
							self:showWarehouseTempLockedNotice()
						end
					else
						function lockButton.luaClick()
							self:toggleWarehouseBoxLock(data.idx)
						end
					end
				end

				if editButton then
					function editButton.luaClick()
						self:renameWarehouseBox(data.idx)
					end

					editButton.luaSelectChanged = nil
				end

				local isDisplayedBox = currentBox ~= nil and data.idx == currentBox.id

				self:applyDisplayedWarehouseBoxItem(button, editButton, isDisplayedBox)
			end

			function button.luaClick()
				self:switchBoxToId(data.idx)
			end
		end

		function warehouseList.luaFinishRender(subList)
			local buttons = subList:GetAllButtons()

			if not buttons then
				return
			end

			local usingGamepad = pg.game.input:isUsingGamepad()

			for i = 0, buttons.Length - 1 do
				local data = buttons[i].dataFromUList

				if data and not data.needUnlock and data.tIndex ~= 1 then
					local itemReference = buttons[i]:GetComponent("ObjectReference")
					local editButton = itemReference and itemReference:GetRefValue("btnEditUButton")
					local isDisplayedBox = currentBox ~= nil and data.idx == currentBox.id

					self:applyDisplayedWarehouseBoxItem(buttons[i], editButton, isDisplayedBox)

					if isDisplayedBox and usingGamepad then
						subList:SelectItem(i, false)
					end
				end
			end
		end

		warehouseList:SetList(boxInfos)
	end

	self.listSelectorUSelector.luaRenderPopup = renderPopup

	function self.listSelectorUSelector.luaSelectedChanged(selector)
		self:keepWarehouseSelectorPlaceholder(selector)
	end

	self.listSelectorUSelector:SetOptions(boxInfos)
	self.listSelectorUSelector:ForceSelect(-1, false)

	if self.listSelectorUSelector.isPopup then
		local popup = self.listSelectorUSelector:GetPopupInstance()

		if NotNil(popup) then
			renderPopup(popup)
		end
	end

	if currentBox and self.placeHolderUSDFText then
		local selectedInfo = boxInfos[self.currentBoxIndex]

		if selectedInfo then
			ClientTextUtils.setText(self.placeHolderUSDFText, selectedInfo.label)

			self.placeHolderUSDFText.visibility = CS.XGUI.EVisibility.SelfHitTestInvisible
		end
	end
end

function PetWarehouseComponent:createBoxActionContext(boxId)
	if self._destroyed or not self._visible or not self.manager then
		return nil
	end

	local player = self.manager:getPlayer()
	local box = self.manager:getBox(PetWarehouseConst.DOMAIN.WAREHOUSE, boxId)

	if not player or player.destroyed or not box then
		return nil
	end

	local context = {
		player = player,
		manager = self.manager,
		boxId = boxId
	}

	self._boxActionContext = context

	return context, box
end

function PetWarehouseComponent:isBoxActionContextValid(context)
	return not self._destroyed and self._visible and self._boxActionContext == context and self.manager == context.manager and self.manager:getPlayer() == context.player and not context.player.destroyed and self.manager:getBox(PetWarehouseConst.DOMAIN.WAREHOUSE, context.boxId) ~= nil
end

function PetWarehouseComponent:onBoxActionCompleted(operation)
	if not operation or not PetWarehouseConst.BOX_ACTION[operation.action] then
		return
	end

	if operation.status == PetWarehouseConst.STATE.UNKNOWN then
		self:showBoxOperationFailure(operation.reason)

		return
	end

	if operation.action ~= PetWarehouseConst.ACTION.UNLOCK_BOX then
		return
	end

	if operation.status ~= PetWarehouseConst.STATE.SUCCEEDED then
		return
	end

	pg.global.showBubbleMessageById(NoticeDef.PET_WAREHOUSE_UNLOCK_NEW_BOX)

	local boxId = operation.unlockBoxId or operation.boxId

	if boxId ~= nil then
		self:switchBoxToId(boxId)
	end
end

function PetWarehouseComponent:showBoxOperationFailure(reason)
	if reason == PetWarehouseConst.REASON.BOX_STATE_UNCHANGED then
		return
	end

	local textKey = PetWarehouseConst.PetWarehouseText.BOX_OPERATION_FAILED

	if reason == PetWarehouseConst.REASON.BUSY or reason == PetWarehouseConst.REASON.REQUEST_TIMEOUT or reason == PetWarehouseConst.REASON.LATE_RESULT_PENDING then
		textKey = PetWarehouseConst.PetWarehouseText.OPERATION_PENDING
	elseif reason == PetWarehouseConst.REASON.UNLOCK_ITEM_NOT_ENOUGH then
		textKey = PetWarehouseConst.PetWarehouseText.UNLOCK_ITEM_NOT_ENOUGH
	elseif reason == PetWarehouseConst.REASON.UNLOCK_CONFIG_MISSING then
		textKey = PetWarehouseConst.PetWarehouseText.UNLOCK_NO_CONFIG
	elseif reason == PetWarehouseConst.REASON.NO_NEED_UNLOCK_BOX then
		textKey = PetWarehouseConst.PetWarehouseText.UNLOCK_MAX
	end

	pg.global.showBubbleMessageRaw(pg.getGameString(textKey))
end

function PetWarehouseComponent:tryUnlockWarehouseBox(boxId)
	local context, box = self:createBoxActionContext(boxId)

	if not context or not box then
		return
	end

	if box.needUnlock ~= true then
		return
	end

	local player = context.player
	local itemId, itemNum = PetWarehouseDataAdapter:getNextUnlockCost(player)

	if not itemId then
		self:showBoxOperationFailure(PetWarehouseConst.REASON.UNLOCK_CONFIG_MISSING)

		return
	end

	local ownCount = ItemUtils.getItemCountByIdCanUse(player, itemId, false) or 0

	if ownCount < itemNum then
		self:showBoxOperationFailure(PetWarehouseConst.REASON.UNLOCK_ITEM_NOT_ENOUGH)

		return
	end

	local function submit()
		if not self:isBoxActionContextValid(context) then
			return
		end

		self._boxActionContext = nil

		local operation, reason = self.manager:unlockWarehouseBox(boxId)

		if not operation or operation.status == PetWarehouseConst.STATE.FAILED then
			self:showBoxOperationFailure(reason or operation and operation.reason)
		end
	end

	if self.listSelectorUSelector then
		self.listSelectorUSelector:ClosePopup(true)
	end

	local fTitleStr = pg.getGameString(PetWarehouseConst.PetWarehouseText.UNLOCK_CONFIRM)

	pg.global.showConfirmMsgRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.UNLOCK_NEW_BOX), pg.getFormatText(fTitleStr, itemNum, itemId), submit)
end

function PetWarehouseComponent:toggleWarehouseBoxLock(boxId)
	local context, box = self:createBoxActionContext(boxId)

	if not context then
		return
	end

	local locked = not box.locked

	local function submit()
		if not self:isBoxActionContextValid(context) then
			return
		end

		self._boxActionContext = nil

		local operation, reason = self.manager:setWarehouseBoxLocked(boxId, locked)

		if not operation or operation.status == PetWarehouseConst.STATE.FAILED then
			self:showBoxOperationFailure(reason or operation and operation.reason)
		end
	end

	if locked then
		self.listSelectorUSelector:ClosePopup(true)
		pg.global.showConfirmMsgRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.LOCK_TITLE), pg.getGameString(PetWarehouseConst.PetWarehouseText.LOCK_CONFIRM), submit)
	else
		submit()
	end
end

function PetWarehouseComponent:renameWarehouseBox(boxId)
	local context, box = self:createBoxActionContext(boxId)

	if not context then
		return
	end

	local text = box.customName

	if not text or text == "" then
		text = self:getDefaultWarehouseBoxName(boxId)
	end

	self.listSelectorUSelector:ClosePopup(true)
	pg.global.ui.tips:showCommonInput(pg.getGameString("RENAME_TIPS_BOX"), function(newName)
		if not self:isBoxActionContextValid(context) then
			return
		end

		if string.isNilOrEmpty(newName) or string.find(newName, "%s") then
			pg.global.showBubbleMessageRaw(pg.getGameString("NAME_NOT_VALID"))

			return true
		end

		local operation, reason = self.manager:renameBox(boxId, newName)

		if not operation or operation.status == PetWarehouseConst.STATE.FAILED then
			reason = reason or operation and operation.reason

			self:showBoxOperationFailure(reason)

			if reason ~= PetWarehouseConst.REASON.BOX_STATE_UNCHANGED then
				return true
			end
		end

		self._boxActionContext = nil
	end, function()
		if self._boxActionContext == context then
			self._boxActionContext = nil
		end
	end, {
		characterLimit = 12,
		text = text
	})
end

function PetWarehouseComponent:loadWarehouseContent()
	if self._destroyed or not self.refUContainer or self._loading then
		return false
	end

	if self.refUContainer:CheckURLLoaded() then
		return self:onUContainerLoaded(true)
	end

	self._loading = true

	self.refUContainer:LoadDefaultUrlManually(function(content)
		self:onUContainerLoaded(content ~= nil, content)
	end)

	return false
end

function PetWarehouseComponent:refreshWarehouse()
	if not self._loaded or not self.manager then
		return
	end

	local snapshot = self.manager:getSnapshot() or {}
	local boxes = self.manager:getWarehouseBoxes() or {}

	if self.currentBoxIndex > #boxes then
		self.currentBoxIndex = math.max(#boxes, 1)
	end

	local box = boxes[self.currentBoxIndex]
	local filtered = self.filter and self.filter.active
	local results = filtered and self.filter:getResults() or nil

	if self._selectedPetId then
		local location = snapshot.locations and snapshot.locations[self._selectedPetId]
		local warehouseSelected = self._selectedPetDomain == PetWarehouseConst.DOMAIN.WAREHOUSE

		if self.manager:getPlayer() ~= self._selectedPlayer or not location or location.domain ~= self._selectedPetDomain or warehouseSelected and filtered and not self.filter:contains(self._selectedPetId) or warehouseSelected and not filtered and (not box or location.boxId ~= box.id) then
			self:clearPetSelection()
		end
	end

	if self.txtNumberUSDFText then
		ClientTextUtils.setText(self.txtNumberUSDFText, box and string.format("No.%s", box.id) or "")
	end

	if self.placeHolderUSDFText then
		local title = ""

		if box then
			local name = box.customName

			if not name or name == "" then
				name = self:getDefaultWarehouseBoxName(box.id)
			end

			title = string.format("%s (%d/%d)", name, box.count, box.slotCount)
		end

		ClientTextUtils.setText(self.placeHolderUSDFText, title)
	end

	local enableArrows = self:shouldEnableWarehouseBoxArrows()

	if self.btnLeftUButton then
		self.btnLeftUButton.interactable = enableArrows
	end

	if self.btnRightUButton then
		self.btnRightUButton.interactable = enableArrows
	end

	self:refreshBoxSelector(boxes, box)

	if self.rightListUList then
		if self._selectedPetDomain == PetWarehouseConst.DOMAIN.WAREHOUSE then
			self._selectedButton = nil
		end

		local listData = {}
		local slotCount = box and box.slotCount or 0
		local boxKey = box and PetWarehouseConst.DOMAIN.WAREHOUSE .. ":" .. tostring(box.id)
		local slotPetIds = boxKey and snapshot.petIdsByBoxSlot and snapshot.petIdsByBoxSlot[boxKey]

		if filtered then
			for _, data in ipairs(results or {}) do
				listData[#listData + 1] = data
			end

			for slot = #listData + 1, slotCount do
				listData[slot] = {
					isEmpty = true,
					tIndex = 1,
					_warehouseSlot = true,
					slot = slot
				}
			end
		else
			for slot = 1, slotCount do
				local petId = slotPetIds and slotPetIds[slot]
				local summary = petId and snapshot.summaries and snapshot.summaries[petId]

				if summary then
					summary.tIndex = 0
					summary._warehouseSlot = true
					summary._manageBatch = self.batch and self.batch.active == true
					summary._manageSelected = summary._manageBatch and self.batch.selected[petId] ~= nil
					listData[#listData + 1] = self:decorateWarehouseHeadData(summary)
				else
					listData[#listData + 1] = {
						isEmpty = true,
						tIndex = 1,
						_warehouseSlot = true,
						slot = slot
					}
				end
			end
		end

		function self.rightListUList.luaRenderItem(button, index, data)
			button.dataFromUList = data

			if data.isEmpty then
				self:refreshWarehousePetCrown(button, data)
				self:bindWarehousePetDrag(button, data)

				button.luaClick = nil

				self.petInfoTipPresenter:unbind(button)
				self:applyWarehouseManageVisual(button, data)
				self:applyWarehousePetSelectedVisual(button, data)

				return
			end

			button.renderOpacity = 1

			button:TryChangePage("state", 0)
			self:decorateWarehouseHeadData(data)
			LuaUIUtils.renderPetHead(button, data, {
				forceHideEvo = true,
				petInfo = self.manager:getPetInfo(data.id),
				crownState = data.crownState
			})
			self:refreshWarehouseHeadExtras(button, data)
			self:showWarehouseSortLabel(button, data)

			if self.batch.active then
				self.petInfoTipPresenter:unbind(button)
			end

			self:applyWarehouseManageVisual(button, data)
			self:applyWarehousePetSelectedVisual(button, data)

			if self._selectedPetDomain == PetWarehouseConst.DOMAIN.WAREHOUSE and self._selectedPetId == data.id then
				self._selectedButton = button
			end

			function button.luaClick()
				if self.batch.active then
					self.batch:toggle(data.id)
				else
					self:selectPet(data.id, button)
				end
			end

			button:SetGamepadAction(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth, nil, function()
				if button.luaClick then
					button.luaClick()
				end

				return false
			end)
			button:SetHotkeyActiveOnlyInCurrentItem(true)
			self:bindWarehousePetDrag(button, data)
		end

		self.rightListUList:SetList(listData)
		self:refreshWarehouseListScroll()

		if self.rightListUList.GetAllButtons then
			local buttons = self.rightListUList:GetAllButtons()

			if buttons then
				local lastIndex = buttons.Length and buttons.Length - 1 or #buttons

				for i = 0, lastIndex do
					local itemButton = buttons[i]
					local itemData = itemButton and itemButton.dataFromUList

					if itemData then
						self:applyWarehouseManageVisual(itemButton, itemData)
						self:applyWarehousePetSelectedVisual(itemButton, itemData)
					end
				end
			end
		end
	end

	self.batch:refreshUI()
end

function PetWarehouseComponent:canDragWarehousePet()
	if self._destroyed or not self._visible or not self._loaded or not self.ctrl then
		return false
	end

	local boxPets = self.ctrl.boxPets

	if boxPets and boxPets.isReleaseForbidden and boxPets:isReleaseForbidden() then
		return false
	end

	return true
end

function PetWarehouseComponent:canShowDragReleaseArea()
	if not self:canDragWarehousePet() then
		return false
	end

	if self.ctrl.inReleaseMode then
		return false
	end

	return true
end

function PetWarehouseComponent:invalidateDragReleaseSession()
	self._dragReleaseSession = (self._dragReleaseSession or 0) + 1

	if self._releaseConfirmation == self._dragReleaseToken then
		self:clearReleaseConfirmation()
	end

	self._dragReleaseToken = nil

	self:clearDragDetailRequest()
end

function PetWarehouseComponent:isDragReleaseContextValid(token)
	if self._destroyed or not self._visible or not self.ctrl or token == nil then
		return false
	end

	if token.id ~= self._dragReleaseSession then
		return false
	end

	if token.player ~= (self.manager and self.manager:getPlayer()) or token.player and token.player.destroyed then
		return false
	end

	if self.ctrl.inReleaseMode then
		return false
	end

	return true
end

function PetWarehouseComponent:applyBottomChromeByPage()
	if self._bottomChromeHidden then
		return
	end

	local refs = self.objectReference

	if IsNil(refs) then
		return
	end

	local page = self:getRightFilterPage()

	if self.batch and NotNil(self.batch.panel) then
		self.batch.panel:TryChangePage("RightFilter", page)
	end

	local browseHidden = page ~= 0
	local batchHidden = page ~= 1
	local browseKeys = {
		"btnFilterUButton",
		"btnXUButton",
		"btnRelease2UButton",
		"btnSortBoxUButton"
	}
	local batchKeys = {
		"btnSwitchUButton",
		"btnX2UButton",
		"btnClose2UButton",
		"moveBtn2UButton",
		"releasingBtn2UButton",
		"selectNumberUButton"
	}

	local function apply(keys, hidden)
		for _, key in ipairs(keys) do
			local button = refs:GetRefValue(key)

			if NotNil(button) and button.SetForceInactive then
				button:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, hidden)
			end
		end
	end

	apply(browseKeys, browseHidden)
	apply(batchKeys, batchHidden)
end

function PetWarehouseComponent:setBottomChromeHidden(hidden)
	hidden = hidden == true
	self._bottomChromeHidden = hidden

	local refs = self.objectReference

	if IsNil(refs) then
		return
	end

	local keys = {
		"btnFilterUButton",
		"btnSwitchUButton",
		"btnXUButton",
		"btnX2UButton",
		"btnRelease2UButton",
		"btnClose2UButton",
		"moveBtn2UButton",
		"releasingBtn2UButton",
		"selectNumberUButton",
		"btnSortBoxUButton"
	}

	for _, key in ipairs(keys) do
		local button = refs:GetRefValue(key)

		if NotNil(button) and button.SetForceInactive then
			button:SetForceInactive(CS.XGUI.ForceInactiveSource.Business, hidden)
		end
	end

	if hidden then
		if self.filter then
			if NotNil(self.filter.filterPanel) then
				self.filter.filterPanel.gameObject:SetActiveEx(false)
			end

			if self.filter.panel then
				self.filter.panel:TryChangePage("FilterState", 0)
			end
		end

		if self.batch and self.batch.panel then
			local page = 0

			if self:getRightFilterPage() == 2 then
				page = 2
			end

			self.batch.panel:TryChangePage("RightFilter", page)
		end

		return
	end

	if self.filter and NotNil(self.filter.filterPanel) then
		self.filter.filterPanel.gameObject:SetActiveEx(true)
	end

	self:applyBottomChromeByPage()

	if self.filter and self.filter.refreshUI then
		self.filter:refreshUI()
	end

	if self.batch and self.batch.refreshUI then
		self.batch:refreshUI()
	end
end

function PetWarehouseComponent:activateDragReleaseHintContent(area)
	if IsNil(area) then
		return
	end

	local function activate(node)
		if IsNil(node) then
			return
		end

		if node.SetActiveEx then
			node:SetActiveEx(true)
		end

		if node.gameObject and node.gameObject.SetActiveEx then
			node.gameObject:SetActiveEx(true)
		end
	end

	local function findNode(root, path)
		if IsNil(root) then
			return nil
		end

		if root.Find then
			return root:Find(path)
		end

		local transform = root.transform

		if IsNil(transform) and root.gameObject then
			transform = root.gameObject.transform
		end

		if NotNil(transform) and transform.Find then
			return transform:Find(path)
		end

		return nil
	end

	local paths = {
		"PetReleaseDefault/Text",
		"PetReleaseDefault/Icon",
		"Text",
		"Icon"
	}

	for index = 1, #paths do
		activate(findNode(area, paths[index]))
	end
end

function PetWarehouseComponent:activeDragReleaseArea(active)
	active = active and self:canShowDragReleaseArea()

	local area = self.dragAreaUButton

	if IsNil(area) and self.objectReference then
		area = self.objectReference:GetRefValue("dragAreaUButton")
		self.dragAreaUButton = area
	end

	if IsNil(area) then
		return
	end

	if active then
		area.gameObject:SetActiveEx(true)
		self:activateDragReleaseHintContent(area)
		area:TryChangePage("StateDel", 1)

		function area.luaHover()
			if self._draggingPetId ~= nil then
				area:TryChangePage("StateDel", 2)
			end
		end

		function area.luaUnhover()
			if self._draggingPetId ~= nil then
				area:TryChangePage("StateDel", 1)
			end
		end

		function area.luaClick()
			if self._draggingPetId == nil then
				return
			end

			self:tryReleaseDraggingPet(self._draggingPetId)

			if pg.global.navMgr then
				pg.global.navMgr:CancelNavDrag()
			end
		end

		self:setBottomChromeHidden(true)
	else
		area.luaHover = nil
		area.luaUnhover = nil
		area.luaClick = nil

		area:TryChangePage("StateDel", 0)
		area.gameObject:SetActiveEx(false)
		self:setBottomChromeHidden(false)
	end
end

function PetWarehouseComponent:canShowWarehouseDragSwapArrow(button)
	if not self.ctrl or self.ctrl.isDragging ~= true then
		return false
	end

	if IsNil(self.ctrl.draggingReplicaWidget) or IsNil(button) then
		return false
	end

	local types = self.ctrl.DRAGGING_REPLICA_WIDGET
	local replicaType = self.ctrl.draggingReplicaWidgetType

	if not types or replicaType ~= types.WAREHOUSE_CARD and replicaType ~= types.PET_BOX_CARD then
		return false
	end

	if self.filter and self.filter.active then
		return false
	end

	local data = button.dataFromUList

	if not Utils.isTable(data) or data._warehouseSlot ~= true then
		return false
	end

	if data.id ~= nil and data.id == self._draggingPetId then
		return false
	end

	return true
end

function PetWarehouseComponent:onWarehousePetHover(button)
	if not self:canShowWarehouseDragSwapArrow(button) then
		return
	end

	self.ctrl.draggingReplicaWidget:TryChangePage("DragState", 4)
end

function PetWarehouseComponent:onWarehousePetUnHover(button)
	if not self:canShowWarehouseDragSwapArrow(button) then
		return
	end

	self.ctrl.draggingReplicaWidget:TryChangePage("DragState", 1)

	if NotNil(button) then
		button:TryChangePage("DragState", 0)
	end
end

function PetWarehouseComponent:bindWarehousePetDrag(button, data)
	if IsNil(button) then
		return
	end

	function button.luaHover()
		self:onWarehousePetHover(button)
	end

	function button.luaUnhover()
		self:onWarehousePetUnHover(button)
	end

	if not data or data.isEmpty or not self:canDragWarehousePet() then
		button.draggable = false
		button.luaBeginDrag = nil
		button.luaEndDrag = nil

		return
	end

	button.draggable = true

	function button.luaBeginDrag()
		self:beginDrag(button, data)
	end

	function button.luaEndDrag(dropWidget, rayBox)
		self:endDrag(button, dropWidget, rayBox, data)
	end
end

function PetWarehouseComponent:rememberBagSelectionForWarehouseDrag()
	local boxPets = self.ctrl and self.ctrl.boxPets
	local model = boxPets and boxPets.model

	if model then
		self._bagSelectPetIdBeforeDrag = model.curSelectPetId
	else
		self._bagSelectPetIdBeforeDrag = nil
	end

	self._bagSelectRestoreToken = (self._bagSelectRestoreToken or 0) + 1
end

function PetWarehouseComponent:restoreBagSelectionDuringWarehouseDrag()
	local boxPets = self.ctrl and self.ctrl.boxPets

	if not boxPets or not boxPets.model then
		return
	end

	local petId = self._bagSelectPetIdBeforeDrag

	if boxPets.model.curSelectPetId ~= petId and boxPets.model.setCurSelectPetId then
		boxPets.model:setCurSelectPetId(petId)
	end

	if boxPets.selectItemIfExists then
		boxPets:selectItemIfExists(petId)
	end
end

function PetWarehouseComponent:scheduleBagSelectionRestore()
	local token = self._bagSelectRestoreToken

	local function replay()
		if self._bagSelectRestoreToken ~= token then
			return
		end

		self:restoreBagSelectionDuringWarehouseDrag()
	end

	if self.startFrameTimer then
		local frames = {
			1,
			2,
			4,
			8,
			12,
			16,
			20
		}

		for index = 1, #frames do
			local frame = frames[index]

			self:startFrameTimer(replay, frame)
		end
	end

	if self.startTimer then
		self:startTimer(replay, 0.3)
	end
end

function PetWarehouseComponent:clearWarehouseDragReplica(button)
	button = button or self._draggingButton or self._warehouseDragReplicaButton
	self._warehouseDragReplicaToken = (self._warehouseDragReplicaToken or 0) + 1

	local replica

	if NotNil(button) then
		replica = button.replicaWidget
	end

	if IsNil(replica) and NotNil(self._warehouseDragReplicaButton) then
		replica = self._warehouseDragReplicaButton.replicaWidget
	end

	if NotNil(replica) and replica.ClearReplicaWidgetExtendLoadCont then
		replica:ClearReplicaWidgetExtendLoadCont()
	end

	self._warehouseDragReplicaButton = nil
end

function PetWarehouseComponent:setupWarehouseDragBatchReplica(button, data, draggingPetId)
	if IsNil(button) or IsNil(button.replicaWidget) then
		return
	end

	self:clearWarehouseDragReplica(button)

	local petIds = self:getDragPetIds(draggingPetId)
	local batchCount = #petIds
	local objectReference = button.replicaWidget:GetComponent("ObjectReference")

	if IsNil(objectReference) then
		return
	end

	local numUSDFText = objectReference:GetRefValue("numUSDFText")

	if batchCount <= 1 then
		button.replicaWidget:TryChangePage("Batch", 0)

		return
	end

	button.replicaWidget:TryChangePage("Batch", 2)

	if NotNil(numUSDFText) then
		ClientTextUtils.setText(numUSDFText, batchCount)
	end

	self._warehouseDragReplicaToken = (self._warehouseDragReplicaToken or 0) + 1

	local replicaToken = self._warehouseDragReplicaToken
	local extendPetIds = {}

	for index = 1, #petIds do
		local petId = petIds[index]

		if petId ~= draggingPetId then
			extendPetIds[#extendPetIds + 1] = petId
		end
	end

	local url = AddressDataConst.TOPLOGO_COMP_RES_PET_HEAD

	self._warehouseDragReplicaButton = button

	button:AddReplicaWidgetExtendLoadCont(url, function(extendUWidget)
		if self._warehouseDragReplicaToken ~= replicaToken or self._draggingPetId ~= draggingPetId then
			return
		end

		if IsNil(extendUWidget) then
			return
		end

		local extendObjectReference = extendUWidget.gameObject.transform:GetComponent("ObjectReference")

		if IsNil(extendObjectReference) then
			return
		end

		local cellList = {
			extendObjectReference:GetRefValue("dragIntoBoxCell2"),
			extendObjectReference:GetRefValue("DragIntoBoxCell3")
		}

		extendUWidget.gameObject:SetActiveEx(true)

		local snapshot = self.manager and self.manager:getSnapshot()
		local summaries = snapshot and snapshot.summaries

		for index = 1, #cellList do
			local cell = cellList[index]
			local petId = extendPetIds[index]
			local summary = petId and summaries and summaries[petId]

			if NotNil(cell) and summary then
				self:decorateWarehouseHeadData(summary)
				cell:SetActive(true)

				local cellObjectReference = cell:GetComponent("ObjectReference")
				local iconUImage = cellObjectReference and cellObjectReference:GetRefValue("iconUImage")

				if NotNil(iconUImage) then
					iconUImage:SetUrlWithCallback(LuaUIUtils.getPetIcon(summary.iconName, LuaUIUtils.PET_ICON, summary.label, summary.gender), nil)
				end
			elseif NotNil(cell) then
				cell:SetActive(false)
			end
		end
	end)
end

function PetWarehouseComponent:stopBagSelectionRestore()
	self._bagSelectRestoreToken = (self._bagSelectRestoreToken or 0) + 1
	self._bagSelectPetIdBeforeDrag = nil
end

function PetWarehouseComponent:clearBagPetSelection()
	self:stopBagSelectionRestore()

	local boxPets = self.ctrl and self.ctrl.boxPets

	if not boxPets then
		return
	end

	local model = boxPets.model

	if model then
		if model.setCurSelectPetId then
			model:setCurSelectPetId(nil)
		else
			model.curSelectPetId = nil
		end
	end

	if boxPets.clearAllSelectFrames then
		boxPets:clearAllSelectFrames()
	elseif boxPets.selectItemIfExists then
		boxPets:selectItemIfExists(nil)
	end
end

function PetWarehouseComponent:beginDrag(button, data)
	if self.ctrl.onMoveDisplay or self.ctrl.isDragging then
		return
	end

	if not data or not data.id or not self:canDragWarehousePet() then
		return
	end

	self:rememberBagSelectionForWarehouseDrag()
	self:clearPetSelection()

	self._draggingPetId = data.id
	self._draggingButton = button

	self.ctrl:setIsDragging(true)

	if NotNil(button) and NotNil(button.replicaWidget) then
		button.replicaWidget.name = button.name
		button.replicaWidget.gameObject.transform.localScale = Vector3(1.25, 1.25, 1.25)
		self.ctrl.draggingReplicaWidget = button.replicaWidget
		self.ctrl.draggingReplicaWidgetType = self.ctrl.DRAGGING_REPLICA_WIDGET.WAREHOUSE_CARD

		button:TryChangePage("DragState", 2)
		button.replicaWidget:TryChangePage("DragState", 1)

		local replicaObjectReference = button.replicaWidget:GetComponent("ObjectReference")
		local replicaIconUImage = replicaObjectReference and replicaObjectReference:GetRefValue("iconUImage")

		if NotNil(replicaIconUImage) then
			local iconUrl = LuaUIUtils.getPetIcon(data.iconName, LuaUIUtils.PET_ICON, data.label, data.gender)

			LuaUIUtils.reloadPetHeadIcon(replicaIconUImage, iconUrl)
		end

		local draggingPetId = data.id

		local function replicaIsValid()
			if self._draggingPetId ~= draggingPetId then
				return false
			end

			if IsNil(button) or IsNil(button.replicaWidget) then
				return false
			end

			return true
		end

		self:applyDraggingReplicaSortLabel(button, data, replicaIsValid)
		self:setupWarehouseDragBatchReplica(button, data, data.id)
	end

	self:restoreBagSelectionDuringWarehouseDrag()
	self:scheduleBagSelectionRestore()
	self:activeDragReleaseArea(true)
	self:refreshBatchDimming()
end

function PetWarehouseComponent:endDrag(button, dropWidget, rayBox, data)
	local petId = self._draggingPetId or data and data.id

	self:clearWarehouseDragReplica(button)

	if NotNil(button) then
		button:TryChangePage("DragState", 0)
	end

	local droppedOnRelease = rayBox ~= nil and rayBox.gameObject and rayBox.gameObject.name == "ReleaseRayBox"
	local bagDrop = petId ~= nil and self:isBagDropTarget(dropWidget)

	self._draggingButton = nil
	self._draggingPetId = nil

	self:activeDragReleaseArea(false)

	self.ctrl.draggingReplicaWidget = nil
	self.ctrl.draggingReplicaWidgetType = nil

	self.ctrl:setIsDragging(false)

	if droppedOnRelease or bagDrop then
		self:stopBagSelectionRestore()
	else
		self:restoreBagSelectionDuringWarehouseDrag()
	end

	if droppedOnRelease and petId ~= nil then
		self:tryReleaseDraggingPet(petId)

		return
	end

	if petId ~= nil and self:isBagDropTarget(dropWidget) then
		self:handleMoveOutDrop(petId, dropWidget)
		self:refreshBatchDimming()

		return
	end

	local warehouseSlot = petId and self:getWarehouseDropSlot(dropWidget)

	if warehouseSlot then
		self:handleWarehouseSlotDrop(petId, warehouseSlot)
	end

	self:refreshBatchDimming()
end

function PetWarehouseComponent:getDragPetIds(sourcePetId)
	if sourcePetId == nil then
		return {}
	end

	if self.batch and self.batch.active and self.batch.selected and self.batch.selected[sourcePetId] then
		return self.batch:getSelectedIds()
	end

	return {
		sourcePetId
	}
end

function PetWarehouseComponent:getWarehouseDropSlot(dropWidget)
	if not self:isWarehouseDropTarget(dropWidget) then
		return nil
	end

	if self.filter and self.filter.active then
		return nil
	end

	local data = dropWidget.dataFromUList

	if not Utils.isTable(data) then
		return nil
	end

	local boxes = self.manager and self.manager:getWarehouseBoxes() or {}
	local box = boxes[self.currentBoxIndex]
	local boxId = data.boxId or box and box.id
	local slot = data.slot

	if boxId == nil or slot == nil then
		return nil
	end

	return {
		boxId = boxId,
		slot = slot,
		petId = not data.isEmpty and data.id or nil
	}
end

function PetWarehouseComponent:trackWarehouseSlotMove(preBoxIndex, preSlotIndex, toBoxIndex, toSlotIndex)
	if preBoxIndex == nil or preSlotIndex == nil or toBoxIndex == nil or toSlotIndex == nil then
		return
	end

	local now = 0

	if Time and Time.millisecondCache then
		now = Time.millisecondCache
	end

	self._warehouseSlotMoveSeq = (self._warehouseSlotMoveSeq or 0) + 1

	if not self._warehouseSlotMoves then
		self._warehouseSlotMoves = {}
	end

	self._warehouseSlotMoves[self._warehouseSlotMoveSeq] = {
		preBoxIndex = preBoxIndex,
		preSlotIndex = preSlotIndex,
		toBoxIndex = toBoxIndex,
		toSlotIndex = toSlotIndex,
		expireAt = now + 3000
	}
end

function PetWarehouseComponent:consumeWarehouseSlotMove(info)
	local moves = self._warehouseSlotMoves

	if not moves or not info then
		return false
	end

	local now = 0

	if Time and Time.millisecondCache then
		now = Time.millisecondCache
	end

	local matchedId

	for moveId, move in pairs(moves) do
		if move.expireAt and now >= move.expireAt then
			moves[moveId] = nil
		elseif move.preBoxIndex == info.preBoxIndex and move.preSlotIndex == info.preSlotIndex and move.toBoxIndex == info.toBoxIndex and move.toSlotIndex == info.toSlotIndex then
			matchedId = moveId

			break
		end
	end

	if not matchedId then
		return false
	end

	moves[matchedId] = nil

	return true
end

function PetWarehouseComponent:handleWarehouseSlotDrop(petId, target)
	if petId == nil or not target or not self.manager then
		return
	end

	local snapshot = self.manager:getSnapshot() or {}
	local location = snapshot.locations and snapshot.locations[petId]

	if not location or location.domain ~= PetWarehouseConst.DOMAIN.WAREHOUSE then
		return
	end

	if location.boxId == target.boxId and location.slot == target.slot then
		return
	end

	if target.petId == petId then
		return
	end

	local destBox = self.manager:getBox(PetWarehouseConst.DOMAIN.WAREHOUSE, target.boxId)

	if destBox and destBox.tempLocked == true then
		self:showWarehouseTempLockedNotice()

		return
	end

	if destBox and destBox.needUnlock == true then
		self:showOperationFailure(PetWarehouseConst.ACTION.MOVE_IN, PetWarehouseConst.REASON.BOX_LOCKED)

		return
	end

	local sourceBox = self.manager:getBox(PetWarehouseConst.DOMAIN.WAREHOUSE, location.boxId)

	if target.petId ~= nil and sourceBox and sourceBox.tempLocked == true then
		self:showWarehouseTempLockedNotice()

		return
	end

	if target.petId ~= nil and sourceBox and sourceBox.needUnlock == true then
		self:showOperationFailure(PetWarehouseConst.ACTION.MOVE_IN, PetWarehouseConst.REASON.BOX_LOCKED)

		return
	end

	local player = self.manager:getPlayer()

	if not player or player.destroyed then
		return
	end

	self:trackWarehouseSlotMove(location.boxId, location.slot, target.boxId, target.slot)
	player:serverMsg("RPC_CS_PetBoxMovePet", petId, target.boxId, target.slot, PetWarehouseConst.BOX_TYPE_BY_DOMAIN[PetWarehouseConst.DOMAIN.WAREHOUSE])
end

function PetWarehouseComponent:isBagDropTarget(dropWidget)
	if not self._visible or IsNil(dropWidget) then
		return false
	end

	local data = dropWidget.dataFromUList

	if not data or data._warehouseSlot == true then
		return false
	end

	return data.isEmpty == true or data.id ~= nil
end

function PetWarehouseComponent:getSelectedBagBoxId()
	local model = self.ctrl and self.ctrl.boxPets and self.ctrl.boxPets.model

	if model and model.getSelectBoxId then
		local boxId = tonumber(model:getSelectBoxId())

		if boxId and boxId > 0 then
			return boxId
		end
	end

	local player = self.manager and self.manager:getPlayer()
	local petBoxMap = player and player.petBoxMap

	if petBoxMap then
		return tonumber(petBoxMap.curIndex)
	end

	return nil
end

function PetWarehouseComponent:getBagDropSlot(dropWidget)
	if not self:isBagDropTarget(dropWidget) then
		return nil
	end

	if self.ctrl and self.ctrl.inFilterMode then
		return nil
	end

	local data = dropWidget.dataFromUList

	if not Utils.isTable(data) then
		return nil
	end

	local boxId = data.boxId or self:getSelectedBagBoxId()
	local slot = data.slot

	if slot == nil and dropWidget.gameObject then
		slot = tonumber(dropWidget.gameObject.name)
	end

	boxId = tonumber(boxId)
	slot = tonumber(slot)

	if boxId == nil or slot == nil then
		return nil
	end

	return {
		boxId = boxId,
		slot = slot,
		petId = not data.isEmpty and data.id or nil,
		isEmpty = data.isEmpty == true
	}
end

function PetWarehouseComponent:getMoveOutTransferOptions(dropWidget)
	local dropSlot = dropWidget and self:getBagDropSlot(dropWidget)

	if dropSlot and dropSlot.isEmpty then
		return {
			targetBoxId = dropSlot.boxId,
			targetSlot = dropSlot.slot
		}
	end

	return {
		targetSlot = 0,
		targetBoxId = self:getSelectedBagBoxId()
	}
end

function PetWarehouseComponent:handleMoveOutDrop(petId, dropWidget)
	if petId == nil or not self.manager then
		return
	end

	local petIds = self:getDragPetIds(petId)

	if #petIds == 0 then
		return
	end

	local dropSlot = dropWidget and self:getBagDropSlot(dropWidget)
	local occupied = self:isOccupiedDropSlot(dropSlot)
	local options = self:getMoveOutTransferOptions(dropWidget)

	if occupied then
		options.occupiedNotice = true
	end

	self:requestMoveOut(petIds, options)
end

function PetWarehouseComponent:tryReleaseDraggingPet(petId)
	petId = petId or self._draggingPetId

	if petId == nil or not self:canShowDragReleaseArea() or not self.manager then
		return
	end

	local petIds = self:getDragPetIds(petId)

	if #petIds > 1 and self.batch and self.batch.active then
		self.batch:release(petIds)

		return
	end

	if self.manager:getPetDomain(petId) ~= PetWarehouseConst.DOMAIN.WAREHOUSE then
		return
	end

	local player = self.manager:getPlayer()

	if self._dragDetailRequest and self._dragDetailRequest.petId == petId then
		return
	end

	self:clearDragDetailRequest()

	local context = {
		petId = petId,
		player = player,
		session = self._dragReleaseSession
	}

	self._dragDetailRequest = context
	self._pendingDragReleasePetId = petId

	local function complete(operation)
		if self._dragDetailRequest ~= context then
			return
		end

		local cancelled = operation and operation.reason == PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

		if cancelled or self._destroyed or not self._visible or player == nil or player.destroyed or self.manager:getPlayer() ~= player or context.session ~= self._dragReleaseSession then
			self:clearDragDetailRequest()

			return
		end

		if not operation or operation.status ~= PetWarehouseConst.STATE.SUCCEEDED then
			self:clearDragDetailRequest()
			pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.DETAIL_WAIT_TIMEOUT)

			return
		end

		context.petInfo = operation.infos and operation.infos[petId]

		if not context.petInfo then
			self:clearDragDetailRequest()

			return
		end

		context.ready = true

		self:tryCompletePendingDragRelease()
	end

	local operation = self.manager:requestPetDetails({
		petId
	}, complete, true)

	if not operation then
		complete(nil)
	end
end

function PetWarehouseComponent:tryCompletePendingDragRelease()
	local context = self._dragDetailRequest

	if not context or not context.ready then
		return
	end

	local petId = context.petId

	if not self:canShowDragReleaseArea() or not self.manager then
		self:clearDragDetailRequest()

		return
	end

	local player = self.manager:getPlayer()
	local petInfo = context.petInfo

	if not petInfo or self.manager:getPetDomain(petId) ~= PetWarehouseConst.DOMAIN.WAREHOUSE then
		self:clearDragDetailRequest()

		return
	end

	self:openDragReleaseConfirm(petId, petInfo, player)
	self:clearDragDetailRequest()
end

function PetWarehouseComponent:openDragReleaseConfirm(petId, petInfo, player)
	if not self:checkReleasePet(petInfo) then
		return
	end

	local title = pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TITLE)
	local tip = pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TIP)

	if self.manager:getTotalPetCount() <= 1 then
		pg.global.showConfirmMsgRaw(title, pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_WARN_TIP), nil, true)

		return
	end

	if pg.game.petManage:hasPetCultivationByInfo(petInfo) then
		tip = pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_CULTIVATION_TIP) .. tip
	end

	local recycleBack = ItemUtils.getBatchRecyclePetClientDisplayItem(pg.me, {
		petId
	}, {
		[petId] = petInfo
	})

	self._dragReleaseSession = (self._dragReleaseSession or 0) + 1

	local token = {
		id = self._dragReleaseSession,
		player = player,
		petId = petId,
		manager = self.manager,
		domain = PetWarehouseConst.DOMAIN.WAREHOUSE,
		sourcePetInfo = petInfo
	}

	self:clearReleaseConfirmation()

	self._dragReleaseToken = token
	self._releaseConfirmation = token

	pg.global.showCommonTipUse(title, tip, recycleBack, function()
		if not self:isDragReleaseContextValid(token) then
			return
		end

		self._releaseConfirmation = nil

		self:confirmReleasePet(token)
	end, function()
		if self._releaseConfirmation == token then
			self:clearReleaseConfirmation()
		end
	end, true)
end

function PetWarehouseComponent:isWarehouseDropTarget(dropWidget, rayBox)
	if not self._visible or not self._loaded or IsNil(dropWidget) then
		return false
	end

	local data = dropWidget.dataFromUList

	if data and data._warehouseSlot == true then
		return true
	end

	return self:isUnderWarehouseList(dropWidget)
end

function PetWarehouseComponent:isUnderWarehouseList(dropWidget)
	if IsNil(dropWidget) then
		return false
	end

	local listTransform = self.rightListUList and self.rightListUList.transform
	local rootTransform = self.transform
	local node = dropWidget.transform

	while NotNil(node) do
		if NotNil(listTransform) and node == listTransform or NotNil(rootTransform) and node == rootTransform then
			return true
		end

		node = node.parent
	end

	return false
end

function PetWarehouseComponent:getDropPetIds(sourcePetId)
	local ids = {}
	local boxPets = self.ctrl and self.ctrl.boxPets
	local selected = boxPets and boxPets:getDragBatchReleasePetIds(sourcePetId)

	if selected and selected[sourcePetId] then
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
	end

	if #ids == 0 then
		ids[1] = sourcePetId
	end

	return ids
end

function PetWarehouseComponent:_startDropOperation(petIds, targetBoxId, targetSlot, allowOverflow)
	if not Utils.isTable(petIds) or #petIds == 0 then
		return false
	end

	self:cacheWarehousePetCrownsFromBag(petIds)
	self:trackMoveInBagFocus(petIds)

	local player = self.manager:getPlayer()
	local overflow = true

	if allowOverflow == false then
		overflow = false
	end

	local operation, reason = self.manager:startTransfer(PetWarehouseConst.ACTION.MOVE_IN, petIds, {
		targetBoxId = targetBoxId,
		allowOverflow = overflow,
		targetSlot = tonumber(targetSlot) or 0
	})

	if not operation or operation.status == PetWarehouseConst.STATE.FAILED then
		self._moveInBagFocus = nil
		self._orderedEmptySlotNotice = nil

		if not operation or not operation.failureNoticeShown then
			self:showOperationFailure(PetWarehouseConst.ACTION.MOVE_IN, reason or operation and operation.reason)
		end

		return false
	end

	if self._orderedEmptySlotNotice then
		self._orderedEmptySlotNotice = nil

		self:showOrderedEmptySlotNotice()
	end

	if self.filter and self.filter.active then
		self.filter:clear()
	end

	self._moveInNavigation = {
		operation = operation,
		player = player,
		manager = self.manager
	}

	self:followMoveInDestination(operation)

	if self.batch and self.batch.active then
		self.batch.operation = operation

		if self.batch.onOperation then
			self.batch:onOperation(operation)
		end
	end

	return true
end

function PetWarehouseComponent:followMoveInDestination(changedOperation)
	local context = self._moveInNavigation

	if not context then
		return
	end

	if self._destroyed or not self._visible or self.manager ~= context.manager or self.manager:getPlayer() ~= context.player then
		self._moveInNavigation = nil

		return
	end

	local operation = context.operation

	if changedOperation and changedOperation ~= operation then
		return
	end

	if operation.status ~= PetWarehouseConst.STATE.SUCCEEDED and operation.status ~= PetWarehouseConst.STATE.PARTIALLY_SUCCEEDED and operation.status ~= PetWarehouseConst.STATE.FAILED then
		return
	end

	local snapshot = self.manager:getSnapshot()
	local locations = snapshot and snapshot.locations or {}

	for _, petId in ipairs(operation.petIds) do
		local location = locations[petId]

		if operation.completedIds[petId] and location and not location.conflict and location.domain == PetWarehouseConst.DOMAIN.WAREHOUSE then
			self._moveInNavigation = nil

			self:switchBoxToId(location.boxId)

			return
		end
	end

	if operation.status == PetWarehouseConst.STATE.FAILED then
		self._moveInNavigation = nil
	end
end

function PetWarehouseComponent:trackMoveOut(operation)
	if not operation or not self.manager then
		return
	end

	self._moveOutNavigation = {
		operation = operation,
		player = self.manager:getPlayer(),
		manager = self.manager
	}

	self:followMoveOutDestination(operation)
end

function PetWarehouseComponent:followMoveOutDestination(changedOperation)
	local context = self._moveOutNavigation

	if not context then
		return
	end

	if self._destroyed or not self._visible or self.manager ~= context.manager or self.manager:getPlayer() ~= context.player then
		self._moveOutNavigation = nil

		return
	end

	local operation = context.operation

	if changedOperation and changedOperation ~= operation then
		return
	end

	if operation.status ~= PetWarehouseConst.STATE.SUCCEEDED and operation.status ~= PetWarehouseConst.STATE.PARTIALLY_SUCCEEDED and operation.status ~= PetWarehouseConst.STATE.FAILED then
		return
	end

	local snapshot = self.manager:getSnapshot()
	local locations = snapshot and snapshot.locations or {}

	for _, petId in ipairs(operation.petIds) do
		local location = locations[petId]

		if operation.completedIds[petId] and location and not location.conflict and location.domain == PetWarehouseConst.DOMAIN.BAG then
			self._moveOutNavigation = nil

			local boxPets = self.ctrl and self.ctrl.boxPets

			if boxPets and boxPets.switchBoxToIdx then
				boxPets:switchBoxToIdx(location.boxId, false)
			else
				self:refreshBagAfterWarehouseChange()
			end

			self:reloadBagPetHeadIcon(petId)

			return
		end
	end

	if operation.status == PetWarehouseConst.STATE.FAILED then
		self._moveOutNavigation = nil
	end
end

function PetWarehouseComponent:reloadBagPetHeadIcon(petId)
	if petId == nil then
		return
	end

	local boxPets = self.ctrl and self.ctrl.boxPets
	local caches = boxPets and boxPets.normalListBtnCaches
	local button = caches and caches[petId]

	if IsNil(button) then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference and objectReference:GetRefValue("iconUImage")

	if IsNil(iconUImage) then
		return
	end

	if NotNil(iconUImage.gameObject) then
		iconUImage.gameObject:SetActiveEx(true)
	end

	LuaUIUtils.reloadPetHeadIcon(iconUImage)
end

function PetWarehouseComponent:refreshBagAfterWarehouseChange()
	self:prepareBagFocusAfterMoveIn()

	if self.ctrl and self.ctrl.refreshPetBox then
		self.ctrl:refreshPetBox()
	end

	self:restoreBagFocusAfterMoveIn()
end

function PetWarehouseComponent:trackMoveInBagFocus(petIds)
	local fromSlot
	local boxPets = self.ctrl and self.ctrl.boxPets
	local navMgr = pg and pg.global and pg.global.navMgr

	if boxPets and boxPets.getBoxPetSlotIndexByButton and navMgr and navMgr.CurrentFocusedGroupName == "ComPetList" then
		fromSlot = boxPets:getBoxPetSlotIndexByButton(navMgr.CurrentFocusedUContent)
	end

	if fromSlot == nil and boxPets and Utils.isTable(boxPets.petInfos) and Utils.isTable(petIds) then
		for i = 1, #boxPets.petInfos do
			local petInfo = boxPets.petInfos[i]

			if petInfo and petInfo.id then
				for j = 1, #petIds do
					if petIds[j] == petInfo.id then
						fromSlot = i - 1

						break
					end
				end
			end

			if fromSlot ~= nil then
				break
			end
		end
	end

	self._moveInBagFocus = {
		fromSlot = fromSlot or 0
	}
end

function PetWarehouseComponent:prepareBagFocusAfterMoveIn()
	local context = self._moveInBagFocus

	if not context then
		return
	end

	if self.ctrl and self.ctrl.inFilterMode then
		self._moveInBagFocus = nil

		return
	end

	local boxPets = self.ctrl and self.ctrl.boxPets

	if not boxPets or not boxPets.findNextOccupiedBagSlot then
		return
	end

	local petInfos
	local model = boxPets.model

	if model and model.getBoxInfoById and model.getSelectBoxId then
		petInfos = model:getBoxInfoById(model:getSelectBoxId())
	end

	petInfos = petInfos or boxPets.petInfos

	local nextSlot = boxPets:findNextOccupiedBagSlot(context.fromSlot, petInfos)

	context.nextSlot = nextSlot
	self.ctrl._initGamepadFocusSlot = nextSlot
end

function PetWarehouseComponent:restoreBagFocusAfterMoveIn()
	local context = self._moveInBagFocus

	self._moveInBagFocus = nil

	if not context then
		return
	end

	local boxPets = self.ctrl and self.ctrl.boxPets

	if not boxPets then
		return
	end

	local slot = context.nextSlot

	if slot == nil then
		slot = 0
	end

	self.ctrl._initGamepadFocusSlot = slot

	local input = pg and pg.game and pg.game.input

	if boxPets.restoreBoxNavFocusSlot and input and input.isUsingGamepad and input:isUsingGamepad() then
		boxPets:restoreBoxNavFocusSlot(slot, false)
	end

	local petInfos = boxPets.petInfos
	local petInfo = Utils.isTable(petInfos) and petInfos[slot + 1]

	if petInfo and petInfo.id and petInfo.isEmpty ~= true then
		if boxPets.refreshPetSelectedStatus then
			boxPets:refreshPetSelectedStatus(slot, nil, petInfo)
		end
	elseif boxPets.model and boxPets.model.setCurSelectPetId then
		boxPets.model:setCurSelectPetId()

		if boxPets.selectItemIfExists then
			boxPets:selectItemIfExists()
		end
	end

	if self.ctrl.startFrameTimer then
		local focusSlot = slot

		self.ctrl:startFrameTimer(function()
			if self.ctrl._initGamepadFocusSlot == focusSlot then
				self.ctrl._initGamepadFocusSlot = nil
			end
		end, 1)
	end
end

function PetWarehouseComponent:isOccupiedDropSlot(dropSlot)
	if not Utils.isTable(dropSlot) then
		return false
	end

	if dropSlot.isEmpty == true then
		return false
	end

	return dropSlot.petId ~= nil or dropSlot.isEmpty == false
end

function PetWarehouseComponent:showOrderedEmptySlotNotice()
	pg.global.showBubbleMessageById(NoticeDef.PET_WAREHOUSE_INOUT_ORDER_VALID_SLOT)
end

function PetWarehouseComponent:handlePetDrop(sourcePetId, dropWidget)
	if sourcePetId == nil or not self.manager then
		return false
	end

	local dropSlot = dropWidget and self:getWarehouseDropSlot(dropWidget)
	local occupied = self:isOccupiedDropSlot(dropSlot)
	local target

	if dropSlot and not occupied then
		target = {
			boxId = dropSlot.boxId,
			slot = dropSlot.slot
		}
	end

	self._orderedEmptySlotNotice = occupied

	local started = self:requestMoveIn(self:getDropPetIds(sourcePetId), target)

	if not started then
		self._orderedEmptySlotNotice = nil
	end

	return started
end

function PetWarehouseComponent:isPetInCurrentFormation(player, petId)
	if not player then
		return false
	end

	local lists = {
		player.petPrepareList,
		player.petExploreList
	}

	for i = 1, #lists do
		local list = lists[i]

		if list then
			for j = 1, #list do
				if list[j] == petId then
					return true
				end
			end
		end
	end

	return false
end

function PetWarehouseComponent:collectMoveInPetIds(petIds)
	local accepted = {}
	local player = self.manager and self.manager:getPlayer()

	for _, petId in ipairs(petIds or {}) do
		if not self:isPetInCurrentFormation(player, petId) then
			accepted[#accepted + 1] = petId
		end
	end

	return accepted
end

function PetWarehouseComponent:getWritableBoxEmpty(box)
	if not Utils.isTable(box) then
		return 0
	end

	if box.needUnlock == true or box.tempLocked == true then
		return 0
	end

	local slotCount = tonumber(box.slotCount) or 0
	local count = tonumber(box.count) or 0

	return math.max(slotCount - count, 0)
end

function PetWarehouseComponent:takeFirstPetIds(petIds, count)
	local fitted = {}
	local limit = math.min(count or 0, #(petIds or {}))

	for i = 1, limit do
		fitted[i] = petIds[i]
	end

	return fitted
end

function PetWarehouseComponent:requestMoveIn(petIds, target)
	if self._destroyed or not self._visible or not self.manager then
		return false
	end

	local boxes = self.manager:getWarehouseBoxes() or {}
	local box = boxes[self.currentBoxIndex]

	if not box then
		return false
	end

	local warehouseFilter = self.filter and self.filter.active == true
	local hasTargetBox = warehouseFilter ~= true
	local targetBoxId = box.id
	local targetSlot = 0

	if Utils.isTable(target) then
		if target.boxId ~= nil then
			targetBoxId = target.boxId
		end

		if target.slot ~= nil then
			targetSlot = target.slot
		end
	end

	if warehouseFilter then
		hasTargetBox = false
		targetBoxId = 0
		targetSlot = 0
	end

	local destBox = box

	if hasTargetBox then
		destBox = self.manager:getBox(PetWarehouseConst.DOMAIN.WAREHOUSE, targetBoxId) or box

		if destBox.tempLocked == true then
			self:showWarehouseTempLockedNotice()

			return false
		end

		if destBox.needUnlock == true then
			self:showOperationFailure(PetWarehouseConst.ACTION.MOVE_IN, PetWarehouseConst.REASON.BOX_LOCKED)

			return false
		end
	end

	petIds = self:collectMoveInPetIds(petIds)

	if #petIds == 0 then
		self:showOperationFailure(PetWarehouseConst.ACTION.MOVE_IN, PetWarehouseConst.REASON.IN_FORMATION)

		return false
	end

	local player = self.manager:getPlayer()

	if not player or not player.warehousePetBoxMap then
		return false
	end

	local targetEmpty = 0

	if hasTargetBox then
		targetEmpty = self:getWritableBoxEmpty(destBox)
	end

	local totalEmpty = PetWarehouseDataAdapter:getManualWritableEmptySlot(player.warehousePetBoxMap)
	local plan = PetManagementUtils.buildMoveOverflowPlan(#petIds, targetEmpty, totalEmpty, hasTargetBox)

	local function startFitted(fitted, allowOverflow, startBoxId, startSlot)
		local started = self:_startDropOperation(fitted, startBoxId, startSlot, allowOverflow)

		if started then
			self:clearPetSelection()
		end

		return started
	end

	if not plan.needConfirm then
		local allowOverflow = plan.allowOverflow == true
		local startBoxId = targetBoxId
		local startSlot = targetSlot

		if hasTargetBox ~= true then
			startBoxId = 0
			startSlot = 0
			allowOverflow = true
		end

		return startFitted(petIds, allowOverflow, startBoxId, startSlot)
	end

	PetManagementUtils.showMoveOverflowConfirm(plan, {
		onTargetOnly = function()
			local count = PetManagementUtils.takeMoveOverflowFit(plan, true)

			if not count then
				return
			end

			startFitted(self:takeFirstPetIds(petIds, count), false, targetBoxId, targetSlot)
		end,
		onOverflow = function()
			local count = PetManagementUtils.takeMoveOverflowFit(plan, false)

			if not count then
				return
			end

			local overflowBoxId = targetBoxId
			local overflowSlot = targetSlot

			if hasTargetBox ~= true then
				overflowBoxId = 0
				overflowSlot = 0
			end

			startFitted(self:takeFirstPetIds(petIds, count), true, overflowBoxId, overflowSlot)
		end,
		onCancel = function()
			self._orderedEmptySlotNotice = nil
		end
	})

	return true
end

function PetWarehouseComponent:_startMoveOut(petIds, options, occupiedNotice)
	if not Utils.isTable(petIds) or #petIds == 0 then
		return false
	end

	local operation, reason = self.manager:startTransfer(PetWarehouseConst.ACTION.MOVE_OUT, petIds, {
		targetBoxId = options and options.targetBoxId or 0,
		targetSlot = options and options.targetSlot or 0
	})

	if not operation or operation.status == PetWarehouseConst.STATE.FAILED then
		if operation and operation.failureNoticeShown then
			return false
		end

		if reason == PetWarehouseConst.REASON.TARGET_FULL or operation and operation.reason == PetWarehouseConst.REASON.TARGET_FULL then
			pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.PET_BAG_FULL)

			return false
		end

		self:showOperationFailure(PetWarehouseConst.ACTION.MOVE_OUT, reason or operation and operation.reason)

		return false
	end

	if occupiedNotice then
		self:showOrderedEmptySlotNotice()
	end

	self:trackMoveOut(operation)
	self:clearPetSelection()

	if self.batch and self.batch.active then
		self.batch.operation = operation

		if self.batch.onOperation then
			self.batch:onOperation(operation)
		end
	end

	return true
end

function PetWarehouseComponent:requestMoveOut(petIds, options)
	if self._destroyed or not self._visible or not self.manager then
		return false
	end

	if not Utils.isTable(petIds) or #petIds == 0 then
		return false
	end

	local player = self.manager:getPlayer()

	if not player or not player.petBoxMap then
		return false
	end

	local bagFilter = self.ctrl and self.ctrl.inFilterMode == true
	local targetBoxId = options and tonumber(options.targetBoxId) or nil
	local targetSlot = options and tonumber(options.targetSlot) or 0

	if targetBoxId == 0 then
		targetBoxId = nil
	end

	local hasTargetBox = bagFilter ~= true and targetBoxId ~= nil
	local targetEmpty = 0

	if hasTargetBox then
		local destBox = player.petBoxMap[targetBoxId]

		if destBox and destBox.canManualMove and not destBox:canManualMove() then
			hasTargetBox = false
			targetBoxId = nil
			targetSlot = 0
		else
			targetEmpty = self:getWritableBoxEmpty(destBox)
		end
	end

	local totalEmpty = PetWarehouseDataAdapter:getValidEmptySlot(player.petBoxMap)

	if hasTargetBox then
		totalEmpty = math.max(totalEmpty, targetEmpty)
	end

	local plan = PetManagementUtils.buildMoveOverflowPlan(#petIds, targetEmpty, totalEmpty, hasTargetBox)
	local transferOptions = {
		targetBoxId = hasTargetBox and targetBoxId or 0,
		targetSlot = hasTargetBox and targetSlot or 0
	}
	local occupiedNotice = options and options.occupiedNotice == true

	if not plan.needConfirm then
		return self:_startMoveOut(petIds, transferOptions, occupiedNotice)
	end

	PetManagementUtils.showMoveOverflowConfirm(plan, {
		onTargetOnly = function()
			local count = PetManagementUtils.takeMoveOverflowFit(plan, true)

			if not count then
				return
			end

			self:_startMoveOut(self:takeFirstPetIds(petIds, count), transferOptions, occupiedNotice)
		end,
		onOverflow = function()
			local count = PetManagementUtils.takeMoveOverflowFit(plan, false)

			if not count then
				return
			end

			self:_startMoveOut(self:takeFirstPetIds(petIds, count), transferOptions, occupiedNotice)
		end
	})

	return true
end

function PetWarehouseComponent:getBagTipAnchor()
	local view = self.ctrl and self.ctrl.view

	if not view then
		return nil
	end

	local useFilterList = self.ctrl.inFilterMode == true
	local boxPets = self.ctrl.boxPets

	if not useFilterList and boxPets and boxPets.model and boxPets.model.isHomePetMode then
		useFilterList = boxPets.model:isHomePetMode() == true
	end

	if useFilterList and NotNil(view.boxPetFilterList) then
		return view.boxPetFilterList
	end

	return view.boxPetNewList
end

function PetWarehouseComponent:getWarehouseTipAnchor()
	if NotNil(self.rightListUList) then
		return self.rightListUList
	end

	return self.transform
end

function PetWarehouseComponent:getFixedPetTipSpec(domain)
	local bag = domain == PetWarehouseConst.DOMAIN.BAG
	local anchor = self:getWarehouseTipAnchor()
	local edge = "left"
	local pivotX = 1

	if bag then
		anchor = self:getBagTipAnchor()
		edge = "right"
		pivotX = 0
	end

	return {
		pivotY = 1,
		anchor = anchor,
		edge = edge,
		pivotX = pivotX
	}
end

function PetWarehouseComponent.computeFixedPetTipOffset(targetLocalX, targetLocalY, parentLeft, parentBottom, parentWidth, parentHeight)
	local anchorX = parentLeft + parentWidth * 0.5
	local anchorY = parentBottom + parentHeight * 0.5

	return targetLocalX - anchorX, targetLocalY - anchorY
end

function PetWarehouseComponent:placeFixedPetTip(button, domain)
	local spec = self:getFixedPetTipSpec(domain)

	if not spec or IsNil(spec.anchor) or IsNil(button) then
		return false
	end

	local popup = self._warehouseTipPopup

	if IsNil(popup) then
		local popupTool = button and button.PopupTool

		if popupTool ~= nil and type(popupTool) ~= "userdata" then
			popup = popupTool.popupInstance
		end
	end

	if IsNil(popup) then
		return false
	end

	local popupRect = popup.rectTransform

	if IsNil(popupRect) then
		popupRect = popup.transform
	end

	local anchorRect = spec.anchor.rectTransform

	if IsNil(anchorRect) then
		anchorRect = spec.anchor.transform
	end

	if IsNil(popupRect) or IsNil(anchorRect) or IsNil(popupRect.parent) then
		return false
	end

	local anchor = anchorRect.rect
	local parent = popupRect.parent
	local parentRect = parent.rect

	if not anchor or not parentRect then
		return false
	end

	local targetX = anchor.xMin

	if spec.edge == "right" then
		targetX = anchor.xMax
	end

	local worldPoint = anchorRect:TransformPoint(CS.UnityEngine.Vector3(targetX, anchor.yMax, 0))
	local localPoint = parent:InverseTransformPoint(worldPoint)
	local offsetX, offsetY = PetWarehouseComponent.computeFixedPetTipOffset(localPoint.x, localPoint.y, parentRect.xMin, parentRect.yMin, parentRect.width, parentRect.height)

	popupRect.anchorMin = CS.UnityEngine.Vector2(0.5, 0.5)
	popupRect.anchorMax = CS.UnityEngine.Vector2(0.5, 0.5)
	popupRect.pivot = CS.UnityEngine.Vector2(spec.pivotX, spec.pivotY)
	popupRect.anchoredPosition = CS.UnityEngine.Vector2(offsetX, offsetY)

	return true
end

function PetWarehouseComponent:settleOpenDetailCard()
	if not self.tips or not self.tips.settleDetailCard or IsNil(self._warehouseTipPopup) then
		return
	end

	self.tips:settleDetailCard(self._warehouseTipPopup)
end

function PetWarehouseComponent:keepFixedPetTip(button, domain, isCurrent)
	self:placeFixedPetTip(button, domain)
	self:settleOpenDetailCard()

	if not self.startFrameTimer then
		return
	end

	local version = self._selectionVersion

	local function replay()
		if self._selectionVersion ~= version then
			return
		end

		if isCurrent and not isCurrent() then
			return
		end

		self:placeFixedPetTip(button, domain)
		self:settleOpenDetailCard()
	end

	local frames = {
		1,
		2,
		4,
		8,
		12,
		16,
		20
	}

	for index = 1, #frames do
		local frame = frames[index]

		self:startFrameTimer(replay, frame)
	end

	if self.startTimer then
		self:startTimer(replay, 0.25)
		self:startTimer(replay, 0.45)
	end
end

function PetWarehouseComponent:canOpenPetTips(domain)
	if self._destroyed or not self._visible then
		return false
	end

	if self.ctrl and self.ctrl.isDragging then
		return false
	end

	if self.ctrl and self.ctrl.inReleaseMode then
		return false
	end

	if self.batch and self.batch.active then
		return domain == PetWarehouseConst.DOMAIN.BAG
	end

	return true
end

function PetWarehouseComponent:cancelDetailWaitNotice()
	local timerId = self._detailWaitTimerId

	self._detailWaitTimerId = nil
	self._detailWaitPetId = nil
	self._detailWaitSelectionVersion = nil
	self._detailWaitToken = (self._detailWaitToken or 0) + 1

	if timerId and self.killTimer then
		self:killTimer(timerId)
	end
end

function PetWarehouseComponent:armDetailWaitNotice(petId)
	self:cancelDetailWaitNotice()

	if petId == nil or not self.startTimer then
		return
	end

	local selectionVersion = self._selectionVersion
	local token = self._detailWaitToken

	self._detailWaitPetId = petId
	self._detailWaitSelectionVersion = selectionVersion

	local delay = PetWarehouseConst.DETAIL_WAIT_NOTICE_SECONDS or 1

	self._detailWaitTimerId = self:startTimer(function()
		self._detailWaitTimerId = nil

		self:onDetailWaitTimeout(petId, selectionVersion, token)
	end, delay)
end

function PetWarehouseComponent:onDetailWaitTimeout(petId, selectionVersion, token)
	if token ~= self._detailWaitToken then
		return
	end

	self._detailWaitPetId = nil
	self._detailWaitSelectionVersion = nil

	if self._destroyed or not self._visible then
		return
	end

	if self.ctrl then
		if self.ctrl.checkUIOpen then
			if not self.ctrl:checkUIOpen() then
				return
			end
		elseif self.ctrl._isOpen == false then
			return
		end
	end

	if self._selectedPetId ~= petId or self._selectionVersion ~= selectionVersion then
		return
	end

	if self._openedSelectionVersion == selectionVersion then
		return
	end

	if self._detailWaitNoticeVersion == selectionVersion then
		return
	end

	local domain = self._selectedPetDomain or PetWarehouseConst.DOMAIN.WAREHOUSE

	if not self:canOpenPetTips(domain) then
		return
	end

	local noticeId = PetWarehouseConst.PetWarehouseNotice.DETAIL_WAIT_TIMEOUT

	if noticeId then
		self._detailWaitNoticeVersion = selectionVersion

		pg.global.showBubbleMessageById(noticeId)
	end
end

function PetWarehouseComponent:selectPet(petId, button, domain)
	domain = domain or PetWarehouseConst.DOMAIN.WAREHOUSE

	if not self:canOpenPetTips(domain) then
		return
	end

	if petId == nil or not self.manager or IsNil(button) or self.manager:getPetDomain(petId) ~= domain then
		return
	end

	if self._selectedPetId == petId and self._selectedPetDomain == domain and self._selectedButton == button and self._tooltipDomain == domain then
		if domain == PetWarehouseConst.DOMAIN.WAREHOUSE then
			self:applyWarehousePetSelectedVisual(button, {
				id = petId
			})
			self:syncVisibleWarehousePetSelection()
			self:clearBagPetSelection()
		end

		self:setCachedPetTipVisible(true)

		local version = self._selectionVersion

		self:keepFixedPetTip(button, domain, function()
			return not self._destroyed and self._visible and not self.ctrl.isDragging and self._selectionVersion == version and self._selectedPetId == petId and self._selectedButton == button and self._tooltipDomain == domain
		end)

		return
	end

	self:clearPetSelection()

	self._moveInConfirmation = nil

	self:clearReleaseConfirmation()

	self._selectionVersion = self._selectionVersion + 1
	self._selectedPetId = petId
	self._selectedPetDomain = domain
	self._selectedButton = button
	self._openedSelectionVersion = nil

	if domain == PetWarehouseConst.DOMAIN.WAREHOUSE then
		self:applyWarehousePetSelectedVisual(button, {
			id = petId
		})
		self:syncVisibleWarehousePetSelection()
		self:clearBagPetSelection()
	end

	local player = self.manager:getPlayer()

	self._selectedPlayer = player

	if domain == PetWarehouseConst.DOMAIN.WAREHOUSE then
		local context = {
			petId = petId,
			player = player,
			version = self._selectionVersion
		}

		self._selectedDetailRequest = context

		self:armDetailWaitNotice(petId)

		local function complete(operation)
			if self._selectedDetailRequest ~= context then
				return
			end

			self._selectedDetailRequest = nil

			local cancelled = operation and operation.reason == PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

			if cancelled or self._destroyed or not self._visible or player == nil or player.destroyed or self._selectionVersion ~= context.version or self.manager:getPlayer() ~= player then
				self._selectedPetInfo = nil

				self:cancelDetailWaitNotice()

				return
			end

			if operation and operation.status == PetWarehouseConst.STATE.SUCCEEDED then
				self._selectedPetInfo = operation.infos and operation.infos[petId]

				if not self._selectedPetInfo then
					self:onDetailWaitTimeout(petId, context.version, self._detailWaitToken)
					self:cancelDetailWaitNotice()

					return
				end

				self:cancelDetailWaitNotice()

				local data = button.dataFromUList

				if not Utils.isTable(data) or data.id ~= petId then
					data = {
						id = petId
					}
				end

				self:refreshWarehousePetCrown(button, data, self._selectedPetInfo)
				self:tryOpenSelectedPetDetails()
			else
				self:onDetailWaitTimeout(petId, context.version, self._detailWaitToken)
				self:cancelDetailWaitNotice()

				self._selectedPetInfo = nil
			end
		end

		local operation = self.manager:requestPetDetails({
			petId
		}, complete)

		if not operation then
			complete(nil)
		end

		return
	end

	self:tryOpenSelectedPetDetails()
end

function PetWarehouseComponent:getTipHostButton()
	local view = self.ctrl and self.ctrl.view

	if view and NotNil(view.closeBtn) then
		return view.closeBtn
	end

	if NotNil(self.btnSortBoxUButton) then
		return self.btnSortBoxUButton
	end

	if NotNil(self.btnLeftUButton) then
		return self.btnLeftUButton
	end

	return self._selectedButton
end

function PetWarehouseComponent:setCachedPetTipVisible(visible)
	local popup = self._warehouseTipPopup

	if IsNil(popup) then
		return
	end

	visible = visible == true

	if NotNil(popup.gameObject) and popup.gameObject.SetActiveEx then
		popup.gameObject:SetActiveEx(visible)
	elseif popup.SetActiveEx then
		popup:SetActiveEx(visible)
	end

	local blocker = self._warehouseTipBlocker

	if IsNil(blocker) and NotNil(popup.transform) then
		local parent = popup.transform.parent

		if parent and parent.Find then
			local node = parent:Find("PopupRaycastBlocker")

			if NotNil(node) then
				blocker = node
				self._warehouseTipBlocker = blocker
			end
		end
	end

	if NotNil(blocker) then
		if NotNil(blocker.gameObject) and blocker.gameObject.SetActiveEx then
			blocker.gameObject:SetActiveEx(visible)
		elseif blocker.SetActiveEx then
			blocker:SetActiveEx(visible)
		end
	end
end

function PetWarehouseComponent:hidePetTip()
	self:setCachedPetTipVisible(false)

	self._tooltipDomain = nil

	if self.petInfoTipPresenter and self.petInfoTipPresenter.setPetPreviewTipsOpenCount then
		self.petInfoTipPresenter:setPetPreviewTipsOpenCount(0)
	end

	self:refreshBatchDimming()
end

function PetWarehouseComponent:destroyPetTip()
	local host = self._tooltipButton

	self._warehouseTipPopup = nil
	self._warehouseTipPopupButton = nil
	self._warehouseTipBlocker = nil
	self._tooltipButton = nil
	self._tooltipDomain = nil
	self._petTipHostBound = false
	self._petTipOpening = false
	self._petTipOpen = nil

	if NotNil(host) then
		host:SetPopupValidateTouch(nil)

		if host.CloseTooltip then
			host:CloseTooltip()
		end

		if self.petInfoTipPresenter then
			self.petInfoTipPresenter:unbind(host)
		end
	end

	if self.petInfoTipPresenter and self.petInfoTipPresenter.setPetPreviewTipsOpenCount then
		self.petInfoTipPresenter:setPetPreviewTipsOpenCount(0)
	end

	self:refreshBatchDimming()
end

function PetWarehouseComponent:tryOpenSelectedPetDetails()
	if self._selectedDetailRequest then
		return false
	end

	if self._destroyed or not self._visible then
		self:cancelDetailWaitNotice()

		return false
	end

	if self.batch.active or self.ctrl.inReleaseMode or self.ctrl.isDragging then
		return false
	end

	local petId = self._selectedPetId
	local button = self._selectedButton

	if petId == nil or IsNil(button) or not self.manager then
		return false
	end

	if button.dataFromUList == nil or button.dataFromUList.id ~= petId then
		return false
	end

	local player = self.manager:getPlayer()

	if not player or player.destroyed or player ~= self._selectedPlayer then
		return false
	end

	local pet = self.manager:getPetInfo(petId, self._selectedPetInfo)

	if pet == nil then
		return false
	end

	self:cancelDetailWaitNotice()

	local domain = self._selectedPetDomain

	if domain == PetWarehouseConst.DOMAIN.WAREHOUSE then
		self:refreshWarehousePetCrown(button, button.dataFromUList, pet)
	end

	if self.manager:getPetDomain(petId) ~= domain then
		return false
	end

	local selectionVersion = self._selectionVersion

	if self._openedSelectionVersion == selectionVersion then
		return true
	end

	local host = self._tooltipButton

	if IsNil(host) then
		host = self:getTipHostButton()
	end

	if IsNil(host) then
		return false
	end

	local petInfo = PetManagementDataHelper.setUpPetInfo(pet)

	local function isCurrent()
		if not self:canOpenPetTips(domain) then
			return false
		end

		return self._selectionVersion == selectionVersion and self.manager:getPlayer() == player and self.manager:getPetDomain(petId) == domain and NotNil(button) and button.dataFromUList ~= nil and button.dataFromUList.id == petId
	end

	self._petTipOpen = {
		petId = petId,
		domain = domain,
		button = button,
		petInfo = petInfo,
		isCurrent = isCurrent,
		selectionVersion = selectionVersion
	}

	local alreadyBound = self._petTipHostBound == true and self._tooltipButton == host

	if not alreadyBound then
		self.petInfoTipPresenter:bind(host, function()
			local ctx = self._petTipOpen

			if not ctx or not ctx.isCurrent() then
				return nil
			end

			return ctx.petInfo
		end, {
			enabledAutoClose = true,
			includePopup = true,
			tooltipTemplateUrl = "$UI_Node_PetManag_Tips.prefab",
			hierarchy = 1,
			popupDirection = domain == PetWarehouseConst.DOMAIN.BAG and CS.XGUI.EPopupDirection.Right or CS.XGUI.EPopupDirection.Left,
			verticalAlignment = CS.XGUI.EVerticalAlignment.Middle,
			renderPetInfo = function(popup, info, triggerButton)
				local ctx = self._petTipOpen

				if not ctx or not ctx.isCurrent() then
					self:setCachedPetTipVisible(false)

					return
				end

				local ctxPetId = ctx.petId
				local ctxVersion = ctx.selectionVersion
				local ctxDomain = ctx.domain
				local ctxButton = ctx.button
				local ctxIsCurrent = ctx.isCurrent
				local actions = {
					onRelease = function()
						self:releaseSelectedPet(ctxPetId, ctxVersion)
					end,
					onContentReady = function()
						if not ctxIsCurrent() then
							return
						end

						self:keepFixedPetTip(ctxButton, ctxDomain, ctxIsCurrent)
					end
				}

				if ctxDomain == PetWarehouseConst.DOMAIN.BAG then
					function actions.onMoveIn()
						self:moveSelectedPetIn(ctxPetId, ctxVersion)
					end
				else
					function actions.onMoveOut()
						self:moveSelectedPetOut(ctxPetId, ctxVersion)
					end
				end

				self.tips:render(popup, info, self.petInfoTipPresenter, triggerButton, ctxIsCurrent, actions)
			end
		})

		host.enabledTooltip = false

		host:SetPopupValidateTouch(function(pos)
			local popup = self._warehouseTipPopup
			local xguiUtils = CS and CS.XGUI and CS.XGUI.Utils

			if NotNil(popup) and NotNil(popup.gameObject) and xguiUtils and xguiUtils.Raycast and xguiUtils.Raycast(pos, popup.gameObject) then
				return false
			end

			self:dismissPetSelection()

			return false
		end)

		local onPopup = host.luaTooltipPopup

		function host.luaTooltipPopup(btn, flag)
			self._petTipOpening = false

			local ctx = self._petTipOpen

			if ToBool(flag) then
				if not ctx or not ctx.isCurrent() then
					self:clearPetSelection()

					return
				end

				if onPopup then
					onPopup(btn, flag)
				end

				self._tooltipDomain = ctx.domain

				self:keepFixedPetTip(ctx.button, ctx.domain, ctx.isCurrent)
			else
				if onPopup then
					onPopup(btn, flag)
				end

				if IsNil(self._warehouseTipPopup) then
					self._warehouseTipPopup = nil
					self._warehouseTipPopupButton = nil
					self._warehouseTipBlocker = nil
				end

				self._tooltipDomain = nil

				if self._selectedPetId then
					self:dismissPetSelection()
				end
			end

			self:refreshBatchDimming()
		end

		local renderTooltip = host.luaRenderTooltip

		function host.luaRenderTooltip(btn, popup)
			self._petTipOpening = false

			if NotNil(popup) then
				self._warehouseTipPopup = popup
				self._warehouseTipPopupButton = btn
			end

			local ctx = self._petTipOpen

			if not ctx or not ctx.isCurrent() then
				self:setCachedPetTipVisible(false)

				return
			end

			self:setCachedPetTipVisible(true)

			if renderTooltip then
				renderTooltip(btn, popup)
			end
		end

		self._tooltipButton = host
		self._petTipHostBound = true
	else
		host:SetPopupDirection(domain == PetWarehouseConst.DOMAIN.BAG and CS.XGUI.EPopupDirection.Right or CS.XGUI.EPopupDirection.Left)
	end

	local cached = self._warehouseTipPopup

	if NotNil(cached) then
		self:setCachedPetTipVisible(true)

		if host.luaRenderTooltip then
			host.luaRenderTooltip(host, cached)
		end

		if host.luaTooltipPopup then
			host.luaTooltipPopup(host, true)
		end
	elseif self._petTipOpening then
		-- block empty
	else
		self._petTipOpening = true

		host:OpenTooltipWithUrl("$UI_Node_PetManag_Tips.prefab")
	end

	self._openedSelectionVersion = selectionVersion

	if self.startFrameTimer then
		self:startFrameTimer(function()
			if not isCurrent() then
				self:setCachedPetTipVisible(false)
			end
		end, 1)
		self:startFrameTimer(function()
			if not isCurrent() then
				self:setCachedPetTipVisible(false)
			end
		end, 3)
	end

	return true
end

function PetWarehouseComponent:moveSelectedPetIn(petId, selectionVersion)
	if not self:isSelectedPetCurrent(petId, selectionVersion, PetWarehouseConst.DOMAIN.BAG) then
		return
	end

	self:requestMoveIn({
		petId
	})
end

function PetWarehouseComponent:isSelectedPetCurrent(petId, selectionVersion, domain)
	return not self._destroyed and self._visible and not self.batch.active and not self.ctrl.inReleaseMode and self.manager ~= nil and self._selectedPetId == petId and self._selectionVersion == selectionVersion and self._selectedPetDomain == domain and self.manager:getPlayer() == self._selectedPlayer and self.manager:getPetDomain(petId) == domain
end

function PetWarehouseComponent:moveSelectedPetOut(petId, selectionVersion)
	if not self:isSelectedPetCurrent(petId, selectionVersion, PetWarehouseConst.DOMAIN.WAREHOUSE) then
		return
	end

	self:requestMoveOut({
		petId
	}, self:getMoveOutTransferOptions())
end

function PetWarehouseComponent:checkReleasePet(petInfo)
	local boxPets = self.ctrl and self.ctrl.boxPets

	if boxPets and boxPets.isReleaseForbidden and boxPets:isReleaseForbidden() then
		return false
	end

	if self.ctrl and self.ctrl.inReleaseMode then
		return false
	end

	local petId = petInfo.id

	if petInfo.isSealed then
		pg.global.showBubbleMessage(NoticeDef.PET_BOND_RELEASE_BANNED)

		return false
	end

	if pg.game.petManage:getPetIsInBattle(petId) then
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.CANNOT_RELEASE_BATTLE_PET)

		return false
	end

	if petInfo.favoriteType and petInfo.favoriteType > 0 then
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.PET_FAVORITE)

		return false
	end

	if LuaUIUtils.tableContains(PetConfigData.forbidReleasePet, petInfo.templateId) then
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.PET_FORBIDDEN)

		return false
	end

	if pg.me:isPetPutInHomeland(petInfo) then
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.PET_IN_HOMELAND)

		return false
	end

	if pg.me:isPetActivityDispatching(petInfo) then
		pg.global.ui.tips:showTextTip(pg.getGameString(PetWarehouseConst.PetWarehouseText.DISPATCH_FORBIDDEN))

		return false
	end

	for _, formation in ipairs(pg.me.prepareFormationList or {}) do
		for _, explorePetId in ipairs(formation.exploreFormation or {}) do
			if explorePetId == petId then
				pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.EXPLORE_FORBIDDEN))

				return false
			end
		end
	end

	return true
end

function PetWarehouseComponent:releaseSelectedPet(petId, selectionVersion)
	local domain = self._selectedPetDomain

	if not self:isSelectedPetCurrent(petId, selectionVersion, domain) then
		return
	end

	local player = self.manager:getPlayer()

	self:releasePet(petId, domain, player, self._selectedPetInfo)
end

function PetWarehouseComponent:releasePet(petId, domain, player, sourcePetInfo)
	if domain == PetWarehouseConst.DOMAIN.WAREHOUSE and sourcePetInfo == nil then
		local request = {
			petId = petId,
			player = player,
			domain = domain
		}

		self._releaseDetailRequest = request

		local function complete(operation)
			if self._releaseDetailRequest ~= request then
				return
			end

			self._releaseDetailRequest = nil

			local cancelled = operation and operation.reason == PetWarehouseConst.REASON.PLAYER_UNAVAILABLE

			if cancelled or self._destroyed or not self._visible or player == nil or player.destroyed or self.manager == nil or self.manager:getPlayer() ~= player or self.manager:getPetDomain(petId) ~= domain then
				return
			end

			local petInfo = operation and operation.status == PetWarehouseConst.STATE.SUCCEEDED and operation.infos and operation.infos[petId]

			if not petInfo then
				pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.DETAIL_WAIT_TIMEOUT)

				return
			end

			self:releasePet(petId, domain, player, petInfo)
		end

		local operation = self.manager:requestPetDetails({
			petId
		}, complete, true)

		if self._releaseDetailRequest ~= request then
			return
		end

		if operation == nil then
			complete(nil)
		end

		return
	end

	local petInfo = sourcePetInfo or self.manager:getPetInfo(petId)

	if not petInfo or self.manager:getPetDomain(petId) ~= domain then
		if domain == PetWarehouseConst.DOMAIN.BAG then
			self._moveInBagFocus = nil
		end

		return
	end

	if not self:checkReleasePet(petInfo) then
		if domain == PetWarehouseConst.DOMAIN.BAG then
			self._moveInBagFocus = nil
		end

		return
	end

	local title = pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TITLE)
	local tip = pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TIP)

	if self.manager:getTotalPetCount() <= 1 then
		if domain == PetWarehouseConst.DOMAIN.BAG then
			self._moveInBagFocus = nil
		end

		pg.global.showConfirmMsgRaw(title, pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_WARN_TIP), nil, true)

		return
	end

	if pg.game.petManage:hasPetCultivationByInfo(petInfo) then
		tip = pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_CULTIVATION_TIP) .. tip
	end

	local recycleBack = ItemUtils.getBatchRecyclePetClientDisplayItem(pg.me, {
		petId
	}, {
		[petId] = petInfo
	})
	local confirmation = {
		player = player,
		petId = petId,
		manager = self.manager,
		domain = domain,
		sourcePetInfo = petInfo
	}

	self:clearReleaseConfirmation()

	self._releaseConfirmation = confirmation

	if domain == PetWarehouseConst.DOMAIN.BAG then
		self:trackMoveInBagFocus({
			petId
		})
	end

	self:clearPetSelection(nil, true)
	pg.global.showCommonTipUse(title, tip, recycleBack, function()
		if self._releaseConfirmation ~= confirmation then
			return
		end

		self._releaseConfirmation = nil

		self:confirmReleasePet(confirmation)
	end, function()
		if self._releaseConfirmation == confirmation then
			self:clearReleaseConfirmation()

			if domain == PetWarehouseConst.DOMAIN.BAG then
				self._moveInBagFocus = nil
			end
		end
	end, true)
end

function PetWarehouseComponent:confirmReleasePet(confirmation)
	if self._destroyed or not self._visible or self.manager ~= confirmation.manager then
		return
	end

	if self.manager:getPlayer() ~= confirmation.player then
		return
	end

	local petId = confirmation.petId
	local petInfo = confirmation.sourcePetInfo or self.manager:getPetInfo(petId)

	if not petInfo or self.manager:getPetDomain(petId) ~= confirmation.domain then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.PET_UNAVAILABLE))

		return
	end

	if not self:checkReleasePet(petInfo) then
		return
	end

	if self.manager:getTotalPetCount() <= 1 then
		pg.global.showConfirmMsgRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_TITLE), pg.getGameString(PetWarehouseConst.PetWarehouseText.RELEASE_WARN_TIP), nil, true)

		return
	end

	local batchTimeout

	if confirmation.domain ~= PetWarehouseConst.DOMAIN.BAG then
		batchTimeout = Const.CALL_WAREHOUSE_PET_TIMEOUT
	end

	local started, reason = pg.game.petManage:tryRecyclePet({
		petId
	}, batchTimeout)

	if not started then
		if confirmation.domain == PetWarehouseConst.DOMAIN.BAG then
			self._moveInBagFocus = nil

			self:showOperationFailure(PetWarehouseConst.ACTION.RECYCLE, reason)
		else
			self:showRecycleStartFailure(reason)
		end
	end
end

function PetWarehouseComponent:showWarehouseTempLockedNotice()
	pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.BOX_EXPIRED)
end

function PetWarehouseComponent:showRecycleStartFailure(reason)
	if reason == "petPending" or reason == "busy" then
		reason = PetWarehouseConst.REASON.BUSY
	end

	self:showOperationFailure(PetWarehouseConst.ACTION.RECYCLE, reason)
end

function PetWarehouseComponent:showOperationFailure(action, reason)
	if reason == PetWarehouseConst.REASON.IN_FORMATION then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.FORMATION_FORBIDDEN))

		return
	end

	if action == PetWarehouseConst.ACTION.MOVE_OUT and reason == PetWarehouseConst.REASON.TARGET_FULL then
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.PET_BAG_FULL)

		return
	end

	if action == PetWarehouseConst.ACTION.MOVE_IN and reason == PetWarehouseConst.REASON.TARGET_FULL then
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.TARGET_AREA_NOT_ENOUGH, 0)

		return
	end

	if reason == PetWarehouseConst.REASON.BOX_LOCKED then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.BOX_LOCKED))

		return
	end

	local reasonSet = {
		[PetWarehouseConst.REASON.BUSY] = true,
		[PetWarehouseConst.REASON.LATE_RESULT_PENDING] = true,
		[PetWarehouseConst.REASON.REQUEST_TIMEOUT] = true
	}

	if reasonSet[reason] then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.OPERATION_PENDING))

		return
	end

	if reason == PetWarehouseConst.REASON.PET_NOT_FOUND or reason == PetWarehouseConst.REASON.DOMAIN_CONFLICT or reason == PetWarehouseConst.REASON.PLAYER_UNAVAILABLE then
		pg.global.showBubbleMessageRaw(pg.getGameString(PetWarehouseConst.PetWarehouseText.PET_UNAVAILABLE))

		return
	end

	local key = action == PetWarehouseConst.ACTION.RECYCLE and PetWarehouseConst.PetWarehouseText.RELEASE_FAILED or PetWarehouseConst.PetWarehouseText.MOVE_OUT_FAILED

	pg.global.showBubbleMessageRaw(pg.getGameString(key))
end

function PetWarehouseComponent:clearReleaseConfirmation()
	local confirmation = self._releaseConfirmation

	self._releaseConfirmation = nil
end

function PetWarehouseComponent:clearDragDetailRequest()
	local context = self._dragDetailRequest

	self._dragDetailRequest = nil
	self._pendingDragReleasePetId = nil
end

function PetWarehouseComponent:clearPetSelection(domain, keepConfirmation)
	if domain and self._selectedPetDomain ~= domain then
		return
	end

	self:cancelDetailWaitNotice()

	self._selectedDetailRequest = nil
	self._detailWaitNoticeVersion = nil

	local selectedButton = self._selectedButton
	local selectedDomain = self._selectedPetDomain

	if not keepConfirmation then
		self._moveInConfirmation = nil

		self:clearReleaseConfirmation()
	end

	self._selectionVersion = self._selectionVersion + 1
	self._selectedPetId = nil
	self._selectedPetInfo = nil
	self._selectedPetDomain = nil
	self._selectedPlayer = nil
	self._tooltipDomain = nil
	self._selectedButton = nil

	if selectedDomain == PetWarehouseConst.DOMAIN.WAREHOUSE then
		self:applyWarehousePetSelectedVisual(selectedButton, nil)
		self:syncVisibleWarehousePetSelection()
	end

	self._openedSelectionVersion = nil

	self:hidePetTip()
end

function PetWarehouseComponent:dismissPetSelection()
	self:clearPetSelection()
	self:clearBagPetSelection()
end

function PetWarehouseComponent:getRightFilterPage()
	if self._bottomChromeHidden then
		if self.ctrl and self.ctrl.inReleaseMode then
			return 2
		end

		return 0
	end

	if self.batch and self.batch.active then
		return 1
	end

	if self.ctrl and self.ctrl.inReleaseMode then
		return 2
	end

	return 0
end

function PetWarehouseComponent:refreshBatchDimming()
	if self._destroyed or not self.ctrl then
		return
	end

	local root = self.ctrl.view and self.ctrl.view.root

	if NotNil(root) then
		root:TryChangePage("translucentMid", 0)
	end

	local warehousePanel = self.batch and self.batch.panel

	if NotNil(warehousePanel) then
		warehousePanel:TryChangePage("translucent", 0)
		warehousePanel:TryChangePage("RightFilter", self:getRightFilterPage())
	end

	self:applyBottomChromeByPage()
	self:refreshTransferArrow()
end

function PetWarehouseComponent:getArrowButton()
	if NotNil(self.arrowUButton) then
		return self.arrowUButton
	end

	local view = self.ctrl and self.ctrl.view

	if not view then
		return nil
	end

	if NotNil(view.arrowUButton) then
		self.arrowUButton = view.arrowUButton

		return self.arrowUButton
	end

	if view.objectReference then
		self.arrowUButton = view.objectReference:GetRefValue("arrowUButton")
	end

	return self.arrowUButton
end

function PetWarehouseComponent:getTransferArrowPage()
	local focus = self:getFocusDomain()

	if focus == PetWarehouseConst.DOMAIN.WAREHOUSE then
		return 1
	end

	return 0
end

function PetWarehouseComponent:getFocusDomain()
	if self._tooltipDomain == PetWarehouseConst.DOMAIN.BAG or self._tooltipDomain == PetWarehouseConst.DOMAIN.WAREHOUSE then
		return self._tooltipDomain
	end

	if self._draggingPetId then
		return PetWarehouseConst.DOMAIN.WAREHOUSE
	end

	if self.ctrl and self.ctrl.isDragging then
		return PetWarehouseConst.DOMAIN.BAG
	end

	if self.batch and self.batch.active then
		return PetWarehouseConst.DOMAIN.WAREHOUSE
	end

	if self.ctrl and self.ctrl.inReleaseMode then
		return PetWarehouseConst.DOMAIN.BAG
	end

	return nil
end

function PetWarehouseComponent:refreshTransferArrow()
	local arrow = self:getArrowButton()

	if IsNil(arrow) then
		return
	end

	if not self._visible then
		arrow:TryChangePage("Switch", 0)

		return
	end

	arrow:TryChangePage("Switch", self:getTransferArrowPage())
end

function PetWarehouseComponent:showWarehouse()
	self:show()

	self._visible = true

	if not self._loaded then
		self:loadWarehouseContent()
	end

	self:refreshWarehouse()
	self:refreshBatchDimming()
end

function PetWarehouseComponent:onHide()
	self:cancelDetailWaitNotice()

	self._releaseDetailRequest = nil
end

function PetWarehouseComponent:hideWarehouse()
	self:cancelDetailWaitNotice()

	self._releaseDetailRequest = nil
	self._moveInConfirmation = nil
	self._orderedEmptySlotNotice = nil

	if self.filter then
		self.filter:invalidate()
	end

	self:activeDragReleaseArea(false)
	self:invalidateDragReleaseSession()
	self:clearWarehouseDragReplica()

	self._draggingPetId = nil
	self._draggingButton = nil

	self:stopBagSelectionRestore()

	self._visible = false

	self.batch:leave()
	self:hide()

	self._moveInNavigation = nil
	self._moveInBagFocus = nil
	self._moveOutNavigation = nil
	self._boxActionContext = nil

	self:clearPetSelection()
	self:destroyPetTip()

	self._selectionVersion = self._selectionVersion + 1
	self._selectedPetId = nil
	self._selectedButton = nil
	self._openedSelectionVersion = nil
end

function PetWarehouseComponent:onDestroy()
	self:cancelDetailWaitNotice()

	self._releaseDetailRequest = nil
	self._moveInConfirmation = nil

	if self.filter then
		self.filter:destroy()
	end

	self:activeDragReleaseArea(false)
	self:invalidateDragReleaseSession()
	self:clearWarehouseDragReplica()

	self._draggingPetId = nil
	self._draggingButton = nil

	self:stopBagSelectionRestore()
	self.batch:leave(true)

	self._destroyed = true
	self._moveInNavigation = nil
	self._moveInBagFocus = nil
	self._moveOutNavigation = nil
	self._boxActionContext = nil

	self:clearPetSelection()
	self:destroyPetTip()

	if self.manager and self._managerListener then
		self.manager:unsubscribe(self._managerListener)
	end

	if self.manager and self._boxOperationListener then
		self.manager:unsubscribeOperation(self._boxOperationListener)
	end

	self._boxOperationListener = nil
	self._managerListener = nil

	if self.petInfoTipPresenter then
		self.petInfoTipPresenter:destroy()

		self.petInfoTipPresenter = nil
	end

	self._warehouseCrownStateById = nil
	self.manager = nil
end

return PetWarehouseComponent
