-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\ClimbWaterfallPlanFsm\\ClimbWaterfallOnState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AiConst = require("Common.Const.AiConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local AutoPathFindUtils = require("Common.Utils.AutoPathFindUtils")
local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local BehaviorPathMapData = require("Common.Data.BehaviacData.Meta.BehaviorPathMapData")
local BehaviorTreePlanUtils = require("Common.Utils.BehaviorTreePlanUtils")
local EBTStatus = require("Common.AI.Behaviac.Enums").EBTStatus
local VectorPool = require("Common.Container.VectorPool")
local QuaternionPool = require("Common.Container.QuaternionPool")
local TablePool = require("Common.Container.TablePool")
local CLIMB_WATERFALL_STATE = AiConst.CLIMB_WATERFALL_STATE
local ClimbWaterfallOnState = Class.LiteClass("ClimbWaterfallOnState", State)

function ClimbWaterfallOnState:onEnter(controller, oldState)
	ClimbWaterfallOnState.super.onEnter(self, controller, oldState)

	self.x_climbOnPos = VectorPool.getVector()
	self.x_climbOnRot = QuaternionPool.getQuaternion()

	self:__executeClimbOnPos(controller)
end

function ClimbWaterfallOnState:onRun(controller)
	ClimbWaterfallOnState.super.onRun(self, controller)

	if AIControllerUtils.isClimbingWaterfall(controller.climbWaterfallPlan.targetEnt) then
		controller:transitionTo(CLIMB_WATERFALL_STATE.ClimbWaterfallMove)

		return
	end

	self:__executeClimbOnPos(controller)
end

function ClimbWaterfallOnState:onExit(controller)
	ClimbWaterfallOnState.super.onExit(self, controller)
	VectorPool.returnVector(self.x_climbOnPos)
	QuaternionPool.returnQuaternion(self.x_climbOnRot)

	self.x_climbOnPos = nil
	self.x_climbOnRot = nil
end

function ClimbWaterfallOnState:__executeClimbOnPos(controller)
	local subtreeParams = TablePool.getTable()
	local climbWaterfallPlan = controller.climbWaterfallPlan
	local firstPointData = climbWaterfallPlan:getNextPointData(true)
	local secondPointData = climbWaterfallPlan:getNextPointData(false)
	local firstPosData = firstPointData.position
	local secondPosData = secondPointData.position
	local normalData = climbWaterfallPlan:getNormal()
	local entity = climbWaterfallPlan.targetEnt

	Vector3.enableCreateFromCache()

	local firstPos = Vector3.New(firstPosData[1], firstPosData[2], firstPosData[3])
	local secondPos = Vector3.New(secondPosData[1], secondPosData[2], secondPosData[3])
	local normal = Vector3.New(normalData[1], normalData[2], normalData[3])
	local direction = secondPos - firstPos
	local climbOnRot = Quaternion.LookRotation(-normal, direction)
	local climbOnPos = firstPos

	self.x_climbOnPos:Copy(climbOnPos)
	Quaternion.Copy(self.x_climbOnRot, climbOnRot)

	subtreeParams.tClimbWaterfallOnPos = self.x_climbOnPos
	subtreeParams.tClimbWaterfallOnRot = self.x_climbOnRot
	subtreeParams.tClimbWaterfallOnYaw = math.deg(Quaternion.ToYaw(climbOnRot))

	Vector3.disableCreateFromCache()
	BehaviorTreePlanUtils.startEcologyPlanByState(entity.agent, BehaviorPathMapData.EnumNameMap.PBT_ClimbWaterfallOn, subtreeParams)
	TablePool.returnTable(subtreeParams)
end

return ClimbWaterfallOnState
