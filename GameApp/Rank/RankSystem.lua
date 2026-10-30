-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Rank\\RankSystem.lua

local RankConst = require("Common.Const.RankConst")
local CallbackHandler = require("Core.Common.CallbackHandler")
local Class = require("Core.Framework.Class")
local LoggerManager = require("Core.Log.LoggerManager")
local MessageName = require("Const.MessageName")
local RankBaseData = require("Data.rank_base_data")
local SystemBase = require("GameApp.Core.SystemBase")
local Time = require("Core.Common.Time")
local json = require("json")
local logger = LoggerManager.getLogger("RankSystem")
local EMPTY_LIST = {}
local MAX_RANK_MEMBER_EXTRA_INFO_CACHE_SIZE = 200
local RankSystem = Class.LightClass("RankSystem", SystemBase)

local function getRankKey(rankId, tab1, tab2)
	return string.format("%s|%s|%s", rankId, tab1, tab2)
end

local function getPeriodRankId(rankSystem, rankId, tab1, tab2, periodRankId)
	return periodRankId or rankSystem:getCurrentRankId(rankId, tab1, tab2)
end

local function isCacheValid(updateTimes, rankKey, config)
	local updateTime = updateTimes[rankKey]

	if updateTime == nil then
		return false
	end

	return config.refreshType ~= 1 or Time.realSecondCache - updateTime < config.frequency
end

local function shouldRequestCache(updateTimes, requesting, rankKey, config)
	if requesting[rankKey] then
		return false
	end

	return not isCacheValid(updateTimes, rankKey, config)
end

local function decodeLocalRankInfo(rawInfo)
	if rawInfo == nil then
		return {}
	end

	local success, rankInfo = pcall(json.decode, rawInfo)

	if not success or rankInfo == nil then
		return {}
	end

	return rankInfo
end

function RankSystem:onCtor()
	self:onClear()
end

function RankSystem:onClear()
	self.rankTimeData = {}
	self.rankData = {}
	self.selfRankData = {}
	self.rankTabMappings = {}
	self.rankTabMappingRequesting = {}
	self.rankTabMappingPendingRefreshes = {}
	self.rankKeysByRankId = {}
	self.rankUpdateTimes = {}
	self.rankRequesting = {}
	self.rankMemberExtraInfoCache = {}
	self.rankMemberExtraInfoCacheOrder = {}
	self.rankMemberExtraInfoRequesting = {}
end

function RankSystem:setRankData(rankId, periodRankId, rankData)
	self.rankUpdateTimes[periodRankId] = Time.realSecondCache
	self.rankData[periodRankId] = rankData

	facade:SendMessageCommand(MessageName.RANK_DATA_UPDATED, rankId)
end

function RankSystem:requestRankMemberExtraInfo(periodRankId, memberId, callback)
	if periodRankId == nil or memberId == nil then
		if callback ~= nil then
			callback(nil)
		end

		return
	end

	local cache = self.rankMemberExtraInfoCache[periodRankId]
	local cachedInfo = cache and cache[memberId]

	if cachedInfo ~= nil then
		if callback ~= nil then
			callback(cachedInfo)
		end

		return
	end

	local previousRequest = self.rankMemberExtraInfoRequesting[periodRankId]
	local request = {
		memberId = memberId,
		callback = callback
	}

	self.rankMemberExtraInfoRequesting[periodRankId] = request

	if previousRequest ~= nil and previousRequest.callback ~= nil then
		previousRequest.callback(nil)
	end

	local onResponse = CallbackHandler(self, "onRankMemberExtraInfoResponse", request, periodRankId)

	if pg.me == nil or pg.me.isGuidancePlayer then
		onResponse({
			status = false
		}, nil)

		return
	end

	pg.me:queryRankMemberExtraInfo(periodRankId, {
		memberId
	}, onResponse)
end

