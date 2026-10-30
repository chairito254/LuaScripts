-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\SpaceComponent\\ClientSpaceLeylineTreeComponent.lua

local Class = require("Core.Framework.Class")
local ClientSpaceLeylineTreeComponent = Class.Component("ClientSpaceLeylineTreeComponent")

function ClientSpaceLeylineTreeComponent:ctor()
	self.leylineTreeMap = {}
end

function ClientSpaceLeylineTreeComponent:addLeylineTreeMap(entityId, leylineTreeId)
	self.leylineTreeMap[leylineTreeId] = entityId
end

function ClientSpaceLeylineTreeComponent:removeLeylineTreeMap(leylineTreeId)
	self.leylineTreeMap[leylineTreeId] = nil
end

return ClientSpaceLeylineTreeComponent
