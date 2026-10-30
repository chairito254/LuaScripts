-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\DialogueGraph\\DialogueGraphRuntime\\Node\\DialogueGraphFlowOrNode.lua

local DialogueGraphFlowNode = require("GameApp.DialogueGraph.DialogueGraphRuntime.Node.DialogueGraphFlowNode")
local DialogueGraphFlowOrNode = DialogueGraphFlowNode.extend("DialogueGraphFlowOrNode")
local hadExecute = false

function DialogueGraphFlowOrNode.run(ctx)
	if ctx:getField("executeOnce", false) then
		if hadExecute then
			return
		end

		hadExecute = true
	end

	ctx:triggerFlow("Out")
end

function DialogueGraphFlowOrNode.onGraphFinished(ctx)
	hadExecute = false
end

return DialogueGraphFlowOrNode
