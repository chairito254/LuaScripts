-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetShiny\\PetShinyModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local Utils = require("Common.Utils.Utils")
local ItemConst = require("Common.Const.ItemConst")
local ItemUtils = require("Common.Utils.ItemUtils")
local SysConfigData = require("Data.sys_config_data")
local PetShinyFunctionData = require("Data.pet_shiny_function_base_data")
local PetShinyFunctionCubeData = require("Data.pet_shiny_function_cube_data")
local PetShinyFunctionStyleData = require("Data.pet_shiny_function_style_data")
local PetShinyStyleData = require("Data.pet_shiny_style_data")
local PetShinyModel = Class.LightClass("PetShinyModel", UIModel)

PetShinyModel.TAB_ID = {
	GRANT = 1,
	SWITCH = 3,
	REROLL = 2
}
PetShinyModel.LEGEND_FUNCTION_ID = 4
PetShinyModel.LEGEND_RPC = "RPC_CS_PetLegendCubeSwitch"
PetShinyModel.REFRESH_RPC = {
	[PetShinyModel.TAB_ID.GRANT] = "RPC_CS_PetShinyAssign",
	[PetShinyModel.TAB_ID.REROLL] = "RPC_CS_PetShinyReroll",
	[PetShinyModel.TAB_ID.SWITCH] = "RPC_CS_PetShinySwitchStyle"
}

function PetShinyModel:ctor()
	self:reset()
end

function PetShinyModel:reset()
	self.petId = nil
	self.petInfo = nil
	self.itemId = nil
	self.tabId = nil
	self.selectedStyleId = nil
	self.selectedCubeItemId = nil
	self.isSelectingPet = true
end

function PetShinyModel:getTabUnusableDesc(tabId)
	local cfg = PetShinyFunctionData[tabId]

	return cfg and cfg.unusableDesc
end

function PetShinyModel:getShinyStyleName(shinyStyle)
	local cfg = PetShinyStyleData[shinyStyle or 0]

	return cfg and cfg.name
end

function PetShinyModel:setPet(petId)
	self.petInfo = petId ~= nil and pg.me.pets[petId]

	if not self.petInfo then
		self.petId = nil
		self.tabId = nil
		self.selectedStyleId = nil
		self.isSelectingPet = true

		return false
	end

	if self.petId ~= petId then
		self.selectedStyleId = nil
	end

	self.petId = petId
	self.isSelectingPet = false

	return true
end

function PetShinyModel:getTabIdByItemId(itemId)
	if itemId == ItemConst.SHINY_CHANGE_ITEM_ID then
		return self.TAB_ID.GRANT
	elseif itemId == ItemConst.SHINY_REFRESH_ITEM_ID then
		return self.TAB_ID.REROLL
	end
end

function PetShinyModel:checkSelectPet(petId, tabId)
	local petInfo = petId and pg.me.pets[petId]

	if not petInfo then
		return false
	end

	if table.contains(SysConfigData.SHINY_FUNCTION_HIDE_LIST, petInfo.templateId) then
		return false
	end

	if tabId == nil then
		return true
	end

	local functionData = PetShinyFunctionData[tabId]

	if table.contains(functionData.unusable, petInfo.petPrototypeId) then
		return false, functionData.unusableDesc
	end

	local isShiny = Utils.isLabelShiny(petInfo.label)

	if tabId == self.TAB_ID.GRANT then
		return not isShiny
	elseif tabId == self.TAB_ID.REROLL then
		return isShiny
	end

	return true
end

function PetShinyModel:findDefaultPetByItemId(itemId)
	local tabId = self:getTabIdByItemId(itemId)

	if tabId == nil then
		return nil
	end

	return self:findDefaultPetByTabId(tabId)
end

function PetShinyModel:findDefaultPetByTabId(tabId)
	local petBoxMap = pg.me.petBoxMap

	for sequenceIndex = 1, #petBoxMap.sequence do
		local box = petBoxMap[petBoxMap.sequence[sequenceIndex]]

		for slotIndex = 1, box.slotCount do
			local petId = box[slotIndex]

			if self:checkSelectPet(petId, tabId) then
				return petId
			end
		end
	end

	return nil
end

function PetShinyModel:getTabData()
	local isShiny = self.petInfo and Utils.isLabelShiny(self.petInfo.label)
	local tab = {
		{
			tabId = isShiny and self.TAB_ID.REROLL or self.TAB_ID.GRANT,
			tabName = isShiny and "PET_SHINY_TAB2" or "PET_SHINY_TAB1"
		}
	}

	if isShiny and not table.contains(PetShinyFunctionData[self.TAB_ID.SWITCH].unusable, self.petInfo.petPrototypeId) then
		tab[#tab + 1] = {
			tabName = "PET_SHINY_TAB3",
			tabId = self.TAB_ID.SWITCH
		}
	end

	return tab
end

function PetShinyModel:hasLegendCube()
	local isShiny = self.petInfo and Utils.isLabelShiny(self.petInfo.label)

	if not isShiny then
		return false
	end

	for itemId in pairs(PetShinyFunctionCubeData) do
		if ItemUtils.getItemCountById(pg.me, itemId, true) > 0 then
			return true
		end
	end

	return false
end

function PetShinyModel:getLegendCubeList()
	local cubeList = {}

	for itemId, cfg in pairs(PetShinyFunctionCubeData) do
		local count = ItemUtils.getItemCountById(pg.me, itemId, true)

		if count > 0 then
			cubeList[#cubeList + 1] = {
				id = itemId,
				num = count,
				sort = cfg.sort
			}
		end
	end

	table.sort(cubeList, function(left, right)
		if left.sort ~= right.sort then
			return left.sort < right.sort
		end

		return left.id < right.id
	end)

	return cubeList
