-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientPetCombatEntityComponent.lua

local class = require("Core.Framework.Class")
local ClientCombatEntityComponent = require("Entities.SpaceEntities.CommonComponent.ClientCombatEntityComponent")
local MessageName = require("Const.MessageName")
local pg = pg
local ClientPetCombatEntityComponent = class.Component("ClientPetCombatEntityComponent", ClientCombatEntityComponent)

function ClientPetCombatEntityComponent:start()
	ClientPetCombatEntityComponent.super.start(self)
end

function ClientPetCombatEntityComponent:getGroupActorId()
	return self.masterActorId
end

function ClientPetCombatEntityComponent:getStamina()
	local master = self:getMasterEntity()

	if master then
		return master:getStamina()
	end

	return 0
end

function ClientPetCombatEntityComponent:getHatredValue(ent)
	local master = self:getMasterEntity()

	if master then
		return master:getHatredValue(ent)
	end

	return 0
end

function ClientPetCombatEntityComponent:getHatred()
	local master = self:getMasterEntity()

	if master then
		return master:getHatred()
	end

	return {}
end

function ClientPetCombatEntityComponent:getBehatredMap()
	local master = self:getMasterEntity()

	if master then
		return master:getBehatredMap()
	end

	return {}
end

function ClientPetCombatEntityComponent:isInCombat()
	local master = self:getMasterEntity()

	if master then
		return master:isInCombat()
	end

	return false
end

function ClientPetCombatEntityComponent:getHatredBossIds()
	local master = self:getMasterEntity()

	if master and master.getHatredBossIds then
		return master:getHatredBossIds()
	end

	return {}
end

function ClientPetCombatEntityComponent:getLockedActorId()
	local master = self:getMasterEntity()

	if master then
		return master.petLockedActorId
	end

	return nil
end

function ClientPetCombatEntityComponent:getMaxEp()
	return self.master and self.master.maxEp or 0
end

function ClientPetCombatEntityComponent:getReducedMaxEp()
	return self.master and self.master:getReducedMaxEp() or 0
end

function ClientPetCombatEntityComponent:getEp()
	return self.master and self.master.curEp or 0
end

return ClientPetCombatEntityComponent
