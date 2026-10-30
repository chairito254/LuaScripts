-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\ClimbWaterfallPlanFsm\\ClimbWaterfallOffState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AiConst = require("Common.Const.AiConst")
local BehaviorPathMapData = require("Common.Data.BehaviacData.Meta.BehaviorPathMapData")
local BehaviorTreePlanUtils = require("Common.Utils.BehaviorTreePlanUtils")
local EBTStatus = require("Common.AI.Behaviac.Enums").EBTStatus
local TablePool = require("Common.Container.TablePool")
local CLIMB_WATERFALL_STATE = AiConst.CLIMB_WATERFALL_STATE
local ClimbWaterfallOffState = Class.LiteClass("ClimbWaterfallOffState", State)

function ClimbWaterfallOffState:onEnter(controller, oldState)
	ClimbWaterfallOffState.super.onEnter(self, controller, oldState)

	local subtreeParams = TablePool.getTable()

	subtreeParams.tClimbWaterfallEndType = controller.climbWaterfallPlan:getClimbWaterfallEndType()

	BehaviorTreePlanUtils.startEcologyPlanByState(controller.climbWaterfallPlan.targetEnt.agent, BehaviorPathMapData.EnumNameMap.PBT_ClimbWaterfallOff, subtreeParams)
	TablePool.returnTable(subtreeParams)
end

function ClimbWaterfallOffState:onRun(controller)
	ClimbWaterfallOffState.super.onRun(self, controller)
	controller:transitionTo(CLIMB_WATERFALL_STATE.ClimbWaterfallDisable)
end

return ClimbWaterfallOffState
