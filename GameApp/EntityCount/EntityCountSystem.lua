-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\EntityCount\\EntityCountSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local SettingConst = require("Const.SettingConst")
local ClientConst = require("Const.ClientConst")
local Utils = require("Common.Utils.Utils")
local Const = require("Common.Const.Const")
local QuestUtils = require("GameApp.Quest.QuestUtils")
local EntityManager = require("Core.Common.EntityManager")
local Time = require("Core.Common.Time")
local SysConfigData = require("Data.sys_config_data")
local PuppetData = require("Data.puppet_data")
local QuestEntityData = require("Data.Quest.quest_entity_data")
local EntityCountScore = require("GameApp.EntityCount.EntityCountScore")
local EntityCountScheduler = require("GameApp.EntityCount.EntityCountScheduler")
local EntityCountSystem = Class.LightClass("EntityCountSystem", SystemBase)
local Config = require("GameApp.EntityCount.Config.EntityCountConfig")
local InfoIndex = Config.InfoIndex
local STATIC_ID, POSITION, STATE = InfoIndex.STATIC_ID, InfoIndex.POSITION, InfoIndex.STATE
local DISPLAY_LEVEL, TEMPLATE_ID = InfoIndex.DISPLAY_LEVEL, InfoIndex.TEMPLATE_ID
local EXEMPT_ACTIVE, CULLED_X, CULLED_Z = InfoIndex.EXEMPT_ACTIVE, InfoIndex.CULLED_X, InfoIndex.CULLED_Z
local RECOVERY_REVISION, LIFECYCLE_SERIAL, NO_MODEL = InfoIndex.RECOVERY_REVISION, InfoIndex.LIFECYCLE_SERIAL, InfoIndex.NO_MODEL
local NEGATIVE_INFINITY = -math.huge
local STATIC_ID_OPTIONAL_ENTITY_TYPES = {
	ClientPlayer = true,
	ClientPet = true
}
local EXEMPT_COUNT_EXCLUDED_TYPES = {
	ClientPlayer = true,
	ClientPet = true
}

function EntityCountSystem:_getNpcLoadConfigNumber(configKey, defaultValue)
	return EntityCountScore.readConfigNumber(configKey, defaultValue)
end

function EntityCountSystem:_isNpcInCameraSector(npcPos, cameraX, cameraZ, forwardX, forwardZ, forwardLengthSqr, loadConfig, isCreated, npcX, npcZ)
	return EntityCountScore.isInCameraSector(npcPos, cameraX, cameraZ, forwardX, forwardZ, forwardLengthSqr, loadConfig, isCreated, npcX, npcZ)
end

function EntityCountSystem:_calcNpcLoadWeight(playerPos, forwardX, forwardZ, forwardLengthSqr, npcPos, loadConfig, isCreated, cameraX, cameraZ, weightOnly, npcX, npcZ)
	return EntityCountScore.calculateWeight(self, playerPos, forwardX, forwardZ, forwardLengthSqr, npcPos, loadConfig, isCreated, cameraX, cameraZ, weightOnly, npcX, npcZ)
end

function EntityCountSystem:onInit()
	self.entityTypeAlias = {
		ClientStaticNpc = "NPC",
		ClientSimpleMoveNpc = "NPC"
	}
	self.serverEntityType = {
		ClientPuppet = {
			"Puppet"
		},
		NPC = {
			"StaticNpc",
			"SimpleMoveNpc"
		},
		ClientPlayer = {
			"Player"
		},
		ClientPet = {
			"Pet"
		},
		ClientEnvObject = {
			"EnvObject"
		}
	}
	self.entityCountLimit = Utils.deepCopyTable(SettingConst.EntityCountLimitHigh)
	self.ignoreCountLimitStaticIdMap = {}

	local ignoreCountLimitStaticIds = SysConfigData.IGNORE_COUNT_LIMIT_STATIC_IDS

	if ignoreCountLimitStaticIds ~= nil then
		for i, v in ipairs(ignoreCountLimitStaticIds) do
			self.ignoreCountLimitStaticIdMap[v] = 1
		end
	end

	self.npcSchedule = EntityCountScheduler.create(self)

	self:onClear()
	self:refreshEntityCountConfig()
end

function EntityCountSystem:onDestroy()
	self:onClear()
	table.clear(self.entityInfoPool)
end

function EntityCountSystem:_clearGroupMap(groups, keepOther, recycleInfo)
	for entityType, entries in pairs(groups) do
		if recycleInfo then
			for _, info in pairs(entries) do
				self:_releaseEntityInfo(info)
			end
		end

		table.clear(entries)

		if self.entityCountLimit[entityType] == nil and (not keepOther or entityType ~= "other") then
			groups[entityType] = nil
		end
	end
end

