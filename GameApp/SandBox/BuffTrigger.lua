-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\BuffTrigger.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local BuffTrigger = Class.LightClass("Sandbox.BuffTrigger", LevelItem)

function BuffTrigger:ctor(sandbox, spawnInfo, syncInfo)
	BuffTrigger.super.ctor(self, sandbox, spawnInfo, syncInfo)

	self.entitiesInTrigger = {}
end

function BuffTrigger:onSandboxReady()
	BuffTrigger.super.onSandboxReady(self)

	if not self.buffSyncTimerId then
		self.buffSyncTimerId = self:addTimer(10, function()
			self:syncBuffState()
		end, true)
	end
end

function BuffTrigger:syncBuffState()
	local entityIds = {}

	for entityId in pairs(self.entitiesInTrigger) do
		if pg.getEntity(entityId) then
			entityIds[#entityIds + 1] = entityId
		else
			self.entitiesInTrigger[entityId] = nil
		end
	end

	self:serverMsg("RPC_CS_SyncBuffState", entityIds)
end

function BuffTrigger:addBuff(entityId)
	self.entitiesInTrigger[entityId] = true

	local entity = pg.getEntity(entityId)

	if entity and entity.isMainAuthority then
		self:serverMsg("RPC_CS_AddBuff", entityId)
	end
end

function BuffTrigger:removeBuff(entityId)
	self.entitiesInTrigger[entityId] = nil

	local entity = pg.getEntity(entityId)

	if entity and entity.isMainAuthority then
		self:serverMsg("RPC_CS_RemoveBuff", entityId)
	end
end

function BuffTrigger:destroy()
	BuffTrigger.super.destroy(self)
end

return BuffTrigger
