-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonSelectUse\\Component\\LevelBreakthroughComponent.lua

local MessageName = require("Const.MessageName")
local LuaUIUtils = require("Utils.LuaUIUtils")
local UIConst = require("Const.UIConst")
local Class = require("Core.Framework.Class")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIComponent = require("Guis.Helper.UIComponent")
local LevelBreakthroughComponent = Class.LightClass("LevelBreakthroughComponent", UIComponent)
local PetManagementUtils = require("Utils.PetManagementUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local Utils = require("Common.Utils.Utils")

function LevelBreakthroughComponent:findObjects()
	self.rootUComp = self.view.root.gameObject:GetComponent("UComponent")
end

function LevelBreakthroughComponent:overrideAddListener()
	function self.view.btnConfirm.luaClick()
		self:onClickEnsure()
	end

	function self.view.btnCancel.luaClick()
		self.ctrl:closePanel()
	end

	function self.view.btnExit.luaClick()
		self.ctrl:closePanel()
	end

	function self.view.iPropList.luaRenderItem(button, index, data)
		self:renderItem(button, index, data)
	end
end

function LevelBreakthroughComponent:overrideOnShow()
	if not self.ctrl.iData.petId then
		return
	end

	self.replacedItemList = {}

	ClientTextUtils.setText(self.view.iTitle, pg.getGameString("LEVEL_BREAKTHROUGH"))

	self.petDetails = self.model:getPetDetails(self.ctrl.iData.petId)
	self.view.sliderNowUSlider.value = self.petDetails.expRate

	self.view.imgPetUImage:SetUrlWithCallback(LuaUIUtils.getPetIcon(self.petDetails.iconName, LuaUIUtils.PET_ICON, self.petDetails.label, self.petDetails.gender), function()
		return
	end)
	ClientTextUtils.setText(self.view.txtLvUSDFText, string.format("%s/%s", self.petDetails.level, self.petDetails.maxLevel))

	self.nextBreakLevel = self.model:getNextBreakthroughLevel(self.ctrl.iData.petId)

	ClientTextUtils.setText(self.view.breakThroughTipOld, self.petDetails.maxLevel)
	ClientTextUtils.setText(self.view.breakThroughTip, self.nextBreakLevel)
	self:refreshBreakthroughVisuals()
	self:refreshItemList()

	function self.view.btnPetUButton.luaRenderTooltip(button, toolTip)
		local curExp = self.petDetails.curExp
		local maxExp = self.petDetails.maxExp
		local detailStr = string.format(pg.getGameString("PET_EXP_DESCRIPTION_1"), curExp, maxExp)
		local PetManagementUtils = require("Utils.PetManagementUtils")
		local PetManagementDataHelper = require("Utils.PetManagementDataHelper")

		PetManagementUtils.customRefreshBuffInfoTooltip(toolTip, PetManagementDataHelper.BuffInfoToolTipType.Buff, {
			buffName = pg.getGameString("CURRENT_PET_EXP"),
			buffDesc = detailStr
		})
	end
end

function LevelBreakthroughComponent:initView()
	return
end

function LevelBreakthroughComponent:refreshBreakthroughVisuals()
	local view = self.view

	local function setActive(widget, active)
		if NotNil(widget) and NotNil(widget.gameObject) then
			widget.gameObject:SetActiveEx(active)
		end
	end

	setActive(view.imgArrowUWidget, true)
	setActive(view.imgArrow2UImage, true)
	setActive(view.breakThroughTip, true)
end

function LevelBreakthroughComponent:refreshItemList()
	local items

	self.success = nil
	self.replacedInfo = {}
	items, self.success, self.replacedInfo = self.model:getRequiredItems(self.petDetails.templateId, self.ctrl.iData.petId)

	self.view.iPropList:SetList(items)

	local petId = self.ctrl and self.ctrl.iData and self.ctrl.iData.petId
	local petInfo = petId and pg.me:getPetInfo(petId)
	local showResetTip = Utils.willBreakthroughForbidPetPropReset(petInfo)
	local tipStr = ""

	if showResetTip then
		tipStr = pg.getGameString("PET_BREAKTHROUGH_FORBID_PROP_RESET")
	end

	self.view.txtWarning.gameObject:SetActiveEx(false)
	self.view.btnConfirm:TryChangePage("button", 0)

	self.view.btnConfirm.interactable = true

	self.rootUComp:TryChangePage("Tips", 0)
	ClientTextUtils.setText(self.view.txtBreakResetTipUSDFText, tipStr)
	self.view.txtBreakResetTip.gameObject:SetActiveEx(tipStr ~= "")
end

function LevelBreakthroughComponent:renderItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("itemIconUImage")
	local txtNumUText = objectReference:GetRefValue("txtNumUText")

	txtNumUText.disabledLocalization = true

	local beReplaced = false
	local replacedNum = 0

	for _, v in pairs(self.replacedInfo) do
		if v.oriItemId == data.id then
			beReplaced = true
			replacedNum = v.oriNum

			break
		end
	end

	button:TryChangePage("Added", 0)

	if beReplaced then
		button:TryChangePage("Exchange", 1)
	else
		button:TryChangePage("Exchange", 0)
	end

	local btnSwitchUContainer = LuaUIUtils.safeGetRefValue(objectReference, "btnSwitchUContainer")

	if btnSwitchUContainer then
		btnSwitchUContainer:SetActive(beReplaced)

		if beReplaced and not btnSwitchUContainer:CheckURLLoaded() then
			btnSwitchUContainer:LoadDefaultUrlManually()
		end
	end

	function button.luaClick()
		local select = false

		if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
			pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)
		else
			pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
				id = data.id,
				num = data.ownNum,
				targetRect = button
			})

			select = true
		end

		local btnList = self.view.iPropList:GetAllButtons()

		for i = 0, btnList.Length - 1 do
			local v = btnList[i]

			v.isSelected = v == button and select
		end
	end

	function button.luaTooltipPopup(_, open)
		button.isSelected = open
	end

	button:TryChangePage("Quality", data.quality)

	iconUImage.url = data.icon

	if beReplaced then
		LuaUIUtils.renderConsumeText(txtNumUText, data.ownNum + replacedNum, data.requiredNum, UIConst.ITEM_STATE.EXCHANGE)
	else
		LuaUIUtils.renderConsumeText(txtNumUText, data.ownNum, data.requiredNum, UIConst.ITEM_STATE.FULL)
	end

	button:SetSelected(false)
end

function LevelBreakthroughComponent:onClickEnsure()
	if self.success then
		local function doBreakthrough()
			pg.me:serverMsg("RPC_CS_PetBreakthrough", self.ctrl.iData.petId, function(res)
				if res == 0 then
					pg.game.audio:playEvent("SFX_UI_PetRaise_Breakthrough")
					facade:SendMessageCommand(MessageName.ON_PET_BREAKTHROUGH_SUCCESS, {
						petId = self.ctrl.iData.petId
					})
					pg.global.ui:open(UIConst.UI_ID_LEVEL_BREAKTHROUGH_RESULT, {
						petId = self.ctrl.iData.petId,
						breakLevel = self.nextBreakLevel
					})
				end
			end)
		end

		if self.replacedInfo and next(self.replacedInfo) then
			pg.game.petManage:openUniversalItemConvertTip(self.replacedInfo, doBreakthrough)
		else
			doBreakthrough()
		end
	else
		pg.global.showBubbleMessageById(10217)
	end
end

function LevelBreakthroughComponent:destroy()
	return
end

return LevelBreakthroughComponent
