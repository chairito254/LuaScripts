-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\AppearanceCustomOne.lua

local class = require("Core.Framework.Class")
local CustomDict = require("Core.PropertySync.CustomDict")
local AppearanceCustomOne = class.LiteClass("AppearanceCustomOne", CustomDict)

function AppearanceCustomOne:roinit(name, value, owner, parent, fixed, aoiscopeForLazy)
	value.suitCustom = nil

	return AppearanceCustomOne.super.roinit(self, name, value, owner, parent, fixed, aoiscopeForLazy)
end

return AppearanceCustomOne
