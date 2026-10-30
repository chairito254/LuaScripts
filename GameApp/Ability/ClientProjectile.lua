-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Ability\\ClientProjectile.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local Class = require("Core.Framework.Class")
local Projectile = require("Common.Ability.Projectile.Projectile")
local ClientDebugUtils = require("Utils.ClientDebugUtils")
local AbilityConst = require("Common.Const.AbilityConst")
local PhysicsLayerConst = require("Common.Const.PhysicsLayerConst")
local Const = require("Common.Const.Const")
local CombatLogger = require("Common.Ability.CombatLogger")
local ClientSwitch = require("Common.ClientSwitch")
local Utils = require("Utils.Utils")
local ProjectileConst = require("Common.Const.ProjectileConst")
local CombatActionTool = require("Common.Ability.CombatActionTool")
local VoxelUtils = require("Common.Utils.VoxelUtils")
local AbilityUtils = require("Common.Utils.AbilityUtils")
local EffectConst = require("Const.EffectConst")
local ClientAbilityUtils = require("Utils.ClientAbilityUtils")
local ClientAbilityConst = require("Const.ClientAbilityConst")
local ListPool = require("Common.Container.ListPool")
local AoiLodConst = require("Common.Const.AoiLodConst")
local SysConfigData = require("Data.sys_config_data")
local GameObject = CS.UnityEngine.GameObject
local GroundLayers = CS.FunPlus.WorldX.Const.LayerDefine.STABLE_GROUND_LAYERS
local InitProjectileTrans = CS.FunPlus.WorldX.Manager.AbilityManager.InitProjectileTrans
local ClientProjectile = Class.LiteClass("ClientProjectile", Projectile)
local Vector3 = Vector3
local pg = pg
local ToBool = ToBool
local Quaternion = Quaternion
local bit = bit
local dir = Vector3()
local oldPos = Vector3()
local hasBounciness = false
local bonuncinessInitPos = Vector3()

ClientProjectile.currentProjectile = nil

function ClientProjectile:init(projectileParams, callCtor)
	if not Projectile.init(self, projectileParams, callCtor) then
		return false
	end

	self.effectInstanceId = 0
	self.isGroundDestroyed = false
	self.projectileSoundStarted = false
	self.projectileSoundId = nil
	self.cachedChemHitInfoTemplate = nil
	self.cachedHitPoint = self.cachedHitPoint or Vector3()
	self.cachedHitNormal = self.cachedHitNormal or Vector3()

	return true
end

