-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_Reply.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}

function _M.executeMessageTrigger(flow, eventName)
	if eventName == "Msg_10691_Jeglid_Request" then
		flow:setActive()

		local _0 = flow:getContextValue("sourceActorId")
		local _1 = flow:getMessageContext()

		_1.sourceActorId = flow.__actorId

		flow:sendMessage(_0, "Msg_10691_Jeglid_Reply", _1)

		return true
	end
end

return _M
