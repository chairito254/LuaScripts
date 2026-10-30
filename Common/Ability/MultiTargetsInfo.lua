-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Ability\\MultiTargetsInfo.lua

local Class = require("Core.Framework.Class")
local AbilityConst = require("Common.Const.AbilityConst")
local Utils = require("Common.Utils.Utils")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local CombatLogger = require("Common.Ability.CombatLogger")
local CombatActionTool = require("Common.Ability.CombatActionTool")
local Const = require("Common.Const.Const")
local lume = require("Core.Common.lume")
local MultiTargetsInfo = Class.LiteClass("MultiTargetsInfo")
local pg = pg
local Vector3 = Vector3
local ToBool = ToBool
local IsNil = IsNil

function MultiTargetsInfo:ctor()
	self.center = AbilityConst.COMBAT_TARGET_TYPE_NONE
	self.rotFrom = AbilityConst.COMBAT_TARGET_TYPE_NONE
	self.rotTo = AbilityConst.COMBAT_TARGET_TYPE_NONE
	self.relation = nil
	self.testFun = nil
	self.testEfFun = nil
	self.maxNum = 0
	self.curNum = 0
	self.maxRange = 0
	self.offsetXYZ = nil
	self.offsetRotation = nil
	self.shapeKind = AbilityConst.LX_GEOMETRY_TYPE_INVALID

	if self.shapeArgs then
		lume.clear(self.shapeArgs)
	else
		self.shapeArgs = {}
	end

	self.yOffset = 0
	self.comboCnt = 0
	self.actionData = nil
	self.ownerEntity = nil
	self.abilityId = nil
	self.conditionTypes = nil
	self.combatContext = nil
	self.centerPos = nil
	self.actionIds = nil
	self.actOnEcsSensorActionIds = nil
	self.closestPlayerList = nil
	self.hitTargetInfoList = {}
	self.hitActorIdMap = {}
end

function MultiTargetsInfo:updateHitPosY(entity, combatHitResult)
	if not entity.useHitBox then
		local center = self.centerPos

		if not entity.hasEModelComponent or not entity:hasEModelComponent(Const.COMPONENT_IDX_PHYSX) then
			return
		end

		local entMinHeight, entMaxHeight = entity.eModel:GetHeightRange(Const.COMPONENT_IDX_PHYSX)
		local min = math.max(center.y - self.heightDown, entMinHeight)
		local max = math.min(center.y + self.heightUp, entMaxHeight)

		if max <= min then
			CombatLogger.error("wrong heightRange")

			return
		end

		local centerY = center.y + self.yOffset

		if min <= centerY and centerY <= max then
			combatHitResult.hitPos.y = centerY
		elseif centerY < min then
			local rate = math.random()

			combatHitResult.hitPos.y = min + (max - min) * 0.5 * rate
		else
			local rate = math.random()

			combatHitResult.hitPos.y = max - (max - min) * 0.5 * rate
		end
	end
end

function MultiTargetsInfo:actOnPartPreCheckFun(actorId)
	local entity = pg.getEntityByActorId(actorId)

	if not entity then
		return false
	end

	local actionData = self.actionData
	local ignoreValidTargetFlags = ToBool(actionData.ignoreDashInvincible) and AbilityConst.VALID_TARGET_IGNORE_FLAG.DASH_INVINCIBLE or AbilityConst.VALID_TARGET_IGNORE_FLAG.NONE
	local ownerEntity = self.ownerEntity
	local abilityId = self.abilityId

	if actionData.ignoreOwner and ownerEntity == entity then
		return false
	end

	if actionData.checkCanLock and not Utils.checkValidLock(entity) then
		return false
	end

	if not ownerEntity:checkHitTargetSet(actorId, abilityId, actionData) then
		return false
	end

	if not Utils.checkValidTarget(entity, ownerEntity, ignoreValidTargetFlags) then
		return false
	end

	return true
end

function MultiTargetsInfo.preCheckActOnTarget(actionData, ownerEntity, entity, abilityId)
	local ignoreValidTargetFlags = ToBool(actionData.ignoreDashInvincible) and AbilityConst.VALID_TARGET_IGNORE_FLAG.DASH_INVINCIBLE or AbilityConst.VALID_TARGET_IGNORE_FLAG.NONE

	if actionData.ignoreOwner and ownerEntity == entity then
		return true
	end

	if actionData.checkCanLock and not Utils.checkValidLock(entity) then
		return true
	end

	if not ownerEntity:checkHitTargetSet(entity.actorId, abilityId, actionData) then
		return true
	end

	if not Utils.checkValidTarget(entity, ownerEntity, ignoreValidTargetFlags) then
		return true
	end

	return false
end

