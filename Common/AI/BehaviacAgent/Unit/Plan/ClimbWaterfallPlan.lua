-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\ClimbWaterfallPlan.lua

local class = require("Core.Framework.Class")
local BaseEcologyPlan = require("Common.AI.BehaviacAgent.Unit.Plan.BaseEcologyPlan")
local AiConst = require("Common.Const.AiConst")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local AIBaseMethodUtils = require("Common.AI.BehaviacAgent.Unit.AIBaseMethodUtils")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local ParmonBehaviorData = require("Data.parmon_behavior_data")
local PatrolConst = require("Common.Const.PatrolConst")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local ClimbWaterfallPlanFsm = require("Common.AI.BehaviacAgent.Unit.Plan.ClimbWaterfallPlanFsm.ClimbWaterfallPlanFsm")
local CLIMB_WATERFALL_STATE = AiConst.CLIMB_WATERFALL_STATE
local CommonConst = require("Common.Const.Const")
local logger = LoggerManager.getLogger("ClimbWaterfallPlan")
local ClimbWaterfallPlan = class.LightClass("ClimbWaterfallPlan", BaseEcologyPlan)

function ClimbWaterfallPlan:recycleInit(dataId, climbWaterfallData, behaviorId)
	ClimbWaterfallPlan.super.ctor(self)

	local referenceData = behaviorId and ParmonBehaviorData[behaviorId] or AiConst.DefaultNullTable

	if self.climbWaterfallData then
		self.climbWaterfallData.dataId = dataId
		self.climbWaterfallData.data = climbWaterfallData
		self.climbWaterfallData.behaviorId = behaviorId
		self.climbWaterfallData.priority = referenceData.priority or PatrolConst.DEFAULT_PRIORITY
		self.climbWaterfallData.interruptType = referenceData.interruptType or AiConst.AIBeInterruptedType.CanInterruptedByHighPriority
		self.climbWaterfallData.pointIndex = 1
	else
		self.climbWaterfallData = {
			pointIndex = 1,
			dataId = dataId,
			data = climbWaterfallData,
			behaviorId = behaviorId,
			priority = referenceData.priority or PatrolConst.DEFAULT_PRIORITY,
			interruptType = referenceData.interruptType or AiConst.AIBeInterruptedType.CanInterruptedByHighPriority
		}
	end

	self.targetEnt = nil

	return true
end

function ClimbWaterfallPlan:getPriority()
	return self.climbWaterfallData.priority
end

function ClimbWaterfallPlan:getInterruptType()
	return self.climbWaterfallData.interruptType
end

function ClimbWaterfallPlan:initPlan(entity)
	if not entity then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("climb waterfall plan init error: entity is nil")
		end

		return false
	end

	if not self.climbWaterfallPlanFsm then
		self.climbWaterfallPlanFsm = ClimbWaterfallPlanFsm.new(self)
	end

	ClimbWaterfallPlan.super.initPlan(self, entity)

	self.targetEnt = entity

	self.climbWaterfallPlanFsm:start(CLIMB_WATERFALL_STATE.ClimbWaterfallOn)

	return true
end

function ClimbWaterfallPlan:tryRunPlan()
	if not self:isActive() then
		return false
	end

	self.climbWaterfallPlanFsm:onRun()

	return self:isActive()
end

function ClimbWaterfallPlan:isActive()
	return not self.climbWaterfallPlanFsm:checkIsCurState(CLIMB_WATERFALL_STATE.ClimbWaterfallDisable)
end

function ClimbWaterfallPlan:breakPlan()
	if self.targetEnt == nil then
		return
	end

	local ent = self.targetEnt
	local eModel = ent.eModel

	if eModel and AIControllerUtils.isClimbingWaterfall(ent) then
		eModel:CancelClimbWaterfall(CommonConst.COMPONENT_AI_CONTROLLER)
	end

	self.targetEnt = nil

	ClimbWaterfallPlan.super.breakPlan(self)
	ent:clearCurrentAIParmonPlan(self)
end

function ClimbWaterfallPlan:getNextPointData(autoAddIndex)
	local pointIndex = self.climbWaterfallData.pointIndex
	local pointData = self.climbWaterfallData.data.points[pointIndex]

	if pointData and autoAddIndex then
		self.climbWaterfallData.pointIndex = pointIndex + 1
	end

	return pointData
end

function ClimbWaterfallPlan:getNormal()
	return self.climbWaterfallData.data.normal
end

function ClimbWaterfallPlan:getPlanType()
	return AiConst.ParmonPlanType.ClimbWaterfallPlan
end

function ClimbWaterfallPlan:getID()
	return self.climbWaterfallData.behaviorId
end

function ClimbWaterfallPlan:getClimbWaterfallEndType()
	return self.climbWaterfallData.data.endType
end

return ClimbWaterfallPlan
