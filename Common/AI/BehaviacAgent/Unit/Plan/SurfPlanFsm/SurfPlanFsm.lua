-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\Plan\\SurfPlanFsm\\SurfPlanFsm.lua

local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local FiniteStateMachine = require("Common.Container.FSM.FiniteStateMachine")
local AiConst = require("Common.Const.AiConst")
local Const = require("Common.Const.Const")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local AutoPathFindUtils = require("Common.Utils.AutoPathFindUtils")
local BehaviorTreePlanUtils = require("Common.Utils.BehaviorTreePlanUtils")
local BehaviorPathMapData = require("Common.Data.BehaviacData.Meta.BehaviorPathMapData")
local BehaviacCommon = require("Common.AI.Behaviac.Common")
local SurfOnState = require("Common.AI.BehaviacAgent.Unit.Plan.SurfPlanFsm.SurfOnState")
local SurfMoveState = require("Common.AI.BehaviacAgent.Unit.Plan.SurfPlanFsm.SurfMoveState")
local SurfOffState = require("Common.AI.BehaviacAgent.Unit.Plan.SurfPlanFsm.SurfOffState")
local SurfDisableState = require("Common.AI.BehaviacAgent.Unit.Plan.SurfPlanFsm.SurfDisableState")
local SurfPlanFsm = Class.LiteClass("SurfPlanFsm", FiniteStateMachine)

function SurfPlanFsm:ctor(plan)
	FiniteStateMachine.ctor(self)

	self.surfPlan = plan
	self.motionEvent = CallbackHandler(self, "onMotionEvent")

	self:addState(SurfOnState.new(AiConst.SURF_PLAN_STATE.SurfOn))
	self:addState(SurfMoveState.new(AiConst.SURF_PLAN_STATE.SurfMove))
	self:addState(SurfOffState.new(AiConst.SURF_PLAN_STATE.SurfOff))
	self:addState(SurfDisableState.new(AiConst.SURF_PLAN_STATE.SurfDisable))
	self:addTransitionByStateName(AiConst.SURF_PLAN_STATE.SurfOn, AiConst.SURF_PLAN_STATE.SurfMove)
	self:addTransitionByStateName(AiConst.SURF_PLAN_STATE.SurfMove, AiConst.SURF_PLAN_STATE.SurfOff)
	self:addAnyState2StateTransition(AiConst.SURF_PLAN_STATE.SurfDisable)
end

function SurfPlanFsm:start(state)
	self.requestId = nil
	self.currentIndex = nil
	self.pendingAction = nil
	self.deadline = BehaviacCommon.getClock() + AiConst.PATROL_MOVE_MAX_TIME * 1000

	SurfPlanFsm.super.start(self, state)
end

function SurfPlanFsm:waitForNextRun()
	if not BehaviorTreePlanUtils.startEcologyPlanByState(self.surfPlan.targetEnt.agent, BehaviorPathMapData.EnumNameMap.PBT_Noop) then
		self.surfPlan:fail("无法替换临时子任务~")
	end
end

function SurfPlanFsm:startSurf()
	local plan = self.surfPlan
	local entity = plan.targetEnt

	if not entity:getConfigData().canSurf or AutoPathFindUtils.isAutoPathFinding(entity) then
		return false
	end

	local position = entity:getPosition()

	self.segmentX, self.segmentZ = position[1], position[3]
	self.velocityX, self.velocityZ = 0, 0
	self.pendingAction = nil
	self.currentIndex = plan.startIndex

	local requestId = entity.eModel:StartSurfMotion(Const.COMPONENT_AI_CONTROLLER, self.motionEvent, plan.playStart)

	if not requestId or requestId == 0 then
		return false
	end

	self.requestId = requestId
	self.lastVelocityX, self.lastVelocityZ = nil

	self:syncRouteIndex()
	self:updateMotion(position)

	return self.requestId ~= nil
end

function SurfPlanFsm:syncRouteIndex()
	local plan = self.surfPlan

	plan.patrolPlan:setRouteIndex(math.min(self.currentIndex, plan.endIndex))

	self.deadline = BehaviacCommon.getClock() + AiConst.PATROL_MOVE_MAX_TIME * 1000
end

function SurfPlanFsm:switchNextPointIndex()
	local point = self.surfPlan.wayPoints[self.currentIndex]

	self.segmentX, self.segmentZ = point.position[1], point.position[3]
	self.currentIndex = self.currentIndex + 1

	self:syncRouteIndex()