function ClientProjectile:activate(deltaSeconds)
	Vector3.Copy(oldPos, self.pos)

	local activateResult = Projectile.activate(self, deltaSeconds)

	if activateResult == false then
		return
	end

	if self.isSleeping then
		if self.csObjTrans then
			self.csObjTrans:SetPositionAndRotation(self.pos, self.rot)
		elseif self.effectInstanceId and self.isSetEffectConfigPos then
			self.owner.eModel:UpdateEffectPosRot(Const.COMPONENT_INDEX_EFFECT, self.effectInstanceId, self.pos, self.rot)
		end

		return
	end

	if self.isDestroyed then
		return
	end

	self:tickHeightAboveGround(oldPos, deltaSeconds)

	local newPos = Vector3.getFromCache()

	newPos:Copy(self.pos)
	Vector3.enableCreateFromCache()

	local offset = self.pos - oldPos

	if offset.x == 0 and offset.y == 0 and offset.z == 0 then
		offset = self.rot * Vector3.forward * 0.001

		dir:Copy(offset)
		dir:SetNormalize()
	else
		dir:Copy(offset)
		dir:SetNormalize()
	end

	local groundSweepRadius = self.groundSweepRadius or -1

	if groundSweepRadius < 0 and self.projectileTemplate.groundDestroy ~= false then
		groundSweepRadius = self.sweepRadius or 0.1
	end

	local moveDistance = Vector3.Magnitude(offset)

	Vector3.disableCreateFromCache()

	if self.cachedChemHitInfoTemplate ~= true then
		self.physicsImpulse = ClientAbilityUtils.getImpulse(self.srcAbilityId, self.projectileTemplate.impulseId)
		self.elementLevel = ClientAbilityUtils.getElementLevel(self.owner, self.combatContext, self.chemElementId)
		self.elementValue, self.ecsElementValue, self.instanceDmgRateV = CombatActionTool.getElementValue(self.projectileTemplate, self.combatContext)
		self.cachedChemHitInfoTemplate = true
	end

	pg.global.physicsMgr:SetChemHitInfo(self.owner.actorId, self.srcAbilityId or 0, self.chemElementId or 0, self.physicsImpulse or 0, self.elementLevel, self.elementValue, self.ecsElementValue, self.instanceDmgRateV)

	hasBounciness = false

	local isSweepSphere = self.projectileTemplate.sweepShape == ClientAbilityConst.ProjectileSweepShape.Sphere

	ClientProjectile.currentProjectile = self

	local isDestroyByECS = pg.global.physicsMgr:ProjectileCast(oldPos, self.rot, isSweepSphere and AbilityConst.LX_GEOMETRY_TYPE_SPHERE or AbilityConst.LX_GEOMETRY_TYPE_BOX, isSweepSphere and self.sweepRadius or self.projectileTemplate.sweepBoxSize[1], isSweepSphere and 0 or self.projectileTemplate.sweepBoxSize[2], isSweepSphere and 0 or self.projectileTemplate.sweepBoxSize[3], groundSweepRadius, dir, moveDistance, 0, false, self.projectileTemplate.hasAttackDataInOnProjectileHit ~= false)

	ClientProjectile.currentProjectile = nil

	pg.global.physicsMgr:ClearChemHitInfo()

	if ClientSwitch.EnableDrawAbilityGizmo then
		if isSweepSphere then
			ClientDebugUtils.drawDebugHitBoxMesh(oldPos, self.rot, AbilityConst.LX_GEOMETRY_TYPE_SPHERE, {
				self.sweepRadius
			})
		else
			ClientDebugUtils.drawDebugHitBoxMesh(oldPos, self.rot, AbilityConst.LX_GEOMETRY_TYPE_BOX, {
				self.projectileTemplate.sweepBoxSize[1] * 0.5,
				self.projectileTemplate.sweepBoxSize[2] * 0.5,
				self.projectileTemplate.sweepBoxSize[3] * 0.5
			})
		end
	end

	if not hasBounciness then
		self.pos:Copy(newPos)
	else
		self.pos:Copy(bonuncinessInitPos)

		hasBounciness = false
	end

	if self.csObjTrans then
		self.csObjTrans:SetPositionAndRotation(self.pos, self.rot)
	elseif self.effectInstanceId and self.isSetEffectConfigPos then
		self.owner.eModel:UpdateEffectPosRot(Const.COMPONENT_INDEX_EFFECT, self.effectInstanceId, self.pos, self.rot)
	end

	Vector3.returnToCache(newPos)

	if isDestroyByECS and not self.isDestroyed then
		self:destroy()
	end

	if ToBool(self.arriveDestination) and not self.isDestroyed then
		self:destroy()
	end

	if not self.isDestroyed and self.curTime >= self.duration then
		if not self.destroyImmediately then
			self:onResetToProjectile()

			return
		end

		self:destroy()

		return
	end
end

