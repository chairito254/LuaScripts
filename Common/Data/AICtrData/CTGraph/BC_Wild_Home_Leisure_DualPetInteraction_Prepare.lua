-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_Home_Leisure_DualPetInteraction_Prepare.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _A = CTHelper.DoAction
local _B = CTHelper.BeginBehaviourV2

function _M.executeEventTrigger(flow, eventName)
	if eventName == "Msg_Home_Leisure_DualPetInteraction_Prepare" then
		return _M._to_2_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 2 then
		return _M._to_11_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_2_0(flow)
	if not _B(flow, "PBT_Behav_Home_Leisure_DualPetInteraction_Prepare") then
		return
	end

	local _0 = flow:getContextValue("ActorId")

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tSpeed", 2)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 1)
	flow.__agent:addSubTreeLocalParam("tActorId", _0)
	flow:setContinue(2)

	return true
end

function _M._to_11_0(flow)
	flow:setActive()

	local _0 = flow:getContextValue("revision")

	_A(flow, "FinishHomeLandDualLeisureApproach", _0)

	return true
end

return _M
