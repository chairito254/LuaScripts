-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\FlowCanvas\\Nodes\\GetPlayerPositionNode.lua

local Class = require("Core.Framework.Class")
local FlowNode = require("Common.FlowCanvas.Nodes.FlowNode")
local Utils = require("Common.Utils.Utils")
local GetPlayerPositionNode = Class.LiteClass("GetPlayerPositionNode", FlowNode)

function GetPlayerPositionNode:ctor(nodeId, nodeData, graph)
	GetPlayerPositionNode.super.ctor(self, nodeId, nodeData, graph)
end

function GetPlayerPositionNode:registerPorts()
	self.valueInput_ActorId = self:addValueInput("ActorId")

	self:addValueOutput("Position", function(context)
		return self:Get_Value_Position(context)
	end)
end

function GetPlayerPositionNode:Get_Value_Position(context)
	local actorId = self:getContextValue(context, self.valueInput_ActorId)
	local player = actorId and pg.getEntityByActorId(actorId)

	if not player or not Utils.isPlayer(player) or not player.getPosition then
		return {
			y = 0,
			x = 0,
			z = 0
		}
	end

	return player:getPosition() or {
		y = 0,
		x = 0,
		z = 0
	}
end

return GetPlayerPositionNode
