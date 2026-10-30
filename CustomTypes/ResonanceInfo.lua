-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\ResonanceInfo.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local ResonanceData = require("Data.pet_resonance_data")
local PetFamilyData = require("Data.pet_family_data")
local ItemUtils = require("Common.Utils.ItemUtils")
local Utils = require("Common.Utils.Utils")
local ObjHelper = require("Common.ObjHelper")
local Const = require("Common.Const.Const")
local ResonanceInfo = class.LiteClass("ResonanceInfo", CustomDict)

if UNITY_EDITOR then
	local types = {
		ObjHelper.TYPE_PET_INFO
	}

	function ResonanceInfo:getObj()
		local obj = Utils.isPetInfoType(self._parent) and self._parent or self:getRootOwner()

		assert(ObjHelper.matchOneOf(obj, types))

		return obj
	end
else
	function ResonanceInfo:getObj()
		local obj = Utils.isPetInfoType(self._parent) and self._parent or self:getRootOwner()

		return obj
	end
end

function ResonanceInfo:getUpgradeResonanceData()
	local stage = self.resonanceStage
	local level = self.resonanceLevel
	local stageData = ResonanceData[stage]

	if stageData == nil then
		return
	end

	if stageData[level + 1] == nil then
		stage = stage + 1
		level = 0

		if ResonanceData[stage] == nil or ResonanceData[stage][level] == nil then
			return
		end

		stageData = ResonanceData[stage]
	else
		level = level + 1
	end

	return stageData[level], stage, level
end

function ResonanceInfo:canUpgradeResonance(petInfo, data, checkRet, player, excludeItemList)
	checkRet = checkRet or {}

	if data == nil then
		checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.PARAMS_ERROR

		return false
	end

	if data.needLv and data.needLv > petInfo.level then
		checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.NOT_ENOUGH_LEVEL
		checkRet.params = {
			needLv = data.needLv,
			curLv = petInfo.level
		}

		return false
	end

	if not self:isHaveJewelry(data.needApparence, petInfo) then
		checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.NOT_ENOUGH_ORIENTATION
		checkRet.params = {
			jewelryId = self:getFamilyEnhanceJewelryId(petInfo)
		}

		return false
	end

	player = player or petInfo:getOwnerPlayer()

	if data.condition == 1 and player then
		local familyData = PetFamilyData[petInfo:getConfigData().ethnicGroup or 0]

		if familyData and familyData.enhanceCondition ~= nil and not player.triggerMap:isCompleteOrMeetCondition(familyData.enhanceCondition) then
			checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.NOT_ENOUGH_FAMILY_CONDITION
			checkRet.params = {
				enhanceConditionId = familyData.enhanceCondition
			}

			return false
		end
	end

	local nextData, toStage, toLevel = self:getUpgradeResonanceData()

	if not nextData then
		checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.PARAMS_ERROR

		return false
	end

	local isExtraItemEnough, deficitExtraItemId = self:isHaveExtraItem(nextData.extraItems, petInfo, player)

	if not isExtraItemEnough then
		checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.NOT_ENOUGH_ITEM
		checkRet.params = {
			itemId = deficitExtraItemId
		}

		return false
	end

	local buildSuccess, itemDict, deficitItemId = self:buildResonanceItemDict(petInfo, toStage, toLevel, player, excludeItemList)

	if not buildSuccess then
		checkRet.code = Const.UPGRADE_CHECK_FAIL_CODE.NOT_ENOUGH_ITEM
		checkRet.params = {
			itemId = deficitItemId
		}

		return false
	end

	return true, itemDict
end

function ResonanceInfo:isHaveJewelry(needApparence, petInfo)
	if needApparence ~= 1 then
		return true
	end

	local familyData = PetFamilyData[petInfo:getConfigData().ethnicGroup or 0]

	if not familyData then
		return true
	end

	local jewelryId = familyData.enhanceClothes

	if not jewelryId then
		return true
	end

	local player = petInfo:getOwnerPlayer()

	if player == nil then
		return false
	end

	local petJewelrys = player.petJewelryInfos[petInfo.id]

	if petJewelrys == nil then
		return false
	end

	for _, jewelry in pairs(petJewelrys) do
		if jewelry.configId == jewelryId then
			return true
		end
	end

	return false