function ClientProjectile:tickHeightAboveGround(lastPos, deltaSeconds)
	if ToBool(self.heightAboveGround) and ToBool(self.noGravity) then
		Vector3.enableCreateFromCache()

		local nextVelocity = self.velocity
		local nextMoveSpeed = self.moveSpeed
		local raycastPos = self.pos + Vector3.constUp * self.projectileTemplate.maxHeightOffset

		Vector3.disableCreateFromCache(raycastPos)

		local hitInfo, succ = pg.global.physicsMgr:GetRaycastInfo(raycastPos, Vector3.constDown, self.projectileTemplate.maxHeightOffset * 2, GroundLayers)

		Vector3.enableCreateFromCache()

		if succ and self.projectileTemplate.stickPitchMaxOffset then
			local normal = hitInfo.normal
			local ratio = math.abs(Vector3.Magnitude(Vector3(normal.x, 0, normal.z)))
			local slopeAngle = 90 - math.acos(ratio) * math.rad2Deg

			if slopeAngle >= self.projectileTemplate.stickPitchMaxOffset then
				Vector3.disableCreateFromCache()

				return
			end
		end

		local heightGround = succ and self.pos.y - hitInfo.point.y or 0

		if succ and heightGround > self.heightAboveGround and self.gravityVelocity.y <= 0 then
			local preVelocity = self.velocity + self.gravityVelocity

			self.gravityVelocity:Copy(self.gravityVelocity + Vector3(0, -self.projectileTemplate.stickGravity * SysConfigData.g, 0) * deltaSeconds)

			nextVelocity = self.startDir * nextMoveSpeed

			local vt = nextVelocity + self.gravityVelocity
			local deltaY = ((vt + preVelocity) * deltaSeconds * 0.5).y
			local groundY = self.pos.y + self.heightAboveGround - heightGround

			if groundY > self.pos.y + deltaY then
				self.pos.y = groundY

				Vector3.disableCreateFromCache()

				return
			else
				self.pos.y = self.pos.y + deltaY

				Vector3.disableCreateFromCache()

				return
			end
		end

		if succ then
			self.gravityVelocity:Set(0, 0, 0)

			local validPosY = true
			local newPos = Vector3.Clone(self.pos)

			newPos.y = self.pos.y + self.heightAboveGround - heightGround

			local offset = newPos - lastPos

			if self.projectileTemplate.maxHeightOffset and offset.y > 0 and offset.y > self.projectileTemplate.maxHeightOffset then
				newPos.y = lastPos.y + math.sign(offset.y) * self.projectileTemplate.maxHeightOffset
			end

			if validPosY then
				self.pos:Copy(newPos)
			end
		elseif self.projectileTemplate.stickGravity then
			local preVelocity = self.velocity + self.gravityVelocity

			self.gravityVelocity:Copy(self.gravityVelocity + Vector3(0, -self.projectileTemplate.stickGravity * SysConfigData.g, 0) * deltaSeconds)

			nextVelocity = self.startDir * nextMoveSpeed

			local vt = nextVelocity + self.gravityVelocity
			local deltaY = ((vt + preVelocity) * deltaSeconds * 0.5).y

			self.pos.y = self.pos.y + deltaY
		end

		Vector3.disableCreateFromCache()
	end
end

function ClientProjectile:hasColliderLayer(layer, colliderLayer, colliderLayers)
	if colliderLayers ~= 0 then
		local mask = 2^layer

		return bit.band(colliderLayers, mask) == mask
	end

	return colliderLayer == layer
end

