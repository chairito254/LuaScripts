-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RankBase\\Component\\Display\\RankBasePetDisplay.lua

local PetData = require("Data.pet_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local PetInfoCardDisplayUtils = require("Guis.Utils.PetInfoCardDisplayUtils")
local RankBasePetDisplay = {}
local PET_INFO_TOOLTIP_RES_ID = "$UI_Pop_PetInfo_Tips.prefab"
local PET_BUTTON_STATES = setmetatable({}, {
	__mode = "k"
})

local function getPetButtonState(button)
	local state = PET_BUTTON_STATES[button]

	if state == nil then
		state = {}
		PET_BUTTON_STATES[button] = state
	end

	return state
end

function RankBasePetDisplay.renderPetInfo(objectReference, _, petInfo, petInfoTipPresenter, petInfoQuery)
	local txtPlayerNameUSDFText = objectReference:GetRefValue("txtPlayerNameUSDFText")
	local petHeadUButton = objectReference:GetRefValue("petHeadUButton")
	local petHeadObjectReference = petHeadUButton:GetComponent("ObjectReference")
	local petIconUImage = petHeadObjectReference:GetRefValue("icon")
	local petData = petInfo and PetData[petInfo.templateId]

	RankBasePetDisplay.resetPetButton(petHeadUButton)

	if not petData then
		petIconUImage.url = ""

		ClientTextUtils.setText(txtPlayerNameUSDFText, "")

		return false
	end

	LuaUIUtils.renderPetItemSimple(petHeadUButton, {
		petId = petInfo.templateId,
		label = petInfo.label
	})
	ClientTextUtils.setText(txtPlayerNameUSDFText, RankBasePetDisplay.getPetName(petInfo))
	RankBasePetDisplay.bindPetInfoTip(petHeadUButton, petInfo, petInfoTipPresenter, petInfoQuery, 1)

	return true
end

function RankBasePetDisplay.bindPetInfoTip(button, petInfo, petInfoTipPresenter, petInfoQuery, petIndex)
	RankBasePetDisplay.configurePetInfoTip(button, petInfo, petInfoTipPresenter, petInfoQuery, petIndex)

	function button.luaClick()
		RankBasePetDisplay.openPetInfoTip(button)
	end
end

function RankBasePetDisplay.configurePetInfoTip(button, petInfo, petInfoTipPresenter, petInfoQuery, petIndex)
	button.enabledTooltip = true
	button.PopupTool.includeSelf = true

	if petInfoQuery ~= nil then
		button.tooltipMode = 0
	end

	if button.tooltipTemplateUrl ~= PET_INFO_TOOLTIP_RES_ID then
		button.tooltipTemplateUrl = PET_INFO_TOOLTIP_RES_ID
	end

	button:SetPopupDirection(CS.XGUI.EPopupDirection.AutoHorizontal)
	button:SetVerticalAlignment(CS.XGUI.EVerticalAlignment.Bottom)

	local buttonState = getPetButtonState(button)

	buttonState.petInfo = petInfo
	buttonState.petInfoQuery = petInfoQuery
	buttonState.petIndex = petIndex

	function button.luaRenderTooltip(_, popup)
		local currentState = getPetButtonState(button)

		RankBasePetDisplay.renderPetInfoTooltip(popup, currentState.petInfo, petInfoTipPresenter)
	end

	function button.luaTooltipPopup(_, flag)
		petInfoTipPresenter:setPetPreviewTipsOpen(ToBool(flag))
	end
end

function RankBasePetDisplay.openPetTooltip(button)
	local popupTemplate = button.PopupTool.popupTemplate
	local isTemplateReady = button.tooltipTemplateUrl == PET_INFO_TOOLTIP_RES_ID and NotNil(popupTemplate)

	if isTemplateReady then
		button:OpenTooltip()

		return
	end

	button:OpenTooltipWithUrl(PET_INFO_TOOLTIP_RES_ID)
end

function RankBasePetDisplay.openPetInfoTip(button)
	if button.isTooltipOpen then
		return
	end

	local buttonState = getPetButtonState(button)

	if buttonState.petInfoQuery ~= nil then
		if buttonState.requesting then
			return
		end

		buttonState.requesting = true

		local petIndex = buttonState.petIndex

		local function onPetInfoQueried(extraPetInfo)
			buttonState.requesting = false

			local isCurrentButton = PET_BUTTON_STATES[button] == buttonState
			local hasCurrentPetInfo = extraPetInfo ~= nil and buttonState.petIndex == petIndex

			if not isCurrentButton or not hasCurrentPetInfo then
				return
			end

			buttonState.petInfo = extraPetInfo

			RankBasePetDisplay.openPetTooltip(button)
		end

		buttonState.petInfoQuery(buttonState.petIndex, onPetInfoQueried)

		return
	end

	RankBasePetDisplay.openPetTooltip(button)
end

function RankBasePetDisplay.renderPetInfoTooltip(popup, petInfo, petInfoTipPresenter)
	local petInfoData = PetManagementDataHelper.createPetInfoTipData(petInfo)

	petInfoTipPresenter.petInfoCardDisplayState = petInfoTipPresenter.petInfoCardDisplayState or {}

	local function ensurePetPreviewUIScene(callback)
		petInfoTipPresenter:ensurePetPreviewUIScene(callback)
	end

	local function onInfoPanelRendered(infoComp)
		local objectReference = infoComp.transform:GetComponent("ObjectReference")

		RankBasePetDisplay.refreshPetInfoTextVisibility(objectReference, petInfo)
	end

	PetInfoCardDisplayUtils.render(popup, petInfoData, {
		visibleTabList = PetInfoCardDisplayUtils.ALL_TAB_LIST,
		state = petInfoTipPresenter.petInfoCardDisplayState,
		ensurePetPreviewUIScene = ensurePetPreviewUIScene,
		onInfoPanelRendered = onInfoPanelRendered
	})
end

function RankBasePetDisplay.refreshPetInfoTextVisibility(objectReference, petInfo)
	local beenText = objectReference:GetRefValue("beenText")
	local infoPetNameExtra = objectReference:GetRefValue("infoPetNameExtra")
	local textUSDFText = objectReference:GetRefValue("textUSDFText")

	beenText:SetActive(petInfo.time ~= nil and petInfo.time > 0)

	if infoPetNameExtra then
		infoPetNameExtra:SetActive(petInfo.name ~= nil and petInfo.name ~= "")
	end

	textUSDFText:SetActive(petInfo.bookNum ~= nil and petInfo.bookNum > 0)
end

function RankBasePetDisplay.resetPetButton(button)
	button.luaClick = nil
	button.luaRenderTooltip = nil
	button.luaTooltipPopup = nil
	button.enabledTooltip = false
	button.draggable = false
	PET_BUTTON_STATES[button] = nil
end

function RankBasePetDisplay.getPetName(petInfo)
	if petInfo.name ~= nil and petInfo.name ~= "" then
		return petInfo.name
	end

	return LuaUIUtils.getPetNameByPetInfo(petInfo)
end

function RankBasePetDisplay.renderPetMember(button, _, memberData, petInfoTipPresenter)
	RankBasePetDisplay.resetPetButton(button)

	local petInfo = memberData.petInfo

	RankBasePetDisplay.renderPetIcon(button, petInfo)
	RankBasePetDisplay.bindPetInfoTip(button, petInfo, petInfoTipPresenter.petInfoTipPresenter, petInfoTipPresenter.petInfoQuery, memberData.petIndex)
end

function RankBasePetDisplay.renderPetIcon(button, petInfo)
	local itemObjectReference = button:GetComponent("ObjectReference")
	local iconUImage = itemObjectReference:GetRefValue("icon")
	local petData = PetData[petInfo.templateId]

	if not petData then
		iconUImage.url = ""

		return
	end

	iconUImage.url = LuaUIUtils.getPetIcon(petData.iconName, LuaUIUtils.PET_ICON, petInfo.label)
end

return RankBasePetDisplay
