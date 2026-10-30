-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceCustomizationComponent.lua

local NoticeDef = require("Common.NoticeDef")
local Class = require("Core.Framework.Class")
local AppearanceCustomizationModel = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceCustomizationModel")
local AppearanceFormModelComponent = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormModelComponent")
local AppearanceSuitFormComponent = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceSuitFormComponent")
local AppearanceFormPersistenceComponent = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormPersistenceComponent")
local AppearanceFormResourceComponent = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormResourceComponent")
local AppearanceTailorComponent = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceTailorComponent")
local AppearanceCustomizationComponent = Class.LiteClass("AppearanceCustomizationComponent")

function AppearanceCustomizationComponent:ctor(owner, modelRefresher)
	self.owner = owner
	self.modelRefresher = modelRefresher
	self.disposed = false
	self.model = AppearanceCustomizationModel.new(owner)
	self.formModelComponent = AppearanceFormModelComponent.new(self)
	self.suitFormComponent = AppearanceSuitFormComponent.new(self)
	self.persistence = AppearanceFormPersistenceComponent.new(self)
	self.resources = AppearanceFormResourceComponent.new(self)
	self.tailorComponent = AppearanceTailorComponent.new(self)
end

function AppearanceCustomizationComponent:refreshModels(view)
	assert(not self.disposed, NoticeDef.ERROR_INVALID_STATUS)
	assert(self.modelRefresher, NoticeDef.ERROR_INVALID_CONTEXT)

	return self.modelRefresher(self.owner, view)
end

function AppearanceCustomizationComponent:destroy()
	if self.disposed then
		return
	end

	self.disposed = true
	self.modelRefresher = nil
	self.owner.appearanceCustomizationDisposed = true
	self.model.data.formRequest = nil

	self.resources:cancel()
	self.resources:forget()
	self.formModelComponent:destroy()
	self.suitFormComponent:destroy()
	self.persistence:destroy()
	self.resources:destroy()
	self.tailorComponent:destroy()
	self.model:destroy()

	if self.owner and self.owner.appearanceCustomization == self then
		self.owner.appearanceCustomization = nil
	end

	self.owner = nil
end

return AppearanceCustomizationComponent
