-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagementFree\\PetManagementFreeCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("PetManagementFreeCtrl")
local MessageName = require("Const.MessageName")
local HotkeyConst = require("Const.HotkeyConst")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local BaseProperty = require("CustomTypes.BaseProperty")
local Const = require("Common.Const.Const")
local AddressDataConst = require("Const.AddressDataConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementUtils = require("Utils.PetManagementUtils")
local PetInfoTipPresenter = require("Guis.Utils.PetInfoTipPresenter")
local PetInfoCardDisplayUtils = require("Guis.Utils.PetInfoCardDisplayUtils")
local PetAttributeCalcUtils = require("Common.Utils.PetAttributeCalcUtils")
local PetTransmogUtils = require("GameApp.PetTransmog.PetTransmogUtils")
local PetManagementFreeCtrl = Class.LightClass("PetManagementFreeCtrl", UICtrl)

PetManagementFreeCtrl.PET_INFO_TIP_SCENE_POSITION_Y = 5000
PetManagementFreeCtrl.messages = {}

function PetManagementFreeCtrl:checkOpenExtra(info)
	if not info or not info.freePetIds or not next(info.freePetIds) then
		return false, pg.getGameString("CHOOSE_RELEASE_PUPPET")
	end

	return true
end

function PetManagementFreeCtrl:getManagedBlurEffect()
	return self.view and self.view.bgBlurUIBlurEffect
end

function PetManagementFreeCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
	self:initializeManagedBlur()

	local sceneKey = self.module .. ".petInfoTip"

	self.petInfoTipPresenter = PetInfoTipPresenter.new(sceneKey, nil, {
		uiSceneId = sceneKey,
		positionY = self.PET_INFO_TIP_SCENE_POSITION_Y
	})
	self.petInfoCardDisplayState = {}
end

function PetManagementFreeCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.btAaffirmUButton.luaClick()
		self:onConfirm()
	end

	local petLists = {
		self.view.petNormalUList,
		self.view.petNormal2UList,
		self.view.petRareUList,
		self.view.petRare2UList
	}

	for _, list in ipairs(petLists) do
		list.groupType = CS.XGUI.EGroupType.None
		list.enabledItemTooltip = false

		function list.luaRenderItem(button, index, data)
			self:onRenderPetHead(button, index, data)
		end

		function list.luaFinishRender()
			self:refreshConsoleBarState()
		end
	end

	local tagLists = {
		self.view.listTagUList,
		self.view.listTag2UList
	}

	for _, list in ipairs(tagLists) do
		list.groupType = CS.XGUI.EGroupType.None

		function list.luaRenderItem(button, index, data)
			self:onRenderTag(button, index, data)
		end
	end
end

function PetManagementFreeCtrl:onDestroy()
	self.petInfoTipPresenter:destroy()
	UICtrl.onDestroy(self)
end

function PetManagementFreeCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.freePetIds = info.freePetIds
	self.sourcePetInfos = info.petInfos
	self.ensureCb = info.ensureCb
	self.richTextColor = info.richTextColor

	self.view.consoleBarConsoleBar:SetState("openPetDetail", false)
	self:initView(self.freePetIds)
end

function PetManagementFreeCtrl:refreshConsoleBarState()
	if not self.view then
		return
	end

	local focused = pg.global.navMgr and pg.global.navMgr.CurrentFocusedUContent

	if pg.game.input:isUsingGamepad() and focused and self.activePetLists then
		for _, list in ipairs(self.activePetLists) do
			local buttons = list:GetAllButtons()

			for index = 0, buttons.Length - 1 do
				if buttons[index] == focused then
					self.view.consoleBarConsoleBar:SetState("openPetDetail", true)

					return
				end
			end
		end
	end

	self.view.consoleBarConsoleBar:SetState("openPetDetail", false)
end

function PetManagementFreeCtrl:onShow()
	return
end

function PetManagementFreeCtrl:onHide()
	return
end

function PetManagementFreeCtrl:initView(freePetIds)
	ClientTextUtils.setText(self.view.titleNormalUSDFText, pg.getGameString("PET_LABEL_NORMAL"))
	ClientTextUtils.setText(self.view.titleNormal2USDFText, pg.getGameString("PET_LABEL_NORMAL"))
	ClientTextUtils.setText(self.view.titleRareUSDFText, pg.getGameString("PET_LABEL_RARE"))
	ClientTextUtils.setText(self.view.titleRare2USDFText, pg.getGameString("PET_LABEL_RARE"))
	ClientTextUtils.setText(self.view.titleTagUSDFText, pg.getGameString("MANAGE_LABEL_RARE"))
	ClientTextUtils.setText(self.view.titleTag2USDFText, pg.getGameString("MANAGE_LABEL_RARE"))
	ClientTextUtils.setText(self.view.btnBackNameUText, pg.getGameString("COMMON_CANCEL"))
	ClientTextUtils.setText(self.view.btnConfirmNameUText, pg.getGameString("PET_FREE_CONFIRM"))

	self.normalPets, self.rarePets = self:getPetInfos(freePetIds or {})
	self.tagData = self:getTagData(self.rarePets)
	self.selectedTags = {}

	local normalNum = #self.normalPets
	local rareNum = #self.rarePets

	if normalNum > 0 and rareNum > 0 then
		self.activePetLists = {
			self.view.petNormalUList,
			self.view.petRareUList
		}
		self.activeTagList = self.view.listTagUList

		self.view.widget:TryChangePage("PetType", 0)
		self.view.petNormalUList:SetList(self.normalPets)
		self.view.petRareUList:SetList(self.rarePets)
		self.view.listTagUList:SetList(self.tagData)
	elseif normalNum > 0 then
		self.activePetLists = {
			self.view.petNormal2UList
		}
		self.activeTagList = nil

		self.view.widget:TryChangePage("PetType", 1)
		self.view.petNormal2UList:SetList(self.normalPets)
	elseif rareNum > 0 then
		self.activePetLists = {
			self.view.petRare2UList
		}
		self.activeTagList = self.view.listTag2UList

		self.view.widget:TryChangePage("PetType", 2)
		self.view.petRare2UList:SetList(self.rarePets)
		self.view.listTag2UList:SetList(self.tagData)
	end

	self:refreshSelectionInfo()
end

function PetManagementFreeCtrl:onRenderPetHead(button, index, data)
	button.enabledTooltip = false
	button.draggable = false

	LuaUIUtils.renderPetHead(button, data, {
		forceHideEvo = true
	})

	function button.luaNavFocused()
		self.view.consoleBarConsoleBar:SetState("openPetDetail", true)
	end

	function button.luaNavUnfocused()
		self.view.consoleBarConsoleBar:SetState("openPetDetail", false)
	end

	local objectReference = button:GetComponent("ObjectReference")
	local tagUContainer = objectReference:GetRefValue("tagUContainer")
	local txtBoxUImage = objectReference:GetRefValue("txtBoxUImage")

	txtBoxUImage:SetActive(false)

	local isCultivated = data.isCultivated == true

	tagUContainer:SetActive(isCultivated)

	if isCultivated and not tagUContainer:CheckURLLoaded() then
		tagUContainer:LoadDefaultUrlManually()
	end

	button:TryChangePage("Batch", data.isSelected and 1 or 3)

	local batchUButton = objectReference:GetRefValue("batchUButton")

	batchUButton:SetActive(true)

	batchUButton.enabledTooltip = false
	batchUButton.draggable = false

	function batchUButton.luaClick()
		self:setPetSelected(data, not data.isSelected)
		self:refreshSelectionView()
	end

	batchUButton:SetGamepadAction(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth, nil, function()
		batchUButton.luaClick()

		return false
	end)
	batchUButton:SetHotkeyActiveOnlyInCurrentItem(true)

	button.tooltipMode = CS.XGUI.ETooltipMode.None

	self.petInfoTipPresenter:bind(button, function()
		return self:getPetInfoTipData(data.id)
	end, {
		hierarchy = 1,
		popupDirection = CS.XGUI.EPopupDirection.AutoHorizontal,
		verticalAlignment = CS.XGUI.EVerticalAlignment.Top,
		renderPetInfo = function(popup, petInfo)
			self:renderPetInfoTip(popup, petInfo)
		end
	})

	function button.luaClick(isFromNavigation)
		if isFromNavigation then
			return
		end

		if button.isTooltipOpen then
			return
		end

		if NotNil(button.PopupTool.popupTemplate) then
			button:OpenTooltip()
		else
			button:OpenTooltipWithUrl(button.tooltipTemplateUrl)
		end
	end

	button:SetGamepadAction(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadLeftStickPress, nil, function()
		button.luaClick(false)

		return false
	end)
	button:SetHotkeyActiveOnlyInCurrentItem(true)
end

function PetManagementFreeCtrl:getPetInfoTipData(petId)
	local pet = PetManagementDataHelper.getPetInfoForDisplay(petId, self.sourcePetInfos and self.sourcePetInfos[petId])

	if not pet then
		return
	end

	local petInfo = PetManagementDataHelper.setUpPetInfo(pet)

	petInfo.calculatedAttributeMap, petInfo.extraSrcMap = PetAttributeCalcUtils.getAttributeMapByPetInfo(pg.me, pet)

	local scheme = PetTransmogUtils.getSelectedScheme(pet)

	if not scheme and LuaUIUtils.checkWarehousePetOperationLocked(petId, nil, false) then
		local transmogInfoMap = pg.me.petTransmogInfoMap

		scheme = transmogInfoMap and transmogInfoMap:getSelectedScheme(petId)
	end

	petInfo.selectTransmogScheme = scheme and scheme.getRawTable and scheme:getRawTable() or scheme

	return PetManagementDataHelper.createPetInfoTipData(petInfo)
end

function PetManagementFreeCtrl:renderPetInfoTip(popup, petInfo)
	PetInfoCardDisplayUtils.render(popup, petInfo, {
		state = self.petInfoCardDisplayState,
		ensurePetPreviewUIScene = function(callback)
			self.petInfoTipPresenter:ensurePetPreviewUIScene(callback)
		end
	})
end

function PetManagementFreeCtrl:onRenderTag(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local iconUImage = objectReference:GetRefValue("iconUImage")

	ClientTextUtils.setText(txtNameUSDFText, pg.getGameString(data.name))

	iconUImage.url = data.icon

	button:TryChangePage("Type", data.state)

	function button.luaClick()
		self:onTagClick(data)
		self:refreshSelectionView()
	end
end

function PetManagementFreeCtrl:refreshSelectionView()
	for _, list in ipairs(self.activePetLists) do
		local buttons = list:GetAllButtons()

		for index = 0, buttons.Length - 1 do
			local button = buttons[index]
			local data = button.dataFromUList

			if data then
				button:TryChangePage("Batch", data.isSelected and 1 or 3)
			end
		end
	end

	if self.activeTagList then
		local buttons = self.activeTagList:GetAllButtons()

		for index = 0, buttons.Length - 1 do
			local button = buttons[index]
			local data = button.dataFromUList

			if data then
				button:TryChangePage("Type", data.state)
			end
		end
	end

	self:refreshSelectionInfo()
end

function PetManagementFreeCtrl:getSelectedPetInfos()
	local selectedPets = {}

	for _, petInfos in ipairs({
		self.normalPets,
		self.rarePets
	}) do
		for _, petInfo in ipairs(petInfos) do
			if petInfo.isSelected then
				selectedPets[#selectedPets + 1] = petInfo
			end
		end
	end

	return selectedPets
end

function PetManagementFreeCtrl:refreshSelectionInfo()
	local selectedPets = self:getSelectedPetInfos()
	local selectedCount = #selectedPets

	ClientTextUtils.setText(self.view.txtFreeUSDFText, pg.getFormatText(pg.getGameString("BATCH_RELEASE_PUPPET_COUNT"), string.format("<color=#F67574>%d</color>", selectedCount)))

	self.view.btAaffirmUButton.interactable = selectedCount > 0
	self.tips = PetManagementUtils.renderReleaseTips(selectedPets, self.view.tipsUWidget, self.view.txtTipsUSDFText, self.richTextColor, true)
end

function PetManagementFreeCtrl:onConfirm()
	local selectedPets = self:getSelectedPetInfos()

	if #selectedPets == 0 then
		return
	end

	local selectedPetIds = {}

	for _, petInfo in ipairs(selectedPets) do
		selectedPetIds[petInfo.id] = self.freePetIds[petInfo.id]
	end

	if self.ensureCb then
		local tips = PetManagementUtils.renderReleaseTips(selectedPets, self.view.tipsUWidget, nil, nil, true)

		self.ensureCb(tips, selectedPetIds, function()
			self:dismiss()
		end)
	else
		self:dismiss()
	end
end

function PetManagementFreeCtrl:getPetInfos(petIds)
	local normal = {}
	local rare = {}

	for id in pairs(petIds or {}) do
		local pet = PetManagementDataHelper.getPetInfoForDisplay(id, self.sourcePetInfos and self.sourcePetInfos[id])
		local petInfo = PetManagementDataHelper.setUpPetInfo(pet)

		petInfo.isCultivated = PetManagementFreeCtrl.isCultivated(petInfo)

		if PetManagementFreeCtrl.isRare(petInfo) then
			petInfo.isSelected = false

			table.insert(rare, petInfo)
		else
			petInfo.isSelected = true

			table.insert(normal, petInfo)
		end
	end

	local sortKeys = {
		"labelScore",
		"hasRareFeature",
		"cp",
		"rating",
		"level",
		"reverseTime"
	}

	local function sortFunc(a, b)
		if a.isCultivated ~= b.isCultivated then
			return a.isCultivated
		end

		for _, key in ipairs(sortKeys) do
			if a[key] ~= b[key] then
				return a[key] > b[key]
			end
		end

		return a.id < b.id
	end

	table.sort(normal, sortFunc)
	table.sort(rare, sortFunc)

	return normal, rare
end

function PetManagementFreeCtrl:getTagData(rarePets)
	local tagInfos = {
		{
			key = "isRainbow",
			name = "PET_MANAGEMENT_RAINBOW",
			icon = AddressDataConst.FILTER_RARITY5
		},
		{
			key = "isShiny",
			name = "PET_MANAGEMENT_SHINY",
			icon = AddressDataConst.FILTER_RARITY2
		},
		{
			key = "isDark",
			name = "PET_MANAGEMENT_DARK",
			icon = AddressDataConst.FILTER_RARITY6
		},
		{
			key = "isBoss",
			name = "PET_MANAGEMENT_BOSS",
			icon = AddressDataConst.FILTER_RARITY3
		},
		{
			key = "shiningStar8",
			icon = "$UI_Img_Filter_Rarity_QualityGold_1.png",
			name = "PET_TALENT_DOUBLE_8"
		},
		{
			key = "shiningStar9",
			icon = "$UI_Img_Filter_Rarity_QualityGold_2.png",
			name = "PET_TALENT_DOUBLE_9"
		},
		{
			key = "shiningStar10",
			icon = "$UI_Img_Filter_Rarity_QualityGol_QualityGold.png",
			name = "PET_TALENT_DOUBLE_10"
		},
		{
			key = "isCultivated",
			icon = "$UI_Img_Filter_Rarity_Cultivate.png",
			name = "PET_MANAGEMENT_CULTIVATION"
		}
	}

	self.petTagsById = {}

	for _, tagInfo in ipairs(tagInfos) do
		tagInfo.petInfos = {}
		tagInfo.isSelected = false
	end

	for _, petInfo in ipairs(rarePets or {}) do
		local petTags = {}

		self.petTagsById[petInfo.id] = petTags

		local maxLevel = -1
		local secondMaxLevel = -1

		for propIndex = 1, Const.BASE_PROPERTY_CNT do
			local level = BaseProperty.getBaseIndividualLevel(petInfo.basePropertyList[propIndex])

			if maxLevel <= level then
				secondMaxLevel = maxLevel
				maxLevel = level
			elseif secondMaxLevel < level then
				secondMaxLevel = level
			end
		end

		local shiningStarIndex

		if secondMaxLevel >= 10 then
			shiningStarIndex = 7
		elseif secondMaxLevel >= 9 then
			shiningStarIndex = 6
		elseif secondMaxLevel >= 8 then
			shiningStarIndex = 5
		end

		for index, tagInfo in ipairs(tagInfos) do
			local matched

			if index >= 5 and index <= 7 then
				matched = index == shiningStarIndex
			else
				matched = petInfo[tagInfo.key]
			end

			if matched then
				tagInfo.petInfos[#tagInfo.petInfos + 1] = petInfo
				petTags[#petTags + 1] = tagInfo
			end
		end
	end

	local tags = {}

	for _, tagInfo in ipairs(tagInfos) do
		if #tagInfo.petInfos > 0 then
			self:updateTagState(tagInfo)

			tags[#tags + 1] = tagInfo
		end
	end

	return tags
end

function PetManagementFreeCtrl:updateTagState(tagData)
	local selectedCount = 0

	for _, petInfo in ipairs(tagData.petInfos) do
		if petInfo.isSelected then
			selectedCount = selectedCount + 1
		end
	end

	tagData.selectedCount = selectedCount

	if not tagData.isSelected then
		tagData.state = 0
	elseif selectedCount == #tagData.petInfos then
		tagData.state = 1
	else
		tagData.state = 2
	end
end

function PetManagementFreeCtrl:setPetSelected(petInfo, isSelected)
	petInfo.isSelected = isSelected

	for _, tagData in ipairs(self.petTagsById[petInfo.id] or {}) do
		if isSelected then
			tagData.isSelected = true
		end

		self:updateTagState(tagData)

		if not isSelected and tagData.selectedCount == 0 then
			tagData.isSelected = false
			tagData.state = 0
		end
	end
end

function PetManagementFreeCtrl:onTagClick(tagData)
	tagData.isSelected = not tagData.isSelected

	local selectedTags = self.selectedTags

	for _, petTag in ipairs(self.tagData) do
		selectedTags[petTag] = petTag.isSelected
	end

	for _, petInfo in ipairs(self.rarePets) do
		local isSelected = true

		for _, petTag in ipairs(self.petTagsById[petInfo.id]) do
			if not selectedTags[petTag] then
				isSelected = false

				break
			end
		end

		petInfo.isSelected = isSelected
	end

	for _, petTag in ipairs(self.tagData) do
		self:updateTagState(petTag)
	end
end

function PetManagementFreeCtrl.isRare(petInfo)
	return PetManagementDataHelper.isRarePetForRelease(petInfo)
end

function PetManagementFreeCtrl.isCultivated(petInfo)
	return PetManagementDataHelper.isPetCultivatedForRelease(petInfo)
end

return PetManagementFreeCtrl
