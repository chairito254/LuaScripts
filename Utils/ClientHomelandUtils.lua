-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\ClientHomelandUtils.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local HomelandFormulaData = require("Data.homeland_formula_data")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local HomeObjectData = require("Data.home_object_data")
local HomeTypeData = require("Data.home_type_data")
local RevertHomeObjectData = require("Data.revert_home_object_data")
local ClientConst = require("Const.ClientConst")
local RedDotConst = require("Const.RedDotConst")
local PetData = require("Data.pet_data")
local AreaData = require("Data.homeland_area_data")
local HomeData = require("Data.homeland_config_data")
local HomeUpgradeData = require("Data.home_upgrade_data")
local ComposeData = require("Data.home_handbook_ornament_set_data")
local FurnitureData = require("Data.home_handbook_homeland_data")
local ComposeFurnitureData = require("Data.compose_furniture_data")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local ItemData = require("Data.item_data")
local ItemSourceData = require("Data.item_source_data")
local InteractData = require("Data.interact_data")
local InteractionConst = require("Common.Const.InteractionConst")
local HomeItemReleaseData = require("Data.home_item_release_data")
local HomeItemNewData = require("Data.home_item_new_data")
local RevertHomeItemNewData = require("Data.revert_home_item_new_data")
local LotteryUtils = require("Utils.LotteryUtils")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local ShopCommonHelper = require("Utils.ShopCommonHelper")
local ClientHomelandUtils = {}

ClientHomelandUtils.FURNITURE_NEW_ARRIVAL_TYPE_ID = 98
ClientHomelandUtils.HomelandUnlockType = {
	Drawing = 2,
	Condition = 1,
	None = 0
}
ClientHomelandUtils.ComposeFurnitureState = {
	NotEnough = 3,
	Replaceable = 2,
	Enough = 1
}

local HOMELAND_DRAWING_UNLOCK_DESC = "HOMELAND_DRAWING_UNLOCK_DESC"
local HOMELAND_DRAWING_SOURCE_TITLE = "HOMELAND_DRAWING_SOURCE_TITLE"
local HOMELAND_NOTE_UNLOCK_DESC = "HOMELAND_NOTE_UNLOCK_DESC"
local HOMELAND_NOTE_SOURCE_TITLE = "HOMELAND_NOTE_SOURCE_TITLE"
local HOMELAND_DRAWING_UNLOCK_DESC_SIMPLE = "HOMELAND_DRAWING_UNLOCK_DESC_SIMPLE"
local FURNITURE_RED_DOT_READ_SNAPSHOT_KEY = "read_snapshot"
local FURNITURE_RED_DOT_ITEM_TYPE_ID = 101

local function isAccelerateNeedPetWork(formulaData)
	return formulaData.accelerateNeedPetWork == 1 or formulaData.accelerateNeedPetWork == true
end

local function hasPetWorkingOnProduceStage(space, ornamentId, stageId)
	local petList = space.facilityAllocationInfo[ornamentId]

	if not petList then
		return false
	end

	local allocationMap = space.allocation

	for _, petId in ipairs(petList) do
		local allocationInfo = allocationMap[petId]

		if allocationInfo and allocationInfo.opId == stageId then
			return true
		end
	end

	return false
end

function ClientHomelandUtils.getDrawingUnlockText(isFurniture, simple)
	if isFurniture then
		if simple then
			local text = pg.getGameString(HOMELAND_DRAWING_UNLOCK_DESC_SIMPLE)

			if not text or text == "" or text == HOMELAND_DRAWING_UNLOCK_DESC_SIMPLE or tonumber(text) then
				return "图纸解锁"
			end

			return text
		end

		local text = pg.getGameString(HOMELAND_DRAWING_UNLOCK_DESC)

		if not text or text == "" or text == HOMELAND_DRAWING_UNLOCK_DESC or tonumber(text) then
			return "获取家具图纸后解锁"
		end

		return text
	end

	local text = pg.getGameString(HOMELAND_NOTE_UNLOCK_DESC)

	if not text or text == "" or text == HOMELAND_NOTE_UNLOCK_DESC or tonumber(text) then
		return "获取配方笔记后解锁"
	end

	return text
end

function ClientHomelandUtils.getDrawingSourceTitle(isFurniture)
	if isFurniture then
		local text = pg.getGameString(HOMELAND_DRAWING_SOURCE_TITLE)

		if not text or text == "" or text == HOMELAND_DRAWING_SOURCE_TITLE or tonumber(text) then
			return "图纸获取途径"
		end

		return text
	end

	local text = pg.getGameString(HOMELAND_NOTE_SOURCE_TITLE)

	if not text or text == "" or text == HOMELAND_NOTE_SOURCE_TITLE or tonumber(text) then
		return "笔记获取途径"
	end

	return text
end

local function buildUnlockState(config, drawingUnlocked, isFurniture, simple)
	local conditionLocked = config.unlockCondition ~= nil and not pg.me.triggerMap:isCompleteOrMeetCondition(config.unlockCondition)
	local drawingLocked = not drawingUnlocked
	local lockType = ClientHomelandUtils.HomelandUnlockType.None
	local lockText = ""

	if conditionLocked then
		lockType = ClientHomelandUtils.HomelandUnlockType.Condition
		lockText = pg.getLocalizationText(config.unlockDesc or "")

		if lockText == "" then
			lockText = LuaUIUtils.getConditionUnlockDesc(config.unlockCondition)
		end
	elseif drawingLocked then
		lockType = ClientHomelandUtils.HomelandUnlockType.Drawing
		lockText = ClientHomelandUtils.getDrawingUnlockText(isFurniture, simple)
	end

	return {
		isLocked = lockType ~= ClientHomelandUtils.HomelandUnlockType.None,
		lockType = lockType,
		conditionLocked = conditionLocked,
		drawingLocked = drawingLocked,
		unlockItemId = config.unlockByItemId or 0,
		lockText = lockText
	}
