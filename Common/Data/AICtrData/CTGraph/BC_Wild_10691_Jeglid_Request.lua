-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10691_Jeglid_Request.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall

function _M.executeTickLodTrigger(flow)
	return _M._to_17_0(flow)
end

function _M._to_17_0(flow)
	local _3 = _M._get_6_3(flow)
	local _4 = not _3 or next(_3) == nil
	local _0 = not _4

	if _0 then
		flow:setActive()

		local _1 = _M._get_11_2(flow)
		local _2 = flow:getMessageContext()

		_2.sourceActorId = flow.__actorId

		flow:sendMessage(_1, "Msg_10691_Jeglid_Request", _2)

		return true
	else
		flow:setActiveFail()
	end
end

function _M._get_3_3(flow)
	local _6 = _M._get_6_2(flow)
	local _5 = _C(8, "GetPuppetData", flow, _6, "petPrototypeId", true, 0)
	local _0 = _5 == 1069100

	if not _0 then
		return false
	end

	local _4 = _M._get_6_2(flow)
	local _3 = _C(2, "GetDistance", flow, _4, 0, false)
	local _1 = _3 >= 3

	if not _1 then
		return false
	end

	local _7 = _M._get_6_2(flow)
	local _8 = _C(9, "IsInBehavTag", flow, _7, "TB_10691_Court")
	local _2 = not _8

	if not _2 then
		return false
	end

	return true
end

function _M._get_6_3(flow)
	local _0 = _C(5, "GetAoiEntityTableByLevel", flow, 0, 10, 8)
	local _1 = flow:getTempList()

	for k, v in pairs(_0) do
		flow:setCache(6, "__iterItem", v)

		if _M._get_3_3(flow) then
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

return _M
