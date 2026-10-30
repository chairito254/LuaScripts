-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonLongPopup\\CommonLongPopupView.lua

local UIView = require("Guis.UIView")
local Class = require("Core.Framework.Class")
local CommonLongPopupView = Class.LightClass("CommonLongPopupView", UIView)

function CommonLongPopupView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.titleText = self.objectReference:GetRefValue("titleText")
	self.contextText = self.objectReference:GetRefValue("contextText")
	self.doubleRewardUContainer = self.objectReference:GetRefValue("doubleRewardUContainer")
	self.cancelBtn = self.objectReference:GetRefValue("cancelBtn")
	self.confirmBtn = self.objectReference:GetRefValue("confirmBtn")
	self.confirmHotKeyContent = self.confirmBtn.transform:GetComponent("ObjectReference"):GetRefValue("confirmHotKeyContent")
	self.cancelHotKeyContent = self.cancelBtn.transform:GetComponent("ObjectReference"):GetRefValue("cancelHotKeyContent")
end

return CommonLongPopupView
