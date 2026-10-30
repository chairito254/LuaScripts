-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Utils\\GrabEggsSeasonChallengeUtils.lua

local RobEggConst = require("Common.Const.RobEggConst")
local ChallengeData = require("Data.rob_egg_season_challenge_data")
local GrabEggsSeasonChallengeUtils = {}
local RewardState = RobEggConst.SEASON_CHALLENGE_REWARD_STATE

function GrabEggsSeasonChallengeUtils.getChallengeSeasonId(player)
	local seasonId = player and player.seasonId

	return seasonId and seasonId > 0 and seasonId or nil
end

function GrabEggsSeasonChallengeUtils.getRewardState(player, id, seasonId)
	local seasons = player and player.seasonChallenge
	local season = seasons and seasons[seasonId]
	local states = season and season.rewardState
	local state = states and states[id]

	if state == RewardState.CanGetReward or state == RewardState.Rewarded then
		return state
	end

	return RewardState.NotFinished
end

function GrabEggsSeasonChallengeUtils.hasClaimableReward(player)
	local seasonId = GrabEggsSeasonChallengeUtils.getChallengeSeasonId(player)

	if not seasonId then
		return false
	end

	for id, config in pairs(ChallengeData) do
		if config.seasonId == seasonId and GrabEggsSeasonChallengeUtils.getRewardState(player, id, seasonId) == RewardState.CanGetReward then
			return true
		end
	end

	return false
end

return GrabEggsSeasonChallengeUtils