function EntityCountSystem:onClear()
	if self.npcSchedule then
		EntityCountScheduler.clear(self.npcSchedule)
	end

	self.entityInfoPool = self.entityInfoPool or {}
	self.entityInfoSerial = self.entityInfoSerial or 0
	self.infoPoolCapacity = EntityCountScheduler._readCapacity(Config.infoPoolCapacity, 0, "info pool")
	self.serverLimitLevel = self.serverLimitLevel or {}

	table.clear(self.serverLimitLevel)

	self.requestCreateMap = self.requestCreateMap or {}

	self:_clearGroupMap(self.requestCreateMap, true)

	self.pendingDestroyMap = self.pendingDestroyMap or {}

	self:_clearGroupMap(self.pendingDestroyMap, false)

	if self.billboardBridge then
		self.billboardBridge:clear()
	end

	self.entityInfo = self.entityInfo or {}

	self:_clearGroupMap(self.entityInfo, false, true)

	self.inBalancing = self.inBalancing or {}
	self.nextTickTime = self.nextTickTime or {}

	table.clear(self.inBalancing)
	table.clear(self.nextTickTime)

	self.nextCreateCheckTime = 0

	for k, _ in pairs(self.entityCountLimit) do
		self.entityInfo[k] = self.entityInfo[k] or {}
		self.requestCreateMap[k] = self.requestCreateMap[k] or {}
		self.pendingDestroyMap[k] = self.pendingDestroyMap[k] or {}
		self.inBalancing[k] = true
		self.nextTickTime[k] = 0
	end

	self.requestCreateMap.other = self.requestCreateMap.other or {}
	self.balanceSuspendReasons = self.balanceSuspendReasons or {}

	table.clear(self.balanceSuspendReasons)

	self.balanceResumeAt = nil
	self.entityTracingQuestInfo = self.entityTracingQuestInfo or {}

	table.clear(self.entityTracingQuestInfo)

	self.entityTracingQuestSetDirty = true
	self.npcRecoveryRevision = 0
	self.npcRecoveryQuests = self.npcRecoveryQuests or {
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	}

	self:_refreshNpcRecoveryQuests()
end

function EntityCountSystem:_normalizeType(entityType)
	return self.entityTypeAlias[entityType] or entityType
end

function EntityCountSystem:setCountLimit(classType, limit)
	self.entityCountLimit[classType] = limit

	if self.npcSchedule then
		EntityCountScheduler.invalidate(self.npcSchedule, classType)
	end
end

function EntityCountSystem:setEntityCountLimitLevel(level)
	local newCountLimit = SettingConst.EntityCountLimitLevel[level]

	for k, v in pairs(newCountLimit) do
		self:setCountLimit(k, v)
	end
end

function EntityCountSystem:refreshNoModelInteractionDistance()
	local config = Config
	local distance = config.noModelInteractionDistanceMeters
	local distanceSqr = distance * distance
	local enterDistance = math.max(0, distance - config.noModelInteractionReenterMarginMeters)
	local enterDistanceSqr = enterDistance * enterDistance

	if self.noModelInteractionDistanceSqr == distanceSqr and self.noModelInteractionEnterDistanceSqr == enterDistanceSqr then
		return
	end

	self.noModelInteractionDistanceSqr = distanceSqr
	self.noModelInteractionEnterDistanceSqr = enterDistanceSqr

	if self.npcSchedule then
		EntityCountScheduler.invalidate(self.npcSchedule, "NPC", true)
		EntityCountScheduler.invalidate(self.npcSchedule, "ClientPuppet", true)
	end

	if self.inBalancing then
		self.inBalancing.NPC = true
		self.nextTickTime.NPC = 0
		self.inBalancing.ClientPuppet = true
		self.nextTickTime.ClientPuppet = 0
	end
end

