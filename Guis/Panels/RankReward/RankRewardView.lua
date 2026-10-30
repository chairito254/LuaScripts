-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RankReward\\RankRewardView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local RankRewardView = Class.LightClass("RankRewardView", UIView)

function RankRewardView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	self.listTab3thUList = objectReference:GetRefValue("listTab3thUList")
	self.tabUWidget = objectReference:GetRefValue("tabUWidget")
	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.scrollRectUScrollRect = objectReference:GetRefValue("scrollRectUScrollRect")

	local scrollRectContent = self.scrollRectUScrollRect.content.transform
	local scrollRectObjectReference = scrollRectContent:GetComponent("ObjectReference")

	self.txtDetailsUSDFText = scrollRectObjectReference:GetRefValue("txtDetailsUSDFText")
	self.listUList = scrollRectObjectReference:GetRefValue("listUList")
	self.countDownUCountDown = scrollRectObjectReference:GetRefValue("countDownUCountDown")
end

return RankRewardView
