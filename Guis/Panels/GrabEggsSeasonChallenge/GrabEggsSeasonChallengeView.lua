-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\GrabEggsSeasonChallenge\\GrabEggsSeasonChallengeView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local GrabEggsSeasonChallengeView = Class.LightClass("GrabEggsSeasonChallengeView", UIView)

function GrabEggsSeasonChallengeView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootUComponent = self.widget
	self.challengeUList = objectReference:GetRefValue("challengeUList")
	self.btnReceiveUButton = objectReference:GetRefValue("btnReceiveUButton")
	self.goldCountUSDFText = objectReference:GetRefValue("goldCountUSDFText")
	self.silverCountUSDFText = objectReference:GetRefValue("silverCountUSDFText")
	self.copperCountUSDFText = objectReference:GetRefValue("copperCountUSDFText")
	self.goldPrizeUWidget = objectReference:GetRefValue("goldPrizeUWidget")
	self.silverPrizeUWidget = objectReference:GetRefValue("silverPrizeUWidget")
	self.copperPrizeUWidget = objectReference:GetRefValue("copperPrizeUWidget")
	self.challengeTitleUSDFText = objectReference:GetRefValue("challengeTitleUSDFText")
	self.seasonTagUWidget = objectReference:GetRefValue("seasonTagUWidget")
	self.countDownUCountDown = objectReference:GetRefValue("countDownUCountDown")
	self.goldFlyNodeUWidget = objectReference:GetRefValue("goldFlyNodeUWidget")
	self.silverFlyNodeUWidget = objectReference:GetRefValue("silverFlyNodeUWidget")
	self.copperFlyNodeUWidget = objectReference:GetRefValue("copperFlyNodeUWidget")
	self.careerTipsUSDFText = objectReference:GetRefValue("careerTipsUSDFText")
	self.adaptationUXAdaptionRect = objectReference:GetRefValue("adaptationUXAdaptionRect")
	self.vXGlowUWidget = objectReference:GetRefValue("vXGlowUWidget")
	self.vXParUWidget = objectReference:GetRefValue("vXParUWidget")
end

function GrabEggsSeasonChallengeView:registerObjects()
	return
end

function GrabEggsSeasonChallengeView:initView()
	return
end

return GrabEggsSeasonChallengeView
