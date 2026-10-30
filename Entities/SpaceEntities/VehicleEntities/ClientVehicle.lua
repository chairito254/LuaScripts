-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\VehicleEntities\\ClientVehicle.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local class = require("Core.Framework.Class")
local ClientModelEntity = require("Entities.ClientModelEntity")
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local ClientPrefabModelComponent = require("Entities.SpaceEntities.CommonComponent.ClientPrefabModelComponent")
local ClientTopLogoComponent = require("Entities.SpaceEntities.CommonComponent.ClientTopLogoComponent")
local Utils = require("Common.Utils.Utils")
local ClientInteractionComponent = require("Entities.SpaceEntities.CommonComponent.ClientInteractionComponent")
local BenchController = require("GameApp.Controller.BenchController")
local ClientAudioComponent = require("Entities.SpaceEntities.CommonComponent.ClientAudioComponent")
local ClientEffectComponent = require("Entities.SpaceEntities.PlayerComponent.ClientEffectComponent")
local ClientAuthorityComponent = require("Entities.SpaceEntities.CommonComponent.ClientAuthorityComponent")
local vehicle_seat_data = require("Data.vehicle_seat_data")
local vehicle_seat_attach_data = require("Data.vehicle_seat_attach_data")
local vehicle_data = require("Data.vehicle_data")
local RigidbodyData = require("Data.rigidbody_data")
local ClientPhysicsComponent = require("Entities.SpaceEntities.CommonComponent.ClientPhysicsComponent")
local ClientSeatComponent = require("Entities.SpaceEntities.CommonComponent.ClientSeatComponent")
local ClientActorComponent = require("Entities.SpaceEntities.CommonComponent.ClientActorComponent")
local ClientVehicleBodyAnimationComponent = require("Entities.SpaceEntities.VehicleEntities.ClientVehicleBodyAnimationComponent")
local ClientVehicleRideComponent = require("Entities.SpaceEntities.VehicleEntities.ClientVehicleRideComponent")
local ClientEcsComponent = require("Entities.SpaceEntities.CommonComponent.ClientEcsComponent")
local ClientEcologyComponent = require("Entities.SpaceEntities.CommonComponent.ClientEcologyComponent")
local SysConfigData = require("Data.sys_config_data")
local RouteController = require("GameApp.Controller.RouteController")
local DandelionController = require("GameApp.Controller.DandelionController")
local SpecialVehicleRideController = require("GameApp.Controller.SpecialVehicleRideController")
local SpecialVehicleRideConst = require("Common.Const.SpecialVehicleRideConst")
local SpecialVehicleMoveSound = require("Entities.SpaceEntities.VehicleEntities.SpecialVehicleMoveSound")
local TimerManager = require("Core.Timer.TimerManager")
local Vector3 = Vector3
local MotionState = SpecialVehicleRideConst.MotionState
local SPECIAL_VEHICLE_RIDE_RIGIDBODY = "SpecialVehicleRide_Chair"
local ClientVehicle = class.Class("ClientVehicle", ClientModelEntity)
local Components = {
	ClientActorComponent,
	ClientPrefabModelComponent,
	ClientTopLogoComponent,
	ClientInteractionComponent,
	ClientAudioComponent,
	ClientEffectComponent,
	ClientPhysicsComponent,
	ClientAuthorityComponent,
	ClientSeatComponent,
	ClientEcologyComponent,
	ClientVehicleBodyAnimationComponent,
	ClientVehicleRideComponent,
	ClientEcsComponent
}

if EnableBotTest then
	Components = {
		ClientActorComponent,
		ClientPhysicsComponent,
		ClientEffectComponent,
		ClientSeatComponent,
		ClientEcologyComponent
	}
end

class.AddComponents(ClientVehicle, Components)

function ClientVehicle:ctor(entityId)
	ClientVehicle.super.ctor(self, entityId)

	self.actorType = Const.ACTOR_TYPE_VEHICLE
	self.topLogoType = ClientConst.TopLogoType.Pet
	self.isClientEnt = false
	self.moveLoopSoundPlaying = false
	self.moveStopSoundPlaying = false
	self.specialVehicleRideMotionState = nil
	self.moveLoopSoundDelayTimer = nil
	self.moveLoopSoundEnsureTimer = nil
end

function ClientVehicle:isSpecialVehicleRideControllerCls(controllerCls)
	return controllerCls == "SpecialVehicleRideController"
end

function ClientVehicle:init(bdict)
	local ret = ClientVehicle.super.init(self, bdict)

	if self:isSpecialVehicleRideControllerCls(self:getVehicleConfig().controllerCls) then
		self:setIsKinematic(true, ClientConst.IsKinematicKey.SpecialVehicleRide)
	end

	return ret