function EntityCountSystem:refreshEntityCountConfig()
	local config = Config

	self.noModelInteractionDistanceLimitEnabled = config.noModelInteractionDistanceLimitEnabled
	self.entityInfoPool = self.entityInfoPool or {}
	self.entityInfoSerial = self.entityInfoSerial or 0
	self.pendingDestroyMap = self.pendingDestroyMap or {}

	for entityType in pairs(self.entityCountLimit) do
		self.pendingDestroyMap[entityType] = self.pendingDestroyMap[entityType] or {}
	end

	for entityType, entities in pairs(self.entityInfo or {}) do
		for _, info in pairs(entities) do
			self:_refreshNoModelFlag(entityType, info)
		end
	end

	self.infoPoolCapacity = EntityCountScheduler._readCapacity(config.infoPoolCapacity, 0, "info pool")

	while #self.entityInfoPool > self.infoPoolCapacity do
		self.entityInfoPool[#self.entityInfoPool] = nil
	end

	self.rememberCulledPosition = config.rememberCulledPosition
	self.recoverTrackedNpc = config.recoverTrackedNpc

	if self.recoverTrackedNpc and self:_refreshNpcRecoveryQuests() then
		self.npcRecoveryRevision = self.npcRecoveryRevision + 1
		self.entityTracingQuestSetDirty = true
	end

	self.balanceTickDelay = IS_MOBILE and config.timing.mobileBalance or config.timing.desktopBalance
	self.envBalanceTickDelay = config.timing.envBalance
	self.normalTickDelay = config.timing.stable
	self.pendingRetryDelay = config.timing.pendingRetry
	self.nextCreateCheckTime = 0
	self.nearestSearchDistanceSqr = config.timing.nearestSearchRadius^2
	self.replaceScoreMargin = config.replaceScoreMargin
	self.npcLoadWeightConfig = EntityCountScore.createConfig(self, config, self.npcLoadWeightConfig)

	self:refreshNoModelInteractionDistance()

	if self.npcSchedule then
		EntityCountScheduler.refreshConfig(self.npcSchedule)
	end

	if self.nextTickTime then
		for entityType in pairs(self.nextTickTime) do
			self.nextTickTime[entityType], self.inBalancing[entityType] = 0, true
		end
	end
end

function EntityCountSystem:EVENT_PostReload()
	self:refreshEntityCountConfig()
end

function EntityCountSystem:onSceneLoaded(sceneId, sceneName)
	return
end

function EntityCountSystem:_recoverTrackedNpc(info, staticId)
	if self.recoverTrackedNpc and info[RECOVERY_REVISION] ~= self.npcRecoveryRevision then
		if self:hasTracingQuest(staticId) then
			info[EXEMPT_ACTIVE], info[CULLED_X], info[CULLED_Z] = false, false, false
		end

		info[RECOVERY_REVISION] = self.npcRecoveryRevision
	end
end

function EntityCountSystem:isCullingExempt(entityType, staticId, displayLevel, entityId, entityPos, playerPos, info)
	local cachedX, cachedZ
	local puppetType = entityType == "NPC" or entityType == "ClientPuppet"

	info = info or puppetType and entityId and self.entityInfo[entityType][entityId]

	if puppetType and info and info[CULLED_X] and info[STATE] ~= ClientConst.EntityCount.CREATED and self.rememberCulledPosition then
		self:_recoverTrackedNpc(info, staticId)

		if info[CULLED_X] then
			cachedX, cachedZ = info[CULLED_X], info[CULLED_Z]
		end
	end

	local unlimited = (staticId == nil or staticId == 0) and not STATIC_ID_OPTIONAL_ENTITY_TYPES[entityType] or self.ignoreCountLimitStaticIdMap[staticId] ~= nil or displayLevel >= 1 or self:hasTracingQuest(staticId)

	if unlimited then
		if info then
			info[EXEMPT_ACTIVE] = false
		end

		return true
	end

	local noModel = puppetType and info and info[NO_MODEL]

	if not noModel then
		if info then
			info[EXEMPT_ACTIVE] = false
		end

		return false, nil, cachedX, cachedZ
	end

	if not self.noModelInteractionDistanceLimitEnabled then
		return true
	end

	playerPos = pg.playerPos or playerPos

	if playerPos == nil then
		return false
	end

	local entity = cachedX == nil and entityId and EntityManager.getEntity(entityId)

	if entity then
		entityPos = entity:getPosition()
	end

	if entityPos == nil and cachedX == nil then
		return false
	end

	local offsetX = (cachedX or entityPos[1]) - playerPos[1]
	local offsetZ = (cachedZ or entityPos[3]) - playerPos[3]
	local threshold = info[EXEMPT_ACTIVE] and self.noModelInteractionDistanceSqr or self.noModelInteractionEnterDistanceSqr
	local ignored = threshold >= offsetX * offsetX + offsetZ * offsetZ

	info[EXEMPT_ACTIVE] = ignored

	return ignored, cachedX == nil and entityPos or nil, cachedX, cachedZ
end

function EntityCountSystem:getEffectiveCountLimit(entityType)
	local limit = self.entityCountLimit[entityType]

	if entityType ~= "NPC" or limit <= 0 then
		return limit
	end

	local entities = self.entityInfo.NPC
	local exemptCount = 0

	for _, serverType in ipairs(self.serverEntityType.NPC) do
		for entityId in pairs(EntityManager.getEntitiesByType(serverType)) do
			local info = entities[entityId]

			if info and info[STATE] == ClientConst.EntityCount.CREATED and self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION]) then
				exemptCount = exemptCount + 1
			end
		end
	end

	for entityId in pairs(self.requestCreateMap.NPC) do
		local info = entities[entityId]

		if info and self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION]) then
			exemptCount = exemptCount + 1
		end
	end

	return math.max(limit, exemptCount + math.min(limit, Config.ordinaryNpcReserve))
end

function EntityCountSystem:onSpaceDestroy(space)
	self:onClear()
end

function EntityCountSystem:getEntitySummaryState(entityType, entityId, isFullSync)
	local info = self.entityInfo[entityType][entityId]

	if info and not isFullSync then
		return info[STATE]
	end

	if EntityManager.getEntity(entityId) then
		return ClientConst.EntityCount.CREATED
	end

	if self.requestCreateMap[entityType][entityId] then
		return ClientConst.EntityCount.CREATING
	end

	return ClientConst.EntityCount.NOT_CREATED
end

function EntityCountSystem:isCreationCandidate(entityType, entityId, info)
	if self.requestCreateMap[entityType][entityId] ~= nil then
		return false
	end

	local state = info[STATE]

	return state == ClientConst.EntityCount.NOT_CREATED or state == ClientConst.EntityCount.BILLBOARD
end

function EntityCountSystem:getNoModelInteractionDecision(entityType, entityId, info, playerPos)
	if not self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION], playerPos, info) then
		return NEGATIVE_INFINITY
	end

	return self:isCreationCandidate(entityType, entityId, info) and math.huge or nil
end

function EntityCountSystem:selectCreationCandidate(entityType, entities, id, weight, bestId, bestWeight)
	if bestWeight < weight then
		if bestWeight ~= math.huge then
			self:showCulledEntity(entityType, bestId, entities[bestId])
		end

		return id, weight
	end

	if weight ~= math.huge then
		self:showCulledEntity(entityType, id, entities[id])
	end

	return bestId, bestWeight
end

function EntityCountSystem:_refreshNoModelFlag(entityType, info)
	local puppetData = (entityType == "NPC" or entityType == "ClientPuppet") and PuppetData[info[TEMPLATE_ID]]
	local noModel = puppetData and puppetData.appearanceToPrefabResID == nil and puppetData.prefabResID == nil or false

	if info[NO_MODEL] ~= noModel then
		info[EXEMPT_ACTIVE] = false
	end

	info[NO_MODEL] = noModel
end

