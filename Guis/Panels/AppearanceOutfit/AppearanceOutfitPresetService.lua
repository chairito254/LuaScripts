-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AppearanceOutfit\\AppearanceOutfitPresetService.lua

local AppearanceData = require("Data.appearance_data")
local AppearanceEffectUtils = require("Utils.AppearanceEffectUtils")
local AppearanceJewelryInfo = require("CustomTypes.AppearanceJewelryInfo")
local AppearancePointEnum = require("Data.appearance_point_enum")
local ClientModelUtils = require("Utils.ClientModelUtils")
local HandheldAppearanceUIUtils = require("Utils.HandheldAppearanceUIUtils")
local ItemData = require("Data.item_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local UIConst = require("Const.UIConst")
local Utils = require("Common.Utils.Utils")
local json = require("json")
local AppearanceOutfitPresetService = {}

AppearanceOutfitPresetService.SCHEMA_VERSION = 2

function AppearanceOutfitPresetService.getApplyMakeupState()
	return pg.game.avatar.outfitApplyMakeup == true
end

function AppearanceOutfitPresetService.setApplyMakeupState(enabled)
	pg.game.avatar.outfitApplyMakeup = enabled == true
end

local SLOT_RANGES = {
	{
		AppearancePointEnum.Coat,
		AppearancePointEnum.Shoes
	},
	{
		AppearancePointEnum.Jewelry1,
		AppearancePointEnum.Jewelry10
	},
	{
		AppearancePointEnum.Fringe,
		AppearancePointEnum.Plait
	},
	{
		AppearancePointEnum.FootPrint,
		AppearancePointEnum.FootPrint
	},
	{
		AppearancePointEnum.Effect,
		AppearancePointEnum.Effect
	}
}

local function forEachSlot(callback)
	for _, range in ipairs(SLOT_RANGES) do
		for slotId = range[1], range[2] do
			callback(slotId)
		end
	end
end

local function isLegacyStoredSlot(slotId)
	return slotId >= AppearancePointEnum.Coat and slotId <= AppearancePointEnum.Shoes or slotId >= AppearancePointEnum.Jewelry1 and slotId <= AppearancePointEnum.Jewelry10
end

local function getOutfit(outfitId)
	return outfitId and pg.me and pg.me.appearanceCustom and pg.me.appearanceCustom[outfitId] or nil
end

local function isV2(outfit)
	return outfit and (tonumber(outfit.schemaVersion) or 0) >= AppearanceOutfitPresetService.SCHEMA_VERSION
end

local function hasStoredAppearance(outfit)
	if not outfit or not outfit.customShow then
		return false
	end

	for _, configId in pairs(outfit.customShow) do
		if configId and configId ~= 0 then
			return true
		end
	end

	return false
end

local function getCurrentConfigId(entity, slotId)
	if entity and entity.getAppearanceConfigId then
		return entity:getAppearanceConfigId(slotId, false) or 0
	end

	local curShow = entity and entity.curShow or pg.me and pg.me.curShow

	return curShow and curShow.customShow and curShow.customShow[slotId] or 0
end

function AppearanceOutfitPresetService.resolveCustomShow(entity, outfitId)
	local result = {}
	local outfit = getOutfit(outfitId)
	local useFullSnapshot = isV2(outfit)

	forEachSlot(function(slotId)
		if outfit and (useFullSnapshot or isLegacyStoredSlot(slotId)) then
			result[slotId] = outfit.customShow[slotId] or 0
		else
			result[slotId] = getCurrentConfigId(entity, slotId)
		end
	end)

	result[AppearancePointEnum.HandHeld] = getCurrentConfigId(entity, AppearancePointEnum.HandHeld)

	return result
end

function AppearanceOutfitPresetService.syncAppliedOutfitToEntity(entity, outfitId)
	if not entity then
		return false
	end

	local customShow = AppearanceOutfitPresetService.resolveCustomShow(entity, outfitId)

	entity.customShow = entity.customShow or {}

	forEachSlot(function(slotId)
		entity.customShow[slotId] = customShow[slotId] or 0
	end)

	entity.customShowPreview = entity.customShowPreview or {}

	table.clear(entity.customShowPreview)

	return true
end

local function decodeMakeupSnapshot(snapshot)
	if string.isNilOrEmpty(snapshot) then
		return nil
	end

	local decompressOk, raw = pcall(decompressFromStr, snapshot)

	if not decompressOk or string.isNilOrEmpty(raw) then
		return nil
	end

	local ok, data = pcall(json.decode, raw)

	if not ok or type(data) ~= "table" or type(data.makeupCustomData) ~= "table" then
		return nil
	end

	return data
end

function AppearanceOutfitPresetService.captureMakeupSnapshot(avatarConfig)
	if string.isNilOrEmpty(avatarConfig) then
		return nil, "empty avatarConfig"
	end

	local decompressOk, raw = pcall(decompressFromStr, avatarConfig)

	if not decompressOk or string.isNilOrEmpty(raw) then
		return nil, "invalid avatarConfig"
	end

	local ok, config = pcall(json.decode, raw)

	if not ok or type(config) ~= "table" or type(config.makeupCustomData) ~= "table" then
		return nil, "invalid makeupCustomData"
	end

	local encodeOk, encoded = pcall(json.encode, {
		makeupCustomData = config.makeupCustomData,
		makeupSuitId = tonumber(config.makeupSuitId) or -1
	})

	if not encodeOk or string.isNilOrEmpty(encoded) then
		return nil, "invalid makeupSnapshot"
	end

	return compressToStr(encoded)
end

local function buildAvatarConfigWithMakeup(snapshot)
	if not pg.me or string.isNilOrEmpty(pg.me.avatarConfig) then
		return nil
	end

	local decompressOk, raw = pcall(decompressFromStr, pg.me.avatarConfig)

	if not decompressOk or string.isNilOrEmpty(raw) then
		return nil
	end

	local ok, config = pcall(json.decode, raw)

	if not ok or type(config) ~= "table" then
		return nil
	end

	local makeup = decodeMakeupSnapshot(snapshot)

	if makeup then
		config.makeupCustomData = makeup.makeupCustomData
		config.makeupSuitId = tonumber(makeup.makeupSuitId) or -1
	end

	local encodeOk, encoded = pcall(json.encode, config)

	return encodeOk and encoded or nil
end

local function getCurrentClothesDesign(player, customShow, slotId)
	local configId = customShow[slotId]

	if not configId or configId == 0 then
		return nil
	end

	local data = AppearanceData[configId] or {}
	local stainSlotId = data.points and data.points[1] or slotId

	if slotId ~= stainSlotId then
		return nil
	end

	local curShow = player.curShow

	if curShow.customShow[slotId] == configId then
		return curShow.clothesDesigns and curShow.clothesDesigns[slotId]
	end

	local appearance = player.appearanceInfo and player.appearanceInfo[configId]

	if appearance and appearance.designIndex > 0 then
		return appearance.designList[appearance.designIndex]
	end
end

local function getCurrentJewelryInfo(player, slotId, configId)
	if not configId or configId == 0 then
		return nil
	end

	local curShow = player.curShow
	local jewelryInfo = curShow[slotId]

	if curShow.customShow[slotId] == configId and jewelryInfo and (jewelryInfo.configId == 0 or jewelryInfo.configId == configId) then
		return jewelryInfo
	end

	local lastInfo = player.jewelryLastInfos and player.jewelryLastInfos[configId]

	if not string.isNilOrEmpty(lastInfo) then
		jewelryInfo = AppearanceJewelryInfo.new()

		jewelryInfo:toTable(configId, lastInfo)

		return jewelryInfo
	end
end

local function getCurrentHairInfo(player, slotId, configId)
	if not configId or configId == 0 then
		return nil
	end

	local curShow = player.curShow
	local currentId = curShow.customShow[slotId]
	local currentData = AppearanceData[currentId] or {}
	local data = AppearanceData[configId] or {}

	if currentId == configId or data.hairId and data.hairId > 0 and data.hairId == currentData.hairId then
		return curShow.hairInfo and curShow.hairInfo[slotId]
	end

	local pending = player.delayRecordHairInfo

	return pending and pending.hairCustomData and pending.hairCustomData[slotId] or nil
end

function AppearanceOutfitPresetService.buildSavePayload(player, entity)
	local curShow = player and player.curShow

	if not curShow or not curShow.customShow then
		return nil, nil, "missing curShow"
	end

	local makeupSnapshot, err = AppearanceOutfitPresetService.captureMakeupSnapshot(player.avatarConfig)

	if not makeupSnapshot then
		return nil, nil, err
	end

	local customShow = AppearanceOutfitPresetService.resolveCustomShow(entity or player)
	local customInfo = {}

	forEachSlot(function(slotId)
		if curShow.customShow[slotId] == nil then
			return
		end

		local configId = customShow[slotId] or 0
		local entry = {
			configId = configId
		}

		if slotId >= AppearancePointEnum.Coat and slotId <= AppearancePointEnum.Shoes then
			local design = getCurrentClothesDesign(player, customShow, slotId)

			entry.clothesDesign = design and design:getRawTable() or nil
		elseif slotId >= AppearancePointEnum.Jewelry1 and slotId <= AppearancePointEnum.Jewelry10 then
			local jewelryInfo = getCurrentJewelryInfo(player, slotId, configId)

			entry.jewelryInfo = jewelryInfo and jewelryInfo:getRawTable() or nil
		elseif slotId >= AppearancePointEnum.Fringe and slotId <= AppearancePointEnum.Plait then
			entry.hairInfo = getCurrentHairInfo(player, slotId, configId)
		end

		customInfo[slotId] = entry
	end)

	return customInfo, {
		schemaVersion = AppearanceOutfitPresetService.SCHEMA_VERSION,
		makeupSnapshot = makeupSnapshot
	}
end

local function makeGenericContent(configId)
	local appearance = AppearanceData[configId] or {}
	local item = ItemData[configId] or {}

	return {
		state = "Have",
		id = configId,
		itemId = configId,
		icon = appearance.icon or item.icon,
		quality = item.quality or UIConst.QUALITY.GREEN
	}
end

function AppearanceOutfitPresetService.getContentList(entity, outfitId)
	if outfitId and not hasStoredAppearance(getOutfit(outfitId)) then
		return {}
	end

	local customShow = AppearanceOutfitPresetService.resolveCustomShow(entity, outfitId)
	local result = {}
	local seenClothes = {}

	for slotId = AppearancePointEnum.Coat, AppearancePointEnum.Shoes do
		local configId = customShow[slotId]

		if configId and configId ~= 0 and not seenClothes[configId] then
			seenClothes[configId] = true

			local info = LuaUIUtils.getClothesInfo(pg.me, configId, customShow)

			result[#result + 1] = {
				state = "Have",
				id = configId,
				itemId = configId,
				icon = info.icon,
				quality = info.quality
			}
		end
	end

	for slotId = AppearancePointEnum.Jewelry1, AppearancePointEnum.Jewelry10 do
		if not LuaUIUtils.isAppearancePointHidden(slotId) then
			local configId = customShow[slotId]

			if configId and configId ~= 0 then
				local info = LuaUIUtils.getAccessoryInfo(pg.me, configId)

				result[#result + 1] = {
					state = "Have",
					id = configId,
					itemId = configId,
					icon = info.icon,
					quality = info.quality
				}
			end
		end
	end

	for slotId = AppearancePointEnum.Fringe, AppearancePointEnum.Plait do
		local configId = customShow[slotId]

		if configId and configId ~= 0 then
			local info = LuaUIUtils.getHairPartInfo(pg.me, configId, customShow)

			result[#result + 1] = {
				state = "Have",
				id = configId,
				itemId = configId,
				icon = info.icon,
				quality = info.quality
			}
		end
	end

	for slotId = AppearancePointEnum.FootPrint, AppearancePointEnum.Effect do
		local configId = customShow[slotId]

		if slotId ~= AppearancePointEnum.HandHeld and configId and configId ~= 0 then
			result[#result + 1] = makeGenericContent(configId)
		end
	end

	return result
end

local function restoreAvatarInstance(avatarMgr, previousModel)
	if not IsNil(previousModel) and previousModel ~= avatarMgr.avatarEntity and not IsNil(previousModel.modelModelView) then
		avatarMgr:SetAvatarInstance(previousModel)
		avatarMgr:InitAvatarPart()
	end
end

function AppearanceOutfitPresetService.refreshMakeupPreview(entity)
	local avatarConfig = entity and entity.outfitPreviewAvatarConfig

	if not avatarConfig or not entity.eModel then
		return false
	end

	local avatarMgr = entity.avatarManager or pg.global.avatarMgr
	local modelView = entity.eModel.modelModelView

	if IsNil(modelView) or IsNil(modelView.modelInfo) or IsNil(modelView.shaderView) then
		return false
	end

	local previousModel = avatarMgr.avatarEntity

	avatarMgr:SetAvatarInstance(entity.eModel)
	avatarMgr:InitAvatarPart()
	avatarMgr.avatarMakeup:ResetMakeupVisualStateBeforeImport()
	modelView.modelInfo:ParseCustomData(avatarConfig)
	modelView.modelInfo:ProcessCustomData()
	avatarMgr:SetAvatarInstance(entity.eModel)
	avatarMgr:InitAvatarPart()
	avatarMgr.avatarMakeup:ClearPreviewDecal()
	modelView:RefreshDecal()
	modelView:RefreshMakeup()
	restoreAvatarInstance(avatarMgr, previousModel)

	return true
end

local function clearPartRange(entity, firstSlot, lastSlot)
	local partModelInfo = entity.eModel.modelModelViewPartModelInfo
	local removed = {}

	for slotId = firstSlot, lastSlot do
		AppearanceEffectUtils.setAppearance(entity, slotId, nil)

		local resId = partModelInfo:GetPartResId(slotId)

		if not string.isNilOrEmpty(resId) and not removed[resId] then
			removed[resId] = true

			partModelInfo:RemovePartItem(resId)
		end
	end
end

local function applyPartRange(entity, customShow, firstSlot, lastSlot)
	local partModelInfo = entity.eModel.modelModelViewPartModelInfo
	local applied = {}

	clearPartRange(entity, firstSlot, lastSlot)

	for slotId = firstSlot, lastSlot do
		local configId = customShow[slotId]
		local config = configId and AppearanceData[configId]

		if configId and configId ~= 0 and config and not applied[configId] then
			applied[configId] = true

			AppearanceEffectUtils.setPartAppearance(entity, configId, true)
			partModelInfo:ModifyPartItem(config.res, Utils.deepCopyTable(config.points))
		end
	end
end

local function applyAttachments(entity, outfit, customShow)
	local modelInfo = entity.eModel.modelModelViewModelInfo

	modelInfo:ClearAttachInfo()

	local attachInfoList = {}

	for slotId = AppearancePointEnum.Jewelry1, AppearancePointEnum.Jewelry10 do
		AppearanceEffectUtils.setAppearance(entity, slotId, nil)

		local configId = customShow[slotId]

		if configId and configId ~= 0 then
			local jewelryInfo

			if outfit then
				jewelryInfo = outfit[slotId]
			else
				jewelryInfo = getCurrentJewelryInfo(pg.me, slotId, configId)
			end

			local attachInfo = ClientModelUtils.getModelAttachInfo(pg.me, configId, slotId, jewelryInfo)

			attachInfoList[#attachInfoList + 1] = attachInfo

			AppearanceEffectUtils.setAppearance(entity, slotId, configId, attachInfo.resId)
		end
	end

	local addedPeripheral = {}
	local footprintRes

	for slotId = AppearancePointEnum.FootPrint, AppearancePointEnum.Effect do
		AppearanceEffectUtils.setAppearance(entity, slotId, nil)

		local configId = customShow[slotId]

		if configId and configId ~= 0 and not addedPeripheral[configId] then
			addedPeripheral[configId] = true

			local attachInfo = ClientModelUtils.getPeripheralAttachInfo(entity, configId)

			if attachInfo then
				attachInfoList[#attachInfoList + 1] = attachInfo

				if slotId == AppearancePointEnum.FootPrint then
					footprintRes = attachInfo.resId
				end
			end

			local config = AppearanceData[configId] or {}

			AppearanceEffectUtils.setAppearance(entity, slotId, configId, config.res)
		end
	end

	ClientModelUtils.addModelAttachList(modelInfo, attachInfoList)

	if footprintRes and entity.setAppearanceVisible then
		entity:setAppearanceVisible(footprintRes, true, HandheldAppearanceUIUtils.FOOTPRINT_ACTION_HIDE_REASON)
	end
end

local function getHairInfo(entity, outfit)
	local result = {}

	for slotId = AppearancePointEnum.Fringe, AppearancePointEnum.Plait do
		if outfit then
			result[slotId] = outfit.hairInfo and outfit.hairInfo[slotId] or nil
		else
			result[slotId] = getCurrentHairInfo(pg.me, slotId, getCurrentConfigId(entity, slotId))
		end
	end

	return result
end

local function applyDeferredCustomData(entity, outfitId, customShow, hairInfo, generation)
	if entity.outfitPreviewGeneration ~= generation or not entity.eModel then
		return
	end

	local avatarMgr = entity.avatarManager or pg.global.avatarMgr
	local previousModel = avatarMgr.avatarEntity

	avatarMgr:SetAvatarInstance(entity.eModel)

	local curShow = {
		customShow = customShow,
		hairInfo = hairInfo
	}

	for slotId = AppearancePointEnum.Fringe, AppearancePointEnum.Plait do
		ClientModelUtils.applyHairCustomData(entity, curShow, slotId)
	end

	avatarMgr.avatarHair:InitColors()

	if outfitId then
		ClientModelUtils.applyOutfitClothesStain(entity, outfitId)
	else
		local modelView = entity.eModel.modelModelView

		for slotId = AppearancePointEnum.Coat, AppearancePointEnum.Shoes do
			local configId = customShow[slotId]

			if configId and configId ~= 0 and modelView.partModel:IsPartModelLoaded(slotId) then
				local data = AppearanceData[configId] or {}
				local stainSlotId = data.points and data.points[1] or slotId

				if slotId == stainSlotId then
					local design = getCurrentClothesDesign(pg.me, customShow, slotId)

					if design then
						ClientModelUtils.applyClothStainInfo(entity, slotId, design)
					else
						entity.eModel.modelShaderView:ApplyPreset(slotId, "Default1")
					end
				end
			end
		end
	end

	restoreAvatarInstance(avatarMgr, previousModel)
end

function AppearanceOutfitPresetService.preview(avatarScene, entityId, outfitId, applyMakeup)
	local entity = avatarScene and avatarScene:getEntity(entityId)

	if not entity or not entity.eModel then
		return false
	end

	local outfit = getOutfit(outfitId)
	local customShow = AppearanceOutfitPresetService.resolveCustomShow(entity, outfitId)
	local hairInfo = getHairInfo(entity, isV2(outfit) and outfit or nil)
	local makeupSnapshot = applyMakeup and outfit and outfit.makeupSnapshot or nil

	entity.outfitPreviewAvatarConfig = buildAvatarConfigWithMakeup(makeupSnapshot)
	entity.previewOutfitId = outfitId
	entity.outfitPreviewGeneration = (entity.outfitPreviewGeneration or 0) + 1

	local generation = entity.outfitPreviewGeneration

	AppearanceOutfitPresetService.refreshMakeupPreview(entity)
	applyPartRange(entity, customShow, AppearancePointEnum.Coat, AppearancePointEnum.Shoes)
	applyPartRange(entity, customShow, AppearancePointEnum.Fringe, AppearancePointEnum.Plait)
	applyAttachments(entity, outfit, customShow)

	local modelView = entity.eModel.modelModelView
	local previousLoaded = entity.modelPartModelAllLoaded
	local onModelPartLoaded

	function onModelPartLoaded()
		if entity.modelPartModelAllLoaded == onModelPartLoaded then
			entity.modelPartModelAllLoaded = nil
		end

		if previousLoaded then
			previousLoaded()
		end

		if entity.outfitPreviewGeneration == generation then
			AppearanceOutfitPresetService.refreshMakeupPreview(entity)
		end

		applyDeferredCustomData(entity, outfitId, customShow, hairInfo, generation)
	end

	entity.modelPartModelAllLoaded = onModelPartLoaded

	ClientModelUtils.refreshModels(entity, modelView)
	applyDeferredCustomData(entity, outfitId, customShow, hairInfo, generation)

	if entity.addTimer then
		entity:addTimer(0, function()
			applyDeferredCustomData(entity, outfitId, customShow, hairInfo, generation)
		end)
	end

	return true
end

return AppearanceOutfitPresetService
