-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\VehicleEntities\\ClientVehicleRideComponent.lua

local Class = require("Core.Framework.Class")
local NoticeDef = require("Common.NoticeDef")
local MessageName = require("Const.MessageName")
local SpecialVehicleRideConst = require("Common.Const.SpecialVehicleRideConst")
local RideState = SpecialVehicleRideConst.RideState
local MotionState = SpecialVehicleRideConst.MotionState
local ClientVehicleRideComponent = Class.Component("ClientVehicleRideComponent")

function ClientVehicleRideComponent:ctor()
	self.vehicleRideManaged = false
	self.vehicleRideState = RideState.IDLE
	self.vehicleRideDriverActorId = 0
	self.vehicleRideSessionId = 0
	self.vehicleRideRevision = 0
	self.vehicleRideMotionState = MotionState.IDLE
	self.vehicleRideMotionSequence = 0
	self.vehicleRideExitRequestId = 0
	self.vehicleRideExitEvent = nil
end

function ClientVehicleRideComponent:init(dict)
	self.vehicleRideManaged = dict.rideManaged == true
	self.vehicleRideState = dict.rideState or RideState.IDLE
	self.vehicleRideDriverActorId = dict.rideDriverActorId or 0
	self.vehicleRideSessionId = dict.rideSessionId or 0
	self.vehicleRideRevision = dict.rideRevision or 0
	self.vehicleRideMotionState = dict.rideMotionState or MotionState.IDLE
	self.vehicleRideMotionSequence = dict.rideMotionSequence or 0

	return true
end

function ClientVehicleRideComponent:isSpecialVehicleRide()
	return self:getVehicleConfig().specialVehicleRide == true
end

function ClientVehicleRideComponent:isManagedVehicleRide()
	return self.vehicleRideManaged or self:isSpecialVehicleRide()
end

function ClientVehicleRideComponent:isVehicleRideOwner(uid)
	return uid == self.ownerUid
end

function ClientVehicleRideComponent:isVehicleRideDriver(actorId)
	return self.vehicleRideSessionId ~= 0 and self.vehicleRideDriverActorId == actorId
end

function ClientVehicleRideComponent:isActiveVehicleRideDriver(actorId)
	return self.vehicleRideState == RideState.ACTIVE and self:isVehicleRideDriver(actorId)
end

function ClientVehicleRideComponent:isVehicleRideExitPending(actorId)
	return self.vehicleRideDriverActorId == actorId and self.vehicleRideExitRequestId ~= 0
end

function ClientVehicleRideComponent:isVehicleRideExitPendingForEvent(actorId, event)
	return self:isVehicleRideExitPending(actorId) and self.vehicleRideExitEvent == event
end

function ClientVehicleRideComponent:applyVehicleRideSnapshot(snapshot)
	if snapshot.revision < self.vehicleRideRevision then
		return
	end

	local previousSessionId = self.vehicleRideSessionId
	local previousDriverActorId = self.vehicleRideDriverActorId
	local previousRideState = self.vehicleRideState
	local activeStateChanged = previousRideState == RideState.ACTIVE ~= (snapshot.rideState == RideState.ACTIVE)
	local motionChanged = previousSessionId ~= snapshot.sessionId or previousDriverActorId ~= snapshot.driverActorId or self.vehicleRideMotionState ~= snapshot.motionState or activeStateChanged

	if previousSessionId ~= snapshot.sessionId and previousDriverActorId ~= 0 then
		self:onVehicleMoveStateChanged(false)
	end

	self.vehicleRideManaged = snapshot.rideManaged == true
	self.vehicleRideState = snapshot.rideState
	self.vehicleRideDriverActorId = snapshot.driverActorId
	self.vehicleRideSessionId = snapshot.sessionId
	self.vehicleRideRevision = snapshot.revision
	self.vehicleRideMotionState = snapshot.motionState
	self.vehicleRideMotionSequence = snapshot.motionSequence

	if previousSessionId ~= self.vehicleRideSessionId or self.vehicleRideSessionId == 0 then
		self:clearVehicleRideExitPending(previousDriverActorId)
	end

	self:refreshVehicleRideDriver(motionChanged)
end

function ClientVehicleRideComponent:RPC_SC_UpdateRideVehicleState(snapshot)
	self:applyVehicleRideSnapshot(snapshot)
end

function ClientVehicleRideComponent:RPC_SC_UpdateVehicleRideMotionState(info)
	local staleMotion = info.sessionId ~= self.vehicleRideSessionId or info.revision <= self.vehicleRideRevision or info.sequence < self.vehicleRideMotionSequence

	if staleMotion then
		return
	end

	local alreadyApplied = info.sequence == self.vehicleRideMotionSequence and info.motionState == self.vehicleRideMotionState

	self.vehicleRideRevision = info.revision
	self.vehicleRideMotionSequence = info.sequence
	self.vehicleRideMotionState = info.motionState

	if not alreadyApplied then
		self:applyVehicleRideMotionState(info.motionState)
	end
