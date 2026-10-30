-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\SpecialTrainSectionUnlocked\\SpecialTrainSectionUnlockedView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local SpecialTrainSectionUnlockedView = Class.LightClass("SpecialTrainSectionUnlockedView", UIView)

function SpecialTrainSectionUnlockedView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.textUSDFText = objectReference:GetRefValue("textUSDFText")
	self.blockName = objectReference:GetRefValue("blockName")
end

function SpecialTrainSectionUnlockedView:registerObjects()
	return
end

function SpecialTrainSectionUnlockedView:initView()
	return
end

return SpecialTrainSectionUnlockedView
