-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenPerfumeResult\\EventHalloweenPerfumeResultView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local EventHalloweenPerfumeResultView = Class.LightClass("EventHalloweenPerfumeResultView", UIView)

function EventHalloweenPerfumeResultView:findObjects()
	UIView.findObjects(self)

	local objectReference = self.transform:GetComponent("ObjectReference")

	self.confirmUButton = objectReference:GetRefValue("confirmUButton")
	self.resultUSDFText = objectReference:GetRefValue("resultUSDFText")
	self.petDesUSDFText = objectReference:GetRefValue("petDesUSDFText")
	self.petUImage = objectReference:GetRefValue("petUImage")
end

return EventHalloweenPerfumeResultView
