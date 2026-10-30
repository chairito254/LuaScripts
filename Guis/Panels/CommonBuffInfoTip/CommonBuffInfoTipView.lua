-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonBuffInfoTip\\CommonBuffInfoTipView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local CommonBuffInfoTipView = Class.LightClass("CommonBuffInfoTipView", UIView)

function CommonBuffInfoTipView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.rootCmp = self.objectReference:GetRefValue("rootCmp")
	self.buffNameUText = self.objectReference:GetRefValue("buffNameUText")
	self.buffNumUText = self.objectReference:GetRefValue("buffNumUText")
	self.buffDetailUText = self.objectReference:GetRefValue("buffDetailUText")
	self.iconUImage = self.objectReference:GetRefValue("iconUImage")
	self.infoUWidget = self.objectReference:GetRefValue("infoUWidget")

	local infoObjectReference = self.infoUWidget.transform:GetComponent("ObjectReference")

	self.textNameUSDFText = infoObjectReference:GetRefValue("textNameUSDFText")
	self.timeUWidget = infoObjectReference:GetRefValue("timeUWidget")
	self.infoIconUImage = infoObjectReference:GetRefValue("iconUImage")
	self.countDownUCountDown = infoObjectReference:GetRefValue("countDownUCountDown")
	self.skillBuffUContainer = self.objectReference:GetRefValue("skillBuffUContainer")
	self.ecsBuffUContainer = self.objectReference:GetRefValue("ecsBuffUContainer")
end

function CommonBuffInfoTipView:registerObjects()
	return
end

function CommonBuffInfoTipView:initView()
	return
end

return CommonBuffInfoTipView