end

function ClientVehicle:postInit(bdict)
	ClientVehicle.super.postInit(self, bdict)

	self.routeId = bdict.routeId

	local vehicleConfig = self:getVehicleConfig()

	if vehicleConfig.forbiddenTopLogo == false and vehicleConfig.needIndicatorIcon == 1 then
		self.forbiddenTopLogo = false
		self.topLogoType = ClientConst.TopLogoType.InteractableObject
		self.overrideTopLogoEnterDistance = SysConfigData.IndicatorIconDisplayArea or 10
		self.indicatorIconHeight = vehicleConfig.IndicatorIconHeight
	else
		self.forbiddenTopLogo = true
	end

	return true
end

function ClientVehicle:initializeComponents()
	ClientVehicle.super.initializeComponents(self)

	local vehicleConfig = self:getVehicleConfig()

	if self:isSpecialVehicleRideControllerCls(vehicleConfig.controllerCls) then
		local rigidbodyData = RigidbodyData[SPECIAL_VEHICLE_RIDE_RIGIDBODY]
		local center = rigidbodyData.center or {
			0,
			rigidbodyData.height * 0.5,
			0
		}

		self.eModel:GenCapsule(Const.COMPONENT_IDX_PHYSX, rigidbodyData.radius, rigidbodyData.height, Vector3.New(center[1], center[2], center[3]), false, false, true)
		self:addEModelComponent(Const.COMPONENT_MOTION)
	end

	self:addEModelComponent(Const.COMPONENT_VEHICLE)
end

function ClientVehicle:postInitializeComponents()
	ClientVehicle.super.postInitializeComponents(self)
	self:resyncSpecialVehicleMoveSound()
end

function ClientVehicle:getConfigData()
	return self:getVehicleConfig()
end

function ClientVehicle:refreshAppearance()
	ClientVehicle.super.refreshAppearance(self)

	local cfg = self:getVehicleConfig()

	self:loadPrefabModel(cfg.resId)
end

function ClientVehicle:onPrefabModelLoaded()
	self:resyncSpecialVehicleMoveSound()
end

function ClientVehicle:registerFeatureVehicle(featureVehicle)
	self.featureVehicle = featureVehicle

	local vehicleConfig = self:getVehicleConfig()

	if not self:isSpecialVehicleRideControllerCls(vehicleConfig.controllerCls) then
		return
	end

	local controllerSystem = pg.game and pg.game.controller

	if not controllerSystem then
		self:resyncSpecialVehicleMoveSound()

		return
	end

	local controller = controllerSystem.curController

	if controller and controller.vehicle == self and controller.pawn and controller.controlActive == true then
		featureVehicle:BeginControl(controller.pawn.actorId)
	elseif self.rideComponent and self.rideComponent.vehicleRideDriverActorId ~= 0 then
		featureVehicle:SetRemoteMotionState(self.rideComponent.vehicleRideDriverActorId, self.rideComponent.vehicleRideMotionState)
	end

	self:resyncSpecialVehicleMoveSound()
end

function ClientVehicle:unregisterFeatureVehicle(featureVehicle)
	if self.featureVehicle == featureVehicle then
		self.featureVehicle = nil
	end
end

function ClientVehicle:onSpecialVehicleRideLanded(driverActorId)
	local controllerSystem = pg.game and pg.game.controller

	if not controllerSystem then
		return
	end

	local controller = controllerSystem.curController
	local isCurrentDriver = controller and controller.vehicle == self and controller.pawn and controller.pawn.actorId == driverActorId and controller.controlActive == true

	if isCurrentDriver and controller.onVehicleJumpLanded then
		controller:onVehicleJumpLanded()
	end
end

function ClientVehicle:getControllerData()
	return Utils.deepCopyTable(self:getVehicleConfig().controllerData or {})
end

function ClientVehicle:getActorController(player)
	local controllerCls = self:getVehicleConfig().controllerCls

	if self:isSpecialVehicleRideControllerCls(controllerCls) and self:isVehicleRideOwner(player.uid) then
		return SpecialVehicleRideController.new(player, self)
	elseif controllerCls == "RouteController" then
		return DandelionController.new(player, self)
	elseif controllerCls == "RideVehicleController" then
		return RouteController.new(player, self)
	else
		return BenchController.new(player, self)
	end
end

function ClientVehicle:onEntityMount(entity, seatId)
	if not self.eModel then
		return
	end

	self.eModel:VehicleMount(Const.COMPONENT_VEHICLE, entity.actorId, seatId)
end

function ClientVehicle:onEntityDismount(entity, seatId)
	if not self.eModel then
		return
	end

	self.eModel:VehicleDismount(Const.COMPONENT_VEHICLE, entity.actorId)
