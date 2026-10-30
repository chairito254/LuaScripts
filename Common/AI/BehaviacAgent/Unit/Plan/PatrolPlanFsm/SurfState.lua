-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\PatrolPlanFsm\\SurfState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AiConst = require("Common.Const.AiConst")
local PlanPool = require("Common.AI.BehaviacAgent.Unit.Plan.PlanPool")
local routeDefaultValueData = require("Common.Data.Scene.route_default_value_data")
local DEFAULTS = routeDefaultValueData.wayPoints or {}
local PATROL_STATE = AiConst.PATROL_STATE
local SurfState = Class.LiteClass("SurfState", State)

function SurfState:onEnter(controller)
	self.x_surfPlan = PlanPool.getNewPlan(AiConst.ParmonPlanType.SurfPlan, controller.patrolPlan)

	if not self.x_surfPlan or not self.x_surfPlan:initPlan(controller.patrolPlan.targetEnt) then
		controller:transitionTo(PATROL_STATE.Disable)
	end
end

function SurfState:onRun(controller)
	local plan = self.x_surfPlan

	if not plan or plan:tryRunPlan() then
		return
	end

	if not plan.succeeded then
		controller:transitionTo(PATROL_STATE.Disable)

		return
	end

	local patrolPlan = controller.patrolPlan
	local point = patrolPlan.patrolData.routeData.wayPoints[patrolPlan.patrolData.routeIndex]

	controller:transitionTo((point.inexecutionAction or DEFAULTS.inexecutionAction) and PATROL_STATE.WayPointBehavior or PATROL_STATE.WayPointBehaviorTurn)
end

function SurfState:onExit(controller)
	PlanPool.returnPlan(self.x_surfPlan)

	self.x_surfPlan = nil
end

return SurfState
