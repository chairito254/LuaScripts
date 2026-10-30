-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10631_minisn.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction
local _B = CTHelper.BeginBehaviourV2

function _M.executeTickLodTrigger(flow)
	return _M._to_13_0(flow)
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 14 then
		return true
	end

	if nodeId == 15 then
		return true
	end

	if nodeId == 16 then
		return _M._to_15_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_13_0(flow)
	local _0 = _C(10, "IsChildOfCharState", flow, 0, "SNEAK")

	if _0 then
		flow:setActive()
		_A(flow, "SetVisionAreaOverride", "visionAreaNone")

		return _M._to_16_0(flow)
	else
		flow:setActiveFail()
	end
end

function _M._to_15_0(flow)
	if not _B(flow, "PBT_Behav_GamePlay_Leave") then
		return
	end

	local _0 = _M._get_12_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tLeaveDistance", 10)
	flow.__agent:addSubTreeLocalParam("tSpeed", 4)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 1)
	flow.__agent:addSubTreeLocalParam("tMaxTime", 5)
	flow:setContinue(15)

	return true
end

function _M._to_16_0(flow)
	if flow.__isAdditive then
		return
	end

	local _0 = _M._get_6_1(flow)

	if _0 then
		flow:setActive()
		_C(16, "DoBehaviour", flow, "PBT_CustomAnimation")
		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
		flow.__agent:addSubTreeLocalParam("tAnimationKey", "SneakInGround")
		flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 1)
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "Naughty")
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 3)
		flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
		flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
		flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", false)
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", false)
		flow:setContinue(16)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._get_0_2(flow)
	return flow:getCache(0, "__iterItem")
end

function _M._get_0_3(flow)
	local _0 = _C(1, "GetAoiEntityTableByLevel", flow, 0, 10, 2)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(0, "__iterItem", v)

		if _M._get_2_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_2_2(flow)
	local _1 = _M._get_0_2(flow)
	local _0 = _C(3, "GetDistance", flow, _1, 0, false)

	return _0 <= 5
end

function _M._get_6_1(flow)
	local _1 = _M._get_0_3(flow)
	local _0 = not _1 or next(_1) == nil

	return not _0
end

function _M._get_8_3(flow)
	local _0 = flow:getCache(9, "__iterItem")

	return _C(8, "GetDistance", flow, _0, 0, false)
end

function _M._get_9_2(flow)
	local _0 = _M._get_0_3(flow)

	if _0 == nil then
		return
	end

	local _1, _2, _3

	for _, v in ipairs(_0) do
		flow:setCache(9, "__iterItem", v)

		_1 = _M._get_8_3(flow)

		if _3 == nil then
			_2, _3 = v, _1
		end

		if _1 < _3 then
			_2, _3 = v, _1
		end
	end

	return _2
end

function _M._get_12_1(flow)
	local _0 = flow:getCache(12, "TargetId")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_9_2(flow)

	flow:setCache(12, "TargetId", _0)

	return _0
end

return _M