function EntityCountSystem:_acquireEntityInfo(staticId, pos, state, displayLevel, templateId)
	local pool = self.entityInfoPool
	local count = #pool
	local info = pool[count]

	if info then
		pool[count] = nil
	else
		info = {
			false,
			{
				0,
				0,
				0
			},
			0,
			0,
			0,
			false,
			false,
			false,
			0,
			0,
			false
		}
	end

	self.entityInfoSerial = self.entityInfoSerial + 1

	local position = info[POSITION]

	position[1], position[2], position[3] = pos[1], pos[2], pos[3]
	info[STATIC_ID], info[STATE], info[DISPLAY_LEVEL], info[TEMPLATE_ID] = staticId, state, displayLevel, templateId
	info[EXEMPT_ACTIVE], info[CULLED_X], info[CULLED_Z], info[RECOVERY_REVISION], info[LIFECYCLE_SERIAL] = false, false, false, self.npcRecoveryRevision, self.entityInfoSerial
	info[NO_MODEL] = false

	return info
end

function EntityCountSystem:_releaseEntityInfo(info)
	if not info or not info[LIFECYCLE_SERIAL] or info[LIFECYCLE_SERIAL] == 0 then
		return
	end

	local position = info[POSITION]

	table.clear(info)
	table.clear(position)

	position[1], position[2], position[3] = 0, 0, 0
	info[POSITION], info[LIFECYCLE_SERIAL] = position, 0

	local pool = self.entityInfoPool

	if #pool < self.infoPoolCapacity then
		pool[#pool + 1] = info
	end
end

function EntityCountSystem:addEntityInfo(entityId, entityType, staticId, pos, displayLevel, templateId, isFullSync)
	entityType = self:_normalizeType(entityType)

	if self.entityInfo[entityType] ~= nil then
		local state = self:getEntitySummaryState(entityType, entityId, isFullSync)
		local oldInfo = self.entityInfo[entityType][entityId]

		self:refreshBillboardSummary(entityId, oldInfo, pos, templateId, staticId)

		local info = self:_acquireEntityInfo(staticId, pos, state, displayLevel, templateId)

		self:_refreshNoModelFlag(entityType, info)

		if (entityType == "NPC" or entityType == "ClientPuppet") and oldInfo and oldInfo[STATIC_ID] == staticId and oldInfo[TEMPLATE_ID] == templateId and oldInfo[POSITION][1] == pos[1] and oldInfo[POSITION][3] == pos[3] then
			info[EXEMPT_ACTIVE], info[CULLED_X], info[CULLED_Z], info[RECOVERY_REVISION] = oldInfo[EXEMPT_ACTIVE], oldInfo[CULLED_X], oldInfo[CULLED_Z], oldInfo[RECOVERY_REVISION]
		end

		local serial = info[LIFECYCLE_SERIAL]

		self.entityInfo[entityType][entityId] = info

		if self.npcSchedule then
			EntityCountScheduler.onAdded(self.npcSchedule, entityType, entityId, info)
		end

		self:_releaseEntityInfo(oldInfo)

		if self:isCullingExempt(entityType, staticId, displayLevel, entityId, info[POSITION], nil, info) then
			self:requestEntityToCreate(entityId, entityType, true)

			if self.entityInfo[entityType][entityId] ~= info or info[LIFECYCLE_SERIAL] ~= serial then
				return
			end

			if oldInfo == nil or isFullSync then
				info[STATE] = self:getEntitySummaryState(entityType, entityId, true)
			end
		end
	else
		self:requestEntityToCreate(entityId, entityType, true)
	end
end

function EntityCountSystem:_markEntityState(entityId, state)
	for k, v in pairs(self.entityInfo) do
		if v[entityId] ~= nil then
			self.entityInfo[k][entityId][STATE] = state

			if (k == "NPC" or k == "ClientPuppet") and state == ClientConst.EntityCount.CREATED then
				local info = self.entityInfo[k][entityId]

				info[CULLED_X], info[CULLED_Z], info[RECOVERY_REVISION] = false, false, self.npcRecoveryRevision
			end

			if self.npcSchedule then
				EntityCountScheduler.invalidate(self.npcSchedule, k)
			end

			break
		end
	end

	for k, v in pairs(self.requestCreateMap) do
		if v[entityId] ~= nil then
			self.requestCreateMap[k][entityId] = nil

			break
		end
	end
end

function EntityCountSystem:markEntityCreated(entityId)
	local entity = EntityManager.getEntity(entityId)

	if entity ~= nil and entity.className == "ClientPet" and pg.me ~= nil and entity.masterId == pg.me.id then
		local oldInfo = self.entityInfo.ClientPet[entityId]

		self.entityInfo.ClientPet[entityId] = self:_acquireEntityInfo(entity.staticId, entity:getPosition(), ClientConst.EntityCount.CREATED, 1, entity.templateId)

		self:_releaseEntityInfo(oldInfo)
	end

	self:_markEntityState(entityId, ClientConst.EntityCount.CREATED)
end

function EntityCountSystem:markEntityNotCreated(entityId)
	local state = self.billboardBridge and self.billboardBridge:has(entityId) and ClientConst.EntityCount.BILLBOARD or ClientConst.EntityCount.NOT_CREATED

	self:_markEntityState(entityId, state)
end

function EntityCountSystem:removeEntityInfo(entityId)
	if self.billboardBridge then
		self.billboardBridge:remove(entityId)
	end

	for k, v in pairs(self.entityInfo) do
		if v[entityId] ~= nil then
			local info = v[entityId]

			self.entityInfo[k][entityId] = nil

			if self.npcSchedule then
				EntityCountScheduler.onRemoved(self.npcSchedule, k, entityId)
			end

			self:_releaseEntityInfo(info)

			break
		end
	end

	for k, v in pairs(self.requestCreateMap) do
		if v[entityId] ~= nil then
			self.requestCreateMap[k][entityId] = nil

			break
		end
	end
end

function EntityCountSystem:requestEntityToCreate(entityId, entityType, force)
	entityType = self:_normalizeType(entityType)

	if self.serverEntityType[entityType] == nil then
		entityType = "other"
	end

	local isFound = false

	if not force then
		local info = self.entityInfo[entityType]

		if info ~= nil and info[entityId] ~= nil and self:isCreationCandidate(entityType, entityId, info[entityId]) then
			info[entityId][STATE] = ClientConst.EntityCount.CREATING
			isFound = true
		end
	end

	if (isFound or force) and self.requestCreateMap[entityType][entityId] == nil then
		self.requestCreateMap[entityType][entityId] = Time.getTickSecond()

		self:sendRpc(entityId)
	end
end

function EntityCountSystem:sendRpc(entityId)
	if pg.me ~= nil then
		pg.me:serverMsg("RPC_CS_RequestCreateClientEntity", entityId)
	end
end

function EntityCountSystem:_getNpcDistanceSqr(info, playerPos)
	local x, z = info[POSITION][1], info[POSITION][3]

	if info[CULLED_X] and info[STATE] ~= ClientConst.EntityCount.CREATED and self.rememberCulledPosition then
		self:_recoverTrackedNpc(info, info[STATIC_ID])

		if info[CULLED_X] then
			x, z = info[CULLED_X], info[CULLED_Z]
		end
	end

	local dx, dz = x - playerPos[1], z - playerPos[3]

	return dx * dx + dz * dz
end

function EntityCountSystem:findNearestEntityId(entityType, entities)
	local playerPos = pg.playerPos
	local minEntityId
	local minDist = self.nearestSearchDistanceSqr
	local dist

	for id, info in pairs(entities) do
		if self:isCreationCandidate(entityType, id, info) then
			dist = (entityType == "NPC" or entityType == "ClientPuppet") and self:_getNpcDistanceSqr(info, playerPos) or Utils.squareDistNoYAxis(playerPos, info[POSITION])

			local exempt = (entityType == "NPC" or entityType == "ClientPuppet" or info[STATE] == ClientConst.EntityCount.BILLBOARD) and self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], id, info[POSITION], playerPos)

			if exempt then
				dist = NEGATIVE_INFINITY
			elseif info[NO_MODEL] then
				dist = math.huge
			end

			minEntityId, dist = self:selectCreationCandidate(entityType, entities, id, -dist, minEntityId, -minDist)
			minDist = -dist
		end
	end

	return minEntityId, minDist
