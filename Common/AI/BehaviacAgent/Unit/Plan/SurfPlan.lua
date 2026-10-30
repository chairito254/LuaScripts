-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\SurfPlan.lua

local Class = require("Core.Framework.Class")
local BaseEcologyPlan = require("Common.AI.BehaviacAgent.Unit.Plan.BaseEcologyPlan")
local AiConst = require("Common.Const.AiConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local SurfPlanFsm = require("Common.AI.BehaviacAgent.Unit.Plan.SurfPlanFsm.SurfPlanFsm")
local routeDefaultValueData = require("Common.Data.Scene.route_default_value_data")
local LoggerManager = require("Core.Log.LoggerManager")
local logger = LoggerManager.getLogger("SurfPlan")
local DEFAULTS = routeDefaultValueData.wayPoints or {}
local ACTION = AiConst.SURF_Action
local SurfPlan = Class.LightClass("SurfPlan", BaseEcologyPlan)

function SurfPlan:getAction(point)
	return point.behaviorPatrolSurfAction or ACTION.SurfLoop
end

function SurfPlan:isSurfPoint(point)
	local moveType = point.behaviorPatrolMoveType or DEFAULTS.behaviorPatrolMoveType or AiConst.EBehaviorPatrolMoveType.Common

	return moveType == AiConst.EBehaviorPatrolMoveType.Surf
end

function SurfPlan:hasBehavior(point)
	local template = point.behaviorTreeTemplate or DEFAULTS.behaviorTreeTemplate

	return template and template.behaviors and #template.behaviors > 0
end

function SurfPlan:recycleInit(patrolPlan)
	self.patrolPlan = patrolPlan
	self.targetEnt = nil
	self.succeeded = false
	self.failed = false

	local data = patrolPlan and patrolPlan.patrolData

	self.wayPoints = data and data.routeData and data.routeData.wayPoints
	self.startIndex = data and data.routeIndex

	if not self.startIndex or self.startIndex < 1 or not self:isSurfPoint(self.wayPoints[self.startIndex]) then
		return false
	end

	self.endIndex = self.startIndex

	for index = self.startIndex, #self.wayPoints do
		local point = self.wayPoints[index]

		if not self:isSurfPoint(point) or index > self.startIndex and self:getAction(point) == ACTION.SurfStart then
			break
		end

		local movingBehavior = point.movingBehaviorTreeTemplate

		if index > self.startIndex and movingBehavior and movingBehavior.behaviors and #movingBehavior.behaviors > 0 then
			break
		end

		local action = self:getAction(point)

		if not AiConst.SURF_ACTION_STATE[action] then
			return false
		end

		self.endIndex = index

		if action == ACTION.SurfStop or self:hasBehavior(point) then
			break
		end
	end

	self.playStart = self:getAction(self.wayPoints[self.startIndex]) == ACTION.SurfStart

	return true
end

function SurfPlan:initPlan(entity)
	if not entity or not entity.eModel or not entity.agent then
		return false
	end

	self.targetEnt = entity
	self.surfPlanFsm = self.surfPlanFsm or SurfPlanFsm.new(self)

	self.surfPlanFsm:start(AiConst.SURF_PLAN_STATE.SurfOn)

	return self.targetEnt ~= nil
end

function SurfPlan:getSpeedRateType(index)
	return self.wayPoints[index].behaviorSpeedRateType or DEFAULTS.behaviorSpeedRateType or BaseEnum.SpeedRateType.Mid
end

function SurfPlan:getSpeed(index)
	local speedRateType = self:getSpeedRateType(index)
	local result

	if speedRateType == BaseEnum.SpeedRateType.Slow then
		result = AIControllerUtils.getWalkSpeed(self.targetEnt)
	elseif speedRateType == BaseEnum.SpeedRateType.Fast then
		result = AIControllerUtils.getSprintSpeed(self.targetEnt)
	elseif speedRateType == BaseEnum.SpeedRateType.Burst then
		result = AIControllerUtils.getSpeedBurstSpeed(self.targetEnt)
	else
		result = AIControllerUtils.getRunSpeed(self.targetEnt)
	end

	return type(result) == "number" and result > 0 and result or 8
end

function SurfPlan:tryRunPlan()
	if not self.targetEnt then
		return false
	end

	self.surfPlanFsm:onRun()

	return self.targetEnt ~= nil
end

function SurfPlan:complete()
	self.patrolPlan:setRouteIndex(self.endIndex)

	self.succeeded = true

	self.surfPlanFsm:transitionTo(AiConst.SURF_PLAN_STATE.SurfDisable)
end

function SurfPlan:fail(reason)
	self.failed = true

	self.surfPlanFsm:transitionTo(AiConst.SURF_PLAN_STATE.SurfDisable)
end

function SurfPlan:breakPlan()
	if self.targetEnt then
		self.surfPlanFsm:releaseMovement()
	end

	self.targetEnt = nil
	self.patrolPlan = nil
	self.wayPoints = nil
end

function SurfPlan:getPlanType()
	return AiConst.ParmonPlanType.SurfPlan
end

return SurfPlan
