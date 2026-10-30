-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenPerfumeResult\\EventHalloweenPerfumeResultModel.lua

local Class = require("Core.Framework.Class")
local EventHalloweenModel = require("Guis.Panels.EventHalloween.EventHalloweenModel")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventHalloweenPerfumeResultModel = Class.LightClass("EventHalloweenPerfumeResultModel", EventHalloweenModel)

function EventHalloweenPerfumeResultModel:ctor()
	EventHalloweenModel.ctor(self)

	self.petId = nil
	self.materialIds = {}
end

function EventHalloweenPerfumeResultModel:setOpenData(info)
	self:setEventId(info and info.eventId)

	self.petId = info and info.petId
	self.materialIds = {}

	for _, materialId in ipairs(info and info.materialIds or {}) do
		self.materialIds[#self.materialIds + 1] = materialId
	end
end

function EventHalloweenPerfumeResultModel:getSubmissionData()
	local materialIds = {}

	for _, materialId in ipairs(self.materialIds) do
		materialIds[#materialIds + 1] = materialId
	end

	return self.petId, materialIds
end

function EventHalloweenPerfumeResultModel:isSubmissionPet(petId)
	return petId ~= nil and self.petId ~= nil and tonumber(petId) == tonumber(self.petId)
end

function EventHalloweenPerfumeResultModel:getPetIconUrl()
	return LuaUIUtils.getPetIconByTemplateId(self.petId, LuaUIUtils.PET_ICON)
end

function EventHalloweenPerfumeResultModel:getPetIndex()
	local activityConfig = self:getActivityConfig()
	local currentPetId = tonumber(self.petId)

	for petIndex, petId in ipairs(activityConfig and activityConfig.blendPet or {}) do
		if tonumber(petId) == currentPetId then
			return petIndex
		end
	end

	return nil
end

function EventHalloweenPerfumeResultModel:getPetDescriptionText()
	local activityConfig = self:getActivityConfig()
	local petIndex = self:getPetIndex()
	local descriptionId = activityConfig and petIndex and activityConfig["blendFinshedDesc" .. petIndex]

	return descriptionId and pg.getLocalizationText(descriptionId) or ""
end

function EventHalloweenPerfumeResultModel:getViewData()
	return {
		petIconUrl = self:getPetIconUrl(),
		petDescriptionText = self:getPetDescriptionText(),
		resultText = pg.getGameString("HALLOWEEN_BLEND_FINISHED")
	}
end

return EventHalloweenPerfumeResultModel
