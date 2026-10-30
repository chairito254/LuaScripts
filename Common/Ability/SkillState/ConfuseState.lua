-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Ability\\SkillState\\ConfuseState.lua

local LoggerConst = require("Core.Log.LoggerConst")
local Class = require("Core.Framework.Class")
local SkillState = require("Common.Ability.SkillState.SkillState")
local AbilityConst = require("Common.Const.AbilityConst")
local LoggerManager = require("Core.Log.LoggerManager")
local CombatLogger = require("Common.Ability.CombatLogger")
local Const = require("Common.Const.Const")
local ConflictTypes = require("Common.ConflictTypes")
local lume = require("Core.Common.lume")
local AiConst = require("Common.Const.AiConst")
local Utils = require("Common.Utils.Utils")
local AbilitySettingGlobalConstData = require("Data.ability_setting_global_const_data")
local AIControllerUtils = require("Common.Utils.AIControllerUtils")
local AutoPathFindUtils = require("Common.Utils.AutoPathFindUtils")
local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local pg = pg
local Vector3 = Vector3
local Quaternion = Quaternion
local CONFUSE_MOVE_EXCLUDE_STATES = {
	HIT_ST = true,
	CONFUSE_ST = true
}
local CONFUSE_MOVE_EXCLUDE_CANCEL_STATES = {
	PATHFINDING_ST = true
}
local CONFUSE_AI_MOVE_TARGET_DISTANCE = 100
local CONFUSE_AI_DIRECTION_DOT_THRESHOLD = 0.996
local ConfuseState = Class.LiteClass("ConfuseState", SkillState)

function ConfuseState:enter()
	SkillState.enter(self)

	if not self.owner:checkStatus(ConflictTypes.CT_CONFUSE, true) then
		self.owner.skillStateMgr:switchState(AbilityConst.SKILL_STATE_NONE)

		return
	end

	if self.owner.pauseBt then
		self.owner:pauseBt(AiConst.PauseBtReason.Confuse)
	end

	self.shouldDisableControl = Utils.isPlayer(self.owner) or Utils.isPet(self.owner) or Utils.isBotPlayer(self.owner)
	self.hasMoveInput = false
	self.srcEntityId = nil
	self.playerEntityId = nil

	if Utils.checkClient() and self.owner == pg.pawn then
		pg.game.controller:onHandleMove(0, 0, 0)
	end

	if self.shouldDisableControl then
		return
	end

	local buff

	for _, buffData in ipairs(self.owner.buffDataList) do
		local buffTemplate = pg.global.abilityMgr:getBuffTemplate(buffData.templateId, buffData.level)

		if buffTemplate and lume.find(buffTemplate.tags or {}, AbilityConst.BUFF_TAG_CONFUSE) then
			buff = self.owner.actorBuff:findBuff(buffData.instanceId)

			break
		end
	end

	if buff == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			CombatLogger.error("buff not found, exit confuse")
		end

		self.owner.skillStateMgr:switchState(AbilityConst.SKILL_STATE_NONE)

		return
	end

	self.srcEntityId = buff.buffData.srcEntityId

	local srcEntity = pg.getEntity(self.srcEntityId)

	if srcEntity then
		local playerEntity = Utils.getMasterPlayer(srcEntity)

		if playerEntity then
			self.playerEntityId = playerEntity.id
		end
	end
end

function ConfuseState:getCurFollowEntity()
	if self.playerEntityId then
		local playerEntity = pg.getEntity(self.playerEntityId)

		if playerEntity and not playerEntity.isDestroyed and playerEntity.getCurPetEntity then
			local curPetEntity = playerEntity:getCurPetEntity()

			if curPetEntity and not curPetEntity.isDestroyed then
				return curPetEntity
			end
		end

		return nil
	end

	local srcEntity = pg.getEntity(self.srcEntityId)

	if srcEntity and not srcEntity.isDestroyed then
		return srcEntity
	end

	return nil
end

function ConfuseState:isInControlDistance(curFollowEntity)
	local maxDistance = AbilitySettingGlobalConstData.confuseMaxControlDistance or 30

	if maxDistance <= 0 then
		return true
	end

	return Vector3.SqrDistance(self.owner:getPosition(), curFollowEntity:getPosition()) <= maxDistance * maxDistance
end

