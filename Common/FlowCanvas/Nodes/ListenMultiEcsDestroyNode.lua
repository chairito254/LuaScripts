-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\FlowCanvas\\Nodes\\ListenMultiEcsDestroyNode.lua

local Class = require("Core.Framework.Class")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local ListenBaseNode = require("Common.FlowCanvas.Nodes.ListenBaseNode")
local SceneUtils = require("Common.Utils.SceneUtils")
local ServerEventConst = require("Const.ServerEventConst")
local ListenMultiEcsDestroyNode = Class.LiteClass("ListenMultiEcsDestroyNode", ListenBaseNode)

function ListenMultiEcsDestroyNode:ctor(nodeId, nodeData, graph)
	ListenMultiEcsDestroyNode.super.ctor(self, nodeId, nodeData, graph)
end

function ListenMultiEcsDestroyNode:registerPorts()
	ListenMultiEcsDestroyNode.super.registerPorts(self)

	self.flowOut_Out = self:addFlowOutput("Out")
	self.valueInput_StaticIds = self:addValueInput("StaticIds")
end

function ListenMultiEcsDestroyNode:getStaticIdKey(staticId)
	return self.uid .. "#" .. tostring(staticId)
end

function ListenMultiEcsDestroyNode:saveState(context)
	local space = context:getSpace()

	if not space then
		return
	end

	space:saveSandboxEventState(context.sandboxId)
end

function ListenMultiEcsDestroyNode:getSandboxEventState(context)
	local space = context:getSpace()

	if not space then
		return nil
	end

	local sandbox = space.sandboxes and space.sandboxes[context.sandboxId]

	return sandbox and sandbox.eventState or nil
end

function ListenMultiEcsDestroyNode:clearAndCallOut(context)
	self:removeTimer(context)
	self:removeListen(context)
	self.flowOut_Out:call(context)
end

function ListenMultiEcsDestroyNode:On_In_PortCalled(context, inputPortName)
	local space = context:getSpace()

	if not space then
		return
	end

	local eventState = self:getSandboxEventState(context)

	if eventState and eventState[self.uid] then
		self:clearAndCallOut(context)

		return
	end

	self:removeListen(context)

	local staticIds = self:getContextValue(context, self.valueInput_StaticIds)

	if type(staticIds) ~= "table" or not next(staticIds) then
		if LoggerManager.checkLogger(LoggerConst.WARN) then
			self.logger:warn("ListenMultiEcsDestroyNode staticIds is empty. nodeId:%s", self.nodeId)
		end

		return
	end

	local registered = {}
	local listenCount = 0
	local destroyedCount = 0
	local listeners = {}
	local destroyedStaticIds = {}

	for _, staticId in ipairs(staticIds) do
		if not registered[staticId] then
			registered[staticId] = true

			if eventState and eventState[self:getStaticIdKey(staticId)] then
				listenCount = listenCount + 1
				destroyedStaticIds[staticId] = true
				destroyedCount = destroyedCount + 1
			else
				local globalId = SceneUtils.getEnvIdByStaticId(staticId)

				if globalId then
					listenCount = listenCount + 1

					local listenStaticId = staticId
					local eventName = ServerEventConst.ECS_DESTROY_ENV_ENTITY .. "#" .. globalId

					listeners[#listeners + 1] = {
						eventName = eventName,
						staticId = listenStaticId
					}
				elseif LoggerManager.checkLogger(LoggerConst.WARN) then
					self.logger:warn("ListenMultiEcsDestroyNode find globalId fail. staticId:%s", staticId)
				end
			end
		end
	end

	if listenCount == 0 then
		return
	end

	if listenCount <= destroyedCount then
		if eventState then
			eventState[self.uid] = true

			self:saveState(context)
		end

		self:clearAndCallOut(context)

		return
	end

	for _, listenInfo in ipairs(listeners) do
		local listenStaticId = listenInfo.staticId

		local function listener(position)
			if destroyedStaticIds[listenStaticId] then
				return
			end

			destroyedStaticIds[listenStaticId] = true
			destroyedCount = destroyedCount + 1

			if eventState then
				eventState[self:getStaticIdKey(listenStaticId)] = true

				self:saveState(context)
			end

			if destroyedCount >= listenCount then
				if eventState then
					eventState[self.uid] = true

					self:saveState(context)
				end

				self:clearAndCallOut(context)
			end
		end

		self:addEventListen(context, listenInfo.eventName, listener)
	end
end

return ListenMultiEcsDestroyNode