function RankSystem:onRankMemberExtraInfoResponse(request, periodRankId, retStatus, response)
	if self.rankMemberExtraInfoRequesting[periodRankId] ~= request then
		return
	end

	self.rankMemberExtraInfoRequesting[periodRankId] = nil

	local memberExtraInfo
	local isSuccess = retStatus ~= nil and retStatus.status and response ~= nil

	if isSuccess then
		local extraInfo = response.ExtraInfo or EMPTY_LIST

		memberExtraInfo = extraInfo[tostring(request.memberId)] or extraInfo[request.memberId]
	end

	if memberExtraInfo ~= nil then
		self:setRankMemberExtraInfoCache(periodRankId, request.memberId, memberExtraInfo)
	end

	if request.callback ~= nil then
		request.callback(memberExtraInfo)
	end
end

function RankSystem:setRankMemberExtraInfoCache(periodRankId, memberId, extraInfo)
	local cache = self.rankMemberExtraInfoCache[periodRankId]

	if cache == nil then
		cache = {}
		self.rankMemberExtraInfoCache[periodRankId] = cache
	end

	if cache[memberId] ~= nil then
		cache[memberId] = extraInfo

		return
	end

	cache[memberId] = extraInfo

	local cacheOrder = self.rankMemberExtraInfoCacheOrder

	cacheOrder[#cacheOrder + 1] = {
		periodRankId = periodRankId,
		memberId = memberId
	}

	if #cacheOrder <= MAX_RANK_MEMBER_EXTRA_INFO_CACHE_SIZE then
		return
	end

	local expiredEntry = table.remove(cacheOrder, 1)
	local expiredCache = self.rankMemberExtraInfoCache[expiredEntry.periodRankId]

	expiredCache[expiredEntry.memberId] = nil

	if next(expiredCache) == nil then
		self.rankMemberExtraInfoCache[expiredEntry.periodRankId] = nil
	end
end

function RankSystem:getCachedRankData(rankId, tab1, tab2, periodRankId)
	periodRankId = getPeriodRankId(self, rankId, tab1, tab2, periodRankId)

	return periodRankId and self.rankData[periodRankId] or EMPTY_LIST
end

function RankSystem:getCachedSelfRankData(rankId, tab1, tab2, periodRankId)
	periodRankId = getPeriodRankId(self, rankId, tab1, tab2, periodRankId)

	if periodRankId == nil then
		return nil
	end

	local selfRankData = self.selfRankData[periodRankId]

	if selfRankData ~= nil then
		return selfRankData
	end

	return self:getLocalSelfRankData(periodRankId)
end

function RankSystem:getLocalSelfRankData(periodRankId)
	local playerRankComponent = pg.me
	local scoreMap = playerRankComponent and playerRankComponent.rankScoreMap
	local score = scoreMap and scoreMap[periodRankId]

	if score == nil then
		return nil
	end

	local infoMap = playerRankComponent.rankInfoMap
	local extraInfoMap = playerRankComponent.rankExtraInfoMap

	return {
		Rank = 0,
		Percentage = 0,
		MemberId = playerRankComponent.uid,
		Score = score,
		Info = decodeLocalRankInfo(infoMap and infoMap[periodRankId]),
		ExtraInfo = decodeLocalRankInfo(extraInfoMap and extraInfoMap[periodRankId])
	}
end

function RankSystem:requestRankSetTimeMetaBatch(rankIds, callback)
	if pg.me == nil or pg.me.isGuidancePlayer then
		if callback ~= nil then
			callback(false)
		end

		return
	end

	pg.me:getRankSetTimeMetaBatch(rankIds, CallbackHandler(self, "onRankSetTimeMetaResponse", self.rankTimeData, callback))
end

function RankSystem:onRankSetTimeMetaResponse(timeDataCache, callback, retStatus, response)
	if timeDataCache ~= self.rankTimeData then
		return
	end

	if retStatus == nil or not retStatus.status or response == nil then
		logger:error("onRankSetTimeMetaResponse failed, error=%s", retStatus and retStatus.errmsg or "empty response")

		if callback ~= nil then
			callback(false)
		end

		return
	end

	for _, data in ipairs(response.TimeMetas or EMPTY_LIST) do
		local timeMeta = data.TimeMeta
		local timesCount = #timeMeta

		assert(timesCount >= 4, "Invalid rank TimeMeta: " .. data.RankId)

		local settleTimes = {}

		for index = 4, timesCount do
			settleTimes[index - 3] = timeMeta[index]
		end

		timeDataCache[data.RankId] = {
			openTime = timeMeta[1],
			resetTime = timeMeta[2],
			closeTime = timeMeta[3],
			settleTime = timeMeta[4],
			settleTimes = settleTimes
		}
	end

	if callback ~= nil then
		callback(true)
	end