function ClientProjectile:onHitCollider(hitPoint, hitNormal, hitDistance, colliderTrigger, colliderLayer, colliderLayers, physxTagType, physxTagId, physxPartIdx, hasPhysxComponent, physxComponent)
	if colliderTrigger and physxComponent and physxTagType == Const.TAG_INTERACT_PROJ and physxComponent.onProjectileHit then
		physxComponent.onProjectileHit(self)

		if self.isDestroyed and LoggerManager.checkLogger(LoggerConst.DEBUG) then
			CombatLogger.debug("projectile destroy by onProjectileHit callback", self.owner.actorId, self.instanceId)
		end

		self.curHitIdx = self.curHitIdx + 1

		return true
	end

	if physxComponent and physxTagType == Const.TAG_INTERACT_ATTACK and physxComponent.onAttackHit then
		if hitPoint.x == 0 and hitPoint.y == 0 and hitPoint.z == 0 then
			physxComponent.onAttackHit(self.owner.actorId, self.pos.x, self.pos.y, self.pos.z)
		else
			physxComponent.onAttackHit(self.owner.actorId, hitPoint.x, hitPoint.y, hitPoint.z)
		end

		return false
	end

	if self:hasColliderLayer(PhysicsLayerConst.eGround, colliderLayer, colliderLayers) or self:hasColliderLayer(PhysicsLayerConst.eDefault, colliderLayer, colliderLayers) then
		if colliderTrigger then
			return false
		end

		if self.projectileTemplate.onProjectileGroundedIds or self.projectileTemplate.bounciness then
			self.pos:Copy(hitPoint)
			self:onGrounded(hitPoint, hitNormal, hitDistance)
		end

		if self.projectileTemplate.groundDestroy ~= false then
			if hitPoint.x ~= 0 or hitPoint.y ~= 0 or hitPoint.z ~= 0 then
				self.pos:Copy(hitPoint)
			end

			self.isGroundDestroyed = true

			self:destroy()
		end

		return false
	end

	if self:hasColliderLayer(PhysicsLayerConst.eWater, colliderLayer, colliderLayers) then
		if self.projectileTemplate.waterDestroy == true then
			if hitPoint.x ~= 0 or hitPoint.y ~= 0 or hitPoint.z ~= 0 then
				self.pos:Copy(hitPoint)
			end

			self.isGroundDestroyed = true

			self:destroy()
		end

		return false
	end

	if self.isDestroyed then
		return true
	end

	if not hasPhysxComponent then
		if not ToBool(self.projectileTemplate.ignoreNonActorCollision) and (self.projectileType ~= ProjectileConst.PROJECTILE_TYPE_TRACKING or ToBool(self.maxReboundCnt) == false) then
			self.curHitIdx = self.curHitIdx + 1

			return false
		end

		return false
	end

	if ToBool(self.projectileTemplate.ignoreActorCollision) then
		return false
	end

	local tagType = physxTagType

	if tagType == Const.TAG_ACTOR then
		local actorId = physxTagId
		local hitEntity = pg.getEntityByActorId(actorId)

		if hitEntity and hitEntity.isRobSpaceEgg then
			hitEntity = hitEntity:getMasterEntity() or hitEntity
			actorId = hitEntity.actorId
		end

		if hitEntity == nil then
			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				CombatLogger.error("@jqj Projectile:triggerCallback hitEntity is nil", actorId)
			end

			return false
		end

		if not self.projectileTemplate.allowHitCaster and self.owner.actorId == actorId then
			return false
		end

		if ToBool(self.projectileTemplate.ignoreNonCurPetCollision) and Utils.isPlayer(self.owner) and self.owner.curCombatPetId ~= hitEntity.id then
			return false
		end

		if hitEntity.canBeHit ~= nil and not ToBool(hitEntity.canBeHit) then
			return false
		end

		if self.projectileType == ProjectileConst.PROJECTILE_TYPE_TRACKING and ToBool(self.maxReboundCnt) then
			return false
		end

		if self.projectileType == ProjectileConst.PROJECTILE_TYPE_TRACKING and actorId == self.srcActorId then
			return false
		end

		local actorPartIdx = physxPartIdx

		if hitEntity.useHitBox and actorPartIdx == 0 then
			if LoggerManager.checkLogger(LoggerConst.DEBUG) then
				CombatLogger.debug("not hit part, ignore", hitEntity.actorId)
			end

			return false
		end

		local combatHitResult = pg.global.abilityMgr.combatHitResultPool:getWithCtor(true, actorId, hitPoint, actorPartIdx)

		self:onHitTarget(combatHitResult)
		pg.global.abilityMgr.combatHitResultPool:returnObject(combatHitResult)

		if actorPartIdx > 0 then
			return true
		end

		return false
	end

	return false
end

function ClientProjectile.raycastCallback()
	local self = ClientProjectile.currentProjectile

	if self == nil then
		return
	end

	local abilityMgr = pg.global.abilityMgr
	local raycastCache = abilityMgr.cacheRaycastHit
	local physxCache = abilityMgr.cachePhysxComponent
	local hitPoint = self.cachedHitPoint
	local hitNormal = self.cachedHitNormal

	hitPoint:Set(raycastCache[1], raycastCache[2], raycastCache[3])
	hitNormal:Set(raycastCache[4], raycastCache[5], raycastCache[6])

	local hitDistance = raycastCache[7]
	local colliderTrigger = raycastCache[9] ~= 0
	local colliderLayer = raycastCache[10]
	local colliderLayers = raycastCache[11]
	local physxTagType = physxCache[1]
	local physxTagId = physxCache[2]
	local physxPartIdx = physxCache[3]
	local hasPhysxComponent = physxCache[4] ~= 0
	local physxComponent

	if physxTagType == Const.TAG_INTERACT_PROJ or physxTagType == Const.TAG_INTERACT_ATTACK then
		physxComponent = CS.FunPlus.WorldX.Manager.PhysicsManager.GetCurrentProjectilePhysxComponent()
	end

	Vector3.enableCreateFromCache()
	self.pos:Copy(oldPos + dir * hitDistance)
	Vector3.disableCreateFromCache()

	local isEnd = self:onHitCollider(hitPoint, hitNormal, hitDistance, colliderTrigger, colliderLayer, colliderLayers, physxTagType, physxTagId, physxPartIdx, hasPhysxComponent, physxComponent)

	if self.curHitIdx >= 1 and not self.isDestroyed then
		if self.destroyOnHit then
			if self.destroyImmediately then
				self:destroy()
			else
				self:onResetToProjectile()
			end
		elseif self.curHitIdx >= self.maxHitNum then
			self:destroy()

			isEnd = true
		else
			isEnd = false
		end
	end

	raycastCache[12] = (isEnd or self.isDestroyed) and 1 or 0
