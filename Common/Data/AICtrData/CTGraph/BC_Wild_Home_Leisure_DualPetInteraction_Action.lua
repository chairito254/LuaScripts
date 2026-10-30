-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_Home_Leisure_DualPetInteraction_Action.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _A = CTHelper.DoAction
local _B = CTHelper.BeginBehaviourV2

function _M.executeEventTrigger(flow, eventName)
	if eventName == "Msg_Home_Leisure_DualPetInteraction_Action" then
		return _M._to_2_0(flow)
	end
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _M._get_5_1(flow)

	_A(flow, "HideEmojiOnTarget", 0, _0)

	return true
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
	if not _B(flow, "PBT_Behav_Home_Leisure_DualPetInteraction_Action") then
		return
	end

	local _0 = _M._get_5_1(flow)
	local _1 = flow:getContextValue("AnimationStartKey")
	local _2 = flow:getContextValue("AnimationLoopKey")
	local _3 = flow:getContextValue("AnimationEndKey")
	local _4 = flow:getContextValue("ActorId")
	local _5 = flow:getContextValue("AnimationTime")
	local _6 = flow:getContextValue("EmojiTime")

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tEmojiKey", _0)
	flow.__agent:addSubTreeLocalParam("tAnimationStartKey", _1)
	flow.__agent:addSubTreeLocalParam("tAnimationLoopKey", _2)
	flow.__agent:addSubTreeLocalParam("tAnimationEndKey", _3)
	flow.__agent:addSubTreeLocalParam("tActorId", _4)
	flow.__agent:addSubTreeLocalParam("tAnimationTime", _5)
	flow.__agent:addSubTreeLocalParam("tEmojiTime", _6)
	flow:setContinue(2)

	return true
end

function _M._to_11_0(flow)
	flow:setActive()

	local _0 = flow:getContextValue("revision")

	_A(flow, "FinishHomeLandLeisure", _0)

	return true
end

function _M._get_5_1(flow)
	return flow:getContextValue("EmojiKey")
end

return _M
