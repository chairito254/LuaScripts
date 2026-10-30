-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandFurnitureComplete\\HomelandFurnitureCompleteModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local ClientUtils = require("Utils.ClientUtils")
local ClientHomelandUtils = require("Utils.ClientHomelandUtils")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local HomeObjectData = require("Data.home_object_data")
local UIConst = require("Const.UIConst")
local HomelandFurnitureCompleteModel = Class.LightClass("HomelandFurnitureCompleteModel", UIModel)

HomelandFurnitureCompleteModel.CATEGORY_BUY = "buy"
HomelandFurnitureCompleteModel.CATEGORY_REDEEM = "redeem"
HomelandFurnitureCompleteModel.CATEGORY_UNAVAILABLE = "unavailable"

function HomelandFurnitureCompleteModel:isSelectableCategory(category)
	return category == HomelandFurnitureCompleteModel.CATEGORY_BUY or category == HomelandFurnitureCompleteModel.CATEGORY_REDEEM
end

function HomelandFurnitureCompleteModel:init(info)
	self.info = info or {}
	self.detailData = self.info.detailData or {}
	self.composeIndex = self.info.composeIndex
	self.areaId = tonumber(self.info.areaId or self.detailData.areaId)
	self.isHomeCampPlan = self.areaId == -1
	self.isPlan = self.info.isPlan == true or self.composeIndex == UIConst.HOME_COMPOSE_MODE.PLAN
	self.isCarGroupMode = self.info.isCarGroupMode == true or self.info.carGroup ~= nil or self.isHomeCampPlan
	self.requiredCounts = self:getRequiredCounts()
	self.entries = {}
	self.entriesByCategory = {}
	self.costsById = {}
	self.costTypesById = {}

	self:refresh()
end

function HomelandFurnitureCompleteModel:getRequiredCounts()
	local counts = {}
	local homeIdList = self.detailData.homeIdList

	if Utils.isTable(homeIdList) and #homeIdList > 0 then
		for _, homeId in ipairs(homeIdList) do
			if homeId then
				counts[homeId] = (counts[homeId] or 0) + 1
			end
		end

		return counts
	end

	for _, ornamentInfo in ipairs(self.detailData.ornaments or {}) do
		local homeId = ornamentInfo and ornamentInfo.homeId

		if homeId then
			counts[homeId] = (counts[homeId] or 0) + 1
		end
	end

	return counts
end

function HomelandFurnitureCompleteModel:getReusableSceneCount(homeId)
	if not self.isPlan then
		return 0
	end

	local homeSpace = self.info.homeSpace

	if not homeSpace then
		if self.isHomeCampPlan and self.info.carGroup then
			homeSpace = self.info.carGroup.campCarEnt
		else
			homeSpace = pg.me and pg.me.space
		end
	end

	if not homeSpace or not Utils.isTable(homeSpace.ornament) then
		return 0
	end

	local count = 0

	for _, ornamentInfo in pairs(homeSpace.ornament) do
		if ornamentInfo.homeId == homeId and Utils.checkHomeObjectEditable(homeId) then
			local ornamentAreaId = tonumber(ornamentInfo.areaId) or Const.HOMELAND_AREA_TYPE.PRODUCE

			if self.isHomeCampPlan or ornamentAreaId == self.areaId then
				count = count + 1
			end
		end
	end

	return count
end

function HomelandFurnitureCompleteModel:getOwnedCount(homeId)
	local count = ClientUtils.getItemCountById(homeId) or 0

	if pg.me and pg.me:isInSelfHomeland() then
		count = count + (ClientUtils.getHomelandItemCountById(homeId) or 0)
	end

	return count + self:getReusableSceneCount(homeId)
end

function HomelandFurnitureCompleteModel:refreshEntryCounts()
	for _, entry in ipairs(self.entries) do
		entry.ownedCount = self:getOwnedCount(entry.itemId)
		entry.needCount = math.max(entry.requiredCount - entry.ownedCount, 0)

		if entry.needCount <= 0 then
			entry.selected = false
		end
	end
end

function HomelandFurnitureCompleteModel:getResourceCount(itemId)
	local count = ClientUtils.getItemCountById(itemId) or 0

	if pg.me and pg.me:isInSelfHomeland() then
		count = count + (ClientUtils.getHomelandItemCountById(itemId) or 0)
	end

	return count
end

