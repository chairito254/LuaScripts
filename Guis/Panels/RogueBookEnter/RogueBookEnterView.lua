-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBookEnter\\RogueBookEnterView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local RogueBookEnterView = Class.LightClass("RogueBookEnterView", UIView)

function RogueBookEnterView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.btnBackUButton = objectReference:GetRefValue("btnBackUButton")
	self.tMPUSDFText = objectReference:GetRefValue("tMPUSDFText")
	self.cardEnter1UButton = objectReference:GetRefValue("cardEnter1UButton")
	self.cardEnter2UButton = objectReference:GetRefValue("cardEnter2UButton")
	self.cardEnter3UButton = objectReference:GetRefValue("cardEnter3UButton")
end

return RogueBookEnterView