end

function EntityCountSystem:findFarthestEntityId(entityType, entities)
	local playerPos = pg.playerPos
	local maxEntityId
	local maxDist = 0
	local dist

	for id, info in pairs(entities) do
		if info[STATE] == ClientConst.EntityCount.CREATED and not self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], id, info[POSITION], playerPos) then
			dist = Utils.squareDistNoYAxis(playerPos, info[POSITION])

			if maxDist < dist then
				maxDist = dist
				maxEntityId = id
			end
		end
	end

	return maxEntityId, maxDist
end

function EntityCountSystem:findNearestAndFarthestEntityId(entityType, entities)
	local playerPos = pg.playerPos
	local minEntityId
	local minDist = self.nearestSearchDistanceSqr
	local maxEntityId
	local maxDist = 0
	local dist

	for id, info in pairs(entities) do
		local exempt = (entityType == "NPC" or entityType == "ClientPuppet" or info[STATE] == ClientConst.EntityCount.CREATED or info[STATE] == ClientConst.EntityCount.BILLBOARD) and self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], id, info[POSITION], playerPos)

		if self:isCreationCandidate(entityType, id, info) then
			dist = (entityType == "NPC" or entityType == "ClientPuppet") and self:_getNpcDistanceSqr(info, playerPos) or Utils.squareDistNoYAxis(playerPos, info[POSITION])

			if exempt then
				dist = NEGATIVE_INFINITY
			elseif info[NO_MODEL] then
				dist = math.huge
			end

			minEntityId, dist = self:selectCreationCandidate(entityType, entities, id, -dist, minEntityId, -minDist)
			minDist = -dist
		elseif info[STATE] == ClientConst.EntityCount.CREATED and not exempt then
			dist = info[NO_MODEL] and math.huge or Utils.squareDistNoYAxis(playerPos, info[POSITION])

			if maxDist < dist then
				maxDist = dist
				maxEntityId = id
			end
		end
	end

	return minEntityId, minDist, maxEntityId, maxDist
end

function EntityCountSystem:getNpcLoadWeightContext()
	return EntityCountScore.sampleContext()
end

function EntityCountSystem:_getNpcCandidateWeight(entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, loadConfig, cameraX, cameraZ, resolvedPos, resolvedX, resolvedZ)
	return EntityCountScore.getCandidateWeight(self, entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, loadConfig, cameraX, cameraZ, resolvedPos, resolvedX, resolvedZ)
end

function EntityCountSystem:getCreatedExemptCount(entityType, entities)
	local count = 0

	for entityId, info in pairs(entities) do
		if info[STATE] == ClientConst.EntityCount.CREATED and self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION]) then
			count = count + 1
		end
	end

	return count
