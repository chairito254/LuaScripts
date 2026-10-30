-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\ClimbWaterfallPlanFsm\\ClimbWaterfallMoveState.lua

local Class = require("Core.Framework.Class")
local State = require("Common.Container.FSM.State")
local AiConst = require("Common.Const.AiConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local BehaviorPathMapData = require("Common.Data.BehaviacData.Meta.BehaviorPathMapData")
local BehaviorTreePlanUtils = require("Common.Utils.BehaviorTreePlanUtils")
local EBTStatus = require("Common.AI.Behaviac.Enums").EBTStatus
local ListPool = require("Common.Container.ListPool")
local VectorPool = require("Common.Container.VectorPool")
local TablePool = require("Common.Container.TablePool")
local CLIMB_WATERFALL_STATE = AiConst.CLIMB_WATERFALL_STATE
local SpeedRateType = BaseEnum.SpeedRateType
local ClimbWaterfallMoveState = Class.LiteClass("ClimbWaterfallMoveState", State)

function ClimbWaterfallMoveState:onEnter(controller, oldState)
	ClimbWaterfallMoveState.super.onEnter(self, controller, oldState)

	if not self:_startNextSegment(controller) then
		controller:transitionTo(CLIMB_WATERFALL_STATE.ClimbWaterfallOff)
	end
end

function ClimbWaterfallMoveState:onRun(controller)
	ClimbWaterfallMoveState.super.onRun(self, controller)
	self:_releaseSegment()

	if not self:_startNextSegment(controller) then
		controller:transitionTo(CLIMB_WATERFALL_STATE.ClimbWaterfallOff)
	end
end

function ClimbWaterfallMoveState:onExit(controller, nextState)
	ClimbWaterfallMoveState.super.onExit(self, controller, nextState)
	self:_releaseSegment()
end

function ClimbWaterfallMoveState:_startNextSegment(controller)
	local climbWaterfallPlan = controller.climbWaterfallPlan
	local firstPointData = climbWaterfallPlan:getNextPointData(false)

	if not firstPointData then
		return false
	end

	self.x_climbPointList = ListPool.getList(3)
	self.x_climbNormalList = ListPool.getList(3)
	self.x_speedRateType = math.max(math.min(firstPointData.speedRateType, SpeedRateType.Fast), SpeedRateType.Slow)

	local normalData = climbWaterfallPlan:getNormal()

	Vector3.enableCreateFromCache()

	while true do
		local pointData = climbWaterfallPlan:getNextPointData(false)

		if not pointData then
			break
		end

		local speedRateType = math.max(math.min(pointData.speedRateType, SpeedRateType.Fast), SpeedRateType.Slow)

		if speedRateType ~= self.x_speedRateType then
			break
		end

		climbWaterfallPlan:getNextPointData(true)

		local position = pointData.position

		self.x_climbPointList[#self.x_climbPointList + 1] = VectorPool.getVector(3, Vector3.New(position[1], position[2], position[3]))
		self.x_climbNormalList[#self.x_climbNormalList + 1] = VectorPool.getVector(3, Vector3.New(normalData[1], normalData[2], normalData[3]))
	end

	Vector3.disableCreateFromCache()

	local subtreeParams = TablePool.getTable()

	subtreeParams.tTargetPosList = self.x_climbPointList
	subtreeParams.tNormalList = self.x_climbNormalList
	subtreeParams.tSpeedRateType = self.x_speedRateType
	subtreeParams.tSpeed = AIControllerUtils.getClimbWaterfallSpeed(climbWaterfallPlan.targetEnt, self.x_speedRateType, true)

	BehaviorTreePlanUtils.startEcologyPlanByState(climbWaterfallPlan.targetEnt.agent, BehaviorPathMapData.EnumNameMap.PBT_ClimbWaterfallMove, subtreeParams)
	TablePool.returnTable(subtreeParams)

	return true
end

function ClimbWaterfallMoveState:_releaseSegment()
	if self.x_climbNormalList then
		for index = #self.x_climbNormalList, 1, -1 do
			VectorPool.returnVector(self.x_climbNormalList[index])

			self.x_climbNormalList[index] = nil
		end

		ListPool.returnList(self.x_climbNormalList, 3)

		self.x_climbNormalList = nil
	end

	if self.x_climbPointList then
		for index = #self.x_climbPointList, 1, -1 do
			VectorPool.returnVector(self.x_climbPointList[index])

			self.x_climbPointList[index] = nil
		end

		ListPool.returnList(self.x_climbPointList, 3)

		self.x_climbPointList = nil
	end

	self.x_speedRateType = nil
end

return ClimbWaterfallMoveState
