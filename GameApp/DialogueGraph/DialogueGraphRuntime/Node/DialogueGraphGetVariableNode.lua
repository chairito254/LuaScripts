-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\DialogueGraph\\DialogueGraphRuntime\\Node\\DialogueGraphGetVariableNode.lua

local DialogueGraphFlowNode = require("GameApp.DialogueGraph.DialogueGraphRuntime.Node.DialogueGraphFlowNode")
local DialogueGraphGetVariableNode = DialogueGraphFlowNode.extend("DialogueGraphGetVariableNode")

function DialogueGraphGetVariableNode.getValue(ctx)
	local variableName = ctx:getField("variableName")

	return ctx:getBlackboard(variableName)
end

return DialogueGraphGetVariableNode
