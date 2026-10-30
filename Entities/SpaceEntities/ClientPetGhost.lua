-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientPetGhost.lua

local class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local ClientPawnEntity = require("Entities.ClientPawnEntity")
local ClientConst = require("Const.ClientConst")
local PetData = require("Data.pet_data")
local AddressDataConst = require("Const.AddressDataConst")
local SysConfigData = require("Data.sys_config_data")
local ClientTopLogoComponent = require("Entities.SpaceEntities.CommonComponent.ClientTopLogoComponent")
local ClientMotionComponent = require("Entities.SpaceEntities.CommonComponent.ClientMotionComponent")
local ClientPlayerInteractComponent = require("Entities.SpaceEntities.PlayerComponent.ClientPlayerInteractComponent")
local ClientModelTransmogComponent = require("Entities.SpaceEntities.CommonComponent.ClientModelTransmogComponent")
local ClientPetGhost = class.Class("ClientPetGhost", ClientPawnEntity)

ClientPetGhost.PET_GHOST_PM_PRESET = "Digital_Boss_Blue"

class.AddComponents(ClientPetGhost, {
	ClientTopLogoComponent,
	ClientMotionComponent,
	ClientPlayerInteractComponent,
	ClientModelTransmogComponent
})

function ClientPetGhost:init(dict)
	local result = ClientPetGhost.super.init(self, dict)

	self.masterId = dict.masterId or self.masterId
	self.petGhostFlashElapsed = 0
	self.isPetGhostSpecialMat = false
	self.forbiddenTopLogo = false
	self.topLogoType = ClientConst.TopLogoType.Pet

	self:tryBindMaster()

	return result
end

function ClientPetGhost:tryBindMaster()
	if self.master then
		return true
	end

	if not self.masterId then
		return false
	end

	local master = pg.getEntity(self.masterId)

	if not master then
		return false
	end

	self.master = master
	master.mappingPetGhost = self
	self.uid = master.uid
	self.playerName = master.playerName

	return true
end

function ClientPetGhost:destroy()
	if self.master and self.master.mappingPetGhost == self then
		self.master.mappingPetGhost = nil
	end

	self.master = nil

	ClientPetGhost.super.destroy(self)
end

function ClientPetGhost:ctor(entityId)
	ClientPetGhost.super.ctor(self, entityId)

	self.actorType = Const.ACTOR_TYPE_PET_GHOST
	self.isClientEnt = false
end

function ClientPetGhost:initializeComponents()
	ClientPetGhost.super.initializeComponents(self)

	if self.eModel then
		self:addEModelComponent(Const.COMPONENT_INDEX_IK)
		self:addEModelComponent(Const.COMPONENT_MOTION)
	end
end

function ClientPetGhost:postInitializeComponents()
	ClientPetGhost.super.postInitializeComponents(self)
	self:refreshMappingGhostVisible()
end

function ClientPetGhost:onModelRefreshed()
	ClientPetGhost.super.onModelRefreshed(self)
	self:refreshPetGhostPm()
end

function ClientPetGhost:refreshPetGhostPm()
	if self.eModel and self.eModel.shaderView then
		if self.isPetGhostSpecialMat then
			ClientEffectUtils.PlayPreset(self, ClientPetGhost.PET_GHOST_PM_PRESET, 0, false)
		else
			ClientEffectUtils.StopPreset(self, ClientPetGhost.PET_GHOST_PM_PRESET)
		end
	end
end

function ClientPetGhost:refreshMappingGhostVisible(showPetGhost)
	if showPetGhost == nil then
		showPetGhost = self.isInControl == true
	end

	self:setActive(ClientConst.MODEL_VISIBLE_KEY.MAPPING_GHOST, showPetGhost)
	self:tryBindMaster()

	if self.master then
		self.master.mappingPetGhostVisible = showPetGhost

		self.master:refreshMappingPetGhostVisible()
	end
end

function ClientPetGhost:onIsInControlChange(old, new)
	return
end

function ClientPetGhost:tick(deltaTime)
	ClientPetGhost.super.tick(self, deltaTime)
	self:tryBindMaster()

	local interval = SysConfigData.PLAYER_GHOST_FLASH_INTERVAL
	local normalDuration = interval[1]
	local specialDuration = interval[2]

	self.petGhostFlashElapsed = self.petGhostFlashElapsed + deltaTime

	local isSpecialMat = normalDuration <= self.petGhostFlashElapsed % (normalDuration + specialDuration)

	if self.isPetGhostSpecialMat ~= isSpecialMat then
		self.isPetGhostSpecialMat = isSpecialMat

		self:refreshPetGhostPm()
	end
end

function ClientPetGhost:getTemplateData()
	return PetData[self.templateId] or {}
end

function ClientPetGhost:getEModelResId()
	return AddressDataConst.Ent_Pet
end

function ClientPetGhost:setModelLayer()
	if self.eModel then
		self.eModel:SetModelLayer(ClientConst.LayerDefine.LAYER_PET)
	end
end

function ClientPetGhost:getCsEntityType()
	return ClientConst.ENTITY_CS_TYPE.PET
end

function ClientPetGhost:repr()
	return string.format("ClientPetGhost(entityId=%s, masterId=%s)", self.id, self.masterId)
end

return ClientPetGhost
