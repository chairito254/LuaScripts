-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenPerfumeBlending\\EventHalloweenPerfumeBlendingModel.lua

local Class = require("Core.Framework.Class")
local EventHalloweenModel = require("Guis.Panels.EventHalloween.EventHalloweenModel")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventHalloweenFlavorData = require("Data.event_halloween_flavor_data")
local EventHalloweenMaterialData = require("Data.event_halloween_material_data")
local EventHalloweenPerfumeBlendingModel = Class.LightClass("EventHalloweenPerfumeBlendingModel", EventHalloweenModel)

EventHalloweenPerfumeBlendingModel.SCENT_TYPE = {
	LIGHT = 3,
	RICH = 2,
	SWEET = 1,
	MATERIAL = 4
}
EventHalloweenPerfumeBlendingModel.FLAVOR_ICON_URL = {
	[EventHalloweenPerfumeBlendingModel.SCENT_TYPE.SWEET] = "$UI_Img_Event_Halloween_PlayGame_Icon3.png",
	[EventHalloweenPerfumeBlendingModel.SCENT_TYPE.RICH] = "$UI_Img_Event_Halloween_PlayGame_Icon1.png",
	[EventHalloweenPerfumeBlendingModel.SCENT_TYPE.LIGHT] = "$UI_Img_Event_Halloween_PlayGame_Icon2.png"
}
EventHalloweenPerfumeBlendingModel.OPERATOR_SYMBOL = {
	le = "<=",
	ge = ">=",
	eq = "="
}
EventHalloweenPerfumeBlendingModel.OPERATOR_ORDER = {
	"ge",
	"le",
	"eq"
}

function EventHalloweenPerfumeBlendingModel:ctor()
	EventHalloweenModel.ctor(self)

	self.petIndex = 1
	self.selectedMaterialIds = {}
	self.selectedMaterialIdSet = {}
	self.flavorChangeValues = {}
end

function EventHalloweenPerfumeBlendingModel:setOpenData(info)
	self:setEventId(info and info.eventId)

	self.petIndex = math.clamp(info and info.petIndex or self:getCurrentPetIndex(), 1, self.PET_BADGE_COUNT)

	self:resetSelection()
end

function EventHalloweenPerfumeBlendingModel:getPetIndex()
	return self.petIndex
end

function EventHalloweenPerfumeBlendingModel:getTitleText()
	return pg.getGameString("HALLOWEEN_BLEND_NAME")
end

function EventHalloweenPerfumeBlendingModel:getPetConfig()
	local activityConfig = self:getActivityConfig()

	if not activityConfig then
		return nil
	end

	return {
		index = self.petIndex,
		petId = self:getBlendPetIdByIndex(self.petIndex),
		unlockDay = activityConfig.blendPetTime and activityConfig.blendPetTime[self.petIndex],
		requirements = activityConfig.blendPetRequire and activityConfig.blendPetRequire[self.petIndex],
		requireDesc = activityConfig.blendPetRequireDesc and activityConfig.blendPetRequireDesc[self.petIndex],
		materialIds = activityConfig.blendMaterial and activityConfig.blendMaterial[self.petIndex] or {}
	}
end

function EventHalloweenPerfumeBlendingModel:getTaskTitleText()
	local petConfig = self:getPetConfig()
	local requireDesc = petConfig and petConfig.requireDesc

	return requireDesc and pg.getLocalizationText(requireDesc) or ""
end

function EventHalloweenPerfumeBlendingModel:getCurrentPetIconUrl()
	local petConfig = self:getPetConfig()

	return LuaUIUtils.getPetIconByTemplateId(petConfig and petConfig.petId, LuaUIUtils.PET_ICON)
end

function EventHalloweenPerfumeBlendingModel:getMaterialEffectList(materialEffect)
	local effectList = {}

	for scentType, value in pairs(materialEffect or {}) do
		effectList[#effectList + 1] = {
			scentType = scentType,
			flavorIcon = self.FLAVOR_ICON_URL[scentType],
			valueText = value > 0 and "+" .. value or tostring(value),
			state = value > 0 and 0 or 1
		}
	end

	table.sort(effectList, function(leftData, rightData)
		return leftData.scentType < rightData.scentType
	end)

	return effectList
end

function EventHalloweenPerfumeBlendingModel:getMaterialList()
	local petConfig = self:getPetConfig()
	local materialList = {}

	for _, materialId in ipairs(petConfig and petConfig.materialIds or {}) do
		local materialConfig = EventHalloweenMaterialData[materialId]

		if materialConfig then
			materialList[#materialList + 1] = {
				materialId = materialId,
				materialNameText = pg.getLocalizationText(materialConfig.materialName),
				materialIcon = materialConfig.materiaIcon,
				effectList = self:getMaterialEffectList(materialConfig.materiaEffect)
			}
		end
	end

	return materialList