end

function EntityCountSystem:getCountedPendingCreateCount(entityType)
	local count = 0
	local pendingMap = self.requestCreateMap[entityType]

	if pendingMap == nil then
		return count
	end

	local entities = self.entityInfo[entityType]

	for entityId in pairs(pendingMap) do
		local info = entities and entities[entityId]

		if not EXEMPT_COUNT_EXCLUDED_TYPES[entityType] or info == nil or not self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION]) then
			count = count + 1
		end
	end

	return count
end

function EntityCountSystem:getDisplayLevel1CountByType()
	local ret = {}

	for k, entities in pairs(self.entityInfo) do
		local count = 0

		for _, info in pairs(entities) do
			if info[STATE] == ClientConst.EntityCount.CREATED and info[DISPLAY_LEVEL] >= 1 then
				count = count + 1
			end
		end

		ret[k] = count
	end

	return ret
end

function EntityCountSystem:sortEntityDistAndCreateForType(k, v)
	local newBalance = false
	local createEntityId, minDist, destroyEntityId, maxDist = self:findNearestAndFarthestEntityId(k, v)

	if maxDist == math.huge then
		self:destroyEntity(destroyEntityId, k)

		self.inBalancing[k] = true

		return
	end

	if minDist == NEGATIVE_INFINITY then
		self:requestEntityToCreate(createEntityId, k, false)

		self.inBalancing[k] = true

		return
	end

	local curCount = self:getRealAndPendingCount(k)

	if EXEMPT_COUNT_EXCLUDED_TYPES[k] then
		curCount = curCount - self:getCreatedExemptCount(k, v)
	end

	local limit = self:getEffectiveCountLimit(k)

	if curCount < limit then
		if createEntityId ~= nil then
			self:requestEntityToCreate(createEntityId, k, false)

			newBalance = true
		end
	elseif curCount == limit then
		if minDist < maxDist and destroyEntityId ~= nil and self:destroyEntity(destroyEntityId, k) then
			self:requestEntityToCreate(createEntityId, k, false)

			newBalance = true
		end
	elseif limit < curCount and destroyEntityId ~= nil then
		self:destroyEntity(destroyEntityId, k)

		newBalance = true
	end

	self:showCulledEntity(k, createEntityId, v[createEntityId])

	self.inBalancing[k] = newBalance
end

function EntityCountSystem:getRealAndPendingCount(entityType)
	local count = self:getCountedPendingCreateCount(entityType)

	for _, serverType in ipairs(self.serverEntityType[entityType]) do
		count = count + pg.global.entityMgr.getEntityCountByType(serverType)
	end

	for entityId in pairs(self.pendingDestroyMap[entityType]) do
		local entity = EntityManager.getEntity(entityId)

		if entity and entity._isDestroyingEntity then
			count = count - 1
		else
			self.pendingDestroyMap[entityType][entityId] = nil
		end
	end

	return count
end

function EntityCountSystem:replaceCountedEntity(createEntityId, destroyEntityId, entityType)
	if not self:destroyEntity(destroyEntityId, entityType) then
		return false
	end

	self:requestEntityToCreate(createEntityId, entityType, false)

	return true
end

function EntityCountSystem:sortWeightAndCreateForType(entityType, entities)
	local playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ = self:getNpcLoadWeightContext()

	if playerPos == nil then
		self:sortEntityDistAndCreateForType(entityType, entities)

		return
	end

	local createEntityId, createWeight, destroyEntityId, destroyWeight = EntityCountScore.findCandidates(self, entityType, entities, playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ)

	if destroyWeight == NEGATIVE_INFINITY and destroyEntityId and entities[destroyEntityId][NO_MODEL] then
		self:destroyEntity(destroyEntityId, entityType)

		self.inBalancing[entityType] = true

		return
	end

	if createWeight == math.huge then
		self:requestEntityToCreate(createEntityId, entityType, false)

		self.inBalancing[entityType] = true

		return
	end

	local curCount = self:getRealAndPendingCount(entityType)
	local limit = self:getEffectiveCountLimit(entityType)
	local newBalance = false

	if destroyWeight == NEGATIVE_INFINITY and createEntityId == nil then
		self:destroyEntity(destroyEntityId, entityType)

		newBalance = true
	elseif curCount < limit then
		if createEntityId ~= nil then
			self:requestEntityToCreate(createEntityId, entityType, false)

			newBalance = true
		end
	elseif curCount == limit then
		if createWeight > destroyWeight + self.replaceScoreMargin then
			newBalance = self:replaceCountedEntity(createEntityId, destroyEntityId, entityType)
		end
	elseif destroyEntityId ~= nil then
		self:destroyEntity(destroyEntityId, entityType)

		newBalance = true
	end

	self:showCulledEntity(entityType, createEntityId, entities[createEntityId])

	self.inBalancing[entityType] = newBalance
end

function EntityCountSystem:destroyOneFarthestEntity()
	local destroyEntityId, destroyClassType
	local maxDist = 0

	for classType, entities in pairs(self.entityInfo) do
		local entityId, dist = self:findFarthestEntityId(classType, entities)

		if entityId ~= nil and maxDist < dist then
			destroyEntityId = entityId
			destroyClassType = classType
			maxDist = dist
		end
	end

	if destroyEntityId ~= nil then
		self:destroyEntity(destroyEntityId, destroyClassType)
	end

	return destroyEntityId
