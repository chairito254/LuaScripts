-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\ClimbWaterfallPlanFsm\\ClimbWaterfallPlanFsm.lua

local Class = require("Core.Framework.Class")
local FiniteStateMachine = require("Common.Container.FSM.FiniteStateMachine")
local CLIMB_WATERFALL_STATE = require("Common.Const.AiConst").CLIMB_WATERFALL_STATE
local ClimbWaterfallOnState = require("Common.AI.BehaviacAgent.Unit.Plan.ClimbWaterfallPlanFsm.ClimbWaterfallOnState")
local ClimbWaterfallMoveState = require("Common.AI.BehaviacAgent.Unit.Plan.ClimbWaterfallPlanFsm.ClimbWaterfallMoveState")
local ClimbWaterfallOffState = require("Common.AI.BehaviacAgent.Unit.Plan.ClimbWaterfallPlanFsm.ClimbWaterfallOffState")
local ClimbWaterfallDisableState = require("Common.AI.BehaviacAgent.Unit.Plan.ClimbWaterfallPlanFsm.ClimbWaterfallDisableState")
local ClimbWaterfallPlanFsm = Class.LiteClass("ClimbWaterfallPlanFsm", FiniteStateMachine)

function ClimbWaterfallPlanFsm:ctor(climbWaterfallPlan)
	FiniteStateMachine.ctor(self)

	self.climbWaterfallPlan = climbWaterfallPlan

	self:addState(ClimbWaterfallOnState.new(CLIMB_WATERFALL_STATE.ClimbWaterfallOn))
	self:addState(ClimbWaterfallMoveState.new(CLIMB_WATERFALL_STATE.ClimbWaterfallMove))
	self:addState(ClimbWaterfallOffState.new(CLIMB_WATERFALL_STATE.ClimbWaterfallOff))
	self:addState(ClimbWaterfallDisableState.new(CLIMB_WATERFALL_STATE.ClimbWaterfallDisable))
	self:addTransitionByStateName(CLIMB_WATERFALL_STATE.ClimbWaterfallOn, CLIMB_WATERFALL_STATE.ClimbWaterfallMove)
	self:addTransitionByStateName(CLIMB_WATERFALL_STATE.ClimbWaterfallMove, CLIMB_WATERFALL_STATE.ClimbWaterfallOff)
	self:addTransitionByStateName(CLIMB_WATERFALL_STATE.ClimbWaterfallOff, CLIMB_WATERFALL_STATE.ClimbWaterfallDisable)
end

return ClimbWaterfallPlanFsm
