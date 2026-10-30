-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Components\\AI\\AIPauseState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AIPauseState = Class.LiteClass("AIPauseState", State)

function AIPauseState:onEnter(controller)
	local attachEntity = controller:getAttachEntity()

	attachEntity:pauseAIAgent()
end

return AIPauseState