end

function RankSystem:getRankOpenTime(periodRankId)
	local data = self.rankTimeData[periodRankId]

	return data and data.openTime
end

function RankSystem:getRankResetTime(periodRankId)
	local data = self.rankTimeData[periodRankId]

	return data and data.resetTime
end

function RankSystem:getRankSettleTime(periodRankId, rewardIndex)
	local data = self.rankTimeData[periodRankId]

	if data == nil then
		return nil
	end

	if rewardIndex == nil then
		return data.settleTime
	end

	return data.settleTimes and data.settleTimes[rewardIndex]
end

function RankSystem:getRankCloseTime(periodRankId)
	local data = self.rankTimeData[periodRankId]

	return data and data.closeTime
end

function RankSystem:refreshRankDataIfNeeded(rankId, tab1, tab2, config, periodRankId)
	local currentRankId = self:getCurrentRankId(rankId, tab1, tab2)
	local pendingPeriodRankId = periodRankId ~= currentRankId and periodRankId or nil
	local mappingReady = self:refreshRankTabMappingIfNeeded(rankId, tab1, tab2, config.frequency, pendingPeriodRankId)

	if mappingReady == false then
		return
	end

	self:refreshPeriodRankDataIfNeeded(rankId, tab1, tab2, config, periodRankId)
end

function RankSystem:refreshPeriodRankDataIfNeeded(rankId, tab1, tab2, config, periodRankId)
	periodRankId = getPeriodRankId(self, rankId, tab1, tab2, periodRankId)

	if periodRankId == nil then
		return
	end

	if not self:shouldRequestRankData(periodRankId, config) then
		return
	end

	if self:isRankDataCacheExpired(periodRankId, config) then
		self:invalidateRankCache(rankId)
	end

	self:requestRankData(rankId, tab1, tab2, config, periodRankId)
end

function RankSystem:isRankDataCacheExpired(periodRankId, config)
	local updateTime = self.rankUpdateTimes[periodRankId]

	return updateTime ~= nil and not isCacheValid(self.rankUpdateTimes, periodRankId, config)
end

function RankSystem:refreshRankTabMappingIfNeeded(rankId, tab1, tab2, cacheDuration, periodRankId)
	local rankKey = getRankKey(rankId, tab1, tab2)
	local mappingValid = self:isRankTabMappingCacheValid(rankId, tab1, tab2, cacheDuration)

	if mappingValid then
		return true
	end

	self.rankTabMappingPendingRefreshes[rankKey] = {
		periodRankId = periodRankId
	}

	if self.rankTabMappingRequesting[rankKey] == true then
		return false
	end

	if pg.me == nil or pg.me.isGuidancePlayer then
		return false
	end

	self.rankTabMappingRequesting[rankKey] = true

	pg.me:getRankTabMapping(tostring(rankId), tostring(tab1), tostring(tab2), CallbackHandler(self, "onRankTabMappingResponse", rankId, tab1, tab2))

	return false
end

