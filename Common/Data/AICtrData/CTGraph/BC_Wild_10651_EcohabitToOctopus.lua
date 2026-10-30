-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10651_EcohabitToOctopus.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _B = CTHelper.BeginBehaviourV2

local function _doBehaviourTail_0(flow, nodeId, value0)
	local agent = flow.__agent

	agent:clearSubTreeLocalParams()
	agent:addSubTreeLocalParam("tWaitTime", value0)
	flow:setContinue(nodeId)

	return true
end

local function _doBehaviourTail_1(flow, nodeId, value0, value1, value2, value3)
	local agent = flow.__agent

	agent:clearSubTreeLocalParams()
	agent:addSubTreeLocalParam("tAnimationTimeout", value0)
	agent:addSubTreeLocalParam("tTimelineTag", value1)
	agent:addSubTreeLocalParam("tNeedLoop", value2)
	agent:addSubTreeLocalParam("tPlayOnce", value3)
	flow:setContinue(nodeId)

	return true
end

function _M.executeTickLodTrigger(flow)
	return _M._to_14_0(flow)
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 14 then
		return _M._to_25_0(flow)
	end

	if nodeId == 22 then
		return _M._to_26_0(flow)
	end

	if nodeId == 26 then
		return _M._to_34_0(flow)
	end

	if nodeId == 27 then
		return _M._to_28_0(flow)
	end

	if nodeId == 29 then
		return _M._to_31_0(flow)
	end

	if nodeId == 30 then
		return _M._to_43_0(flow)
	end

	if nodeId == 31 then
		return _M._to_32_0(flow)
	end

	if nodeId == 32 then
		return _M._to_33_0(flow)
	end

	if nodeId == 33 then
		return true
	end

	if nodeId == 34 then
		return _M._to_27_0(flow)
	end

	if nodeId == 43 then
		return _M._to_44_0(flow)
	end

	if nodeId == 44 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_14_0(flow)
	if flow.__isAdditive then
		return
	end

	local _0 = _M._get_13_1(flow)

	if _0 then
		flow:setActive()
		_C(14, "DoBehaviour", flow, "PBT_Com_Node_Wait")

		local _1 = _M._get_17_2(flow)

		return _doBehaviourTail_0(flow, 14, _1)
	else
		flow:setActiveFail()
	end
end

function _M._to_19_0(flow)
	local _1 = _C(20, "RandomInteger", flow, 0, 100)
	local _0 = _1 <= 35

	if _0 then
		return _M._to_22_0(flow)
	end
end

function _M._to_22_0(flow)
	if not _B(flow, "PBT_MoveToTargetEntity") then
		return
	end

	local _0 = _M._get_15_1(flow)
	local _1 = _M._get_24_2(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTargetActorId", _0)
	flow.__agent:addSubTreeLocalParam("tStopDist", _1)
	flow.__agent:addSubTreeLocalParam("tMaxTimeout", 10)
	flow.__agent:addSubTreeLocalParam("tFaceTarget", false)
	flow.__agent:addSubTreeLocalParam("tSpeed", 0)
	flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 99999)
	flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
	flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
	flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
	flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
	flow:setContinue(22)

	return true
end

function _M._to_25_0(flow)
	local _1 = _M._get_15_1(flow)
	local _0 = _C(18, "CheckEntityExist", flow, _1)

	if _0 then
		return _M._to_19_0(flow)
	end
end

function _M._to_26_0(flow)
	if not _B(flow, "PBT_TurnToTargetAtYaw") then
		return
	end

	local _0 = _M._get_15_1(flow)

	flow.__agent:clearSubTreeLocalParams()
	flow.__agent:addSubTreeLocalParam("tTgtId", _0)
	flow.__agent:addSubTreeLocalParam("tTargetAtYawDegree", 0)
	flow.__agent:addSubTreeLocalParam("tInstant", false)
	flow:setContinue(26)

	return true
end

function _M._to_27_0(flow)
	if not _B(flow, "PBT_Com_Node_Wait") then
		return
	end

	local _0 = _M._get_36_2(flow)

	return _doBehaviourTail_0(flow, 27, _0)
end

