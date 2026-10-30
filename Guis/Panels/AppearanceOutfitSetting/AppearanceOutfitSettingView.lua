-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceOutfitSetting\\AppearanceOutfitSettingView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local AppearanceOutfitSettingView = Class.LightClass("AppearanceOutfitSettingView", UIView)

function AppearanceOutfitSettingView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.textUSDFText = objectReference:GetRefValue("textUSDFText")
	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.btnClosePanalUButton = objectReference:GetRefValue("btnClosePanalUButton")
	self.txtDescriptionUSDFText = objectReference:GetRefValue("txtDescriptionUSDFText")
	self.listUList = objectReference:GetRefValue("listUList")
end

function AppearanceOutfitSettingView:registerObjects()
	return
end

function AppearanceOutfitSettingView:initView()
	return
end

return AppearanceOutfitSettingView
