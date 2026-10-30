-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\EntityCount\\EntityCountScheduler.lua

local Config = require("GameApp.EntityCount.Config.EntityCountConfig")
local InfoIndex = Config.InfoIndex
local STATIC_ID, POSITION, STATE = InfoIndex.STATIC_ID, InfoIndex.POSITION, InfoIndex.STATE
local DISPLAY_LEVEL, NO_MODEL = InfoIndex.DISPLAY_LEVEL, InfoIndex.NO_MODEL
local ClientConst = require("Const.ClientConst")
local SysConfigData = require("Data.sys_config_data")
local Score = require("GameApp.EntityCount.EntityCountScore")
local LoggerConst = require("Core.Log.LoggerConst")
local LoggerManager = require("Core.Log.LoggerManager")
local EntityCountScheduler = {}
local logger = LoggerManager.getLogger("EntityCountScheduler")
local PHASE_IDLE = 0
local PHASE_SCAN = 1
local PHASE_REFRESH = 2
local PHASE_READY = 3
local NEGATIVE_INFINITY = -math.huge

function EntityCountScheduler._readConfigNumber(key, fallback, minimum, maximum)
	local value = IS_MOBILE and SysConfigData[key .. "_MOBILE"] or nil

	if value == nil then
		value = SysConfigData[key]
	end

	if type(value) ~= "number" or value ~= value or value == math.huge or value == -math.huge then
		return fallback
	end

	return math.max(minimum, math.min(maximum, math.floor(value)))
end

function EntityCountScheduler._readConfig(target)
	local defaults = Config
	local scheduleDefaults, timingDefaults = defaults.schedule, defaults.timing
	local visitLimit = IS_MOBILE and scheduleDefaults.mobileVisits or scheduleDefaults.desktopVisits
	local decisionLimit = IS_MOBILE and scheduleDefaults.mobileDecisions or scheduleDefaults.desktopDecisions
	local turnCos = math.cos(scheduleDefaults.turnDegrees * math.pi / 180)
	local config = target or {}

	if target == nil then
		config.enabled = EntityCountScheduler._readConfigNumber("NPC_COUNT_SCHEDULE_MODE", scheduleDefaults.enabled, 0, 1) == 1
		config.shortlistSize = EntityCountScheduler._readCapacity(scheduleDefaults.shortlistSize, 1, "candidate")
	end

	config.visitBudget = EntityCountScheduler._readConfigNumber("NPC_COUNT_SCAN_BUDGET", visitLimit, scheduleDefaults.minVisits, visitLimit)
	config.decisionBudget = EntityCountScheduler._readConfigNumber("NPC_COUNT_ACTION_BUDGET", decisionLimit, 1, decisionLimit)
	config.sliceDelay = scheduleDefaults.sliceDelay
	config.balanceDelay = IS_MOBILE and timingDefaults.mobileBalance or timingDefaults.desktopBalance
	config.stableDelay = timingDefaults.stable
	config.movementDistanceSqr = scheduleDefaults.movementDistance * scheduleDefaults.movementDistance
	config.cameraDistanceSqr = scheduleDefaults.cameraDistance * scheduleDefaults.cameraDistance
	config.turnCosSqr = turnCos * turnCos
	config.epsilon, config.replaceScoreMargin = defaults.epsilon, defaults.replaceScoreMargin

	return config
end

function EntityCountScheduler.refreshConfig(state)
	EntityCountScheduler._readConfig(state.config)
	EntityCountScheduler.wake(state)
end

function EntityCountScheduler._readCapacity(capacity, minimum, name)
	if type(capacity) ~= "number" or capacity ~= capacity or capacity < minimum or capacity == math.huge or capacity % 1 ~= 0 then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("EntityCount %s capacity is invalid: %s; using %s", name, tostring(capacity), minimum)
		end

		return minimum
	end

	return capacity
end

