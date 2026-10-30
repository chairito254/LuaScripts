-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenCollection\\EventHalloweenCollectionView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local EventHalloweenCollectionView = Class.LightClass("EventHalloweenCollectionView", UIView)

function EventHalloweenCollectionView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	self.curProgressUSDFText = objectReference:GetRefValue("curProgressUSDFText")
	self.rewardList = objectReference:GetRefValue("rewardList")
	self.progressTitleUSDFText = objectReference:GetRefValue("progressTitleUSDFText")
	self.tips1USDFText = objectReference:GetRefValue("tips1USDFText")
	self.tips2USDFText = objectReference:GetRefValue("tips2USDFText")

	for index = 1, 4 do
		self["room" .. index .. "UButton"] = objectReference:GetRefValue("room" .. index .. "UButton")
	end

	for index = 1, 5 do
		self["pet" .. index .. "UButton"] = objectReference:GetRefValue("pet" .. index .. "UButton")
	end
end

return EventHalloweenCollectionView
