-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetIvUpDialog\\PetIvUpDialogView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local PetIvUpDialogView = Class.LightClass("PetIvUpDialogView", UIView)

function PetIvUpDialogView:onCreate(info)
	UIView.onCreate(self, info)
end

return PetIvUpDialogView
