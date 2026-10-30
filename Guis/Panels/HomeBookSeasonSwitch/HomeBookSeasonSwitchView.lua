-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeBookSeasonSwitch\\HomeBookSeasonSwitchView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local HomeBookSeasonSwitchView = Class.LightClass("HomeBookSeasonSwitchView", UIView)

function HomeBookSeasonSwitchView:findObjects()
	local objectReference = self.transform and self.transform:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	self.tMPUSDFText = objectReference:GetRefValue("tMPUSDFText")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.listUList = objectReference:GetRefValue("listUList")
end

function HomeBookSeasonSwitchView:registerObjects()
	return
end

function HomeBookSeasonSwitchView:initView()
	return
end

return HomeBookSeasonSwitchView
