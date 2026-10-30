-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\SpaceComponent\\ClientSpaceLeylineFlowerComponent.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local SysConfigData = require("Data.sys_config_data")
local LeylineFlowerUtils = require("Common.Utils.LeylineFlowerUtils")
local LeylineFlowerConst = require("Const.LeylineFlowerConst")
local EventConst = require("Const.EventConst")
local CallbackHandler = require("Core.Common.CallbackHandler")
local LoggerManager = require("Core.Log.LoggerManager")
local LeylineFlowerPresentUtils = require("Utils.LeylineFlowerPresentUtils")
local MessageName = require("Const.MessageName")
local ClientSpaceLeylineFlowerComponent = Class.Component("ClientSpaceLeylineFlowerComponent")
local RAINBOW_PET_EFFECT_WAIT_PRESENT = 0.5

function ClientSpaceLeylineFlowerComponent:ctor()
	self.logger = LoggerManager.getLogger("ClientSpaceLeylineFlowerComponent")
	self.hasStarted = false
	self.leylineFlowerMap = {}
	self.rainbowPetEffects = {}
	self.rainbowPetTemplateIds = {}
	self.rainbowPetPointTemplateIds = {}
	self.pendingReturnedRainbowPets = {}
	self.arrivalFlowerBursts = {}
	self.liveRainbowPetFlowers = {}
	self.pendingRainbowPetPresentations = {}
	self.pendingRainbowPetEffects = {}
	self.rainbowPetEffectWaitTimers = {}
	self.rainbowPetSpawnPresented = {}
end

function ClientSpaceLeylineFlowerComponent:start()
	self.hasStarted = true

	if not self.onRainbowPetSpawnPresentedEvent then
		self.onRainbowPetSpawnPresentedEvent = CallbackHandler(self, "onRainbowPetSpawnPresented")

		pg.global.eventEmitter:addEventListener(EventConst.ON_LEYLINE_RAINBOW_PET_SPAWN_PRESENTED, self.onRainbowPetSpawnPresentedEvent)
	end

	if not self.rainbowPetPosFlags then
		return
	end

	for staticId, pointCountMap in pairs(self.rainbowPetPosFlags) do
		self:refreshRainbowPetEffects(staticId, pointCountMap, true)
	end
end

function ClientSpaceLeylineFlowerComponent:addLeylineFlowerMap(entityId, leylineFlowerId)
	self.leylineFlowerMap[leylineFlowerId] = entityId
end

function ClientSpaceLeylineFlowerComponent:removeLeylineFlowerMap(leylineFlowerId)
	self.leylineFlowerMap[leylineFlowerId] = nil
end

function ClientSpaceLeylineFlowerComponent:on_rainbowPetPosFlags_entry_added(staticId, pointCountMap)
	self:refreshRainbowPetEffects(staticId, pointCountMap, not self.hasStarted)
end

function ClientSpaceLeylineFlowerComponent:on_rainbowPetPosFlags_entry_deleted(staticId, pointCountMap)
	for pointId in pairs(pointCountMap or EMPTY_TABLE) do
		self:cancelPendingRainbowPetPresentations(staticId, pointId)
	end

	self:stopRainbowPetEffect(staticId)

	self.pendingRainbowPetEffects[staticId] = nil
	self.rainbowPetSpawnPresented[staticId] = nil
	self.rainbowPetTemplateIds[staticId] = nil
	self.rainbowPetPointTemplateIds[staticId] = nil
	self.pendingReturnedRainbowPets[staticId] = nil

	self:cancelRainbowPetEffectWait(staticId)

	for pointId in pairs(pointCountMap or EMPTY_TABLE) do
		self:refreshRainbowPetMapMark(pointId)
		self:clearRainbowPetTracking(pointId)
	end
end

function ClientSpaceLeylineFlowerComponent:on_rainbowPetPosFlags_point_added(pointId, count, staticId)
	self:refreshRainbowPetEffect(staticId, pointId, count, not self.hasStarted)
end

