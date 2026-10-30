-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\SurfPlanFsm\\SurfOnState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AiConst = require("Common.Const.AiConst")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local BehaviacCommon = require("Common.AI.Behaviac.Common")
local SurfOnState = Class.LiteClass("SurfOnState", State)

function SurfOnState:onEnter(controller)
	controller:waitForNextRun()
end

function SurfOnState:onRun(controller)
	local plan = controller.surfPlan
	local entity = plan.targetEnt

	if BehaviacCommon.getClock() > controller.deadline then
		plan:fail("超时")

		return
	end

	if plan.playStart then
		local current = AIControllerUtils.getCurrentAnimationState(entity)

		if CharacterStateConst.getParentState(current) == CharacterStateConst.SURF then
			return
		end
	end

	if controller:startSurf() then
		controller:transitionTo(AiConst.SURF_PLAN_STATE.SurfMove)
	else
		plan:fail("无法进入冲浪")
	end
end

return SurfOnState
