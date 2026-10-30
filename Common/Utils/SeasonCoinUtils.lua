-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\SeasonCoinUtils.lua

local SeasonStageData = require("Data.season_stage_data")
local SysConfigData = require("Data.sys_config_data")
local ItemData = require("Data.item_data")
local SeasonCoinUtils = {}

SeasonCoinUtils.MAX_EXACT_COUNT = 9007199254740991

local function positiveInteger(value)
	return type(value) == "number" and value > 0 and value <= SeasonCoinUtils.MAX_EXACT_COUNT and value == math.floor(value)
end

function SeasonCoinUtils.getExchangeConfig()
	local exchange = SysConfigData.SEASON_COIN_AUTO_EXCHANGE

	if type(exchange) ~= "table" or not positiveInteger(exchange[1]) or not positiveInteger(exchange[2]) or not ItemData[exchange[1]] then
		return nil, "invalid SEASON_COIN_AUTO_EXCHANGE"
	end

	local coins = {}

	for seasonId, stages in pairs(SeasonStageData) do
		for stageId, stage in pairs(stages) do
			local coinId = stage.seasonCoinId
			local coinData = ItemData[coinId]

			if not positiveInteger(coinId) or not coinData or coinData.commonMoney ~= 1 or coins[coinId] then
				return nil, "invalid or duplicate season coin, season=" .. tostring(seasonId) .. ", stage=" .. tostring(stageId)
			end

			coins[coinId] = {
				seasonId = seasonId,
				stageId = stageId
			}
		end
	end

	if coins[exchange[1]] then
		return nil, "exchange target must not be a season coin"
	end

	return {
		targetItemId = exchange[1],
		ratio = exchange[2],
		coins = coins
	}
end

return SeasonCoinUtils
