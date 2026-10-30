-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10581_Timetopaopao.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

function _M.executeEventTrigger(flow, eventName)
	if eventName == "LevelMsgTriggerTimeToBul" then
		return _M._to_0_0(flow)
	end
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 0 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_0_0(flow)
	if not _B(flow, "PBT_CastSkill") then
		return
	end

	local _0 = _M._get_10_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
	flow.__agent:addSubTreeLocalParam("tSkillId", 15810900)
	flow.__agent:addSubTreeLocalParam("tSkillTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "")
	flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
	flow.__agent:addSubTreeLocalParam("tRaycastOpen", false)
	flow.__agent:addSubTreeLocalParam("tCastAbilitySource", 0)
	flow:setContinue(0)

	return true
end

function _M._get_3_3(flow)
	local _0 = _C(4, "GetAoiEntityTableByLevel", flow, 0, 10, 2)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(3, "__iterItem", v)

		if _M._get_8_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_3_2(flow)
	return flow:getCache(3, "__iterItem")
end

function _M._get_6_1(flow)
	local _0 = _M._get_3_3(flow)

	return _C(6, "SelectOneByRandom", flow, _0)
end

function _M._get_8_2(flow)
	local _1 = _M._get_3_2(flow)
	local _0 = _C(9, "GetDistance", flow, _1, 0, false)

	return _0 <= 5
end

function _M._get_10_1(flow)
	local _0 = flow:getCache(10, "1")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_6_1(flow)

	flow:setCache(10, "1", _0)

	return _0
end

return _M
