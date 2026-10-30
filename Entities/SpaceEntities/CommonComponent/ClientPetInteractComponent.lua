-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientPetInteractComponent.lua

local Class = require("Core.Framework.Class")
local ClientPetInteractComponent = Class.Component("ClientPetInteractComponent")

function ClientPetInteractComponent:ctor()
	return
end

function ClientPetInteractComponent:RPC_SC_PetInteractAction(behaviorType, memberPetIds)
	pg.game.social:onPetInteractAction(self.id, behaviorType, memberPetIds)
end

return ClientPetInteractComponent
