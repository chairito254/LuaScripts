-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBook\\RogueBookModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local RogueConst = require("Const.RogueConst")
local RogueBookData = require("Data.rogue_book_data")
local RandomBuffSeriesName = require("Data.random_buff_series_name")
local RandomBuffRarity = require("Data.random_buff_rarity")
local RogueBookBuffData = require("Data.rogue_book_buff_data")
local RandomBuffData = require("Data.random_buff_data")
local ExtraRandomBuffData = require("Data.extra_random_buff")
local RogueBuffExtendData = require("Data.rogue_buff_extend")
local RogueBookEventData = require("Data.rogue_book_event_data")
local RogueRandomEventData = require("Data.rogue_random_event_data")
local RogueEventBattleData = require("Data.rogue__event_battle_data")
local RogueBookBossData = require("Data.rogue_book_boss_data")
local RogueTransformData = require("Data.rogue_transform_data")
local RogueBookModel = Class.LightClass("RogueBookModel", UIModel)

function RogueBookModel:init(ctrl)
	UIModel.init(self, ctrl)

	self.bookId = RogueConst.BookTypeId.Buff
end

function RogueBookModel:getBuffSeries()
	local buffSeries = {}

	for i = 0, 6 do
		buffSeries[#buffSeries + 1] = {
			buffSeries = i,
			cfg = RandomBuffSeriesName[i]
		}
	end

	return buffSeries
end

function RogueBookModel:getBuffRarities()
	local buffRarities = {}

	for i = #RandomBuffRarity, 0, -1 do
		buffRarities[#buffRarities + 1] = {
			buffRarity = i,
			cfg = RandomBuffRarity[i]
		}
	end

	return buffRarities
end

function RogueBookModel:getBuffConfig(buffId)
	local layerCfg = RogueBuffExtendData[buffId]
	local baseBuffId = layerCfg and layerCfg.buffSeriesName or buffId

	return RandomBuffData[buffId] or ExtraRandomBuffData[buffId] or RandomBuffData[baseBuffId] or ExtraRandomBuffData[baseBuffId]
end

function RogueBookModel:getLayerConfig(buffId, layer)
	return RogueBuffExtendData[buffId * 100 + layer]
end

function RogueBookModel:sortBuffData(a, b)
	local rarityA = a.buffRarity or 0
	local rarityB = b.buffRarity or 0

	if rarityA == rarityB then
		local baseBuffIdA = a.layerCfg and a.layerCfg.buffSeriesName or a.buffId
		local baseBuffIdB = b.layerCfg and b.layerCfg.buffSeriesName or b.buffId

		if baseBuffIdA == baseBuffIdB then
			return (a.buffLayer or 0) > (b.buffLayer or 0)
		end

		return baseBuffIdA < baseBuffIdB
	end

	return rarityB < rarityA
end