end

function ClientProjectile:onStart(isRest)
	self.destination = nil

	Projectile.onStart(self)

	if not isRest then
		self.isSetEffectConfigPos = nil

		if ClientProjectile.projEffectId then
			self.effectInstanceId = ClientProjectile.projEffectId
			self.isSetEffectConfigPos = true
		else
			self:addGameObject()
			self:addEffect()
		end
	end

	self:startProjectileAudio()
end

function ClientProjectile:addEffect()
	if ToBool(self.projectileTemplate.effectId) and self.csObjTrans ~= nil then
		local effectId = pg.global.abilityMgr.combatAction:getVal(self.projectileTemplate.effectId, self.combatContext)

		self.effectInstanceId = ClientAbilityUtils.playProjectileEffect(self.owner, self.effectGeneratorId, effectId, self.csObjTrans, self.effectTimeInitOffset, self.combatContext)
	end
end

function ClientProjectile:addGameObject()
	if GameObject ~= nil then
		self.csObjTrans = pg.global.abilityMgr.projectileCSObjPool:get(true)

		local isSyncInstantiate = pg.game.setting.curVideoQuality == Const.VIDEO_QUALITY.HIGH and (Utils.isBoss(self.owner) or self.owner == pg.pawn)

		self.effectGeneratorId = InitProjectileTrans(self.csObjTrans, self.scale or 1, self.pos, self.rot, self.owner.eModel, isSyncInstantiate)

		if self.owner.effReplaceMap then
			for replaceKey, _ in pairs(self.owner.effReplaceMap) do
				pg.global.effectMgr:AddReplaceEffectKey(self.effectGeneratorId, replaceKey)
			end
		end
	end
end

function ClientProjectile:startProjectileAudio()
	if self.projectileSoundStarted or not ToBool(self.soundId) or not self.csObjTrans then
		return
	end

	local combatRTPCType = ClientAbilityUtils.getCombatRTPCType(self.combatContext)

	pg.game.audio:playCombat(self.soundId, self.csObjTrans.gameObject, combatRTPCType)

	self.projectileSoundStarted = true
	self.projectileSoundId = self.soundId
end

function ClientProjectile:stopProjectileAudio()
	if not self.projectileSoundStarted or not self.csObjTrans then
		self.projectileSoundStarted = false
		self.projectileSoundId = nil

		return
	end

	pg.game.audio:stopEvent(self.projectileSoundId, self.csObjTrans.gameObject, 0.1)

	self.projectileSoundStarted = false
	self.projectileSoundId = nil
end

function ClientProjectile:onDestroy()
	if ClientSwitch.EnableDrawAbilityGizmo then
		ClientDebugUtils.drawDebugHitBoxMesh(self.pos, self.rot, AbilityConst.LX_GEOMETRY_TYPE_SPHERE, {
			self.sweepRadius
		})
	end

	self:stopProjectileAudio()

	if self.effectInstanceId and self.effectInstanceId ~= 0 and not self.isSetEffectConfigPos then
		pg.game.effect:stopEffect(self.effectGeneratorId, self.effectInstanceId, false, true)

		self.effectInstanceId = nil
	end

	if self.effectGeneratorId then
		pg.game.effect:destroyGenerator(self.effectGeneratorId)

		self.effectGeneratorId = nil
	end

	if self.csObjTrans then
		pg.global.abilityMgr.projectileCSObjPool:returnObject(self.csObjTrans)

		self.csObjTrans = nil
	elseif self.effectInstanceId and self.isSetEffectConfigPos then
		self.owner:stopEffectById(self.effectInstanceId)
	end

	Projectile.onDestroy(self)
end

