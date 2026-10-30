-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PetManage\\PetWarehouseDataAdapter.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetWarehouseDataAdapter = Class.LightClass("PetWarehouseDataAdapter")

function PetWarehouseDataAdapter:isMapAvailable(map)
	return map ~= nil and map.items ~= nil
end

function PetWarehouseDataAdapter:getBoxSequence(map)
	if not map or not map.sequence then
		return {}
	end

	if map.sequence.getRawTable then
		return map.sequence:getRawTable()
	end

	return map.sequence
end

function PetWarehouseDataAdapter:isBoxLocked(box)
	return box.isLocked ~= nil and box:isLocked() == true
end

function PetWarehouseDataAdapter:isNeedUnlock(box)
	if not box then
		return false
	end

	if box.isNeedUnlock ~= nil then
		return box:isNeedUnlock() == true
	end

	return box.needUnlock == true or tonumber(box.tempStatus) == Const.BOX_UNUSE_LOCKED
end

function PetWarehouseDataAdapter:isTempLocked(box)
	if not box then
		return false
	end

	if box.isTempLocked ~= nil then
		return box:isTempLocked() == true
	end

	return box.tempLocked == true or tonumber(box.tempStatus) == Const.BOX_TEMP_LOCKED
end

function PetWarehouseDataAdapter:canManualMove(box)
	if not box then
		return false
	end

	if box.canManualMove ~= nil then
		return box:canManualMove() == true
	end

	return not self:isNeedUnlock(box) and not self:isTempLocked(box)
end

local function parseWarehouseUnlockCost(cfg)
	local cost = cfg and cfg.cost
	local itemId = cost and tonumber(cost[1])
	local itemNum = cost and tonumber(cost[2])

	if itemId and itemNum and itemNum > 0 then
		return itemId, itemNum
	end

	return nil, nil
end

function PetWarehouseDataAdapter:getPaidUnlockMax()
	local PetWarehouseData = require("Data.pet_warehouse_data")
	local maxId = 0

	for id, row in pairs(PetWarehouseData) do
		local numId = tonumber(id)

		if numId and maxId < numId and parseWarehouseUnlockCost(row) then
			maxId = numId
		end
	end

	return maxId
end

function PetWarehouseDataAdapter:hasPaidUnlockRemaining(source)
	local count = 0

	if Utils.isTable(source) then
		count = tonumber(source.warehouseUnlockCount) or 0
	end

	return count < self:getPaidUnlockMax()
end

function PetWarehouseDataAdapter:getNextUnlockCost(player)
	local PetWarehouseData = require("Data.pet_warehouse_data")
	local nextIndex = (player and tonumber(player.warehouseUnlockCount) or 0) + 1
	local itemId, itemNum = parseWarehouseUnlockCost(PetWarehouseData[nextIndex])

	if not itemId then
		return nil, nil, nextIndex
	end

	return itemId, itemNum, nextIndex
end

function PetWarehouseDataAdapter:formatUnlockCostText(itemId, itemNum)
	if not itemId or not itemNum then
		return ""
	end

	return string.format("<sprite name=\"ui_item_%d_small\">%d", itemId, itemNum)
end

function PetWarehouseDataAdapter:getFirstNeedUnlockBox(snapshot)
	if not snapshot or not snapshot.boxes then
		return nil
	end

	for index = 1, #snapshot.boxes do
		local box = snapshot.boxes[index]

		if box and box.isWarehouse and box.needUnlock then
			return box
		end
	end

	return nil
end

function PetWarehouseDataAdapter:getFirstPayableWarehouseBox(snapshot)
	if not self:hasPaidUnlockRemaining(snapshot) then
		return nil
	end

	return self:getFirstNeedUnlockBox(snapshot)
end

