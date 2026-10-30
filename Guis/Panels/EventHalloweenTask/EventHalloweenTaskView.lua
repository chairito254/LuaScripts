-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenTask\\EventHalloweenTaskView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local EventHalloweenTaskView = Class.LightClass("EventHalloweenTaskView", UIView)

function EventHalloweenTaskView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.taskList = objectReference:GetRefValue("taskList")
	self.closeUButton = objectReference:GetRefValue("closeUButton")
	self.titleUSDFText = objectReference:GetRefValue("titleUSDFText")
end

return EventHalloweenTaskView
