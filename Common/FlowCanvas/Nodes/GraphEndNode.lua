-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\FlowCanvas\\Nodes\\GraphEndNode.lua

local Class = require("Core.Framework.Class")
local FlowNode = require("Common.FlowCanvas.Nodes.FlowNode")
local IS_GAME = pg.component == "game"
local GraphEndNode = Class.LiteClass("GraphEndNode", FlowNode)

function GraphEndNode:ctor(nodeId, nodeData, graph)
	GraphEndNode.super.ctor(self, nodeId, nodeData, graph)
end

function GraphEndNode:registerPorts()
	self:addFlowInput("In", function(context, inputPortName)
		self:On_In_PortCalled(context, inputPortName)
	end)

	self.valueInput_Result = self:addValueInput("Success")
	self.flowOut_Out = self:addFlowOutput("Out")
end

function GraphEndNode:On_In_PortCalled(context, inputPortName)
	local space = context:getSpace()

	if not space then
		return
	end

	local timerKey = context.graphTimerKey
	local timer = context:getTimer(timerKey)

	if timer then
		context:removeContextTimer(timerKey, self.nodeId)
	end

	local inputResult = self:getContextValue(context, self.valueInput_Result) or false

	if IS_GAME and not context:getContextValue("graphEndReached") then
		context:setContextValue("graphEndReached", true)
		self.logger:info("@node GraphEndNode/On_In_PortCalled graph end spaceId=%s graphId=%s result=%d", context.spaceId, context.graphId, inputResult and 1 or 0)
	end

	self.flowOut_Out:call(context)
	context.sandbox:onGraphEnd(inputResult)
end

return GraphEndNode