function EntityCountScheduler._bufferCreate(capacity, descending)
	capacity = EntityCountScheduler._readCapacity(capacity, 1, "candidate")

	local buffer = {
		count = 0,
		capacity = capacity,
		descending = descending,
		ids = {},
		infos = {},
		weights = {}
	}

	for i = 1, capacity do
		buffer.ids[i], buffer.infos[i], buffer.weights[i] = false, false, 0
	end

	for i = 1, capacity do
		buffer.ids[i], buffer.infos[i], buffer.weights[i] = nil
	end

	return buffer
end

function EntityCountScheduler._bufferClear(buffer)
	for i = 1, buffer.count do
		buffer.ids[i], buffer.infos[i], buffer.weights[i] = nil
	end

	buffer.count = 0
end

function EntityCountScheduler._bufferInsert(buffer, id, info, weight)
	local count = buffer.count

	if count == buffer.capacity then
		local worstWeight = buffer.weights[count]
		local loses = buffer.descending and weight <= worstWeight or not buffer.descending and worstWeight <= weight

		if loses then
			return id, info, weight
		end
	end

	local position = count + 1

	for i = 1, count do
		local better = buffer.descending and weight > buffer.weights[i] or not buffer.descending and weight < buffer.weights[i]

		if better then
			position = i

			break
		end
	end

	local removedId, removedInfo, removedWeight

	if count == buffer.capacity then
		removedId, removedInfo, removedWeight = buffer.ids[count], buffer.infos[count], buffer.weights[count]
	else
		count = count + 1
		buffer.count = count
	end

	for i = count, position + 1, -1 do
		buffer.ids[i], buffer.infos[i], buffer.weights[i] = buffer.ids[i - 1], buffer.infos[i - 1], buffer.weights[i - 1]
	end

	buffer.ids[position], buffer.infos[position], buffer.weights[position] = id, info, weight

	return removedId, removedInfo, removedWeight
end

function EntityCountScheduler._bufferPeek(buffer)
	return buffer.ids[1], buffer.infos[1], buffer.weights[1]
end

function EntityCountScheduler._bufferSort(buffer)
	for i = 2, buffer.count do
		local id, info, weight = buffer.ids[i], buffer.infos[i], buffer.weights[i]
		local slot = i

		while slot > 1 do
			local previous = buffer.weights[slot - 1]

			if buffer.descending and weight <= previous or not buffer.descending and previous <= weight then
				break
			end

			buffer.ids[slot], buffer.infos[slot], buffer.weights[slot] = buffer.ids[slot - 1], buffer.infos[slot - 1], previous
			slot = slot - 1
		end

		buffer.ids[slot], buffer.infos[slot], buffer.weights[slot] = id, info, weight
	end
end

function EntityCountScheduler._bufferRemoveAt(buffer, position)
	local count = buffer.count

	if position < 1 or count < position then
		return
	end

	for i = position, count - 1 do
		buffer.ids[i], buffer.infos[i], buffer.weights[i] = buffer.ids[i + 1], buffer.infos[i + 1], buffer.weights[i + 1]
	end

	buffer.ids[count], buffer.infos[count], buffer.weights[count] = nil
	buffer.count = count - 1
end

function EntityCountScheduler._indexCreate()
	return {
		count = 0,
		scanEnd = 0,
		cursor = 1,
		highWater = 0,
		freeCount = 0,
		ids = {},
		infos = {},
		slots = {},
		free = {}
	}
end

function EntityCountScheduler._indexClear(index)
	for i = 1, index.highWater do
		local id = index.ids[i]

		if id ~= nil then
			index.slots[id] = nil
		end

		index.ids[i], index.infos[i], index.free[i] = nil
	end

	for i = index.highWater + 1, index.freeCount do
		index.free[i] = nil
	end

	index.freeCount, index.highWater, index.count = 0, 0, 0
	index.cursor, index.scanEnd = 1, 0
end

