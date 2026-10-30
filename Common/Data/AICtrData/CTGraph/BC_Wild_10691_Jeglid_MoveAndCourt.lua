-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_MoveAndCourt.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _B = CTHelper.BeginBehaviourV2

local function _doBehaviourTail_0(flow, nodeId, value0, value1, value2, value3, value4, value5, value6, value7, value8)
	local agent = flow.__agent

	agent:clearSubTreeLocalParams()
	agent:addSubTreeLocalParam("tWaitTime", value0)
	agent:addSubTreeLocalParam("tAnimationKey", value1)
	agent:addSubTreeLocalParam("tAnimationTimeout", value2)
	agent:addSubTreeLocalParam("tEmojiBubbleKey", value3)
	agent:addSubTreeLocalParam("tEmojiBubbleTimeout", value4)
	agent:addSubTreeLocalParam("tTimelineTag", value5)
	agent:addSubTreeLocalParam("tNeedLoop", value6)
	agent:addSubTreeLocalParam("tAnimationPlayOnce", value7)
	agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", value8)
	flow:setContinue(nodeId)

	return true
end

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10691_Jeglid_Reply" then
		flow:setActive()

		local _0 = _M._get_7_1(flow)
		local _1 = flow:getMessageContext()

		_1.sourceActorId = flow.__actorId

		flow:sendMessage(_0, "Msg_10691_Jeglid_Wait", _1)

		return _M._to_2_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 2 then
		return _M._to_6_0(flow)
	end

	if nodeId == 3 then
		return true
	end

	if nodeId == 5 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_2_0(flow)
	if not _B(flow, "PBT_MoveToTargetEntity") then
		return
	end

	local _0 = _M._get_7_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tStopDist", 1)
	flow.__agent:addSubTreeLocalParam("tMaxTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tFaceTarget", true)
	flow.__agent:addSubTreeLocalParam("tSpeed", 2)
	flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 99999)
	flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
	flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
	flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
	flow:setContinue(2)

	return true
end

function _M._to_3_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 3, 0, "Behav_Love", 5.5, "Love", 5, "", false, false, false)
end

function _M._to_4_0(flow)
	flow:setActive()

	local _0 = _M._get_7_1(flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_CourtEnd", _1)

	return _M._to_5_0(flow)
end

function _M._to_5_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 5, 5, "Idle", 10, "", 5, "", false, false, false)
end

function _M._to_6_0(flow)
	flow:addTimer(4, _M, "_to_4_0", flow)

	return _M._to_3_0(flow)
end

function _M._get_7_1(flow)
	return flow:getContextValue("sourceActorId")
end

return _M
