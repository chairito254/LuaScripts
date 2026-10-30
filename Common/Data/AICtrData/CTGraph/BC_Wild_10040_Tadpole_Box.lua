-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10040_Tadpole_Box.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10040_Tadpole_Response" then
		return _M._to_5_0(flow)
	end
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _C(6, "GetSelfId", flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10040_Tadpole_End", _1)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 3 then
		return _M._to_4_0(flow)
	end

	if nodeId == 4 then
		return true
	end

	if nodeId == 5 then
		return _M._to_3_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_3_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_1_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTgtId", _0)
	flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
	flow.__agent:addSubTreeLocalParam("tInstant", false)
	flow:setContinue(3)

	return true
end

function _M._to_4_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tAnimationKey", "Attack01")
	flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
	flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
	flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", false)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", false)
	flow:setContinue(4)

	return true
end

function _M._to_5_0(flow)
	if not _B(flow, "PBT_MoveToTargetEntity") then
		return
	end

	local _0 = _M._get_1_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tStopDist", 1.5)
	flow.__agent:addSubTreeLocalParam("tMaxTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tFaceTarget", true)
	flow.__agent:addSubTreeLocalParam("tSpeed", 0)
	flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 99999)
	flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
	flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
	flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
	flow:setContinue(5)

	return true
end

function _M._get_1_2(flow)
	return flow:getContextValue("actid")
end

return _M
