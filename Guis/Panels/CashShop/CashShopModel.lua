-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CashShop\\CashShopModel.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("CashShopModel")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local ShopmallTabData = require("Data.shopmall_tab_data")
local ShopmallTabGroupData = require("Data.shopmall_tab_group_data")
local RecommendationData = require("Data.shopmall_recommendation_data")
local ShopmallCommodityData = require("Data.shopmall_commodity_data")
local ShopmallGiftData = require("Data.shopmall_gift_data")
local ShopmallLinkGiftGroupData = require("Data.shopmall_link_gift_group_data")
local ShopmallLinkGiftData = require("Data.shopmall_link_gift_data")
local ShopCommonHelper = require("Utils.ShopCommonHelper")
local RandomShopData = require("Data.random_shop_data")
local AvatarPresetData = require("Data.avatar_preset_data")
local CommonSwitch = require("Common.CommonSwitch")
local CashShopConst = require("Const.CashShopConst")
local Utils = require("Common.Utils.Utils")
local TimeUtils = require("Common.Utils.TimeUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local ServiceUtils = require("Common.Utils.ServiceUtils")
local Time = require("Core.Common.Time")
local CashShopModel = Class.LightClass("CashShopModel", UIModel)
local RANDOM_SHOP_TIME_PATTERN = "(%d+)/(%d+)/(%d+)/(%d+):(%d+):(%d+)"

function CashShopModel:ctor()
	self._categoryList = {}
	self._itemCache = {}
	self._currentCategoryId = nil
	self._currentTabId = nil
	self._currentGroupId = nil
	self._showTabs = nil
end

function CashShopModel:setShowTabs(showTabs)
	local newSet

	if Utils.isTable(showTabs) and #showTabs > 0 then
		newSet = {}

		for _, tabId in ipairs(showTabs) do
			newSet[tabId] = true
		end
	end

	local old = self._showTabs
	local changed = false

	if old == nil ~= (newSet == nil) then
		changed = true
	elseif old and newSet then
		for k in pairs(old) do
			if not newSet[k] then
				changed = true

				break
			end
		end

		if not changed then
			for k in pairs(newSet) do
				if not old[k] then
					changed = true

					break
				end
			end
		end
	end

	self._showTabs = newSet

	return changed
end

function CashShopModel:isTabInShowTabs(tabId)
	if not self._showTabs then
		return true
	end

	return self._showTabs[tabId] == true
end

function CashShopModel:addShowTab(tabId)
	if not tabId or not self._showTabs then
		return false
	end

	if self._showTabs[tabId] then
		return false
	end

	self._showTabs[tabId] = true

	return true
end

function CashShopModel:getTabList()
	local result = {}

	for id, cfg in pairs(ShopmallTabData) do
		if not cfg.isHide or cfg.isHide ~= 1 then
			local entry = {}

			for k, v in pairs(cfg) do
				entry[k] = v
			end

			entry.id = id

			local switchKey = cfg.commonSwitchKey

			if switchKey then
				entry.unlock = CommonSwitch[switchKey] == true
			else
				entry.unlock = true
			end

			result[#result + 1] = entry
		end
	end

	table.sort(result, function(a, b)
		return a.sort < b.sort
	end)

	return result
end

function CashShopModel:isTabOpen(tabId)
	if not tabId then
		return false
	end

	local cfg = ShopmallTabData[tabId]

	if not cfg then
		return false
	end

	local switchKey = cfg.commonSwitchKey

	if not switchKey then
		return true
	end

	return CommonSwitch[switchKey] == true
end

function CashShopModel:getDefaultTabId()
	local tabList = self:getTabList()

	for _, tab in ipairs(tabList) do
		if tab.defaultSelect == 1 then
			return tab.id
		end
	end

	return tabList[1] and tabList[1].id or nil
end

function CashShopModel:setCurrentTabId(tabId)
	if self._currentTabId ~= tabId then
		self._currentGroupId = nil
	end

	self._currentTabId = tabId
end

function CashShopModel:getCurrentTabId()
	return self._currentTabId
end

function CashShopModel:getCurrentTabCurrencyList()
	local tabId = self._currentTabId

	if not tabId then
		return {}
	end

	local cfg = ShopmallTabData[tabId]
	local groupCfg = self._currentGroupId and ShopmallTabGroupData[self._currentGroupId]

	if groupCfg and groupCfg.tabId == tabId and groupCfg.currency ~= nil then
		cfg = groupCfg
	end

	if not cfg or not cfg.currency then
		return {}
	end

	local result = {}

	for _, id in ipairs(cfg.currency) do
		result[#result + 1] = {
			itemId = id
		}
	end

	return result
end

function CashShopModel:getRandomShopTimestamp(cfg, fieldName)
	local generatedTimestamp = tonumber(Utils.getConfigTimeOfArea(cfg, fieldName))

	if generatedTimestamp then
		return generatedTimestamp
	end

	local timeConfig = cfg and cfg[fieldName]

	if not Utils.isTable(timeConfig) then
		return nil
	end

	local timeType = tonumber(timeConfig[1])
	local timeString = timeConfig[2]

	if not timeType or type(timeString) ~= "string" or timeString == "" then
		return nil
	end

	local timestamp = TimeUtils.configStringToTimestampByType(timeType, timeString, RANDOM_SHOP_TIME_PATTERN)

	return tonumber(timestamp)
end

function CashShopModel:isRandomShopCommonSwitchOpen(cfg)
	local switchKey = cfg and cfg.commonSwitchKey

	if not switchKey or switchKey == "" then
		return true
	end

	return CommonSwitch[switchKey] == true
end

function CashShopModel:getCurrentRandomShop()
	local now = tonumber(Time.secondCache)

	if not now or now <= 0 then
		now = Time.getSecond()
	end

	for shopId, cfg in pairs(RandomShopData) do
		local startTime = self:getRandomShopTimestamp(cfg, "startTime")
		local endTime = self:getRandomShopTimestamp(cfg, "endTime")

		if startTime and endTime and startTime <= now and now <= endTime and self:isRandomShopCommonSwitchOpen(cfg) then
			return shopId, cfg
		end
	end

	return nil, nil
end

function CashShopModel:isRandomShopAvailable()
	local shopId = self:getCurrentRandomShop()

	return shopId ~= nil
end

function CashShopModel:getGroupListByTabId(tabId)
	local result = {}
	local randomShopAvailable = tabId ~= CashShopConst.CategoryType.EXCHANGE or self:isRandomShopAvailable()

	for id, cfg in pairs(ShopmallTabGroupData) do
		if cfg.tabId == tabId and cfg.isHide ~= 1 and ClientCashShopUtils.isShopTabGroupEnabled(id) and (id ~= CashShopConst.ExchangeShopTabType.Random or randomShopAvailable) then
			local entry = {}

			for k, v in pairs(cfg) do
				entry[k] = v
			end

			entry.id = id
			result[#result + 1] = entry
		end
	end

	table.sort(result, function(a, b)
		return a.sort < b.sort
	end)

	return result
end

function CashShopModel:getDefaultGroupId(tabId)
	local groups = self:getGroupListByTabId(tabId)

	return groups[1] and groups[1].id or nil
end

function CashShopModel:hasConfiguredGroups(tabId)
	for _, cfg in pairs(ShopmallTabGroupData) do
		if cfg.tabId == tabId and cfg.isHide ~= 1 then
			return true
		end
	end

	return false
end

function CashShopModel:setCurrentGroupId(groupId)
	self._currentGroupId = groupId
end

function CashShopModel:getCurrentGroupId()
	return self._currentGroupId
end

function CashShopModel:setCategoryList(list)
	self._categoryList = list or {}
end

function CashShopModel:getCategoryList()
	return self._categoryList
end

function CashShopModel:getDefaultCategoryId()
	if #self._categoryList > 0 then
		return self._categoryList[1].id
	end

	return nil
end

function CashShopModel:setCurrentCategoryId(categoryId)
	self._currentCategoryId = categoryId
end

function CashShopModel:getCurrentCategoryId()
	return self._currentCategoryId
end

function CashShopModel:setItemList(categoryId, itemList)
	self._itemCache[categoryId] = itemList or {}
end

function CashShopModel:getItemList(categoryId)
	return self._itemCache[categoryId]
end

function CashShopModel:hasItemCache(categoryId)
	return self._itemCache[categoryId] ~= nil
end

function CashShopModel:clearItemCache()
	self._itemCache = {}
end

function CashShopModel:getItemById(itemId)
	local list = self:getItemList(self._currentCategoryId)

	if not list then
		return nil
	end

	for _, item in ipairs(list) do
		if item.id == itemId then
			return item
		end
	end

	return nil
end

function CashShopModel:isItemSoldOut(itemId)
	local item = self:getItemById(itemId)

	if not item then
		return false
	end

	return item.stock ~= nil and item.stock <= 0
end

function CashShopModel:isItemReachLimit(itemId)
	local item = self:getItemById(itemId)

	if not item then
		return false
	end

	if not item.limitNum or item.limitNum <= 0 then
		return false
	end

	return (item.boughtNum or 0) >= item.limitNum
end

function CashShopModel:isOptionalGiftPackAvailable()
	for id, cfg in pairs(ShopmallCommodityData) do
		if cfg and cfg.tabGroupId == CashShopConst.GiftPackTabType.Optional and cfg.onSale == 1 and ClientCashShopUtils.isCommodityEnabled(id) then
			local startTime = Utils.getConfigTimeOfArea(cfg, "startTime")
			local endTime = Utils.getConfigTimeOfArea(cfg, "endTime")
			local inSaleTime = startTime and endTime and TimeUtils.isInRangeTimestamp(startTime, endTime)

			if inSaleTime and ClientCashShopUtils.getCommodityLeftLimit(id) > 0 then
				return true
			end
		end
	end

	return false
end

function CashShopModel:getCompletedLinkGiftPackTabs()
	local completedTabs = {}

	for tabId in pairs(ShopmallTabGroupData) do
		if self:isLinkGiftPackTab(tabId) then
			local groupId = self:getLinkGiftPackGroup(tabId, true)

			if groupId then
				local gifts = self:getLinkGiftPackData(groupId, true)
				local completed = #gifts > 0

				for _, gift in ipairs(gifts) do
					if not gift.isBought then
						completed = false

						break
					end
				end

				if completed then
					completedTabs[tabId] = groupId
				end
			end
		end
	end

	return completedTabs
end

function CashShopModel:getGiftPackTabData(completedLinkGiftPackTabs)
	local tabData = {}

	completedLinkGiftPackTabs = completedLinkGiftPackTabs or self:getCompletedLinkGiftPackTabs()

	local optionalAvailable = self:isOptionalGiftPackAvailable()

	for id, tabGroup in pairs(ShopmallTabGroupData) do
		if tabGroup.tabId ~= CashShopConst.CategoryType.GIFTPACK or tabGroup.isHide == 1 or not ClientCashShopUtils.isShopTabGroupEnabled(id) or id == CashShopConst.GiftPackTabType.Optional and not optionalAvailable then
			-- block empty
		elseif self:isLinkGiftPackTab(id) and (not self:getLinkGiftPackGroup(id) or completedLinkGiftPackTabs[id] == self:getLinkGiftPackGroup(id)) then
			-- block empty
		else
			local data = {}

			data.id = id
			data.name = tabGroup.tabName
			data.sort = tabGroup.sort

			table.insert(tabData, data)
		end
	end

	table.sort(tabData, function(a, b)
		if a.sort == b.sort then
			return a.id < b.id
		end

		return a.sort > b.sort
	end)

	return tabData
end

function CashShopModel:isLinkGiftPackTab(tabId)
	return ClientCashShopUtils.isLinkGiftPackTab(tabId)
end

function CashShopModel:isLinkGiftPackGroupAvailable(groupId, ignoreTabSwitch)
	return ClientCashShopUtils.isLinkGiftPackGroupAvailable(groupId, ignoreTabSwitch)
end

function CashShopModel:getLinkGiftPackGroup(tabId, ignoreTabSwitch)
	return ClientCashShopUtils.getLinkGiftPackGroup(tabId, ignoreTabSwitch)
end

function CashShopModel:getLinkGiftPackState(commodityId)
	return ClientCashShopUtils.getLinkGiftPackState(commodityId)
end

function CashShopModel:getLinkGiftPackData(groupId, ignoreTabSwitch)
	local giftPackData = {}

	if not self:isLinkGiftPackGroupAvailable(groupId, ignoreTabSwitch) then
		return giftPackData
	end

	for id, cfg in pairs(ShopmallLinkGiftData) do
		if cfg.tab == groupId and ShopCommonHelper.isConfigAvailableInArea(cfg) then
			local state = self:getLinkGiftPackState(id)

			giftPackData[#giftPackData + 1] = {
				id = id,
				config = cfg,
				state = state,
				isBought = state == 2
			}
		end
	end

	table.sort(giftPackData, function(a, b)
		local aPosition = a.config.order or math.huge
		local bPosition = b.config.order or math.huge

		if aPosition == bPosition then
			return a.id < b.id
		end

		return aPosition < bPosition
	end)

	return giftPackData
end

function CashShopModel:getNextLinkGiftPackRefreshTime()
	if not pg.me then
		return nil
	end

	local currentTime = Time.secondCache
	local nextRefreshTime

	for _, groupData in pairs(ShopmallLinkGiftGroupData) do
		if self:isLinkGiftPackTab(groupData.tab) then
			local startTime = Utils.getConfigTimeOfArea(groupData, "startTime")
			local endTime = Utils.getConfigTimeOfArea(groupData, "endTime")

			for _, boundary in pairs({
				startTime,
				endTime and endTime + 1
			}) do
				if currentTime < boundary and (not nextRefreshTime or boundary < nextRefreshTime) then
					nextRefreshTime = boundary
				end
			end
		end
	end

	return nextRefreshTime
end

function CashShopModel:getGiftPackData(tabId)
	local giftPackData = {}

	if not ClientCashShopUtils.isShopTabGroupEnabled(tabId) then
		return giftPackData
	end

	for id, cfg in pairs(ShopmallCommodityData) do
		local startTime = Utils.getConfigTimeOfArea(cfg, "startTime")
		local endTime = Utils.getConfigTimeOfArea(cfg, "endTime")
		local showGiftPack = startTime and endTime and TimeUtils.isInRangeTimestamp(startTime, endTime)

		if cfg and cfg.tabGroupId == tabId and showGiftPack and cfg.onSale == 1 and ClientCashShopUtils.isCommodityEnabled(id) then
			local giftData = ShopmallGiftData[cfg.itemId]

			if giftData then
				local entry = {}

				entry.id = id
				entry.giftPackType = giftData.giftPackType
				entry.giftPackName = giftData.giftPackName
				entry.giftPackIocn = giftData.giftPackIocn
				entry.FixItems = giftData.FixItems
				entry.selectItems = giftData.selectItems
				entry.sort = cfg.sort

				local leftLimit = ClientCashShopUtils.getCommodityLeftLimit(id)

				if leftLimit <= 0 then
					entry.sort = 0
				end

				giftPackData[#giftPackData + 1] = entry
			end
		end
	end

	table.sort(giftPackData, function(a, b)
		return a.sort > b.sort
	end)

	return giftPackData
end

function CashShopModel:costItemEnough(commodityId)
	local commodityData = ShopmallCommodityData[commodityId]

	if not commodityData then
		return false
	end

	local giftData = ShopmallGiftData[commodityData.itemId]

	if not giftData then
		return false
	end

	if giftData.giftPackType == 3 then
		return true
	end

	return ClientCashShopUtils.canAffordCommodity(commodityId, 1)
end

function CashShopModel:getRecommendationLists()
	local bannerList = {}
	local displayRaw = {}
	local visibilityContext = ClientCashShopUtils.getRecommendationVisibilityContext()

	for id, cfg in pairs(RecommendationData) do
		local entry = {}

		for k, v in pairs(cfg) do
			entry[k] = v
		end

		entry.id = id

		if ClientCashShopUtils.isRecommendationEntryVisible(entry, visibilityContext) then
			if cfg.showType == 1 then
				bannerList[#bannerList + 1] = entry
			else
				displayRaw[#displayRaw + 1] = entry
			end
		end
	end

	table.sort(bannerList, function(a, b)
		return a.sort < b.sort
	end)
	table.sort(displayRaw, function(a, b)
		return a.sort < b.sort
	end)

	local displayList = {}
	local i = 1

	while i <= #displayRaw do
		local entry = displayRaw[i]

		if entry.showType == 3 and displayRaw[i + 1] and displayRaw[i + 1].showType == 3 then
			entry.tIndex = 1
			displayList[#displayList + 1] = entry
			displayRaw[i + 1].tIndex = 1
			displayList[#displayList + 1] = displayRaw[i + 1]
			i = i + 2
		else
			entry.tIndex = 2
			displayList[#displayList + 1] = entry
			i = i + 1
		end
	end

	if bannerList and #bannerList > 0 then
		table.insert(displayList, 1, {
			tIndex = 0,
			bannerList = bannerList
		})
	end

	return displayList
end

function CashShopModel:requestFriendShopStatus(friendIds, commodityId, callback)
	if not friendIds or #friendIds == 0 or not commodityId then
		callback({})

		return
	end

	local selfUid = tostring(pg.me.uid)
	local requestFriendIds = {}
	local requestFriendUidMap = {}

	for _, friendId in ipairs(friendIds) do
		local friendUid = tostring(friendId)

		if friendUid ~= selfUid and not requestFriendUidMap[friendUid] then
			requestFriendUidMap[friendUid] = true
			requestFriendIds[#requestFriendIds + 1] = friendUid
		end
	end

	if #requestFriendIds == 0 then
		callback({})

		return
	end

	ServiceUtils.callService("UserDataService", "batchGetAttribute", {
		requestFriendIds,
		{
			"commodityDic"
		},
		false
	}, function(result, resp)
		local hasGiftMap = {}

		if not result or not result.status then
			logger:error("CashShopModel:requestFriendShopStatus failed, result=%s, resp=%s", inspect(result), inspect(resp))
			callback(hasGiftMap)

			return
		end

		local results = resp and resp.Results

		if results then
			for _, item in ipairs(results) do
				local friendUid = tostring(item.Uid or "")
				local attr = item.AttributesMap
				local commodityDic = attr and attr.commodityDic

				if requestFriendUidMap[friendUid] and Utils.isTable(commodityDic) and (commodityDic[commodityId] == true or commodityDic[tostring(commodityId)] == true) then
					hasGiftMap[friendUid] = true
				end
			end
		end

		callback(hasGiftMap)
	end, {
		callerId = pg.me.uid
	})
end

return CashShopModel
