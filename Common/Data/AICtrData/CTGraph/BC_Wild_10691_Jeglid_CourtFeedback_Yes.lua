-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_CourtFeedback_Yes.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10691_Jeglid_ReplyCourt_Yes" then
		return _M._to_9_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 1 then
		return _M._to_6_0(flow)
	end

	if nodeId == 9 then
		return _M._to_1_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_1_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tAnimationKey", "Behav_Happy")
	flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "Love2")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
	flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
	flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", false)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", false)
	flow:setContinue(1)

	return true
end

function _M._to_6_0(flow)
	flow:setActive()

	local _0 = _M._get_5_1(flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_End", _1)
	flow:setActive()

	local _2 = _C(4, "GetSelfId", flow)
	local _3 = flow:getMessageContext()
	local _4 = _M._get_5_1(flow)

	_3.ActorID = _4
	_3.sourceActorId = flow.__actorId

	flow:sendMessage(_2, "Msg_10691_Jeglid_FollowLover", _3)

	return true
end

function _M._to_9_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_5_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTgtId", _0)
	flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
	flow.__agent:addSubTreeLocalParam("tInstant", false)
	flow:setContinue(9)

	return true
end

function _M._get_5_1(flow)
	return flow:getContextValue("sourceActorId")
end

return _M
