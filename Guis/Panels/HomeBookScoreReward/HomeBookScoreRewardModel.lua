-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeBookScoreReward\\HomeBookScoreRewardModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local HomeBookDataUtils = require("Utils.HomeBookDataUtils")
local HomeBookRedDotUtils = require("Utils.HomeBookRedDotUtils")
local HomeBookScoreRewardModel = Class.LightClass("HomeBookScoreRewardModel", UIModel)

function HomeBookScoreRewardModel:getCurrentGradeConfig()
	if not pg.me then
		return nil
	end

	return HomeBookDataUtils.getCurGradeConfig(pg.me:getHomeHandbookScore())
end

function HomeBookScoreRewardModel:getRewards()
	local result = {}

	if not pg.me then
		return result
	end

	local score = pg.me:getHomeHandbookScore()
	local receivedGrade = pg.me:getHomeHandbookLastReceivedGrade()
	local rewards = HomeBookDataUtils.getScoreRewards()

	for _, reward in ipairs(rewards) do
		local grade = reward.config.grade or 0
		local state = 0

		if grade <= receivedGrade then
			state = 1
		elseif grade <= score then
			state = 2
		end

		result[#result + 1] = {
			id = reward.id,
			grade = grade,
			rewardId = reward.config.reward,
			state = state,
			isClaimable = state == 2,
			redDotPath = HomeBookRedDotUtils.getScoreRewardPath(reward.id)
		}
	end

	return result
end

function HomeBookScoreRewardModel:getRewardFocusIndex(rewards)
	rewards = rewards or {}

	local count = #rewards

	if count == 0 then
		return 0, false
	end

	local firstUnclaimedIndex

	for index, reward in ipairs(rewards) do
		if reward.isClaimable then
			return index - 1, true
		end

		if reward.state ~= 1 then
			firstUnclaimedIndex = firstUnclaimedIndex or index - 1
		end
	end

	if firstUnclaimedIndex then
		return firstUnclaimedIndex, false
	end

	return count - 1, false
end

return HomeBookScoreRewardModel
