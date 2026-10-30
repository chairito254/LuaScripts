-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\AppearanceItemCardVisibilityOverride.lua

local AppearanceData = require("Data.appearance_data")
local AppearanceSuitData = require("Data.appearance_suit_data")
local AvatarHairSuitData = require("Data.avatar_hair_suit_data")
local AppearanceMakeupPresetData = require("Data.appearance_makeup_preset_data")
local AppearanceJewelryPetData = require("Data.appearance_jewelry_pet_data")
local CommonSwitch = require("Common.CommonSwitch")
local AppearanceItemCardVisibilityOverride = {}
local hiddenSourcesByTargetId = {}
local collectTargetIds

local function collectList(targetIds, list, visiting)
	for _, id in ipairs(list or {}) do
		collectTargetIds(id, targetIds, visiting)
	end
end

function collectTargetIds(id, targetIds, visiting)
	if type(id) ~= "number" or id <= 0 or id ~= math.floor(id) then
		return
	end

	if visiting[id] then
		return
	end

	visiting[id] = true
	targetIds[id] = true

	local suitData = AppearanceSuitData[id]

	if suitData then
		collectList(targetIds, suitData.appearanceList, visiting)
		collectList(targetIds, suitData.jewelryList, visiting)
		collectList(targetIds, suitData.kit, visiting)

		if suitData.hair then
			collectTargetIds(suitData.hair, targetIds, visiting)
		end

		if suitData.makeup then
			collectTargetIds(suitData.makeup, targetIds, visiting)
		end
	end

	local hairSuitData = AvatarHairSuitData[id]

	if hairSuitData then
		collectList(targetIds, hairSuitData.appearanceList, visiting)
	end

	local makeupSuitData = AppearanceMakeupPresetData[id]

	if makeupSuitData then
		collectList(targetIds, makeupSuitData.makeupList, visiting)
	end
end

local function isKnownAppearanceId(id)
	return AppearanceData[id] ~= nil or AppearanceSuitData[id] ~= nil or AvatarHairSuitData[id] ~= nil or AppearanceMakeupPresetData[id] ~= nil or AppearanceJewelryPetData[id] ~= nil
end

local function applySourceHidden(id, hidden)
	local targetIds = {}

	collectTargetIds(id, targetIds, {})

	local targetCount = 0

	for targetId in pairs(targetIds) do
		targetCount = targetCount + 1

		local sources = hiddenSourcesByTargetId[targetId]

		if hidden then
			if not sources then
				sources = {}
				hiddenSourcesByTargetId[targetId] = sources
			end

			sources[id] = true
		elseif sources then
			sources[id] = nil

			if next(sources) == nil then
				hiddenSourcesByTargetId[targetId] = nil
			end
		end
	end

	return targetCount
end

function AppearanceItemCardVisibilityOverride.rebuildFromCommonSwitch()
	hiddenSourcesByTargetId = {}

	local hideMap = CommonSwitch.APPEARANCE_ITEM_CARD_HIDE

	if type(hideMap) ~= "table" then
		return
	end

	for sourceId, isHidden in pairs(hideMap) do
		local id = tonumber(sourceId)

		if id and isHidden and isKnownAppearanceId(id) then
			applySourceHidden(id, true)
		end
	end
end

function AppearanceItemCardVisibilityOverride.setHidden(id, hidden)
	id = tonumber(id)

	if not id or id <= 0 or id ~= math.floor(id) then
		return false, "请输入有效的外观ID"
	end

	if not isKnownAppearanceId(id) then
		return false, string.format("未找到外观ID：%d", id)
	end

	return true, applySourceHidden(id, hidden)
end

function AppearanceItemCardVisibilityOverride.isHidden(id)
	return hiddenSourcesByTargetId[id] ~= nil
end

return AppearanceItemCardVisibilityOverride
