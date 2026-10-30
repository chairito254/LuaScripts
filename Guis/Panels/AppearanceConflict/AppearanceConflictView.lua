-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceConflict\\AppearanceConflictView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local AppearanceConflictView = Class.LightClass("AppearanceConflictView", UIView)

function AppearanceConflictView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.cancelBtn = objectReference:GetRefValue("cancelBtn")
	self.confirmBtn = objectReference:GetRefValue("confirmBtn")
	self.subTitle = objectReference:GetRefValue("subTitle")
	self.listCheckBox = objectReference:GetRefValue("listCheckBoxUList")
	self.leftList = objectReference:GetRefValue("leftList")
	self.rightList = objectReference:GetRefValue("rightList")
end

return AppearanceConflictView
