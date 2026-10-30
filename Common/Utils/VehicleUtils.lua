-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\VehicleUtils.lua

local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local vehicle_seat_data = require("Data.vehicle_seat_data")
local VehicleUtils = {}
local PUPPET_SEAT_FILTER_BIT = {
	BOSS = 16,
	ELITE = 8,
	NPC = 4,
	WILD_MONSTER = 2,
	HOME_PET = 1
}

function VehicleUtils.getPuppetSeatFilterBit(entity)
	if Utils.isHomePet(entity) then
		return PUPPET_SEAT_FILTER_BIT.HOME_PET
	elseif Utils.isNpc(entity) then
		return PUPPET_SEAT_FILTER_BIT.NPC
	elseif Utils.isBoss(entity) then
		return PUPPET_SEAT_FILTER_BIT.BOSS
	elseif Utils.isElite(entity) then
		return PUPPET_SEAT_FILTER_BIT.ELITE
	end

	return PUPPET_SEAT_FILTER_BIT.WILD_MONSTER
end

function VehicleUtils.isSeatUnitWhitelisted(entity, seatConfig)
	if not entity or entity.staticId == nil or not seatConfig then
		return false
	end

	return table.contains(seatConfig.unitWhiteList, entity.staticId)
end

function VehicleUtils.isSeatActorAllowed(entity, seatConfig)
	if not entity or not seatConfig then
		return false
	end

	if VehicleUtils.isSeatUnitWhitelisted(entity, seatConfig) then
		return true
	end

	local actorFilter = seatConfig.actorFilter or 0

	if not Utils.isPuppet(entity) then
		return bit.band(2^(entity.actorType or 0), actorFilter) ~= 0
	end

	local puppetFilter = seatConfig.puppetFilter or 0

	return bit.band(VehicleUtils.getPuppetSeatFilterBit(entity), puppetFilter) ~= 0
end

function VehicleUtils.isPetOnlyVehicleConfig(vehicleConfig)
	local seats = vehicleConfig and vehicleConfig.seats

	if not seats or #seats == 0 then
		return false
	end

	local petActorFilter = 2^Const.ACTOR_TYPE_PET

	for _, seatId in ipairs(seats) do
		local seatConfig = vehicle_seat_data[seatId]

		if not seatConfig or seatConfig.actorFilter ~= petActorFilter or not seatConfig.petAttachId and not seatConfig.homePetAttachId then
			return false
		end
	end

	return true
end

function VehicleUtils.isPetOnlyVehicle(vehicle)
	if not vehicle or not vehicle.getVehicleConfig then
		return false
	end

	return VehicleUtils.isPetOnlyVehicleConfig(vehicle:getVehicleConfig())
end

function VehicleUtils.hasPetSeat(vehicleConfig)
	local seats = vehicleConfig and vehicleConfig.seats

	if not seats or vehicleConfig.petMountType == Const.PET_MOUNT_TYPE.DisablePet then
		return false
	end

	local petFilter = 2^Const.ACTOR_TYPE_PET

	for _, seatId in ipairs(seats) do
		local seatConfig = vehicle_seat_data[seatId]
		local actorFilter = seatConfig and seatConfig.actorFilter or 0

		if bit.band(actorFilter, petFilter) ~= 0 then
			return true
		end
	end

	return false
end

function VehicleUtils.shouldFollowOnSpecialVehicleRide(vehicleConfig)
	return vehicleConfig ~= nil and vehicleConfig.specialVehicleRide == true and not VehicleUtils.hasPetSeat(vehicleConfig)
end

function VehicleUtils.isEntityOnSpecialRideWithoutPetSeat(entity)
	if not entity or not entity.onVehicleActorId or entity.onVehicleActorId == 0 then
		return false
	end

	local vehicle = pg.getEntityByActorId(entity.onVehicleActorId)

	if not vehicle or not vehicle.getVehicleConfig then
		return false
	end

	return VehicleUtils.shouldFollowOnSpecialVehicleRide(vehicle:getVehicleConfig())
end

function VehicleUtils.shouldHidePassengerPets(vehicleConfig)
	if not vehicleConfig or vehicleConfig.specialVehicleRide == true then
		return false
	end

	local seats = vehicleConfig.seats

	if not seats then
		return false
	end

	local playerFilter = 2^Const.ACTOR_TYPE_PLAYER
	local petFilter = 2^Const.ACTOR_TYPE_PET
	local allowPet = vehicleConfig.petMountType ~= Const.PET_MOUNT_TYPE.DisablePet
	local playerSeatCount = 0

	for _, seatId in ipairs(seats) do
		local seatConfig = vehicle_seat_data[seatId]
		local actorFilter = seatConfig.actorFilter or 0

		if allowPet and bit.band(actorFilter, petFilter) ~= 0 then
			return false
		end

		if bit.band(actorFilter, playerFilter) ~= 0 then
			playerSeatCount = playerSeatCount + 1
		end
	end

	return playerSeatCount >= 2
end

function VehicleUtils.arePlayersOnSameVehicle(player, target)
	if player == target or not Utils.isPlayer(player) or not Utils.isPlayer(target) then
		return false
	end

	local vehicleActorId = player.onVehicleActorId

	return vehicleActorId ~= nil and vehicleActorId ~= 0 and vehicleActorId == target.onVehicleActorId
end

return VehicleUtils
