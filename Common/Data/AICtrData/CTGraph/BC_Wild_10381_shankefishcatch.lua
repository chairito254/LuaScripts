-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10381_shankefishcatch.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction
local _B = CTHelper.BeginBehaviourV2

function _M.executeTickLodTrigger(flow)
	return _M._to_19_0(flow)
end

function _M.executeStartTrigger(flow)
	flow:setActive()

	local _0 = _M._get_5_1(flow)
	local _1 = _M._get_5_2(flow)

	_A(flow, "PreJoinResPointPort", 0, _0, _1)

	return true
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _M._get_5_1(flow)
	local _1 = _M._get_5_2(flow)

	_A(flow, "ExitResPointPort", 0, _0, _1, 0, 0)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 12 then
		return true
	end

	if nodeId == 19 then
		return _M._to_6_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_6_0(flow)
	flow:setActive()

	local _0 = _M._get_5_1(flow)
	local _1 = _M._get_5_2(flow)

	_A(flow, "JoinResPointPort", 0, _0, _1)

	return _M._to_12_0(flow)
end

function _M._to_12_0(flow)
	if not _B(flow, "PBT_RandomCustomAnimation_10581_Catch") then
		return
	end

	local _0 = _M._get_15_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tFollowTgtId", _0)
	flow:setContinue(12)

	return true
end

function _M._to_19_0(flow)
	if flow.__isAdditive then
		return
	end

	local _0 = _M._get_4_1(flow)

	if _0 then
		flow:setActive()
		_C(19, "DoBehaviour", flow, "PBT_MoveToTargetEntity")

		local _1 = _M._get_15_1(flow)

		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tTargetActorId", _1)
		flow.__agent:addSubTreeLocalParam("tStopDist", 0.5)
		flow.__agent:addSubTreeLocalParam("tMaxTimeout", 5)
		flow.__agent:addSubTreeLocalParam("tFaceTarget", true)
		flow.__agent:addSubTreeLocalParam("tSpeed", 0)
		flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 99999)
		flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
		flow.__agent:addSubTreeLocalParam("tSpeedRateType", 2)
		flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
		flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
		flow:setContinue(19)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._get_2_1(flow)
	local _0 = _M._get_11_2(flow)

	return _C(2, "SelectOneByRandom", flow, _0)
end

function _M._get_4_1(flow)
	local _1 = _M._get_11_2(flow)
	local _0 = not _1 or next(_1) == nil

	return not _0
end

function _M._get_5_1(flow)
	local _0 = _M._get_10_1(flow)

	return _C(5, "UnpackResPointPort", flow, _0, 1)
end

function _M._get_5_2(flow)
	local _0 = _M._get_10_1(flow)

	return _C(5, "UnpackResPointPort", flow, _0, 2)
end

function _M._get_10_1(flow)
	local _0 = flow:getCache(10, "resPointPort")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_2_1(flow)

	flow:setCache(10, "resPointPort", _0)

	return _0
end

function _M._get_11_2(flow)
	local _0 = _C(1, "GetAoiResPointPortTableByLevel", flow, 0, 20, 0, {
		"TR_GB_10631becatch"
	}, {
		"TR_GB_10631becatch"
	})

	if _0 == nil then
		return
	end

	local _1 = flow:getTempList()

	for k, v in ipairs(_0) do
		flow:setCache(11, "__iterItem", v)

		if _M._get_14_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_14_2(flow)
	local _1 = flow:getCache(11, "__iterItem")
	local _0 = _C(13, "GetDistanceFromEntityToResPointPort", flow, 0, _1)

	return _0 < 20
end

function _M._get_15_1(flow)
	local _0 = _M._get_5_1(flow)

	return _C(15, "GetEntityIdByResPointId", flow, _0)
end

return _M
