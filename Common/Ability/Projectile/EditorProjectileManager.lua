-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Ability\\Projectile\\EditorProjectileManager.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local Class = require("Core.Framework.Class")
local ProjectileConst = require("Common.Const.ProjectileConst")
local Const = require("Common.Const.Const")
local ProjectileManager = require("Common.Ability.Projectile.ProjectileManager")
local LoggerManager = require("Core.Log.LoggerManager")
local CombatLogger = require("Common.Ability.CombatLogger")
local SkillBPDebugData = CS.FunPlus.WorldX.FlowCanvas.SkillBPRuntimeData
local EditorProjectileManager = Class.LiteClass("EditorProjectileManager", ProjectileManager)

function EditorProjectileManager:tick(deltaTime)
	for instanceId, projectile in pairs(self.projectileMap) do
		projectile:activate(deltaTime)
	end
end

function EditorProjectileManager:addProjectile(projectileParams, combatContext)
	local projectile = self:newProjectile(projectileParams)

	if not projectile then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			CombatLogger.error("projectile init failed", projectileParams.templateId, projectileParams.instanceId, projectileParams.srcActorId)
		end

		return nil
	end

	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		CombatLogger.debug("addProjectile", projectileParams.templateId, projectileParams.instanceId)
	end

	if not projectile:loadDataFromTemplate() then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			CombatLogger.error("projectile loadDataFromTemplate failed", projectileParams.templateId, projectileParams.srcActorId, projectileParams.projectileType)
		end

		projectile:clear()

		self.projFreeList[#self.projFreeList + 1] = projectile

		return nil
	end

	self.curProjNum = self.curProjNum + 1
	self.projectileMap[projectileParams.instanceId] = projectile

	projectile:start()
	SkillBPDebugData.CallXLuaEntServerMsgNoCb(projectileParams.srcActorId, "RPC_CS_DebugModeAddProjectile", {
		projectileParams,
		combatContext.id
	})

	return projectile
end

return EditorProjectileManager
