-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\SeasonUtils.lua

local SeasonUtils = {}
local Utils = require("Common.Utils.Utils")
local ItemConst = require("Common.Const.ItemConst")
local sys_config_data = require("Data.sys_config_data")

function SeasonUtils.getCurrentSeasonId()
	local seasonStageInfo = Utils.getCurrentSeasonStage()

	if Utils.isSeasonStageInfoActive(seasonStageInfo) then
		return seasonStageInfo.seasonId, seasonStageInfo.stageId
	end

	return 0, 0
end

function SeasonUtils.getCurrentSeasonCoinId()
	local seasonStageInfo = Utils.getCurrentSeasonStage()

	if Utils.isSeasonStageInfoActive(seasonStageInfo) then
		return seasonStageInfo.seasonCoinId or 0, seasonStageInfo.seasonId, seasonStageInfo.stageId
	end

	return 0, 0, 0
end

function SeasonUtils.convertUniversalCoin(itemId)
	local commSeasonCoinId = sys_config_data.COMMON_SEASON_COIN

	if not commSeasonCoinId then
		return itemId, 0, 0
	end

	if itemId ~= ItemConst.ITEM_SPECIAL_MONEY_BADGE then
		return itemId, 0, 0
	end

	local currentSeasonCoinId, seasonId, stageId = SeasonUtils.getCurrentSeasonCoinId()

	if currentSeasonCoinId and currentSeasonCoinId > 0 then
		return currentSeasonCoinId, seasonId, stageId
	end

	return 0, 0, 0
end

return SeasonUtils
