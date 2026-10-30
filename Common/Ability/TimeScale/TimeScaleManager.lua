-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Ability\\TimeScale\\TimeScaleManager.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local AbilityConst = require("Common.Const.AbilityConst")
local GlobalFreeze = require("Common.Ability.TimeScale.GlobalFreeze")
local TimeScaleZone = require("Common.Ability.TimeScale.TimeScaleZone")
local SafeCallback = require("Core.Framework.SafeCallback")
local TimeScaleManager = Class.LiteClass("TimeScaleManager")

function TimeScaleManager:ctor(space)
	self.space = space
	self.timeZones = {}
	self.timeZoneGenId = 0
	self.globalTimeScale = 1
	self.globalTimeZoneScale = 1
	self.globalScaledTime = 0
	self.freezeScaledTime = 0
	self.globalFreeze = GlobalFreeze()
	self.globalFreezeTimeScale = 1
	self.globalFreezeReason = nil
	self.entities = {}
	self.temp_removeIds = {}
end

function TimeScaleManager:destroy()
	for id, ent in pairs(self.entities) do
		self:unRegisterEnt(id, ent)
	end

	self.space = nil

	self.globalFreeze:stopFreeze()

	self.globalFreezeReason = nil
end

function TimeScaleManager:initializeFreezeScaledTime()
	if self.freezeScaledTime ~= nil then
		return
	end

	self.freezeScaledTime = 0

	for _, ent in pairs(self.tickEntities) do
		ent.scaledTimeAnchor = 0
	end

	self.tickEntities = nil
end

function TimeScaleManager:settleEntScaledTime(ent)
	if self.freezeScaledTime == nil then
		self:initializeFreezeScaledTime()
	end

	if ent.useSimpleTimeScale or self.entities[ent.id] ~= ent then
		return
	end

	local anchor = ent.scaledTimeAnchor

	if anchor == nil then
		ent.scaledTimeAnchor = self.freezeScaledTime

		error("Missing scaled time anchor for registered entity: " .. tostring(ent.id))
	end

	ent.currScaledTime = ent.currScaledTime + (self.freezeScaledTime - anchor) * ent.timeScale
	ent.scaledTimeAnchor = self.freezeScaledTime
end

function TimeScaleManager:genTimeZoneInstanceId()
	self.timeZoneGenId = self.timeZoneGenId + 1

	return self.timeZoneGenId
end

