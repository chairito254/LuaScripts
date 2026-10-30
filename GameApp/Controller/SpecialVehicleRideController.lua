-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Controller\\SpecialVehicleRideController.lua

local Class = require("Core.Framework.Class")
local BenchController = require("GameApp.Controller.BenchController")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local ClientConst = require("Const.ClientConst")
local Const = require("Common.Const.Const")
local ConflictTypes = require("Common.ConflictTypes")
local SpecialVehicleRideConst = require("Common.Const.SpecialVehicleRideConst")
local TimerManager = require("Core.Timer.TimerManager")
local VehicleRiderAnimationController = require("GameApp.Controller.VehicleRiderAnimationController")
local MotionState = SpecialVehicleRideConst.MotionState
local PositionSyncReason = Const.TEMP_POS_SYNC_REASON.SPECIAL_VEHICLE_RIDE

local function resolveRideController(self)
	local currentController = rawget(self, "curController")

	if currentController and currentController ~= self then
		return currentController
	end

	return self
end

local SpecialVehicleRideController = Class.LightClass("SpecialVehicleRideController", BenchController)

function SpecialVehicleRideController:ctor(pawn, vehicle)
	SpecialVehicleRideController.super.ctor(self, pawn, vehicle)

	self.riderAnimationController = VehicleRiderAnimationController.new(pawn, self.controllerData.characterAnimation)
	self.moving = false
	self.jumping = false
	self.landing = false
	self.exited = false
	self.controlActive = false
	self.restoring = pawn.vehicleRideRestoring == true
	self.hasActivatedControl = false
	self.mountLoopEntered = pawn.characterState == CharacterStateConst.MOUNT or pawn.characterState == CharacterStateConst.MOUNTSPECIAL
	self.driveStartTimer = nil
	self.jumpLandCheckTimer = nil
	self.driveInputX = 0
	self.driveInputY = 0
end

function SpecialVehicleRideController:isVehicle()
	return true
end

function SpecialVehicleRideController:enter()
	self.exited = false

	self:refreshVehicleRideAuthority()
end

function SpecialVehicleRideController:refreshVehicleRideAuthority()
	local authorized = self.vehicle:isActiveVehicleRideDriver(self.pawn.actorId) and not self.pawn:isVehicleRideExitPending()

	if authorized and not self.controlActive then
		self:activateVehicleControl()
	elseif not authorized and self.controlActive then
		self:deactivateVehicleControl()
	end
end

function SpecialVehicleRideController:activateVehicleControl()
	self.controlActive = true

	if self.mountLoopEntered then
		self.riderAnimationController:enter(self.moving)

		if self.jumping then
			self.riderAnimationController:playLoop()
		end
	end

	self.vehicle:tempDisableRendererBatch(ClientConst.DisableBatchReason.SPECIAL_VEHICLE_RIDE, true)

	if pg.game and pg.game.camera and pg.game.camera.playerCameraMode and pg.game.camera.playerCameraMode.defaultCamera then
		pg.game.camera.playerCameraMode.defaultCamera:setDamperEnabled(false)
	end

	if NotNil(self.vehicle.featureVehicle) then
		self.vehicle.featureVehicle:BeginControl(self.pawn.actorId)
	end

	local skipMountDelay = self.restoring or self.hasActivatedControl
	local mountDelay = skipMountDelay and 0 or self.controllerData.mountDelay or 0

	self.hasActivatedControl = true

	if mountDelay > 0 then
		self.mountDelayTimer = TimerManager.addTimer(mountDelay, function()
			self.mountDelayTimer = nil

			if self.exited == false and self.controlActive then
				self:enableVehicleMotion()
			end
		end)
	else
		self:enableVehicleMotion()
	end
end

function SpecialVehicleRideController:enableVehicleMotion()
	self.vehicle:setTempPosSync(true, PositionSyncReason)
end

function SpecialVehicleRideController:clearJumpTimers()
	if self.jumpLoopTimer then
		TimerManager.removeTimer(self.jumpLoopTimer)

		self.jumpLoopTimer = nil
	end

	if self.jumpFinishTimer then
		TimerManager.removeTimer(self.jumpFinishTimer)

		self.jumpFinishTimer = nil
	end

	if self.jumpLandCheckTimer then
		TimerManager.removeTimer(self.jumpLandCheckTimer)

		self.jumpLandCheckTimer = nil
	end
