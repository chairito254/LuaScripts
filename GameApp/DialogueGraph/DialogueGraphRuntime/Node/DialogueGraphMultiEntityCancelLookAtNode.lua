-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\DialogueGraph\\DialogueGraphRuntime\\Node\\DialogueGraphMultiEntityCancelLookAtNode.lua

local DialogueGraphFlowNode = require("GameApp.DialogueGraph.DialogueGraphRuntime.Node.DialogueGraphFlowNode")
local NodeFunc = require("Const.DialogueGraphConst").NODE_FUNC_TYPE
local DialogueGraphMultiEntityCancelLookAtNode = DialogueGraphFlowNode.extend("DialogueGraphMultiEntityCancelLookAtNode")

function DialogueGraphMultiEntityCancelLookAtNode.run(ctx)
	local entitys = ctx:getInput("cancelEntitysVInput")
	local duration = ctx:getInput("lookAtDurationVInput", 0.3)

	ctx:callCmd(NodeFunc.ENTITY_CANCEL_MULTI_LOOK_AT, entitys, duration, function()
		if ctx:tryConsumeRunToken() then
			ctx:triggerFlow("Finish")
		end
	end)
	ctx:triggerFlow("Out")
end

return DialogueGraphMultiEntityCancelLookAtNode
