-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10651_Roundhappy.lua

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

function _M.executeTickLodTrigger(flow)
	return _M._to_50_0(flow)
end

function _M.executeStartTrigger(flow)
	flow:setActive()

	local _0 = _M._get_40_1(flow)
	local _1 = _M._get_40_2(flow)

	_A(flow, "PreJoinResPointPort", 0, _0, _1)

	return true
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _M._get_40_1(flow)
	local _1 = _M._get_40_2(flow)

	_A(flow, "ExitResPointPort", 0, _0, _1, 0, 0)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 2 then
		return _M._to_49_0(flow)
	end

	if nodeId == 27 then
		return _M._to_32_0(flow)
	end

	if nodeId == 32 then
		return _M._to_2_0(flow)
	end

	if nodeId == 49 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_2_0(flow)
	if not _B(flow, "PBT_MoveAroundTarget") then
		return
	end

	local _0 = _M._get_47_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tRadius", 2)
	flow.__agent:addSubTreeLocalParam("tSpeed", 0)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 1)
	flow.__agent:addSubTreeLocalParam("tClockwise", false)
	flow.__agent:addSubTreeLocalParam("tTimeout", 0)
	flow:setContinue(2)

	return true
end

function _M._to_27_0(flow)
	if not _B(flow, "PBT_ShowEmojiBubble") then
		return
	end

	return _doBehaviourTail_0(flow, 27, "Happy", 10)
end

function _M._to_32_0(flow)
	if not _B(flow, "PBT_MoveToResPointPort") then
		return
	end

	local _0 = _M._get_40_1(flow)
	local _1 = _M._get_40_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tPointId", _0)
	flow.__agent:addSubTreeLocalParam("tPortId", _1)
	flow.__agent:addSubTreeLocalParam("tTimeout", 0)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
	flow.__agent:addSubTreeLocalParam("tSpeed", 0)
	flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
	flow:setContinue(32)

	return true
end

function _M._to_49_0(flow)
	if not _B(flow, "PBT_ShowEmojiBubble") then
		return
	end

	return _doBehaviourTail_0(flow, 49, "Happy", 5)
end

function _M._to_50_0(flow)
	local _3 = _M._get_34_2(flow)
	local _4 = not _3 or next(_3) == nil
	local _0 = not _4

	if _0 then
		flow:setActive()

		local _1 = _M._get_47_1(flow)
		local _2 = flow:getMessageContext()

		_2.sourceActorId = flow.__actorId

		flow:sendMessage(_1, "Msg_10651_Round", _2)

		return _M._to_27_0(flow)
	else
		flow:setActiveFail()
	end
end

function _M._get_0_3(flow)
	local _0 = _C(1, "GetAoiEntityTableByLevel", flow, 0, 10, 14)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(0, "__iterItem", v)

		if _M._get_6_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_0_2(flow)
	return flow:getCache(0, "__iterItem")
end

function _M._get_6_2(flow)
	local _1 = _M._get_0_2(flow)
	local _0 = _C(7, "GetDistance", flow, _1, 0, false)

	return _0 <= 5
end

function _M._get_10_1(flow)
	local _0 = _M._get_0_3(flow)

	return _C(10, "GetTableLength", flow, _0)
end

function _M._get_34_2(flow)
	local _0 = _C(42, "GetAoiResPointPortTableByLevel", flow, 0, 10, 0, {
		"TR_GB_10621roundhappy"
	}, {
		"TR_GB_10621roundhappy"
	})

	if _0 == nil then
		return
	end

	local _1 = flow:getTempList()

	for k, v in ipairs(_0) do
		flow:setCache(34, "__iterItem", v)

		if _M._get_36_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_36_2(flow)
	local _1 = flow:getCache(34, "__iterItem")
	local _0 = _C(35, "GetDistanceFromEntityToResPointPort", flow, 0, _1)

	return _0 < 10
end

function _M._get_37_1(flow)
	local _0 = _M._get_34_2(flow)

	return _C(37, "SelectOneByRandom", flow, _0)
end

function _M._get_40_1(flow)
	local _0 = _M._get_41_1(flow)

	return _C(40, "UnpackResPointPort", flow, _0, 1)
end

function _M._get_40_2(flow)
	local _0 = _M._get_41_1(flow)

	return _C(40, "UnpackResPointPort", flow, _0, 2)
end

function _M._get_41_1(flow)
	local _0 = flow:getCache(41, "resPointPort")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_37_1(flow)

	flow:setCache(41, "resPointPort", _0)

	return _0
end

function _M._get_47_1(flow)
	local _0 = _M._get_40_1(flow)

	return _C(47, "GetEntityIdByResPointId", flow, _0)
end

return _M
