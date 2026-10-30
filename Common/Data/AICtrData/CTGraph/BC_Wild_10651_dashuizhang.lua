-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10651_dashuizhang.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

function _M.executeTickLodTrigger(flow)
	return _M._to_19_0(flow)
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 16 then
		return true
	end

	if nodeId == 17 then
		return _M._to_16_0(flow)
	end

	if nodeId == 18 then
		return _M._to_17_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_16_0(flow)
	if not _B(flow, "PBT_CastSkill") then
		return
	end

	local _0 = _M._get_3_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tSkillId", 16510900)
	flow.__agent:addSubTreeLocalParam("tSkillTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tRaycastOpen", false)
	flow.__agent:addSubTreeLocalParam("tCastAbilitySource", 0)
	flow:setContinue(16)

	return true
end

function _M._to_17_0(flow)
	if not _B(flow, "PBT_RandomCustomAnimation_10651") then
		return
	end

	flow.__agent:clearSubTreeLocalParams()
	flow:setContinue(17)

	return true
end

function _M._to_18_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_3_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTgtId", _0)
	flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
	flow.__agent:addSubTreeLocalParam("tInstant", false)
	flow:setContinue(18)

	return true
end

function _M._to_19_0(flow)
	local _1 = _M._get_1_3(flow)
	local _2 = not _1 or next(_1) == nil
	local _0 = not _2

	if _0 then
		return _M._to_18_0(flow)
	end
end

function _M._get_1_2(flow)
	return flow:getCache(1, "__iterItem")
end

function _M._get_1_3(flow)
	local _0 = _C(4, "GetAoiEntityTableByLevel", flow, 0, 30, 8)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(1, "__iterItem", v)

		if _M._get_10_3(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_3_1(flow)
	local _0 = flow:getCache(3, "1")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_7_1(flow)

	flow:setCache(3, "1", _0)

	return _0
end

function _M._get_7_1(flow)
	local _0 = _M._get_1_3(flow)

	return _C(7, "SelectOneByRandom", flow, _0)
end

function _M._get_10_3(flow)
	local _7 = _M._get_1_2(flow)
	local _0 = _C(25, "HasEntityTag", flow, _7, "TE_Par_10621_Fight")

	if not _0 then
		return false
	end

	local _5 = _M._get_1_2(flow)
	local _6 = _C(22, "GetDistance", flow, _5, 0, false)
	local _1 = _6 > 10

	if not _1 then
		return false
	end

	local _3 = _M._get_1_2(flow)
	local _4 = _C(5, "GetPuppetData", flow, _3, "ethnicGroup", true, 0)
	local _2 = _4 == 1065

	if not _2 then
		return false
	end

	return true
end

return _M
