-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetResonanceUtils.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local PetConfigData = require("Data.pet_config_data")
local Utils = require("Common.Utils.Utils")
local ResonanceData = require("Data.pet_resonance_data")
local PetFamilyData = require("Data.pet_family_data")
local ItemUtils = require("Common.Utils.ItemUtils")

return function(PetManagementUtils)
	function PetManagementUtils.getStarItemUrl(stage, isTag)
		return LuaUIUtils.getStarItemUrl(stage, isTag)
	end

	function PetManagementUtils.getPetNextResonanceCfg(petId, stage, level)
		local stageData = ResonanceData[stage]

		if stageData == nil then
			return
		end

		local maxStage, maxLv = PetManagementUtils.getResonanceMaxStageLv()

		if stageData[level + 1] == nil then
			stage = stage + 1
			level = 0

			if ResonanceData[stage] == nil or ResonanceData[stage][level] == nil then
				return ResonanceData[maxStage][maxLv], maxStage, maxLv
			end

			stageData = ResonanceData[stage]
		else
			level = level + 1
		end

		return stageData[level] or ResonanceData[maxStage][maxLv], stage or maxStage, level or maxLv
	end

	function PetManagementUtils.getPetPrevResonanceCfg(petId, stage, level)
		local prevStage = 0
		local prevLv = 0

		for stageId, stageLvsCfg in ipairs(ResonanceData or EMPTY_TABLE) do
			local stageLvsIds = table.keys(stageLvsCfg or {})

			table.sort(stageLvsIds)

			for _, lvId in pairs(stageLvsIds or EMPTY_TABLE) do
				if stageId == stage and lvId == level then
					return prevStage, prevLv
				end

				prevLv = lvId
				prevStage = stageId
			end
		end

		return prevStage, prevLv
	end

	function PetManagementUtils.getPetResonanceCfg(stage, level)
		local stageData = ResonanceData[stage]

		if stageData == nil then
			return
		end

		return stageData[level]
	end

	function PetManagementUtils.getPetMaxSLvResonanceCfg()
		local maxStage, maxLv = PetManagementUtils.getResonanceMaxStageLv()

		return ResonanceData[maxStage][maxLv]
	end

	function PetManagementUtils.isMaxedResonance(stage, level)
		if stage == PetManagementUtils.getResonanceMaxStageLv(stage) and PetManagementUtils.getResonanceStageMaxLv(stage, level) == level then
			return true
		end

		return false
	end

	function PetManagementUtils.getResonanceMaxStageLv()
		local maxStage = 0

		for k, v in pairs(ResonanceData or EMPTY_TABLE) do
			maxStage = math.max(maxStage, k)
		end

		local maxLv = 0

		for j, m in pairs(ResonanceData[maxStage] or EMPTY_TABLE) do
			maxLv = math.max(maxLv, j)
		end

		return maxStage, maxLv
	end

	function PetManagementUtils.getResonanceStageMaxLv(stage)
		local maxLv = 0
		local maxStageCfg = ResonanceData and ResonanceData[stage] or {}

		for k, v in pairs(maxStageCfg) do
			maxLv = math.max(maxLv, k)
		end

		return maxLv
	end

	function PetManagementUtils.getPetResonanceState(petId)
		local curResonanceInfo = PetManagementUtils.getPetStarUpInfo(petId)

		if not curResonanceInfo then
			return PetManagementDataHelper.RESONANCE_STATE.NORMAL
		end

		local stage = curResonanceInfo.resonanceStage or 0
		local level = curResonanceInfo.resonanceLevel or 0

		if stage == 0 and level == 0 then
			return PetManagementDataHelper.RESONANCE_STATE.NORMAL
		end

		if PetManagementUtils.isMaxedResonance(stage, level) then
			return PetManagementDataHelper.RESONANCE_STATE.MAXED
		end

		local checkMaxStage = PetManagementUtils.getResonanceMaxStageLv()
		local checkMaxLv = PetManagementUtils.getResonanceStageMaxLv(stage)

		if checkMaxLv == level then
			if stage + 1 == checkMaxStage then
				return PetManagementDataHelper.RESONANCE_STATE.WAIT_MAX_UP
			else
				return PetManagementDataHelper.RESONANCE_STATE.WAIT_MIN_UP
			end
		end

		return PetManagementDataHelper.RESONANCE_STATE.NORMAL
	end

	function PetManagementUtils.getPetNextResonanceSLvCosts(petId, curStage, curLv)
		if not petId then
			return
		end

		local resonanceInfo = PetManagementUtils.getPetStarUpInfo(petId)

		if not resonanceInfo then
			return
		end

		local nextResonanceCfg, nextStage, nextLevel = PetManagementUtils.getPetNextResonanceCfg(petId, curStage, curLv)

		if not nextResonanceCfg or not nextStage or not nextLevel then
			return
		end

		local petInfo = pg.me and pg.me:getPetInfo(petId)
		local petConfig = petInfo and petInfo:getConfigData()
		local ethnicGroup = petConfig and petConfig.ethnicGroup or 0
		local isSeasonalPet = Utils.isSeasonalPet(petInfo)
		local familyData = PetFamilyData[ethnicGroup]
		local familyNumDict = {}

		for _, req in ipairs(Utils.getPetResonanceFamilyItemDIct(ethnicGroup, nextResonanceCfg.itemNum, isSeasonalPet)) do
			familyNumDict[req[1]] = (familyNumDict[req[1]] or 0) + req[3]
		end

		local familyItems = {}

		for itemId, num in pairs(familyNumDict) do
			table.insert(familyItems, {
				itemId,
				num,
				ItemUtils.getItemCountById(pg.me, itemId)
			})
		end

		local extraItemsCfg = nextResonanceCfg.extraItems or {}
		local extraItems = {}

		for i, v in ipairs(extraItemsCfg) do
			if v then
				local itemHasNum = ItemUtils.getItemCountById(pg.me, v[1] or 0)

				table.insert(extraItems, {
					v[1] or 0,
					v[2] or 0,
					itemHasNum
				})
			end
		end

		local apparencdItemId = familyData and familyData.enhanceClothes or 0
		local apparencdItem

		if nextResonanceCfg.needApparence then
			apparencdItem = {
				apparencdItemId,
				1
			}
		end

		local costList = {
			familyItem = familyItems,
			extraItems = extraItems,
			apparencdItem = apparencdItem
		}

		costList.allItems = {}

		for _, v in ipairs(familyItems) do
			if v[2] > 0 then
				table.insert(costList.allItems, v)
			end
		end

		if #costList.extraItems > 0 then
			for i, v in ipairs(costList.extraItems) do
				if v and v[2] > 0 then
					table.insert(costList.allItems, v)
				end
			end
		end

		local elementItemNum = nextResonanceCfg.elementItemNum or 0

		if elementItemNum > 0 then
			local mainElementName = petConfig and LuaUIUtils.getElementName(petConfig.mainElementType)
			local elementItemMap = PetConfigData.petElementItemId
			local elementItemId = mainElementName and elementItemMap and elementItemMap[mainElementName]

			if elementItemId and elementItemId > 0 then
				local totalItemNum = elementItemNum
				local itemHasNum
				local insertIndex = #costList.allItems + 1

				for i = #costList.allItems, 1, -1 do
					local itemInfo = costList.allItems[i]

					if itemInfo and itemInfo[1] == elementItemId then
						totalItemNum = totalItemNum + (itemInfo[2] or 0)
						itemHasNum = itemHasNum or itemInfo[3]
						insertIndex = i

						table.remove(costList.allItems, i)
					end
				end

				itemHasNum = itemHasNum or ItemUtils.getItemCountById(pg.me, elementItemId)

				table.insert(costList.allItems, insertIndex, {
					elementItemId,
					totalItemNum,
					itemHasNum
				})
			end
		end

		costList.conditionDescKey = nextResonanceCfg.conditionDesc or ""

		return costList
	end

	function PetManagementUtils.getStarUpSLvProgress(checkStage, checkLv)
		if not checkStage or not checkLv then
			return 0
		end

		local checkStageCfg = ResonanceData and ResonanceData[checkStage] or {}

		if not checkStageCfg then
			return 0
		end

		local maxLv = #checkStageCfg

		if maxLv <= checkLv then
			return 1
		end

		if checkLv <= 0 then
			return 0
		end

		return math.clamp(checkLv / (maxLv - 1.01), 0, 1)
	end

	function PetManagementUtils.compareStarUpSLv(stageA, lvA, stageB, lvB)
		return stageB * 100 + lvB - (stageA * 100 + lvA)
	end

	function PetManagementUtils.getBreakStageL10nDesc(stage)
		if not stage then
			return false
		end

		local stageCfg = ResonanceData and ResonanceData[stage]

		if not stageCfg then
			return ""
		end

		local STARLIGHT_SIX_STAGE = 7

		if stage == STARLIGHT_SIX_STAGE then
			return pg.getGameString("PET_STARUP_SIX_STAGE")
		end

		local fStr = pg.getGameString("PET_STARUP_BREAK_SUC_TIP")

		fStr = (not fStr or fStr == "PET_STARUP_BREAK_SUC_TIP") and "SucBreakStarUp%s" or fStr

		local breakDesc = string.format(fStr, tostring(stage))

		return breakDesc
	end

	function PetManagementUtils.getPetStarUpInfo(petId, sourcePetInfo)
		local petInfo = PetManagementDataHelper.getPetInfoForDisplay(petId, sourcePetInfo)

		if not petInfo then
			return
		end

		return petInfo.resonanceInfo
	end

	function PetManagementUtils.getPetCurStarSLv(petId)
		local info = PetManagementUtils.getPetStarUpInfo(petId)

		if not info then
			return
		end

		return info.resonanceStage, info.resonanceLevel
	end

	function PetManagementUtils.getStarUpConvertState(petId, excludeItemList)
		local emptyState = {
			hasSeasonalCrystalRow = false,
			hasOtherReplaceRow = false,
			canCover = false,
			rows = {}
		}
		local player = pg.me

		if not player or not player.getPetInfo then
			return emptyState
		end

		local petInfo = player:getPetInfo(petId)

		if not petInfo or not petInfo.resonanceInfo or not petInfo.resonanceInfo.getUpgradeResonanceData then
			return emptyState
		end

		local resonanceInfo = petInfo.resonanceInfo
		local nextData, toStage, toLevel = resonanceInfo:getUpgradeResonanceData()

		if not nextData or not toStage or not toLevel then
			return emptyState
		end

		local configData = petInfo:getConfigData()

		if not configData then
			return emptyState
		end

		local ethnicGroup = configData.ethnicGroup or 0
		local isSeasonal = Utils.isSeasonalPet(petInfo)
		local seasonalMainId = PetConfigData.seasonalPetCommonEssenceId
		local fromStage = resonanceInfo.resonanceStage
		local fromLevel = resonanceInfo.resonanceLevel
		local familyReqList, familyReqIndex = {}, {}
		local elementNeed = 0
		local reserved = {}

		Utils.forEachPetResonanceCostLevel(toStage, toLevel, fromStage, fromLevel, function(levelData)
			if levelData.itemNum then
				local reqList = Utils.getPetResonanceFamilyItemDIct(ethnicGroup, levelData.itemNum, isSeasonal)

				for _, req in ipairs(reqList) do
					local merged = familyReqIndex[req[1]]

					if merged then
						merged[3] = merged[3] + req[3]
					else
						merged = {
							req[1],
							req[2],
							req[3]
						}
						familyReqIndex[req[1]] = merged
						familyReqList[#familyReqList + 1] = merged
					end
				end
			end

			elementNeed = elementNeed + (levelData.elementItemNum or 0)

			for _, extra in ipairs(levelData.extraItems or EMPTY_TABLE) do
				local itemId = extra[1]
				local itemNum = extra[2]

				if itemId and itemNum and itemNum > 0 then
					reserved[itemId] = (reserved[itemId] or 0) + itemNum
				end
			end
		end)

		local rows = {}
		local hasOtherReplaceRow = false
		local hasSeasonalCrystalRow = false
		local seasonalPieces
		local canCover = true

		for _, req in ipairs(familyReqList) do
			local ok, consumeDict = Utils.allocPetResonanceFamilyConsume({
				req
			}, player, reserved, excludeItemList)

			if not ok then
				canCover = false
			end

			consumeDict = consumeDict or {}

			local mainId = req[1]
			local backupId = req[2]
			local num = req[3]
			local mainUsed = consumeDict[mainId] or 0
			local isSeasonalReq = isSeasonal and mainId == seasonalMainId and Utils.isTable(backupId)

			if isSeasonalReq and ok then
				local sources = {}
				local pieces = {}
				local backupTake = 0

				if mainUsed > 0 then
					local mainPiece = {
						mainId,
						mainUsed,
						ItemUtils.getItemCountById(player, mainId)
					}

					mainPiece.isReplace = false
					pieces[#pieces + 1] = mainPiece
				end

				for _, itemId in ipairs(backupId) do
					local take = consumeDict[itemId] or 0
					local own = ItemUtils.getItemCountById(player, itemId)

					if take > 0 then
						backupTake = backupTake + take

						local piece = {
							itemId,
							take,
							own
						}

						piece.isReplace = true
						pieces[#pieces + 1] = piece
					end

					sources[#sources + 1] = {
						id = itemId,
						ownNum = own,
						needNum = take,
						selected = own > 0
					}
				end

				if backupTake > 0 then
					seasonalPieces = pieces
					hasSeasonalCrystalRow = true
					rows[#rows + 1] = {
						isSeasonalCrystal = true,
						selectable = #sources > 1,
						oriItemId = mainId,
						deficit = num - mainUsed,
						sources = sources
					}
				end
			elseif ok then
				local sources = {}

				if Utils.isTable(backupId) then
					for _, itemId in ipairs(backupId) do
						local take = consumeDict[itemId] or 0

						if take > 0 then
							sources[#sources + 1] = {
								selected = true,
								id = itemId,
								ownNum = ItemUtils.getItemCountById(player, itemId),
								needNum = take
							}
						end
					end
				elseif backupId and backupId ~= 0 then
					local take = consumeDict[backupId] or 0

					if take > 0 then
						sources[#sources + 1] = {
							selected = true,
							id = backupId,
							ownNum = ItemUtils.getItemCountById(player, backupId),
							needNum = take
						}
					end
				end

				if #sources > 0 then
					hasOtherReplaceRow = true
					rows[#rows + 1] = {
						isSeasonalCrystal = false,
						selectable = false,
						oriItemId = mainId,
						deficit = num - mainUsed,
						sources = sources
					}
				end
			end

			for itemId, count in pairs(consumeDict) do
				if count > 0 then
					reserved[itemId] = (reserved[itemId] or 0) + count
				end
			end
		end

		if elementNeed > 0 then
			local elementItemId, backupItemId = Utils.getPetResonanceElementItemId(configData.mainElementType)

			local function freeCount(itemId)
				local owned = ItemUtils.getItemCountById(player, itemId)

				return math.max(owned - (reserved[itemId] or 0), 0)
			end

			if not elementItemId then
				canCover = false
			else
				local useMain = math.min(freeCount(elementItemId), elementNeed)
				local lack = elementNeed - useMain

				if lack > 0 then
					local backupFree = 0

					if backupItemId then
						backupFree = freeCount(backupItemId)
					end

					if not backupItemId or backupFree < lack then
						canCover = false
					else
						hasOtherReplaceRow = true
						rows[#rows + 1] = {
							isSeasonalCrystal = false,
							selectable = false,
							oriItemId = elementItemId,
							deficit = lack,
							sources = {
								{
									selected = true,
									id = backupItemId,
									ownNum = ItemUtils.getItemCountById(player, backupItemId),
									needNum = lack
								}
							}
						}
					end
				end
			end
		end

		return {
			canCover = canCover,
			rows = rows,
			hasOtherReplaceRow = hasOtherReplaceRow,
			hasSeasonalCrystalRow = hasSeasonalCrystalRow,
			seasonalMainId = seasonalMainId,
			seasonalPieces = seasonalPieces
		}
	end

	function PetManagementUtils.getPetFinalTargeResonanceStagelvDisplayAttrs2(petId, targetStage, targetLv)
		local resonanceInfo = PetManagementUtils.getPetStarUpInfo(petId)

		if not resonanceInfo then
			return
		end

		targetStage = targetStage or 0
		targetLv = targetLv or 0

		local accumulatedMap = {}

		for stageId, stageLvsCfg in ipairs(ResonanceData or EMPTY_TABLE) do
			if targetStage < stageId then
				break
			end

			local stageLvsIds = table.keys(stageLvsCfg or {})

			table.sort(stageLvsIds)

			for _, lvId in ipairs(stageLvsIds) do
				if stageId == targetStage and targetLv < lvId then
					break
				end

				local lvCfg = stageLvsCfg[lvId]
				local lvProps = lvCfg and lvCfg.props or {}

				for _, propInfo in ipairs(lvProps) do
					local atomPropId = propInfo and propInfo[1]
					local atomPropVal = propInfo and propInfo[2]

					if atomPropId and atomPropVal then
						accumulatedMap[atomPropId] = (accumulatedMap[atomPropId] or 0) + atomPropVal
					end
				end
			end
		end

		local accumulatedGainProps = {}

		for atomPropId, atomPropVal in pairs(accumulatedMap) do
			accumulatedGainProps[#accumulatedGainProps + 1] = {
				atomPropId,
				atomPropVal
			}
		end

		table.sort(accumulatedGainProps, function(a, b)
			return (a[1] or 0) < (b[1] or 0)
		end)

		return PetManagementUtils.m_getPreviewAddedAtomPropInfoStarup(petId, accumulatedGainProps)
	end

	function PetManagementUtils.getPetTargeResonanceStagelvDisplayAttrs2(petId, curStage, curLv, maxLen)
		local resonanceInfo = PetManagementUtils.getPetStarUpInfo(petId)

		if not resonanceInfo then
			return
		end

		local nextResonanceCfg, nextStage, nextLevel = PetManagementUtils.getPetNextResonanceCfg(petId, curStage, curLv)

		if not nextResonanceCfg or not nextStage or not nextLevel then
			return
		end

		local gainProps = nextResonanceCfg.props or {}

		if not gainProps or #gainProps == 0 then
			return
		end

		return PetManagementUtils.m_getPreviewAddedAtomPropInfoStarup(petId, gainProps, maxLen)
	end

	function PetManagementUtils.getPetTargeResonanceStagelvDisplayAttrs(petId, curStage, curLv, maxLen)
		local resonanceInfo = PetManagementUtils.getPetStarUpInfo(petId)

		if not resonanceInfo then
			return
		end

		local nextResonanceCfg, nextStage, nextLevel = PetManagementUtils.getPetNextResonanceCfg(petId, curStage, curLv)

		if not nextResonanceCfg or not nextStage or not nextLevel then
			return
		end

		local gainProps = nextResonanceCfg.props or {}

		if not gainProps or #gainProps == 0 then
			return
		end

		local petInfo = pg.me and pg.me:getPetInfo(petId)

		if not petInfo then
			return
		end

		local nextResonanceAttrsMap = Utils.primaryPropertyUpdate(petInfo, nil, nil, nextStage, nextLevel)

		if not nextResonanceAttrsMap then
			return
		end

		return PetManagementUtils.m_getPreviewAddedAtomPropInfo(petId, nextResonanceAttrsMap, maxLen)
	end
end