end

function ClientVehicle:onVehicleMountLoopEntered(passenger, sessionId)
	self:postComponentMethod("EVENT_OnVehiclePassengerEnterFinished", passenger, sessionId)

	local controllerSystem = pg.game and pg.game.controller
	local controller = controllerSystem and controllerSystem.curController
	local isCurrentPassengerController = controller and controller.vehicle == self and controller.pawn == passenger

	if isCurrentPassengerController and controller.onVehicleMountLoopEntered then
		controller:onVehicleMountLoopEntered()
	end
end

function ClientVehicle:onVehicleMountExitFinished(passenger, sessionId)
	self:postComponentMethod("EVENT_OnVehiclePassengerExitFinished", passenger, sessionId)
end

function ClientVehicle:onVehicleMoveStateChanged(isMoving)
	if self.setVehicleBodyMoving then
		self:setVehicleBodyMoving(isMoving == true)
	end

	self:refreshSpecialVehicleMoveLoopSound(isMoving == true)
end

function ClientVehicle:getSpecialVehicleMoveLoopSound()
	local controllerData = self:getVehicleConfig().controllerData or {}

	return controllerData.moveLoopSound
end

function ClientVehicle:getSpecialVehicleMoveStopSound()
	local controllerData = self:getVehicleConfig().controllerData or {}

	return controllerData.moveStopSound or controllerData.movestopSound
end

function ClientVehicle:getSpecialVehicleMoveLoopSoundDelay()
	local controllerData = self:getVehicleConfig().controllerData or {}

	return controllerData.moveLoopSoundDelay or controllerData.driveStartDelay or 0.4
end

function ClientVehicle:getSpecialVehicleMoveSoundFadeTime()
	local controllerData = self:getVehicleConfig().controllerData or {}

	if self:getSpecialVehicleMoveStopSound() then
		return 0
	end

	return controllerData.moveSoundFadeTime or 0.2
end

function ClientVehicle:clearMoveLoopSoundDelayTimer()
	if self.moveLoopSoundDelayTimer then
		TimerManager.removeTimer(self.moveLoopSoundDelayTimer)

		self.moveLoopSoundDelayTimer = nil
	end
end

function ClientVehicle:isSpecialVehicleAirborneMotion(motionState)
	return motionState == MotionState.JUMP_START or motionState == MotionState.JUMP or motionState == MotionState.JUMP_LAND
end

function ClientVehicle:isSpecialVehicleRideAirborne()
	if not self:isSpecialVehicleRide() then
		return false
	end

	local motionState = self.specialVehicleRideMotionState or self.vehicleRideMotionState

	if motionState == MotionState.JUMP_START or motionState == MotionState.JUMP then
		return true
	end

	local featureVehicle = self.featureVehicle

	if IsNil(featureVehicle) then
		return false
	end

	if featureVehicle.IsJumping and featureVehicle:IsJumping() then
		return true
	end

	if featureVehicle.IsAirborne then
		return featureVehicle:IsAirborne()
	end

	return false
end

function ClientVehicle:canActiveDismount()
	return not self:isSpecialVehicleRideAirborne()
end

function ClientVehicle:scheduleSpecialVehicleMoveLoopSound()
	if self.moveLoopSoundPlaying or self.moveLoopSoundDelayTimer then
		return
	end

	local delay = self:getSpecialVehicleMoveLoopSoundDelay()

	if delay <= 0 then
		self:playSpecialVehicleMoveLoopSound()

		return
	end

	self.moveLoopSoundDelayTimer = TimerManager.addTimer(delay, function()
		self.moveLoopSoundDelayTimer = nil

		local motionState = self.specialVehicleRideMotionState

		if motionState == MotionState.MOVE or motionState == MotionState.MOVE_START then
			self:playSpecialVehicleMoveLoopSound()
		end
	end)
end

function ClientVehicle:muteSpecialVehicleMoveLoopSound()
	self:clearMoveLoopSoundDelayTimer()
	self:stopSpecialVehicleMoveLoopSound()
end

function ClientVehicle:stopSpecialVehicleMoveStopSound()
	local moveStopSound = self:getSpecialVehicleMoveStopSound()

	if not moveStopSound or not self.moveStopSoundPlaying then
		return
	end

	self:stopSoundEvent(moveStopSound, 0)

	self.moveStopSoundPlaying = false
end

function ClientVehicle:stopSpecialVehicleMoveLoopSound()
	local moveLoopSound = self:getSpecialVehicleMoveLoopSound()

	if not moveLoopSound or not self.moveLoopSoundPlaying then
		return
	end

	self:stopSoundEvent(moveLoopSound, self:getSpecialVehicleMoveSoundFadeTime())

	self.moveLoopSoundPlaying = false
