-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\SimplifyPetMap.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local lume = require("Core.Common.lume")
local Utils = require("Common.Utils.Utils")
local NoticeDef = require("Common.NoticeDef")
local ItemUtils = require("Common.Utils.ItemUtils")
local PetData = require("Data.pet_data")
local PetTalentData = require("Data.pet_talent_data")
local ItemConstSourceData = require("Data.item_const_source_data")
local RECYCLE_PET_ATTRS = {
	"socialTxnLockId",
	"isTwinChoice",
	"basePetPrototypeId",
	"basePropertyList",
	"expFromItem",
	"levelOnCreate",
	"resonanceInfo",
	"unlockedAbilityMap",
	"talentList",
	"characterInfo",
	"curAbilityMap",
	"petPrototypeId"
}
local SimplifyPetMap = class.LiteClass("SimplifyPetMap", CustomDict)

function SimplifyPetMap:getPlayer()
	local obj = self:getRootOwner()

	return Utils.isPlayer(obj) and obj or nil
end

function SimplifyPetMap:getRecyclePetAttrs()
	return RECYCLE_PET_ATTRS
end

function SimplifyPetMap:dump(maxCount)
	local res = {}

	for petId, petInfo in self:items() do
		res[#res + 1] = petInfo:dump(true)

		if maxCount and maxCount <= #res then
			break
		end
	end

	table.sort(res, function(a, b)
		return a._index < b._index
	end)

	return res
end

return SimplifyPetMap