function EntityCountScheduler._indexAdd(index, id, info)
	local slot = index.slots[id]

	if slot then
		index.infos[slot] = info

		return
	end

	local freeCount = index.freeCount

	while freeCount > 0 and index.free[freeCount] > index.highWater do
		index.free[freeCount] = nil
		freeCount = freeCount - 1
	end

	if freeCount > 0 then
		slot = index.free[freeCount]
		index.free[freeCount] = nil
		freeCount = freeCount - 1
	else
		slot = index.highWater + 1
		index.highWater = slot
	end

	index.freeCount = freeCount
	index.slots[id], index.ids[slot], index.infos[slot] = slot, id, info
	index.count = index.count + 1
end

function EntityCountScheduler._indexRemove(index, id)
	local slot = index.slots[id]

	if not slot then
		return
	end

	index.slots[id], index.ids[slot], index.infos[slot] = nil
	index.freeCount = index.freeCount + 1
	index.free[index.freeCount] = slot
	index.count = index.count - 1

	if slot == index.highWater then
		while index.highWater > 0 and index.ids[index.highWater] == nil do
			index.highWater = index.highWater - 1
		end
	end
end

function EntityCountScheduler._indexStartScan(index)
	index.cursor, index.scanEnd = 1, index.highWater
end

function EntityCountScheduler._indexHasNext(index)
	return index.cursor <= index.scanEnd
end

function EntityCountScheduler._indexNext(index)
	local cursor = index.cursor

	if cursor > index.scanEnd then
		return nil, nil, true
	end

	index.cursor = cursor + 1

	return index.ids[cursor], index.infos[cursor], cursor == index.scanEnd
end

function EntityCountScheduler._newContext()
	return {
		cameraZ = 0,
		cameraX = 0,
		forwardLengthSqr = 0,
		forwardZ = 0,
		forwardX = 0,
		playerPos = {
			0,
			0,
			0
		}
	}
end

function EntityCountScheduler._newGroup(entityType, capacity)
	return {
		hadCreates = false,
		hadDestroys = false,
		deadline = 0,
		batch = 1,
		refreshCreates = true,
		refreshCursor = 1,
		changed = false,
		dirty = false,
		balancing = true,
		entityType = entityType,
		index = EntityCountScheduler._indexCreate(),
		context = EntityCountScheduler._newContext(),
		creates = EntityCountScheduler._bufferCreate(capacity, true),
		destroys = EntityCountScheduler._bufferCreate(capacity, false),
		phase = PHASE_IDLE
	}
end

function EntityCountScheduler.create(owner)
	local config = EntityCountScheduler._readConfig()

	if not config.enabled then
		return nil
	end

	local npc = EntityCountScheduler._newGroup("NPC", config.shortlistSize)
	local puppet = EntityCountScheduler._newGroup("ClientPuppet", config.shortlistSize)

	return {
		generation = 0,
		turn = 1,
		hasAnchor = false,
		hasContext = false,
		owner = owner,
		config = config,
		groups = {
			npc,
			puppet
		},
		groupByType = {
			NPC = npc,
			ClientPuppet = puppet
		},
		context = EntityCountScheduler._newContext(),
		anchor = EntityCountScheduler._newContext(),
		stats = {
			motionWakes = 0,
			rounds = 0,
			totalDecisions = 0,
			totalVisits = 0,
			tickDecisions = 0,
			tickVisits = 0
		}
	}
end

function EntityCountScheduler._clearCandidates(group)
	EntityCountScheduler._bufferClear(group.creates)
	EntityCountScheduler._bufferClear(group.destroys)

	group.refreshCursor = 1
	group.refreshCreates = true
end

function EntityCountScheduler._removeEntityCandidates(group, entityId)
	for list = 1, 2 do
		local buffer = list == 1 and group.creates or group.destroys

		for position = 1, buffer.count do
			if buffer.ids[position] == entityId then
				EntityCountScheduler._bufferRemoveAt(buffer, position)

				if group.phase == PHASE_REFRESH and group.refreshCreates == (list == 1) and position < group.refreshCursor then
					group.refreshCursor = group.refreshCursor - 1
				end

				break
			end
		end
	end
end

