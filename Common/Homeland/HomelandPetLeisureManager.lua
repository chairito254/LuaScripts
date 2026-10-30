-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Homeland\\HomelandPetLeisureManager.lua

local Class = require("Core.Framework.Class")
local lume = require("Core.Common.lume")
local Time = require("Core.Common.Time")
local Const = require("Common.Const.Const")
local NoticeDef = require("Common.NoticeDef")
local Utils = require("Common.Utils.Utils")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local HomeLeisureBehaviorData = require("Data.home_leisure_behavior_data")
local HomeObjectData = require("Data.home_object_data")
local HomelandPetLeisureManager = Class.LightClass("HomelandPetLeisureManager")

function HomelandPetLeisureManager:ctor(space)
	self.space = space
	self.revision = 0
	self.rideVehicleOrnamentIds = {}
	self.leisureAreaIds = {}
	self.nextPetLeisureCooldownCleanupTs = 0

	for petId, leisureInfo in pairs(space.leisureState) do
		self.revision = math.max(self.revision, leisureInfo.revision)
		self.leisureAreaIds[petId] = HomeLandUtils.getHomePetAreaId(space, petId)
	end

	for ornamentId in pairs(space.ornament) do
		self:onRideVehicleOrnamentChanged(ornamentId)
	end
end

function HomelandPetLeisureManager:destroy()
	self.rideVehicleOrnamentIds = nil
	self.leisureAreaIds = nil
	self.nextPetLeisureCooldownCleanupTs = nil
	self.space = nil
end

function HomelandPetLeisureManager.getPetLeisureCooldownKey(petId, leisureId)
	return petId .. ":" .. leisureId
end

function HomelandPetLeisureManager:isDualLeisureInfo(leisureInfo)
	local leisureConfig = leisureInfo and HomeLeisureBehaviorData[leisureInfo.leisureId]

	return leisureConfig ~= nil and leisureConfig.leisureType == Const.HOME_LEISURE_TYPE.DUAL
end

