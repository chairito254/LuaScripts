-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Controller\\VehicleRiderAnimationController.lua

local AnimationUtils = require("Common.Utils.AnimationUtils")
local Class = require("Core.Framework.Class")
local PlayableConst = require("Common.Const.PlayableConst")
local AnimationLayer = PlayableConst.AnimationLayer.HUMAN_LAYER_BASE
local AnimationState = {
	START = 1,
	IDLE = 0,
	ENDING = 3,
	LOOP = 2
}
local VehicleRiderAnimationController = Class.LightClass("VehicleRiderAnimationController")

function VehicleRiderAnimationController:ctor(pawn, animationData)
	self.pawn = pawn
	self.idleKey = AnimationUtils.getID(animationData.idleAnim)
	self.startKey = AnimationUtils.getID(animationData.startAnim)
	self.loopKey = AnimationUtils.getID(animationData.loopAnim)
	self.endKey = AnimationUtils.getID(animationData.endAnim)
	self.state = AnimationState.IDLE
	self.wantMoving = false
	self.active = false
	self.playRevision = 0
	self.playableState = nil
end

function VehicleRiderAnimationController:enter(isMoving)
	if self.active then
		return
	end

	self.active = true
	self.wantMoving = isMoving == true

	if self.wantMoving then
		self:playStart()
	else
		self:playIdle()
	end
end

function VehicleRiderAnimationController:exit()
	self.active = false
	self.wantMoving = false
	self.playRevision = self.playRevision + 1

	if NotNil(self.playableState) then
		self.playableState:RemoveEndCallback()
		self.playableState:RemoveAutoTransition()
	end

	self.playableState = nil
end

function VehicleRiderAnimationController:setMoving(isMoving)
	self.wantMoving = isMoving

	if not self.active then
		return
	end

	if isMoving then
		if self.state == AnimationState.IDLE or self.state == AnimationState.ENDING then
			self:playStart()
		end

		return
	end

	if self.state == AnimationState.START or self.state == AnimationState.LOOP then
		self:playEnd()
	end
end

function VehicleRiderAnimationController:playPhase(animationState, animationKey, isLoop)
	local playableState = self.pawn:playAnimation(animationKey, true, nil, isLoop, AnimationLayer)

	if IsNil(playableState) then
		return nil, self.playRevision
	end

	self.state = animationState
	self.playRevision = self.playRevision + 1

	local revision = self.playRevision

	self.playableState = playableState

	playableState:RemoveEndCallback()
	playableState:RemoveAutoTransition()
	playableState:SetLogicLoop(isLoop)

	return playableState, revision
end

function VehicleRiderAnimationController:bindPhaseEnd(playableState, revision, callback)
	self.pawn:setAnimationSequence(playableState, playableState.Length, function(stateTime)
		local completedCurrentPhase = stateTime >= 0 and self.active and self.playRevision == revision and self.playableState == playableState

		if not completedCurrentPhase then
			return true
		end

		callback()

		return false
	end)
end

function VehicleRiderAnimationController:playIdle()
	self:playPhase(AnimationState.IDLE, self.idleKey, true)
end

function VehicleRiderAnimationController:playStart()
	local playableState, revision = self:playPhase(AnimationState.START, self.startKey, false)

	if IsNil(playableState) then
		return
	end

	self:bindPhaseEnd(playableState, revision, function()
		if self.wantMoving then
			self:playLoop()
		else
			self:playEnd()
		end
	end)
end

function VehicleRiderAnimationController:playLoop()
	self:playPhase(AnimationState.LOOP, self.loopKey, true)
end

function VehicleRiderAnimationController:playEnd()
	local playableState, revision = self:playPhase(AnimationState.ENDING, self.endKey, false)

	if IsNil(playableState) then
		return
	end

	self:bindPhaseEnd(playableState, revision, function()
		if self.wantMoving then
			self:playStart()
		else
			self:playIdle()
		end
	end)
end

return VehicleRiderAnimationController
