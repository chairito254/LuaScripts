-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloween\\EventHalloweenView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local EventHalloweenView = Class.LightClass("EventHalloweenView", UIView)

function EventHalloweenView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	self.listCurrencyUList = objectReference:GetRefValue("listCurrencyUList")
	self.diaryTaskUButton = objectReference:GetRefValue("diaryTaskUButton")

	local diaryTaskObjectReference = self.diaryTaskUButton:GetComponent("ObjectReference")

	self.diaryTaskTitle1UBaseText = diaryTaskObjectReference:GetRefValue("title1UBaseText")
	self.diaryTaskTitle2UBaseText = diaryTaskObjectReference:GetRefValue("title2UBaseText")
	self.diaryTaskTitle3UBaseText = diaryTaskObjectReference:GetRefValue("title3UBaseText")
	self.journalUButton = objectReference:GetRefValue("journalUButton")

	local journalObjectReference = self.journalUButton:GetComponent("ObjectReference")

	self.journalTitle1UBaseText = journalObjectReference:GetRefValue("title1UBaseText")
	self.journalTitle2UBaseText = journalObjectReference:GetRefValue("title2UBaseText")
	self.journalTitle3UBaseText = journalObjectReference:GetRefValue("title3UBaseText")
	self.stageProgressUProgress = objectReference:GetRefValue("stageProgressUProgress")
	self.progressTipsUSDFText = objectReference:GetRefValue("progressTipsUSDFText")
	self.submitUButton = objectReference:GetRefValue("submitUButton")
	self.submitClickUParticle = objectReference:GetRefValue("submitClickUParticle")

	local submitObjectReference = self.submitUButton:GetComponent("ObjectReference")

	self.submitBtnUSDFText = submitObjectReference:GetRefValue("txtNameUText")
	self.perfumeBlendingUButton = objectReference:GetRefValue("perfumeBlendingUButton")
	self.taskDesUSDFText = objectReference:GetRefValue("taskDesUSDFText")
	self.perfumeBlendingUSDFText = objectReference:GetRefValue("perfumeBlendingUSDFText")
	self.candyNumUSDFText = objectReference:GetRefValue("candyNumUSDFText")
	self.petUCountDown = objectReference:GetRefValue("petUCountDown")
	self.roomDotUList = objectReference:GetRefValue("roomDotUList")
	self.roomSmokeUVfxLoader = objectReference:GetRefValue("roomSmokeUVfxLoader")
	self.doneTipsUSDFText = objectReference:GetRefValue("doneTipsUSDFText")
end

function EventHalloweenView:setViewVisible(visible)
	if visible then
		self.roomSmokeUVfxLoader:SetActive(false)
	end

	UIView.setViewVisible(self, visible)
end

function EventHalloweenView:playEnterAnimation()
	if NotNil(self.widget.anim) then
		self.widget.anim:Play("VX_Ani_Event_Halloween_Room_In")
	end
end

function EventHalloweenView:playSubmitClickParticle()
	if NotNil(self.submitClickUParticle) then
		self.submitClickUParticle:SetActive(true)
		self.submitClickUParticle:Play()
	end
end

function EventHalloweenView:refreshPetCountdown(countdownSeconds)
	local countdown = self.petUCountDown

	countdown:Stop()

	countdown.title.disabledLocalization = true

	ClientTextUtils.setText(countdown.title, "")
	countdown:SetActive(countdownSeconds > 0)

	if countdownSeconds > 0 then
		countdown:Play(countdownSeconds)
	end
end

return EventHalloweenView