function EntityCountScheduler.clear(state)
	state.generation = state.generation + 1

	for i = 1, #state.groups do
		local group = state.groups[i]

		EntityCountScheduler._indexClear(group.index)
		EntityCountScheduler._clearCandidates(group)

		group.phase = PHASE_IDLE
		group.balancing, group.dirty, group.changed = true, false, false
	end

	state.hasContext, state.hasAnchor, state.turn = false, false, 1

	for key in pairs(state.stats) do
		state.stats[key] = 0
	end
end

function EntityCountScheduler.onAdded(state, entityType, entityId, info)
	if not state.config.enabled then
		return
	end

	local group = state.groupByType[entityType]

	if group then
		state.generation = state.generation + 1

		EntityCountScheduler._removeEntityCandidates(group, entityId)
		EntityCountScheduler._indexAdd(group.index, entityId, info)
		EntityCountScheduler.invalidate(state, entityType)
	end
end

function EntityCountScheduler.onRemoved(state, entityType, entityId)
	if not state.config.enabled then
		return
	end

	local group = state.groupByType[entityType]

	if group then
		state.generation = state.generation + 1

		EntityCountScheduler._removeEntityCandidates(group, entityId)
		EntityCountScheduler._indexRemove(group.index, entityId)
		EntityCountScheduler.invalidate(state, entityType)
	end
end

function EntityCountScheduler.invalidate(state, entityType, restartScan)
	if not state.config.enabled then
		return
	end

	if restartScan then
		state.generation = state.generation + 1
	end

	for i = 1, #state.groups do
		local group = state.groups[i]

		if entityType == nil or group.entityType == entityType then
			group.dirty = true

			if restartScan or not group.balancing then
				EntityCountScheduler._clearCandidates(group)

				group.phase, group.balancing = PHASE_IDLE, true
			end
		end
	end
end

function EntityCountScheduler.wake(state)
	if not state.config.enabled then
		return
	end

	state.generation = state.generation + 1
	state.hasAnchor = false

	for i = 1, #state.groups do
		local group = state.groups[i]

		EntityCountScheduler._clearCandidates(group)

		group.phase = PHASE_IDLE
		group.balancing, group.dirty = true, true
	end
end

function EntityCountScheduler._copyContext(target, source)
	target.playerPos[1], target.playerPos[2], target.playerPos[3] = source.playerPos[1], source.playerPos[2], source.playerPos[3]
	target.forwardX, target.forwardZ, target.forwardLengthSqr = source.forwardX, source.forwardZ, source.forwardLengthSqr
	target.cameraX, target.cameraZ = source.cameraX, source.cameraZ
end

function EntityCountScheduler._sample(state)
	local position, fx, fz, lengthSqr, cx, cz = state.owner:getNpcLoadWeightContext()

	if position == nil then
		if state.hasContext then
			EntityCountScheduler.wake(state)
		end

		state.hasContext = false

		return false
	end

	local context = state.context

	context.playerPos[1], context.playerPos[2], context.playerPos[3] = position[1], position[2], position[3]
	context.forwardX, context.forwardZ, context.forwardLengthSqr = fx, fz, lengthSqr
	context.cameraX, context.cameraZ = cx, cz
	state.hasContext = true

	return true
end

function EntityCountScheduler._checkMotion(state)
	local context, anchor = state.context, state.anchor

	if not state.hasAnchor then
		EntityCountScheduler._copyContext(anchor, context)

		state.hasAnchor = true

		return
	end

	local dx, dz = context.playerPos[1] - anchor.playerPos[1], context.playerPos[3] - anchor.playerPos[3]
	local cx, cz = context.cameraX - anchor.cameraX, context.cameraZ - anchor.cameraZ
	local dot = context.forwardX * anchor.forwardX + context.forwardZ * anchor.forwardZ
	local lengths = context.forwardLengthSqr * anchor.forwardLengthSqr
	local turned = lengths > state.config.epsilon and (dot < 0 or dot * dot < state.config.turnCosSqr * lengths)

	if dx * dx + dz * dz < state.config.movementDistanceSqr and cx * cx + cz * cz < state.config.cameraDistanceSqr and not turned then
		return
	end

	EntityCountScheduler._copyContext(anchor, context)

	for i = 1, #state.groups do
		local group = state.groups[i]

		if group.index.count > 0 then
			group.dirty = true

			if not group.balancing then
				EntityCountScheduler._clearCandidates(group)

				group.phase, group.balancing = PHASE_IDLE, true
				state.stats.motionWakes = state.stats.motionWakes + 1
			end
		end
	end
