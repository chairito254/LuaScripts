-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10651_RoundhappyLD.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
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
	if eventName == "Msg_10651_Round" then
		return _M._to_3_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 2 then
		return true
	end

	if nodeId == 4 then
		return true
	end

	if nodeId == 5 then
		return true
	end

	if nodeId == 6 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_2_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 2, 0, "Behav_Happy", 15, "Celebrate", 15, "", false, false, false)
end

function _M._to_3_0(flow)
	local _3 = _C(7, "RandomInteger", flow, 0, 100)
	local _0 = _3 <= 25

	if _0 then
		return _M._to_2_0(flow)
	end

	local _4 = _C(9, "RandomInteger", flow, 0, 100)
	local _1 = _4 <= 25

	if _1 then
		return _M._to_4_0(flow)
	end

	local _5 = _C(11, "RandomInteger", flow, 0, 100)
	local _2 = _5 <= 25

	if _2 then
		return _M._to_5_0(flow)
	end

	return _M._to_6_0(flow)
end

function _M._to_4_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 4, 0, "Behav_Love", 15, "Happy2", 15, "", false, false, false)
end

function _M._to_5_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 5, 0, "Behav_Happy", 15, "Cheer", 15, "", false, false, false)
end

function _M._to_6_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 6, 0, "Behav_Love", 15, "Happy", 15, "", false, false, false)
end

return _M