end

function EventHalloweenPerfumeBlendingModel:getAllowedMaterialIdSet()
	local allowedMaterialIdSet = {}
	local petConfig = self:getPetConfig()

	for _, materialId in ipairs(petConfig and petConfig.materialIds or {}) do
		allowedMaterialIdSet[materialId] = true
	end

	return allowedMaterialIdSet
end

function EventHalloweenPerfumeBlendingModel:getOperatorSymbol(operatorName)
	return self.OPERATOR_SYMBOL[operatorName] or operatorName
end

function EventHalloweenPerfumeBlendingModel:getConditionList()
	local petConfig = self:getPetConfig()
	local requirements = petConfig and petConfig.requirements or {}
	local effectTotals = self:getEffectTotals()
	local conditionList = {}

	for scentType = self.SCENT_TYPE.SWEET, self.SCENT_TYPE.LIGHT do
		local operatorValues = requirements[scentType]

		if operatorValues then
			for _, operatorName in ipairs(self.OPERATOR_ORDER) do
				local value = operatorValues[operatorName]

				if value ~= nil then
					local flavorConfigs = EventHalloweenFlavorData[scentType]
					local flavorConfig = flavorConfigs and flavorConfigs[value]
					local flavorName = flavorConfig and pg.getLocalizationText(flavorConfig.flavorName) or ""

					conditionList[#conditionList + 1] = {
						iconState = 1,
						nameText = flavorName,
						flavorIcon = self.FLAVOR_ICON_URL[scentType],
						valueText = self:getOperatorSymbol(operatorName) .. tostring(value),
						state = self:checkOperator(effectTotals[scentType] or 0, operatorName, value) and 1 or 0
					}
				end
			end
		end
	end

	local requiredMaterialId = requirements[self.SCENT_TYPE.MATERIAL]
	local materialConfig = requiredMaterialId and EventHalloweenMaterialData[requiredMaterialId]

	if materialConfig then
		conditionList[#conditionList + 1] = {
			iconState = 0,
			nameText = pg.getFormatText(pg.getGameString("HALLOWEEN_BLEND_REQUIRE_2"), pg.getLocalizationText(materialConfig.materialName)),
			state = self:containsMaterial(requiredMaterialId) and 1 or 0
		}
	end

	return conditionList
end

function EventHalloweenPerfumeBlendingModel:resetSelection()
	self.selectedMaterialIds = {}
	self.selectedMaterialIdSet = {}
	self.flavorChangeValues = {}
end

function EventHalloweenPerfumeBlendingModel:isMaterialSelected(materialId)
	return self.selectedMaterialIdSet[materialId] == true
end

function EventHalloweenPerfumeBlendingModel:removeSelectedMaterial(materialId)
	self.selectedMaterialIdSet[materialId] = nil

	for index, selectedMaterialId in ipairs(self.selectedMaterialIds) do
		if selectedMaterialId == materialId then
			table.remove(self.selectedMaterialIds, index)

			return
		end
	end
end

