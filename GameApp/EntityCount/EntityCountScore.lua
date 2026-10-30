-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\EntityCount\\EntityCountScore.lua

local InfoIndex = require("GameApp.EntityCount.Config.EntityCountConfig").InfoIndex
local STATIC_ID, POSITION, STATE = InfoIndex.STATIC_ID, InfoIndex.POSITION, InfoIndex.STATE
local DISPLAY_LEVEL, NO_MODEL = InfoIndex.DISPLAY_LEVEL, InfoIndex.NO_MODEL
local EntityManager = require("Core.Common.EntityManager")
local SysConfigData = require("Data.sys_config_data")
local ClientConst = require("Const.ClientConst")
local EntityCountScore = {}
local NEGATIVE_INFINITY = -math.huge

function EntityCountScore.isInCameraSector(npcPos, cameraX, cameraZ, forwardX, forwardZ, forwardLengthSqr, loadConfig, isCreated, npcX, npcZ)
	local viewOffsetX = (npcX or npcPos[1]) - cameraX
	local viewOffsetZ = (npcZ or npcPos[3]) - cameraZ
	local viewDistanceSqr = viewOffsetX * viewOffsetX + viewOffsetZ * viewOffsetZ

	if viewDistanceSqr <= loadConfig.epsilon then
		return true
	elseif forwardLengthSqr > loadConfig.epsilon then
		local dot = forwardX * viewOffsetX + forwardZ * viewOffsetZ
		local dotSqr = dot * dot
		local cosHalfAngle = loadConfig.cosHalfAngle
		local cosHalfAngleSqr = loadConfig.cosHalfAngleSqr

		if isCreated then
			cosHalfAngle = loadConfig.cosRetainHalfAngle
			cosHalfAngleSqr = loadConfig.cosRetainHalfAngleSqr
		end

		local thresholdSqr = cosHalfAngleSqr * forwardLengthSqr * viewDistanceSqr

		if cosHalfAngle >= 0 then
			return dot >= 0 and thresholdSqr <= dotSqr
		else
			return dot >= 0 or dotSqr <= thresholdSqr
		end
	end

	return false
end

function EntityCountScore:calculateWeight(playerPos, forwardX, forwardZ, forwardLengthSqr, npcPos, loadConfig, isCreated, cameraX, cameraZ, weightOnly, npcX, npcZ)
	local offsetX = (npcX or npcPos[1]) - playerPos[1]
	local offsetZ = (npcZ or npcPos[3]) - playerPos[3]
	local distanceSqr = offsetX * offsetX + offsetZ * offsetZ
	local isNear = distanceSqr <= loadConfig.nearSqr

	if isNear and weightOnly then
		return loadConfig.baseScore - distanceSqr
	elseif weightOnly and distanceSqr > loadConfig.frontSqr and distanceSqr > loadConfig.farSqr then
		return NEGATIVE_INFINITY
	end

	local inFront

	if self then
		inFront = self:_isNpcInCameraSector(npcPos, cameraX, cameraZ, forwardX, forwardZ, forwardLengthSqr, loadConfig, isCreated, npcX, npcZ)
	else
		inFront = EntityCountScore.isInCameraSector(npcPos, cameraX, cameraZ, forwardX, forwardZ, forwardLengthSqr, loadConfig, isCreated, npcX, npcZ)
	end

	local region

	if isNear then
		region = inFront and 1 or 2
	elseif inFront and distanceSqr <= loadConfig.frontSqr then
		region = 3
	elseif distanceSqr <= loadConfig.farSqr then
		region = 4
	else
		return NEGATIVE_INFINITY, 0, distanceSqr, inFront
	end

	local weight = loadConfig.baseScore - distanceSqr

	if inFront and not isNear then
		weight = weight + loadConfig.frontDistanceDiscount * (distanceSqr - loadConfig.nearSqr)
	end

	if weightOnly then
		return weight
	end

	return weight, region, distanceSqr, inFront
end

function EntityCountScore:getCandidateWeight(entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, loadConfig, cameraX, cameraZ, resolvedPos, resolvedX, resolvedZ)
	local isCreated = info[STATE] == ClientConst.EntityCount.CREATED
	local npcPos = resolvedPos or info[POSITION]

	if isCreated and resolvedPos == nil and resolvedX == nil then
		local entity = EntityManager.getEntity(entityId)

		if entity ~= nil then
			npcPos = entity:getPosition()
		end
	end

	local weight

	if self then
		weight = self:_calcNpcLoadWeight(playerPos, forwardX, forwardZ, forwardLengthSqr, npcPos, loadConfig, isCreated, cameraX, cameraZ, true, resolvedX, resolvedZ)
	else
		weight = EntityCountScore.calculateWeight(nil, playerPos, forwardX, forwardZ, forwardLengthSqr, npcPos, loadConfig, isCreated, cameraX, cameraZ, true, resolvedX, resolvedZ)
	end

	if isCreated and ((resolvedX or npcPos[1]) ~= info[POSITION][1] or (resolvedZ or npcPos[3]) ~= info[POSITION][3]) then
		local creationWeight

		if self then
			creationWeight = self:_calcNpcLoadWeight(playerPos, forwardX, forwardZ, forwardLengthSqr, info[POSITION], loadConfig, false, cameraX, cameraZ, true)
		else
			creationWeight = EntityCountScore.calculateWeight(nil, playerPos, forwardX, forwardZ, forwardLengthSqr, info[POSITION], loadConfig, false, cameraX, cameraZ, true)
		end

		weight = math.max(weight, creationWeight)
	end

	return weight