function ConfuseState:canFollowEntityMove(curFollowEntity)
	local characterState = CharacterStateConst[curFollowEntity.characterState]
	local characterStateName = characterState and characterState.name

	if not Utils.checkClient() then
		if curFollowEntity.ABILITY_ST and curFollowEntity:ABILITY_ST() then
			local followCharacterStatesInAbility = AbilitySettingGlobalConstData.confuseFollowCharacterStatesInAbility

			return followCharacterStatesInAbility and followCharacterStatesInAbility[characterStateName] or false
		end

		return true
	end

	local followCharacterStates = AbilitySettingGlobalConstData.confuseFollowCharacterStates

	if not characterStateName or not followCharacterStates or not followCharacterStates[characterStateName] then
		return false
	end

	if curFollowEntity.ABILITY_ST and curFollowEntity:ABILITY_ST() then
		local followCharacterStatesInAbility = AbilitySettingGlobalConstData.confuseFollowCharacterStatesInAbility

		return followCharacterStatesInAbility and followCharacterStatesInAbility[characterStateName] or false
	end

	return true
end

function ConfuseState:getCurMoveDirection(curFollowEntity)
	local followEntityId = curFollowEntity.id
	local followPosition = curFollowEntity:getPosition()

	if self.lastFollowEntityId ~= followEntityId or not self.lastFollowPositionX or not self.lastFollowPositionZ then
		self.lastFollowEntityId = followEntityId
		self.lastFollowPositionX = followPosition.x
		self.lastFollowPositionZ = followPosition.z

		return nil
	end

	local deltaX = followPosition.x - self.lastFollowPositionX
	local deltaZ = followPosition.z - self.lastFollowPositionZ

	self.lastFollowPositionX = followPosition.x
	self.lastFollowPositionZ = followPosition.z

	local sqrMagnitude = deltaX * deltaX + deltaZ * deltaZ

	if sqrMagnitude <= 1e-06 then
		return nil
	end

	local inverseMagnitude = 1 / math.sqrt(sqrMagnitude)

	return Vector3.New(deltaX * inverseMagnitude, 0, deltaZ * inverseMagnitude)
end

function ConfuseState:resetFollowMoveRecord()
	self.lastFollowEntityId = nil
	self.lastFollowPositionX = nil
	self.lastFollowPositionZ = nil
end

function ConfuseState:setClientPlayerMoveInput(forward)
	if not self.owner.eModel or not self.owner.hasEModelComponent or not self.owner:hasEModelComponent(Const.COMPONENT_INDEX_CHARACETER_CONTROLLER) then
		return false
	end

	local cameraMgr = pg.global and pg.global.cameraMgr

	if not cameraMgr then
		return false
	end

	local cameraRotX, cameraRotY, cameraRotZ, cameraRotW = cameraMgr:GetWorldCameraRotationEx()
	local localDirection = Quaternion.MulVec3(Quaternion.GetQuaternionInverse(cameraRotX, cameraRotY, cameraRotZ, cameraRotW), forward)

	self.owner.eModel:OnHandleMove(Const.COMPONENT_INDEX_CHARACETER_CONTROLLER, localDirection.x, localDirection.z, 0)

	self.moveInputType = "player"

	return true
end

function ConfuseState:shouldRefreshClientAIMoveInput(forward)
	if not AutoPathFindUtils.isAutoPathFinding(self.owner) then
		return true
	end

	if not self.aiMoveForwardX or not self.aiMoveForwardZ then
		return true
	end

	local directionDot = self.aiMoveForwardX * forward.x + self.aiMoveForwardZ * forward.z

	return directionDot < CONFUSE_AI_DIRECTION_DOT_THRESHOLD
end