end

function SpecialVehicleRideController:clearMoveStateTimer()
	if self.moveStateTimer then
		TimerManager.removeTimer(self.moveStateTimer)

		self.moveStateTimer = nil
	end
end

function SpecialVehicleRideController:clearDriveStartTimer()
	if self.driveStartTimer then
		TimerManager.removeTimer(self.driveStartTimer)

		self.driveStartTimer = nil
	end
end

function SpecialVehicleRideController:beginDriveStartDelay()
	self:clearDriveStartTimer()

	local driveStartDelay = self.controllerData.driveStartDelay or 0.4

	if driveStartDelay <= 0 then
		return
	end

	self.driveStartTimer = TimerManager.addTimer(driveStartDelay, function()
		self.driveStartTimer = nil

		if self.exited == false and self.controlActive and self.moving then
			self:driveVehicle(self.driveInputX, self.driveInputY)
		end
	end)
end

function SpecialVehicleRideController:exit()
	self.exited = true

	self:deactivateVehicleControl()
end

function SpecialVehicleRideController:deactivateVehicleControl()
	local wasActive = self.controlActive

	if self.mountDelayTimer then
		TimerManager.removeTimer(self.mountDelayTimer)

		self.mountDelayTimer = nil
	end

	self:clearMoveStateTimer()
	self:clearDriveStartTimer()
	self:clearJumpTimers()

	self.controlActive = false

	self.riderAnimationController:exit()

	self.moving = false
	self.jumping = false
	self.landing = false
	self.driveInputX = 0
	self.driveInputY = 0

	if not wasActive then
		return
	end

	if self.vehicle then
		self.vehicle:onVehicleMoveStateChanged(false)

		if NotNil(self.vehicle.featureVehicle) then
			self.vehicle.featureVehicle:Drive(0, 0)
			self.vehicle.featureVehicle:EndControl(self.pawn.actorId)
		end

		self.vehicle:tempDisableRendererBatch(ClientConst.DisableBatchReason.SPECIAL_VEHICLE_RIDE, false)
	end

	if pg.game and pg.game.camera and pg.game.camera.playerCameraMode and pg.game.camera.playerCameraMode.defaultCamera then
		pg.game.camera.playerCameraMode.defaultCamera:setDamperEnabled(true)
	end
end

function SpecialVehicleRideController:onVehicleMountLoopEntered()
	self.mountLoopEntered = true

	if self.controlActive then
		self.riderAnimationController:enter(self.moving)

		if self.jumping then
			self.riderAnimationController:playLoop()
		end
	end
end

function SpecialVehicleRideController:setMotionState(motionState)
	if self.pawn then
		self.pawn:reportVehicleRideMotionState(motionState)
	end
end

function SpecialVehicleRideController:updateMoveMotionState()
	self:clearMoveStateTimer()

	if self.jumping then
		return
	end

	if self.moving then
		self:setMotionState(MotionState.MOVE_START)

		self.moveStateTimer = TimerManager.addTimer(self.controllerData.moveStartDuration or 0.2, function()
			self.moveStateTimer = nil

			if self.exited == false and not self.jumping and self.moving then
				self:setMotionState(MotionState.MOVE)
			end
		end)

		return
	end

	self:setMotionState(MotionState.MOVE_END)

	self.moveStateTimer = TimerManager.addTimer(self.controllerData.moveEndDuration or 0.2, function()
		self.moveStateTimer = nil

		if self.exited == false and not self.jumping and not self.moving then
			self:setMotionState(MotionState.IDLE)
		end
	end)
end

