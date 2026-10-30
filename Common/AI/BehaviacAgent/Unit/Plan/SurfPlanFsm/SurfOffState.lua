-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\SurfPlanFsm\\SurfOffState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local BehaviacCommon = require("Common.AI.Behaviac.Common")
local SurfOffState = Class.LiteClass("SurfOffState", State)

function SurfOffState:onEnter(controller)
	return
end

function SurfOffState:onRun(controller)
	local valid, _, completed = controller:getMovementStatus()

	if valid and completed then
		controller.surfPlan:complete()
	elseif not valid or BehaviacCommon.getClock() > controller.deadline then
		controller.surfPlan:fail("冲浪计划操作中断或超时~")
	end
end

return SurfOffState
