-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\DungeonRewardDisplayUtils.lua

local GameplayTargetData = require("Data.gameplay_target_data")
local ItemData = require("Data.item_data")
local LevelData = require("Data.level_data")
local LevelRewardDungeonRevertData = require("Data.level_reward_dungeon_revert_data")
local LevelRewardLinkedData = require("Data.level_reward_linked_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ChestData = require("Data.chest_data")
local SceneUtils = require("Common.Utils.SceneUtils")
local DungeonRewardDisplayUtils = {}
local DEFAULT_REWARD_DISPLAY_NAME = "TREASURE_REWARD_TOTAL"

function DungeonRewardDisplayUtils.getRewardId(reward)
	return reward.id or reward.petId or 0
end

function DungeonRewardDisplayUtils.getRewardQuality(reward)
	local itemData = ItemData[DungeonRewardDisplayUtils.getRewardId(reward)]

	return itemData and itemData.quality or 0
end

function DungeonRewardDisplayUtils.sortRewards(rewards)
	table.sort(rewards, function(a, b)
		local aQuality = DungeonRewardDisplayUtils.getRewardQuality(a)
		local bQuality = DungeonRewardDisplayUtils.getRewardQuality(b)

		if aQuality ~= bQuality then
			return bQuality < aQuality
		end

		return DungeonRewardDisplayUtils.getRewardId(a) < DungeonRewardDisplayUtils.getRewardId(b)
	end)
end

function DungeonRewardDisplayUtils.getDisappearType(rewardData)
	return rewardData and (rewardData.rewardDisplayDIsappear or rewardData.rewardDisplayDisappear)
end

function DungeonRewardDisplayUtils.getTargetData(rewardData)
	return rewardData and GameplayTargetData[rewardData.cratesInfoFromTarget]
end

function DungeonRewardDisplayUtils.getDungeonId(rewardData)
	local targetData = DungeonRewardDisplayUtils.getTargetData(rewardData)

	return targetData and targetData.addTypeParam and targetData.addTypeParam[1]
end

function DungeonRewardDisplayUtils.getBySpawnerId(spawnerId)
	return LevelRewardLinkedData[spawnerId]
end

function DungeonRewardDisplayUtils.getByDungeonId(dungeonId)
	local spawnerId = LevelRewardDungeonRevertData[dungeonId]

	return spawnerId and LevelRewardLinkedData[spawnerId] or nil
end

function DungeonRewardDisplayUtils.getDungeonData(rewardData)
	local dungeonId = DungeonRewardDisplayUtils.getDungeonId(rewardData)

	return dungeonId and LevelData[dungeonId] or nil
end

function DungeonRewardDisplayUtils.getFirstPassRewardItems(rewardData, hasGet)
	local dungeonData = DungeonRewardDisplayUtils.getDungeonData(rewardData)

	if dungeonData == nil then
		return {}
	end

	if dungeonData.rewardId then
		return LuaUIUtils.getRewardItemByDropId(dungeonData.rewardId, hasGet)
	end
end

function DungeonRewardDisplayUtils.isChestRewardMode(rewardData)
	return DungeonRewardDisplayUtils.getDisappearType(rewardData) == 1
end

function DungeonRewardDisplayUtils.hasRewardDisplay(rewardData)
	return rewardData ~= nil and (DungeonRewardDisplayUtils.isChestRewardMode(rewardData) or rewardData.rewardDisplay ~= nil)
end

function DungeonRewardDisplayUtils.mergeRewardDisplayItem(rewards, rewardsByType, reward, multiple)
	local rewardId = DungeonRewardDisplayUtils.getRewardId(reward)

	if rewardId == 0 then
		return
	end

	local rewardType = reward.type or 0
	local rewardsById = rewardsByType[rewardType]

	if rewardsById == nil then
		rewardsById = {}
		rewardsByType[rewardType] = rewardsById
	end

	local rewardNum = (reward.num or 0) * multiple
	local mergedReward = rewardsById[rewardId]

	if mergedReward then
		mergedReward.num = (mergedReward.num or 0) + rewardNum
		mergedReward.rate = reward.rate or mergedReward.rate
		mergedReward.displayRewardType = reward.displayRewardType or mergedReward.displayRewardType
	else
		reward.num = rewardNum
		rewardsById[rewardId] = reward
		rewards[#rewards + 1] = reward
	end
end

function DungeonRewardDisplayUtils.getRewardDisplayItems(rewardData)
	local rewards = {}
	local rewardsByType = {}

	for _, rewardConfig in ipairs(rewardData.rewardDisplay or {}) do
		local dropId = rewardConfig[1]
		local multiple = rewardConfig[2] or 1

		for _, reward in ipairs(LuaUIUtils.getRewardItemByDropId(dropId)) do
			DungeonRewardDisplayUtils.mergeRewardDisplayItem(rewards, rewardsByType, reward, multiple)
		end
	end

	return rewards
end

function DungeonRewardDisplayUtils.getChestRewardItems(rewardData)
	local targetData = DungeonRewardDisplayUtils.getTargetData(rewardData)
	local chestList = targetData and targetData.chest
	local dungeonId = DungeonRewardDisplayUtils.getDungeonId(rewardData)

	if chestList == nil or #chestList == 0 or dungeonId == nil then
		return {}
	end

	local sceneEntityData = SceneUtils.getSceneEntityData(dungeonId)
	local rewards = {}
	local rewardsByType = {}

	for _, staticId in ipairs(chestList) do
		local entityData = sceneEntityData and sceneEntityData[staticId]
		local chestData = entityData and ChestData[entityData.idInType]
		local dropId = chestData and chestData.reward

		for _, reward in ipairs(dropId and LuaUIUtils.getRewardItemByDropId(dropId) or {}) do
			local rewardId = DungeonRewardDisplayUtils.getRewardId(reward)

			if rewardId ~= 0 then
				local rewardType = reward.type or 0
				local rewardsById = rewardsByType[rewardType]

				if rewardsById == nil then
					rewardsById = {}
					rewardsByType[rewardType] = rewardsById
				end

				local mergedReward = rewardsById[rewardId]

				if mergedReward then
					mergedReward.num = (mergedReward.num or 0) + (reward.num or 0)
					mergedReward.rate = reward.rate or mergedReward.rate
					mergedReward.displayRewardType = reward.displayRewardType or mergedReward.displayRewardType
				else
					rewardsById[rewardId] = reward
					rewards[#rewards + 1] = reward
				end
			end
		end
	end

	return rewards
end

function DungeonRewardDisplayUtils.getRewardItems(rewardData)
	if rewardData == nil then
		return {}
	end

	local rewards

	if DungeonRewardDisplayUtils.isChestRewardMode(rewardData) then
		rewards = DungeonRewardDisplayUtils.getChestRewardItems(rewardData)
	elseif not DungeonRewardDisplayUtils.isChestRewardMode(rewardData) and rewardData.rewardDisplay ~= nil then
		rewards = DungeonRewardDisplayUtils.getRewardDisplayItems(rewardData)
	end

	DungeonRewardDisplayUtils.sortRewards(rewards)

	return rewards
end

function DungeonRewardDisplayUtils.getRewardTitle(rewardData)
	local titleKey = rewardData and rewardData.rewardDisplayName

	if titleKey == nil or titleKey == "" then
		titleKey = DEFAULT_REWARD_DISPLAY_NAME
	end

	return pg.getGameString(titleKey)
end

function DungeonRewardDisplayUtils.shouldHide(rewardData)
	if rewardData == nil then
		return false
	end

	if not DungeonRewardDisplayUtils.isChestRewardMode(rewardData) then
		return false
	end

	local targetData = DungeonRewardDisplayUtils.getTargetData(rewardData)
	local chestList = targetData and targetData.chest

	if chestList == nil or #chestList == 0 or pg.me == nil or pg.me.interactRecord == nil then
		return false
	end

	for _, chestId in ipairs(chestList) do
		if not pg.me.interactRecord[chestId] then
			return false
		end
	end

	return true
end

return DungeonRewardDisplayUtils