end

function ResonanceInfo:getFamilyEnhanceJewelryId(petInfo)
	if not petInfo then
		return
	end

	local familyData = PetFamilyData[petInfo:getConfigData().ethnicGroup or 0]

	if not familyData then
		return
	end

	local jewelryId = familyData.enhanceClothes

	return jewelryId
end

function ResonanceInfo:isHaveFamilyItem(itemNum, petInfo)
	local isSeasonalPet = Utils.isSeasonalPet(petInfo)
	local reqList = Utils.getPetResonanceFamilyItemDIct(petInfo:getConfigData().ethnicGroup or 0, itemNum, isSeasonalPet)

	if #reqList == 0 then
		return true
	end

	local isEnough, _, deficitMainId = Utils.allocPetResonanceFamilyConsume(reqList, petInfo:getOwnerPlayer())

	return isEnough, deficitMainId
end

function ResonanceInfo:isHaveExtraItem(extraItems, petInfo, player)
	player = player or petInfo:getOwnerPlayer()

	if player == nil then
		return false
	end

	for _, item in pairs(extraItems or EMPTY_TABLE) do
		local sum = ItemUtils.getItemCountById(player, item[1])

		if sum < item[2] then
			return false, item[1]
		end
	end

	return true
end

function ResonanceInfo:buildResonanceItemDict(petInfo, toStage, toLevel, player, excludeItemList)
	player = player or petInfo:getOwnerPlayer()

	if player == nil then
		return false, nil, nil
	end

	local fromStage = self.resonanceStage
	local fromLevel = self.resonanceLevel
	local configData = petInfo:getConfigData()
	local ethnicGroup = configData.ethnicGroup or 0
	local isSeasonalPet = Utils.isSeasonalPet(petInfo)
	local familyReqList, familyReqIndex = {}, {}
	local elementNeed = 0
	local itemDict = {}

	Utils.forEachPetResonanceCostLevel(toStage, toLevel, fromStage, fromLevel, function(levelData)
		if levelData.itemNum then
			for _, req in ipairs(Utils.getPetResonanceFamilyItemDIct(ethnicGroup, levelData.itemNum, isSeasonalPet)) do
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
			local itemId, itemNum = extra[1], extra[2]

			if itemId and itemNum then
				itemDict[itemId] = (itemDict[itemId] or 0) + itemNum
			end
		end
	end)

	local familyEnough, familyDict, deficitFamilyId = Utils.allocPetResonanceFamilyConsume(familyReqList, player, itemDict, excludeItemList)

	if not familyEnough then
		return false, nil, deficitFamilyId
	end

	for itemId, count in pairs(familyDict) do
		if count > 0 then
			itemDict[itemId] = (itemDict[itemId] or 0) + count
		end
	end

	if elementNeed > 0 then
		local elementItemId, backupItemId, elementName = Utils.getPetResonanceElementItemId(configData.mainElementType)

		if not elementItemId then
			if player then
				player.logger:error("ResonanceInfo:buildResonanceItemDict no elementItemId, mainElementType=%s, elementName=%s, petId=%s, uid=%s", configData.mainElementType, elementName, petInfo.id, player.uid)
			end

			return false, nil, nil
		end

		local function getFreeCount(itemId)
			return math.max(ItemUtils.getItemCountById(player, itemId) - (itemDict[itemId] or 0), 0)
		end

		local useMain = math.min(getFreeCount(elementItemId), elementNeed)
		local lack = elementNeed - useMain

		if lack > 0 then
			if not backupItemId or lack > getFreeCount(backupItemId) then
				return false, nil, elementItemId
			end

			itemDict[backupItemId] = (itemDict[backupItemId] or 0) + lack
		end

		if useMain > 0 then
			itemDict[elementItemId] = (itemDict[elementItemId] or 0) + useMain
		end
	end

	return true, itemDict
end

return ResonanceInfo