function _M._to_28_0(flow)
	local _1 = _C(37, "RandomInteger", flow, 0, 100)
	local _0 = _1 <= 29

	if _0 then
		return _M._to_29_0(flow)
	end

	return _M._to_30_0(flow)
end

function _M._to_29_0(flow)
	if not _B(flow, "PBT_Com_Happy_New") then
		return
	end

	return _doBehaviourTail_1(flow, 29, 2, "", false, true)
end

function _M._to_30_0(flow)
	if not _B(flow, "PBT_Com_Node_Wait") then
		return
	end

	local _0 = _M._get_47_2(flow)

	return _doBehaviourTail_0(flow, 30, _0)
end

function _M._to_31_0(flow)
	if not _B(flow, "PBT_Com_Node_Wait") then
		return
	end

	local _0 = _M._get_40_2(flow)

	return _doBehaviourTail_0(flow, 31, _0)
end

function _M._to_32_0(flow)
	if not _B(flow, "PBT_Com_Happy_New") then
		return
	end

	return _doBehaviourTail_1(flow, 32, 2, "", false, true)
end

function _M._to_33_0(flow)
	if not _B(flow, "PBT_Com_Node_Wait") then
		return
	end

	local _0 = _M._get_42_2(flow)

	return _doBehaviourTail_0(flow, 33, _0)
end

function _M._to_34_0(flow)
	if not _B(flow, "PBT_Com_Happy_New") then
		return
	end

	return _doBehaviourTail_1(flow, 34, 2, "", false, true)
end

function _M._to_43_0(flow)
	if not _B(flow, "PBT_Com_Happy_New") then
		return
	end

	return _doBehaviourTail_1(flow, 43, 2, "", false, true)
end

function _M._to_44_0(flow)
	if not _B(flow, "PBT_Com_Node_Wait") then
		return
	end

	local _0 = _M._get_46_2(flow)

	return _doBehaviourTail_0(flow, 44, _0)
end

function _M._get_1_2(flow)
	return flow:getCache(1, "__iterItem")
end

function _M._get_1_3(flow)
	local _0 = _C(0, "GetAoiEntityTableByLevel", flow, 0, 10, 8)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(1, "__iterItem", v)

		if _M._get_6_3(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_6_3(flow)
	local _7 = _M._get_1_2(flow)
	local _4 = _C(50, "GetPuppetData", flow, _7, "id", true, 0)
	local _0 = _4 == 11062100

	if not _0 then
		return false
	end

	local _5 = _M._get_1_2(flow)
	local _6 = _C(5, "GetDistance", flow, _5, 0, false)
	local _1 = _6 <= 10

	if not _1 then
		return false
	end

	local _3 = _M._get_1_2(flow)
	local _2 = _C(3, "IsEntityType", flow, _3, "ACTOR_TYPE_PUPPET")

	if not _2 then
		return false
	end

	return true
end

function _M._get_12_1(flow)
	local _0 = _M._get_1_3(flow)

	return _C(12, "SelectOneByRandom", flow, _0)
end

function _M._get_13_1(flow)
	local _1 = _M._get_1_3(flow)
	local _0 = not _1 or next(_1) == nil

	return not _0
end

function _M._get_15_1(flow)
	local _0 = flow:getCache(15, "OctopusTargetId")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_12_1(flow)

	flow:setCache(15, "OctopusTargetId", _0)

	return _0
end

function _M._get_17_2(flow)
	local _0 = _C(16, "RandomInteger", flow, 5, 16)

	return _0 / 10
end

function _M._get_24_2(flow)
	local _0 = _C(23, "RandomInteger", flow, 7, 15)

	return _0 / 10
end

function _M._get_36_2(flow)
	local _0 = _C(35, "RandomInteger", flow, 20, 31)

	return _0 / 10
end

function _M._get_40_2(flow)
	local _0 = _C(39, "RandomInteger", flow, 20, 31)

	return _0 / 10
end

function _M._get_42_2(flow)
	local _0 = _C(41, "RandomInteger", flow, 5, 11)

	return _0 / 10
end

function _M._get_46_2(flow)
	local _0 = _C(45, "RandomInteger", flow, 5, 11)

	return _0 / 10
end

function _M._get_47_2(flow)
	local _0 = _C(48, "RandomInteger", flow, 20, 31)

	return _0 / 10
end

return _M
