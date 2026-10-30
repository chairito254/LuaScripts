-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10591_Blobfish_Response.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10591_HoneyFish_Seek" then
		return _M._to_0_0(flow)
	end
end

function _M._to_0_0(flow)
	local _0 = _M._get_4_1(flow)

	if _0 then
		flow:setActive()

		local _1 = _M._get_2_1(flow)
		local _2 = flow:getMessageContext()

		_2.sourceActorId = flow.__actorId

		flow:sendMessage(_1, "Msg_10591_HoneyFish_Response", _2)

		return _M._to_3_0(flow)
	else
		flow:setActiveFail()
	end
end

function _M._to_3_0(flow)
	local _0 = _M._get_4_1(flow)

	if _0 then
		flow:setActive()

		local _1 = _C(5, "GetSelfId", flow)
		local _2 = flow:getMessageContext()

		_2.sourceActorId = flow.__actorId

		flow:sendMessage(_1, "Msg_10591_HoneyFish_Response", _2)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._get_2_1(flow)
	return flow:getContextValue("sourceActorId")
end

function _M._get_4_1(flow)
	local _1 = _M._get_2_1(flow)
	local _0 = _C(1, "IsInBehavTag", flow, _1, "TB_10591_Hello")

	return not _0
end

return _M