function HomelandFurnitureCompleteModel:getAcquireState(homeId, objectData)
	if not objectData or not ClientHomelandUtils.isFurnitureAvailableInArea(homeId) then
		return nil, false
	end

	local releaseState = ClientHomelandUtils.getFurnitureReleaseState(homeId)

	if not releaseState.isReleased or releaseState.isOffShelf then
		return nil, false
	end

	local unlockState = ClientHomelandUtils.getFurnitureUnlockState(homeId, false)

	return unlockState, not unlockState.isLocked
end

function HomelandFurnitureCompleteModel:buildEntry(homeId, requiredCount, previousSelections)
	local objectData = HomeObjectData[homeId]
	local ownedCount = self:getOwnedCount(homeId)
	local needCount = math.max(requiredCount - ownedCount, 0)

	if needCount <= 0 then
		return
	end

	local unlockState, canAcquire = self:getAcquireState(homeId, objectData)
	local category = HomelandFurnitureCompleteModel.CATEGORY_UNAVAILABLE
	local getWay = objectData and objectData.getWay

	if canAcquire and getWay == Const.HOMELAND_ORNAMENT_GET_WAY.BUY then
		category = HomelandFurnitureCompleteModel.CATEGORY_BUY
	elseif canAcquire and getWay == Const.HOMELAND_ORNAMENT_GET_WAY.REDEEM then
		category = HomelandFurnitureCompleteModel.CATEGORY_REDEEM
	end

	local moneyType = objectData and objectData.buyMoneyType
	local moneyNum = objectData and objectData.buyMoneyNum

	if pg.space and pg.space.demoMode and Const.HOMELAND_DEMO_SHELL_BUY_ORNAMENT_IDS[homeId] then
		moneyType = Const.HOMELAND_DEMO_SHELL_ITEM_ID
		moneyNum = Const.HOMELAND_DEMO_SHELL_BUY_ORNAMENT_PRICE
	end

	local selected = self:isSelectableCategory(category) and previousSelections[homeId] == true

	return {
		itemId = homeId,
		requiredCount = requiredCount,
		ownedCount = ownedCount,
		needCount = needCount,
		category = category,
		getWay = getWay,
		selected = selected,
		unlockState = unlockState,
		moneyType = moneyType,
		moneyNum = moneyNum,
		buyItemId1 = objectData and objectData.buyItemId1,
		buyItemNum1 = objectData and objectData.buyItemNum1,
		buyItemId2 = objectData and objectData.buyItemId2,
		buyItemNum2 = objectData and objectData.buyItemNum2
	}
end

function HomelandFurnitureCompleteModel:refresh()
	local previousSelections = {}

	for _, entry in ipairs(self.entries or {}) do
		if self:isSelectableCategory(entry.category) then
			previousSelections[entry.itemId] = entry.selected
		end
	end

	self.entries = {}
	self.entriesByCategory = {
		[HomelandFurnitureCompleteModel.CATEGORY_BUY] = {},
		[HomelandFurnitureCompleteModel.CATEGORY_REDEEM] = {},
		[HomelandFurnitureCompleteModel.CATEGORY_UNAVAILABLE] = {}
	}

	local homeIds = {}

	for homeId, _ in pairs(self.requiredCounts) do
		table.insert(homeIds, homeId)
	end

	table.sort(homeIds)

	for _, homeId in ipairs(homeIds) do
		local entry = self:buildEntry(homeId, self.requiredCounts[homeId], previousSelections)

		if entry then
			table.insert(self.entries, entry)
			table.insert(self.entriesByCategory[entry.category], entry)
		end
	end

	self:refreshCostSummary()
end

function HomelandFurnitureCompleteModel:refreshCostSummary()
	self.costsById = {}
	self.costTypesById = {}
	self.rpcItems = {}

	for _, entry in ipairs(self.entries) do
		if entry.selected and entry.needCount > 0 then
			table.insert(self.rpcItems, {
				itemId = entry.itemId,
				itemNum = entry.needCount
			})

			if entry.getWay == Const.HOMELAND_ORNAMENT_GET_WAY.BUY then
				if entry.moneyType and entry.moneyNum then
					self.costsById[entry.moneyType] = (self.costsById[entry.moneyType] or 0) + entry.moneyNum * entry.needCount
					self.costTypesById[entry.moneyType] = "money"
				end
			elseif entry.getWay == Const.HOMELAND_ORNAMENT_GET_WAY.REDEEM then
				if entry.buyItemId1 and entry.buyItemNum1 then
					self.costsById[entry.buyItemId1] = (self.costsById[entry.buyItemId1] or 0) + entry.buyItemNum1 * entry.needCount
					self.costTypesById[entry.buyItemId1] = self.costTypesById[entry.buyItemId1] or "material"
				end

				if entry.buyItemId2 and entry.buyItemNum2 then
					self.costsById[entry.buyItemId2] = (self.costsById[entry.buyItemId2] or 0) + entry.buyItemNum2 * entry.needCount
					self.costTypesById[entry.buyItemId2] = self.costTypesById[entry.buyItemId2] or "material"
				end
			end
		end
	end
