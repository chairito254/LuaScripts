-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\SimplifyPetInfo.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local lume = require("Core.Common.lume")
local logger = require("Core.Log.LoggerManager").getLogger("SimplifyPetInfo")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local ItemUtils = require("Common.Utils.ItemUtils")
local ObjHelper = require("Common.ObjHelper")
local AbilityUtils = require("Common.Utils.AbilityUtils")
local AttributeConst = require("Common.Const.AttributeConst")
local NoticeDef = require("Common.NoticeDef")
local SocialUtils = require("Common.Utils.SocialUtils")
local PetData = require("Data.pet_data")
local PetEvolveData = require("Data.pet_evolve_data")
local PetResearchContentData = require("Data.pet_research_content_data")
local PetConfigData = require("Data.pet_config_data")
local PetPrototypeData = require("Data.pet_prototype_data")
local PetCharacterData = require("Data.pet_character_data")
local PetLevelData = require("Data.pet_level_data")
local HomeEventTypeData = require("Data.home_event_type_data")
local PetElementNameToId = require("Data.element_name_to_id")
local ExploreAbilityData = require("Data.explore_ability_data")
local math_floor = math.floor
local SimplifyPetInfo = class.LiteClass("SimplifyPetInfo", CustomDict)

function SimplifyPetInfo:getObj()
	local obj = self:getRootOwner()

	if self._name == "shapeShiftSimplifyPetInfo" then
		obj = obj.master
	end

	return obj
end

function SimplifyPetInfo:repr()
	return string.format("SimplifyPetInfo(templateId=%d, entityId=%s)", self.templateId, self.id)
end

function SimplifyPetInfo:getEthnicGroup()
	local pdd = PetData[self.templateId]

	return pdd and pdd.ethnicGroup or 0
end

function SimplifyPetInfo:getTimeForRank(orderType)
	return self.time or 0
end

function SimplifyPetInfo:getCpValueForRank(orderType)
	return self.cpValue or 0
end

function SimplifyPetInfo:getLevelForRank(orderType)
	return self.level or 1
end

function SimplifyPetInfo:getNumberIdForRank(orderType)
	local prcdd = PetResearchContentData[self.templateId]

	return prcdd and prcdd.number or 0
end

function SimplifyPetInfo:getPropRatingResultForRank(orderType)
	return self.propertyScoreStage or 1
end

function SimplifyPetInfo:dump(simple)
	local player = self:getObj()
	local indexStr = "0_0"

	if player and player.petBoxMap then
		local indexBox, indexSlot = player.petBoxMap:getPetIndex(self.id)

		if indexBox and indexSlot then
			indexStr = string.format("%d_%d", indexBox, indexSlot)
		end
	end

	return {
		_index = indexStr,
		_repr = self:repr()
	}
end

return SimplifyPetInfo