end

function EntityCountScheduler._beginRound(state, group, now)
	EntityCountScheduler._clearCandidates(group)
	EntityCountScheduler._copyContext(group.context, state.context)
	EntityCountScheduler._indexStartScan(group.index)

	local duration = (group.balancing or group.dirty) and state.config.balanceDelay or state.config.stableDelay
	local capacity = (group.balancing or group.dirty) and state.config.shortlistSize or 1

	group.creates.capacity, group.destroys.capacity = capacity, capacity
	group.batch = math.max(1, math.ceil(group.index.highWater / math.max(1, duration / state.config.sliceDelay)))
	group.deadline, group.phase = now + duration, PHASE_SCAN
	group.dirty, group.changed = false, false
	group.hadCreates, group.hadDestroys = false, false
	state.stats.rounds = state.stats.rounds + 1
end

function EntityCountScheduler._weight(state, group, entityId, info, context, created)
	local owner = state.owner

	if owner.entityInfo[group.entityType][entityId] ~= info then
		return nil
	end

	if created then
		if info[STATE] ~= ClientConst.EntityCount.CREATED then
			return nil
		end
	elseif not owner:isCreationCandidate(group.entityType, entityId, info) then
		return nil
	end

	if info[NO_MODEL] then
		return owner:getNoModelInteractionDecision(group.entityType, entityId, info, context.playerPos)
	end

	return Score.getScheduledWeight(owner, group.entityType, entityId, info, context.playerPos, context.forwardX, context.forwardZ, context.forwardLengthSqr, context.cameraX, context.cameraZ)
end

function EntityCountScheduler._scan(state, group, now, budget)
	local used, batch = 0, math.min(group.batch, budget)
	local generation = state.generation
	local owner, entityType, context = state.owner, group.entityType, group.context
	local index = group.index
	local last = math.min(index.cursor + batch - 1, index.scanEnd)

	for slot = index.cursor, last do
		local entityId, info = index.ids[slot], index.infos[slot]

		index.cursor = slot + 1
		used = used + 1

		if info then
			local created = info[STATE] == ClientConst.EntityCount.CREATED
			local weight

			if created or owner:isCreationCandidate(entityType, entityId, info) then
				if info[NO_MODEL] then
					weight = owner:getNoModelInteractionDecision(entityType, entityId, info, context.playerPos)
				else
					weight = Score.getScheduledWeight(owner, entityType, entityId, info, context.playerPos, context.forwardX, context.forwardZ, context.forwardLengthSqr, context.cameraX, context.cameraZ)
				end
			end

			if weight ~= nil then
				local candidates = created and group.destroys or group.creates

				if created or weight > NEGATIVE_INFINITY then
					if candidates.capacity == 1 then
						local oldWeight = candidates.weights[1]

						if oldWeight == nil or created and weight < oldWeight or not created and oldWeight < weight then
							candidates.ids[1], candidates.infos[1], candidates.weights[1] = entityId, info, weight
							candidates.count = 1
						end
					else
						EntityCountScheduler._bufferInsert(candidates, entityId, info, weight)
					end
				end

				if not created and weight ~= math.huge then
					owner:showCulledEntity(entityType, entityId, info)
				end
			end
		end

		if state.generation ~= generation then
			return used
		end

		if group.phase ~= PHASE_SCAN then
			return used
		end
	end

	if index.cursor > index.scanEnd and now + state.config.epsilon >= group.deadline then
		group.hadCreates, group.hadDestroys = group.creates.count > 0, group.destroys.count > 0

		EntityCountScheduler._beginRefresh(group)
	end

	return used