function ConfuseState:setClientAIMoveInput(forward)
	if not self.owner.eModel or not self.owner.hasEModelComponent or not self.owner:hasEModelComponent(Const.COMPONENT_AI_CONTROLLER) or not self.owner:hasEModelComponent(Const.COMPONENT_AUTO_PATH_FIND) then
		return false
	end

	if self:shouldRefreshClientAIMoveInput(forward) then
		AutoPathFindUtils.clearPath(self.owner)

		local ownerPosition = self.owner:getPosition()
		local targetPosition = Vector3.New(ownerPosition.x + forward.x * CONFUSE_AI_MOVE_TARGET_DISTANCE, ownerPosition.y, ownerPosition.z + forward.z * CONFUSE_AI_MOVE_TARGET_DISTANCE)

		AutoPathFindUtils.startAutoPathFind(self.owner, targetPosition, AutoPathFindUtils.PathFindType.ForceMove, 0.1, true, false, false)

		local moveState = AIControllerUtils.getMoveState(self.owner, BaseEnum.SpeedRateType.Mid)

		AutoPathFindUtils.setTargetAnimationState(self.owner, moveState)
		AutoPathFindUtils.addPathFindPoint(self.owner, targetPosition, true)

		self.aiMoveForwardX = forward.x
		self.aiMoveForwardZ = forward.z
	end

	self.moveInputType = "ai"

	return true
end

function ConfuseState:setServerMoveInput(forward)
	if not self.owner.serverSetMoveInfo or not self.owner.serverSetIsMoving then
		return false
	end

	local MotionVelocityType = require("GameServer.ServerConst").MotionVelocityType
	local speed = AIControllerUtils.getRunSpeed(self.owner)

	self.owner:serverSetMoveInfo(forward.x * speed, forward.y * speed, forward.z * speed, MotionVelocityType.FindPath)
	self.owner:serverSetIsMoving()
	AIControllerUtils.setDirection(self.owner, forward)

	self.moveInputType = "serverAi"

	return true
end

function ConfuseState:setMoveInput(forward)
	if self.owner.authority ~= Const.AUTHORITY_MASTER then
		return
	end

	if Utils.checkClient() then
		self.hasMoveInput = self:setClientPlayerMoveInput(forward) or self:setClientAIMoveInput(forward)
	else
		self.hasMoveInput = self:setServerMoveInput(forward)
	end
end

function ConfuseState:clearMoveInput()
	if not self.hasMoveInput then
		return
	end

	if Utils.checkClient() then
		if self.moveInputType == "player" and self.owner.eModel and self.owner.hasEModelComponent and self.owner:hasEModelComponent(Const.COMPONENT_INDEX_CHARACETER_CONTROLLER) then
			self.owner.eModel:OnHandleMove(Const.COMPONENT_INDEX_CHARACETER_CONTROLLER, 0, 0, 0)
		elseif self.moveInputType == "ai" then
			AutoPathFindUtils.stopAutoPathFind(self.owner)
		end
	elseif self.owner.serverSetMoveInfo then
		local MotionVelocityType = require("GameServer.ServerConst").MotionVelocityType

		self.owner:serverSetMoveInfo(0, 0, 0, MotionVelocityType.FindPath)
	end

	self.hasMoveInput = false
	self.moveInputType = nil
	self.aiMoveForwardX = nil
	self.aiMoveForwardZ = nil
end

function ConfuseState:tick(deltaSeconds)
	if not self.owner:inConfuse() then
		self.owner.skillStateMgr:switchState(AbilityConst.SKILL_STATE_NONE)

		return
	end

	if self.shouldDisableControl then
		return
	end

	local curFollowEntity = self:getCurFollowEntity()
	local canFollowEntityMove = curFollowEntity and self:canFollowEntityMove(curFollowEntity)
	local moveDirection = canFollowEntityMove and self:getCurMoveDirection(curFollowEntity) or nil

	lume.clear(CONFUSE_MOVE_EXCLUDE_STATES)

	CONFUSE_MOVE_EXCLUDE_STATES.CONFUSE_ST = true
	CONFUSE_MOVE_EXCLUDE_STATES.HIT_ST = true

	if self.owner.authority ~= Const.AUTHORITY_MASTER or not curFollowEntity or not canFollowEntityMove or not self.owner:checkMove(CONFUSE_MOVE_EXCLUDE_STATES, CONFUSE_MOVE_EXCLUDE_CANCEL_STATES) or not self:isInControlDistance(curFollowEntity) or not moveDirection then
		self:clearMoveInput()

		if not canFollowEntityMove then
			self:resetFollowMoveRecord()
		end

		return
	end

	self:setMoveInput(moveDirection)
end

function ConfuseState:leave()
	SkillState.leave(self)

	if self.owner.resumeBt then
		self.owner:resumeBt(AiConst.PauseBtReason.Confuse)
	end

	self:clearMoveInput()
	self:resetFollowMoveRecord()

	self.shouldDisableControl = nil
end

return ConfuseState
