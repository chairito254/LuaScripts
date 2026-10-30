-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10621_okbot.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _B = CTHelper.BeginBehaviourV2

function _M.executeTickLodTrigger(flow)
	return _M._to_1_0(flow)
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 1 then
		return _M._to_2_0(flow)
	end

	if nodeId == 2 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_1_0(flow)
	if not _B(flow, "PBT_RandomCustomAnimation_10651") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow:setContinue(1)

	return true
end

function _M._to_2_0(flow)
	if not _B(flow, "PBT_Wild_10501_Dialogue") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("firstDialogueId", 1039247)
	flow.__agent:addSubTreeLocalParam("lastDialogueId", 1039249)
	flow.__agent:addSubTreeLocalParam("tWaitTime", 4)
	flow:setContinue(2)

	return true
end

return _M