function HomelandPetLeisureManager:getDualLeisurePartnerIdsByArea(petsToAllocateLeisure, petAreaIds)
	local partnerPetIdsByArea = {}

	for petId, petEnt in pairs(petsToAllocateLeisure) do
		local petAreaId = petAreaIds[petId]

		if petEnt and petAreaId ~= nil and not self.space.leisureState[petId] and petEnt.onVehicleActorId == 0 then
			local partnerPetIds = partnerPetIdsByArea[petAreaId]

			if not partnerPetIds then
				partnerPetIds = {}
				partnerPetIdsByArea[petAreaId] = partnerPetIds
			end

			partnerPetIds[#partnerPetIds + 1] = petId
		end
	end

	return partnerPetIdsByArea
end

function HomelandPetLeisureManager:clearPetLeisureStateInternal(petId, curTs)
	local leisureInfo = self.space.leisureState[petId]

	if self.leisureAreaIds then
		self.leisureAreaIds[petId] = nil
	end

	if not leisureInfo then
		return
	end

	local leisureConfig = HomeLeisureBehaviorData[leisureInfo.leisureId]
	local petCooldownKey = HomelandPetLeisureManager.getPetLeisureCooldownKey(petId, leisureInfo.leisureId)

	if leisureConfig and leisureConfig.cd and leisureConfig.cd > 0 then
		self.space.petLeisureCooldowns[petCooldownKey] = (curTs or Time.getSecond()) + leisureConfig.cd
	else
		self.space.petLeisureCooldowns[petCooldownKey] = nil
	end

	if leisureConfig and leisureConfig.leisureType == Const.HOME_LEISURE_TYPE.RIDE then
		local petEnt = pg.getEntity(petId)
		local vehicleEnt = self.space:getServerEntityByOrnamentId(leisureInfo.vehicleOrnamentId)

		if petEnt and vehicleEnt and petEnt.onVehicleActorId == vehicleEnt.actorId then
			petEnt:dismountVehicle()
		end
	end

	self.space.leisureState[petId] = nil
end

function HomelandPetLeisureManager:clearPetLeisureCooldowns(petId)
	for leisureId in pairs(HomeLeisureBehaviorData) do
		local cooldownKey = HomelandPetLeisureManager.getPetLeisureCooldownKey(petId, leisureId)

		self.space.petLeisureCooldowns[cooldownKey] = nil
	end
end

function HomelandPetLeisureManager:cleanupExpiredPetLeisureCooldowns(curTs)
	if curTs < self.nextPetLeisureCooldownCleanupTs then
		return
	end

	self.nextPetLeisureCooldownCleanupTs = curTs + Const.SECONDS_ONE_MINUTE

	local expiredCooldownKeys

	for cooldownKey, cooldownEndTs in pairs(self.space.petLeisureCooldowns) do
		if cooldownEndTs <= curTs then
			expiredCooldownKeys = expiredCooldownKeys or {}
			expiredCooldownKeys[#expiredCooldownKeys + 1] = cooldownKey
		end
	end

	if expiredCooldownKeys then
		for _, cooldownKey in ipairs(expiredCooldownKeys) do
			self.space.petLeisureCooldowns[cooldownKey] = nil
		end
	end
end

function HomelandPetLeisureManager:clearPetLeisureState(petId, curTs)
	local leisureInfo = self.space.leisureState[petId]

	if self.leisureAreaIds then
		self.leisureAreaIds[petId] = nil
	end

	if not leisureInfo then
		return
	end

	local partnerPetId

	if self:isDualLeisureInfo(leisureInfo) then
		local partnerInfo = self.space.leisureState[leisureInfo.partnerPetId]

		if HomeLandUtils.isDualLeisurePairValid(self.space.leisureState, petId, leisureInfo) then
			partnerPetId = leisureInfo.partnerPetId
		elseif partnerInfo and partnerInfo.revision == leisureInfo.revision and partnerInfo.leisureId == leisureInfo.leisureId then
			partnerPetId = leisureInfo.partnerPetId
		end
	end

	self:clearPetLeisureStateInternal(petId, curTs)

	if partnerPetId then
		self:clearPetLeisureStateInternal(partnerPetId, curTs)
	end
end

function HomelandPetLeisureManager:clearAllPetLeisureState(curTs)
	curTs = curTs or Time.getSecond()

	local petIds = {}

	for petId in pairs(self.space.leisureState) do
		petIds[#petIds + 1] = petId
	end

	for _, petId in ipairs(petIds) do
		self:clearPetLeisureState(petId, curTs)
	end
end

function HomelandPetLeisureManager:clearPettingLeisureState(playFailedAnim)
	for petId in pairs(self.space.pets) do
		local leisureInfo = self.space.leisureState[petId]
		local leisureConfig = leisureInfo and HomeLeisureBehaviorData[leisureInfo.leisureId]

		if leisureConfig and leisureConfig.leisureType == Const.HOME_LEISURE_TYPE.PETTING then
			if playFailedAnim then
				self.space:allClientsMsg("RPC_SC_HomePettingLeisureFailed", petId)
			end

			self:clearPetLeisureState(petId)
		end
	end
end

function HomelandPetLeisureManager:removeRideVehicleOrnament(ornamentId)
	self.rideVehicleOrnamentIds[ornamentId] = nil

	local petIds = {}

	for petId, leisureInfo in pairs(self.space.leisureState) do
		if leisureInfo.vehicleOrnamentId == ornamentId then
			petIds[#petIds + 1] = petId
		end
	end

	for _, petId in ipairs(petIds) do
		self:clearPetLeisureState(petId)
	end
end

function HomelandPetLeisureManager:onRideVehicleOrnamentChanged(ornamentId, oldTemplateId)
	if oldTemplateId then
		local oldHomeObjectConfig = HomeObjectData[oldTemplateId]

		if not oldHomeObjectConfig then
			self.space.logger:error("onRideVehicleOrnamentChanged missing old home object config, ornamentId=%s, oldTemplateId=%s, %s", ornamentId, oldTemplateId, self.space:repr())
			self:removeRideVehicleOrnament(ornamentId)
		elseif oldHomeObjectConfig.subEntType == Const.HomelandEntSubType.Vehicle or oldHomeObjectConfig.subEntType == Const.HomelandEntSubType.FacilityVehicle then
			self:removeRideVehicleOrnament(ornamentId)
		end
	end

	local ornamentInfo = self.space.ornament[ornamentId]

	if not ornamentInfo then
		self.rideVehicleOrnamentIds[ornamentId] = nil

		return
	end

	local homeObjectConfig = HomeObjectData[ornamentInfo.homeId]

	if not homeObjectConfig then
		self.space.logger:error("onRideVehicleOrnamentChanged missing home object config, ornamentId=%s, homeId=%s, %s", ornamentId, tostring(ornamentInfo.homeId), self.space:repr())
		self:removeRideVehicleOrnament(ornamentId)

		return
	end

	local subEntType = homeObjectConfig.subEntType

	if subEntType == Const.HomelandEntSubType.Vehicle then
		self.rideVehicleOrnamentIds[ornamentId] = true
	else
		self.rideVehicleOrnamentIds[ornamentId] = nil
	end
end

function HomelandPetLeisureManager:onRideVehiclePositionChanged(ornamentId)
	if not self.rideVehicleOrnamentIds[ornamentId] then
		return
	end

	local petIds = {}

	for petId, leisureInfo in pairs(self.space.leisureState) do
		if leisureInfo.vehicleOrnamentId == ornamentId then
			petIds[#petIds + 1] = petId
		end
	end

	for _, petId in ipairs(petIds) do
		self:clearPetLeisureState(petId)
	end
end

function HomelandPetLeisureManager:onHomeLeisureFinished(petId, revision)
	local leisureInfo = self.space.leisureState[petId]

	if not leisureInfo or leisureInfo.revision ~= revision then
		return false
	end

	if self:isDualLeisureInfo(leisureInfo) and (leisureInfo.phase ~= Const.HOME_LEISURE_DUAL_PHASE.INTERACT or not HomeLandUtils.isDualLeisurePairValid(self.space.leisureState, petId, leisureInfo)) then
		return false
	end

	self:clearPetLeisureState(petId)

	return true
end

function HomelandPetLeisureManager:onHomeDualLeisureApproachFinished(petId, revision)
	local space = self.space
	local leisureInfo = space.leisureState[petId]

	if not leisureInfo or leisureInfo.revision ~= revision or not self:isDualLeisureInfo(leisureInfo) or leisureInfo.phase ~= Const.HOME_LEISURE_DUAL_PHASE.APPROACH or leisureInfo.dualRole ~= Const.HOME_LEISURE_DUAL_ROLE.MOVER or not HomeLandUtils.isDualLeisurePairValid(space.leisureState, petId, leisureInfo) then
		return false
	end

	local petEnt = pg.getEntity(petId)
	local partnerPetId = leisureInfo.partnerPetId
	local partnerEnt = pg.getEntity(partnerPetId)
	local petAreaId = HomeLandUtils.getHomePetAreaId(space, petId, petEnt)
	local partnerAreaId = HomeLandUtils.getHomePetAreaId(space, partnerPetId, partnerEnt)
	local petInfo = space.pets[petId]
	local allocationInfo = space.allocation[petId]
	local partnerPetInfo = space.pets[partnerPetId]
	local partnerAllocationInfo = space.allocation[partnerPetId]

	if not petEnt or petEnt.space ~= space or not partnerEnt or partnerEnt.space ~= space or petAreaId == nil or petAreaId ~= partnerAreaId or not petInfo or not Utils.checkHomePetStateValid(petInfo, space) or allocationInfo and allocationInfo.opId ~= Const.HOMELAND_FACILITY_OP_TYPE.NONE or not partnerPetInfo or not Utils.checkHomePetStateValid(partnerPetInfo, space) or partnerAllocationInfo and partnerAllocationInfo.opId ~= Const.HOMELAND_FACILITY_OP_TYPE.NONE or petEnt.onVehicleActorId ~= 0 or partnerEnt.onVehicleActorId ~= 0 or petEnt:attaching() or partnerEnt:attaching() then
		return false
	end

	local phaseStartTs = Time.getSecond()
	local partnerInfo = space.leisureState[partnerPetId]

	partnerInfo.phaseStartTs = phaseStartTs
	leisureInfo.phaseStartTs = phaseStartTs
	partnerInfo.phase = Const.HOME_LEISURE_DUAL_PHASE.INTERACT
	leisureInfo.phase = Const.HOME_LEISURE_DUAL_PHASE.INTERACT

	return true
end

function HomelandPetLeisureManager:isRideVehicleValid(vehicleEnt, petAreaId)
	return vehicleEnt ~= nil and vehicleEnt.space == self.space and petAreaId ~= nil and vehicleEnt.areaId == petAreaId and not vehicleEnt.isHomeFacility
end

function HomelandPetLeisureManager:tryMountRideVehicle(petEnt, vehicleActorId, seatIndex, revision)
	local space = self.space
	local leisureInfo = space.leisureState[petEnt.id]
	local leisureConfig = leisureInfo and HomeLeisureBehaviorData[leisureInfo.leisureId]

	if not leisureInfo or leisureInfo.revision ~= revision or not leisureConfig or leisureConfig.leisureType ~= Const.HOME_LEISURE_TYPE.RIDE then
		return
	end

	local petAreaId = HomeLandUtils.getHomePetAreaId(space, petEnt.id, petEnt)
	local vehicleEnt = space:getServerEntityByOrnamentId(leisureInfo.vehicleOrnamentId)

	if petEnt.space ~= space or petEnt.onVehicleActorId ~= 0 or not self:isRideVehicleValid(vehicleEnt, petAreaId) or vehicleEnt.actorId ~= vehicleActorId or leisureInfo.vehicleSeatIndex ~= seatIndex then
		return
	end

	vehicleEnt:onEntityMount(petEnt, seatIndex)
end

function HomelandPetLeisureManager:isOwnerPlayerInPetArea(petAreaId)
	local ownerPlayer = self.space.ownerPlayer

	if not ownerPlayer or petAreaId == nil then
		return false
	end

	local areaInfo = self.space.areaInfoDict[petAreaId]

	if not areaInfo then
		return false
	end

	local areaRange = self.space:getAreaRange(petAreaId)

	if not areaRange then
		return false
	end

	local localPosition = areaInfo.baseRotation:Inverse():MulVec3(ownerPlayer:getPosition() - areaInfo.basePosition)

	return areaRange[1] <= localPosition.x and localPosition.x <= areaRange[2] and areaRange[3] <= localPosition.z and localPosition.z <= areaRange[4]
end

function HomelandPetLeisureManager:isDualLeisureStateActive(petId, petEnt, petAreaId, leisureInfo, leisureConfig, curTs)
	local space = self.space
	local partnerPetId = leisureInfo.partnerPetId
	local partnerInfo = space.leisureState[partnerPetId]
	local partnerPetEnt = partnerPetId and pg.getEntity(partnerPetId)
	local partnerPetInfo = partnerPetId and space.pets[partnerPetId]
	local partnerAllocationInfo = partnerPetId and space.allocation[partnerPetId]
	local partnerAreaId = partnerPetId and HomeLandUtils.getHomePetAreaId(space, partnerPetId, partnerPetEnt)
	local phase = leisureInfo.phase
	local phaseStartTs = leisureInfo.phaseStartTs or leisureInfo.startTs
	local phaseTimeout

	if phase == Const.HOME_LEISURE_DUAL_PHASE.APPROACH then
		phaseTimeout = leisureConfig.approachTimeout or Const.HOME_LEISURE_TIMEOUT
	elseif phase == Const.HOME_LEISURE_DUAL_PHASE.INTERACT then
		phaseTimeout = Const.HOME_LEISURE_TIMEOUT
	end

	return partnerPetId ~= nil and partnerPetId ~= "" and partnerInfo ~= nil and partnerPetEnt ~= nil and partnerPetEnt.space == space and partnerPetInfo ~= nil and petAreaId == partnerAreaId and HomeLandUtils.isDualLeisurePairValid(space.leisureState, petId, leisureInfo) and Utils.checkHomePetStateValid(partnerPetInfo, space) and (not partnerAllocationInfo or partnerAllocationInfo.opId == Const.HOMELAND_FACILITY_OP_TYPE.NONE) and petEnt.onVehicleActorId == 0 and partnerPetEnt.onVehicleActorId == 0 and not partnerPetEnt:attaching() and phaseTimeout ~= nil and curTs < phaseStartTs + phaseTimeout
end

function HomelandPetLeisureManager:isRideLeisureStateActive(petId, petEnt, petAreaId, leisureInfo, leisureConfig, rideSeatReservations, curTs)
	local space = self.space
	local ornamentId = leisureInfo.vehicleOrnamentId
	local seatIndex = leisureInfo.vehicleSeatIndex
	local vehicleEnt = space:getServerEntityByOrnamentId(ornamentId)
	local isRideSeatValid = self:isRideVehicleValid(vehicleEnt, petAreaId) and vehicleEnt.checkSeatForbidden ~= nil

	if isRideSeatValid then
		if petEnt.onVehicleActorId == vehicleEnt.actorId then
			local mountedSeatIndex = vehicleEnt:getSeatIndex(petEnt.actorId)

			if mountedSeatIndex > 0 then
				isRideSeatValid = Time.secondCache < petEnt.rideStartTime + leisureConfig.time

				if isRideSeatValid then
					seatIndex = mountedSeatIndex

					if leisureInfo.vehicleSeatIndex ~= seatIndex then
						leisureInfo.vehicleSeatIndex = seatIndex
					end
				end
			else
				isRideSeatValid = false
			end
		else
			isRideSeatValid = (petEnt.onVehicleActorId == 0 or false) and curTs < leisureInfo.startTs + Const.HOME_LEISURE_TIMEOUT and seatIndex > 0 and vehicleEnt:checkSeatForbidden(petEnt, seatIndex) == NoticeDef.VEHICLE_MOUNT_SUCCESS
		end
	end

	local reservedSeats = rideSeatReservations[ornamentId]
	local canReserveRideSeat = isRideSeatValid and (not reservedSeats or not reservedSeats[seatIndex])

	if canReserveRideSeat then
		if not reservedSeats then
			reservedSeats = {}
			rideSeatReservations[ornamentId] = reservedSeats
		end

		reservedSeats[seatIndex] = petId
	end

	return canReserveRideSeat
end

function HomelandPetLeisureManager:isNormalLeisureStateActive(petEnt, petAreaId, leisureInfo, leisureConfig, leisureType, ownerInAreaCache, curTs)
	local ownerInPetArea = ownerInAreaCache[petAreaId]

	if leisureType == Const.HOME_LEISURE_TYPE.PETTING and ownerInPetArea == nil then
		ownerInPetArea = self:isOwnerPlayerInPetArea(petAreaId)
		ownerInAreaCache[petAreaId] = ownerInPetArea
	end

	local leisureTimeout = leisureConfig.time or Const.HOME_LEISURE_TIMEOUT
	local shouldPlayPettingSad = leisureType == Const.HOME_LEISURE_TYPE.PETTING and (curTs >= leisureInfo.startTs + leisureTimeout or not ownerInPetArea)
	local isActive = curTs < leisureInfo.startTs + leisureTimeout and petEnt.onVehicleActorId == 0 and (leisureType ~= Const.HOME_LEISURE_TYPE.PETTING or ownerInPetArea)

	return isActive, shouldPlayPettingSad
end

function HomelandPetLeisureManager:findNearestRideSeat(petEnt, petAreaId, rideSeatReservations)
	local space = self.space
	local rideOrnamentId, rideSeatIndex, rideTargetDistSqr

	for ornamentId in pairs(self.rideVehicleOrnamentIds) do
		local vehicleEnt = space:getServerEntityByOrnamentId(ornamentId)

		if self:isRideVehicleValid(vehicleEnt, petAreaId) and vehicleEnt.getValidSeatIndex then
			local reservedSeats = rideSeatReservations[ornamentId]
			local availableSeatIndex

			for _, seatIndex in ipairs(vehicleEnt:getValidSeatIndex(petEnt)) do
				if not reservedSeats or not reservedSeats[seatIndex] then
					availableSeatIndex = seatIndex

					break
				end
			end

			if availableSeatIndex then
				local distSqr = Vector3.HoriSqrDistance(petEnt:getPosition(), vehicleEnt:getPosition())

				if not rideTargetDistSqr or distSqr < rideTargetDistSqr then
					rideOrnamentId = ornamentId
					rideSeatIndex = availableSeatIndex
					rideTargetDistSqr = distSqr
				end
			end
		end
	end

	return rideOrnamentId, rideSeatIndex
end

function HomelandPetLeisureManager:getAvailableDualLeisurePartnerIds(petId, leisureId, leisureConfig, dualPartnerIds, petsToAllocateLeisure, curTs)
	if not dualPartnerIds then
		return nil
	end

	local availablePartnerIds

	for _, partnerPetId in ipairs(dualPartnerIds) do
		if partnerPetId ~= petId and petsToAllocateLeisure[partnerPetId] and not self.space.leisureState[partnerPetId] then
			local partnerCooldownKey = HomelandPetLeisureManager.getPetLeisureCooldownKey(partnerPetId, leisureId)
			local partnerCooldownEndTs = self.space.petLeisureCooldowns[partnerCooldownKey]

			if partnerCooldownEndTs and (not leisureConfig.cd or leisureConfig.cd <= 0 or partnerCooldownEndTs <= curTs) then
				self.space.petLeisureCooldowns[partnerCooldownKey] = nil
				partnerCooldownEndTs = nil
			end

			if partnerCooldownEndTs == nil then
				availablePartnerIds = availablePartnerIds or {}
				availablePartnerIds[#availablePartnerIds + 1] = partnerPetId
			end
		end
	end

	return availablePartnerIds
end

function HomelandPetLeisureManager:buildLeisureCandidates(petId, petAreaId, dualPartnerIds, rideOrnamentId, petsToAllocateLeisure, leisurePetCounts, ownerInAreaCache, curTs)
	local dualPartnerIdsByLeisure = {}
	local leisureWeightTable = {}

	for leisureId, config in pairs(HomeLeisureBehaviorData) do
		local eventCooldownEndTs = self.space.leisureEventCooldowns[leisureId]

		if eventCooldownEndTs and (not config.eventCd or config.eventCd <= 0 or eventCooldownEndTs <= curTs) then
			self.space.leisureEventCooldowns[leisureId] = nil
			eventCooldownEndTs = nil
		end

		if eventCooldownEndTs or not config.eventCd or config.eventCd <= 0 then
			self.space.leisureEventAllocationCounts[leisureId] = nil
		end

		local petCooldownKey = HomelandPetLeisureManager.getPetLeisureCooldownKey(petId, leisureId)
		local cooldownEndTs = self.space.petLeisureCooldowns[petCooldownKey]

		if cooldownEndTs and (not config.cd or config.cd <= 0 or cooldownEndTs <= curTs) then
			self.space.petLeisureCooldowns[petCooldownKey] = nil
			cooldownEndTs = nil
		end

		local canSelect = eventCooldownEndTs == nil and cooldownEndTs == nil and (not config.limitPetNum or (leisurePetCounts[leisureId] or 0) < config.limitPetNum)

		if config.leisureType == Const.HOME_LEISURE_TYPE.DUAL then
			local availablePartnerIds

			if canSelect then
				availablePartnerIds = self:getAvailableDualLeisurePartnerIds(petId, leisureId, config, dualPartnerIds, petsToAllocateLeisure, curTs)
				canSelect = availablePartnerIds ~= nil and (not config.limitPetNum or (leisurePetCounts[leisureId] or 0) + 2 <= config.limitPetNum)
			end

			if canSelect then
				dualPartnerIdsByLeisure[leisureId] = availablePartnerIds
			end
		elseif config.leisureType == Const.HOME_LEISURE_TYPE.PETTING then
			if canSelect then
				canSelect = ownerInAreaCache[petAreaId]

				if canSelect == nil then
					canSelect = self:isOwnerPlayerInPetArea(petAreaId)
					ownerInAreaCache[petAreaId] = canSelect
				end
			end
		elseif config.leisureType == Const.HOME_LEISURE_TYPE.RIDE then
			canSelect = canSelect and rideOrnamentId ~= nil
		end

		if canSelect then
			leisureWeightTable[leisureId] = config.weight or 0
		end
	end

	return leisureWeightTable, dualPartnerIdsByLeisure
end

function HomelandPetLeisureManager:recordLeisureAllocation(leisureId, allocationCount, curTs)
	local leisureConfig = HomeLeisureBehaviorData[leisureId]

	if not leisureConfig.eventCd or leisureConfig.eventCd <= 0 then
		return
	end

	local eventAllocationCount = (self.space.leisureEventAllocationCounts[leisureId] or 0) + allocationCount

	self.space.leisureEventAllocationCounts[leisureId] = eventAllocationCount

	if not leisureConfig.limitPetNum or eventAllocationCount >= leisureConfig.limitPetNum then
		self.space.leisureEventCooldowns[leisureId] = curTs + leisureConfig.eventCd
		self.space.leisureEventAllocationCounts[leisureId] = nil
	end
end

function HomelandPetLeisureManager:allocateDualLeisure(petId, partnerPetId, petAreaId, leisureId, petsToAllocateLeisure, leisurePetCounts, curTs)
	local space = self.space
	local moverPetId = lume.randomchoice({
		petId,
		partnerPetId
	})
	local targetPetId = moverPetId == petId and partnerPetId or petId
	local phase = Const.HOME_LEISURE_DUAL_PHASE.APPROACH

	space.leisureState[petId] = {
		vehicleSeatIndex = 0,
		vehicleOrnamentId = 0,
		leisureId = leisureId,
		startTs = curTs,
		revision = self.revision,
		partnerPetId = partnerPetId,
		dualRole = moverPetId == petId and Const.HOME_LEISURE_DUAL_ROLE.MOVER or Const.HOME_LEISURE_DUAL_ROLE.TARGET,
		phase = phase,
		phaseStartTs = curTs
	}
	space.leisureState[partnerPetId] = {
		vehicleSeatIndex = 0,
		vehicleOrnamentId = 0,
		leisureId = leisureId,
		startTs = curTs,
		revision = self.revision,
		partnerPetId = petId,
		dualRole = targetPetId == partnerPetId and Const.HOME_LEISURE_DUAL_ROLE.TARGET or Const.HOME_LEISURE_DUAL_ROLE.MOVER,
		phase = phase,
		phaseStartTs = curTs
	}
	self.leisureAreaIds[petId] = petAreaId
	self.leisureAreaIds[partnerPetId] = petAreaId
	petsToAllocateLeisure[petId] = nil
	petsToAllocateLeisure[partnerPetId] = nil
	leisurePetCounts[leisureId] = (leisurePetCounts[leisureId] or 0) + 2

	self:recordLeisureAllocation(leisureId, 2, curTs)
end

function HomelandPetLeisureManager:allocateSingleLeisure(petId, petAreaId, leisureId, rideOrnamentId, rideSeatIndex, rideSeatReservations, leisurePetCounts, curTs)
	local selectedConfig = HomeLeisureBehaviorData[leisureId]
	local isRide = selectedConfig.leisureType == Const.HOME_LEISURE_TYPE.RIDE

	self.space.leisureState[petId] = {
		leisureId = leisureId,
		vehicleOrnamentId = isRide and rideOrnamentId or 0,
		vehicleSeatIndex = isRide and rideSeatIndex or 0,
		startTs = curTs,
		revision = self.revision
	}
	self.leisureAreaIds[petId] = petAreaId
	leisurePetCounts[leisureId] = (leisurePetCounts[leisureId] or 0) + 1

	self:recordLeisureAllocation(leisureId, 1, curTs)

	if isRide then
		local reservedSeats = rideSeatReservations[rideOrnamentId]

		if not reservedSeats then
			reservedSeats = {}
			rideSeatReservations[rideOrnamentId] = reservedSeats
		end

		reservedSeats[rideSeatIndex] = petId
	end
end

function HomelandPetLeisureManager:checkAndUpdatePetLeisure()
	local space = self.space
	local curTs = Time.getSecond()

	self:cleanupExpiredPetLeisureCooldowns(curTs)

	local isLeisureAreaSnapshotMigration = self.leisureAreaIds == nil

	if isLeisureAreaSnapshotMigration then
		self.leisureAreaIds = {}
		self.rideVehicleOrnamentIds = {}

		for ornamentId in pairs(space.ornament) do
			self:onRideVehicleOrnamentChanged(ornamentId)
		end
	end

	local petsToAllocateLeisure = {}
	local rideSeatReservations = {}
	local leisurePetCounts = {}
	local petAreaIds = {}
	local ownerInAreaCache = {}

	for petId, petInfo in pairs(space.pets) do
		local leisureInfo = space.leisureState[petId]
		local allocationInfo = space.allocation[petId]
		local petEnt = pg.getEntity(petId)
		local petAreaId = HomeLandUtils.getHomePetAreaId(space, petId, petEnt)

		petAreaIds[petId] = petAreaId

		local canEnterLeisure = petEnt ~= nil and petEnt.space == space and petAreaId ~= nil and Utils.checkHomePetStateValid(petInfo, space) and (not allocationInfo or allocationInfo.opId == Const.HOMELAND_FACILITY_OP_TYPE.NONE) and not petEnt:attaching()
		local leisureConfig = leisureInfo and HomeLeisureBehaviorData[leisureInfo.leisureId]
		local leisureType = leisureConfig and leisureConfig.leisureType
		local shouldPlayPettingSad = false
		local areaSnapshotMatched = self.leisureAreaIds[petId] == petAreaId

		if isLeisureAreaSnapshotMigration and self.leisureAreaIds[petId] == nil and leisureType == Const.HOME_LEISURE_TYPE.RIDE then
			areaSnapshotMatched = true
		end

		local isActive = canEnterLeisure and leisureInfo and leisureConfig ~= nil and areaSnapshotMatched

		if isActive and leisureType == Const.HOME_LEISURE_TYPE.DUAL then
			isActive = self:isDualLeisureStateActive(petId, petEnt, petAreaId, leisureInfo, leisureConfig, curTs)
		elseif isActive and leisureType == Const.HOME_LEISURE_TYPE.RIDE then
			isActive = self:isRideLeisureStateActive(petId, petEnt, petAreaId, leisureInfo, leisureConfig, rideSeatReservations, curTs)
		elseif isActive then
			isActive, shouldPlayPettingSad = self:isNormalLeisureStateActive(petEnt, petAreaId, leisureInfo, leisureConfig, leisureType, ownerInAreaCache, curTs)
		end

		if isActive and isLeisureAreaSnapshotMigration and self.leisureAreaIds[petId] == nil then
			self.leisureAreaIds[petId] = petAreaId
		end

		if leisureInfo and not isActive then
			if shouldPlayPettingSad then
				self.space:allClientsMsg("RPC_SC_HomePettingLeisureFailed", petId)
			end

			self:clearPetLeisureState(petId, curTs)
		end

		if canEnterLeisure and not space.leisureState[petId] and petEnt.onVehicleActorId == 0 then
			petsToAllocateLeisure[petId] = petEnt
		end
	end

	for petId in pairs(space.pets) do
		local leisureInfo = space.leisureState[petId]

		if leisureInfo then
			leisurePetCounts[leisureInfo.leisureId] = (leisurePetCounts[leisureInfo.leisureId] or 0) + 1
		end
	end

	local dualPartnerIdsByArea = self:getDualLeisurePartnerIdsByArea(petsToAllocateLeisure, petAreaIds)
	local petIdsToAllocate = {}

	for petId in pairs(petsToAllocateLeisure) do
		petIdsToAllocate[#petIdsToAllocate + 1] = petId
	end

	lume.shuffle(petIdsToAllocate)

	for _, petId in ipairs(petIdsToAllocate) do
		local petEnt = petsToAllocateLeisure[petId]

		if petEnt then
			local petAreaId = petAreaIds[petId]
			local rideOrnamentId, rideSeatIndex = self:findNearestRideSeat(petEnt, petAreaId, rideSeatReservations)
			local dualPartnerIds = dualPartnerIdsByArea and dualPartnerIdsByArea[petAreaId]
			local leisureWeightTable, dualPartnerIdsByLeisure = self:buildLeisureCandidates(petId, petAreaId, dualPartnerIds, rideOrnamentId, petsToAllocateLeisure, leisurePetCounts, ownerInAreaCache, curTs)
			local selectedLeisureId = lume.weightedchoice(leisureWeightTable)

			if selectedLeisureId then
				self.revision = self.revision + 1

				if self.revision > Const.HOME_LEISURE_MAX_REVISION then
					self.revision = 1
				end

				local selectedConfig = HomeLeisureBehaviorData[selectedLeisureId]

				if selectedConfig.leisureType == Const.HOME_LEISURE_TYPE.DUAL then
					local availablePartnerIds = dualPartnerIdsByLeisure[selectedLeisureId]
					local partnerPetId = availablePartnerIds and lume.randomchoice(availablePartnerIds)
					local partnerPetEnt = partnerPetId and petsToAllocateLeisure[partnerPetId]

					if partnerPetEnt then
						self:allocateDualLeisure(petId, partnerPetId, petAreaId, selectedLeisureId, petsToAllocateLeisure, leisurePetCounts, curTs)
					end
				else
					self:allocateSingleLeisure(petId, petAreaId, selectedLeisureId, rideOrnamentId, rideSeatIndex, rideSeatReservations, leisurePetCounts, curTs)
				end
			end
		end
	end
end

return HomelandPetLeisureManager
