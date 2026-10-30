-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LotteryShop\\LotteryShopModel.lua

local Class = require("Core.Framework.Class")
local ShopModel = require("Guis.Panels.Shop.ShopModel")
local Utils = require("Common.Utils.Utils")
local ClientUtils = require("Utils.ClientUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local AvatarHairSuitData = require("Data.avatar_hair_suit_data")
local AppearanceMakeupPresetData = require("Data.appearance_makeup_preset_data")
local HomeObjectData = require("Data.home_object_data")
local DropData = require("Data.drop_data")
local LotteryUtils = require("Utils.LotteryUtils")
local LotteryShopModel = Class.LightClass("LotteryShopModel", ShopModel)

function LotteryShopModel:isSpecialCommodityOwned(commodityConfig, visitingItemIds)
	if not Utils.isTable(commodityConfig) or not pg.me then
		return false
	end

	local itemId = tonumber(commodityConfig.itemId)

	if not itemId then
		return false
	end

	if HomeObjectData[itemId] then
		local ownedCount = (ClientUtils.getItemCountById(itemId, true) or 0) + (ClientUtils.getHomelandItemCountById(itemId) or 0)

		return ownedCount > 0
	end

	local gender = ClientCashShopUtils.getPlayerGender()
	local convertedItemId = ClientCashShopUtils.getGenderConvertedItemId(itemId, gender) or itemId
	local dropConfig = DropData[convertedItemId] or DropData[itemId]

	if Utils.isTable(dropConfig) and Utils.isTable(dropConfig.fixedDrop) then
		visitingItemIds = visitingItemIds or {}

		if visitingItemIds[convertedItemId] then
			return false
		end

		visitingItemIds[convertedItemId] = true

		for _, dropInfo in ipairs(dropConfig.fixedDrop) do
			if not Utils.isTable(dropInfo) or not dropInfo[1] or not self:isSpecialCommodityOwned({
				itemId = dropInfo[1]
			}, visitingItemIds) then
				visitingItemIds[convertedItemId] = nil

				return false
			end
		end

		visitingItemIds[convertedItemId] = nil

		return #dropConfig.fixedDrop > 0
	end

	local headRewardOwned = LotteryUtils.getHeadRewardOwned(pg.me, convertedItemId)

	if headRewardOwned ~= nil then
		return headRewardOwned
	end

	if ClientCashShopUtils.hasOwnedCommodityAppearance(pg.me, commodityConfig) then
		return true
	end

	local hairSuitConfig = AvatarHairSuitData[convertedItemId] or AvatarHairSuitData[itemId]

	if Utils.isTable(hairSuitConfig) and Utils.isTable(hairSuitConfig.appearanceList) then
		for _, appearanceId in ipairs(hairSuitConfig.appearanceList) do
			if not ClientCashShopUtils.hasOwnedAppearance(pg.me, appearanceId) then
				return false
			end
		end

		return #hairSuitConfig.appearanceList > 0
	end

	local makeupConfig = AppearanceMakeupPresetData[convertedItemId] or AppearanceMakeupPresetData[itemId]

	if Utils.isTable(makeupConfig) and Utils.isTable(makeupConfig.makeupList) then
		for _, appearanceId in ipairs(makeupConfig.makeupList) do
			if not ClientCashShopUtils.hasOwnedAppearance(pg.me, appearanceId) then
				return false
			end
		end

		return #makeupConfig.makeupList > 0
	end

	return false
end

return LotteryShopModel
