-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetEvolvePetShow\\PetEvolvePetShowCtrl.lua

local MessageName = require("Const.MessageName")
local PetData = require("Data.pet_data")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local PetResearchContentData = require("Data.pet_research_content_data")
local PetConfigData = require("Data.pet_config_data")
local HotkeyConst = require("Const.HotkeyConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local PetEvolvePetShowCtrl = Class.LightClass("PetEvolvePetShowCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")
local Const = require("Common.Const.Const")

PetEvolvePetShowCtrl.messages = {}

function PetEvolvePetShowCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.petInfo = info.petInfo
	self.templateId = self.petInfo.templateId
end

function PetEvolvePetShowCtrl:addListener()
	function self.view.listUList.luaRenderItem(button, idx, data)
		if data.elementName then
			LuaUIUtils.setElementButtonNew(button, data.elementName, false, self.templateId)
		end
	end

	function self.view.listTagUList.luaRenderItem(button, idx, data)
		LuaUIUtils.renderPetTagList(button, data)
		LuaUIUtils.setPetTagLabelToolTip(button, LuaUIUtils.getPetTagInfo(self.templateId, self.petInfo.label, self.petInfo.bodySizeType, self.petInfo.shinyStyle), function()
			self.m_isShowTagToolTip = true
		end)
	end
end

function PetEvolvePetShowCtrl:onDestroy()
	self.view.petInfoUWidget:SetActiveFastest(false)

	self.resultViewShown = false

	local finishCallback = self.presentationFinishCallback

	self.presentationFinishCallback = nil

	local context = self.presentationContext

	if context then
		context.refresh = nil
		self.presentationContext = nil

		if not finishCallback and context.onViewDestroyed then
			context.onViewDestroyed()
		end
	end

	UICtrl.onDestroy(self)

	if finishCallback and (not context or context.active) then
		finishCallback(self.petInfo)
	end
end

function PetEvolvePetShowCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.presentationContext = info.presentationContext
	self.presentationFinishCallback = nil
	self._presentationCloseHandled = false
	self.resultViewShown = false
	self.resultAnimationPlayed = false

	self.view.petInfoUWidget:SetActiveFastest(self.presentationContext == nil)
	self:_initCloseBtnClick(info)

	local pData = PetData[self.templateId]
	local displayNumber = PetResearchUtils.getDisplayNumberByTemplateId(self.templateId)

	ClientTextUtils.setText(self.view.numberUText, displayNumber ~= "" and displayNumber or "001")

	local name = pg.getLocalizationText(pData.name)

	ClientTextUtils.setText(self.view.petNameUText, name)
	ClientTextUtils.setText(self.view.variantName1, name)
	ClientTextUtils.setText(self.view.variantName2, name)

	local petType = PetData[self.templateId].functionId

	self.view.battleTypeIcon.url = PetConfigData.petFunctionIcon[petType]

	local petFunctionText = pg.getLocalizationText(PetConfigData[string.format("petFunctionText%s", petType)])

	ClientTextUtils.setText(self.view.battleTypeUSDFText, petFunctionText)

	local t = LuaUIUtils.getTargetElementsInfos(pData.elementType)

	self.view.listUList:SetList(t)
	ClientTextUtils.setText(self.view.formName, LuaUIUtils.getPetFormName(self.templateId))
	PetResearchUtils.setEvolveQuality(self.view.btnPetQualityUButton, self.templateId)

	local researchData = PetResearchContentData[self.templateId]

	if researchData and researchData.desc then
		LuaUIUtils.setUIViewVisible(self.view.detailUText, true)
		ClientTextUtils.setText(self.view.detailUText, pg.getLocalizationText(researchData.desc))
	else
		LuaUIUtils.setUIViewVisible(self.view.detailUText, false)
	end

	local tagDatas = LuaUIUtils.getPetTagList(self.petInfo)

	self.view.listTagUList:SetList(tagDatas)
	self.view.widget:TryChangePage("isChange", self.petInfo.isVariant and 1 or 0)
	ClientTextUtils.setText(self.view.btnTipsUSDFText, pg.getGameString("CONSOLE_BAR_RETURN"))

	if self.presentationContext then
		local anim = self.view.uIPbManualEvolvePetShowNewAnimation

		anim.clip:SampleAnimation(anim.gameObject, 0)

		function self.presentationContext.refresh()
			self:refreshPresentation()
		end

		self:refreshPresentation()
	end

	local nameTs = self.view.petNameUText and self.view.petNameUText.transform
	local petInfoTs = nameTs and nameTs.parent and nameTs.parent.parent
	local petInfoUComp = petInfoTs and petInfoTs:GetComponent("UComponent")

	if NotNil(petInfoUComp) then
		local gender = self.petInfo and self.petInfo.gender or Const.GENDER_TYPE_NONE
		local pIndex = gender > Const.GENDER_TYPE_NONE and (gender == Const.GENDER_TYPE_MALE and 0 or 1) or 2

		petInfoUComp:TryChangePage("Gender", pIndex)
	end
end

function PetEvolvePetShowCtrl:refreshPresentation()
	local context = self.presentationContext

	if context.active and context.resultReady and self.resultViewShown and not self.resultAnimationPlayed then
		self.resultAnimationPlayed = true

		self.view.petInfoUWidget:SetActiveFastest(true)
		self.view.uIPbManualEvolvePetShowNewAnimation:Play()
	end

	local skip = context.active and context.canSkip
	local close = context.active and context.canClose
	local text = skip and pg.getGameString("CLICK_TO_SKIP") or pg.getGameString("Left_Click_Close")

	ClientTextUtils.setText(self.view.textCloseUText, text)

	if skip then
		self.view.buttonCloseUButton:SetActiveQuickly(true)
	elseif not close then
		self.view.buttonCloseUButton:SetActiveQuickly(false)
	end

	self:refreshConsoleBarState()
end

function PetEvolvePetShowCtrl:refreshConsoleBarState()
	local context = self.presentationContext
	local skip = false
	local close = true

	if context then
		skip = context.active and context.canSkip
		close = context.active and context.canClose
	end

	self.view.keyListConsoleBar:SetState("PET_EVOLVE_SHOW_SKIP", skip, true)
	self.view.keyListConsoleBar:SetState("PET_EVOLVE_SHOW_CLOSE", close, true)
end

function PetEvolvePetShowCtrl:checkCommonQuit()
	local context = self.presentationContext

	if context and context.active then
		return false
	end

	return UICtrl.checkCommonQuit(self)
end

function PetEvolvePetShowCtrl:consumePresentationInput()
	local context = self.presentationContext

	if not context then
		return false
	end

	if context.closing or not context.active then
		return true
	end

	if context.canSkip then
		context.skip()

		return true
	end

	if not context.canClose then
		return true
	end

	context.closing = true

	return false
end

function PetEvolvePetShowCtrl:closePresentation(info)
	if self._presentationCloseHandled then
		return
	end

	if self:consumePresentationInput() then
		return
	end

	self._presentationCloseHandled = true
	self.presentationFinishCallback = info and info.closeCallback or nil

	self:dismiss()
end

function PetEvolvePetShowCtrl:_initCloseBtnClick(info)
	function self.view.buttonCloseUButton.luaClick()
		if self.m_isShowTagToolTip then
			self.m_isShowTagToolTip = false

			return
		end

		self:closePresentation(info)
	end

	function self.view.keyBUButton.luaClick()
		self:closePresentation(info)
	end

	local closeBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.buttonCloseUButton.gameObject, "closeBind")

	closeBind.isVirtual = true
	closeBind.priority = -1
	closeBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.Cancel

	function closeBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			self:closePresentation(info)
		end

		return false
	end
end

function PetEvolvePetShowCtrl:onShow()
	self.resultViewShown = true

	if self.presentationContext then
		self:refreshPresentation()
	elseif not self.resultAnimationPlayed then
		self.resultAnimationPlayed = true

		self.view.uIPbManualEvolvePetShowNewAnimation:Play()
	end
end

function PetEvolvePetShowCtrl:onHide()
	self.resultViewShown = false
end

return PetEvolvePetShowCtrl