end

function HomelandFurnitureCompleteModel.sortCosts(a, b)
	local aLack = a.num < a.costNum
	local bLack = b.num < b.costNum

	if aLack ~= bLack then
		return aLack
	end

	return a.id < b.id
end

function HomelandFurnitureCompleteModel:getCosts()
	local costs = {}

	for itemId, needCount in pairs(self.costsById) do
		table.insert(costs, {
			skipConditionConvert = true,
			showNum = true,
			id = itemId,
			num = self:getResourceCount(itemId),
			costNum = needCount,
			resourceType = self.costTypesById[itemId]
		})
	end

	table.sort(costs, HomelandFurnitureCompleteModel.sortCosts)

	return costs
end

function HomelandFurnitureCompleteModel:setEntrySelected(itemId, selected)
	for _, entry in ipairs(self.entries) do
		if entry.itemId == itemId and entry.needCount > 0 then
			if self:isSelectableCategory(entry.category) then
				entry.selected = selected == true
			end

			break
		end
	end

	self:refreshCostSummary()
end

function HomelandFurnitureCompleteModel:setCategorySelected(category, selected)
	if not self:isSelectableCategory(category) then
		return
	end

	for _, entry in ipairs(self:getCategoryEntries(category)) do
		entry.selected = selected == true
	end

	self:refreshCostSummary()
end

function HomelandFurnitureCompleteModel:setAllSelected(selected)
	for _, entry in ipairs(self.entries) do
		if self:isSelectableCategory(entry.category) then
			entry.selected = selected == true
		end
	end

	self:refreshCostSummary()
end

function HomelandFurnitureCompleteModel:isCategoryAllSelected(category)
	if not self:isSelectableCategory(category) then
		return false
	end

	local entries = self:getCategoryEntries(category)

	if #entries == 0 then
		return false
	end

	for _, entry in ipairs(entries) do
		if not entry.selected then
			return false
		end
	end

	return true
end

function HomelandFurnitureCompleteModel:isAllSelected()
	local hasSelectable = false

	for _, entry in ipairs(self.entries) do
		if self:isSelectableCategory(entry.category) then
			hasSelectable = true

			if not entry.selected then
				return false
			end
		end
	end

	return hasSelectable
end

function HomelandFurnitureCompleteModel:validateSelectedResources()
	self:refreshEntryCounts()
	self:refreshCostSummary()

	for _, cost in ipairs(self:getCosts()) do
		if cost.num < cost.costNum then
			return false, {
				resourceType = cost.resourceType,
				itemId = cost.id,
				needCount = cost.costNum,
				ownedCount = cost.num
			}
		end
	end

	return true
end

function HomelandFurnitureCompleteModel:getRpcItems()
	self:refreshEntryCounts()
	self:refreshCostSummary()

	return self.rpcItems
end

function HomelandFurnitureCompleteModel:getCategoryEntries(category)
	return self.entriesByCategory[category] or {}
end

function HomelandFurnitureCompleteModel:getEntry(itemId)
	for _, entry in ipairs(self.entries) do
		if entry.itemId == itemId then
			return entry
		end
	end
end

function HomelandFurnitureCompleteModel:getSelectedItemCount()
	local selectedCount = 0

	for _, item in ipairs(self.rpcItems) do
		selectedCount = selectedCount + item.itemNum
	end

	return selectedCount
end

function HomelandFurnitureCompleteModel:hasMissingFurniture()
	for _, entry in ipairs(self.entries) do
		if entry.needCount > 0 then
			return true
		end
	end

	return false
end

function HomelandFurnitureCompleteModel:hasMissingFurnitureAfter(rpcItems)
	local completedCounts = {}

	for _, item in ipairs(rpcItems) do
		completedCounts[item.itemId] = (completedCounts[item.itemId] or 0) + item.itemNum
	end

	for _, entry in ipairs(self.entries) do
		if entry.needCount > (completedCounts[entry.itemId] or 0) then
			return true
		end
	end

	return false
end

function HomelandFurnitureCompleteModel:hasSelectableFurniture()
	for _, entry in ipairs(self.entries) do
		if entry.needCount > 0 and self:isSelectableCategory(entry.category) then
			return true
		end
	end

	return false
end

return HomelandFurnitureCompleteModel
