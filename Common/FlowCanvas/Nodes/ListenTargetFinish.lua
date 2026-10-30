-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\FlowCanvas\\Nodes\\ListenTargetFinish.lua

local Class = require("Core.Framework.Class")
local ListenBaseNode = require("Common.FlowCanvas.Nodes.ListenBaseNode")
local ServerEventConst = require("Const.ServerEventConst")
local ListenTargetFinish = Class.LiteClass("ListenTargetFinish", ListenBaseNode)

function ListenTargetFinish:ctor(nodeId, nodeData, graph)
	ListenTargetFinish.super.ctor(self, nodeId, nodeData, graph)
end

function ListenTargetFinish:registerPorts()
	ListenTargetFinish.super.registerPorts(self)

	self.valueInput_TargetId = self:addValueInput("TargetId")
	self.flowOut_Success = self:addFlowOutput("Success")
	self.flowOut_Fail = self:addFlowOutput("Fail")
end

function ListenTargetFinish:On_In_PortCalled(context, inputPortName)
	local targetId = self:getContextValue(context, self.valueInput_TargetId)

	if not targetId then
		self.logger:error("ListenTargetFinish:On_In_PortCalled targetId is nil nodeId=%s graphId=%s", self.nodeId, self.graph and self.graph.graphId)

		return
	end

	local space = context:getSpace()

	if not space then
		self.logger:error("ListenTargetFinish:On_In_PortCalled space is nil targetId=%s nodeId=%s graphId=%s", targetId, self.nodeId, self.graph and self.graph.graphId)

		return
	end

	self:removeListen(context)
	self:removeTimer(context)

	local eventName = ServerEventConst.FINISH_TARGET .. targetId

	local function listener(args)
		self:onTargetFinish(args, context)
	end

	self:addEventListen(context, eventName, listener)
end

function ListenTargetFinish:onTargetFinish(args, context)
	self:removeTimer(context)
	self:checkDoOnce(context)

	if args and args.result then
		self.flowOut_Success:call(context)
	else
		self.flowOut_Fail:call(context)
	end
end

return ListenTargetFinish
