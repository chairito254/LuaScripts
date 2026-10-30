-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonUseConfirm\\CommonUseConfirmModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local CommonUseConfirmModel = Class.LightClass("CommonUseConfirmModel", UIModel)
local ItemData = require("Data.item_data")
local ItemConditionConvertData = require("Data.item_condition_convert_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ItemUtils = require("Common.Utils.ItemUtils")

function CommonUseConfirmModel:parsePropData(data)
	local res = {}

	if data == nil or #data == 0 then
		return res
	end

	local me = pg.me

	for i, v in ipairs(data) do
		local sourceItemId = v.sourceItemId or v.id or v.itemId or v[1]
		local item = LuaUIUtils.getItemDisplayData(v, false, sourceItemId)

		item.num = v.num or v[2]

		local iData = ItemData[item.id]

		if iData then
			item.name = iData.itemName
			item.icon = LuaUIUtils.getIconByIconId(iData.icon)
			item.quality = iData.quality

			local isMappedCost = not item.skipConditionConvert and ItemConditionConvertData[item.sourceItemId] ~= nil

			item.ownNum = not isMappedCost and v.ownNum or ItemUtils.getItemCountById(me, item.id)
			item.hideOwnNum = v.hideOwnNum
			item.hideNum = v.hideNum
			item.showLack = v.showLack
		end

		res[i] = item
	end

	return res
end

return CommonUseConfirmModel