function RogueBookModel:getBuffMap()
	local buffMap = {}

	for buffId, bookCfg in pairs(RogueBookBuffData) do
		local buffCfg = self:getBuffConfig(buffId)
		local layerCfg = RogueBuffExtendData[buffId]

		if buffCfg or layerCfg then
			if not buffCfg and layerCfg then
				buffCfg = self:getBuffConfig(layerCfg.buffSeriesName)
			end

			local buffSeries = buffCfg.buffSeries
			local buffList = buffMap[buffSeries]

			if not buffList then
				buffList = {}
				buffMap[buffSeries] = buffList
			end

			local maxLayer = buffCfg.maxLayer or bookCfg.buffLayer or 1
			local buffName = layerCfg and layerCfg.buffName or buffCfg.buffName
			local buffDesc = layerCfg and layerCfg.buffDescFinal or buffCfg.buffDescFinal
			local buffData = {
				buffId = buffId,
				buffSeries = buffSeries,
				buffIndex = buffCfg.buffIndex or 0,
				buffRarity = buffCfg.buffRarity or buffCfg.buffLv,
				buffLayer = layerCfg and layerCfg.buffLayer or 1,
				buffMaxLayer = maxLayer,
				buffName = buffName,
				buffDescFinal = buffDesc,
				buffIcon = buffCfg.buffIcon,
				buffTagIcon = buffCfg.buffTagIcon,
				rewardId = bookCfg.reward,
				reward = bookCfg.reward,
				cfg = buffCfg,
				bookCfg = bookCfg,
				layerCfg = layerCfg
			}

			buffList[#buffList + 1] = buffData
		end
	end

	for _, buffList in pairs(buffMap) do
		table.sort(buffList, function(a, b)
			return self:sortBuffData(a, b)
		end)
	end

	return buffMap
end

function RogueBookModel:getEventTypeKeyMap()
	local eventTypeKeyMap = {}
	local randomEventMap = {}
	local eventBattleMap = {}
	local titleList = {
		pg.getGameString("ROGUE_BOOK_EVENT_TITLE1"),
		pg.getGameString("ROGUE_BOOK_EVENT_TITLE2"),
		pg.getGameString("ROGUE_BOOK_EVENT_TITLE3")
	}

	for _, eventCfg in pairs(RogueRandomEventData) do
		if eventCfg.eventIndex ~= nil then
			local eventIndex = tostring(eventCfg.eventIndex)

			if randomEventMap[eventIndex] == nil then
				randomEventMap[eventIndex] = eventCfg
			end
		end
	end

	for _, eventCfg in pairs(RogueEventBattleData) do
		if eventCfg.eventIndex ~= nil then
			local eventIndex = tostring(eventCfg.eventIndex)

			if eventBattleMap[eventIndex] == nil then
				eventBattleMap[eventIndex] = eventCfg
			end
		end
	end

	for i, bookData in pairs(RogueBookEventData) do
		local eventType = bookData.type
		local eventTypeKey = bookData.label

		if eventTypeKeyMap[eventTypeKey] == nil then
			eventTypeKeyMap[eventTypeKey] = {}
		end

		local eventTypeKeyList = eventTypeKeyMap[eventTypeKey]
		local bookEventData = {
			tIndex = 1,
			bookEventId = i,
			eventIndex = bookData.eventId,
			bookEventCfg = bookData,
			tagTitle = titleList[eventTypeKey],
			eventType = eventType,
			eventTypeKey = eventTypeKey
		}

		if eventType == 1 then
			local eventCfg = randomEventMap[tostring(bookData.eventId)]

			if eventCfg then
				bookEventData.eventName = pg.getLocalizationText(eventCfg.eventTitle)
				bookEventData.eventDesc = pg.getLocalizationText(eventCfg.eventText)
			end
		elseif eventType == 2 then
			local eventCfg = eventBattleMap[tostring(bookData.eventId)]

			if eventCfg then
				bookEventData.eventName = pg.getLocalizationText(eventCfg.eventTitle or eventCfg.eventName)
			end
		end

		eventTypeKeyList[#eventTypeKeyList + 1] = bookEventData
	end

	for _, eventTypeKeyList in pairs(eventTypeKeyMap) do
		table.sort(eventTypeKeyList, function(a, b)
			return a.bookEventId < b.bookEventId
		end)
	end

	return eventTypeKeyMap
end

function RogueBookModel:GetShowEventList()
	local eventTypeKeyMap = self:getEventTypeKeyMap()
	local showList = {}
	local titleList = {
		pg.getGameString("ROGUE_BOOK_EVENT_TITLE1"),
		pg.getGameString("ROGUE_BOOK_EVENT_TITLE2"),
		pg.getGameString("ROGUE_BOOK_EVENT_TITLE3")
	}

	for i = 1, 3 do
		local typeList = eventTypeKeyMap[i]

		if typeList and #typeList > 0 then
			local titleData = {
				isTitle = true,
				eventTypeKey = i,
				eventName = titleList[i],
				totalCount = #typeList
			}

			showList[#showList + 1] = titleData

			for _, eventData in ipairs(typeList) do
				showList[#showList + 1] = eventData
			end
		end
	end

	return showList
end

function RogueBookModel:GetBossMap()
	local bossMap = {}

	for buffSeries, bookSeriesData in pairs(RogueBookBossData) do
		local transformCfg = RogueTransformData[buffSeries]
		local bossList = {}

		for index, bookBossCfg in pairs(bookSeriesData) do
			local extraBuffCfg = ExtraRandomBuffData[index]

			bossList[#bossList + 1] = {
				buffSeries = buffSeries,
				bossIndex = index,
				buffId = index,
				rewardId = bookBossCfg.reward,
				icon = bookBossCfg.icon,
				bookCfg = bookBossCfg,
				transformCfg = transformCfg,
				extraBuffCfg = extraBuffCfg
			}
		end

		table.sort(bossList, function(a, b)
			return a.bossIndex < b.bossIndex
		end)

		bossMap[buffSeries] = {
			buffSeries = buffSeries,
			transformCfg = transformCfg,
			bossList = bossList
		}
	end

	return bossMap
end

function RogueBookModel:getBuffTotalCount()
	local totalCount = 0

	for _ in pairs(RogueBookBuffData) do
		totalCount = totalCount + 1
	end

	return totalCount
end

function RogueBookModel:getEventTotalCount()
	local totalCount = 0

	for _ in pairs(RogueBookEventData) do
		totalCount = totalCount + 1
	end

	return totalCount
end

function RogueBookModel:getBossTotalCount(buffSeries)
	local totalCount = 0

	if buffSeries ~= nil then
		for _ in pairs(RogueBookBossData[buffSeries] or {}) do
			totalCount = totalCount + 1
		end

		return totalCount
	end

	for _, seriesData in pairs(RogueBookBossData) do
		for _ in pairs(seriesData) do
			totalCount = totalCount + 1
		end
	end

	return totalCount
end

function RogueBookModel:getRogueBookTotalCount()
	local buffTotal = self:getBuffTotalCount()
	local eventTotal = self:getEventTotalCount()
	local bossTotal = self:getBossTotalCount()

	return {
		buffTotal = buffTotal,
		eventTotal = eventTotal,
		bossTotal = bossTotal,
		total = buffTotal + eventTotal + bossTotal
	}
end

function RogueBookModel:getBuffTotalCountByRarity(buffRarity)
	local totalCount = 0

	for buffId in pairs(RogueBookBuffData) do
		local buffCfg = self:getBuffConfig(buffId)
		local rarity = buffCfg and (buffCfg.buffRarity or buffCfg.buffLv)

		if rarity == buffRarity then
			totalCount = totalCount + 1
		end
	end

	return totalCount
end

function RogueBookModel:getBuffRarityTotalCount()
	local rarityTotalCount = {}

	for buffRarity in pairs(RandomBuffRarity) do
		rarityTotalCount[buffRarity] = self:getBuffTotalCountByRarity(buffRarity)
	end

	return rarityTotalCount
end

function RogueBookModel:getBuffProgressBySeriesAndRarity(buffSeries, buffRarity)
	local progress = 0
	local total = 0

	for buffId in pairs(RogueBookBuffData) do
		local buffCfg = self:getBuffConfig(buffId)
		local rarity = buffCfg and (buffCfg.buffRarity or buffCfg.buffLv)

		if buffCfg and buffCfg.buffSeries == buffSeries and rarity == buffRarity then
			total = total + 1

			if pg.me and pg.me.isBuffUnlock and pg.me:isBuffUnlock(buffId) then
				progress = progress + 1
			end
		end
	end

	return progress, total
end

function RogueBookModel:getBuffProgressBySeriesAndColour(buffSeries, buffColour)
	local progress = 0
	local total = 0

	for buffId in pairs(RogueBookBuffData) do
		local buffCfg = self:getBuffConfig(buffId)
		local layerCfg = RogueBuffExtendData[buffId]
		local rarity = buffCfg and (buffCfg.buffRarity or buffCfg.buffLv)
		local layer = layerCfg and layerCfg.buffLayer or 1
		local colour = rarity == 2 and layer == 3 and 3 or rarity

		if buffCfg and buffCfg.buffSeries == buffSeries and colour == buffColour then
			total = total + 1

			if pg.me and pg.me.isBuffUnlock and pg.me:isBuffUnlock(buffId) then
				progress = progress + 1
			end
		end
	end

	return progress, total
end

function RogueBookModel:getBuffProgressMap()
	local progressMap = {}

	for _, seriesData in ipairs(self:getBuffSeries()) do
		local seriesProgress = {}

		progressMap[seriesData.buffSeries] = seriesProgress

		for _, rarityData in ipairs(self:getBuffRarities()) do
			local progress, total = self:getBuffProgressBySeriesAndRarity(seriesData.buffSeries, rarityData.buffRarity)

			seriesProgress[rarityData.buffRarity] = {
				progress = progress,
				total = total
			}
		end
	end

	return progressMap
end

function RogueBookModel:getBuffList(buffSeries)
	return self:getBuffMap()[buffSeries] or {}
end

function RogueBookModel:setBookId(bookId)
	self.bookId = bookId or RogueConst.BookTypeId.Buff
end

function RogueBookModel:getBookId()
	return self.bookId
end

function RogueBookModel:getBookConfig(bookId)
	return RogueBookData[bookId or self.bookId]
end

return RogueBookModel
