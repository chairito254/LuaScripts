-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10040_practice.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction
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

function _M.executeTickLodTrigger(flow)
	return _M._to_32_0(flow)
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _M._get_24_1(flow)
	local _1 = _M._get_24_2(flow)

	_A(flow, "ExitResPointPort", 0, _0, _1, 0, 0)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 19 then
		return _M._to_25_0(flow)
	end

	if nodeId == 33 then
		return _M._to_35_0(flow)
	end

	if nodeId == 35 then
		return _M._to_36_0(flow)
	end

	if nodeId == 36 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_19_0(flow)
	if not _B(flow, "PBT_MoveToResPointPort") then
		return
	end

	local _0 = _M._get_24_1(flow)
	local _1 = _M._get_24_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tPointId", _0)
	flow.__agent:addSubTreeLocalParam("tPortId", _1)
	flow.__agent:addSubTreeLocalParam("tTimeout", 1000)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
	flow.__agent:addSubTreeLocalParam("tSpeed", 1.6)
	flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
	flow:setContinue(19)

	return true
end

function _M._to_25_0(flow)
	flow:setActive()

	local _0 = _M._get_24_1(flow)
	local _1 = _M._get_24_2(flow)

	_A(flow, "JoinResPointPort", 0, _0, _1)

	return _M._to_33_0(flow)
end

function _M._to_32_0(flow)
	local _3 = _M._get_29_2(flow)
	local _4 = not _3 or next(_3) == nil
	local _0 = not _4

	if _0 then
		flow:setActive()

		local _1 = _M._get_24_1(flow)
		local _2 = _M._get_24_2(flow)

		_A(flow, "PreJoinResPointPort", 0, _1, _2)

		return _M._to_19_0(flow)
	else
		flow:setActiveFail()
	end
end

function _M._to_33_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 33, 0, "Attack01", 5, "Love", 5, "", false, false, false)
end

function _M._to_35_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 35, 0, "Idle", 10, "Love", 5, "", false, false, false)
end

function _M._to_36_0(flow)
	if not _B(flow, "PBT_CustomAnimation") then
		return
	end

	return _doBehaviourTail_0(flow, 36, 0, "Attack01", 5, "Love", 5, "", false, false, false)
end

function _M._get_21_1(flow)
	local _0 = _M._get_29_2(flow)

	return _C(21, "SelectOneByRandom", flow, _0)
end

function _M._get_24_1(flow)
	local _0 = _M._get_28_1(flow)

	return _C(24, "UnpackResPointPort", flow, _0, 1)
end

function _M._get_24_2(flow)
	local _0 = _M._get_28_1(flow)

	return _C(24, "UnpackResPointPort", flow, _0, 2)
end

function _M._get_28_1(flow)
	local _0 = flow:getCache(28, "resPointPort")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_21_1(flow)

	flow:setCache(28, "resPointPort", _0)

	return _0
end

function _M._get_29_2(flow)
	local _0 = _C(20, "GetAoiResPointPortTableByLevel", flow, 0, 30, 0, {
		"TR_GB_Boxing"
	}, {
		"TR_GB_Boxing"
	})

	if _0 == nil then
		return
	end

	local _1 = flow:getTempList()

	for k, v in ipairs(_0) do
		flow:setCache(29, "__iterItem", v)

		if _M._get_31_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_31_2(flow)
	local _1 = flow:getCache(29, "__iterItem")
	local _0 = _C(30, "GetDistanceFromEntityToResPointPort", flow, 0, _1)

	return _0 < 15
end

function _M._get_37_3(flow)
	local _0 = flow:getCache(38, "__iterItem")

	return _C(37, "GetDistance", flow, _0, 0, false)
end

return _M
