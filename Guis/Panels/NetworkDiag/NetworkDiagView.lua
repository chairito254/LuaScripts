-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\NetworkDiag\\NetworkDiagView.lua

local UIView = require("Guis.UIView")
local Class = require("Core.Framework.Class")
local NetworkDiagView = Class.LightClass("NetworkDiagView", UIView)

function NetworkDiagView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.txtTitleText = objectReference:GetRefValue("txtTitleText")
	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.btnConfirmUButton = objectReference:GetRefValue("btnConfirmUButton")
	self.textText = objectReference:GetRefValue("textText")
	self.CloseBtn = objectReference:GetRefValue("CloseBtn")
	self.scrollRectRectTransform = objectReference:GetRefValue("scrollRectRectTransform")
end

return NetworkDiagView