function ClientSpaceLeylineFlowerComponent:on_rainbowPetPosFlags_point_deleted(pointId, count, staticId)
	local templates = self.rainbowPetPointTemplateIds[staticId]

	if templates then
		templates[pointId] = nil
	end

	local returned = self.pendingReturnedRainbowPets[staticId]

	if returned then
		returned[pointId] = nil
	end

	self:cancelPendingRainbowPetPresentations(staticId, pointId)
	self:stopRainbowPetEffect(staticId, pointId)
	self:dropPendingPresentationIfNoPoint(staticId)
	self:refreshRainbowPetMapMark(pointId)
	self:clearRainbowPetTracking(pointId)
end

function ClientSpaceLeylineFlowerComponent:on_rainbowPetPosFlags_point_changed(oldCount, newCount, staticId, pointId)
	oldCount = oldCount or 0
	newCount = newCount or 0

	self:refreshRainbowPetMapMark(pointId)

	if oldCount < newCount then
		self:activateRainbowPetPoint(staticId, pointId, not self.hasStarted)
	elseif newCount <= 0 then
		self:cancelPendingRainbowPetPresentations(staticId, pointId)
		self:stopRainbowPetEffect(staticId, pointId)
		self:dropPendingPresentationIfNoPoint(staticId)
		self:clearRainbowPetTracking(pointId)
	end
end

function ClientSpaceLeylineFlowerComponent:isRainbowPetEffectEnabled(count)
	return count and count > 0
end

function ClientSpaceLeylineFlowerComponent:hasEnabledRainbowPetPoint(staticId)
	local pointCountMap = self.rainbowPetPosFlags and self.rainbowPetPosFlags[staticId]

	if not pointCountMap then
		return false
	end

	for _, count in pairs(pointCountMap) do
		if self:isRainbowPetEffectEnabled(count) then
			return true
		end
	end

	return false
end

function ClientSpaceLeylineFlowerComponent:dropPendingPresentationIfNoPoint(staticId)
	if self:hasEnabledRainbowPetPoint(staticId) or self:hasPendingRainbowPetPresentation(staticId) then
		return
	end

	self.pendingRainbowPetEffects[staticId] = nil
	self.rainbowPetSpawnPresented[staticId] = nil

	self:cancelRainbowPetEffectWait(staticId)
end

