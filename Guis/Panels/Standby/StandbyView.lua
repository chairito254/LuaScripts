-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Standby\\StandbyView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local StandbyView = Class.LightClass("StandbyView", UIView)

function StandbyView:findObjects()
	UIView.findObjects(self)

	self.objectReference = self.transform:GetComponent("ObjectReference")

	if not self.objectReference then
		return
	end

	self.txtTimeUSDFText = self.objectReference:GetRefValue("txtTimeUSDFText")
	self.txtDateUSDFText = self.objectReference:GetRefValue("txtDateUSDFText")
	self.batteryProgressUProgress = self.objectReference:GetRefValue("batteryProgressUProgress")
	self.btnWifiUButton = self.objectReference:GetRefValue("btnWifiUButton")
	self.backGroundCloseUButton = self.objectReference:GetRefValue("backGroundCloseUButton")
end

return StandbyView
