-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\FlowCanvas\\ValueOutput.lua

local Class = require("Core.Framework.Class")
local ValueOutput = Class.LiteClass("ValueOutput")

function ValueOutput:ctor(name, getter)
	self.name = name
	self.getter = getter
	self.isClient = false
end

return ValueOutput