function ClientProjectile:changeEffectSpeed(speed)
	pg.game.effect:setPlaySpeed(self.effectGeneratorId, speed, 1)
end

function ClientProjectile:isServerMsgRPCForbidden()
	return not self.combatContext or self.combatContext.constCasterInfo and self.combatContext.constCasterInfo.castSource == AbilityConst.CAST_SOURCE.DIALOGUE_GRAPH
end

function ClientProjectile:onProjectileHitRPC(srcEntity, combatHitResult, nextReboundActorId)
	if self:isServerMsgRPCForbidden() then
		return
	end

	if srcEntity ~= nil then
		if srcEntity.authority == Const.AUTHORITY_MASTER then
			if LoggerManager.checkLogger(LoggerConst.DEBUG) then
				CombatLogger.debug("RPC_CS_ProjectileHitTarget", self.instanceId, nextReboundActorId)
			end

			srcEntity:serverMsgNoGC("RPC_CS_ProjectileHitTarget", self.instanceId, combatHitResult, self.pos, self.rot, self.curTime, nextReboundActorId or 0)
		elseif srcEntity.authority == Const.AUTHORITY_AUTONOMOUS_PROXY then
			local isSendHit = false
			local hitEnt = pg.getEntityByActorId(combatHitResult.hitActorId)

			if hitEnt.authorityId == pg.me.id then
				isSendHit = true
			else
				local closestPlayerList = ListPool.getList(1)

				srcEntity:entitiesInRangeWithTable(AoiLodConst.default_aoi_range / 100, Const.SEARCH_USR_TYPE_PLAYER, 3, closestPlayerList)

				for i = 1, 3 do
					if closestPlayerList[i] == pg.me.actorId then
						isSendHit = true

						break
					end
				end

				ListPool.returnList(closestPlayerList, 1)
			end

			if isSendHit then
				if not self.hitEventName then
					self.hitEventName = AbilityUtils.getHitEventName(self.combatContext, self.instanceId)
				end

				pg.me:serverMsgNoGC("RPC_CS_NotifyProjHit", srcEntity.actorId, srcEntity:getGameTime(), self.combatContext.id, self.hitEventName, combatHitResult)
			end
		end
	end
end

function ClientProjectile:onProjectileFinishRPC()
	if self:isServerMsgRPCForbidden() then
		return
	end

	if self.owner.authority ~= Const.AUTHORITY_SIMULATED_PROXY then
		self.owner:serverMsgNoGC("RPC_CS_ProjectileFinish", self.instanceId, self.pos:getRawTable(), self.rot:getRawTable())
	end
end

function ClientProjectile:onDestroyRPC()
	if self:isServerMsgRPCForbidden() then
		return
	end

	if self.owner.authority ~= Const.AUTHORITY_SIMULATED_PROXY then
		self.owner:serverMsgNoGC("RPC_CS_ProjectileDestroy", self.instanceId, self.pos, self.rot)
	end
end

function ClientProjectile:onProjectileResetRPC()
	if self:isServerMsgRPCForbidden() then
		return
	end

	if self.owner.authority == Const.AUTHORITY_MASTER then
		self.owner:serverMsgNoGC("RPC_CS_ProjectileReset", self.instanceId, self.pos, self.rot, self.combatContext.id, self.combatContext.nodeMap)
	end
end

function ClientProjectile:getHitPosition(targetEntity)
	if not targetEntity.projHitPos then
		targetEntity.projHitPos = Vector3()
	end

	local hitPosition = targetEntity.projHitPos

	if Utils.isCreation(targetEntity) then
		return Projectile.getHitPosition(self, targetEntity)
	elseif Utils.isEnvObj(targetEntity) then
		return targetEntity:getLockPartPosition()
	end

	local entityConfigData = Utils.getEntityConfigData(targetEntity)

	if entityConfigData.projTrackingBone then
		local valid, pos = targetEntity.eModel.modelSkeletonView:TryGetBonePos(entityConfigData.projTrackingBone)

		if not valid then
			return Projectile.getHitPosition(self, targetEntity)
		end

		hitPosition:Copy(targetEntity:getPosition())

		local heightOffset = pos.y - hitPosition.y

		Vector3.enableCreateFromCache()

		local plusVector3 = Vector3(0, heightOffset, 0) + self.trackingRandomOffset

		hitPosition:Copy(hitPosition + targetEntity:getRotation():MulVec3(plusVector3))
		Vector3.disableCreateFromCache()

		return hitPosition
	else
		return Projectile.getHitPosition(self, targetEntity)
	end
