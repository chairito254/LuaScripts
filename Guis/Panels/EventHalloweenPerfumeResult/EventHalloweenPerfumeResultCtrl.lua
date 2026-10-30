-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenPerfumeResult\\EventHalloweenPerfumeResultCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local EventHalloweenPerfumeResultCtrl = Class.LightClass("EventHalloweenPerfumeResultCtrl", UICtrl)

EventHalloweenPerfumeResultCtrl.messages = {
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"onActivityDayUpdated",
		true
	},
	[MessageName.EVENT_REFRESH_TAB_LIST] = {
		"onActivityDayUpdated",
		true
	}
}

function EventHalloweenPerfumeResultCtrl:addListener()
	function self.view.confirmUButton.luaClick()
		self:onConfirmClick()
	end
end

function EventHalloweenPerfumeResultCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.model:setOpenData(info)

	self._isSubmitting = false
	self._submissionSucceeded = false
	self.view.confirmUButton.interactable = true

	local viewData = self.model:getViewData()

	self.view.petUImage.url = viewData.petIconUrl

	ClientTextUtils.setText(self.view.resultUSDFText, viewData.resultText)
	ClientTextUtils.setText(self.view.petDesUSDFText, viewData.petDescriptionText)
	pg.game.audio:playEvent("SFX_Halloween_Blend")
end

function EventHalloweenPerfumeResultCtrl:onConfirmClick()
	if self:checkUIClosing() then
		return
	end

	if not self.model:isActivityOpen() then
		self:close()

		return
	end

	if self._isSubmitting or self._submissionSucceeded then
		return
	end

	local petId, materialIds = self.model:getSubmissionData()

	self._isSubmitting = true
	self.view.confirmUButton.interactable = false

	if not self:requestBlendPerfume(petId, materialIds) then
		self._isSubmitting = false
		self.view.confirmUButton.interactable = true
	end
end

function EventHalloweenPerfumeResultCtrl:close()
	if self:checkUIClosing() then
		return
	end

	if self.model:isActivityOpen() and not self._submissionSucceeded then
		self:onConfirmClick()

		return
	end

	UICtrl.close(self)
end

function EventHalloweenPerfumeResultCtrl:onActivityDayUpdated()
	if not self.model:isActivityOpen() then
		self:close()
	end
end

function EventHalloweenPerfumeResultCtrl:onActivityDataChanged(messageBody)
	if self:checkUIClosing() then
		return
	end

	if not self.model:isActivityOpen() then
		self:close()

		return
	end

	local isCurrentSubmission = self._isSubmitting and messageBody and messageBody.isHalloweenBlendPetResult and self.model:isSubmissionPet(messageBody.petId)

	if not isCurrentSubmission then
		return
	end

	self._isSubmitting = false

	if not messageBody.success then
		self.view.confirmUButton.interactable = true

		return
	end

	self._submissionSucceeded = true

	self:dismiss()
	pg.global.ui:closePanel(UIConst.UI_ID_EVENT_HALLLOWEEN_PERFUME_BLENDING)
end

function EventHalloweenPerfumeResultCtrl:requestBlendPerfume(petId, materialIds)
	if not petId or not materialIds then
		return false
	end

	return pg.me:reqHalloweenBlendPet(self.model:getEventId(), petId, materialIds)
end

return EventHalloweenPerfumeResultCtrl