end

function EntityCountSystem:checkEntityCreate()
	local current = Time.getTickSecond()

	for k, v in pairs(self.requestCreateMap) do
		for id, time in pairs(v) do
			if current > time + self.pendingRetryDelay then
				self:sendRpc(id)

				self.requestCreateMap[k][id] = current
			end
		end
	end
end

function EntityCountSystem:suspendBalance(reason)
	if reason == nil then
		return
	end

	self.balanceSuspendReasons[reason] = true

	if self.npcSchedule then
		EntityCountScheduler.wake(self.npcSchedule)
	end
end

function EntityCountSystem:resumeBalance(reason, delaySeconds)
	if reason == nil then
		return
	end

	self.balanceSuspendReasons[reason] = nil

	if delaySeconds ~= nil and next(self.balanceSuspendReasons) == nil then
		self.balanceResumeAt = Time.getTickSecond() + delaySeconds
	end

	if self.npcSchedule then
		EntityCountScheduler.wake(self.npcSchedule)
	end
end

function EntityCountSystem:isBalanceSuspended()
	if next(self.balanceSuspendReasons) ~= nil then
		return true
	end

	if self.balanceResumeAt ~= nil then
		if Time.getTickSecond() < self.balanceResumeAt then
			return true
		end

		self.balanceResumeAt = nil
	end

	return false
end

function EntityCountSystem:onTick()
	if self:isBalanceSuspended() or pg.playerPos == nil then
		return
	end

	local currentTime = Time.getTickSecond()
	local generation = self.npcSchedule and self.npcSchedule.generation
	local fastSchedule = self.npcSchedule and self.npcSchedule.config.enabled and EntityCountScheduler.tick(self.npcSchedule, currentTime)

	if self:isBalanceSuspended() or self.npcSchedule and self.npcSchedule.generation ~= generation then
		return
	end

	local anyTicked = false

	for k, v in pairs(self.entityInfo) do
		if currentTime >= (self.nextTickTime[k] or 0) then
			if k == "ClientPuppet" or k == "NPC" then
				if not fastSchedule then
					self:sortWeightAndCreateForType(k, v)
				end
			else
				self:sortEntityDistAndCreateForType(k, v)
			end

			local delay

			if self.inBalancing[k] then
				delay = k == "ClientEnvObject" and self.envBalanceTickDelay or self.balanceTickDelay
			else
				delay = self.normalTickDelay
			end

			self.nextTickTime[k] = currentTime + delay
			anyTicked = true
		end
	end

	if anyTicked and (not fastSchedule or currentTime >= self.nextCreateCheckTime) then
		self:checkEntityCreate()

		self.nextCreateCheckTime = currentTime + self.normalTickDelay
	end
end

function EntityCountSystem:refreshEntityPositionData(entittId, pos)
	for k, v in pairs(self.entityInfo) do
		local info = v[entittId]

		if info then
			if (k == "NPC" or k == "ClientPuppet") and (info[POSITION][1] ~= pos[1] or info[POSITION][3] ~= pos[3]) then
				info[EXEMPT_ACTIVE], info[CULLED_X], info[CULLED_Z], info[RECOVERY_REVISION] = false, false, false, self.npcRecoveryRevision
				self.inBalancing[k], self.nextTickTime[k] = true, 0
			end

			if not info[LIFECYCLE_SERIAL] then
				self.entityInfoSerial = self.entityInfoSerial + 1
				info[POSITION], info[LIFECYCLE_SERIAL] = {
					pos[1],
					pos[2],
					pos[3]
				}, self.entityInfoSerial
			else
				local position = info[POSITION]

				position[1], position[2], position[3] = pos[1], pos[2], pos[3]
			end

			if self.npcSchedule then
				EntityCountScheduler.invalidate(self.npcSchedule, k)
			end

			if self.billboardBridge and info[STATE] == ClientConst.EntityCount.BILLBOARD then
				self.billboardBridge:updatePosition(entittId, info[POSITION])
			end
		end
	end
end

function EntityCountSystem:hasTracingQuest(staticId)
	if self.entityTracingQuestSetDirty then
		self:rebuildEntityTracingQuestInfo()
	end

	return self.entityTracingQuestInfo[staticId] == true
end

function EntityCountSystem:_addTracingQuestStaticId(questId)
	if questId == nil then
		return
	end

	local questData = QuestUtils.getQuestData(questId)
	local entityInfos = QuestEntityData[questId]

	if questData ~= nil and entityInfos ~= nil then
		for _, entityInfo in pairs(entityInfos) do
			if entityInfo.staticId ~= nil and entityInfo.staticId ~= 0 and entityInfo.state == questData.state then
				self.entityTracingQuestInfo[entityInfo.staticId] = true
			end
		end
	end
end

function EntityCountSystem:rebuildEntityTracingQuestInfo()
	table.clear(self.entityTracingQuestInfo)

	if pg.me == nil then
		return
	end

	self:_addTracingQuestStaticId(pg.me.curTraceTempQuest)
	self:_addTracingQuestStaticId(pg.me.curTraceQuest)
	self:_addTracingQuestStaticId(pg.me.curTraceStoryQuest)
	self:_addTracingQuestStaticId(pg.me.curTraceSecondQuest)

	self.entityTracingQuestSetDirty = false
end