function RankSystem:onRankTabMappingResponse(rankId, tab1, tab2, retStatus, response)
	local rankKey = getRankKey(rankId, tab1, tab2)
	local pendingRefresh = self.rankTabMappingPendingRefreshes[rankKey]

	self.rankTabMappingRequesting[rankKey] = nil
	self.rankTabMappingPendingRefreshes[rankKey] = nil

	if retStatus == nil or not retStatus.status or response == nil then
		logger:error("onRankTabMappingResponse failed, rankKey=%s, error=%s", rankKey, retStatus and retStatus.errmsg or "empty response")

		return
	end

	local previousMapping = self.rankTabMappings[rankKey]
	local mappingChanged = previousMapping == nil or previousMapping.currentRankId ~= response.CurrentRankSetId or not table.equal(previousMapping.previousRankIds, response.PreviousRankSetIds)

	self.rankTabMappings[rankKey] = {
		currentRankId = response.CurrentRankSetId,
		previousRankIds = response.PreviousRankSetIds,
		updateTime = Time.realSecondCache
	}

	self:recordRankKey(rankId, rankKey)

	local periodRankId = pendingRefresh and pendingRefresh.periodRankId

	if mappingChanged then
		periodRankId = nil

		facade:SendMessageCommand(MessageName.RANK_TAB_MAPPING_UPDATED, {
			rankId = rankId,
			tab1 = tab1,
			tab2 = tab2
		})
	end

	self:refreshPeriodRankDataIfNeeded(rankId, tab1, tab2, self:getRankRequestConfig(rankId, tab1, tab2), periodRankId)
end

function RankSystem:recordRankKey(rankId, rankKey)
	local rankKeys = self.rankKeysByRankId[rankId]

	if rankKeys == nil then
		rankKeys = {}
		self.rankKeysByRankId[rankId] = rankKeys
	end

	rankKeys[rankKey] = true
end

function RankSystem:isRankDataRequesting(rankId, tab1, tab2, periodRankId)
	periodRankId = getPeriodRankId(self, rankId, tab1, tab2, periodRankId)

	return periodRankId ~= nil and self.rankRequesting[periodRankId] == true
end

function RankSystem:getRankRequestConfig(rankId, tab1, tab2)
	return RankBaseData[rankId][tab1][tab2]
end

function RankSystem:getCurrentRankId(rankId, tab1, tab2)
	local mapping = self.rankTabMappings[getRankKey(rankId, tab1, tab2)]
	local currentRankId = mapping and mapping.currentRankId

	return currentRankId ~= "" and currentRankId or nil
end

function RankSystem:getPreviousRankId(rankId, tab1, tab2)
	local mapping = self.rankTabMappings[getRankKey(rankId, tab1, tab2)]

	return mapping and mapping.previousRankIds[1]
end

function RankSystem:shouldRequestRankData(rankKey, config)
	return shouldRequestCache(self.rankUpdateTimes, self.rankRequesting, rankKey, config)
end

function RankSystem:requestRankData(rankId, tab1, tab2, config, periodRankId)
	if pg.me == nil or pg.me.isGuidancePlayer then
		return
	end

	local rankKey = getRankKey(rankId, tab1, tab2)

	periodRankId = getPeriodRankId(self, rankId, tab1, tab2, periodRankId)

	if periodRankId == nil then
		logger:error("requestRankData period rankId not found, rankKey=%s", rankKey)

		return
	end

	self:clearRankMemberExtraInfoCache(periodRankId)

	self.rankRequesting[periodRankId] = true

	if self.rankTimeData[periodRankId] == nil then
		self:requestRankSetTimeMetaBatch({
			periodRankId
		}, CallbackHandler(self, "onRankTimeMetaUpdated", rankId, tab1, tab2, periodRankId))
	end

	pg.me:rangeRankMembers(periodRankId, 1, config.displayList, CallbackHandler(self, "onRankMembersResponse", rankId, periodRankId))
end

function RankSystem:clearRankMemberExtraInfoCache(periodRankId)
	self.rankMemberExtraInfoCache[periodRankId] = nil

	local currentRequest = self.rankMemberExtraInfoRequesting[periodRankId]

	self.rankMemberExtraInfoRequesting[periodRankId] = nil

	if currentRequest ~= nil and currentRequest.callback ~= nil then
		currentRequest.callback(nil)
	end

	local cacheOrder = self.rankMemberExtraInfoCacheOrder

	for index = #cacheOrder, 1, -1 do
		if cacheOrder[index].periodRankId == periodRankId then
			table.remove(cacheOrder, index)
		end
	end
end

function RankSystem:onRankTimeMetaUpdated(rankId, tab1, tab2, periodRankId, success)
	if not success then
		return
	end

	facade:SendMessageCommand(MessageName.RANK_TIME_DATA_UPDATED, {
		rankId = rankId,
		tab1 = tab1,
		tab2 = tab2,
		periodRankId = periodRankId
	})
