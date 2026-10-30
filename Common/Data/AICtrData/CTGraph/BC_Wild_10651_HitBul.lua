-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10651_HitBul.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

function _M.executeTickLodTrigger(flow)
	return _M._to_70_0(flow)
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 67 then
		return _M._to_74_0(flow)
	end

	if nodeId == 69 then
		return _M._to_67_0(flow)
	end

	if nodeId == 74 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_67_0(flow)
	if not _B(flow, "PBT_CastSkill") then
		return
	end

	local _0 = _M._get_58_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tSkillId", 15710900)
	flow.__agent:addSubTreeLocalParam("tSkillTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tRaycastOpen", false)
	flow.__agent:addSubTreeLocalParam("tCastAbilitySource", 0)
	flow:setContinue(67)

	return true
end

function _M._to_69_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_58_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTgtId", _0)
	flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
	flow.__agent:addSubTreeLocalParam("tInstant", false)
	flow:setContinue(69)

	return true
end

function _M._to_70_0(flow)
	local _1 = _M._get_56_3(flow)
	local _2 = not _1 or next(_1) == nil
	local _0 = not _2

	if _0 then
		return _M._to_69_0(flow)
	end
end

function _M._to_74_0(flow)
	if not _B(flow, "PBT_RandomCustomAnimation_10571") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow:setContinue(74)

	return true
end

function _M._get_56_3(flow)
	local _0 = _C(59, "GetAoiEntityTableByLevel", flow, 0, 30, 32)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(56, "__iterItem", v)

		if _M._get_64_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_56_2(flow)
	return flow:getCache(56, "__iterItem")
end

function _M._get_58_1(flow)
	local _0 = flow:getCache(58, "1")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_62_1(flow)

	flow:setCache(58, "1", _0)

	return _0
end

function _M._get_62_1(flow)
	local _0 = _M._get_56_3(flow)

	return _C(62, "SelectOneByRandom", flow, _0)
end

function _M._get_64_2(flow)
	local _2 = _M._get_56_2(flow)
	local _0 = _C(63, "HasEntityTag", flow, _2, "TE_Env_Bubble")

	if not _0 then
		return false
	end

	local _3 = _M._get_56_2(flow)
	local _4 = _C(71, "GetDistance", flow, _3, 0, false)
	local _1 = _4 < 5

	if not _1 then
		return false
	end

	return true
end

return _M