end

function PetShinyModel:getSelectedLegendCubeData()
	return PetShinyFunctionCubeData[self.selectedCubeItemId]
end

function PetShinyModel:isLegendCube(cubeItemId)
	return PetShinyFunctionCubeData[cubeItemId] ~= nil
end

function PetShinyModel:checkLegendCubePet(petId, cubeItemId)
	local petInfo = petId and pg.me.pets[petId]

	if not petInfo or not PetShinyFunctionCubeData[cubeItemId] then
		return false
	end

	local functionData = PetShinyFunctionData[self.LEGEND_FUNCTION_ID]

	if table.contains(functionData.unusable, petInfo.petPrototypeId) then
		return false, functionData.unusableDesc
	end

	if not Utils.isLabelShiny(petInfo.label) or petInfo.cubeItemId == cubeItemId then
		return false
	end

	return true
end

function PetShinyModel:checkLegendCube(petId, cubeItemId)
	local canUse, desc = self:checkLegendCubePet(petId, cubeItemId)

	if not canUse then
		return false, desc
	end

	return ItemUtils.getItemCountById(pg.me, cubeItemId) >= 1
end

function PetShinyModel:getLegendConsumeData()
	if not self:getSelectedLegendCubeData() then
		return {}
	end

	return {
		{
			num = 1,
			id = self.selectedCubeItemId
		}
	}
end

function PetShinyModel:getConsumeData(tabId, shinyStyle)
	tabId = tabId or self.tabId

	if not self.petInfo or tabId == nil then
		return {}
	end

	local functionData = PetShinyFunctionData[tabId]
	local cost

	if functionData.costType == 1 then
		cost = functionData.cost
	elseif functionData.costType == 0 and tabId == self.TAB_ID.SWITCH then
		shinyStyle = shinyStyle or self.selectedStyleId

		if shinyStyle == nil then
			return {}
		end

		cost = PetShinyFunctionStyleData[shinyStyle].cost
	end

	local consumeData = {}

	for _, itemCost in ipairs(cost or {}) do
		if itemCost[2] > 0 then
			consumeData[#consumeData + 1] = {
				id = itemCost[1],
				num = itemCost[2]
			}
		end
	end

	return consumeData
end

function PetShinyModel:getAllStyleCostItemIds()
	local itemIds = {}
	local seenItemIds = {}

	for _, styleData in pairs(PetShinyFunctionStyleData) do
		for _, cost in ipairs(styleData.cost or {}) do
			local itemId = cost[1]

			if not seenItemIds[itemId] then
				seenItemIds[itemId] = true
				itemIds[#itemIds + 1] = itemId
			end
		end
	end

	table.sort(itemIds)

	return itemIds
end

function PetShinyModel:checkRefreshPet(petId, tabId, shinyStyle)
	local petInfo = petId and pg.me.pets[petId]

	if not petInfo then
		return false
	end

	local functionData = PetShinyFunctionData[tabId]

	if table.contains(functionData.unusable, petInfo.petPrototypeId) then
		return false, functionData.unusableDesc
	end

	local isShiny = Utils.isLabelShiny(petInfo.label)

	if isShiny ~= (tabId ~= self.TAB_ID.GRANT) then
		return false
	end

	if tabId == self.TAB_ID.SWITCH then
		local isCurrent, isUnlocked = self:getShinyStyleState(petId, shinyStyle)

		return isUnlocked and not isCurrent
	end

	return true
end

function PetShinyModel:getRefreshCostShortage(tabId, shinyStyle, cubeItemId)
	if cubeItemId ~= nil then
		if ItemUtils.getItemCountById(pg.me, cubeItemId) < 1 then
			return cubeItemId, 1
		end

		return
	end

	local consumeData = self:getConsumeData(tabId, shinyStyle)
	local needNums = {}

	for _, data in ipairs(consumeData) do
		data.id = ItemUtils.getConditionConvertedItemId(pg.me, data.id)
		needNums[data.id] = (needNums[data.id] or 0) + data.num
	end

	for _, data in ipairs(consumeData) do
		local needNum = needNums[data.id]

		if needNum > ItemUtils.getItemCountById(pg.me, data.id) then
			return data.id, needNum
		end
	end
end

function PetShinyModel:getShinyStyleState(petId, shinyStyle)
	local petInfo = petId and pg.me.pets[petId]

	if not petInfo then
		return false, false
	end

	local isShiny = Utils.isLabelShiny(petInfo.label)
	local isCurrent = isShiny and shinyStyle == (petInfo.shinyStyle or 0)
	local history = pg.me.petShinyStyleHistoryMap and pg.me.petShinyStyleHistoryMap[petId]
	local isUnlocked = isCurrent or isShiny and shinyStyle == 0 or (history and history[shinyStyle]) == true

	return isCurrent, isUnlocked
end

function PetShinyModel:getCurStyleData()
	if not self.petInfo then
		return {}
	end

	local styleData = {}

	for styleId, cfg in pairs(PetShinyStyleData) do
		local funcCfg = PetShinyFunctionStyleData[styleId]
		local isCurrent, isUnlocked = self:getShinyStyleState(self.petId, styleId)

		styleData[#styleData + 1] = {
			styleId = styleId,
			sort = funcCfg and funcCfg.sort or styleId,
			name = cfg.name,
			icon = cfg.iconPetManage or cfg.iconResearchBook,
			isCurrent = isCurrent,
			isUnlocked = isUnlocked
		}
	end

	table.sort(styleData, function(left, right)
		if left.sort ~= right.sort then
			return left.sort < right.sort
		end

		return left.styleId < right.styleId
	end)

	return styleData
end

return PetShinyModel