end

function RankSystem:onRankMembersResponse(rankId, periodRankId, retStatus, response)
	self:onSetRankMembers(rankId, periodRankId, retStatus, response)

	if self.selfRankData[periodRankId] == nil then
		pg.me:queryRankMembers(periodRankId, {
			pg.me.uid
		}, CallbackHandler(self, "onUpdateSelfRank", rankId, periodRankId))
	end
end

function RankSystem:onSetRankMembers(rankId, periodRankId, retStatus, response)
	if retStatus == nil or not retStatus.status or response == nil then
		self.rankRequesting[periodRankId] = nil

		logger:error("onRankMembersResponse failed, periodRankId=%s, error=%s", periodRankId, retStatus and retStatus.errmsg or "empty response")

		return
	end

	local rankList = response.RankList or EMPTY_LIST

	self.selfRankData[periodRankId] = self:getMemberRankData(rankList, pg.me.uid)
	self.rankRequesting[periodRankId] = nil

	self:setRankData(rankId, periodRankId, rankList)
end

function RankSystem:onUpdateSelfRank(rankId, periodRankId, retStatus, response)
	if retStatus == nil or not retStatus.status or response == nil then
		self.rankRequesting[periodRankId] = nil

		logger:error("onUpdateSelfRank failed, periodRankId=%s, error=%s", periodRankId, retStatus and retStatus.errmsg or "empty response")

		return
	end

	local rankList = response.RankList or EMPTY_LIST

	self.selfRankData[periodRankId] = self:getMemberRankData(rankList, pg.me.uid)

	facade:SendMessageCommand(MessageName.SELF_RANK_DATA_UPDATED, rankId)
end

function RankSystem:getMemberRankData(rankList, queriedMemberId)
	local memberRankData

	for _, rankData in ipairs(rankList) do
		local isHigherRank = memberRankData == nil or rankData.Rank < memberRankData.Rank

		if self:isMemberRankData(rankData, queriedMemberId) and isHigherRank then
			memberRankData = rankData
		end
	end

	return memberRankData
end

function RankSystem:isMemberRankData(rankData, queriedMemberId)
	if rankData.MemberId == queriedMemberId then
		return true
	end

	return self:isTeamMemberRankData(rankData, queriedMemberId)
end

function RankSystem:isTeamMemberRankData(rankData, queriedMemberId)
	local rankInfo = rankData.Info
	local teamInfo = rankInfo[tostring(RankConst.ShowEnum.TeamInfo)]

	if teamInfo == nil then
		return false
	end

	for _, memberInfo in ipairs(teamInfo.members) do
		if memberInfo.uid == queriedMemberId then
			return true
		end
	end

	return false
end

function RankSystem:isRankTabMappingCacheValid(rankId, tab1, tab2, cacheDuration)
	local mapping = self.rankTabMappings[getRankKey(rankId, tab1, tab2)]

	return mapping ~= nil and mapping.updateTime ~= nil and cacheDuration > Time.realSecondCache - mapping.updateTime
end

function RankSystem:isRankCacheValid(rankId, tab1, tab2, config)
	if not self:isRankTabMappingCacheValid(rankId, tab1, tab2, config.frequency) then
		return false
	end

	local periodRankId = getPeriodRankId(self, rankId, tab1, tab2)

	return periodRankId ~= nil and self.rankData[periodRankId] ~= nil and isCacheValid(self.rankUpdateTimes, periodRankId, config)
end

function RankSystem:invalidateRankCache(rankId)
	local rankKeys = self.rankKeysByRankId[rankId]

	if rankKeys == nil then
		return false
	end

	for rankKey in pairs(rankKeys) do
		local mapping = self.rankTabMappings[rankKey]
		local periodRankId = mapping.currentRankId

		if periodRankId ~= nil and periodRankId ~= "" then
			self.rankUpdateTimes[periodRankId] = nil
		end

		for _, previousRankId in ipairs(mapping.previousRankIds) do
			self.rankUpdateTimes[previousRankId] = nil
		end
	end

	return true
end

return RankSystem
