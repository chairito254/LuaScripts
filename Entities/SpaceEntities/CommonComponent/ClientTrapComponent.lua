-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientTrapComponent.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local class = require("Core.Framework.Class")
local AbilityConst = require("Common.Const.AbilityConst")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local NotNil = NotNil
local Vector3 = Vector3
local PhysxComponent = CS.FunPlus.WorldX.Entities.Components.PhysxComponent
local ClientTrapComponent = class.Component("ClientTrapComponent")

function ClientTrapComponent:ctor()
	return
end

function ClientTrapComponent:init(dict)
	self.enterTriggerMaps = {}
	self.triggerCompMap = {}
	self.continuousTriggerMap = {}
	self.removingTriggerIds = {}
	self.isDestroyingTrapComponent = false

	return true
end

function ClientTrapComponent:destroy()
	self.isDestroyingTrapComponent = true

	for _, physxComponent in pairs(self.triggerCompMap) do
		if NotNil(physxComponent) then
			physxComponent:SetContinuousTriggerEnabled(false, self.eModel)
		end
	end
end

function ClientTrapComponent:EVENT_OnLifeDead()
	self.actorTimeline:stopAll()
end

function ClientTrapComponent:addTrigger(id, shapeKind, offsetXYZ, shapeArgs, isPortal, isCreationStandAlone, isNotifyWhenDisable, enableContinuousDetection)
	if self.isDestroyingTrapComponent then
		return
	end

	local physxComponent

	local function triggerCallback(isEnter, otherPhysxComponent)
		self:trapTriggerCallback(id, isEnter, otherPhysxComponent)
	end

	if Utils.isCreation(self) and not isCreationStandAlone and self:isCreationColliderTrigger() then
		physxComponent = self:getEModelMonoComponent(Const.COMPONENT_IDX_PHYSX)
		self.eModel.triggerCallback = triggerCallback
		self.triggerCompMap[id] = physxComponent

		if enableContinuousDetection then
			physxComponent:SetContinuousTriggerEnabled(true, self.eModel)
		end

		return physxComponent
	end

	if shapeKind == "Sphere" then
		physxComponent = PhysxComponent.AddSphereTrigger(self.eModel, triggerCallback, offsetXYZ, shapeArgs[1])
	elseif shapeKind == "Box" then
		physxComponent = PhysxComponent.AddBoxTrigger(self.eModel, triggerCallback, offsetXYZ, shapeArgs)
	end

	physxComponent.isNotifyWhenDisable = isNotifyWhenDisable
	self.isAbilityPortal = isPortal
	self.triggerCompMap[id] = physxComponent

	if enableContinuousDetection then
		physxComponent:SetContinuousTriggerEnabled(true, self.eModel)
	end

	return physxComponent
end

function ClientTrapComponent:setContinuousTrapTrigger(id, enable)
	self.continuousTriggerMap[id] = enable == true or nil
end

function ClientTrapComponent:sendTrapTrigger(isEnter, id, actorId)
	if self.continuousTriggerMap[id] then
		local targetEntity = pg.getEntityByActorId(actorId)

		if Utils.isPlayer(targetEntity) or Utils.isPet(targetEntity) then
			if pg.me and Utils.getMasterPlayer(targetEntity) == pg.me then
				local rpcName = isEnter and "RPC_CS_SupplementEnterTrigger" or "RPC_CS_SupplementLeaveTrigger"

				pg.me:serverMsgNoGC(rpcName, self.actorId, id, actorId)
			end

			return
		end
	end

	self:serverMsgNoGC(isEnter and "RPC_CS_EnterTrigger" or "RPC_CS_LeaveTrigger", id, actorId)
end

function ClientTrapComponent:delTrigger(uid, physxComponent, isNotifyLeaveWhenExit)
	if self.removingTriggerIds[uid] then
		return
	end

	physxComponent = physxComponent or self.triggerCompMap[uid]

	if physxComponent == nil and not self.enterTriggerMaps[uid] then
		return
	end

	self.removingTriggerIds[uid] = true
	self.triggerCompMap[uid] = nil

	if physxComponent ~= nil then
		physxComponent:SetContinuousTriggerEnabled(false, self.eModel)

		local ownPhysxComponent = self:getEModelMonoComponent(Const.COMPONENT_IDX_PHYSX)

		if physxComponent == ownPhysxComponent then
			self.eModel.triggerCallback = nil
		else
			PhysxComponent.RemoveTrigger(physxComponent)
		end
	end

	if isNotifyLeaveWhenExit and self.enterTriggerMaps[uid] then
		for actorId in pairs(self.enterTriggerMaps[uid]) do
			self:leaveTrigger(uid, actorId)
		end
	end

	self.enterTriggerMaps[uid] = nil
	self.continuousTriggerMap[uid] = nil
	self.removingTriggerIds[uid] = nil
end

function ClientTrapComponent:trapTriggerCallback(id, isEnter, otherPhysxComponent)
	if self.removingTriggerIds[id] then
		return
	end

	local actorId
	local tagType = otherPhysxComponent.tagType

	if tagType == Const.TAG_ACTOR then
		actorId = otherPhysxComponent.tagId

		if isEnter then
			self:enterTrigger(id, actorId)
		else
			self:leaveTrigger(id, actorId)
		end
	end
end

function ClientTrapComponent:enterTrigger(id, actorId)
	if self.isDestroyingTrapComponent or self.removingTriggerIds[id] then
		return
	end

	if self.enterTriggerMaps[id] and self.enterTriggerMaps[id][actorId] then
		if LoggerManager.checkLogger(LoggerConst.DEBUG) then
			self.logger:debug("enterTrigger actorId already in enterTriggerMaps", self.actorId, id, actorId)
		end

		return
	end

	if not self.enterTriggerMaps[id] then
		self.enterTriggerMaps[id] = {}
	end

	self.enterTriggerMaps[id][actorId] = actorId

	self.subject:notify(AbilityConst.COMBAT_EVENT_ON_ENTER_TRAP, id, actorId)

	if self.isAbilityPortal then
		self:enterPortalTrigger(actorId)
	end
end

function ClientTrapComponent:leaveTrigger(id, actorId)
	if not self.enterTriggerMaps[id] or not self.enterTriggerMaps[id][actorId] then
		if LoggerManager.checkLogger(LoggerConst.DEBUG) then
			self.logger:debug("leaveTrigger actorId not in enterTriggerMaps", self.actorId, id, actorId)
		end

		return
	end

	self.enterTriggerMaps[id][actorId] = nil

	self.subject:notify(AbilityConst.COMBAT_EVENT_ON_LEAVE_TRAP, id, actorId)

	if self.isAbilityPortal then
		self:leavePortalTrigger(actorId)
	end
end

return ClientTrapComponent