function EventHalloweenPerfumeBlendingModel:toggleMaterial(materialId)
	local allowedMaterialIdSet = self:getAllowedMaterialIdSet()

	if not allowedMaterialIdSet[materialId] then
		return
	end

	self.flavorChangeValues = {}

	local changeMultiplier

	if self:isMaterialSelected(materialId) then
		self:removeSelectedMaterial(materialId)

		changeMultiplier = -1
	elseif #self.selectedMaterialIds < self.MATERIAL_SELECT_COUNT then
		self.selectedMaterialIds[#self.selectedMaterialIds + 1] = materialId
		self.selectedMaterialIdSet[materialId] = true
		changeMultiplier = 1
	end

	if not changeMultiplier then
		return
	end

	local materialConfig = EventHalloweenMaterialData[materialId]

	for scentType, value in pairs(materialConfig and materialConfig.materiaEffect or {}) do
		self.flavorChangeValues[scentType] = value * changeMultiplier
	end
end

function EventHalloweenPerfumeBlendingModel:getEffectTotals()
	local totals = {}

	for _, materialId in ipairs(self.selectedMaterialIds) do
		local materialConfig = EventHalloweenMaterialData[materialId]

		for scentType, value in pairs(materialConfig and materialConfig.materiaEffect or {}) do
			totals[scentType] = (totals[scentType] or 0) + value
		end
	end

	return totals
end

function EventHalloweenPerfumeBlendingModel:getCurrentMaterialList()
	local materialList = {}

	for slotIndex = 1, self.MATERIAL_SELECT_COUNT do
		local materialId = self.selectedMaterialIds[slotIndex]
		local materialConfig = materialId and EventHalloweenMaterialData[materialId]

		materialList[#materialList + 1] = {
			slotIndex = slotIndex,
			materialId = materialId,
			materialIcon = materialConfig and materialConfig.materiaIcon
		}
	end

	return materialList
end

function EventHalloweenPerfumeBlendingModel:getCurrentFlavorList()
	local effectTotals = self:getEffectTotals()
	local flavorList = {}

	for scentType = self.SCENT_TYPE.SWEET, self.SCENT_TYPE.LIGHT do
		local value = effectTotals[scentType] or 0
		local changeValue = self.flavorChangeValues[scentType] or 0

		flavorList[#flavorList + 1] = {
			scentType = scentType,
			flavorIcon = self.FLAVOR_ICON_URL[scentType],
			valueText = tostring(value),
			changeValueText = changeValue > 0 and "+" .. changeValue or changeValue < 0 and tostring(changeValue) or "",
			changeValueState = changeValue > 0 and 0 or 1,
			popState = changeValue ~= 0 and 1 or 0,
			state = value > 0 and 1 or 0
		}
	end

	return flavorList
end

function EventHalloweenPerfumeBlendingModel:clearFlavorChangeValues()
	self.flavorChangeValues = {}
end

function EventHalloweenPerfumeBlendingModel:checkOperator(actualValue, operatorName, expectedValue)
	if operatorName == "ge" then
		return expectedValue <= actualValue
	elseif operatorName == "le" then
		return actualValue <= expectedValue
	elseif operatorName == "eq" then
		return actualValue == expectedValue
	end

	return false
end

function EventHalloweenPerfumeBlendingModel:containsMaterial(requiredMaterialId)
	return self.selectedMaterialIdSet[requiredMaterialId] == true
end

function EventHalloweenPerfumeBlendingModel:checkBlendRequirements()
	if #self.selectedMaterialIds ~= self.MATERIAL_SELECT_COUNT then
		return false
	end

	local allowedMaterialIdSet = self:getAllowedMaterialIdSet()

	for _, materialId in ipairs(self.selectedMaterialIds) do
		if not allowedMaterialIdSet[materialId] then
			return false
		end
	end

	local petConfig = self:getPetConfig()
	local requirements = petConfig and petConfig.requirements

	if not requirements or not petConfig.petId or self:isPetBlendCompleted(petConfig.petId) then
		return false
	end

	local effectTotals = self:getEffectTotals()

	for requirementType, requirementValue in pairs(requirements) do
		if requirementType == self.SCENT_TYPE.MATERIAL then
			if not self:containsMaterial(requirementValue) then
				return false
			end
		else
			local actualValue = effectTotals[requirementType] or 0

			for operatorName, expectedValue in pairs(requirementValue) do
				if not self:checkOperator(actualValue, operatorName, expectedValue) then
					return false
				end
			end
		end
	end

	return true
end

function EventHalloweenPerfumeBlendingModel:getSelectionViewData()
	return {
		materialCountText = pg.getFormatText(pg.getGameString("HALLOWEEN_BLEND_MATERIAL"), #self.selectedMaterialIds, self.MATERIAL_SELECT_COUNT),
		currentMaterialList = self:getCurrentMaterialList(),
		currentFlavorList = self:getCurrentFlavorList(),
		conditionList = self:getConditionList(),
		canSubmit = self:checkBlendRequirements()
	}
end

function EventHalloweenPerfumeBlendingModel:getViewData()
	return {
		titleText = self:getTitleText(),
		taskTitleText = self:getTaskTitleText(),
		currentPetIconUrl = self:getCurrentPetIconUrl(),
		currentScentTitleText = pg.getGameString("HALLOWEEN_BLEND_STATE"),
		submitButtonText = pg.getGameString("HALLOWEEN_BLEND_NAME_1"),
		materialList = self:getMaterialList()
	}
end

function EventHalloweenPerfumeBlendingModel:getSubmissionData()
	local materialIds = {}

	for _, materialId in ipairs(self.selectedMaterialIds) do
		materialIds[#materialIds + 1] = materialId
	end

	local petConfig = self:getPetConfig()

	return {
		eventId = self:getEventId(),
		petId = petConfig and petConfig.petId,
		materialIds = materialIds
	}
end

return EventHalloweenPerfumeBlendingModel