function TimeScaleManager:tick(deltaTime)
	if self.freezeScaledTime == nil then
		self:initializeFreezeScaledTime()
	end

	if next(self.timeZones) then
		table.clear(self.temp_removeIds)

		for zoneId, timeZone in pairs(self.timeZones) do
			if timeZone:isValid() then
				timeZone:activate(deltaTime)
			else
				self.temp_removeIds[#self.temp_removeIds + 1] = zoneId
			end
		end

		for _, removeId in ipairs(self.temp_removeIds) do
			self:removeTimeZone(removeId)
		end
	end

	self.globalFreeze:updateValue()

	local gameTime = self.space:getGameTime()

	if not self.lastTickTime then
		self.lastTickTime = gameTime
	end

	local gameDeltaTime = gameTime - self.lastTickTime

	if gameDeltaTime < 0 then
		gameDeltaTime = 0
	end

	self.lastTickTime = gameTime

	self:updateGlobalFreeze()

	if pg.global.csAbilityMgr then
		pg.global.csAbilityMgr.abilityDeltaTime = gameDeltaTime
	end

	self.globalScaledTime = self.globalScaledTime + self.globalTimeZoneScale * self.globalFreezeTimeScale * gameDeltaTime
	self.freezeScaledTime = self.freezeScaledTime + self.globalFreezeTimeScale * gameDeltaTime
end

function TimeScaleManager:registerEnt(id, ent, useSimpleTimeScale)
	if self.freezeScaledTime == nil then
		self:initializeFreezeScaledTime()
	end

	local registeredEnt = self.entities[id]

	if registeredEnt == ent then
		if not useSimpleTimeScale and ent.scaledTimeAnchor == nil then
			error("Missing scaled time anchor for registered entity: " .. tostring(id))
		end

		return
	end

	if registeredEnt then
		self:unRegisterEnt(id, registeredEnt)
	end

	self.entities[id] = ent

	if not useSimpleTimeScale then
		ent.scaledTimeAnchor = self.freezeScaledTime
	end
end

function TimeScaleManager:unRegisterEnt(id, ent)
	if self.entities[id] == ent then
		self:settleEntScaledTime(ent)

		ent.scaledTimeAnchor = nil
		self.entities[id] = nil
	end
end

function TimeScaleManager:isRegistered(id)
	return self.entities[id] ~= nil
end

function TimeScaleManager:updateGlobalFreeze()
	if self.space:isMultiPlayerEnv() then
		self.globalFreezeTimeScale = 1

		return
	end

	if not self.globalFreeze:isValid() then
		self.globalFreezeReason = nil
	end

	self.globalFreezeTimeScale = self.globalFreeze:getTimeScale()
end

function TimeScaleManager:shouldIgnoreAbilityGlobalFreeze(targetEnt)
	if not targetEnt then
		return false
	end

	if targetEnt.isCastingUltimateAbility and targetEnt:isCastingUltimateAbility() then
		return true
	end

	return false
end

function TimeScaleManager:getGlobalFreeze(targetEnt)
	if self.globalFreezeReason == AbilityConst.GLOBAL_FREEZE_REASON.ABILITY and self:shouldIgnoreAbilityGlobalFreeze(targetEnt) then
		return 1
	end

	return self.globalFreezeTimeScale
end

function TimeScaleManager:_startGlobalFreeze(freezeScale, inTime, outTime, keepTime)
	if self.space:isMultiPlayerEnv() then
		return false
	end

	if type(freezeScale) ~= "number" or freezeScale ~= freezeScale then
		return false
	end

	freezeScale = math.max(freezeScale, 0)

	if not _G_IsDebugMode then
		freezeScale = math.clamp(freezeScale, 0, 1)
	end

	self.globalFreeze:startFreeze(freezeScale, inTime, outTime, keepTime)
	self.globalFreeze:updateValue()

	if pg.component == "client" and self.space then
		pg.me:serverSpaceMsg("RPC_CS_StartGlobalFreeze", {
			freezeScale,
			inTime,
			outTime,
			keepTime
		})
	end

	return true
end

function TimeScaleManager:startGlobalFreeze(freezeScale, inTime, outTime, keepTime, reason)
	reason = reason or AbilityConst.GLOBAL_FREEZE_REASON.ABILITY

	local priority = AbilityConst.GLOBAL_FREEZE_REASON_PRIORITY[reason]

	if priority == nil then
		return false
	end

	if self.globalFreeze:isValid() then
		local currentPriority = AbilityConst.GLOBAL_FREEZE_REASON_PRIORITY[self.globalFreezeReason] or 0

		if priority < currentPriority then
			return false
		end
	end

	if not self:_startGlobalFreeze(freezeScale, inTime, outTime, keepTime) then
		return false
	end

	self.globalFreezeReason = reason

	return true
end

function TimeScaleManager:getTimeScale(targetEnt)
	if self.space:isMultiPlayerEnv() then
		return 1
	end

	if Utils.tableIsEmptyOrNil(self.timeZones) then
		return 1
	end

	local resultScale = 1

	for zoneId, timeZone in pairs(self.timeZones) do
		local valid, timeScale = timeZone:checkTimeScale(targetEnt)

		resultScale = math.min(timeScale, resultScale)
	end

	return math.max(0, resultScale)
end

function TimeScaleManager:onSyncTimeZone(timeZoneParams)
	local timeZone = TimeScaleZone()

	timeZone:applyTimeZoneParams(timeZoneParams)
	self:addTimeZone(timeZone)
end

function TimeScaleManager:createTimeZone(casterId, position, radius, timeScale, duration, ignoreActorId)
	local zoneId = self:genTimeZoneInstanceId()
	local timeZone = TimeScaleZone.new()

	timeZone:init(zoneId, casterId, position, radius, timeScale, duration, ignoreActorId)
	self:addTimeZone(timeZone)

	return zoneId
end

function TimeScaleManager:addTimeZone(timeZone)
	if self.space:isMultiPlayerEnv() then
		return
	end

	if timeZone then
		self.timeZones[timeZone.zoneId] = timeZone

		if pg.component == "game" and self.space then
			self.space:allClientsMsg("RPC_SC_AddTimeZone", timeZone:getTimeZoneParams())
		end

		self:refreshAllEntitiesTimeScale()
	end
end

function TimeScaleManager:removeTimeZone(zoneId, sync)
	if pg.component == "game" and sync and self.space then
		self.space:allClientsMsg("RPC_SC_RemoveTimeZone", zoneId)
	end

	self.timeZones[zoneId] = nil

	self:refreshAllEntitiesTimeScale()
end

function TimeScaleManager:refreshGlobalZoneTimeScale()
	self.globalTimeZoneScale = self:getTimeScale(nil)
end

function TimeScaleManager:onMultiPlayerEnvChanged(multiPlayerEnv)
	self:refreshAllEntitiesTimeScale()
end

function TimeScaleManager:onGameTimeScaleChange()
	for _, ent in pairs(self.entities) do
		if ent and ent.applyTimeScale then
			SafeCallback(ent.applyTimeScale, ent)
		end
	end
end

function TimeScaleManager:refreshAllEntitiesTimeScale()
	self:refreshGlobalZoneTimeScale()

	for _, ent in pairs(self.entities) do
		if ent and ent.refreshTimeScale then
			SafeCallback(ent.refreshTimeScale, ent)
		end
	end
end

return TimeScaleManager