end

function SurfPlanFsm:onRun(...)
	SurfPlanFsm.super.onRun(self, ...)

	if self:checkIsCurState(AiConst.SURF_PLAN_STATE.SurfMove) and self.requestId and not self.pendingAction and self.currentIndex <= self.surfPlan.endIndex then
		local ok, err = xpcall(self.updateMotion, debug.traceback, self)

		if not ok then
			self:releaseMovement()
			error(err)
		end
	end
end

function SurfPlanFsm:onMotionEvent(requestId, landed, position)
	if requestId ~= self.requestId or not landed or self.pendingAction ~= CharacterStateConst.SURFJUMP then
		return
	end

	self.pendingAction = nil

	self:switchNextPointIndex()

	self.lastVelocityX = nil
	self.lastVelocityZ = nil

	self:updateMotion(position)
end

function SurfPlanFsm:updateMotion(position)
	local plan = self.surfPlan

	position = position or plan.targetEnt:getPosition()

	if not self.pendingAction then
		while self.currentIndex <= plan.endIndex do
			local point = plan.wayPoints[self.currentIndex]
			local action = plan:getAction(point)

			self.speed = plan:getSpeed(self.currentIndex)

			local x, z = point.position[1], point.position[3]
			local dx, dz = x - position.x, z - position.z
			local sx, sz = x - self.segmentX, z - self.segmentZ
			local distanceSq = dx * dx + dz * dz
			local segmentSq = sx * sx + sz * sz
			local reached = distanceSq <= 1e-05 or segmentSq <= 1e-05 or dx * sx + dz * sz <= 0

			if not reached then
				local scale = self.speed / math.sqrt(distanceSq)

				self.velocityX, self.velocityZ = dx * scale, dz * scale

				if action == AiConst.SURF_Action.SurfJump then
					self.pendingAction = CharacterStateConst.SURFJUMP
				end

				break
			end

			if action == AiConst.SURF_Action.SurfJump or action == AiConst.SURF_Action.SurfStop then
				if self.velocityX * self.velocityX + self.velocityZ * self.velocityZ <= 1e-05 and segmentSq <= 1e-05 then
					local forward = plan.targetEnt:getForward()

					sx, sz = forward.x, forward.z
					segmentSq = sx * sx + sz * sz
				end

				self.pendingAction = AiConst.SURF_ACTION_STATE[action]

				break
			end

			self:switchNextPointIndex()
		end
	end

	local finished = self.currentIndex > plan.endIndex

	if finished and self.velocityX * self.velocityX + self.velocityZ * self.velocityZ > 1e-05 then
		self.pendingAction = CharacterStateConst.SURFSTOP
		finished = false
	end

	if finished then
		self.velocityX, self.velocityZ = 0, 0
	end

	local jumpHeightScale = self.pendingAction == CharacterStateConst.SURFJUMP and plan.wayPoints[self.currentIndex].surfJumpHeightScale or 1

	if not self.lastVelocityX or math.abs(self.velocityX - self.lastVelocityX) > 0.0001 or math.abs(self.velocityZ - self.lastVelocityZ) > 0.0001 or self.pendingAction or finished then
		if not plan.targetEnt.eModel:SetSurfMotion(Const.COMPONENT_AI_CONTROLLER, self.requestId, self.velocityX, self.velocityZ, self.pendingAction or 0, jumpHeightScale, finished) then
			self:releaseMovement()

			return
		end

		self.lastVelocityX, self.lastVelocityZ = self.velocityX, self.velocityZ
	end
end

function SurfPlanFsm:getMovementStatus()
	if not self.requestId then
		return false, 0, false
	end

	local plan = self.surfPlan
	local valid, completed = plan.targetEnt.eModel:GetSurfMotionStatus(Const.COMPONENT_AI_CONTROLLER, self.requestId)

	return valid, math.min(self.currentIndex, plan.endIndex), completed
end

function SurfPlanFsm:releaseMovement()
	if self.requestId then
		self.surfPlan.targetEnt.eModel:CancelSurfMotion(Const.COMPONENT_AI_CONTROLLER, self.requestId)
	end

	self.requestId = nil
	self.currentIndex = nil
	self.pendingAction = nil
end

return SurfPlanFsm
