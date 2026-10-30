-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\GrabEggsSeasonChallenge\\GrabEggsSeasonChallengeModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local RobEggConst = require("Common.Const.RobEggConst")
local RedDotConst = require("Const.RedDotConst")
local ChallengeData = require("Data.rob_egg_season_challenge_data")
local ChallengeTabData = require("Data.rob_egg_season_challenge_tab_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local SeasonStageData = require("Data.season_stage_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local GrabEggsRankUtils = require("Guis.Utils.GrabEggsRankUtils")
local ChallengeUtils = require("Guis.Utils.GrabEggsSeasonChallengeUtils")
local GrabEggsSeasonChallengeModel = Class.LightClass("GrabEggsSeasonChallengeModel", UIModel)
local RewardState = RobEggConst.SEASON_CHALLENGE_REWARD_STATE
local BADGE_URLS = {
	"$UI_Img_GrabEgg_SeasonChallenge_Copper_Badge.png",
	"$UI_Img_GrabEgg_SeasonChallenge_Silver_Badge.png",
	"$UI_Img_GrabEgg_SeasonChallenge_Gold_Badge.png"
}

local function localize(textId)
	return textId and pg.getLocalizationText(textId) or ""
end

local function getGroupKey(seasonId, tab, groupId)
	return string.format("%d:%d:%d", seasonId, tab, groupId)
end

function GrabEggsSeasonChallengeModel:ctor()
	self.groups = {}
end

function GrabEggsSeasonChallengeModel:getCurrentSeasonInfo()
	local info = GrabEggsRankUtils.getSeasonDisplayInfo()

	if not info then
		return nil
	end

	local config = SeasonStageData[info.seasonId]

	config = config and config[info.stageId]

	local result = {}

	for key, value in pairs(info) do
		result[key] = value
	end

	result.config = config

	return result
end

function GrabEggsSeasonChallengeModel:getBadgeUrl(level)
	return BADGE_URLS[level]
end

function GrabEggsSeasonChallengeModel:getCareerCounts()
	local player = pg.me

	return {
		gold = player and player.goldCup or 0,
		silver = player and player.silverCup or 0,
		copper = player and player.copperCup or 0
	}
end

function GrabEggsSeasonChallengeModel:hasClaimableReward()
	return ChallengeUtils.hasClaimableReward(pg.me)
end

function GrabEggsSeasonChallengeModel:buildStage(id, config)
	local rewardState = ChallengeUtils.getRewardState(pg.me, id, config.seasonId)
	local isClaimable = rewardState == RewardState.CanGetReward
	local hasGet = rewardState == RewardState.Rewarded
	local condition = CustomTriggerData[config.conditionId]
	local firstCondition = condition and condition.condition and condition.condition[1]
	local target = firstCondition and tonumber(firstCondition[5]) or 0

	target = math.max(0, target or 0)

	local current = 0
	local triggerMap = pg.me and pg.me.triggerMap

	if firstCondition and triggerMap then
		current = triggerMap:getConditionFinishCount(config.conditionId, 1) or 0
	end

	current = math.max(0, current)

	if target > 0 then
		current = (isClaimable or hasGet) and target or math.min(current, target)
	end

	local description = localize(condition and condition.note)

	description = string.gsub(description, "%%s", tostring(target), 1)

	return {
		id = id,
		seasonId = config.seasonId,
		groupId = config.group,
		groupKey = getGroupKey(config.seasonId, config.tab, config.group),
		tab = config.tab,
		level = config.level,
		controllerLevel = 3 - config.level,
		state = isClaimable and 2 or hasGet and 1 or 0,
		rewardState = rewardState,
		isClaimable = isClaimable,
		hasGet = hasGet,
		conditionId = config.conditionId,
		rewardId = config.reward,
		current = current,
		target = target,
		description = description,
		text = target > 0 and string.format("%s (%d/%d)", description, current, target) or description,
		rewards = LuaUIUtils.getRewardItemByDropId(config.reward, hasGet, isClaimable),
		iconUrl = self:getBadgeUrl(config.level)
	}
end

function GrabEggsSeasonChallengeModel:buildChallengeList()
	local seasonId = ChallengeUtils.getChallengeSeasonId(pg.me)
	local groups, groupByKey = {}, {}
	local ids = {}

	if seasonId then
		for id, config in pairs(ChallengeData) do
			if config.seasonId == seasonId and config.group and config.tab and BADGE_URLS[config.level] then
				ids[#ids + 1] = id
			end
		end
	end

	table.sort(ids)

	for _, id in ipairs(ids) do
		local config = ChallengeData[id]
		local key = getGroupKey(seasonId, config.tab, config.group)
		local group = groupByKey[key]

		if not group then
			group = {
				tIndex = 1,
				isShowRedDot = false,
				allRewarded = true,
				key = key,
				seasonId = seasonId,
				tab = config.tab,
				groupId = config.group,
				id = id,
				stages = {},
				stageByLevel = {}
			}
			groupByKey[key] = group
			groups[#groups + 1] = group
		end

		if not group.stageByLevel[config.level] then
			local stage = self:buildStage(id, config)

			group.stages[#group.stages + 1] = stage
			group.stageByLevel[stage.level] = stage
			group.allRewarded = group.allRewarded and stage.hasGet
			group.isShowRedDot = group.isShowRedDot or stage.isClaimable
		end
	end

	for _, group in ipairs(groups) do
		table.sort(group.stages, function(a, b)
			return a.level < b.level
		end)

		local lowestUnfinished

		for _, stage in ipairs(group.stages) do
			if stage.isClaimable and not group.defaultLevel then
				group.defaultLevel = stage.level
			end

			if not stage.hasGet then
				lowestUnfinished = lowestUnfinished or stage.level
			end
		end

		group.defaultLevel = group.defaultLevel or lowestUnfinished or group.stages[#group.stages].level
		group.redDotTmpKey = group.isShowRedDot and RedDotConst.RedDotStyle.REWARD or RedDotConst.RedDotStyle.NONE
	end

	table.sort(groups, function(a, b)
		if a.tab ~= b.tab then
			return a.tab < b.tab
		end

		if a.allRewarded ~= b.allRewarded then
			return not a.allRewarded
		end

		if a.groupId ~= b.groupId then
			return a.groupId < b.groupId
		end

		return a.id < b.id
	end)

	local list, lastTab = {}

	for _, group in ipairs(groups) do
		if group.tab ~= lastTab then
			lastTab = group.tab

			local tabConfig = ChallengeTabData[lastTab]

			list[#list + 1] = {
				tIndex = 0,
				isShowRedDot = false,
				tab = lastTab,
				title = localize(tabConfig and tabConfig.tabName),
				redDotTmpKey = RedDotConst.RedDotStyle.NONE
			}
		end

		list[#list + 1] = group
	end

	self.groups = groups

	return list
end

function GrabEggsSeasonChallengeModel:getStageForDisplay(group, selectedLevel)
	if not group then
		return nil
	end

	return group.stageByLevel[selectedLevel or group.defaultLevel] or group.stageByLevel[group.defaultLevel]
end

function GrabEggsSeasonChallengeModel:getAdjacentStage(group, level, direction)
	if not group or direction ~= -1 and direction ~= 1 then
		return nil
	end

	for index, stage in ipairs(group.stages) do
		if stage.level == level then
			return group.stages[index + direction]
		end
	end

	return nil
end

function GrabEggsSeasonChallengeModel:getClaimableStages()
	self:buildChallengeList()

	local result = {}

	for _, group in ipairs(self.groups) do
		for _, stage in ipairs(group.stages) do
			if stage.isClaimable then
				result[#result + 1] = stage
			end
		end
	end

	return result
end

return GrabEggsSeasonChallengeModel
