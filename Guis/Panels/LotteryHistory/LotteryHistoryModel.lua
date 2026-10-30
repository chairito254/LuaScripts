-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LotteryHistory\\LotteryHistoryModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Utils = require("Common.Utils.Utils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ItemData = require("Data.item_data")
local LotteryHistoryModel = Class.LightClass("LotteryHistoryModel", UIModel)

LotteryHistoryModel.DEFAULT_PAGE_SIZE = 5

function LotteryHistoryModel:ctor()
	UIModel.ctor(self)

	self._historyList = {}
	self._historyCount = 0
	self._pageIndex = 1
	self._pageSize = LotteryHistoryModel.DEFAULT_PAGE_SIZE
end

function LotteryHistoryModel:setPageSize(pageSize)
	pageSize = tonumber(pageSize)

	if pageSize and pageSize >= 1 then
		self._pageSize = math.floor(pageSize)

		return
	end

	self._pageSize = LotteryHistoryModel.DEFAULT_PAGE_SIZE
end

function LotteryHistoryModel:refreshHistory(drawId)
	self._historyList, self._historyCount = self:buildHistoryList(drawId)
	self._pageIndex = 1
end

function LotteryHistoryModel:getTotalPages()
	local pageSize = self._pageSize or LotteryHistoryModel.DEFAULT_PAGE_SIZE

	return math.max(1, math.ceil((self._historyCount or 0) / pageSize))
end

function LotteryHistoryModel:setPageIndex(pageIndex)
	pageIndex = math.floor(tonumber(pageIndex) or 1)
	self._pageIndex = math.max(1, math.min(pageIndex, self:getTotalPages()))
end

function LotteryHistoryModel:getPageIndex()
	return self._pageIndex or 1
end

function LotteryHistoryModel:getCurrentPageList()
	local result = {}
	local historyList = self._historyList or {}
	local pageSize = self._pageSize or LotteryHistoryModel.DEFAULT_PAGE_SIZE
	local startIndex = (self:getPageIndex() - 1) * pageSize + 1
	local endIndex = math.min(startIndex + pageSize - 1, self._historyCount or 0)

	if endIndex < startIndex then
		return result
	end

	local left, right = 1, #historyList

	while left <= right do
		local middle = math.floor((left + right) / 2)

		if startIndex > historyList[middle].lastIndex then
			left = middle + 1
		else
			right = middle - 1
		end
	end

	for batchIndex = left, #historyList do
		local batch = historyList[batchIndex]

		if endIndex < batch.firstIndex then
			break
		end

		local firstItemIndex = math.max(startIndex, batch.firstIndex) - batch.firstIndex + 1
		local lastItemIndex = math.min(endIndex, batch.lastIndex) - batch.firstIndex + 1

		for itemIndex = firstItemIndex, lastItemIndex do
			result[#result + 1] = self:getHistoryItem(batch, itemIndex)
		end
	end

	return result
end

function LotteryHistoryModel:getHistoryItem(batch, itemIndex)
	local cachedItem = batch.items[itemIndex]

	if cachedItem then
		return cachedItem
	end

	if batch.time == nil then
		batch.time = self:getDrawTimeText(batch.drawRecord.drawTime)
	end

	local itemRecord = batch.itemRecords[itemIndex]
	local itemId = tonumber(itemRecord.itemId)
	local itemConfig = itemId and ItemData[itemId] or nil
	local item = {
		itemId = itemId,
		itemNum = tonumber(itemRecord.itemNum) or 1,
		name = itemConfig and pg.getLocalizationText(itemConfig.itemName) or "",
		quality = self:getQualityText(itemConfig and itemConfig.quality or nil),
		time = batch.time,
		drawRecord = batch.drawRecord,
		itemRecord = itemRecord
	}

	batch.items[itemIndex] = item

	return item
end

function LotteryHistoryModel:getDrawRecords(drawId)
	local gachaMap = pg.me and pg.me.gachaMap or nil

	if not Utils.isTable(gachaMap) then
		return nil
	end

	local gachaBase = gachaMap[tonumber(drawId)]

	if not Utils.isTable(gachaBase) then
		return nil
	end

	return gachaBase.drawRecords
end

function LotteryHistoryModel:getQualityText(quality)
	quality = tonumber(quality)

	if not quality then
		return ""
	end

	return pg.getGameString("LOTTERY_REWARD_RARITY_" .. tostring(quality))
end

function LotteryHistoryModel:getDrawTimeText(timestamp)
	timestamp = tonumber(timestamp)

	if not timestamp or timestamp <= 0 then
		return ""
	end

	return LuaUIUtils.timeStampToSystemLocalString(timestamp)
end

function LotteryHistoryModel:buildHistoryList(drawId)
	local result = {}
	local totalCount = 0
	local drawRecords = self:getDrawRecords(drawId)

	if not drawRecords then
		return result, totalCount
	end

	for recordIndex = #drawRecords, 1, -1 do
		local drawRecord = drawRecords[recordIndex]
		local itemRecords = drawRecord and drawRecord.itemRecords or nil
		local itemCount = itemRecords and #itemRecords or 0

		if itemCount > 0 then
			result[#result + 1] = {
				firstIndex = totalCount + 1,
				lastIndex = totalCount + itemCount,
				drawRecord = drawRecord,
				itemRecords = itemRecords,
				items = {}
			}
			totalCount = totalCount + itemCount
		end
	end

	return result, totalCount
end

return LotteryHistoryModel
