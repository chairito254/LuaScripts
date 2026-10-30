-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10401_PER_Love_ToPlayer.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction

function _M.executeEventTrigger(flow, eventName)
	if eventName == "Event_PER_Love" then
		return _M._to_35_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 35 then
		return _M._to_56_0(flow)
	end

	if nodeId == 54 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	if nodeId == 54 then
		return _M._get_36_3(flow)
	end
end

function _M._to_35_0(flow)
	if flow.__isAdditive then
		return
	end

	local _0 = _M._get_53_2(flow)

	if _0 then
		flow:setActive()
		_C(35, "DoBehaviour", flow, "PBT_TurnToTargetAtYaw")

		local _1 = _M._get_47_2(flow)

		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tTgtId", _1)
		flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
		flow.__agent:addSubTreeLocalParam("tInstant", false)
		flow:setContinue(35)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_54_0(flow)
	if flow.__isAdditive then
		return
	end

	local _1 = _M.checkInterrupt(flow, 54)

	if not _1 then
		flow:setActive()
		_C(54, "DoBehaviour", flow, "PBT_CustomAnimation")
		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
		flow.__agent:addSubTreeLocalParam("tAnimationKey", "IdleSpecial")
		flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 6.5)
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "Proud")
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 4)
		flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
		flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
		flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", true)
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", true)
		flow:setContinue(54)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_55_0(flow)
	local _0 = _M._get_36_1(flow)

	if _0 then
		flow:setActive()
		_A(flow, "SendMessageToTrigger", 0, 1040101)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_56_0(flow)
	flow:addTimer(1, _M, "_to_55_0", flow)

	return _M._to_54_0(flow)
end

function _M._get_36_1(flow)
	local _0 = flow:getSubMacro("BCM_Common_CheckPER")
	local _1 = _M._get_47_2(flow)

	_0:setContextValue("tActorId", _1)

	local _2 = _0:getMacroValue("tIsPlayer")

	flow:clearSubMacro(_0)

	return _2
end

function _M._get_36_3(flow)
	local _0 = flow:getSubMacro("BCM_Common_CheckPER")
	local _1 = _M._get_47_2(flow)

	_0:setContextValue("tActorId", _1)

	local _2 = _0:getMacroValue("tIsPlayerInterrupt")

	flow:clearSubMacro(_0)

	return _2
end

function _M._get_47_2(flow)
	return flow:getContextValue("interactObjectActorId")
end

function _M._get_53_2(flow)
	local _2 = _M._get_47_2(flow)
	local _0 = _C(52, "IsInAnimState", flow, _2, "IdleSpecial")

	if not _0 then
		return false
	end

	local _1 = _M._get_36_1(flow)

	if not _1 then
		return false
	end

	return true
end

return _M