end

function ClientVehicle:resyncSpecialVehicleMoveSound()
	local vehicleConfig = self.getVehicleConfig and self:getVehicleConfig()

	if not vehicleConfig or vehicleConfig.specialVehicleRide ~= true then
		return
	end

	SpecialVehicleMoveSound.resync(self)
	self:scheduleSpecialVehicleMoveSoundEnsure()
end

function ClientVehicle:clearSpecialVehicleMoveSoundEnsureTimer()
	if self.moveLoopSoundEnsureTimer then
		TimerManager.removeTimer(self.moveLoopSoundEnsureTimer)

		self.moveLoopSoundEnsureTimer = nil
	end
end

function ClientVehicle:scheduleSpecialVehicleMoveSoundEnsure()
	self:clearSpecialVehicleMoveSoundEnsureTimer()

	self.moveLoopSoundEnsureTimer = TimerManager.addTimer(0.2, function()
		self.moveLoopSoundEnsureTimer = nil

		self:ensureSpecialVehicleMoveLoopSound()
	end)
end

function ClientVehicle:ensureSpecialVehicleMoveLoopSound()
	SpecialVehicleMoveSound.ensureLoop(self)
end

function ClientVehicle:playSpecialVehicleMoveLoopSound()
	SpecialVehicleMoveSound.playLoop(self)
end

function ClientVehicle:playSpecialVehicleMoveStopSound()
	if not self.moveLoopSoundPlaying then
		return
	end

	self:stopSpecialVehicleMoveLoopSound()

	local moveStopSound = self:getSpecialVehicleMoveStopSound()

	if not moveStopSound then
		return
	end

	self:stopSpecialVehicleMoveStopSound()
	self:playSoundEvent(moveStopSound)

	self.moveStopSoundPlaying = true
end

function ClientVehicle:refreshSpecialVehicleMoveLoopSound(isMoving)
	if self:getVehicleConfig().specialVehicleRide ~= true then
		self:clearMoveLoopSoundDelayTimer()
		self:stopSpecialVehicleMoveLoopSound()
		self:stopSpecialVehicleMoveStopSound()

		return
	end

	if isMoving then
		self:playSpecialVehicleMoveLoopSound()

		return
	end

	self:clearMoveLoopSoundDelayTimer()
	self:playSpecialVehicleMoveStopSound()
end

function ClientVehicle:refreshSpecialVehicleMoveSoundByMotion(motionState)
	self.specialVehicleRideMotionState = motionState

	if self:getVehicleConfig().specialVehicleRide ~= true then
		self:clearMoveLoopSoundDelayTimer()
		self:stopSpecialVehicleMoveLoopSound()
		self:stopSpecialVehicleMoveStopSound()

		return
	end

	if motionState == MotionState.MOVE_START then
		self:scheduleSpecialVehicleMoveLoopSound()

		return
	end

	if motionState == MotionState.MOVE then
		if self.moveLoopSoundDelayTimer then
			return
		end

		self:playSpecialVehicleMoveLoopSound()

		return
	end

	if self:isSpecialVehicleAirborneMotion(motionState) then
		self:muteSpecialVehicleMoveLoopSound()

		return
	end

	self:clearMoveLoopSoundDelayTimer()
	self:playSpecialVehicleMoveStopSound()
end

function ClientVehicle:onEnterControl()
	return
end

function ClientVehicle:onExitControl()
	return
end

function ClientVehicle:onDoSkill1()
	return
end

function ClientVehicle:onDoSkill2()
	return
end

function ClientVehicle:onTriggerBreak(entId)
	return
end

function ClientVehicle:getInteractionListData()
	return self:getSeatInteractionList()
end

function ClientVehicle:destroyEntity(reason, delay)
	self:setVisible(ClientConst.MODEL_VISIBLE_KEY.DESTROYING, true, false)
	pg.me:reliableServerSpaceMsg("RPC_CS_DestroyVehicleByEcs", {
		self.actorId,
		delay or 0,
		reason or 0
	})
end

function ClientVehicle:preDestroy()
	self:clearTempPosSync(Const.TEMP_POS_SYNC_REASON.SPECIAL_VEHICLE_RIDE)
	self:clearMoveLoopSoundDelayTimer()
	self:clearSpecialVehicleMoveSoundEnsureTimer()
	self:stopSpecialVehicleMoveLoopSound()
	self:stopSpecialVehicleMoveStopSound()
	self:playDestroyEffect()
	ClientVehicle.super.preDestroy(self)
end

return ClientVehicle