end

function EntityCountScheduler._beginRefresh(group)
	group.refreshCursor, group.refreshCreates, group.phase = 1, true, PHASE_REFRESH
end

function EntityCountScheduler._refresh(state, group, budget)
	local used = 0
	local generation = state.generation

	while used < budget and group.phase == PHASE_REFRESH do
		local source = group.refreshCreates and group.creates or group.destroys
		local slot = group.refreshCursor

		if slot <= source.count then
			local entityId, info = source.ids[slot], source.infos[slot]
			local weight = EntityCountScheduler._weight(state, group, entityId, info, state.context, not group.refreshCreates)

			used = used + 1

			if state.generation ~= generation or group.phase ~= PHASE_REFRESH then
				return used
			end

			if weight ~= nil and (not group.refreshCreates or weight > NEGATIVE_INFINITY) then
				source.weights[slot] = weight
				group.refreshCursor = slot + 1
			else
				EntityCountScheduler._bufferRemoveAt(source, slot)
			end
		else
			EntityCountScheduler._bufferSort(source)

			if group.refreshCreates then
				group.refreshCreates, group.refreshCursor = false, 1
			else
				group.phase = PHASE_READY
			end
		end
	end

	return used
end

function EntityCountScheduler._finish(state, group, exhausted)
	group.balancing = group.changed or group.dirty or exhausted
	state.owner.inBalancing[group.entityType] = group.balancing
	group.phase = PHASE_IDLE

	EntityCountScheduler._clearCandidates(group)
end

function EntityCountScheduler._commit(state, group, createId, createInfo, destroyId, add, remove, count)
	local owner, entityType = state.owner, group.entityType
	local generation = state.generation
	local succeeded = not remove or owner:destroyEntity(destroyId, entityType)

	if state.generation ~= generation then
		return true
	end

	if succeeded and add then
		local weight = remove and EntityCountScheduler._weight(state, group, createId, createInfo, state.context, false)

		if owner.entityInfo[entityType][createId] ~= createInfo or not owner:isCreationCandidate(entityType, createId, createInfo) or remove and (weight == nil or weight == NEGATIVE_INFINITY) then
			add = false
		elseif owner:isCullingExempt(entityType, createInfo[STATIC_ID], createInfo[DISPLAY_LEVEL], createId, createInfo[POSITION], state.context.playerPos, createInfo) or not remove and count < owner:getEffectiveCountLimit(entityType) or remove and owner:getRealAndPendingCount(entityType) < owner:getEffectiveCountLimit(entityType) then
			owner:requestEntityToCreate(createId, entityType, false)

			if state.generation ~= generation then
				return true
			end
		else
			add = false
		end
	end

	if succeeded and (add or remove) then
		if add then
			EntityCountScheduler._bufferRemoveAt(group.creates, 1)
		end

		if remove then
			EntityCountScheduler._bufferRemoveAt(group.destroys, 1)
		end

		group.changed, group.balancing = true, true
		owner.inBalancing[entityType] = true

		local exhausted = group.hadCreates and group.creates.count == 0 or group.hadDestroys and group.destroys.count == 0

		if exhausted then
			EntityCountScheduler._finish(state, group, true)
		else
			EntityCountScheduler._beginRefresh(group)
		end

		return true
	end

	group.dirty = true

	EntityCountScheduler._finish(state, group, true)

	return true
end

