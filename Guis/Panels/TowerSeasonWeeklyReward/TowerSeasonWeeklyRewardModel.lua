-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TowerSeasonWeeklyReward\\TowerSeasonWeeklyRewardModel.lua

local logger = require("Core.Log.LoggerManager").getLogger("TowerSeasonWeeklyRewardModel")
local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local RogueDifficultyData = require("Data.rogue_difficulty_data")
local RogueUtils = require("Utils.RogueUtils")
local TowerSeasonWeeklyRewardModel = Class.LightClass("TowerSeasonWeeklyRewardModel", UIModel)

function TowerSeasonWeeklyRewardModel:getLevelData()
	local levelData = {}
	local levelTypeList = {}
	local levelIds = RogueUtils.getRogueLevelIdsBySeason()
	local levelInfo

	for _, levelId in ipairs(levelIds) do
		levelInfo = RogueDifficultyData[levelId]

		if levelInfo then
			local key = levelInfo.elementType

			if levelTypeList[key] == nil then
				levelTypeList[key] = #levelData + 1

				table.insert(levelData, {
					elementType = key,
					levels = {},
					selected = #levelData == 0
				})
			end

			local tabData = levelData[levelTypeList[key]]

			table.insert(tabData.levels, {
				levelId = levelId,
				info = levelInfo
			})
		end
	end

	return levelData
end

function TowerSeasonWeeklyRewardModel:canGetReward(levelId)
	return RogueUtils.isSeasonWeeklyRewardUnlocked(levelId)
end

function TowerSeasonWeeklyRewardModel:isRewardReceived(levelId)
	return RogueUtils.isSeasonWeeklyRewardReceived(levelId)
end

return TowerSeasonWeeklyRewardModel