function MultiTargetsInfo:processTargetsOperatorFun(actorId, partIdx, hitPosX, hitPosY, hitPosZ, isServerSample)
	local entity = pg.getEntityByActorId(actorId)

	if not entity then
		if not isServerSample and LoggerManager.checkLogger(LoggerConst.ERROR) then
			CombatLogger.error("@jqj entity not found")
		end

		return true
	end

	local isCreation = Utils.isCreation(entity)
	local actionData = self.actionData
	local ownerEntity = self.ownerEntity
	local abilityId = self.abilityId

	if MultiTargetsInfo.preCheckActOnTarget(actionData, ownerEntity, entity, abilityId) then
		return true
	end

	if entity.useHitBox and partIdx == nil then
		if not isServerSample and LoggerManager.checkLogger(LoggerConst.DEBUG) then
			CombatLogger.debug("partIdx is nil")
		end

		return true
	end

	if not Utils.checkRelation(ownerEntity, entity, self.relation) then
		return true
	end

	if self.hitActorIdMap[actorId] then
		return true
	end

	if ToBool(self.maxNum) and self.curNum >= self.maxNum then
		return true
	end

	local combatHitResult = pg.global.abilityMgr.combatHitResultPool:get(true)

	combatHitResult.hitActorId = actorId
	combatHitResult.hitActorPartIdx = partIdx
	combatHitResult.hitPos = Vector3(hitPosX, hitPosY, hitPosZ)

	if not isServerSample then
		ownerEntity:addHitTargetActorId(entity.actorId, abilityId, actionData)
	end

	self.curNum = self.curNum + 1

	local combatHitTargetInfo = pg.global.abilityMgr.runtimeTargetInfoPool:get(true)

	if isCreation then
		combatHitTargetInfo:initTarget(entity.actorId, combatHitResult.hitPos, self.curNum - 1)
	else
		self:updateHitPosY(entity, combatHitResult)
		combatHitTargetInfo:initTarget(actorId, combatHitResult.hitPos, self.curNum - 1, partIdx)
	end

	self.hitActorIdMap[actorId] = true
	self.hitTargetInfoList[#self.hitTargetInfoList + 1] = combatHitTargetInfo:clone()

	pg.global.abilityMgr.runtimeTargetInfoPool:returnObject(combatHitTargetInfo)

	if not isServerSample and pg.component == "client" then
		local ClientSwitch = require("Common.ClientSwitch")

		if ClientSwitch.EnableDrawAbilityGizmo then
			entity:RPC_SC_DrawHitActor(entity:getPosition())
		end
	end

	pg.global.abilityMgr.combatHitResultPool:returnObject(combatHitResult)

	return true
end

function MultiTargetsInfo:actOnTargetsOperatorFun(actorId, partIdx, hitPosX, hitPosY, hitPosZ)
	local result = self:processTargetsOperatorFun(actorId, partIdx, hitPosX, hitPosY, hitPosZ, false)

	return result
end

function MultiTargetsInfo.serverCollectTargetsOperatorFun(actorId, partIdx, hitPosX, hitPosY, hitPosZ)
	local multiTargetsInfo = MultiTargetsInfo.serverCollectTargetsInfo

	if not multiTargetsInfo then
		return true
	end

	local result = multiTargetsInfo:processTargetsOperatorFun(actorId, partIdx, hitPosX, hitPosY, hitPosZ, true)

	return result
end

function MultiTargetsInfo:actOnEcsSensorOperatorFun(actorId)
	local entity = pg.getEntityByActorId(actorId)

	if not Utils.isEnvObj(entity) then
		return true
	end

	local actionIds = self.actOnEcsSensorActionIds

	if actionIds then
		local actionData = self.actionData
		local ownerEntity = self.ownerEntity
		local combatContext = self.combatContext
		local combatHitResult = pg.global.abilityMgr.combatHitResultPool:get(true)

		combatHitResult.hitActorId = actorId

		local combatHitTargetInfo = pg.global.abilityMgr.runtimeTargetInfoPool:get(true)

		combatHitTargetInfo:initTarget(entity.actorId)

		local guardVal = pg.global.abilityMgr.guardValuePool:getWithCtor(true, combatContext, "runtimeTargetInfo", combatHitTargetInfo)

		pg.global.abilityMgr.combatAction:doActionIds(actionIds, combatContext)
		pg.global.abilityMgr.runtimeTargetInfoPool:returnObject(combatHitTargetInfo)
		guardVal:recover()
		pg.global.abilityMgr.guardValuePool:returnObject(guardVal)
		pg.global.abilityMgr.combatHitResultPool:returnObject(combatHitResult)
	end

	return true
end

return MultiTargetsInfo
