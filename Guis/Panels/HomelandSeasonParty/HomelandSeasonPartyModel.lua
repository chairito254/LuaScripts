-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandSeasonParty\\HomelandSeasonPartyModel.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local HomeSeasonUtils = require("Utils.HomeSeasonUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local HomeSeasonModuleData = require("Data.home_season_module_data")
local HomeSeasonCelebrationData = require("Data.home_season_celebration_data")
local HomelandSeasonPartyModel = Class.LightClass("HomelandSeasonPartyModel", UIModel)

function HomelandSeasonPartyModel:ctor()
	UIModel.ctor(self)

	self.moduleId = nil
	self.seasonId = nil
	self.stageId = nil
	self.moduleConfig = nil
	self.celebrationConfig = nil
end

local function containsStage(configuredStageIds, stageId)
	for _, configuredStageId in ipairs(configuredStageIds) do
		if configuredStageId == stageId then
			return true
		end
	end

	return false
end

local function findCelebrationConfig(seasonId, stageId)
	local matchedFestivalId, matchedConfig

	for festivalId, celebrationConfig in pairs(HomeSeasonCelebrationData) do
		if celebrationConfig.seasonId == seasonId and containsStage(celebrationConfig.stageId, stageId) and (not matchedFestivalId or festivalId < matchedFestivalId) then
			matchedFestivalId = festivalId
			matchedConfig = celebrationConfig
		end
	end

	return matchedFestivalId, matchedConfig
end

local function buildRewardViewData(rewardId)
	if type(rewardId) ~= "number" or rewardId <= 0 then
		return {}
	end

	return LuaUIUtils.getRewardItemByDropId(rewardId) or EMPTY_TABLE
end

function HomelandSeasonPartyModel:resetData()
	self.moduleId = nil
	self.seasonId = nil
	self.stageId = nil
	self.moduleConfig = nil
	self.celebrationConfig = nil
end

function HomelandSeasonPartyModel:refreshData(moduleId)
	self:resetData()

	local player = pg.me

	if not HomeSeasonUtils.isSeasonAvailable(player) then
		return nil
	end

	local seasonId = player.homeSeasonId
	local stageId = HomeSeasonUtils.getCurrentStageId(seasonId)
	local moduleConfig = HomeSeasonModuleData[moduleId]

	if not moduleConfig or moduleConfig.type ~= Const.HOMELAND_SEASON_MODULE_TYPE.PARTY or not HomeSeasonUtils.isModuleOpen(seasonId, moduleId) then
		return nil
	end

	local _, celebrationConfig = findCelebrationConfig(seasonId, stageId)

	if not celebrationConfig then
		return nil
	end

	self.moduleId = moduleId
	self.seasonId = seasonId
	self.stageId = stageId
	self.moduleConfig = moduleConfig
	self.celebrationConfig = celebrationConfig

	return {
		title = pg.getLocalizationText(moduleConfig.name),
		details = pg.getLocalizationText(moduleConfig.des),
		startTime = Utils.getConfigTimeOfAreaByData(moduleConfig.startDayTime, moduleConfig.startDayTimeRefId),
		endTime = Utils.getConfigTimeOfAreaByData(moduleConfig.endDayTime, moduleConfig.endDayTimeRefId),
		rewards = buildRewardViewData(moduleConfig.rewardId)
	}
end

return HomelandSeasonPartyModel
