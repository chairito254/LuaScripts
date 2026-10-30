-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetManagementTidyUp\\PetManagementTidyUpModel.lua

local UIModel = require("Guis.UIModel")
local Class = require("Core.Framework.Class")
local PetManagementTidyUpModel = Class.LightClass("PetManagementTidyUpModel", UIModel)

function PetManagementTidyUpModel:getOptionsInfo()
	local sortInfos = {
		{
			idx = 0,
			name = pg.getGameString("SORT_TYPE_1")
		},
		{
			idx = 1,
			name = pg.getGameString("SORT_TYPE_4")
		},
		{
			idx = 2,
			name = pg.getGameString("SORT_TYPE_2")
		},
		{
			idx = 3,
			name = pg.getGameString("SORT_TYPE_5")
		},
		{
			idx = 4,
			name = pg.getGameString("SORT_TYPE_6")
		},
		{
			idx = 5,
			name = pg.getGameString("PET_FAMILY")
		},
		{
			idx = 6,
			name = pg.getGameString("PET_TIDY_COMPACT")
		},
		{
			idx = 7,
			name = pg.getGameString("FILTER_RARITY")
		},
		{
			idx = 8,
			name = pg.getGameString("FILTER_ROLE")
		}
	}

	return sortInfos
end

function PetManagementTidyUpModel:getBoxNameById(id, boxType)
	local Const = require("Common.Const.Const")
	local petBoxMap = pg.me and pg.me.petBoxMap

	if boxType == Const.PetBoxType.WAREHOUSE_PET_BOX then
		petBoxMap = pg.me and pg.me.warehousePetBoxMap
	end

	local box = petBoxMap and petBoxMap[id]
	local customName = box and box.customName

	if customName and customName ~= "" then
		return customName
	end

	return pg.getGameString("DEFAULT_PET_BOX_NAME") .. " " .. id
end

return PetManagementTidyUpModel