function SpecialVehicleRideController:onHandleMove(x, y, z)
	local controller = resolveRideController(self)

	if controller ~= self then
		return controller:onHandleMove(x, y, z)
	end

	local cannotHandleMove = self.exited or not self.controlActive or not self:checkPawn() or self.pawn:isVehicleRideExitPending()

	if cannotHandleMove then
		return
	end

	if self.pawn.characterState == CharacterStateConst.MOUNTENTER then
		return
	end

	local featureVehicle = self.vehicle.featureVehicle

	if IsNil(featureVehicle) then
		return
	end

	local hasMoveInput = x ~= 0 or y ~= 0 or z ~= 0

	self.driveInputX = x
	self.driveInputY = y

	if self.moving ~= hasMoveInput then
		self.moving = hasMoveInput

		if not self.jumping then
			self.riderAnimationController:setMoving(hasMoveInput)
		end

		self:updateMoveMotionState()

		if hasMoveInput then
			self:beginDriveStartDelay()
		else
			self:clearDriveStartTimer()
		end
	end

	if self.driveStartTimer then
		featureVehicle:Drive(0, 0)
	else
		featureVehicle:Drive(x, y)
	end

	if hasMoveInput and not self.jumping and self.vehicle.ensureSpecialVehicleMoveLoopSound then
		self.vehicle:ensureSpecialVehicleMoveLoopSound()
	end
end

function SpecialVehicleRideController:driveVehicle(x, y)
	local featureVehicle = self.vehicle.featureVehicle

	if IsNil(featureVehicle) then
		return false
	end

	featureVehicle:Drive(x, y)

	return true
end

local function finishJumpLanding(controller)
	local self = controller

	if self == nil or self.exited or type(self.setMotionState) ~= "function" then
		return
	end

	if not self.jumping or self.landing then
		return
	end

	self.landing = true

	if self.jumpLoopTimer then
		TimerManager.removeTimer(self.jumpLoopTimer)

		self.jumpLoopTimer = nil
	end

	if self.jumpLandCheckTimer then
		TimerManager.removeTimer(self.jumpLandCheckTimer)

		self.jumpLandCheckTimer = nil
	end

	self:setMotionState(MotionState.JUMP_LAND)

	if self.exited then
		return
	end

	self.jumping = false
	self.landing = false

	local riderAnimationController = self.riderAnimationController

	riderAnimationController.wantMoving = self.moving

	if riderAnimationController.active then
		if self.moving then
			riderAnimationController:playLoop()
		else
			riderAnimationController:playEnd()
		end
	end

	self:setMotionState(self.moving and MotionState.MOVE or MotionState.IDLE)
end

function SpecialVehicleRideController:onVehicleJumpLanded()
	finishJumpLanding(self)
end

function SpecialVehicleRideController:onHandleJump(isPress)
	local controller = resolveRideController(self)

	if controller ~= self then
		return controller:onHandleJump(isPress)
	end

	local cannotJump = not isPress or self.exited or not self.controlActive or self.pawn:isVehicleRideExitPending()

	if cannotJump then
		return
	end

	local featureVehicle = self.vehicle.featureVehicle

	if IsNil(featureVehicle) or not featureVehicle:Jump(self.controllerData.jumpSpeed or 6) then
		return
	end

	self:clearJumpTimers()
	self:clearMoveStateTimer()

	self.jumping = true
	self.landing = false

	if self.riderAnimationController.active then
		self.riderAnimationController:playLoop()
	end

	self:setMotionState(MotionState.JUMP_START)

	local jumpLandCheckInterval = self.controllerData.jumpLandCheckInterval or 0.05

	self.jumpLandCheckTimer = TimerManager.addRepeatTimer(jumpLandCheckInterval, function()
		if self.exited or type(self.setMotionState) ~= "function" then
			if self.jumpLandCheckTimer then
				TimerManager.removeTimer(self.jumpLandCheckTimer)

				self.jumpLandCheckTimer = nil
			end

			return
		end

		if not featureVehicle:IsJumping() then
			finishJumpLanding(self)
		end
	end)

	local jumpLoopDelay = self.controllerData.jumpLoopDelay or 0.2

	self.jumpLoopTimer = TimerManager.addTimer(jumpLoopDelay, function()
		self.jumpLoopTimer = nil

		if self.exited == false then
			self:setMotionState(MotionState.JUMP)
		end
	end)
end

function SpecialVehicleRideController:onHandleDash(isPress)
	local controller = resolveRideController(self)

	if controller ~= self then
		return controller:onHandleDash(isPress)
	end

	if isPress and self.pawn then
		self.pawn:checkStatus(ConflictTypes.CT_DASH)
	end
end

return SpecialVehicleRideController