end

function ClientHomelandUtils.getFurnitureUnlockState(itemId, isSimple)
	local config = HomeObjectData[itemId]

	return buildUnlockState(config, HomeLandUtils.isHomelandFurnitureDrawingUnlocked(pg.me, itemId), true, isSimple)
end

function ClientHomelandUtils.isFurnitureAvailableInArea(itemId)
	local areaNo = Utils.getServerArea()

	return ShopCommonHelper.isConfigAvailableInArea(ItemData[itemId], areaNo) and ShopCommonHelper.isConfigAvailableInArea(HomeObjectData[itemId], areaNo)
end

function ClientHomelandUtils.getFurnitureReleaseFinishTime(itemId)
	local releaseInfo = HomeItemReleaseData[itemId]

	if not Utils.isTable(releaseInfo) or not releaseInfo.finishTimeRefId then
		return nil
	end

	return Utils.getConfigTimeOfAreaByData(nil, releaseInfo.finishTimeRefId)
end

function ClientHomelandUtils.getFurnitureNextRefreshTime()
	local currentTime = Time.secondCache or Time.getSecond()
	local nextRefreshTime

	for _, newInfo in pairs(HomeItemNewData) do
		if Utils.isTable(newInfo) then
			local startTime = newInfo.startTimeRefId and Utils.getConfigTimeOfAreaByData(nil, newInfo.startTimeRefId)
			local finishTime = newInfo.finishTimeRefId and Utils.getConfigTimeOfAreaByData(nil, newInfo.finishTimeRefId)

			if startTime and currentTime < startTime and (not nextRefreshTime or startTime < nextRefreshTime) then
				nextRefreshTime = startTime
			end

			local offShelfTime = finishTime and finishTime + 1

			if offShelfTime and currentTime < offShelfTime and (not nextRefreshTime or offShelfTime < nextRefreshTime) then
				nextRefreshTime = offShelfTime
			end
		end
	end

	for _, releaseInfo in pairs(HomeItemReleaseData) do
		if Utils.isTable(releaseInfo) then
			local startTime = releaseInfo.timeRefId and Utils.getConfigTimeOfAreaByData(nil, releaseInfo.timeRefId)
			local finishTime = releaseInfo.finishTimeRefId and Utils.getConfigTimeOfAreaByData(nil, releaseInfo.finishTimeRefId)

			if startTime and currentTime < startTime and (not nextRefreshTime or startTime < nextRefreshTime) then
				nextRefreshTime = startTime
			end

			local offShelfTime = finishTime and finishTime + 1

			if offShelfTime and currentTime < offShelfTime and (not nextRefreshTime or offShelfTime < nextRefreshTime) then
				nextRefreshTime = offShelfTime
			end
		end
	end

	return nextRefreshTime
end

function ClientHomelandUtils.getFurnitureReleaseState(itemId)
	local currentTime = Time.secondCache or Time.getSecond()
	local releaseConfig = HomeItemReleaseData[itemId]

	if not releaseConfig then
		return {
			isReleaseTimeOffShelf = false,
			isOffShelf = false,
			isReleased = true
		}
	end

	local hasStartTime = releaseConfig.timeRefId and releaseConfig.timeRefId ~= 0
	local hasFinishTime = releaseConfig.finishTimeRefId and releaseConfig.finishTimeRefId ~= 0
	local startTime = hasStartTime and Utils.getConfigTimeOfAreaByData(nil, releaseConfig.timeRefId)
	local releaseFinishTime = ClientHomelandUtils.getFurnitureReleaseFinishTime(itemId)

	if hasStartTime and not startTime or hasFinishTime and not releaseFinishTime then
		return {
			isReleaseTimeOffShelf = false,
			isOffShelf = false,
			isReleased = false
		}
	end

	if releaseFinishTime and releaseFinishTime < currentTime then
		return {
			isReleaseTimeOffShelf = true,
			isOffShelf = true,
			isReleased = true
		}
	end

	local hasRule = false
	local isReleased = false
	local anyOnShelf = false

	if startTime then
		hasRule = true

		if startTime <= currentTime then
			isReleased = true
			anyOnShelf = true
		end
	end

	if releaseConfig and releaseConfig.commodityId then
		local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
		local commodityInfo = ClientCashShopUtils.getCommodityData(releaseConfig.commodityId)

		if commodityInfo then
			hasRule = true

			if ClientCashShopUtils.isCommodityOnShelf(commodityInfo, releaseConfig.commodityId) then
				isReleased = true
				anyOnShelf = true
			elseif ClientCashShopUtils.isCommodityAfterStartTime(commodityInfo) then
				isReleased = true
			end
		end
	end

	if releaseConfig and releaseConfig.lotteryId then
		hasRule = true

		if LotteryUtils.isOpen(releaseConfig.lotteryId) then
			isReleased = true
			anyOnShelf = true
		end
	end

	if not hasRule then
		return {
			isReleaseTimeOffShelf = false,
			isOffShelf = false,
			isReleased = true
		}
	end

	return {
		isReleaseTimeOffShelf = false,
		isReleased = isReleased,
		isOffShelf = isReleased and not anyOnShelf
	}
