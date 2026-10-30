-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_CourtToPlayer.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall

function _M.executeTickLodTrigger(flow)
	return _M._to_17_0(flow)
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _C(25, "GetSelfId", flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_FollowEnd", _1)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 17 then
		return _M._to_28_0(flow)
	end

	if nodeId == 28 then
		return _M._to_26_0(flow)
	end
end

function _M.checkInterrupt(flow, nodeId)
	if nodeId == 28 then
		return _M._get_22_2(flow)
	end
end

function _M._to_17_0(flow)
	if flow.__isAdditive then
		return
	end

	local _0 = _M._get_14_1(flow)

	if _0 then
		flow:setActive()
		_C(17, "DoBehaviour", flow, "PBT_MoveToTargetEntity")

		local _1 = _M._get_20_1(flow)

		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tTargetActorId", _1)
		flow.__agent:addSubTreeLocalParam("tStopDist", 1)
		flow.__agent:addSubTreeLocalParam("tMaxTimeout", 7)
		flow.__agent:addSubTreeLocalParam("tFaceTarget", true)
		flow.__agent:addSubTreeLocalParam("tSpeed", 2)
		flow.__agent:addSubTreeLocalParam("tMoveUpdateLevel", 99999)
		flow.__agent:addSubTreeLocalParam("tPathFindType", 0)
		flow.__agent:addSubTreeLocalParam("tSpeedRateType", 0)
		flow.__agent:addSubTreeLocalParam("tUseAccurateArrive", false)
		flow.__agent:addSubTreeLocalParam("tNoBodySize", false)
		flow:setContinue(17)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._to_26_0(flow)
	flow:setActive()

	local _0 = _C(27, "GetSelfId", flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_FollowEnd", _1)

	return true
end

function _M._to_28_0(flow)
	if flow.__isAdditive then
		return
	end

	local _1 = _M.checkInterrupt(flow, 28)

	if not _1 then
		flow:setActive()
		_C(28, "DoBehaviour", flow, "PBT_CustomAnimation")
		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tWaitTime", 0)
		flow.__agent:addSubTreeLocalParam("tAnimationKey", "Behav_Love")
		flow.__agent:addSubTreeLocalParam("tAnimationTimeout", 5.5)
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleKey", "Love")
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleTimeout", 5)
		flow.__agent:addSubTreeLocalParam("tTimelineTag", "")
		flow.__agent:addSubTreeLocalParam("tNeedLoop", false)
		flow.__agent:addSubTreeLocalParam("tAnimationPlayOnce", false)
		flow.__agent:addSubTreeLocalParam("tEmojiBubbleMustPlayFull", false)
		flow:setContinue(28)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._get_3_2(flow)
	local _5 = _M._get_6_2(flow)
	local _4 = _C(16, "GetPetData", flow, _5, "petPrototypeId", true, 0)
	local _0 = _4 == 1069100

	if not _0 then
		return false
	end

	local _3 = _M._get_6_2(flow)
	local _2 = _C(2, "GetDistance", flow, _3, 0, false)
	local _1 = _2 >= 3

	if not _1 then
		return false
	end

	return true
end

function _M._get_6_3(flow)
	local _0 = _C(5, "GetAoiEntityTableByLevel", flow, 0, 10, 4)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(6, "__iterItem", v)

		if _M._get_3_2(flow) then
			_1[#_1 + 1] = v
		end
	end

	return _1
end

function _M._get_6_2(flow)
	return flow:getCache(6, "__iterItem")
end

function _M._get_10_3(flow)
	local _0 = flow:getCache(11, "__iterItem")

	return _C(10, "GetDistance", flow, _0, 0, false)
end

function _M._get_11_2(flow)
	local _0 = _M._get_6_3(flow)

	if _0 == nil then
		return
	end

	local _1, _2, _3

	for _, v in ipairs(_0) do
		flow:setCache(11, "__iterItem", v)

		_1 = _M._get_10_3(flow)

		if _3 == nil then
			_2, _3 = v, _1
		end

		if _1 < _3 then
			_2, _3 = v, _1
		end
	end

	return _2
end

function _M._get_14_1(flow)
	local _1 = _M._get_6_3(flow)
	local _0 = not _1 or next(_1) == nil

	return not _0
end

function _M._get_20_1(flow)
	local _0 = flow:getCache(20, "PlayerId")

	if _0 ~= nil then
		return _0
	end

	_0 = _M._get_11_2(flow)

	flow:setCache(20, "PlayerId", _0)

	return _0
end

function _M._get_22_2(flow)
	local _1 = _M._get_20_1(flow)
	local _0 = _C(21, "GetDistance", flow, _1, 0, false)

	return _0 > 5
end

return _M
