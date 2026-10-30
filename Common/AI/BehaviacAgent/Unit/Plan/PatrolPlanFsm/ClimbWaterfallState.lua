-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\PatrolPlanFsm\\ClimbWaterfallState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AIUtils = require("Common.Utils.AIUtils")
local AiConst = require("Common.Const.AiConst")
local PlanPool = require("Common.AI.BehaviacAgent.Unit.Plan.PlanPool")
local routeDefaultValueData = require("Common.Data.Scene.route_default_value_data")
local PATROL_STATE = AiConst.PATROL_STATE
local WAY_POINT_DEFAULTS = routeDefaultValueData and routeDefaultValueData.wayPoints or {}
local ClimbWaterfallState = Class.LiteClass("ClimbWaterfallState", State)

function ClimbWaterfallState:onEnter(controller, oldState)
	ClimbWaterfallState.super.onEnter(self, controller, oldState)

	local patrolPlan = controller.patrolPlan
	local wayPointData = patrolPlan.patrolData.routeData.wayPoints[patrolPlan.patrolData.routeIndex]
	local climbWaterfallDataId = wayPointData.climbWaterfallDataId or WAY_POINT_DEFAULTS.climbWaterfallDataId
	local climbWaterfallData = AIUtils.getClimbWaterfallData(patrolPlan.targetEnt, climbWaterfallDataId)

	if not climbWaterfallData then
		controller:transitionTo(PATROL_STATE.Disable)

		return
	end

	self.x_climbWaterfallPlan = PlanPool.getNewPlan(AiConst.ParmonPlanType.ClimbWaterfallPlan, climbWaterfallDataId, climbWaterfallData)

	self.x_climbWaterfallPlan:initPlan(patrolPlan.targetEnt)
end

function ClimbWaterfallState:onRun(controller)
	ClimbWaterfallState.super.onRun(self, controller)

	local ret = self.x_climbWaterfallPlan:tryRunPlan()

	if not ret then
		local patrolData = controller.patrolPlan.patrolData
		local wayPointData = patrolData.routeData.wayPoints[patrolData.routeIndex]
		local inexecutionAction = wayPointData.inexecutionAction or WAY_POINT_DEFAULTS.inexecutionAction

		if inexecutionAction then
			controller:transitionTo(PATROL_STATE.WayPointBehavior)
		else
			controller:transitionTo(PATROL_STATE.WayPointBehaviorTurn)
		end
	end
end

function ClimbWaterfallState:onExit(controller, nextState)
	ClimbWaterfallState.super.onExit(self, controller, nextState)
	PlanPool.returnPlan(self.x_climbWaterfallPlan)

	self.x_climbWaterfallPlan = nil
end

return ClimbWaterfallState
