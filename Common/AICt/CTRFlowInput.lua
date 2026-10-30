-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AICt\\CTRFlowInput.lua

local Class = require("Core.Framework.Class")
local Const = require("Common.FlowCanvas.Const")
local CTRFlowInput = Class.LightClass("CTRFlowInput")

function CTRFlowInput:ctor(name, nodeId, pointer)
	self.name = name
	self.nodeId = nodeId
	self.pointer = pointer
end

return CTRFlowInput