function ClientSpaceLeylineFlowerComponent:refreshRainbowPetEffects(staticId, pointCountMap, isRestore)
	local enabledPointIds = {}

	if pointCountMap then
		for pointId, count in pairs(pointCountMap) do
			self:refreshRainbowPetMapMark(pointId)

			if self:isRainbowPetEffectEnabled(count) then
				enabledPointIds[pointId] = true

				self:activateRainbowPetPoint(staticId, pointId, isRestore)
			end
		end
	end

	local effectData = self.rainbowPetEffects[staticId]

	if not effectData then
		return
	end

	local removedPointIds = {}

	for pointId in pairs(effectData.pointEffectIds) do
		if not enabledPointIds[pointId] then
			removedPointIds[#removedPointIds + 1] = pointId
		end
	end

	for _, pointId in ipairs(removedPointIds) do
		self:stopRainbowPetEffect(staticId, pointId)
	end
end

function ClientSpaceLeylineFlowerComponent:refreshRainbowPetEffect(staticId, pointId, count, isRestore)
	self:refreshRainbowPetMapMark(pointId)

	if self:isRainbowPetEffectEnabled(count) then
		self:activateRainbowPetPoint(staticId, pointId, isRestore)
	else
		self:stopRainbowPetEffect(staticId, pointId)
	end
end

function ClientSpaceLeylineFlowerComponent:restoreReturnedRainbowPet(staticId, petTemplateId, pointId)
	if not self:isLocalSpaceOwner() or not staticId or not pointId or pointId <= 0 or not petTemplateId or petTemplateId <= 0 then
		return false
	end

	self:setRainbowPetTemplateId(staticId, petTemplateId, pointId)

	local pending = self.pendingReturnedRainbowPets[staticId] or {}

	self.pendingReturnedRainbowPets[staticId] = pending
	pending[pointId] = true

	return self:tryRestoreReturnedRainbowPet(staticId, pointId)
end

function ClientSpaceLeylineFlowerComponent:tryRestoreReturnedRainbowPet(staticId, pointId)
	local pending = self.pendingReturnedRainbowPets[staticId]

	if not pending or not pending[pointId] or not self.hasStarted or not self:isLocalSpaceOwner() then
		return false
	end

	local points = self.rainbowPetPosFlags and self.rainbowPetPosFlags[staticId]

	if not points or not self:isRainbowPetEffectEnabled(points[pointId]) then
		return false
	end

	local position = LeylineFlowerUtils.getRainbowPetSpawnPosition(self.sceneId, pointId, self.id)

	if not position then
		return false
	end

	if self.pendingRainbowPetEffects[staticId] and self.liveRainbowPetFlowers[staticId] then
		return false
	end

	self.pendingRainbowPetEffects[staticId] = nil

	self:cancelRainbowPetEffectWait(staticId)
	self:createRainbowPetEffect(staticId, pointId, position, true)
	self:playArrivalFlowerBurstEffect(staticId, self.rainbowPetEffects[staticId])
	self:refreshRainbowPetMapMark(pointId)

	pending[pointId] = nil

	return true
end

function ClientSpaceLeylineFlowerComponent:playArrivalFlowerBurstEffect(staticId, effectData)
	if self.arrivalFlowerBursts[staticId] or not effectData then
		return
	end

	self.arrivalFlowerBursts[staticId] = self:playFlowerBurstEffect(staticId, effectData)
end

function ClientSpaceLeylineFlowerComponent:activateRainbowPetPoint(staticId, pointId, isRestore)
	local returned = self.pendingReturnedRainbowPets[staticId]

	if returned and returned[pointId] then
		self:tryRestoreReturnedRainbowPet(staticId, pointId)

		return false
	end

	local rainbowPetPos = LeylineFlowerUtils.getRainbowPetSpawnPosition(self.sceneId, pointId, self.id)

	if not rainbowPetPos then
		return false
	end

	if not isRestore and self:isLocalSpaceOwner() then
		if self:hasPendingRainbowPetPresentation(staticId) then
			self:holdRainbowPetEffect(staticId)
		elseif not self.rainbowPetSpawnPresented[staticId] then
			self:holdRainbowPetEffect(staticId, RAINBOW_PET_EFFECT_WAIT_PRESENT)
		end
	end

	self:createRainbowPetEffect(staticId, pointId, rainbowPetPos, isRestore)

	return false
end

function ClientSpaceLeylineFlowerComponent:holdRainbowPetEffect(staticId, waitPresentSeconds)
	if not staticId then
		return
	end

	self.pendingRainbowPetEffects[staticId] = true

	if not waitPresentSeconds then
		self:cancelRainbowPetEffectWait(staticId)

		return
	end

	if self.rainbowPetEffectWaitTimers[staticId] then
		return
	end

	self.rainbowPetEffectWaitTimers[staticId] = self:addTimer(waitPresentSeconds, function()
		self.rainbowPetEffectWaitTimers[staticId] = nil

		if self:hasPendingRainbowPetPresentation(staticId) then
			return
		end

		self:releaseDeferredRainbowPetEffects(staticId)
	end)
end

function ClientSpaceLeylineFlowerComponent:cancelRainbowPetEffectWait(staticId)
	local timerId = staticId and self.rainbowPetEffectWaitTimers[staticId]

	if not timerId then
		return
	end

	self.rainbowPetEffectWaitTimers[staticId] = nil

	self:removeTimer(timerId)
end

function ClientSpaceLeylineFlowerComponent:createRainbowPetEffect(staticId, pointId, rainbowPetPos, isRestore, presented)
	if not presented and (self.pendingRainbowPetEffects[staticId] or self:hasPendingRainbowPetPresentation(staticId, pointId)) then
		return
	end

	local effectData = self.rainbowPetEffects[staticId]

	if not effectData then
		effectData = {
			pointEffectIds = {},
			flowerBurstEffects = {}
		}
		self.rainbowPetEffects[staticId] = effectData
	end

	local petSpawnEffectKey = SysConfigData.RAINBOW_PET_SPAWN_EFFECT

	if petSpawnEffectKey and not effectData.pointEffectIds[pointId] then
		local petEffectId = LeylineFlowerUtils.playEffect(rainbowPetPos, petSpawnEffectKey)

		if petEffectId and petEffectId ~= 0 then
			effectData.pointEffectIds[pointId] = petEffectId
		end
	end

	if not isRestore then
		if self:isLocalSpaceOwner() and not self.liveRainbowPetFlowers[staticId] then
			self:playArrivalFlowerBurstEffect(staticId, effectData)
		else
			self:playFlowerBurstEffect(staticId, effectData)
		end
	end
end

function ClientSpaceLeylineFlowerComponent:playFlowerBurstEffect(staticId, effectData)
	local flowerEffectKey = SysConfigData.RAINBOW_FLOWER_EFFECT
	local flowerPos = LeylineFlowerUtils.getFlowerPositionByStaticId(staticId, self.sceneId, self.id)

	if not flowerPos then
		return
	end

	if flowerEffectKey then
		local burstEffectId = LeylineFlowerUtils.playOneShotEffect(flowerPos, flowerEffectKey)

		if burstEffectId then
			local duration = LeylineFlowerUtils.getEffectDuration(flowerEffectKey)

			if duration then
				effectData.flowerBurstEffects[burstEffectId] = self:addTimer(duration, function()
					local data = self.rainbowPetEffects[staticId]

					if data then
						data.flowerBurstEffects[burstEffectId] = nil
					end
				end)
			else
				effectData.flowerBurstEffects[burstEffectId] = true
			end
		end
	end

	local audioPos = Vector3(flowerPos[1], flowerPos[2], flowerPos[3])

	pg.game.audio:playSoundAtPos(LeylineFlowerConst.FLOWER_AUDIO_EVENT.RainbowPillar, audioPos)

	return true
end

function ClientSpaceLeylineFlowerComponent:stopFlowerBurstEffects(effectData)
	if not effectData.flowerBurstEffects then
		return
	end

	for burstEffectId, timerId in pairs(effectData.flowerBurstEffects) do
		if timerId ~= true then
			self:removeTimer(timerId)
		end

		LeylineFlowerUtils.stopEffect(burstEffectId)
	end

	effectData.flowerBurstEffects = {}
end

function ClientSpaceLeylineFlowerComponent:onRainbowPetSpawnPresented(data)
	local staticId = data and data.staticId

	if not staticId then
		return
	end

	local presentation = data.presentation

	if presentation then
		self:removePendingRainbowPetPresentation(staticId, presentation)

		local pointId = data.pointId
		local points = self.rainbowPetPosFlags and self.rainbowPetPosFlags[staticId]
		local position = points and self:isRainbowPetEffectEnabled(points[pointId]) and LeylineFlowerUtils.getRainbowPetSpawnPosition(self.sceneId, pointId, self.id)

		if position then
			self:createRainbowPetEffect(staticId, pointId, position, false, true)
		end

		self:releaseDeferredRainbowPetEffects(staticId, true)

		return
	end

	self.rainbowPetSpawnPresented[staticId] = true
	self.liveRainbowPetFlowers[staticId] = true

	self:releaseDeferredRainbowPetEffects(staticId)
end

function ClientSpaceLeylineFlowerComponent:releaseDeferredRainbowPetEffects(staticId, isRestore)
	if not staticId or not self.pendingRainbowPetEffects[staticId] or self:hasPendingRainbowPetPresentation(staticId) then
		return
	end

	self.pendingRainbowPetEffects[staticId] = nil

	self:cancelRainbowPetEffectWait(staticId)

	local pointCountMap = self.rainbowPetPosFlags and self.rainbowPetPosFlags[staticId]

	for pointId, count in pairs(pointCountMap or EMPTY_TABLE) do
		if self:isRainbowPetEffectEnabled(count) then
			local rainbowPetPos = LeylineFlowerUtils.getRainbowPetSpawnPosition(self.sceneId, pointId, self.id)

			if rainbowPetPos and not self:tryRestoreReturnedRainbowPet(staticId, pointId) then
				self:createRainbowPetEffect(staticId, pointId, rainbowPetPos, isRestore)
			end
		end
	end
end

function ClientSpaceLeylineFlowerComponent:stopRainbowPetEffect(staticId, pointId)
	LeylineFlowerUtils.cancelCameraFocus(staticId, pointId)

	local data = self.rainbowPetEffects[staticId]

	if not data then
		return
	end

	if pointId ~= nil then
		local petEffectId = data.pointEffectIds[pointId]

		if petEffectId then
			LeylineFlowerUtils.stopEffect(petEffectId)

			data.pointEffectIds[pointId] = nil
		end
	else
		for _, petEffectId in pairs(data.pointEffectIds) do
			LeylineFlowerUtils.stopEffect(petEffectId)
		end

		data.pointEffectIds = {}
	end

	if next(data.pointEffectIds) then
		return
	end

	self:stopFlowerBurstEffects(data)

	self.rainbowPetEffects[staticId] = nil
end

function ClientSpaceLeylineFlowerComponent:isLocalSpaceOwner()
	return pg.me and self.ownerPlayerId == pg.me.id
end

function ClientSpaceLeylineFlowerComponent:prepareRainbowPetPresentation(data)
	if not self.hasStarted or not self:isLocalSpaceOwner() or data.cancelled then
		return false
	end

	local points = self.rainbowPetPosFlags and self.rainbowPetPosFlags[data.staticId]

	if not points then
		return false
	end

	for pointId, count in pairs(points) do
		if self:isRainbowPetEffectEnabled(count) and (not data.pointId or data.pointId <= 0 or data.pointId == pointId) then
			local position = LeylineFlowerUtils.getRainbowPetSpawnPosition(self.sceneId, pointId, self.id)

			if position then
				data.pointId = pointId
				data.targetPosition = position

				return true
			end
		end
	end

	return false
end

function ClientSpaceLeylineFlowerComponent:setPendingRainbowPetPresentation(staticId, data)
	local pending = self.pendingRainbowPetPresentations[staticId] or {}

	self.pendingRainbowPetPresentations[staticId] = pending
	pending[#pending + 1] = data
	self.liveRainbowPetFlowers[staticId] = true
	self.rainbowPetSpawnPresented[staticId] = nil

	self:holdRainbowPetEffect(staticId)
end

function ClientSpaceLeylineFlowerComponent:hasPendingRainbowPetPresentation(staticId, pointId)
	for _, data in ipairs(self.pendingRainbowPetPresentations[staticId] or EMPTY_TABLE) do
		if not data.cancelled and (not pointId or not data.pointId or data.pointId <= 0 or data.pointId == pointId) then
			return true
		end
	end

	return false
end

function ClientSpaceLeylineFlowerComponent:removePendingRainbowPetPresentation(staticId, data)
	local pending = self.pendingRainbowPetPresentations[staticId]

	for i = #(pending or EMPTY_TABLE), 1, -1 do
		if pending[i] == data then
			table.remove(pending, i)
		end
	end

	if pending and #pending == 0 then
		self.pendingRainbowPetPresentations[staticId] = nil
	end
end

function ClientSpaceLeylineFlowerComponent:cancelPendingRainbowPetPresentations(staticId, pointId)
	for _, data in ipairs(self.pendingRainbowPetPresentations[staticId] or EMPTY_TABLE) do
		if not pointId or data.pointId == pointId then
			data.cancelled = true
		end
	end
end

function ClientSpaceLeylineFlowerComponent:collectRbPetTemplateIds(templateCountMap)
	local ids = {}

	for templateId, count in pairs(templateCountMap or EMPTY_TABLE) do
		if templateId and templateId > 0 and (count or 0) > 0 then
			ids[#ids + 1] = templateId
		end
	end

	table.sort(ids)

	return ids
end

function ClientSpaceLeylineFlowerComponent:getSmallestRbPetTemplateId(pointId)
	local templateMap = self.rbPetMap and pointId and self.rbPetMap[pointId]
	local ids = self:collectRbPetTemplateIds(templateMap)

	return ids[1]
end

function ClientSpaceLeylineFlowerComponent:flowerHasOccupiedRainbowPoint(staticId)
	local points = self.rainbowPetPosFlags and staticId and self.rainbowPetPosFlags[staticId]

	if not points then
		return false
	end

	for _, count in pairs(points) do
		if count and count > 0 then
			return true
		end
	end

	return false
end

function ClientSpaceLeylineFlowerComponent:isRainbowPointOccupied(pointId)
	for _, pointCountMap in pairs(self.rainbowPetPosFlags or EMPTY_TABLE) do
		if (pointCountMap[pointId] or 0) > 0 then
			return true
		end
	end

	return false
end

function ClientSpaceLeylineFlowerComponent:getSmallestFlowerRbPetTemplateId(staticId)
	local points = self.rainbowPetPosFlags and staticId and self.rainbowPetPosFlags[staticId]

	if not points or not self.rbPetMap then
		return nil
	end

	local ids = {}

	for pointId, count in pairs(points) do
		if count and count > 0 then
			local pointIds = self:collectRbPetTemplateIds(self.rbPetMap[pointId])

			for _, templateId in ipairs(pointIds) do
				ids[#ids + 1] = templateId
			end
		end
	end

	table.sort(ids)

	return ids[1]
end

function ClientSpaceLeylineFlowerComponent:getSyncedRainbowPetTemplateId(staticId, pointId)
	local pointTemplates = staticId and self.rainbowPetPointTemplateIds[staticId]

	if pointId and pointId > 0 then
		local pointTemplateId = pointTemplates and pointTemplates[pointId]

		if pointTemplateId and pointTemplateId > 0 then
			return pointTemplateId
		end

		if not pointTemplates then
			local flowerTemplateId = self.rainbowPetTemplateIds[staticId]

			if flowerTemplateId and flowerTemplateId > 0 then
				return flowerTemplateId
			end
		end

		return nil
	end

	local flowerTemplateId = staticId and self.rainbowPetTemplateIds[staticId]

	if flowerTemplateId and flowerTemplateId > 0 then
		return flowerTemplateId
	end
end

function ClientSpaceLeylineFlowerComponent:getRainbowPetTemplateId(staticId, pointId)
	if self.rbPetMap ~= nil then
		if pointId and pointId > 0 then
			local templateId = self:getSmallestRbPetTemplateId(pointId)

			if templateId then
				return templateId
			end

			if self:isRainbowPointOccupied(pointId) then
				return nil
			end
		elseif staticId then
			local templateId = self:getSmallestFlowerRbPetTemplateId(staticId)

			if templateId then
				return templateId
			end

			if self:flowerHasOccupiedRainbowPoint(staticId) then
				return nil
			end
		end
	else
		local syncedTemplateId = self:getSyncedRainbowPetTemplateId(staticId, pointId)

		if syncedTemplateId then
			return syncedTemplateId
		end
	end

	local activityData = LeylineFlowerUtils.getActivityRainbowPetData(staticId)

	if activityData and (not pointId or pointId <= 0 or activityData.specialRainbowPetPoint == pointId) then
		return activityData.specialRainbowPetWorld
	end

	local normalData = LeylineFlowerUtils.getRainbowPetData(staticId)

	if normalData and (not pointId or pointId <= 0 or normalData.rainbowPetPoint == pointId) then
		return normalData.rainbowPetWorld
	end

	return activityData and activityData.specialRainbowPetWorld or normalData and normalData.rainbowPetWorld
end

function ClientSpaceLeylineFlowerComponent:setRainbowPetTemplateId(staticId, petTemplateId, pointId)
	if not staticId or not petTemplateId or petTemplateId <= 0 then
		return
	end

	self.rainbowPetTemplateIds[staticId] = petTemplateId

	if pointId and pointId > 0 then
		local templates = self.rainbowPetPointTemplateIds[staticId] or {}

		self.rainbowPetPointTemplateIds[staticId] = templates
		templates[pointId] = petTemplateId
	end

	local pointCountMap = self.rainbowPetPosFlags and self.rainbowPetPosFlags[staticId]

	for pointId, count in pairs(pointCountMap or EMPTY_TABLE) do
		if count and count > 0 then
			self:refreshRainbowPetMapMark(pointId)
		end
	end
end

function ClientSpaceLeylineFlowerComponent:getRainbowPetTemplateIdByPointId(pointId)
	if self.rbPetMap ~= nil then
		local templateId = self:getSmallestRbPetTemplateId(pointId)

		if templateId then
			return templateId
		end

		for staticId, pointCountMap in pairs(self.rainbowPetPosFlags or EMPTY_TABLE) do
			if (pointCountMap[pointId] or 0) > 0 then
				return nil, staticId
			end
		end

		return nil
	end

	for staticId, pointCountMap in pairs(self.rainbowPetPosFlags or EMPTY_TABLE) do
		if (pointCountMap[pointId] or 0) > 0 then
			return self:getRainbowPetTemplateId(staticId, pointId), staticId
		end
	end
end

function ClientSpaceLeylineFlowerComponent:notifyRbPetMapChanged(pointId)
	self:refreshRainbowPetMapMark(pointId)

	if facade and MessageName then
		facade:SendMessageCommand(MessageName.LEYLINE_MAP_RAINBOW_CHANGED)
	end
end

function ClientSpaceLeylineFlowerComponent:on_rbPetMap_entry_added(pointId)
	self:notifyRbPetMapChanged(pointId)
end

function ClientSpaceLeylineFlowerComponent:on_rbPetMap_entry_deleted(pointId)
	self:notifyRbPetMapChanged(pointId)
end

function ClientSpaceLeylineFlowerComponent:on_rbPetMap_template_added(templateId, count, pointId)
	self:notifyRbPetMapChanged(pointId)
end

function ClientSpaceLeylineFlowerComponent:on_rbPetMap_template_deleted(templateId, count, pointId)
	self:notifyRbPetMapChanged(pointId)
end

function ClientSpaceLeylineFlowerComponent:on_rbPetMap_count_changed(oldCount, newCount, pointId, templateId)
	self:notifyRbPetMapChanged(pointId)
end

function ClientSpaceLeylineFlowerComponent:refreshRainbowPetMapMark(pointId)
	if pointId and pg.global and pg.global.eventEmitter then
		pg.global.eventEmitter:emit(EventConst.ON_MAP_MARK_UPDATED, {
			type = "addOrUpdate",
			id = pointId
		})
	end
end

function ClientSpaceLeylineFlowerComponent:clearRainbowPetTracking(pointId)
	if pg.game and pg.game.map then
		pg.game.map:manualUnTraceQuestMark(pointId)
	end
end

function ClientSpaceLeylineFlowerComponent:clearRainbowPetEffects()
	local staticIds = {}

	for staticId in pairs(self.rainbowPetEffects) do
		staticIds[#staticIds + 1] = staticId
	end

	for _, staticId in ipairs(staticIds) do
		self:stopRainbowPetEffect(staticId)
	end
end

function ClientSpaceLeylineFlowerComponent:destroy()
	if self.onRainbowPetSpawnPresentedEvent then
		pg.global.eventEmitter:removeEventListener(EventConst.ON_LEYLINE_RAINBOW_PET_SPAWN_PRESENTED, self.onRainbowPetSpawnPresentedEvent)

		self.onRainbowPetSpawnPresentedEvent = nil
	end

	LeylineFlowerPresentUtils.clear()

	for staticId in pairs(self.rainbowPetEffectWaitTimers) do
		self:removeTimer(self.rainbowPetEffectWaitTimers[staticId])
	end

	self.rainbowPetEffectWaitTimers = {}
	self.pendingRainbowPetPresentations = {}
	self.pendingRainbowPetEffects = {}
	self.rainbowPetSpawnPresented = {}

	self:clearRainbowPetEffects()

	self.hasStarted = false
	self.pendingReturnedRainbowPets = {}
	self.arrivalFlowerBursts = {}
	self.liveRainbowPetFlowers = {}
	self.rainbowPetTemplateIds = {}
	self.rainbowPetPointTemplateIds = {}

	LeylineFlowerUtils.stopAllCameraFocus()
end

return ClientSpaceLeylineFlowerComponent
