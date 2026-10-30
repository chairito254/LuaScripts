-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonWaiting\\CommonWaitingView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local CommonWaitingView = Class.LightClass("CommonWaitingView", UIView)

function CommonWaitingView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.textLoadingUBaseText = objectReference:GetRefValue("textLoadingUBaseText")
end

return CommonWaitingView
