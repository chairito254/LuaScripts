-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Nourish\\NourishModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local ClientUtils = require("Utils.ClientUtils")
local ItemData = require("Data.item_data")
local MapAreaConfigData = require("Data.map_area_config_data")
local MapBlockConfigData = require("Data.map_block_config_data")
local SceneLeylineTreeTemplateData = require("Data.scene_leylineTree_template_data")
local SysConfigData = require("Data.sys_config_data")
local LeylineFlowerUtils = require("Common.Utils.LeylineFlowerUtils")
local NourishModel = Class.LightClass("NourishModel", UIModel)

function NourishModel:getConsumeCostItemCount(itemId)
	local num = ClientUtils.getItemCountById(itemId) or 0

	return num
end

function NourishModel:getConsumeCostItemInfo(itemId)
	local ret = {}

	ret.icon = ItemData[itemId].icon

	return ret
end

function NourishModel:getLeylineTreeDesc(leylineTreeId)
	for k, v in pairs(MapAreaConfigData) do
		if v.treeId == leylineTreeId then
			return v.probabilityDes
		end
	end
end

function NourishModel:getLeylineTreeWeatherDesc(leylineTreeId)
	for k, v in pairs(MapAreaConfigData) do
		if v.treeId == leylineTreeId then
			return v.meteorologyDetailDes
		end
	end

	return nil
end

function NourishModel:getBlockAreaInfo(leylineTreeId)
	local allBlockAreaIds = SceneLeylineTreeTemplateData[leylineTreeId].blockArea
	local leftStart = 1
	local leftEnd = math.ceil(#allBlockAreaIds / 2)
	local rightStart = leftEnd + 1
	local rightEnd = #allBlockAreaIds
	local leftAreas = {}

	for i = leftStart, leftEnd do
		leftAreas[#leftAreas + 1] = {
			blockId = allBlockAreaIds[i],
			areaName = pg.getLocalizationText(MapBlockConfigData[allBlockAreaIds[i]].areaName)
		}
	end

	local rightAreas = {}

	for i = rightStart, rightEnd do
		rightAreas[#rightAreas + 1] = {
			blockId = allBlockAreaIds[i],
			areaName = pg.getLocalizationText(MapBlockConfigData[allBlockAreaIds[i]].areaName)
		}
	end

	return leftAreas, rightAreas
end

function NourishModel:setNourishProp(propId, count)
	self.nourishPropId = propId
	self.nourishPropCount = count
end

function NourishModel:getNourishCountInfo(treeId)
	local freeMaxCount = SysConfigData.LEYLINEFLOWER_NOURISH_FREEMAXCOUNT or 0
	local nourishCount = pg.me.nourishCount

	if nourishCount == nil then
		nourishCount = -freeMaxCount
	end

	local dailyNourishMap = pg.me.dailyNourishMap
	local dailyNourishCount = treeId and dailyNourishMap and dailyNourishMap[treeId] or 0
	local maxCount = LeylineFlowerUtils.getNourishMaxCount(pg.me)
	local hasFree = nourishCount < 0

	return {
		nourishCount = nourishCount,
		freeMaxCount = freeMaxCount,
		freeRemainCount = hasFree and -nourishCount or 0,
		hasFree = hasFree,
		needPay = not hasFree,
		displayCount = dailyNourishCount,
		maxCount = maxCount,
		reachMax = maxCount ~= nil and maxCount <= dailyNourishCount
	}
end

return NourishModel
