-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\FlowCanvas\\Nodes\\ListenerEventNode.lua

local Class = require("Core.Framework.Class")
local ListenBaseNode = require("Common.FlowCanvas.Nodes.ListenBaseNode")
local AccessControl = require("Core.Framework.AccessControl")
local EventStateCheck = require("Common.FlowCanvas.EventStateCheck")
local ServerEventConst = require("Const.ServerEventConst")
local IS_GAME = pg.component == "game"
local ListenerEventNode = Class.LiteClass("ListenerEventNode", ListenBaseNode)

function ListenerEventNode:ctor(nodeId, nodeData, graph)
	ListenerEventNode.super.ctor(self, nodeId, nodeData, graph)
end

function ListenerEventNode:registerPorts()
	ListenerEventNode.super.registerPorts(self)

	self.flowOut_Out = self:addFlowOutput("Out")
	self.valueInput_EventName = self:addValueInput("EventName")
	self.eventParams = self.nodeData.eventParams or {}
end

function ListenerEventNode:On_In_PortCalled(context, inputPortName)
	local space = context:getSpace()

	if not space then
		return
	end

	local eventName = self:getContextValue(context, self.valueInput_EventName) or self.nodeData.EventName
	local player = space.ownerPlayer

	if player then
		local func = EventStateCheck[eventName]

		if func and func(player, self.eventParams) then
			self.flowOut_Out:call(context)
		end
	end

	local isSpawnerDeathListener = IS_GAME and eventName == ServerEventConst.ON_SPAWNER_DEATH

	local function listener(args)
		args = args or {}

		for k, v in pairs(self.eventParams) do
			local confValue = args[k]

			if confValue ~= v then
				return
			end
		end

		if isSpawnerDeathListener then
			self.logger:info("@node ListenerEventNode/On_In_PortCalled onSpawnerDeath listener match spawnerId=%s nodeId=%s graphId=%s spaceId=%s", args.spawnerId, self.nodeId, context.graphId, context.spaceId)
		end

		for k, v in pairs(args) do
			if self[k] then
				self:setContextValue(context, self[k], v)
			end
		end

		self:removeTimer(context)
		self:checkDoOnce(context)
		self.flowOut_Out:call(context)
	end

	self:addEventListen(context, eventName, listener)

	if isSpawnerDeathListener then
		self.logger:info("@node ListenerEventNode/On_In_PortCalled onSpawnerDeath listener ready spawnerId=%s nodeId=%s graphId=%s spaceId=%s", self.eventParams.spawnerId, self.nodeId, context.graphId, context.spaceId)
	end
end

return ListenerEventNode
