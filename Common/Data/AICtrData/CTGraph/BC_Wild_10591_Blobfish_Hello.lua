-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10591_Blobfish_Hello.lua

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
	if eventName == "Msg_10591_HoneyFish_Response" then
		return _M._to_2_0(flow)
	end
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 2 then
		return _M._to_4_0(flow)
	end

	if nodeId == 4 then
		return _M._to_6_0(flow)
	end

	if nodeId == 5 then
		return true
	end

	if nodeId == 6 then
		return _M._to_5_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_2_0(flow)
	if not _B(flow, "PBT_MoveToTargetEntity") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", 0)
	flow.__agent:addSubTreeLocalParam("tStopDist", 3)
	flow.__agent:addSubTreeLocalParam("tMaxTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tFaceTarget", true)
	flow.__agent:addSubTreeLocalParam("tSpeed", 1.5)
	flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 10)
	flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
	flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
	flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
	flow:setContinue(2)

	return true
end

function _M._to_4_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTgtId", 0)
	flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
	flow.__agent:addSubTreeLocalParam("tInstant", false)
	flow:setContinue(4)

	return true
end

function _M._to_5_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 5, 0, "Behav_Happy", 5, "Happy", 5, "", false, true, false)
end

function _M._to_6_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 6, 0, "Skill_Launch", 5, "Hello", 2.5, "", false, true, false)
end

return _M