end

function ClientHomelandUtils.isFurnitureHiddenInStore(itemId)
	local objectInfo = HomeObjectData[itemId]

	return objectInfo ~= nil and (objectInfo.hideInStore == 1 or objectInfo.hideInStore == true)
end

function ClientHomelandUtils.getFurnitureNewArrivalItemIds(subTypeId)
	local result = {}

	for _, itemId in ipairs(RevertHomeItemNewData[subTypeId] or EMPTY_TABLE) do
		local newInfo = HomeItemNewData[itemId]

		if Utils.isTable(newInfo) then
			local startTime = newInfo.startTimeRefId and Utils.getConfigTimeOfAreaByData(nil, newInfo.startTimeRefId)
			local finishTime = newInfo.finishTimeRefId and Utils.getConfigTimeOfAreaByData(nil, newInfo.finishTimeRefId)

			if HomeObjectData[itemId] and startTime and finishTime and TimeUtils.isInRangeTimestamp(startTime, finishTime) then
				table.insert(result, itemId)
			end
		end
	end

	return result
end

function ClientHomelandUtils.getFurnitureNewArrivalSubTypeMap()
	local result = {}

	for subTypeId in pairs(RevertHomeItemNewData) do
		local itemIds = ClientHomelandUtils.getFurnitureNewArrivalItemIds(subTypeId)

		if #itemIds > 0 then
			result[subTypeId] = itemIds
		end
	end

	return result
end

function ClientHomelandUtils:isLotteryOpen(lotteryId)
	if lotteryId then
		return LotteryUtils.isOpen(lotteryId)
	end

	return true
end

function ClientHomelandUtils.getFormulaUnlockState(formulaId)
	local config = HomelandFormulaData[formulaId]

	return buildUnlockState(config, HomeLandUtils.isHomelandFormulaDrawingUnlocked(pg.me, formulaId), false, false)
end

