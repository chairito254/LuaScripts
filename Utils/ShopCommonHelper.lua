-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\ShopCommonHelper.lua

local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local LimitData = require("Data.limit_data")
local ShopCommonHelper = {}

function ShopCommonHelper.isShopItemHiddenByCondition(shopItemConfig, player)
	if not shopItemConfig or shopItemConfig.hideByCondition ~= 1 then
		return false
	end

	if shopItemConfig.condition == nil or shopItemConfig.condition == 0 then
		return false
	end

	player = player or pg.me

	if not player or not player.triggerMap then
		return false
	end

	return not player.triggerMap:isCompleteOrMeetCondition(shopItemConfig.condition)
end

function ShopCommonHelper.isConfigAvailableInArea(config, areaNo)
	if not config or not config.areaNo then
		return true
	end

	if not Utils.isTable(config.areaNo) then
		return false
	end

	local currentAreaNo = areaNo or Utils.getServerArea()

	for _, availableAreaNo in ipairs(config.areaNo) do
		if availableAreaNo == currentAreaNo then
			return true
		end
	end

	return false
end

function ShopCommonHelper.isHitSceneLimit(commodityData, curSceneId)
	if commodityData.limitType ~= Const.LIMIT_SCENE then
		return false
	end

	local mainSceneId = Utils.getPhaseMainSceneId(curSceneId)

	if Utils.isTable(commodityData.limitParam) then
		for _, sid in ipairs(commodityData.limitParam) do
			if sid == curSceneId or mainSceneId and sid == mainSceneId then
				return true
			end
		end
	end

	return false
end

function ShopCommonHelper.getCurLimitShopSceneId(player)
	player = player or pg.me

	local space = player and player.space

	if not space then
		return 0
	end

	if space:isGrabEgg() then
		local dungeonSceneId = player:getDungeonSceneId()

		if dungeonSceneId and dungeonSceneId > 0 then
			return dungeonSceneId
		end
	end

	return space.sceneId or 0
end

function ShopCommonHelper.getShopItemLimitInfo(commodityData, commodityId, player)
	if not Utils.isTable(commodityData) or commodityId == nil or not player then
		return false, 0, 0, 0, nil
	end

	local limitId = commodityData.limitId
	local limitConfig = limitId and LimitData[limitId] or nil

	if Utils.isTable(limitConfig) then
		local hadBuyCount = player.shopGroupLimitCounts and player.shopGroupLimitCounts[limitId] or 0

		return true, hadBuyCount, limitConfig.countLimit or 0, limitConfig.type or 0, limitId
	end

	local limitType = commodityData.limitType or 0
	local limitNum = commodityData.limitNum or 0

	if limitType == Const.LIMIT_SCENE then
		local sceneId = ShopCommonHelper.getCurLimitShopSceneId(player)

		if limitNum > 0 and ShopCommonHelper.isHitSceneLimit(commodityData, sceneId) then
			local hadBuyCount = player.sceneLimitCounts and player.sceneLimitCounts[commodityId] or 0

			return true, hadBuyCount, limitNum, limitType, nil
		end

		return false, 0, 0, limitType, nil
	end

	local extraCount = player.shopLimitExtraCounts and player.shopLimitExtraCounts[commodityId] or 0
	local totalCount = limitNum + extraCount

	if totalCount > 0 then
		local hadBuyCount = player.shopLimitCounts and player.shopLimitCounts[commodityId] or 0

		return true, hadBuyCount, totalCount, limitType, nil
	end

	return false, 0, 0, limitType, nil
end

function ShopCommonHelper.isShopItemSoldOut(commodityData, commodityId, player)
	local hasLimit, hadBuyCount, totalCount = ShopCommonHelper.getShopItemLimitInfo(commodityData, commodityId, player)

	if hasLimit then
		return totalCount <= hadBuyCount, totalCount - hadBuyCount
	end

	return false, math.huge
end

return ShopCommonHelper
