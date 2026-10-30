-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\SurfPlanFsm\\SurfMoveState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AiConst = require("Common.Const.AiConst")
local BehaviacCommon = require("Common.AI.Behaviac.Common")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local SurfMoveState = Class.LiteClass("SurfMoveState", State)

function SurfMoveState:onEnter(controller)
	return
end

function SurfMoveState:onRun(controller)
	local valid, index, completed = controller:getMovementStatus()

	if not valid then
		controller.surfPlan:fail("冲浪打断")

		return
	end

	local currentState = AIControllerUtils.getCurrentAnimationState(controller.surfPlan.targetEnt)
	local isFinalState = index == controller.surfPlan.endIndex and (currentState == CharacterStateConst.SURFJUMP or currentState == CharacterStateConst.SURFFALL or currentState == CharacterStateConst.SURFSTOP)

	if completed or isFinalState then
		controller:transitionTo(AiConst.SURF_PLAN_STATE.SurfOff)
	elseif BehaviacCommon.getClock() > controller.deadline then
		controller.surfPlan:fail("冲浪点超时")
	end
end

return SurfMoveState
