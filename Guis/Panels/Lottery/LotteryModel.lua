-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Lottery\\LotteryModel.lua

local logger = require("Core.Log.LoggerManager").getLogger("LotteryModel")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Utils = require("Common.Utils.Utils")
local TimeUtils = require("Common.Utils.TimeUtils")
local ClientUtils = require("Utils.ClientUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local LotteryUtils = require("Utils.LotteryUtils")
local ShopCommonHelper = require("Utils.ShopCommonHelper")
local ClientConst = require("Const.ClientConst")
local CashShopConst = require("Const.CashShopConst")
local GachaEntryData = require("Data.gacha_entry_data")
local GachaBaseData = require("Data.gacha_base_data")
local GachaTimesData = require("Data.gacha_times_data")
local GachaPoolData = require("Data.gacha_pool_data")
local GachaSuitData = require("Data.gacha_suit_data")
local DropData = require("Data.drop_data")
local ShopTagMappingData = require("Common.Data.shop_tag_mapping_data")
local ShopCommodityData = require("Data.shop_commodity_data")
local ShopMallCommodityData = require("Data.shopmall_commodity_data")
local ShopMallRecommendationData = require("Data.shopmall_recommendation_data")
local ShopMallAppearance = require("Data.shopmall_appearance")
local ShopConstantData = require("Data.shopmall_constant_data")
local AvatarPresetData = require("Data.avatar_preset_data")
local AppearanceSuitData = require("Data.appearance_suit_data")
local AvatarHairSuitData = require("Data.avatar_hair_suit_data")
local AppearanceMakeupPresetData = require("Data.appearance_makeup_preset_data")
local AppearanceFunctionData = require("Data.appearance_function_data")
local ItemData = require("Data.item_data")
local HomeObjectData = require("Data.home_object_data")
local LotteryModel = Class.LightClass("LotteryModel", UIModel)

LotteryModel.DEFAULT_MAIN_CONTAINER = "greenUContainer"
LotteryModel.DEFAULT_REWARD_CONTAINER = "rewardUContainer"
LotteryModel.DEFAULT_GIFT_SHARE_COUNT = 3
LotteryModel.BODY_MALE = 21
LotteryModel.DEFAULT_RESULT_POS_ROT = {
	{
		{
			0,
			0,
			0
		},
		{
			0,
			-90,
			0
		}
	},
	{
		{
			1,
			1,
			1
		},
		{
			0,
			90,
			0
		}
	}
}

function LotteryModel:getGiftShareCount(openInfo)
	if Utils.isTable(openInfo) and openInfo.giftShareCount ~= nil then
		return math.max(math.floor(tonumber(openInfo.giftShareCount) or 0), 0)
	end

	return LotteryModel.DEFAULT_GIFT_SHARE_COUNT
end

function LotteryModel:getCurCanShareCount(drawId)
	return LotteryUtils.getCurCanShareCount(drawId)
end

function LotteryModel:normalizeResultVector3(vector, defaultVector)
	if not Utils.isTable(vector) then
		vector = defaultVector
	end

	return {
		tonumber(vector[1]) or defaultVector[1],
		tonumber(vector[2]) or defaultVector[2],
		tonumber(vector[3]) or defaultVector[3]
	}
end

function LotteryModel:getResultTransform(poolConfig)
	local defaultConfig = LotteryModel.DEFAULT_RESULT_POS_ROT
	local config = Utils.isTable(poolConfig) and poolConfig.posRot or nil

	if not Utils.isTable(config) then
		config = defaultConfig
	end

	local position = config.position or config.pos
	local rotation = config.rotation or config.rot
	local scale = config.scale
	local maxRotation = config.maxRotation

	if Utils.isTable(config[1]) and Utils.isTable(config[1][1]) then
		position = position or config[1][1]
		rotation = rotation or config[1][2]
		scale = scale or Utils.isTable(config[2]) and config[2][1] or nil
		maxRotation = maxRotation or Utils.isTable(config[2]) and config[2][2] or nil
	else
		position = position or config[1]
		rotation = rotation or config[2]
		scale = scale or config[3]
		maxRotation = maxRotation or config[4]
	end

	return {
		position = self:normalizeResultVector3(position, defaultConfig[1][1]),
		rotation = self:normalizeResultVector3(rotation, defaultConfig[1][2]),
		scale = self:normalizeResultVector3(scale, defaultConfig[2][1]),
		maxRotation = self:normalizeResultVector3(maxRotation, defaultConfig[2][2])
	}
end

function LotteryModel:getSkinDrawItems(drawItems)
	local result = {}

	if not drawItems then
		return result
	end

	for _, drawItem in ipairs(drawItems) do
		local poolConfig = GachaPoolData[tonumber(drawItem.poolRecordId)]

		if Utils.isTable(poolConfig) and tonumber(poolConfig.type) == 1 then
			result[#result + 1] = {
				itemId = tonumber(drawItem.itemId) or tonumber(poolConfig.itemId),
				drawItem = drawItem,
				poolConfig = poolConfig,
				transform = self:getResultTransform(poolConfig)
			}
		end
	end

	return result
end

function LotteryModel:getEntryConfig(drawId)
	local entryConfig = GachaEntryData[tonumber(drawId)]

	if not Utils.isTable(entryConfig) then
		logger:error("抽奖入口配置不存在, drawId=%s", tostring(drawId))

		return nil
	end

	return entryConfig
end

function LotteryModel:getMainContainerName(entryConfig)
	return entryConfig.mainUI or LotteryModel.DEFAULT_MAIN_CONTAINER
end

function LotteryModel:getRewardContainerName(entryConfig)
	return entryConfig.rewardUI or LotteryModel.DEFAULT_REWARD_CONTAINER
end

function LotteryModel:getCurrencyList(entryConfig)
	if Utils.isTable(entryConfig.currency) then
		return entryConfig.currency
	end

	return {}
end

function LotteryModel:isFirstTenPul(drawId)
	drawId = tonumber(drawId)

	local gachaBase = drawId and self:getGachaBase(drawId) or nil

	return Utils.isTable(gachaBase) and type(gachaBase.isFirstTenPul) == "function" and gachaBase:isFirstTenPul() == true
end

function LotteryModel:getDrawCostInfo(entryConfig, drawCount, drawId)
	drawCount = tonumber(drawCount) or 1

	local consumeNum = drawCount
	local discountTitleKey
	local isFirstDiscount = false

	if drawCount == 1 then
		consumeNum = 1
	elseif drawCount == 10 and Utils.isTable(entryConfig) then
		local firstConsumeNum = tonumber(entryConfig.discountFirst)
		local normalConsumeNum = tonumber(entryConfig.discountItem)

		if self:isFirstTenPul(drawId) and firstConsumeNum and firstConsumeNum > 0 then
			consumeNum = firstConsumeNum
			discountTitleKey = "LOTTERY_FIRST"
			isFirstDiscount = true
		elseif normalConsumeNum and normalConsumeNum > 0 then
			consumeNum = normalConsumeNum
			discountTitleKey = "LOTTERY_10_DISCOUNT"
		end
	end

	consumeNum = math.max(1, math.floor(consumeNum))

	local hasDiscount = drawCount == 10 and consumeNum < drawCount
	local discountRatio = hasDiscount and consumeNum / drawCount or nil

	return {
		itemId = Utils.isTable(entryConfig) and entryConfig.itemId or nil,
		drawCount = drawCount,
		consumeNum = consumeNum,
		originalConsumeNum = drawCount,
		hasDiscount = hasDiscount,
		discount = discountRatio,
		discountTitleKey = hasDiscount and discountTitleKey or nil,
		isFirstDiscount = hasDiscount and isFirstDiscount,
		discountText = hasDiscount and string.format("%d%%", math.floor((discountRatio - 1) * 100 + 0.5)) or ""
	}
end

function LotteryModel:getDrawItemCommodityId()
	local commodityId = tonumber(GachaBaseData.shop_Item_id)

	return commodityId and commodityId > 0 and commodityId or nil
end

function LotteryModel:getGachaBase(drawId)
	local gachaMap = pg.me and pg.me.gachaMap or nil

	if not Utils.isTable(gachaMap) then
		return nil
	end

	local gachaBase = gachaMap[tonumber(drawId)]

	if not Utils.isTable(gachaBase) then
		return nil
	end

	return gachaBase
end

function LotteryModel:getDrawCount(drawId)
	local gachaBase = self:getGachaBase(drawId)

	return gachaBase and (tonumber(gachaBase.drawCount) or 0) or 0
end

function LotteryModel:getOnlyExchangeItemIdSet(entryConfig)
	local itemIdSet = {}

	if not Utils.isTable(entryConfig) then
		return itemIdSet
	end

	local shopTagIds = entryConfig.shopItemId

	if not Utils.isTable(shopTagIds) then
		shopTagIds = {
			shopTagIds
		}
	end

	for _, shopTagId in pairs(shopTagIds) do
		local shopConfig = ShopTagMappingData[tonumber(shopTagId)]

		if Utils.isTable(shopConfig) and Utils.isTable(shopConfig.goodsList) then
			for _, commodityId in ipairs(shopConfig.goodsList) do
				local commodityConfig = ShopCommodityData[commodityId]

				if Utils.isTable(commodityConfig) and tonumber(commodityConfig.onlyExchange) == 1 and commodityConfig.itemId then
					itemIdSet[tonumber(commodityConfig.itemId) or commodityConfig.itemId] = true
				end
			end
		end
	end

	return itemIdSet
end

function LotteryModel:getTimesRewardItem(awardId)
	local dropConfig = DropData[awardId]

	if not Utils.isTable(dropConfig) then
		return nil, 0
	end

	local rewardList = dropConfig.fixedDrop or dropConfig.displayReward
	local reward = Utils.isTable(rewardList) and rewardList[1] or nil

	if not Utils.isTable(reward) then
		return nil, 0
	end

	return reward[1], reward[2] or 1
end

function LotteryModel:getTimesRewardList(drawId, drawCount)
	local sourceList = GachaTimesData[tonumber(drawId)]

	if not Utils.isTable(sourceList) then
		return {}
	end

	local gachaBase = self:getGachaBase(drawId)
	local claimedTimesRewardNums = gachaBase and gachaBase.claimedTimesRewardNums or nil
	local onlyExchangeItemIdSet = self:getOnlyExchangeItemIdSet(GachaEntryData[tonumber(drawId)])
	local gender = ClientCashShopUtils.getPlayerGender()
	local result = {}

	for index, config in ipairs(sourceList) do
		local requiredNum = tonumber(config.num) or 0
		local previousConfig = sourceList[index - 1]
		local previousRequiredNum = Utils.isTable(previousConfig) and tonumber(previousConfig.num) or nil
		local rewardItemId, rewardItemNum = self:getTimesRewardItem(config.awardId)
		local progress = 0

		if previousRequiredNum then
			local interval = requiredNum - previousRequiredNum

			if interval <= 0 then
				progress = requiredNum <= drawCount and 1 or 0
			else
				progress = math.max(0, math.min(1, (drawCount - previousRequiredNum) / interval))
			end
		end

		local claimed = claimedTimesRewardNums and claimedTimesRewardNums[requiredNum] == true or false

		result[#result + 1] = {
			tIndex = tonumber(config.specShow) == 1 and 1 or 0,
			index = index,
			awardId = config.awardId,
			itemId = ClientCashShopUtils.getGenderConvertedItemId(rewardItemId, gender),
			itemNum = rewardItemNum,
			onlyExchange = onlyExchangeItemIdSet[tonumber(rewardItemId) or rewardItemId] == true,
			num = requiredNum,
			specShow = config.specShow,
			progress = progress,
			reached = requiredNum <= drawCount,
			claimed = claimed,
			claimable = requiredNum <= drawCount and not claimed
		}
	end

	return result
end

function LotteryModel:getEntryPoolIdSet(entryConfig)
	local poolIdSet = {}

	if not Utils.isTable(entryConfig) then
		return poolIdSet
	end

	local awardPoolConfig = entryConfig.awardPoolId

	if Utils.isTable(awardPoolConfig) then
		if awardPoolConfig.poolId then
			poolIdSet[awardPoolConfig.poolId] = true
		else
			for _, poolConfig in pairs(awardPoolConfig) do
				if Utils.isTable(poolConfig) and poolConfig.poolId then
					poolIdSet[poolConfig.poolId] = true
				end
			end
		end
	elseif type(awardPoolConfig) == "number" then
		poolIdSet[awardPoolConfig] = true
	end

	return poolIdSet
end

function LotteryModel:getRewardShowItemList(entryConfig)
	local itemList = {}
	local poolIdSet = self:getEntryPoolIdSet(entryConfig)

	for poolConfigId, poolConfig in pairs(GachaPoolData) do
		if Utils.isTable(poolConfig) and poolIdSet[poolConfig.awardPool] and tonumber(poolConfig.showInReward) == 1 then
			local itemData = {
				rewardShowType = "pool",
				rewardShowKey = "pool_" .. tostring(poolConfigId),
				itemId = poolConfig.itemId,
				num = poolConfig.number or 1,
				sort = poolConfig.sort or 0,
				isSuit = poolConfig.isSuit,
				configId = poolConfigId
			}

			itemData.showType = 1
			itemData.owned = self:isRewardShowItemOwned(itemData)
			itemList[#itemList + 1] = itemData
		end
	end

	local shopTagId = Utils.isTable(entryConfig) and tonumber(entryConfig.shopItemId) or nil
	local shopConfig = shopTagId and ShopTagMappingData[shopTagId] or nil

	if Utils.isTable(shopConfig) and Utils.isTable(shopConfig.goodsList) then
		for _, commodityId in ipairs(shopConfig.goodsList) do
			local commodityConfig = ShopCommodityData[commodityId]

			if Utils.isTable(commodityConfig) and tonumber(commodityConfig.showInReward) == 1 then
				local itemData = {}

				for key, value in pairs(commodityConfig) do
					itemData[key] = value
				end

				itemData.rewardShowKey = "commodity_" .. tostring(commodityId)
				itemData.rewardShowType = "commodity"
				itemData.commodityId = commodityId
				itemData.configId = commodityId
				itemData.hasDiscount = self:isRewardShowCommodityInDiscount(commodityConfig)
				itemData.owned = self:isRewardShowItemOwned(itemData)
				itemList[#itemList + 1] = itemData
			end
		end
	end

	table.sort(itemList, function(left, right)
		local leftSort = tonumber(left.sort) or 0
		local rightSort = tonumber(right.sort) or 0

		if leftSort ~= rightSort then
			return leftSort < rightSort
		end

		if left.rewardShowType ~= right.rewardShowType then
			return left.rewardShowType == "pool"
		end

		return (tonumber(left.configId) or 0) < (tonumber(right.configId) or 0)
	end)

	return itemList
end

function LotteryModel:isRewardShowCommodityInDiscount(commodityConfig)
	if not Utils.isTable(commodityConfig) or commodityConfig.specialCost == nil then
		return false
	end

	local startTime = Utils.getConfigTimeOfAreaByData(commodityConfig.specialStartTime, commodityConfig.specialStartTimeRefId)
	local endTime = Utils.getConfigTimeOfAreaByData(commodityConfig.specialEndTime, commodityConfig.specialEndTimeRefId)

	if commodityConfig.specialStartTimeRefId and commodityConfig.specialStartTimeRefId ~= 0 and startTime == nil or commodityConfig.specialEndTimeRefId and commodityConfig.specialEndTimeRefId ~= 0 and endTime == nil then
		return false
	end

	return TimeUtils.isInRangeTimestamp(startTime, endTime)
end

function LotteryModel:getRewardShowContentList(itemData)
	if not Utils.isTable(itemData) or not itemData.itemId then
		return {}
	end

	local dropConfig = DropData[itemData.itemId]

	if Utils.isTable(dropConfig) and Utils.isTable(dropConfig.fixedDrop) then
		local contentList = {}

		for _, fixedDropInfo in ipairs(dropConfig.fixedDrop) do
			if Utils.isTable(fixedDropInfo) and fixedDropInfo[1] then
				contentList[#contentList + 1] = {
					id = fixedDropInfo[1],
					num = fixedDropInfo[2] or 1
				}
			end
		end

		return contentList
	end

	local suitItems = ClientCashShopUtils.getSuitAppearanceItems(itemData.itemId)

	if suitItems and #suitItems > 0 then
		return suitItems
	end

	return {
		{
			id = itemData.itemId,
			num = itemData.num or itemData.itemNum or 1
		}
	}
end

function LotteryModel:appendRewardShowAppearanceItemIds(itemIds, addedItemIds, visitedSourceIds, itemId)
	itemId = tonumber(itemId)

	if not itemId or itemId <= 0 then
		return
	end

	local gender = ClientCashShopUtils.getPlayerGender()
	local convertedItemId = ClientCashShopUtils.getGenderConvertedItemId(itemId, gender) or itemId

	if visitedSourceIds[convertedItemId] then
		return
	end

	visitedSourceIds[convertedItemId] = true

	local dropConfig = DropData[convertedItemId] or DropData[itemId]

	if Utils.isTable(dropConfig) and Utils.isTable(dropConfig.fixedDrop) then
		for _, fixedDropInfo in ipairs(dropConfig.fixedDrop) do
			if Utils.isTable(fixedDropInfo) then
				self:appendRewardShowAppearanceItemIds(itemIds, addedItemIds, visitedSourceIds, fixedDropInfo[1])
			end
		end

		return
	end

	local suitItems = ClientCashShopUtils.getSuitAppearanceItems(convertedItemId, gender)

	if suitItems and #suitItems > 0 then
		for _, suitItem in ipairs(suitItems) do
			self:appendRewardShowAppearanceItemIds(itemIds, addedItemIds, visitedSourceIds, suitItem.id)
		end

		return
	end

	local mappedInfo = ShopMallAppearance[convertedItemId] or ShopMallAppearance[itemId]

	if Utils.isTable(mappedInfo) and mappedInfo[1] then
		convertedItemId = ClientCashShopUtils.getGenderConvertedItemId(mappedInfo[1], gender) or mappedInfo[1]
	end

	if not addedItemIds[convertedItemId] then
		addedItemIds[convertedItemId] = true
		itemIds[#itemIds + 1] = convertedItemId
	end
end

function LotteryModel:getRewardShowAppearanceItemIds(selectedItems)
	local itemIds = {}
	local addedItemIds = {}
	local visitedSourceIds = {}

	for _, itemData in ipairs(selectedItems or {}) do
		if Utils.isTable(itemData) then
			self:appendRewardShowAppearanceItemIds(itemIds, addedItemIds, visitedSourceIds, itemData.itemId)
		end
	end

	return itemIds
end

function LotteryModel:appendRewardShowPreviewItemIds(targetIds, addedIds, itemData)
	local itemIds = self:getRewardShowAppearanceItemIds({
		itemData
	})

	for _, itemId in ipairs(itemIds) do
		if not addedIds[itemId] then
			addedIds[itemId] = true
			targetIds[#targetIds + 1] = itemId
		end
	end
end

function LotteryModel:getRewardShowFurnitureItemId(itemData)
	if not Utils.isTable(itemData) then
		return nil
	end

	local contentList = self:getRewardShowContentList(itemData)

	for _, contentData in ipairs(contentList) do
		local itemId = tonumber(contentData.id)

		if HomeObjectData[itemId] then
			return itemId
		end
	end

	local itemId = tonumber(itemData.itemId)

	return HomeObjectData[itemId] and itemId or nil
end

function LotteryModel:getFurnitureCameraPose(entryConfig)
	if not Utils.isTable(entryConfig) or not Utils.isTable(entryConfig.furniturePos) then
		return nil
	end

	local position = entryConfig.furniturePos
	local rotation = entryConfig.furnitureRotation or entryConfig.furnitureRot

	if Utils.isTable(position[1]) then
		rotation = rotation or position[2]
		position = position[1]
	end

	rotation = rotation or entryConfig[1]

	return {
		position = position,
		rotation = rotation
	}
end

function LotteryModel:getRewardShowPreviewData(selectedItems, focusedItem)
	local previewData = {
		showFootprint = false,
		appearanceIds = {},
		makeupIds = {}
	}
	local addedAppearanceIds = {}
	local addedMakeupIds = {}
	local focusedSelected = false

	for _, itemData in ipairs(selectedItems or {}) do
		local showType = tonumber(itemData.showType) or 1

		if itemData == focusedItem then
			focusedSelected = true
		end

		if showType == 2 then
			self:appendRewardShowPreviewItemIds(previewData.makeupIds, addedMakeupIds, itemData)
		elseif showType == 3 then
			previewData.showFootprint = true

			self:appendRewardShowPreviewItemIds(previewData.appearanceIds, addedAppearanceIds, itemData)
		elseif showType == 1 or showType == 5 then
			self:appendRewardShowPreviewItemIds(previewData.appearanceIds, addedAppearanceIds, itemData)
		end
	end

	if focusedSelected and tonumber(focusedItem.showType) == 4 then
		previewData.furnitureItemId = self:getRewardShowFurnitureItemId(focusedItem)
	end

	return previewData
end

function LotteryModel:getRewardShowMakeupId(drawId)
	drawId = tonumber(drawId)

	local body = ClientCashShopUtils.getPlayerGender()

	if not drawId or not body then
		return nil
	end

	local selectedId, selectedSort

	for makeupId, makeupConfig in pairs(AppearanceMakeupPresetData) do
		if Utils.isTable(makeupConfig) and tonumber(makeupConfig.drawId) == drawId then
			local bodyList = Utils.isTable(makeupConfig.body) and makeupConfig.body or {}
			local bodyMatched = false

			for _, configBody in ipairs(bodyList) do
				configBody = tonumber(configBody)

				if configBody == body or configBody and math.floor(configBody / 10) == math.floor(body / 10) then
					bodyMatched = true

					break
				end
			end

			if bodyMatched then
				local configSort = tonumber(makeupConfig.sort) or tonumber(makeupId) or 0

				if selectedSort == nil or configSort < selectedSort then
					selectedId = tonumber(makeupId)
					selectedSort = configSort
				end
			end
		end
	end

	return selectedId
end

function LotteryModel:isRewardShowAppearanceOwned(appearanceItemId)
	appearanceItemId = tonumber(appearanceItemId)

	if not appearanceItemId then
		return false
	end

	local gender = ClientCashShopUtils.getPlayerGender()
	local convertedItemId = ClientCashShopUtils.getGenderConvertedItemId(appearanceItemId, gender) or appearanceItemId
	local headRewardOwned = LotteryUtils.getHeadRewardOwned(pg.me, convertedItemId)

	if headRewardOwned ~= nil then
		return headRewardOwned
	end

	local hairSuitConfig = AvatarHairSuitData[convertedItemId] or AvatarHairSuitData[appearanceItemId]

	if Utils.isTable(hairSuitConfig) and Utils.isTable(hairSuitConfig.appearanceList) then
		for _, hairAppearanceId in ipairs(hairSuitConfig.appearanceList) do
			if not ClientCashShopUtils.hasOwnedAppearance(pg.me, hairAppearanceId) then
				return false
			end
		end

		return #hairSuitConfig.appearanceList > 0
	end

	local makeupPresetConfig = AppearanceMakeupPresetData[convertedItemId] or AppearanceMakeupPresetData[appearanceItemId]

	if Utils.isTable(makeupPresetConfig) and Utils.isTable(makeupPresetConfig.makeupList) then
		for _, makeupAppearanceId in ipairs(makeupPresetConfig.makeupList) do
			if not ClientCashShopUtils.hasOwnedAppearance(pg.me, makeupAppearanceId) then
				return false
			end
		end

		return #makeupPresetConfig.makeupList > 0
	end

	return ClientCashShopUtils.hasOwnedAppearance(pg.me, convertedItemId)
end

function LotteryModel:isRewardShowItemOwned(itemData)
	if not Utils.isTable(itemData) or not pg.me then
		return false
	end

	local furnitureItemId = self:getRewardShowFurnitureItemId(itemData)

	if furnitureItemId then
		local ownedCount = (ClientUtils.getItemCountById(furnitureItemId, true) or 0) + (ClientUtils.getHomelandItemCountById(furnitureItemId) or 0)

		return ownedCount > 0
	end

	local itemId = tonumber(itemData.itemId)
	local convertedItemId = ClientCashShopUtils.getGenderConvertedItemId(itemId, ClientCashShopUtils.getPlayerGender()) or itemId
	local dropConfig = DropData[convertedItemId] or DropData[itemId]
	local hasFixedDrop = Utils.isTable(dropConfig) and Utils.isTable(dropConfig.fixedDrop)
	local avatarType = tonumber(itemData.avatarType)

	if not hasFixedDrop and avatarType ~= CashShopConst.CommodityAvatarType.ACCESSORY_PACKAGE and ClientCashShopUtils.hasOwnedCommodityAppearance(pg.me, itemData) then
		return true
	end

	local appearanceItemIds = self:getRewardShowAppearanceItemIds({
		itemData
	})

	if #appearanceItemIds <= 0 then
		return false
	end

	for _, appearanceItemId in ipairs(appearanceItemIds) do
		if not self:isRewardShowAppearanceOwned(appearanceItemId) then
			return false
		end
	end

	return true
end

function LotteryModel:buildRewardShowViewData(drawId, entryConfig)
	return {
		drawId = drawId,
		itemList = self:getRewardShowItemList(entryConfig),
		makeupId = self:getRewardShowMakeupId(drawId),
		furniturePos = self:getFurnitureCameraPose(entryConfig),
		closeTime = Utils.isTable(entryConfig) and Utils.getConfigTimeOfArea(entryConfig, "closeTime") or nil
	}
end

function LotteryModel:getCollectionItems(entryConfig)
	local poolIdSet = self:getEntryPoolIdSet(entryConfig)
	local items = {}

	for _, poolConfig in pairs(GachaPoolData) do
		if poolConfig.type == 1 and poolIdSet[poolConfig.awardPool] then
			items[#items + 1] = {
				id = poolConfig.itemId,
				num = poolConfig.number or 1,
				sort = poolConfig.sort or 0
			}
		end
	end

	table.sort(items, function(left, right)
		return left.sort < right.sort
	end)

	return items
end

function LotteryModel:getCollectionProgress(drawId, entryConfig)
	local collectionItems = self:getCollectionItems(entryConfig)
	local gachaBase = self:getGachaBase(drawId)
	local itemRecords = gachaBase and gachaBase.itemRecords or nil
	local acquiredCount = 0

	for _, item in ipairs(collectionItems) do
		if itemRecords and (tonumber(itemRecords[item.id]) or 0) > 0 then
			acquiredCount = acquiredCount + 1
		end
	end

	return acquiredCount, #collectionItems
end

function LotteryModel:normalizeSuitMediaResource(resource)
	if type(resource) ~= "string" then
		return nil
	end

	resource = resource:match("^%s*(.-)%s*$")
	resource = resource:gsub("^'+", ""):gsub("'+$", "")

	if resource == "" or resource == "0" then
		return nil
	end

	return resource
end

function LotteryModel:getSuitVideoUrl(configuredUrl)
	configuredUrl = configuredUrl:gsub("\\", "/")

	if configuredUrl:match("^https?://") then
		return configuredUrl
	end

	configuredUrl = configuredUrl:gsub("^/+", "")
	configuredUrl = configuredUrl:gsub("^public/video/m/", "")
	configuredUrl = configuredUrl:gsub("^public/video/", "")

	local host = Utils.isOverseas() and ClientConst.SERVER_LIST.GLOBAL_HOST or ClientConst.SERVER_LIST.CN_HOST
	local videoPath = IS_MOBILE and "/public/video/m/" or "/public/video/"

	return "https://" .. host .. videoPath .. configuredUrl
end

function LotteryModel:getRewardViewData(drawId, acquiredCount, totalCount, suitName, originalBgm)
	local suitConfig = GachaSuitData[tonumber(drawId)]

	if not Utils.isTable(suitConfig) then
		logger:error("抽奖全套展示配置不存在, drawId=%s", tostring(drawId))

		return {
			suitName = suitName,
			originalBgm = originalBgm,
			acquiredCount = acquiredCount or 0,
			totalCount = totalCount or 0,
			tabList = {}
		}
	end

	local tabDefinitions = {
		{
			mediaType = "video",
			titleKey = "LOTTERY_REWARD_TAB_1",
			type = 1,
			field = "specShow"
		},
		{
			mediaType = "video",
			titleKey = "LOTTERY_REWARD_TAB_2",
			type = 2,
			field = "roleAndPet"
		},
		{
			mediaType = "image",
			titleKey = "LOTTERY_REWARD_TAB_3",
			type = 3,
			field = "scenepic"
		}
	}
	local tabList = {}

	for _, definition in ipairs(tabDefinitions) do
		local resource = self:normalizeSuitMediaResource(suitConfig[definition.field])

		if resource then
			tabList[#tabList + 1] = {
				type = definition.type,
				titleKey = definition.titleKey,
				mediaType = definition.mediaType,
				resource = definition.mediaType == "video" and self:getSuitVideoUrl(resource) or resource
			}
		end
	end

	return {
		drawId = tonumber(drawId),
		suitName = suitName,
		originalBgm = originalBgm,
		head = suitConfig.head,
		headFrame = suitConfig.headFrame,
		bgm = suitConfig.bgm,
		acquiredCount = acquiredCount or 0,
		totalCount = totalCount or 0,
		tabList = tabList
	}
end

function LotteryModel:getLotteryCommodityId(drawId, preferredCommodityId)
	if preferredCommodityId and ShopMallCommodityData[preferredCommodityId] then
		return preferredCommodityId
	end

	for _, recommendationConfig in pairs(ShopMallRecommendationData) do
		if recommendationConfig.drawId == drawId and recommendationConfig.commodityId then
			return recommendationConfig.commodityId
		end
	end

	return nil
end

function LotteryModel:getBodyMappedValue(map, body)
	if not Utils.isTable(map) or not body then
		return nil
	end

	local value = map[body] or map[tostring(body)]

	if value ~= nil then
		return value
	end

	for _, entry in pairs(map) do
		if Utils.isTable(entry) and tonumber(entry[1]) == body then
			return entry[2]
		end
	end

	return nil
end

function LotteryModel:getShopTemplatePresetKey(commodityConfig, body)
	local presetKey = tonumber(self:getBodyMappedValue(commodityConfig and commodityConfig.avatarId, body))

	if presetKey then
		return presetKey
	end

	local cfgKey = body == self.BODY_MALE and "template_preset_man" or "template_preset_woman"
	local presetConfig = ShopConstantData[cfgKey]

	presetKey = presetConfig and tonumber(presetConfig.number) or nil

	if presetKey and AvatarPresetData[presetKey] then
		return presetKey
	end

	local fallbackKey = body * 10000 + 1

	if AvatarPresetData[fallbackKey] then
		return fallbackKey
	end

	return nil
end

function LotteryModel:getDefaultShopAction(body)
	local cfgKey = body == self.BODY_MALE and "default_action_man" or "default_action_woman"
	local actionConfig = ShopConstantData[cfgKey]

	return actionConfig and actionConfig.number or nil
end

function LotteryModel:getSuitDisplayInfo(drawId, preferredCommodityId, entryConfig)
	local commodityId = self:getLotteryCommodityId(drawId, preferredCommodityId)
	local commodityConfig = commodityId and ShopMallCommodityData[commodityId] or nil
	local suitItemId = commodityConfig and commodityConfig.itemId or nil

	suitItemId = suitItemId and (ClientCashShopUtils.getGenderConvertedItemId(suitItemId, ClientCashShopUtils.getPlayerGender()) or suitItemId)

	local suitConfig = suitItemId and AppearanceSuitData[suitItemId] or nil
	local itemConfig = suitItemId and ItemData[suitItemId] or nil
	local body = ClientCashShopUtils.getPlayerGender()
	local previewCommodityConfig = commodityId and ClientCashShopUtils.getCommodityData(commodityId) or commodityConfig
	local shopAction = suitConfig and suitConfig.shopAction or nil

	if shopAction == nil or shopAction == "" or shopAction == 0 or shopAction == "0" then
		shopAction = self:getDefaultShopAction(body)
	end

	local templatePresetKey = self:getShopTemplatePresetKey(previewCommodityConfig, body)

	return {
		commodityId = commodityId,
		sourceSuitItemId = commodityConfig and commodityConfig.itemId or nil,
		suitItemId = suitItemId,
		body = body,
		templatePresetKey = templatePresetKey,
		shopAction = shopAction,
		canSwitchMakeup = suitItemId ~= nil and templatePresetKey ~= nil,
		logo = suitConfig and suitConfig.logo or nil,
		name = itemConfig and itemConfig.itemName or entryConfig.name
	}
end

function LotteryModel:appendInteractionCandidateId(candidateIds, candidateIdMap, appearanceId)
	appearanceId = tonumber(appearanceId)

	if not appearanceId or candidateIdMap[appearanceId] then
		return
	end

	candidateIdMap[appearanceId] = true
	candidateIds[#candidateIds + 1] = appearanceId
end

function LotteryModel:appendInteractionCandidateList(candidateIds, candidateIdMap, appearanceIds)
	if not Utils.isTable(appearanceIds) then
		return
	end

	for _, appearanceId in ipairs(appearanceIds) do
		self:appendInteractionCandidateId(candidateIds, candidateIdMap, appearanceId)
	end
end

function LotteryModel:getInteractionCandidateIds(suitItemId, sourceSuitItemId)
	local candidateIds = {}
	local candidateIdMap = {}
	local body = ClientCashShopUtils.getPlayerGender()

	self:appendInteractionCandidateId(candidateIds, candidateIdMap, suitItemId)

	local mappedAppearanceIds = ShopMallAppearance[suitItemId] or ShopMallAppearance[sourceSuitItemId]

	if Utils.isTable(mappedAppearanceIds) then
		for _, mappedAppearanceId in ipairs(mappedAppearanceIds) do
			local convertedAppearanceId = ClientCashShopUtils.getGenderConvertedItemId(mappedAppearanceId, body) or mappedAppearanceId

			self:appendInteractionCandidateId(candidateIds, candidateIdMap, convertedAppearanceId)
		end
	end

	local suitConfig = AppearanceSuitData[suitItemId] or AppearanceSuitData[sourceSuitItemId]

	if not Utils.isTable(suitConfig) then
		return candidateIds
	end

	self:appendInteractionCandidateList(candidateIds, candidateIdMap, suitConfig.appearanceList)
	self:appendInteractionCandidateList(candidateIds, candidateIdMap, suitConfig.jewelryList)
	self:appendInteractionCandidateList(candidateIds, candidateIdMap, suitConfig.kit)
	self:appendInteractionCandidateId(candidateIds, candidateIdMap, suitConfig.hair)
	self:appendInteractionCandidateId(candidateIds, candidateIdMap, suitConfig.makeup)

	return candidateIds
end

function LotteryModel:getInteractionList(suitItemId, sourceSuitItemId)
	local interactionList = {}
	local validPowerTypes = CashShopConst.SuitPowerType

	for _, appearanceId in ipairs(self:getInteractionCandidateIds(suitItemId, sourceSuitItemId)) do
		local functionConfig = AppearanceFunctionData[appearanceId]

		if Utils.isTable(functionConfig) and tonumber(functionConfig.type) == 2 and Utils.isTable(functionConfig.suitPowerType) then
			for _, powerType in ipairs(functionConfig.suitPowerType) do
				powerType = tonumber(powerType)

				if powerType == validPowerTypes.FASHION_SWITCH or powerType == validPowerTypes.PET_IDLE or powerType == validPowerTypes.PLAYER_PET_INTERACTION or powerType == validPowerTypes.PLAYER_PET_TIPS then
					local iconConfig = ShopConstantData["Intera_" .. tostring(powerType)]

					interactionList[#interactionList + 1] = {
						selected = false,
						appearanceId = appearanceId,
						powerType = powerType,
						functionData = functionConfig,
						icon = iconConfig and iconConfig.number or nil
					}
				end
			end
		end
	end

	return interactionList
end

function LotteryModel:getBannerList(entryConfig)
	local shopTagId = Utils.isTable(entryConfig) and tonumber(entryConfig.shopItemId) or nil
	local shopMapping = shopTagId and ShopTagMappingData[shopTagId] or nil

	if not Utils.isTable(shopMapping) or not Utils.isTable(shopMapping.goodsList) then
		return {}
	end

	local gender = ClientCashShopUtils.getPlayerGender()
	local result = {}

	for _, commodityId in ipairs(shopMapping.goodsList) do
		local commodityConfig = ShopCommodityData[commodityId]

		if Utils.isTable(commodityConfig) and commodityConfig.onSale ~= 0 and not ShopCommonHelper.isShopItemHiddenByCondition(commodityConfig, pg.me) and ClientCashShopUtils.isItemMatchGender(commodityConfig.itemId, gender) then
			local itemConfig = ItemData[commodityConfig.itemId]
			local commodityBanner = ClientCashShopUtils.getCommodityBannerByGender(commodityConfig, gender)

			result[#result + 1] = {
				commodityId = commodityId,
				itemId = commodityConfig.itemId,
				itemNum = commodityConfig.itemNum or 1,
				cost = commodityConfig.cost,
				icon = commodityBanner or itemConfig and itemConfig.icon or nil,
				name = itemConfig and itemConfig.itemName or nil,
				quality = itemConfig and itemConfig.quality or 0,
				owned = self:isRewardShowItemOwned(commodityConfig) or ShopCommonHelper.isShopItemSoldOut(commodityConfig, commodityId, pg.me)
			}
		end
	end

	return result
end

function LotteryModel:buildMainViewData(drawId, entryConfig, openInfo)
	local drawCount = self:getDrawCount(drawId)
	local timesRewardList = self:getTimesRewardList(drawId, drawCount)
	local suitDisplayInfo = self:getSuitDisplayInfo(drawId, Utils.isTable(openInfo) and openInfo.commodityId or nil, entryConfig)
	local acquiredCount, totalCount = self:getCollectionProgress(drawId, entryConfig)
	local rewardViewData = self:getRewardViewData(drawId, acquiredCount, totalCount, suitDisplayInfo.name, entryConfig.bgm)

	return {
		drawId = drawId,
		entryConfig = entryConfig,
		drawCount = drawCount,
		timesRewardList = timesRewardList,
		suitDisplayInfo = suitDisplayInfo,
		acquiredCount = acquiredCount,
		totalCount = totalCount,
		bannerList = self:getBannerList(entryConfig),
		interactionList = self:getInteractionList(suitDisplayInfo.suitItemId, suitDisplayInfo.sourceSuitItemId),
		rewardViewData = rewardViewData,
		drawCostInfo = {
			single = self:getDrawCostInfo(entryConfig, 1, drawId),
			ten = self:getDrawCostInfo(entryConfig, 10, drawId)
		},
		giftShareCount = self:getGiftShareCount(openInfo),
		curCanShareCount = self:getCurCanShareCount(drawId),
		skipAnimation = Utils.isTable(openInfo) and openInfo.skipAnimation == true or false,
		skipEntranceTimeline = Utils.isTable(openInfo) and openInfo.skipEntranceTimeline == true or false
	}
end

return LotteryModel
