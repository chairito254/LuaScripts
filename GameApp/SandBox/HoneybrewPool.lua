-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\HoneybrewPool.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local HoneybrewPool = Class.LightClass("HoneybrewPool", LevelItem)

function HoneybrewPool:onSandboxReady()
	HoneybrewPool.super.onSandboxReady(self)

	self.honeybrewPoolSB = self.shell:GetComponentById(self.spawnInfo.majorCompId)

	if self.pendingPollenEntityId then
		self:RPC_SC_SubmitPollenClumps(self.pendingPollenEntityId)
	end
end

function HoneybrewPool:RPC_SC_SubmitPollenClumps(entityId)
	local ent = pg.getEntity(entityId)

	if ent and not ent.destroyed then
		ent:clearInteractTrigger()
	end

	if not NotNil(self.honeybrewPoolSB) then
		self.pendingPollenEntityId = entityId

		return
	end

	self.pendingPollenEntityId = nil

	self.honeybrewPoolSB:StartPollenSubmission(entityId)
end

function HoneybrewPool:destroy()
	self.pendingPollenEntityId = nil
	self.honeybrewPoolSB = nil

	HoneybrewPool.super.destroy(self)
end

return HoneybrewPool
