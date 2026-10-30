-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingLimitedReward\\WorldRacingLimitedRewardView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local WorldRacingLimitedRewardView = Class.LightClass("WorldRacingLimitedRewardView", UIView)

function WorldRacingLimitedRewardView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUBaseText = objectReference:GetRefValue("titleUBaseText")
	self.tabListUList = objectReference:GetRefValue("tabListUList")
	self.taskListUList = objectReference:GetRefValue("taskListUList")

	local summaryObjectReference = objectReference:GetRefValue("summaryObjectReference")

	self.summaryUButton = summaryObjectReference:GetRefValue("chapterItem")
	self.summaryTitleUBaseText = summaryObjectReference:GetRefValue("txtTitleUBaseText")
	self.summaryProgressUBaseText = summaryObjectReference:GetRefValue("progressUBaseText")
	self.summaryProgressUImage = summaryObjectReference:GetRefValue("progressUImage")
	self.summaryRewardListUList = summaryObjectReference:GetRefValue("rewardListUList")
end

return WorldRacingLimitedRewardView