function EntityCountSystem:_refreshNpcRecoveryQuest(slot, questId)
	local data = questId and QuestUtils.getQuestData(questId)
	local state = data and data.state or false

	questId = questId or false

	local snapshot = self.npcRecoveryQuests
	local changed = snapshot[slot] ~= questId or snapshot[slot + 1] ~= state

	snapshot[slot], snapshot[slot + 1] = questId, state

	return changed
end

function EntityCountSystem:_refreshNpcRecoveryQuests()
	local me = pg.me
	local temp = self:_refreshNpcRecoveryQuest(1, me and me.curTraceTempQuest)
	local main = self:_refreshNpcRecoveryQuest(3, me and me.curTraceQuest)
	local story = self:_refreshNpcRecoveryQuest(5, me and me.curTraceStoryQuest)
	local second = self:_refreshNpcRecoveryQuest(7, me and me.curTraceSecondQuest)

	return temp or main or story or second
end

function EntityCountSystem:markEntityTracingQuestDirty()
	self.entityTracingQuestSetDirty = true

	local recover = self.recoverTrackedNpc and self:_refreshNpcRecoveryQuests()

	if recover then
		self.npcRecoveryRevision = self.npcRecoveryRevision + 1
		self.inBalancing.NPC, self.nextTickTime.NPC = true, 0
	end

	if self.npcSchedule then
		EntityCountScheduler.invalidate(self.npcSchedule)

		if recover then
			EntityCountScheduler.invalidate(self.npcSchedule, "NPC", true)
		end
	end
end

function EntityCountSystem:onEntityAnimatorReady(entity)
	if EntityManager.getEntity(entity.id) ~= entity then
		return
	end

	if entity._isDestroyingEntity then
		return
	end

	if self.billboardBridge then
		self.billboardBridge:remove(entity.id)
	end
end

function EntityCountSystem:_getBillboardBridge(entityType)
	local bridge = require("Entities.Utils.BillboardEntityBridge").getForEntityType(entityType)

	if bridge then
		self.billboardBridge = bridge
	end

	return bridge
end

function EntityCountSystem:refreshBillboardSummary(entityId, oldInfo, position, templateId, staticId)
	local bridge = self.billboardBridge

	if not bridge or not oldInfo then
		return
	end

	if oldInfo[TEMPLATE_ID] ~= templateId or oldInfo[STATIC_ID] ~= staticId then
		bridge:remove(entityId)
	else
		bridge:updatePosition(entityId, position)
	end
end

function EntityCountSystem:showCulledEntity(entityType, entityId, info)
	if not info or not self:isCreationCandidate(entityType, entityId, info) then
		return
	end

	if info[NO_MODEL] and self.noModelInteractionDistanceLimitEnabled then
		if self.billboardBridge then
			self.billboardBridge:remove(entityId)
		end

		if info[STATE] == ClientConst.EntityCount.BILLBOARD then
			info[STATE] = ClientConst.EntityCount.NOT_CREATED
		end

		return
	end

	local bridge = self:_getBillboardBridge(entityType)

	if bridge and bridge:show(entityId, info[TEMPLATE_ID], info[POSITION], info[STATIC_ID]) then
		info[STATE] = ClientConst.EntityCount.BILLBOARD
	elseif info[STATE] == ClientConst.EntityCount.BILLBOARD and bridge and not bridge:has(entityId) then
		info[STATE] = ClientConst.EntityCount.NOT_CREATED
	end
end

function EntityCountSystem:destroyEntity(entityId, entityType)
	local entities = self.entityInfo[entityType]
	local info = entities and entities[entityId]

	if not info then
		return false
	end

	local serial = info[LIFECYCLE_SERIAL]
	local entity = EntityManager.getEntity(entityId)
	local lastX, lastZ
	local summaryX, summaryZ = info[POSITION][1], info[POSITION][3]
	local recoveryRevision = self.npcRecoveryRevision
	local noModelPuppet = entityType == "ClientPuppet" and info[NO_MODEL]

	if self.rememberCulledPosition and (entityType == "NPC" or noModelPuppet) and entity then
		local position = entity:getPosition()

		lastX, lastZ = position[1], position[3]
	end

	local bridge

	if info[NO_MODEL] and self.noModelInteractionDistanceLimitEnabled then
		if self.billboardBridge then
			self.billboardBridge:remove(entityId)
		end
	else
		bridge = self:_getBillboardBridge(entityType)
	end

	local px, py, pz, qx, qy, qz, qw, scale

	if bridge then
		px, py, pz, qx, qy, qz, qw, scale = bridge:captureTransform(entity, info[POSITION])
	end

	if not entity or not entity._isDestroyingEntity then
		pg.me:_destroyClientEntity(entityId)
	end

	if self.entityInfo[entityType][entityId] ~= info or info[LIFECYCLE_SERIAL] ~= serial then
		return false
	end

	local remainingEntity = EntityManager.getEntity(entityId)

	if remainingEntity and (remainingEntity ~= entity or not remainingEntity._isDestroyingEntity) then
		return false
	end

	if remainingEntity then
		self.pendingDestroyMap[entityType][entityId] = true
	end

	if lastX ~= nil and info[POSITION][1] == summaryX and info[POSITION][3] == summaryZ then
		info[EXEMPT_ACTIVE], info[CULLED_X], info[CULLED_Z], info[RECOVERY_REVISION] = false, lastX, lastZ, recoveryRevision
	end

	if bridge then
		bridge:showAt(entityId, info[TEMPLATE_ID], px, py, pz, qx, qy, qz, qw, scale, info[STATIC_ID])
	end

	self:markEntityNotCreated(entityId)

	return true
end

return EntityCountSystem