end

function EntityCountScore.getScheduledWeight(owner, entityType, entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ)
	local ignored, resolvedPos, resolvedX, resolvedZ = owner:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION], playerPos, info)

	if ignored then
		return owner:isCreationCandidate(entityType, entityId, info) and math.huge or nil
	end

	return EntityCountScore.getCandidateWeight(nil, entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, owner.npcLoadWeightConfig, cameraX, cameraZ, resolvedPos, resolvedX, resolvedZ)
end

function EntityCountScore:getSelectionWeight(entityType, entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ)
	local ignored, resolvedPos, resolvedX, resolvedZ = self:isCullingExempt(entityType, info[STATIC_ID], info[DISPLAY_LEVEL], entityId, info[POSITION], playerPos, info)

	if ignored then
		return self:isCreationCandidate(entityType, entityId, info) and math.huge or nil
	end

	return self:_getNpcCandidateWeight(entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, self.npcLoadWeightConfig, cameraX, cameraZ, resolvedPos, resolvedX, resolvedZ)
end

function EntityCountScore:createConfig(defaults, target)
	local scoreDefaults = defaults.score
	local rNear = self:_getNpcLoadConfigNumber("NPC_LOAD_R_NEAR", scoreDefaults.near)
	local rFront = self:_getNpcLoadConfigNumber("NPC_LOAD_R_FRONT", scoreDefaults.front)
	local rFar = self:_getNpcLoadConfigNumber("NPC_LOAD_R_FAR", scoreDefaults.far)
	local halfAngle = self:_getNpcLoadConfigNumber("NPC_LOAD_HALF_ANGLE", scoreDefaults.halfAngle)
	local cosHalfAngle = math.cos(halfAngle * math.pi / 180)
	local cosRetainHalfAngle = math.cos(math.min(halfAngle + scoreDefaults.retainAngleMargin, 180) * math.pi / 180)

	target = target or {}
	target.nearSqr = rNear * rNear
	target.frontSqr = rFront * rFront
	target.farSqr = rFar * rFar
	target.cosHalfAngle = cosHalfAngle
	target.cosHalfAngleSqr = cosHalfAngle * cosHalfAngle
	target.cosRetainHalfAngle = cosRetainHalfAngle
	target.cosRetainHalfAngleSqr = cosRetainHalfAngle * cosRetainHalfAngle
	target.epsilon = defaults.epsilon
	target.baseScore = scoreDefaults.base
	target.frontDistanceDiscount = scoreDefaults.frontDiscount

	return target
end

function EntityCountScore:findCandidates(entityType, entities, playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ)
	local createEntityId
	local createWeight = NEGATIVE_INFINITY
	local destroyEntityId
	local destroyWeight = math.huge

	for entityId, info in pairs(entities) do
		local entityState = info[STATE]
		local isCreated = entityState == ClientConst.EntityCount.CREATED
		local canCreate = not isCreated and self:isCreationCandidate(entityType, entityId, info)
		local weight

		if isCreated or canCreate then
			if info[NO_MODEL] then
				weight = self:getNoModelInteractionDecision(entityType, entityId, info, playerPos)
			else
				weight = EntityCountScore.getSelectionWeight(self, entityType, entityId, info, playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ)
			end
		end

		if weight ~= nil then
			if canCreate then
				createEntityId, createWeight = self:selectCreationCandidate(entityType, entities, entityId, weight, createEntityId, createWeight)
			elseif isCreated and weight < destroyWeight then
				destroyEntityId = entityId
				destroyWeight = weight
			end
		end
	end

	return createEntityId, createWeight, destroyEntityId, destroyWeight
end

function EntityCountScore.readConfigNumber(configKey, defaultValue)
	if IS_MOBILE then
		local mobileValue = SysConfigData[configKey .. "_MOBILE"]

		if mobileValue ~= nil then
			return mobileValue
		end
	end

	return SysConfigData[configKey] or defaultValue
end

function EntityCountScore.sampleContext()
	local playerPos = pg.playerPos
	local cameraMgr = pg.global and pg.global.cameraMgr

	if playerPos == nil or cameraMgr == nil then
		return nil
	end

	local cameraX, _, cameraZ, forwardX, _, forwardZ = cameraMgr:GetWorldCameraPositionAndForwardEx()

	forwardX = forwardX or 0
	forwardZ = forwardZ or 0

	local forwardLengthSqr = forwardX * forwardX + forwardZ * forwardZ

	return playerPos, forwardX, forwardZ, forwardLengthSqr, cameraX, cameraZ
end

return EntityCountScore
