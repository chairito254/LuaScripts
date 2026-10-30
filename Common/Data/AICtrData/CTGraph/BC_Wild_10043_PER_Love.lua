-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10043_PER_Love.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction
local _B = CTHelper.BeginBehaviourV2

local function _doBehaviourTail_0(flow, nodeId, value0, value1)
	local agent = flow.__agent

	agent:clearSubTreeLocalParams()
	agent:addSubTreeLocalParam("tEmojiBubbleKey", value0)
	agent:addSubTreeLocalParam("tEmojiBubbleTimeout", value1)
	flow:setContinue(nodeId)

	return true
end

local function _doBehaviourTail_1(flow, nodeId, value0, value1, value2)
	local agent = flow.__agent

	agent:clearSubTreeLocalParams()
	agent:addSubTreeLocalParam("tTgtId", value0)
	agent:addSubTreeLocalParam("tTargetAtYawDegree", value1)
	agent:addSubTreeLocalParam("tInstant", value2)
	flow:setContinue(nodeId)

	return true
end

function _M.executeEventTrigger(flow, eventName)
	if eventName == "Event_PER_Love" then
		return _M._to_35_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 39 then
		return _M._to_54_0(flow)
	end

	if nodeId == 44 then
		return true
	end

	if nodeId == 46 then
		return _M._to_44_0(flow)
	end

	if nodeId == 53 then
		return _M._to_66_0(flow)
	end

	if nodeId == 65 then
		return true
	end

	if nodeId == 66 then
		return _M._to_65_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_35_0(flow)
	local _0 = _M._get_42_3(flow)

	if _0 then
		return _M._to_39_0(flow)
	end

	local _1 = _M._get_63_2(flow)

	if _1 then
		return _M._to_53_0(flow)
	end
end

function _M._to_39_0(flow)
	if not _B(flow, "PBT_Node_Com_SensedAlert") then
		return
	end

	local _0 = _M._get_32_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow:setContinue(39)

	return true
end

function _M._to_44_0(flow)
	if not _B(flow, "PBT_ShowEmojiBubble") then
		return
	end

	return _doBehaviourTail_0(flow, 44, "Love", 2)
end

function _M._to_46_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_32_2(flow)

	return _doBehaviourTail_1(flow, 46, _0, 0, false)
end

function _M._to_47_0(flow)
	local _0 = _M._get_36_1(flow)

	if _0 then
		flow:setActive()
		_A(flow, "SendMessageToTrigger", 0, 1004302)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_53_0(flow)
	if not _B(flow, "PBT_Node_Com_SensedAlert") then
		return
	end

	local _0 = _M._get_32_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow:setContinue(53)

	return true
end

function _M._to_54_0(flow)
	flow:addTimer(0, _M, "_to_47_0", flow)

	return _M._to_46_0(flow)
end

function _M._to_65_0(flow)
	if not _B(flow, "PBT_ShowEmojiBubble") then
		return
	end

	return _doBehaviourTail_0(flow, 65, "Love", 2)
end

function _M._to_66_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_32_2(flow)

	return _doBehaviourTail_1(flow, 66, _0, 0, false)
end

function _M._get_32_2(flow)
	return flow:getContextValue("interactObjectActorId")
end

function _M._get_36_3(flow)
	local _0 = flow:getSubMacro("BCM_Common_CheckPER")
	local _1 = _M._get_32_2(flow)

	_0:setContextValue("tActorId", _1)

	local _2 = _0:getMacroValue("tIsPlayerInterrupt")

	flow:clearSubMacro(_0)

	return _2
end

function _M._get_36_1(flow)
	local _0 = flow:getSubMacro("BCM_Common_CheckPER")
	local _1 = _M._get_32_2(flow)

	_0:setContextValue("tActorId", _1)

	local _2 = _0:getMacroValue("tIsPlayer")

	flow:clearSubMacro(_0)

	return _2
end

function _M._get_42_3(flow)
	local _5 = _M._get_32_2(flow)
	local _0 = _C(43, "IsInAnimState", flow, _5, "IdleSpecial")

	if not _0 then
		return false
	end

	local _4 = _M._get_32_2(flow)
	local _3 = _C(41, "GetPetData", flow, _4, "baseFormPet", true, 0)
	local _1 = _3 == 1004100

	if not _1 then
		return false
	end

	local _6 = _M._get_32_2(flow)
	local _2 = _C(62, "IsEntityType", flow, _6, "ACTOR_TYPE_PET")

	if not _2 then
		return false
	end

	return true
end

function _M._get_56_2(flow)
	local _1 = _M._get_32_2(flow)
	local _0 = _C(55, "GetDistance", flow, _1, 0, false)

	return _0 > 10
end

function _M._get_63_2(flow)
	local _2 = _M._get_32_2(flow)
	local _3 = _C(49, "GetPetData", flow, _2, "baseFormPet", true, 0)
	local _4 = _3 == 1004100
	local _0 = not _4

	if not _0 then
		return false
	end

	local _5 = _M._get_32_2(flow)
	local _1 = _C(64, "IsEntityType", flow, _5, "ACTOR_TYPE_PET")

	if not _1 then
		return false
	end

	return true
end

return _M