function EntityCountScheduler._apply(state, group, budget)
	local owner, entityType = state.owner, group.entityType
	local createId, createInfo, createWeight = EntityCountScheduler._bufferPeek(group.creates)
	local destroyId, destroyInfo, destroyWeight = EntityCountScheduler._bufferPeek(group.destroys)
	local visits = (createId and 1 or 0) + (destroyId and 1 or 0)
	local required = visits + (createId and destroyId and 1 or 0)

	if budget < required then
		return 0, false
	end

	if createId then
		createWeight = EntityCountScheduler._weight(state, group, createId, createInfo, state.context, false)
	end

	if destroyId then
		destroyWeight = EntityCountScheduler._weight(state, group, destroyId, destroyInfo, state.context, true)
	end

	if createId and (createWeight == nil or createWeight == NEGATIVE_INFINITY) then
		EntityCountScheduler._bufferRemoveAt(group.creates, 1)
		EntityCountScheduler._beginRefresh(group)

		return visits, false
	end

	if destroyId and destroyWeight == nil then
		EntityCountScheduler._bufferRemoveAt(group.destroys, 1)
		EntityCountScheduler._beginRefresh(group)

		return visits, false
	end

	local count, limit = owner:getRealAndPendingCount(entityType), owner:getEffectiveCountLimit(entityType)
	local add = createId and (createWeight == math.huge or count < limit)
	local interactionOutOfRange = destroyId and destroyWeight == NEGATIVE_INFINITY and destroyInfo[NO_MODEL]
	local remove = destroyId and (interactionOutOfRange or limit < count or not createId and destroyWeight == NEGATIVE_INFINITY)

	if count == limit and createId and destroyId and createWeight > destroyWeight + state.config.replaceScoreMargin then
		add, remove = true, true
	end

	if createWeight == math.huge and not interactionOutOfRange then
		remove = false
	end

	if not add and not remove then
		EntityCountScheduler._finish(state, group, false)

		return visits, false
	end

	if add and remove then
		visits = visits + 1
	end

	return visits, EntityCountScheduler._commit(state, group, createId, createInfo, destroyId, add, remove, count)
end

function EntityCountScheduler._service(state, group, now, budget, allowDecision)
	if group.phase == PHASE_IDLE then
		EntityCountScheduler._beginRound(state, group, now)
	end

	local used = 0

	if group.phase == PHASE_SCAN then
		used = EntityCountScheduler._scan(state, group, now, budget)
	end

	if group.phase == PHASE_REFRESH then
		used = used + EntityCountScheduler._refresh(state, group, budget - used)
	end

	if group.phase == PHASE_READY and allowDecision then
		local visits, decided = EntityCountScheduler._apply(state, group, budget - used)

		return used + visits, decided
	end

	return used, false
end

function EntityCountScheduler.tick(state, now)
	local stats = state.stats

	stats.tickVisits, stats.tickDecisions = 0, 0

	if not EntityCountScheduler._sample(state) then
		return false
	end

	EntityCountScheduler._checkMotion(state)

	local generation = state.generation
	local first, remaining = state.turn, state.config.visitBudget

	state.turn = 3 - first

	for offset = 0, 1 do
		local groupIndex = offset == 0 and first or 3 - first
		local budget = offset == 0 and math.floor(remaining / 2) or remaining
		local visits, decided = EntityCountScheduler._service(state, state.groups[groupIndex], now, budget, stats.tickDecisions < state.config.decisionBudget)

		remaining = remaining - visits
		stats.tickVisits = stats.tickVisits + visits

		if decided then
			stats.tickDecisions = stats.tickDecisions + 1
		end

		if state.generation ~= generation then
			return true
		end
	end

	for offset = 0, 1 do
		local groupIndex = offset == 0 and first or 3 - first
		local group = state.groups[groupIndex]

		if remaining > 0 and stats.tickDecisions < state.config.decisionBudget and (group.phase == PHASE_REFRESH or group.phase == PHASE_READY) then
			local visits, decided = EntityCountScheduler._service(state, group, now, remaining, true)

			remaining = remaining - visits
			stats.tickVisits = stats.tickVisits + visits

			if decided then
				stats.tickDecisions = stats.tickDecisions + 1
			end

			if state.generation ~= generation then
				return true
			end
		end
	end

	stats.totalVisits = stats.totalVisits + stats.tickVisits
	stats.totalDecisions = stats.totalDecisions + stats.tickDecisions

	return true
end

return EntityCountScheduler
