-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_FollowLover.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10691_Jeglid_FollowLover" then
		return _M._to_1_0(flow)
	end
end

function _M.executeEndTrigger(flow)
	flow:setActive()

	local _0 = _C(10, "GetSelfId", flow)
	local _1 = flow:getMessageContext()

	_1.sourceActorId = flow.__actorId

	flow:sendMessage(_0, "Msg_10691_Jeglid_FollowEnd", _1)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 1 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	if nodeId == 1 then
		return _M._get_4_1(flow)
	end
end

function _M._to_1_0(flow)
	if flow.__isAdditive then
		return
	end

	local _1 = _M.checkInterrupt(flow, 1)

	if not _1 then
		flow:setActive()
		_C(1, "DoBehaviour", flow, "PBT_FollowOneByOne")

		local _1 = _M._get_2_2(flow)

		flow.__agent:clearSubTreeLocalParams()
		flow.__agent:addSubTreeLocalParam("tFollowEntActorID", _1)
		flow.__agent:addSubTreeLocalParam("tFollowStopDist", 0.5)
		flow.__agent:addSubTreeLocalParam("tStartFollowDist", 0)
		flow:setContinue(1)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._get_2_2(flow)
	return flow:getContextValue("ActorID")
end

function _M._get_4_1(flow)
	local _1 = _M._get_2_2(flow)
	local _0 = _C(3, "CheckEntityExist", flow, _1)

	return not _0
end

return _M