function ClientHomelandUtils.getDrawingSourceList(unlockItemId)
	local sourceList = {}
	local itemConfig = ItemData[unlockItemId]

	for _, sourceId in ipairs(itemConfig.source or EMPTY_TABLE) do
		local sourceConfig = ItemSourceData[sourceId]

		if sourceConfig then
			local conditionPass = LuaUIUtils.checkItemSourceCondition(sourceConfig)

			if conditionPass or sourceConfig.showForce == 1 then
				local sourceData = {
					clueSeekID = sourceId,
					conditionPass = conditionPass
				}

				table.merge(sourceData, sourceConfig)

				sourceList[#sourceList + 1] = sourceData
			end
		end
	end

	return sourceList
end

function ClientHomelandUtils.getHomeEditorEditType(editor, editType)
	if editType then
		return editType
	end

	if editor and editor.editType == ClientConst.EntityEditType.Create then
		return ClientConst.HomeEditType.PlaceOrnament
	end

	if editor and editor.editType == ClientConst.EntityEditType.Update then
		return ClientConst.HomeEditType.UpdateOrnament
	end
end

function ClientHomelandUtils.getPendingPlaceOrnamentCount(context)
	context = context or {}

	if context.isPet or context.templateEntityType == Const.HomelandEntType.Pet then
		return 0
	end

	local editInfo = context.editInfo
	local editType = ClientHomelandUtils.getHomeEditorEditType(context.editor, context.editType or editInfo and editInfo.editType)

	if editType ~= ClientConst.HomeEditType.PlaceOrnament and editType ~= ClientConst.HomeEditType.UpdateOrnament then
		return 0
	end

	local templateEntity = context.templateEntity or context.editor and context.editor.templateEntity

	if templateEntity and templateEntity.getGroupPlaceChildCount then
		local count = templateEntity:getGroupPlaceChildCount()

		if editType == ClientConst.HomeEditType.UpdateOrnament then
			count = count - 1
		end

		return math.max(count, 0)
	end

	if editType == ClientConst.HomeEditType.PlaceOrnament then
		return 1
	end

	return 0
end

function ClientHomelandUtils.getPendingPlaceHomeTemplateId(context)
	context = context or {}

	if context.homeTemplateId then
		return context.homeTemplateId
	end

	local editInfo = context.editInfo

	if editInfo then
		if editInfo.homeTemplateId then
			return editInfo.homeTemplateId
		end

		if editInfo.entity then
			return editInfo.entity.homeTemplateId
		end
	end

	if context.entity then
		return context.entity.homeTemplateId
	end
end

function ClientHomelandUtils.getLoadValueById(id)
	local homeObjectData = HomeObjectData[id] or {}

	return homeObjectData.loadValue or 0
end

function ClientHomelandUtils.getComfortValueById(id)
	local homeObjectData = HomeObjectData[id] or {}

	return homeObjectData.comfortValue or 0
end

function ClientHomelandUtils.getUnlockedPlotCount(areaId)
	local plotCount = 0
	local targetAreaId = tonumber(areaId)

	for zoneId, zoneData in pairs(HomeLandUtils.getHomelandZoneUnlockData()) do
		if tonumber(zoneData.areaId) == targetAreaId and pg.game.home:isHomelandZoneUnlock(zoneId) then
			plotCount = plotCount + 1
		end
	end

	return plotCount
end

function ClientHomelandUtils.getFurnitureOwnCount(homeId)
	local ownCount = ClientUtils.getItemCountById(homeId) or 0

	if pg.me:isInSelfHomeland() then
		ownCount = ownCount + (ClientUtils.getHomelandItemCountById(homeId) or 0)
	end

	return ownCount
end

function ClientHomelandUtils.getFurniturePlacedCount(homeId)
	return (pg.me.statHomelandOrnament[homeId] or 0) + (pg.me.statHomeCarOrnament[homeId] or 0)
end

function ClientHomelandUtils.getFurnitureUpgradeChainOwnCount(homeId)
	local facilityTypeId = Utils.getHomeOrnamentCurLevelInfo(homeId)

	if not facilityTypeId then
		return ClientHomelandUtils.getFurnitureOwnCount(homeId)
	end

	local ownCount = 0

	for _, levelInfo in ipairs(HomeUpgradeData[facilityTypeId] or EMPTY_TABLE) do
		ownCount = ownCount + ClientHomelandUtils.getFurnitureOwnCount(levelInfo.homeTemplateId)
	end

	return ownCount
end

function ClientHomelandUtils.checkComposeFurnitureEnough(data)
	local ornaments = data and data.ornaments

	if not ornaments or #ornaments <= 0 then
		return ClientHomelandUtils.ComposeFurnitureState.NotEnough
	end

	local needNumByHomeId = {}

	for _, ornamentInfo in ipairs(ornaments) do
		local homeId = ornamentInfo.homeId

		needNumByHomeId[homeId] = (needNumByHomeId[homeId] or 0) + 1
	end

	local facilityTypeIdByHomeId = {}
	local allNeedNumByFacilityTypeId = {}

	for homeId, needNum in pairs(needNumByHomeId) do
		local facilityTypeId = Utils.getHomeOrnamentCurLevelInfo(homeId)

		facilityTypeIdByHomeId[homeId] = facilityTypeId

		if facilityTypeId then
			allNeedNumByFacilityTypeId[facilityTypeId] = (allNeedNumByFacilityTypeId[facilityTypeId] or 0) + needNum
		end
	end

	local haveNumByHomeId = {}
	local allHaveNumByFacilityTypeId = {}

	for homeId in pairs(needNumByHomeId) do
		haveNumByHomeId[homeId] = ClientHomelandUtils.getFurnitureOwnCount(homeId)

		local facilityTypeId = facilityTypeIdByHomeId[homeId]

		if facilityTypeId and allHaveNumByFacilityTypeId[facilityTypeId] == nil then
			allHaveNumByFacilityTypeId[facilityTypeId] = ClientHomelandUtils.getFurnitureUpgradeChainOwnCount(homeId)
		end
	end

	local isFurnitureEnough = true
	local isUpgradeChainFurnitureEnough = true

	for homeId, needNum in pairs(needNumByHomeId) do
		if needNum > haveNumByHomeId[homeId] then
			isFurnitureEnough = false

			local facilityTypeId = facilityTypeIdByHomeId[homeId]

			if not facilityTypeId or allHaveNumByFacilityTypeId[facilityTypeId] < allNeedNumByFacilityTypeId[facilityTypeId] then
				isUpgradeChainFurnitureEnough = false

				break
			end
		end
	end

	local state = ClientHomelandUtils.ComposeFurnitureState.NotEnough

	if isFurnitureEnough then
		state = ClientHomelandUtils.ComposeFurnitureState.Enough
	elseif isUpgradeChainFurnitureEnough then
		state = ClientHomelandUtils.ComposeFurnitureState.Replaceable
	end

	return state
end

function ClientHomelandUtils.getPlanAreaReusableFurnitureCountMap(areaId, homeSpace, isHomeCampPlan)
	local currentCounts = {}

	for _, ornamentInfo in pairs(homeSpace and homeSpace.ornament or EMPTY_TABLE) do
		local homeId = ornamentInfo.homeId
		local canReuse

		if isHomeCampPlan then
			canReuse = Utils.checkHomeObjectEditable(homeId)
		else
			local ornamentAreaId = tonumber(ornamentInfo.areaId) or Const.HOMELAND_AREA_TYPE.PRODUCE

			canReuse = ornamentAreaId == areaId and Utils.checkHomeObjectEditable(homeId)
		end

		if canReuse then
			currentCounts[homeId] = (currentCounts[homeId] or 0) + 1
		end
	end

	return currentCounts
end

function ClientHomelandUtils.checkPlanFurnitureEnough(data, areaId, homeSpace, isHomeCampPlan)
	local requiredCounts = {}
	local upgradeChainRequiredCounts = {}
	local upgradeChainHomeIds = {}

	for _, ornamentInfo in ipairs(data.ornaments) do
		local homeId = ornamentInfo.homeId
		local facilityTypeId = Utils.getHomeOrnamentCurLevelInfo(homeId)

		if facilityTypeId then
			upgradeChainRequiredCounts[facilityTypeId] = (upgradeChainRequiredCounts[facilityTypeId] or 0) + 1
			upgradeChainHomeIds[facilityTypeId] = homeId
		else
			requiredCounts[homeId] = (requiredCounts[homeId] or 0) + 1
		end
	end

	local currentCounts = ClientHomelandUtils.getPlanAreaReusableFurnitureCountMap(areaId, homeSpace, isHomeCampPlan)

	for homeId, requiredCount in pairs(requiredCounts) do
		local availableCount = ClientHomelandUtils.getFurnitureOwnCount(homeId) + (currentCounts[homeId] or 0)

		if availableCount < requiredCount then
			return false
		end
	end

	for facilityTypeId, requiredCount in pairs(upgradeChainRequiredCounts) do
		local availableCount = ClientHomelandUtils.getFurnitureUpgradeChainOwnCount(upgradeChainHomeIds[facilityTypeId])

		for _, levelInfo in ipairs(HomeUpgradeData[facilityTypeId] or EMPTY_TABLE) do
			availableCount = availableCount + (currentCounts[levelInfo.homeTemplateId] or 0)
		end

		if availableCount < requiredCount then
			return false
		end
	end

	return true
end

function ClientHomelandUtils.checkFurnitureCompletionEnough(data, areaId, homeSpace, isHomeCampPlan, isPlan)
	local requiredCounts = {}
	local homeIdList = data and data.homeIdList

	if Utils.isTable(homeIdList) then
		for _, homeId in ipairs(homeIdList) do
			if homeId then
				requiredCounts[homeId] = (requiredCounts[homeId] or 0) + 1
			end
		end
	end

	local currentCounts = {}

	if isPlan then
		homeSpace = homeSpace or pg.me and pg.me.space

		for _, ornamentInfo in pairs(homeSpace and homeSpace.ornament or {}) do
			local homeId = ornamentInfo.homeId
			local canReuse

			if isHomeCampPlan then
				canReuse = Utils.checkHomeObjectEditable(homeId)
			else
				local ornamentAreaId = tonumber(ornamentInfo.areaId) or Const.HOMELAND_AREA_TYPE.PRODUCE

				canReuse = ornamentAreaId == areaId and Utils.checkHomeObjectEditable(homeId)
			end

			if canReuse then
				currentCounts[homeId] = (currentCounts[homeId] or 0) + 1
			end
		end
	end

	for homeId, requiredCount in pairs(requiredCounts) do
		local bagCount = ClientUtils.getItemCountById(homeId) or 0
		local warehouseCount = 0

		if pg.me and pg.me:isInSelfHomeland() then
			warehouseCount = ClientUtils.getHomelandItemCountById(homeId) or 0
		end

		if requiredCount > bagCount + warehouseCount + (currentCounts[homeId] or 0) then
			return false
		end
	end

	return true
end

function ClientHomelandUtils.getPreviewDataByConfig(config, prefabResID)
	if not config or not prefabResID then
		return nil
	end

	return {
		modelResId = prefabResID,
		modelScale = config.modelScale or 1,
		positionOffset = config.positionOffset or {
			0,
			0,
			0
		},
		modelRotationInit = config.modelRotationInit or {
			0,
			0,
			0
		},
		rotationXLimit = config.rotationXLimit or {
			-30,
			30
		},
		rotationYLimit = config.rotationYLimit or {
			-180,
			180
		}
	}
end

function ClientHomelandUtils.getHomeBookFurniturePreviewDataById(id, isSuit)
	local resId, config

	if isSuit then
		if ComposeFurnitureData[id] then
			resId = ComposeFurnitureData[id].prefabResID
		end

		if ComposeData[id] then
			config = ComposeData[id]
		end
	else
		if HomeObjectData[id] then
			resId = HomeObjectData[id].prefabResID
		end

		if FurnitureData[id] then
			config = FurnitureData[id]
		end
	end

	if config and resId then
		return {
			modelResId = resId,
			modelScale = config.modelScale or 1,
			positionOffset = config.positionOffset or {
				0,
				0,
				0
			},
			modelRotationInit = config.modelRotationInit or {
				0,
				0,
				0
			},
			rotationXLimit = config.rotationXLimit or {
				-30,
				30
			},
			rotationYLimit = config.rotationYLimit or {
				-180,
				180
			}
		}
	end

	return nil
end

function ClientHomelandUtils.getPetComfortValueById(id)
	local petInfo = pg.me:getPetInfo(id)

	if not petInfo then
		return 0
	end

	return HomeLandUtils.getCampCarPetComfortValue(petInfo)
end

function ClientHomelandUtils.getPendingPlaceLoadValue(context)
	local editInfo = context and context.editInfo

	if editInfo and editInfo.isBlueprintPlace then
		local loadValue = 0
		local blueprintData = editInfo.blueprintData or {}

		for _, ornamentInfo in ipairs(blueprintData.ornaments or blueprintData.furnitureData or EMPTY_TABLE) do
			loadValue = loadValue + ClientHomelandUtils.getLoadValueById(ornamentInfo.homeId)
		end

		return loadValue
	end

	local homeTemplateId = ClientHomelandUtils.getPendingPlaceHomeTemplateId(context)

	if homeTemplateId == nil then
		return 0
	end

	local homeObjectData = HomeObjectData[homeTemplateId] or {}

	return ClientHomelandUtils.getPendingPlaceOrnamentCount(context) * (homeObjectData.loadValue or 0)
end

function ClientHomelandUtils.getHomelandCurLoadValue(areaId, carGroup)
	if carGroup ~= nil then
		local campCarEnt = carGroup.campCarEnt

		if campCarEnt then
			return campCarEnt.CampCarLoadValue or 0
		end

		return 0
	end

	if pg.space and pg.space.homeAreaStats and pg.space.homeAreaStats[areaId] then
		return pg.space.homeAreaStats[areaId].loadValue or 0
	end

	return 0
end

function ClientHomelandUtils.getHomelandPreviewLoadValue(addLoadValue, areaId, carGroup)
	return ClientHomelandUtils.getHomelandCurLoadValue(areaId, carGroup) + (addLoadValue or 0)
end

function ClientHomelandUtils.getHomelandLoadValueLimit(areaId, carGroup)
	if carGroup then
		if HomeData and HomeData.homeCampLoadLimit then
			return HomeData.homeCampLoadLimit or 0
		end
	elseif AreaData and AreaData[areaId] then
		return AreaData[areaId].loadLimit or 0
	end

	return 0
end

function ClientHomelandUtils.checkHomelandLoadCanAdd(context, areaId, carGroup)
	local limit = ClientHomelandUtils.getHomelandLoadValueLimit(areaId, carGroup)

	if not limit or limit <= 0 then
		return true
	end

	return limit >= ClientHomelandUtils.getHomelandPreviewLoadValue(ClientHomelandUtils.getPendingPlaceLoadValue(context), areaId, carGroup)
end

function ClientHomelandUtils.collectOrnamentEditGroupEntities(seedEntities, context)
	context = context or {}

	local entities = {}
	local entityMap = {}
	local pendingEntities = {}
	local collectGroups = context.collectGroups == true
	local entityGroupIndexes = collectGroups and {} or nil
	local entityGroupParents = collectGroups and {} or nil
	local entityGroupCount = 0
	local editor = context.editor
	local areaId = context.areaId
	local homeSpace = context.homeSpace

	if homeSpace == nil then
		homeSpace = pg.me and pg.me.space
	end

	local getEntity = context.getEntity or function(ornamentId)
		return pg.game.home:getHomeEntity(ornamentId)
	end

	local function addEntity(entity, groupIndex)
		if not entity or entity.destroyed or not entity.id or not entity.ornamentId then
			return
		end

		if areaId and entity.areaId ~= areaId then
			return
		end

		if entityMap[entity.id] then
			if collectGroups and groupIndex then
				local currentRoot = groupIndex

				while entityGroupParents[currentRoot] ~= currentRoot do
					currentRoot = entityGroupParents[currentRoot]
				end

				local existingRoot = entityGroupIndexes[entity.id]

				while entityGroupParents[existingRoot] ~= existingRoot do
					existingRoot = entityGroupParents[existingRoot]
				end

				if currentRoot ~= existingRoot then
					if currentRoot < existingRoot then
						entityGroupParents[existingRoot] = currentRoot
					else
						entityGroupParents[currentRoot] = existingRoot
					end
				end
			end

			return
		end

		if collectGroups then
			if not groupIndex then
				entityGroupCount = entityGroupCount + 1
				groupIndex = entityGroupCount
				entityGroupParents[groupIndex] = groupIndex
			end

			entityGroupIndexes[entity.id] = groupIndex
		end

		entityMap[entity.id] = entity

		table.insert(entities, entity)
		table.insert(pendingEntities, entity)
	end

	for _, entity in ipairs(seedEntities or EMPTY_TABLE) do
		addEntity(entity)
	end

	local pendingIndex = 1

	while pendingIndex <= #pendingEntities do
		local entity = pendingEntities[pendingIndex]

		pendingIndex = pendingIndex + 1

		local groupIndex = collectGroups and entityGroupIndexes[entity.id] or nil

		if homeSpace and homeSpace.getHomeBlueprintBuildGroupByOrnamentId then
			local _, groupInfo = homeSpace:getHomeBlueprintBuildGroupByOrnamentId(entity.ornamentId)

			for _, ornamentId in ipairs(groupInfo and groupInfo.ornamentIds or EMPTY_TABLE) do
				addEntity(getEntity(ornamentId), groupIndex)
			end
		end

		if editor and editor.buildAttachManager then
			local childOrnamentIds = {}

			editor.buildAttachManager:getAttachChildEntitiesId(entity.ornamentId, childOrnamentIds)

			for ornamentId in pairs(childOrnamentIds) do
				addEntity(getEntity(ornamentId), groupIndex)
			end
		end
	end

	local entityGroups

	if collectGroups then
		entityGroups = {}

		local groupOutputIndexes = {}

		for _, entity in ipairs(entities) do
			local groupRoot = entityGroupIndexes[entity.id]

			while entityGroupParents[groupRoot] ~= groupRoot do
				groupRoot = entityGroupParents[groupRoot]
			end

			local outputIndex = groupOutputIndexes[groupRoot]

			if not outputIndex then
				outputIndex = #entityGroups + 1
				groupOutputIndexes[groupRoot] = outputIndex
				entityGroups[outputIndex] = {}
			end

			table.insert(entityGroups[outputIndex], entity)
		end
	end

	return entities, entityMap, entityGroups
end

function ClientHomelandUtils.getHomeFormulaData(formulaId)
	local formulaData = HomelandFormulaData[formulaId]
	local formulaInfo = {}

	if not formulaData then
		return formulaInfo
	end

	if formulaData.pet then
		formulaInfo.formulaType = 1
		formulaInfo.petList = {
			{
				label = 0,
				petId = formulaData.pet
			}
		}
	else
		formulaInfo.formulaType = 0

		local itemList = {}

		for i = 1, 3 do
			local consumableId = formulaData["consumable" .. i]

			if consumableId then
				local numText = ""

				if pg.space and Utils.isHomeland(pg.space.spaceType) then
					local curCount = ClientUtils.getHomelandItemCountById(consumableId)
					local consumeCount = formulaData["consumableNum" .. i]

					if consumeCount <= curCount then
						numText = pg.getFormatText("{0}/{1}", ClientUtils.getHomelandItemCountById(consumableId), formulaData["consumableNum" .. i])
					else
						numText = pg.getFormatText("<style=Debuff>{0}</style>/{1}", ClientUtils.getHomelandItemCountById(consumableId), formulaData["consumableNum" .. i])
					end
				else
					numText = formulaData["consumableNum" .. i]
				end

				table.insert(itemList, {
					tIndex = 0,
					id = consumableId,
					num = numText
				})
			else
				table.insert(itemList, {
					tIndex = 1
				})
			end
		end

		formulaInfo.itemList = itemList
	end

	if formulaData.time then
		formulaInfo.time = formulaData.time
		formulaInfo.formulaType = 0
	end

	if formulaData.workload then
		formulaInfo.workload = formulaData.workload
		formulaInfo.formulaType = formulaInfo.itemList and 2 or 1
	end

	return formulaInfo
end

function ClientHomelandUtils.getProduceAccelerateInfo(ornamentId, facilityInfo)
	if not pg.me or not pg.me.space or not pg.me:isInSelfHomeland() then
		return nil
	end

	local space = pg.me.space

	facilityInfo = facilityInfo or space.facility[ornamentId]

	if not Utils.checkHomeFacilityStateValid(facilityInfo) or not HomeLandUtils.isHomelandFormulaTimeValid(facilityInfo.formulaId, Time.getSecond()) then
		return nil
	end

	local formulaData = HomelandFormulaData[facilityInfo.formulaId]

	if not formulaData or not formulaData.accelerateStageList or not formulaData.accelerateItemId then
		return nil
	end

	local stageId = formulaData.accelerateStageList
	local stageConfigured = table.contains(formulaData.preOperateList or {}, stageId) or table.contains(formulaData.postOperateList or {}, stageId)

	if not stageConfigured or facilityInfo.facilityState ~= stageId then
		return nil
	end

	if isAccelerateNeedPetWork(formulaData) and not hasPetWorkingOnProduceStage(space, ornamentId, stageId) then
		return nil
	end

	local itemId = formulaData.accelerateItemId
	local itemConfig = ItemData[itemId]

	if not itemConfig then
		return nil
	end

	return {
		costNum = 1,
		ornamentId = ornamentId,
		formulaId = facilityInfo.formulaId,
		stageId = stageId,
		itemId = itemId,
		ownedCount = ClientUtils.getItemCountById(itemId) + ClientUtils.getHomelandItemCountById(itemId),
		itemName = pg.getLocalizationText(itemConfig.itemName),
		icon = itemConfig.icon,
		quality = itemConfig.quality or 0
	}
end

function ClientHomelandUtils.showProduceAccelerateConfirm(itemNameText, confirmCallback)
	local hideTimestamp = pg.global.prefsCacheUtils:getInt(ClientConst.PrefKey.HomeSpeedUpConfirmTipTs, 0, ClientConst.CACHE_TYPE_FLAG.USER)

	if hideTimestamp + 86400 > Time.secondCache then
		confirmCallback()

		return
	end

	local description = pg.getFormatText(pg.getGameString("HOME_SPEED_UP_COMFIRM"), itemNameText)
	local hideToday = false

	pg.global.showConfirmMsgRaw(pg.getGameString("WARNING"), description, function()
		if hideToday then
			pg.global.prefsCacheUtils:setInt(ClientConst.PrefKey.HomeSpeedUpConfirmTipTs, Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
			pg.global.prefsCacheUtils:save()
		end

		confirmCallback()
	end, nil, nil, nil, nil, {
		hint = true,
		hintDesc = string.format(pg.getGameString("DISABLE_HINT"), 1),
		hintCb = function(isSelected)
			hideToday = isSelected
		end
	})
end

function ClientHomelandUtils.getFurnitureRedDotReadSnapshot()
	local redDotInfo = pg.me:getClientInfo(Const.CLIENT_KEY.HOMELAND_FURNITURE_RED_DOT, FURNITURE_RED_DOT_READ_SNAPSHOT_KEY)

	return redDotInfo or {}
end

function ClientHomelandUtils.isFurnitureRedDotItemValid(itemId, itemFilter)
	local homeObjectInfo = HomeObjectData[itemId]

	if not homeObjectInfo then
		return false
	end

	return not itemFilter or itemFilter(itemId, homeObjectInfo)
end

function ClientHomelandUtils.isFurnitureRedDotItemNew(readSnapshot, itemId)
	if not ClientHomelandUtils.isFurnitureAvailableInArea(itemId) then
		return false
	end

	local releaseInfo = ClientHomelandUtils.getFurnitureReleaseState(itemId)

	if readSnapshot[itemId] == true or not HomeObjectData[itemId] or not releaseInfo.isReleased or releaseInfo.isReleaseTimeOffShelf then
		return false
	end

	local unlockState = ClientHomelandUtils.getFurnitureUnlockState(itemId, true)

	return unlockState and not unlockState.isLocked
end

function ClientHomelandUtils.hasFurnitureSubTypeNew(readSnapshot, typeId, subTypeId, itemFilter, itemIds)
	if not itemIds and typeId == ClientHomelandUtils.FURNITURE_NEW_ARRIVAL_TYPE_ID then
		itemIds = ClientHomelandUtils.getFurnitureNewArrivalItemIds(subTypeId)
	end

	itemIds = itemIds or RevertHomeObjectData[typeId] and RevertHomeObjectData[typeId][subTypeId]

	for _, itemId in ipairs(itemIds or {}) do
		if ClientHomelandUtils.isFurnitureRedDotItemValid(itemId, itemFilter) and ClientHomelandUtils.isFurnitureRedDotItemNew(readSnapshot, itemId) then
			return true
		end
	end

	return false
end

function ClientHomelandUtils.isFurnitureRedDotType(typeId)
	return typeId == ClientHomelandUtils.FURNITURE_NEW_ARRIVAL_TYPE_ID or typeId ~= nil and typeId ~= FURNITURE_RED_DOT_ITEM_TYPE_ID and RevertHomeObjectData[typeId] ~= nil
end

function ClientHomelandUtils.getFurnitureItemRedDotState(itemId)
	local readSnapshot = ClientHomelandUtils.getFurnitureRedDotReadSnapshot()
	local hasNew = ClientHomelandUtils.isFurnitureRedDotItemNew(readSnapshot, itemId)

	return hasNew and RedDotConst.RedDotStyle.NEW or RedDotConst.RedDotStyle.NONE
end

function ClientHomelandUtils.getFurnitureItemListRedDotState(itemInfoList)
	local readSnapshot = ClientHomelandUtils.getFurnitureRedDotReadSnapshot()

	for _, itemInfo in ipairs(itemInfoList or {}) do
		local itemId = itemInfo and itemInfo.itemId

		if itemId and ClientHomelandUtils.isFurnitureRedDotItemNew(readSnapshot, itemId) then
			return RedDotConst.RedDotStyle.NEW
		end
	end

	return RedDotConst.RedDotStyle.NONE
end

function ClientHomelandUtils.getFurnitureSubTypeRedDotState(typeId, subTypeId, itemFilter)
	if not ClientHomelandUtils.isFurnitureRedDotType(typeId) or not subTypeId then
		return RedDotConst.RedDotStyle.NONE
	end

	local readSnapshot = ClientHomelandUtils.getFurnitureRedDotReadSnapshot()
	local hasNew = ClientHomelandUtils.hasFurnitureSubTypeNew(readSnapshot, typeId, subTypeId, itemFilter)

	return hasNew and RedDotConst.RedDotStyle.NEW or RedDotConst.RedDotStyle.NONE
end

function ClientHomelandUtils.getFurnitureTypeRedDotState(typeId, itemFilter)
	if not ClientHomelandUtils.isFurnitureRedDotType(typeId) then
		return RedDotConst.RedDotStyle.NONE
	end

	local readSnapshot = ClientHomelandUtils.getFurnitureRedDotReadSnapshot()
	local subTypeItemMap = RevertHomeObjectData[typeId] or EMPTY_TABLE

	if typeId == ClientHomelandUtils.FURNITURE_NEW_ARRIVAL_TYPE_ID then
		subTypeItemMap = ClientHomelandUtils.getFurnitureNewArrivalSubTypeMap()
	end

	for subTypeId, itemIds in pairs(subTypeItemMap) do
		if ClientHomelandUtils.hasFurnitureSubTypeNew(readSnapshot, typeId, subTypeId, itemFilter, itemIds) then
			return RedDotConst.RedDotStyle.NEW
		end
	end

	return RedDotConst.RedDotStyle.NONE
end

function ClientHomelandUtils.readFurnitureSubTypeNewItems(typeId, subTypeId, itemFilter)
	local result = {}

	if not ClientHomelandUtils.isFurnitureRedDotType(typeId) or not subTypeId then
		return result
	end

	local readSnapshot = ClientHomelandUtils.getFurnitureRedDotReadSnapshot()
	local itemIds

	if typeId == ClientHomelandUtils.FURNITURE_NEW_ARRIVAL_TYPE_ID then
		itemIds = ClientHomelandUtils.getFurnitureNewArrivalItemIds(subTypeId)
	end

	itemIds = itemIds or RevertHomeObjectData[typeId] and RevertHomeObjectData[typeId][subTypeId]

	for _, itemId in ipairs(itemIds or {}) do
		if ClientHomelandUtils.isFurnitureRedDotItemValid(itemId, itemFilter) and ClientHomelandUtils.isFurnitureRedDotItemNew(readSnapshot, itemId) then
			result[itemId] = true
			readSnapshot[itemId] = true
		end
	end

	if next(result) then
		pg.me:setClientInfo(Const.CLIENT_KEY.HOMELAND_FURNITURE_RED_DOT, FURNITURE_RED_DOT_READ_SNAPSHOT_KEY, readSnapshot)
	end

	return result
end

function ClientHomelandUtils.getFurnitureHudRedDotState()
	local player = pg.me
	local home = pg.game and pg.game.home

	if not player or not home then
		return RedDotConst.RedDotStyle.NONE
	end

	local areaId = home:getNearestAreaId(player:getPosition(), true)
	local readSnapshot = ClientHomelandUtils.getFurnitureRedDotReadSnapshot()

	for typeId, subTypeMap in pairs(RevertHomeObjectData) do
		local typeInfo = HomeTypeData[typeId]

		if ClientHomelandUtils.isFurnitureRedDotType(typeId) and typeInfo and not typeInfo.hideInHomeland and HomeLandUtils.isTypeAreaAllowed(typeId, areaId) then
			for _, itemIds in pairs(subTypeMap) do
				for _, itemId in ipairs(itemIds) do
					local homeObjectInfo = HomeObjectData[itemId]

					if homeObjectInfo and homeObjectInfo.canHomePlace and HomeLandUtils.isOrnamentAreaAllowed(itemId, areaId) and ClientHomelandUtils.isFurnitureRedDotItemNew(readSnapshot, itemId) then
						return RedDotConst.RedDotStyle.NEW
					end
				end
			end
		end
	end

	return RedDotConst.RedDotStyle.NONE
end

return ClientHomelandUtils
