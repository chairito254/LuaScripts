-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_ReplyCourt.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

local function _doBehaviourTail_0(flow, nodeId, value0, value1, value2)
	local agent = flow.__agent

	agent:clearSubTreeLocalParams()
	agent:addSubTreeLocalParam("tTgtId", value0)
	agent:addSubTreeLocalParam("tTargetAtYawDegree", value1)
	agent:addSubTreeLocalParam("tInstant", value2)
	flow:setContinue(nodeId)

	return true
end

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10691_Jeglid_CourtEnd" then
		return _M._to_1_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 5 then
		return true
	end

	if nodeId == 7 then
		return true
	end

	if nodeId == 13 then
		return _M._to_5_0(flow)
	end

	if nodeId == 14 then
		return _M._to_7_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_1_0(flow)
	local _1 = _C(2, "RandomInteger", flow, 1, 10)
	local _0 = _1 > 5

	if _0 then
		return _M._to_9_0(flow)
	end

	return _M._to_11_0(flow)
end

function _M._to_5_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tAnimationKey", "Behav_Happy")
	flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "Shy")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
	flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
	flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", false)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", false)
	flow:setContinue(5)

	return true
end

function _M._to_7_0(flow)
	if not _B(flow, "PBT_CustomLoopAnimation") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "Think")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tAnimationStartKey", "Behav_DoubtStart")
	flow.__agent:addSubTreeLocalParam("tAnimationLoopKey", "Behav_DoubtLoop")
	flow.__agent:addSubTreeLocalParam("tAnimationEndKey", "Behav_DoubtEnd")
	flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
	flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
	flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", false)
	flow:setContinue(7)

	return true
end

function _M._to_8_0(flow)
	flow:setActive()

	local _0 = _M._get_12_1(flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_ReplyCourt_Yes", _1)

	return true
end

function _M._to_9_0(flow)
	flow:addTimer(2, _M, "_to_8_0", flow)

	return _M._to_13_0(flow)
end

function _M._to_10_0(flow)
	flow:setActive()

	local _0 = _M._get_12_1(flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_ReplyCourt_No", _1)

	return true
end

function _M._to_11_0(flow)
	flow:addTimer(2, _M, "_to_10_0", flow)

	return _M._to_14_0(flow)
end

function _M._to_13_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_12_1(flow)

	return _doBehaviourTail_0(flow, 13, _0, 0, false)
end

function _M._to_14_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_12_1(flow)

	return _doBehaviourTail_0(flow, 14, _0, 0, false)
end

function _M._get_12_1(flow)
	return flow:getContextValue("sourceActorId")
end

return _M
