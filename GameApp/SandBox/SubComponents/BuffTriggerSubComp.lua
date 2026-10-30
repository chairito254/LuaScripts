-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\SubComponents\\BuffTriggerSubComp.lua

local Class = require("Core.Framework.Class")
local SubComponent = require("GameApp.Sandbox.SubComponents.SubComponent")
local BuffTriggerSubComp = Class.LightClass("BuffTriggerSubComp", SubComponent)

function BuffTriggerSubComp:ctor(sandbox, spawnInfo, syncInfo)
	BuffTriggerSubComp.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

function BuffTriggerSubComp:getEntityTemplateId(entityId)
	local entity = pg.getEntity(entityId)

	if entity then
		return entity.templateId
	end

	return 0
end

function BuffTriggerSubComp:addBuff(entityId)
	local entity = pg.getEntity(entityId)

	if entity and entity.isMainAuthority then
		self:serverMsg("RPC_CS_AddBuff", entityId)
	end
end

function BuffTriggerSubComp:removeBuff(entityId)
	local entity = pg.getEntity(entityId)

	if entity and entity.isMainAuthority then
		self:serverMsg("RPC_CS_RemoveBuff", entityId)
	end
end

function BuffTriggerSubComp:destroy()
	BuffTriggerSubComp.super.destroy(self)
end

return BuffTriggerSubComp
