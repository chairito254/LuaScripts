-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_10631_locomstate.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _C = CTHelper.SafeCall
local _A = CTHelper.DoAction

function _M.executeTickLodTrigger(flow)
	return _M._to_25_0(flow)
end

function _M._to_25_0(flow)
	local _0 = _C(32, "IsChildOfCharState", flow, 0, "SNEAK")

	if _0 then
		flow:setActive()
		_A(flow, "SetVisionAreaOverride", "visionAreaNone")

		return true
	else
		flow:setActiveFail()
	end
end

return _M
