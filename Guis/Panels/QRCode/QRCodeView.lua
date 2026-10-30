-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\QRCode\\QRCodeView.lua

local logger = require("Core.Log.LoggerManager").getLogger("QRCodeView")
local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local QRCodeView = Class.LightClass("QRCodeView", UIView)

function QRCodeView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.rootUComponent = self.transform:GetComponent("UComponent")
	self.btnCloseUButton = self.objectReference:GetRefValue("btnCloseUButton")
	self.codeUImage = self.objectReference:GetRefValue("codeUImage")
	self.text1UBaseText = self.objectReference:GetRefValue("text1UBaseText")
	self.codeURawImage = self.objectReference:GetRefValue("codeURawImage")
end

function QRCodeView:registerObjects()
	return
end

function QRCodeView:initView()
	return
end

return QRCodeView
