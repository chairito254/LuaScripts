-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\VehicleEntities\\SpecialVehicleMoveSound.lua

local SpecialVehicleRideConst = require("Common.Const.SpecialVehicleRideConst")
local SpecialVehicleMoveSound = {}
local MotionState = SpecialVehicleRideConst.MotionState

local function isAlive(obj)
	if obj == nil then
		return false
	end

	if IsNil then
		return not IsNil(obj)
	end

	return true
end

function SpecialVehicleMoveSound.isPlayable(vehicle)
	local eModel = vehicle and vehicle.eModel

	if not isAlive(eModel) then
		return false
	end

	return isAlive(eModel.audioEmitter)
end

function SpecialVehicleMoveSound.playLoop(vehicle)
	local sound = vehicle:getSpecialVehicleMoveLoopSound()

	if not sound then
		return false
	end

	if vehicle.stopSpecialVehicleMoveStopSound then
		vehicle:stopSpecialVehicleMoveStopSound()
	end

	if vehicle.moveLoopSoundPlaying then
		return true
	end

	if not SpecialVehicleMoveSound.isPlayable(vehicle) then
		return false
	end

	if not vehicle:playSoundEvent(sound) then
		return false
	end

	vehicle.moveLoopSoundPlaying = true

	return true
end

function SpecialVehicleMoveSound.invalidate(vehicle)
	if vehicle.moveLoopSoundPlaying and vehicle.stopSpecialVehicleMoveLoopSound then
		vehicle:stopSpecialVehicleMoveLoopSound()
	end

	vehicle.moveLoopSoundPlaying = false
	vehicle.moveStopSoundPlaying = false
end

function SpecialVehicleMoveSound.resync(vehicle)
	SpecialVehicleMoveSound.invalidate(vehicle)
end

function SpecialVehicleMoveSound.ensureLoop(vehicle)
	local motionState = vehicle.specialVehicleRideMotionState or vehicle.vehicleRideMotionState

	if motionState ~= MotionState.MOVE then
		return false
	end

	if vehicle.moveLoopSoundDelayTimer then
		return false
	end

	if vehicle.moveLoopSoundPlaying then
		return true
	end

	return SpecialVehicleMoveSound.playLoop(vehicle)
end

return SpecialVehicleMoveSound
