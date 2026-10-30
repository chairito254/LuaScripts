-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AreaActivityReward\\AreaActivityRewardView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local AreaActivityRewardView = Class.LightClass("AreaActivityRewardView", UIView)

function AreaActivityRewardView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.closeIconUButton = objectReference:GetRefValue("closeIconUButton"):GetComponent("UButton")
	self.titleText = objectReference:GetRefValue("titleText")
	self.rewardList = objectReference:GetRefValue("rewardList")
end

return AreaActivityRewardView
