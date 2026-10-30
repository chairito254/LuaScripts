-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AccessoryPetBox\\Component\\AccessoryPetBoxGamePadComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local AccessoryPetBoxGamePadComponent = Class.LightClass("AccessoryPetBoxGamePadComponent", UIComponent)

function AccessoryPetBoxGamePadComponent:findObjects()
	return
end

function AccessoryPetBoxGamePadComponent:initView()
	return
end

function AccessoryPetBoxGamePadComponent:onDestroy()
	UIComponent.onDestroy(self)
end

return AccessoryPetBoxGamePadComponent
