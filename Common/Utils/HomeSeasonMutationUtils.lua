-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\HomeSeasonMutationUtils.lua

local HomeSeasonMutationHarvestIndexData = require("Data.home_season_mutation_harvest_index_data")
local HomeSeasonMutationUtils = {}

HomeSeasonMutationUtils.EMPTY_ADDITION_RATIOS = {}

function HomeSeasonMutationUtils.getFormulaSeasonId(formulaId)
	return HomeSeasonMutationHarvestIndexData.formulaSeasonIds[formulaId]
end

function HomeSeasonMutationUtils.getOutputSeasonId(itemId)
	return HomeSeasonMutationHarvestIndexData.outputSeasonIds[itemId]
end

function HomeSeasonMutationUtils.getHarvestLevel(seasonId, harvestCount)
	local levels = HomeSeasonMutationHarvestIndexData.countLevelsBySeason[seasonId]

	if levels then
		for i = #levels, 1, -1 do
			local levelInfo = levels[i]

			if harvestCount >= levelInfo.itemNum then
				return levelInfo.levelId
			end
		end
	end

	return 0
end

function HomeSeasonMutationUtils.getSeasonAdditionRatios(seasonId, harvestCount)
	local levelId = HomeSeasonMutationUtils.getHarvestLevel(seasonId, harvestCount)

	return HomeSeasonMutationHarvestIndexData.additionRatiosByLevel[levelId] or HomeSeasonMutationUtils.EMPTY_ADDITION_RATIOS
end

function HomeSeasonMutationUtils.getFormulaAdditionRatios(formulaId, harvestCountBySeason)
	local seasonId = HomeSeasonMutationUtils.getFormulaSeasonId(formulaId)

	if seasonId then
		return HomeSeasonMutationUtils.getSeasonAdditionRatios(seasonId, harvestCountBySeason[seasonId] or 0)
	end
end

function HomeSeasonMutationUtils.createFormulaAdditionRatios(harvestCountBySeason)
	local ratiosBySeason = {}
	local ratiosByFormula = {}

	for formulaId, seasonId in pairs(HomeSeasonMutationHarvestIndexData.formulaSeasonIds) do
		if not ratiosBySeason[seasonId] then
			ratiosBySeason[seasonId] = HomeSeasonMutationUtils.getSeasonAdditionRatios(seasonId, harvestCountBySeason[seasonId] or 0)
		end

		ratiosByFormula[formulaId] = ratiosBySeason[seasonId]
	end

	return ratiosByFormula
end

return HomeSeasonMutationUtils