function PetWarehouseDataAdapter:collectVisibleWarehouseBoxes(snapshot)
	local result = {}

	if not Utils.isTable(snapshot) then
		return result
	end

	if not Utils.isTable(snapshot.boxes) then
		return result
	end

	local showPaidUnlock = self:hasPaidUnlockRemaining(snapshot)
	local addedNeedUnlock = false

	for index = 1, #snapshot.boxes do
		local box = snapshot.boxes[index]

		if box and box.isWarehouse then
			if box.needUnlock == true then
				if showPaidUnlock and not addedNeedUnlock then
					result[#result + 1] = box
					addedNeedUnlock = true
				end
			else
				result[#result + 1] = box
			end
		end
	end

	return result
end

function PetWarehouseDataAdapter:makeBoxKey(domain, boxId)
	return tostring(domain) .. ":" .. tostring(boxId)
end

function PetWarehouseDataAdapter:readValidUsage(map)
	if not self:isMapAvailable(map) or map.getValidBoxCount == nil then
		return 0, 0, 0
	end

	local used = 0
	local capacity = 0
	local sequence = self:getBoxSequence(map)

	for sIndex = 1, map:getValidBoxCount() do
		local boxId = sequence[sIndex]
		local box = boxId ~= nil and map[boxId] or nil

		if box ~= nil and not self:isBoxLocked(box) then
			used = used + math.max(tonumber(box.count) or 0, 0)
			capacity = capacity + math.max(tonumber(box.slotCount) or 0, 0)
		end
	end

	return used, capacity, math.max(capacity - used, 0)
end

function PetWarehouseDataAdapter:collectBox(boxId, box, domain, boxes, locations, boxesById, petIdsByBoxSlot)
	if not box then
		return
	end

	local needUnlock = domain == PetWarehouseConst.DOMAIN.WAREHOUSE and self:isNeedUnlock(box)
	local playerLocked = box.isManualLocked ~= nil and box:isManualLocked() == true or box.locked == true
	local tempLocked = self:isTempLocked(box)
	local boxRecord = {
		id = boxId,
		domain = domain,
		boxKey = self:makeBoxKey(domain, boxId),
		isWarehouse = domain == PetWarehouseConst.DOMAIN.WAREHOUSE,
		count = tonumber(box.count) or 0,
		slotCount = tonumber(box.slotCount) or 0,
		locked = playerLocked,
		needUnlock = needUnlock,
		tempLocked = tempLocked,
		customName = box.customName or ""
	}

	boxes[#boxes + 1] = boxRecord
	boxesById[boxRecord.boxKey] = boxRecord

	local inLockedBox = playerLocked or tempLocked or self:isNeedUnlock(box) == true
	local slotPetIds = petIdsByBoxSlot[boxRecord.boxKey]

	if not slotPetIds then
		slotPetIds = {}
		petIdsByBoxSlot[boxRecord.boxKey] = slotPetIds
	end

	for slot = 1, boxRecord.slotCount do
		local petId = box[slot]

		if petId ~= nil and petId ~= "" then
			slotPetIds[slot] = petId

			if locations[petId] then
				locations[petId].conflict = true

				if inLockedBox then
					locations[petId].inLockedBox = true
				end
			else
				locations[petId] = {
					domain = domain,
					boxId = boxId,
					slot = slot,
					inLockedBox = inLockedBox
				}
			end
		end
	end
end

function PetWarehouseDataAdapter:collectMap(map, domain, boxes, locations, boxesById, petIdsByBoxSlot)
	if not self:isMapAvailable(map) then
		return
	end

	local sequence = self:getBoxSequence(map)
	local sequenceSet = {}

	for _, boxId in ipairs(sequence) do
		sequenceSet[boxId] = true
	end

	for boxId, box in map:items() do
		if not sequenceSet[boxId] then
			self:collectBox(boxId, box, domain, boxes, locations, boxesById, petIdsByBoxSlot)
		end
	end

	for _, boxId in ipairs(sequence) do
		self:collectBox(boxId, map[boxId], domain, boxes, locations, boxesById, petIdsByBoxSlot)
	end
end

function PetWarehouseDataAdapter:buildSummaryMap(simplifyPets, locations, pets, player)
	local summaries = {}

	if not self:isMapAvailable(simplifyPets) then
		return summaries
	end

	for petId, simpleInfo in simplifyPets:items() do
		if simpleInfo and petId then
			local location = locations[petId]

			summaries[petId] = {
				id = simpleInfo.id or petId,
				templateId = simpleInfo.templateId,
				customName = simpleInfo.customName or "",
				time = simpleInfo.time or 0,
				level = simpleInfo.level or 0,
				label = simpleInfo.label or 0,
				favoriteType = simpleInfo.favoriteType or 0,
				isSealed = simpleInfo.isSealed == true,
				gender = simpleInfo.gender or 0,
				hpRatio = simpleInfo.hpRatio or 1,
				cp = simpleInfo.cpValue or 0,
				propertyScoreStage = simpleInfo.propertyScoreStage or 0,
				curCharacter = simpleInfo.curCharacter or 0,
				isCatchReportingStatus = Utils.isPetCatchReporting(player, petId),
				sourceDomain = location and location.domain or PetWarehouseConst.DOMAIN.NONE,
				inLockedBox = location and location.inLockedBox == true or false,
				boxId = location and location.boxId or nil,
				slot = location and location.slot or nil,
				conflict = location and location.conflict == true or false,
				hasFullInfo = self:hasFullInfo(player, petId)
			}
		end
	end

	return summaries
end

function PetWarehouseDataAdapter:buildSnapshot(player)
	local snapshot = {
		revision = 0,
		boxes = {},
		boxesById = {},
		locations = {},
		petIdsByBoxSlot = {},
		summaries = {},
		usage = {
			warehouseEmpty = 0,
			warehouseCapacity = 0,
			warehouseUsed = 0,
			bagEmpty = 0,
			bagCapacity = 0,
			bagUsed = 0
		}
	}

	if not player then
		return snapshot
	end

	self:collectMap(player.petBoxMap, PetWarehouseConst.DOMAIN.BAG, snapshot.boxes, snapshot.locations, snapshot.boxesById, snapshot.petIdsByBoxSlot)
	self:collectMap(player.warehousePetBoxMap, PetWarehouseConst.DOMAIN.WAREHOUSE, snapshot.boxes, snapshot.locations, snapshot.boxesById, snapshot.petIdsByBoxSlot)

	local usage = snapshot.usage

	usage.bagUsed, usage.bagCapacity, usage.bagEmpty = self:readValidUsage(player.petBoxMap)
	usage.warehouseUsed, usage.warehouseCapacity, usage.warehouseEmpty = self:readValidUsage(player.warehousePetBoxMap)
	snapshot.summaries = self:buildSummaryMap(player.simplifyPets, snapshot.locations, player.pets, player)
	snapshot.warehouseUnlockCount = tonumber(player.warehouseUnlockCount) or 0

	return snapshot
end

function PetWarehouseDataAdapter:getBox(snapshot, domain, boxId)
	if not snapshot or not snapshot.boxesById or boxId == nil or domain == nil then
		return nil
	end

	return snapshot.boxesById[self:makeBoxKey(domain, boxId)]
end

function PetWarehouseDataAdapter:getWarehouseBox(snapshot, boxId)
	return self:getBox(snapshot, PetWarehouseConst.DOMAIN.WAREHOUSE, boxId)
end

function PetWarehouseDataAdapter:getValidEmptySlot(map)
	if not self:isMapAvailable(map) then
		return 0
	end

	if map.getValidEmptySlot ~= nil then
		return math.max(tonumber(map:getValidEmptySlot()) or 0, 0)
	end

	local _, _, empty = self:readValidUsage(map)

	return empty
end

function PetWarehouseDataAdapter:getManualWritableEmptySlot(map)
	if not self:isMapAvailable(map) then
		return 0
	end

	if map.getManualWritableEmptySlot ~= nil then
		return math.max(tonumber(map:getManualWritableEmptySlot()) or 0, 0)
	end

	if map.getValidBoxCount == nil then
		return 0
	end

	local sequence = self:getBoxSequence(map)
	local empty = 0

	for sIndex = 1, map:getValidBoxCount() do
		local boxId = sequence[sIndex]
		local box = boxId ~= nil and map[boxId] or nil

		if box ~= nil and self:canManualMove(box) then
			local slotCount = math.max(tonumber(box.slotCount) or 0, 0)
			local used = math.max(tonumber(box.count) or 0, 0)

			empty = empty + math.max(slotCount - used, 0)
		end
	end

	return empty
end

function PetWarehouseDataAdapter:getGrowableEmptySlot(map)
	if not self:isMapAvailable(map) then
		return 0
	end

	if type(map.getGrowableEmptySlot) == "function" then
		return math.max(tonumber(map:getGrowableEmptySlot()) or 0, 0)
	end

	local emptySlot = self:getValidEmptySlot(map)

	if type(map.getBoxNumMax) ~= "function" or type(map.getSlotCount) ~= "function" then
		return emptySlot
	end

	local maxBoxCount = tonumber(map:getBoxNumMax()) or 0
	local existingBoxCount = 0

	if type(map.getValidBoxCount) == "function" then
		existingBoxCount = map:getValidBoxCount()
	end

	local slotCount = tonumber(map:getSlotCount()) or 0
	local growableBoxCount = math.max(maxBoxCount - existingBoxCount, 0)

	return emptySlot + growableBoxCount * math.max(slotCount, 0)
end

function PetWarehouseDataAdapter:getFullInfo(player, petId, sourcePetInfo)
	if not player or player.destroyed then
		return nil
	end

	if sourcePetInfo and sourcePetInfo.id == petId then
		return sourcePetInfo
	end

	local pet = player.pets and player.pets[petId]

	if pet then
		return pet
	end

	return nil
end

function PetWarehouseDataAdapter:hasFullInfo(player, petId)
	return self:getFullInfo(player, petId) ~= nil
end

function PetWarehouseDataAdapter:getDomain(snapshot, petId)
	local location = snapshot and snapshot.locations and snapshot.locations[petId]

	if not location then
		return PetWarehouseConst.DOMAIN.NONE
	end

	if location.conflict then
		return PetWarehouseConst.DOMAIN.NONE
	end

	return location.domain
end

function PetWarehouseDataAdapter:collectMovedInPetIds(previousSnapshot, currentSnapshot)
	local movedIn = {}

	if not Utils.isTable(previousSnapshot) or not Utils.isTable(currentSnapshot) then
		return movedIn
	end

	local oldLocations = previousSnapshot.locations
	local newLocations = currentSnapshot.locations

	if not Utils.isTable(oldLocations) or not Utils.isTable(newLocations) then
		return movedIn
	end

	local bagDomain = PetWarehouseConst.DOMAIN.BAG
	local warehouseDomain = PetWarehouseConst.DOMAIN.WAREHOUSE

	for petId, newLoc in pairs(newLocations) do
		if Utils.isTable(newLoc) and newLoc.domain == warehouseDomain and newLoc.conflict ~= true then
			local oldLoc = oldLocations[petId]

			if Utils.isTable(oldLoc) and oldLoc.domain == bagDomain then
				movedIn[#movedIn + 1] = petId
			end
		end
	end

	return movedIn
end

function PetWarehouseDataAdapter:normalizePetIds(petIds)
	if not Utils.isTable(petIds) then
		return nil, PetWarehouseConst.REASON.EMPTY_IDS
	end

	local result = {}
	local seen = {}

	for _, petId in ipairs(petIds) do
		local petIdType = type(petId)

		if petIdType ~= "string" and petIdType ~= "number" then
			return nil, PetWarehouseConst.REASON.PET_NOT_FOUND
		end

		if petId == nil or petId == "" or petId ~= petId then
			return nil, PetWarehouseConst.REASON.PET_NOT_FOUND
		end

		local seenKey = petIdType .. ":" .. tostring(petId)

		if seen[seenKey] then
			return nil, PetWarehouseConst.REASON.DUPLICATE_IDS
		end

		seen[seenKey] = true
		result[#result + 1] = petId
	end

	if #result == 0 then
		return nil, PetWarehouseConst.REASON.EMPTY_IDS
	end

	return result
end

function PetWarehouseDataAdapter:chunkPetIds(petIds, batchLimit)
	local result = {}
	local limit = tonumber(batchLimit) or Const.BATCH_OPERATE_WARE_PET_LIMIT

	if limit <= 0 then
		return result
	end

	for startIndex = 1, #petIds, limit do
		local batch = {}
		local endIndex = math.min(startIndex + limit - 1, #petIds)

		for index = startIndex, endIndex do
			batch[#batch + 1] = petIds[index]
		end

		result[#result + 1] = batch
	end

	return result
end

return PetWarehouseDataAdapter