end

local shapeArgsCache = {}
local effectExtInfoCache = {}

function ClientProjectile:onProjectileFinish()
	if self.projectileTemplate.ignoreAbilityElement ~= true then
		local conditionTypes = pg.global.abilityMgr.combatAction:getConditionTypes(self.combatContext, self.projectileTemplate)

		shapeArgsCache[1] = math.max(0.2, self.sweepRadius)

		local shape = CombatActionTool.getShape(AbilityConst.LX_GEOMETRY_TYPE_SPHERE, shapeArgsCache)

		shape.center = self.pos:Clone()
		shape.rot = 0

		for _, conditionType in ipairs(conditionTypes) do
			local reactionName = AbilityConst.CONDITION_NUM_TO_STR[conditionType]

			VoxelUtils.doVoxelReact(self.projectileMgr.space.id, reactionName, AbilityConst.LX_GEOMETRY_TYPE_SPHERE, shape)
		end

		CombatActionTool.returnShape(shape)

		if self.isGroundDestroyed then
			if self.projectileTemplate.defaultHitSoundType then
				local elementType = pg.global.abilityMgr:getAbilityParamData(self.srcAbilityId).elementType
				local combatRTPCType = ClientAbilityUtils.getCombatRTPCType(self.combatContext, nil, true)

				pg.game.audio:playProjectileHit(elementType, self.projectileTemplate.defaultHitSoundType, self.pos, combatRTPCType)
			end

			if self.projectileTemplate.defaultHitEffect then
				effectExtInfoCache.position = self.pos
				effectExtInfoCache.rotation = self.rot:ToEulerAngles()
				effectExtInfoCache.mountType = EffectConst.MountType.World
				effectExtInfoCache.followType = EffectConst.FollowType.Global

				ClientAbilityUtils.setCombatAudioInfo(effectExtInfoCache, self.combatContext, nil, true)
				self.owner:playEffect(self.projectileTemplate.defaultHitEffect, effectExtInfoCache)
			end
		end
	end

	Projectile.onProjectileFinish(self)
end

function ClientProjectile:onGrounded(hitPoint, hitNormal, hitDistance)
	if not self.projectileTemplate.groundDestroy and self.projectileTemplate.bounciness and hitDistance ~= 0 then
		hasBounciness = true

		local velocity = self.velocity + self.gravityVelocity
		local refVelocity = Vector3.Reflect(velocity, hitNormal) * self.projectileTemplate.bounciness

		self.velocity:Set(refVelocity.x, refVelocity.y, refVelocity.z)
		self.gravityVelocity:Set(0, 0, 0)
		self.startDir:Copy(refVelocity)
		self.startDir:SetNormalize()

		self.moveSpeed = Vector3.Magnitude(refVelocity)

		bonuncinessInitPos:Copy(hitPoint)
	end

	if not self:isServerMsgRPCForbidden() then
		if self.owner.authority == Const.AUTHORITY_MASTER then
			self.owner:serverMsgNoGC("RPC_CS_ProjectileOnGround", self.instanceId, self.pos, self.rot)
		else
			local isSendHit = false
			local attackEnt = pg.getEntityByActorId(self.owner:getAttackTargetActorId())
			local attackPlayer = Utils.getMasterPlayer(attackEnt)

			if attackPlayer and attackPlayer.authorityId == pg.me.id then
				isSendHit = true
			else
				local closestPlayerList = ListPool.getList(1)

				self.owner:entitiesInRangeWithTable(AoiLodConst.default_aoi_range / 100, Const.SEARCH_USR_TYPE_PLAYER, 3, closestPlayerList)

				for i = 1, 3 do
					if closestPlayerList[i] == pg.me.actorId then
						isSendHit = true

						break
					end
				end

				ListPool.returnList(closestPlayerList, 1)
			end

			if isSendHit then
				pg.me:serverMsgNoGC("RPC_CS_ProjectileOnGround", self.instanceId, self.pos, self.rot)
			end
		end
	end

	Projectile.onGrounded(self, hitNormal)
end

return ClientProjectile
