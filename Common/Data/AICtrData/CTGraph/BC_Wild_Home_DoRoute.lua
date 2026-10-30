-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\CTGraph\\BC_Wild_Home_DoRoute.lua

local CTHelper = require("Common.AI.ConditionTrigger.CTHelper")
local _M = {}
local _P = CTHelper.DoPatrolBehavior
local _A = CTHelper.DoAction

function _M.executeEventTrigger(flow, eventName)
	if eventName == "Msg_Home_Return_Area" then
		return _M._to_5_0(flow)
	end
end

function _M.executeEndTrigger(flow)
	flow:setActive()
	_A(flow, "FinishHomeLandOperation", false)

	return true
end

function _M.executeContinue(flow, nodeId)
	if nodeId == 5 then
		return true
	end
end

function _M.checkInterrupt(flow, nodeId)
	return
end

function _M._to_5_0(flow)
	if flow.__isAdditive then
		return
	end

	flow:setActive()

	local _0 = flow:getContextValue("routeId")

	if _P(flow, 1, _0, 1, nil) then
		flow:setContinue(5)

		return true
	end
end

return _M
