-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10024_PER_Love_ToPlayer.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction
local _B = CTHelper.BeginBehaviourV2

function _M.executeEventTrigger(flow, eventName)
	if eventName == "Event_PER_Love" then
		return _M._to_35_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 35 then
		return _M._to_49_0(flow)
	end

	if nodeId == 44 then
		return _M._to_45_0(flow)
	end

	if nodeId == 45 then
		return true
	end

	if nodeId == 48 then
		return _M._to_53_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	if nodeId == 48 then
		return _M._get_36_3(flow)
	end
end

function _M._to_35_0(flow)
	if flow.__isAdditive then
		return
	end

	local _0 = _M._get_36_1(flow)

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

function _M._to_44_0(flow)
	if not _B(flow, "PBT_CastSkill") then
		return
	end

	local _0 = _M._get_47_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tSkillId", 10240320)
	flow.__agent:addSubTreeLocalParam("tSkillTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tRaycastOpen", false)
	flow.__agent:addSubTreeLocalParam("tCastAbilitySource", 0)
	flow:setContinue(44)

	return true
end

function _M._to_45_0(flow)
	if not _B(flow, "PBT_ReadyToFight") then
		return
	end

	local _0 = _M._get_47_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tSensorTgtId", _0)
	flow.__agent:addSubTreeLocalParam("tRandomWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tShowExclamation", false)
	flow:setContinue(45)

	return true
end

function _M._to_48_0(flow)
	if flow.__isAdditive then
		return
	end

	local _1 = _M.checkInterrupt(flow, 48)

	if not _1 then
		flow:setActive()
		_C(48, "DoBehaviour", flow, "PBT_MoveToTargetEntity")

		local _1 = _M._get_47_2(flow)

		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tTargetActorId", _1)
		flow.__agent:addSubTreeLocalParam("tStopDist", 2)
		flow.__agent:addSubTreeLocalParam("tMaxTimeout", 3)
		flow.__agent:addSubTreeLocalParam("tFaceTarget", true)
		flow.__agent:addSubTreeLocalParam("tSpeed", 0)
		flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 99999)
		flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
		flow.__agent:addSubTreeLocalParam("tSpeedRateType", 1)
		flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
		flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
		flow:setContinue(48)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_49_0(flow)
	flow:addTimer(0, _M, "_to_50_0", flow)

	return _M._to_48_0(flow)
end

function _M._to_50_0(flow)
	flow:setActive()

	local _0 = _C(51, "GetSelfId", flow)

	_A(flow, "PlayEmojiOnTarget", _0, "Love2", 4)

	return true
end

function _M._to_52_0(flow)
	local _0 = _M._get_36_1(flow)

	if _0 then
		flow:setActive()
		_A(flow, "SendMessageToTrigger", 0, 1063101)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_53_0(flow)
	flow:addTimer(0.2, _M, "_to_52_0", flow)

	return _M._to_44_0(flow)
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

return _M