end

function ClientVehicleRideComponent:reportVehicleRideMotionState(driver, motionState)
	local cannotReport = not self:isActiveVehicleRideDriver(driver.actorId) or self:isVehicleRideExitPending(driver.actorId) or self.vehicleRideMotionState == motionState

	if cannotReport then
		return
	end

	self.vehicleRideMotionSequence = self.vehicleRideMotionSequence + 1
	self.vehicleRideMotionState = motionState

	self:applyVehicleRideMotionState(motionState)
	driver:serverMsg("RPC_CS_UpdateVehicleRideMotionState", self.actorId, self.vehicleRideSessionId, self.vehicleRideMotionSequence, motionState)
end

function ClientVehicleRideComponent:requestVehicleRideExit(driver, requestId, event)
	if not self:isActiveVehicleRideDriver(driver.actorId) or self.vehicleRideExitRequestId ~= 0 then
		return
	end

	self.vehicleRideExitRequestId = requestId
	self.vehicleRideExitEvent = event

	self:updateState()
	self:applyVehicleRideMotionState(MotionState.IDLE)
	self:refreshVehicleRideControllerAuthority()
	driver:serverMsg("RPC_CS_ExitVehicleRide", self.actorId, self.vehicleRideSessionId, requestId, event)
end

function ClientVehicleRideComponent:clearVehicleRideExitPending(driverActorId)
	self.vehicleRideExitRequestId = 0
	self.vehicleRideExitEvent = nil

	self:updateState(driverActorId)
end

function ClientVehicleRideComponent:onVehicleRideCommandResult(info)
	if info.requestId ~= self.vehicleRideExitRequestId then
		return
	end

	self:clearVehicleRideExitPending()

	if info.result ~= NoticeDef.SUCCESS then
		self:refreshVehicleRideDriver()
	end
end

function ClientVehicleRideComponent:onVehicleRideActorMounted(driver)
	if driver.actorId == self.vehicleRideDriverActorId then
		self:refreshVehicleRideDriver()
	end
end

function ClientVehicleRideComponent:onVehicleRideActorDismounted(driver)
	if driver.actorId ~= self.vehicleRideDriverActorId then
		return
	end

	self:onVehicleMoveStateChanged(false)
	self:clearVehicleRideExitPending()
end

function ClientVehicleRideComponent:updateState(driverActorId)
	local driver = pg.getEntityByActorId(driverActorId or self.vehicleRideDriverActorId)

	if driver and driver.updateStateCache then
		driver:updateStateCache("SPECIAL_VEHICLE_RIDE_ST")
		driver:updateStateCache("RIDING_ST")
	end
end

function ClientVehicleRideComponent:refreshVehicleRideDriver(refreshMotion)
	self:updateState()

	if refreshMotion ~= false then
		if self.vehicleRideState == RideState.ACTIVE then
			self:applyVehicleRideMotionState(self.vehicleRideMotionState)
		else
			self:applyVehicleRideMotionState(MotionState.IDLE)
		end
	end

	self:refreshVehicleRideControllerAuthority()
end

function ClientVehicleRideComponent:refreshVehicleRideControllerAuthority()
	local controllerSystem = pg.game and pg.game.controller
	local controller = controllerSystem and controllerSystem.curController

	if controller and controller.vehicle == self and controller.refreshVehicleRideAuthority then
		controller:refreshVehicleRideAuthority()
	end

	facade:sendMsgToUI(MessageName.VEHICLE_RIDE_AUTHORITY_CHANGED, self.id)
end

function ClientVehicleRideComponent:applyVehicleRideMotionState(motionState)
	local featureVehicle = self.featureVehicle

	if featureVehicle and featureVehicle.SetRemoteMotionState then
		featureVehicle:SetRemoteMotionState(self.vehicleRideDriverActorId, motionState)
	end

	if self.setSpecialVehicleRideBodyMotionState then
		self:setSpecialVehicleRideBodyMotionState(motionState)
	end

	local isMovingState = motionState == MotionState.MOVE_START or motionState == MotionState.MOVE or motionState == MotionState.JUMP_START or motionState == MotionState.JUMP

	if self.setVehicleBodyMoving then
		self:setVehicleBodyMoving(isMovingState)
	end

	if self.refreshSpecialVehicleMoveSoundByMotion then
		self:refreshSpecialVehicleMoveSoundByMotion(motionState)
	end
end

return ClientVehicleRideComponent
