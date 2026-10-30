-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenPerfumeBlending\\EventHalloweenPerfumeBlendingCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local EventHalloweenPerfumeBlendingCtrl = Class.LightClass("EventHalloweenPerfumeBlendingCtrl", UICtrl)

EventHalloweenPerfumeBlendingCtrl.SUBMIT_EFFECT_DURATION = 1.3
EventHalloweenPerfumeBlendingCtrl.messages = {
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.EVENT_REFRESH_TAB_LIST] = {
		"onActivityDataChanged",
		true
	}
}

function EventHalloweenPerfumeBlendingCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.materialOptionUList.luaRenderItem(button, index, data)
		self:renderMaterial(button, index, data)
	end

	function self.view.materialOptionUList.luaClick(button, data)
		self:onMaterialClick(data)
	end

	function self.view.conditionUList.luaRenderItem(button, index, data)
		self:renderCondition(button, index, data)
	end

	function self.view.currentFlavorUList.luaRenderItem(button, index, data)
		self:renderCurrentFlavor(button, index, data)
	end

	function self.view.submitUButton.luaClick()
		self:onSubmitClick()
	end
end

function EventHalloweenPerfumeBlendingCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.model:setOpenData(info)

	self._isSubmitEffectPlaying = false

	self:refreshView()
end

function EventHalloweenPerfumeBlendingCtrl:onActivityDataChanged()
	if self:checkUIClosing() then
		return
	end

	if not self.model:isActivityOpen() then
		self:close()

		return
	end

	self:refreshView()
end

function EventHalloweenPerfumeBlendingCtrl:refreshView()
	local viewData = self.model:getViewData()

	ClientTextUtils.setText(self.view.titleUSDFText, viewData.titleText)
	ClientTextUtils.setText(self.view.taskTitleUSDFText, viewData.taskTitleText)
	ClientTextUtils.setText(self.view.currTipsUSDFText, viewData.currentScentTitleText)
	ClientTextUtils.setText(self.view.submitBtnUSDFText, viewData.submitButtonText)

	self.view.currentPetUImage.url = viewData.currentPetIconUrl

	self.view.materialOptionUList:SetList(viewData.materialList)
	self:refreshSelectionState()
end

function EventHalloweenPerfumeBlendingCtrl:renderMaterial(button, index, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local materialUImage = objectReference:GetRefValue("materialUImage")
	local materialNameUSDFText = objectReference:GetRefValue("materialNameUSDFText")
	local additionUList = objectReference:GetRefValue("additionUList")

	materialUImage.url = data.materialIcon

	ClientTextUtils.setText(materialNameUSDFText, data.materialNameText)

	function additionUList.luaRenderItem(additionButton, additionIndex, additionData)
		self:renderMaterialAddition(additionButton, additionIndex, additionData)
	end

	additionUList:SetList(data.effectList)
	button:TryChangePage("State", self.model:isMaterialSelected(data.materialId) and 1 or 0)
end

function EventHalloweenPerfumeBlendingCtrl:renderMaterialAddition(button, index, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local numUSDFText = objectReference:GetRefValue("numUSDFText")
	local additionUImage = objectReference:GetRefValue("additionUImage")

	additionUImage.url = data.flavorIcon

	ClientTextUtils.setText(numUSDFText, data.valueText)
	button:TryChangePage("State", data.state)
end

function EventHalloweenPerfumeBlendingCtrl:renderCondition(button, index, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local numUSDFText = objectReference:GetRefValue("numUSDFText")

	ClientTextUtils.setText(txtNameUSDFText, data.nameText or "")
	ClientTextUtils.setText(numUSDFText, data.valueText or "")

	if data.iconState == 1 then
		iconUImage.url = data.flavorIcon
	end

	button:TryChangePage("State", data.state)
	button:TryChangePage("Icon", data.iconState)
end

function EventHalloweenPerfumeBlendingCtrl:refreshCurrentMaterials(materialList)
	for slotIndex = 1, self.model.MATERIAL_SELECT_COUNT do
		local component = self.view.currentMaterialUComponents[slotIndex]
		local iconUImage = self.view.currentMaterialIconUImages[slotIndex]
		local materialData = materialList[slotIndex]
		local hasMaterial = materialData and materialData.materialIcon ~= nil

		component:TryChangePage("Empty", hasMaterial and 0 or 1)

		if hasMaterial then
			iconUImage.url = materialData.materialIcon
		end
	end
end

function EventHalloweenPerfumeBlendingCtrl:renderCurrentFlavor(button, index, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local valueUSDFText = objectReference:GetRefValue("valueUSDFText")
	local changeValueUSDFText = objectReference:GetRefValue("changeValueUSDFText")
	local popUComponent = objectReference:GetRefValue("popUComponent")

	iconUImage.url = data.flavorIcon

	ClientTextUtils.setText(valueUSDFText, data.valueText)
	ClientTextUtils.setText(changeValueUSDFText, data.changeValueText)
	popUComponent:TryChangePage("State", data.changeValueState)
	button:TryChangePage("State", data.state)

	if data.popState == 1 then
		button:TryChangePage("Pop", 0, true, false, false)
	end

	button:TryChangePage("Pop", data.popState)
end

function EventHalloweenPerfumeBlendingCtrl:onMaterialClick(data)
	if not data then
		return
	end

	self.model:toggleMaterial(data.materialId)
	self.view.materialOptionUList:RefreshList()
	self:refreshSelectionState()
end

function EventHalloweenPerfumeBlendingCtrl:refreshSelectionState()
	local viewData = self.model:getSelectionViewData()

	ClientTextUtils.setText(self.view.materialNumUSDFText, viewData.materialCountText)
	self:refreshCurrentMaterials(viewData.currentMaterialList)
	self.view.currentFlavorUList:SetList(viewData.currentFlavorList)
	self.model:clearFlavorChangeValues()
	self.view.conditionUList:SetList(viewData.conditionList)

	self.view.submitUButton.interactable = viewData.canSubmit and not self._isSubmitEffectPlaying
end

function EventHalloweenPerfumeBlendingCtrl:onSubmitClick()
	if self:checkUIClosing() or not self.model:isActivityOpen() or self._isSubmitEffectPlaying or not self.model:checkBlendRequirements() then
		return
	end

	local submissionData = self.model:getSubmissionData()

	self._isSubmitEffectPlaying = true
	self.view.submitUButton.interactable = false

	if self.view.rootUComponent then
		self.view.rootUComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end

	self:startTimer(function()
		self._isSubmitEffectPlaying = false

		if self:checkUIClosing() or not self.model:isActivityOpen() then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_EVENT_HALLLOWEEN_PERFUME_RESULT, submissionData)
	end, self.SUBMIT_EFFECT_DURATION)
end

return EventHalloweenPerfumeBlendingCtrl
