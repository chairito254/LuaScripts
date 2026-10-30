-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\WorldRaceDungeonUtils.lua

local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local Vector3 = require("Common.Math.vector3")
local SceneUtils = require("Common.Utils.SceneUtils")
local Utils = require("Common.Utils.Utils")
local WorldRaceDungeonUtils = {}

WorldRaceDungeonUtils.EPSILON = 1e-06
WorldRaceDungeonUtils.POINT_MERGE_DISTANCE_SQ = 0.0001
WorldRaceDungeonUtils.MIN_TEMP_SUBDIVISION = 8
WorldRaceDungeonUtils.MAX_TEMP_SUBDIVISION = 512
WorldRaceDungeonUtils.MIN_SAMPLE_INTERVAL = 0.1
WorldRaceDungeonUtils.DEFAULT_SAMPLE_INTERVAL = 0.5
WorldRaceDungeonUtils.ROUTE_DISTANCE_TIE_EPSILON = 1e-06
WorldRaceDungeonUtils.PROJECTION_BLOCK_EDGE_COUNT = 32

function WorldRaceDungeonUtils._isFiniteNumber(value)
	return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

function WorldRaceDungeonUtils._isInteger(value)
	return WorldRaceDungeonUtils._isFiniteNumber(value) and value % 1 == 0
end

function WorldRaceDungeonUtils._readVector(value)
	if not Utils.isTable(value) then
		return nil
	end

	local x, y, z = value.x, value.y, value.z

	if x == nil or y == nil or z == nil then
		x, y, z = value[1], value[2], value[3]
	end

	if not WorldRaceDungeonUtils._isFiniteNumber(x) or not WorldRaceDungeonUtils._isFiniteNumber(y) or not WorldRaceDungeonUtils._isFiniteNumber(z) then
		return nil
	end

	return x, y, z
end

function WorldRaceDungeonUtils._copyPosition(value)
	local x, y, z = WorldRaceDungeonUtils._readVector(value)

	if x == nil then
		return nil
	end

	return {
		x,
		y,
		z
	}
end

function WorldRaceDungeonUtils._getKnot(previousKnot, left, right)
	local distance = Vector3.Distance(left, right)
	local increment = math.sqrt(distance)

	return previousKnot + math.max(increment, WorldRaceDungeonUtils.EPSILON)
end

function WorldRaceDungeonUtils._interpolateByKnot(left, right, leftKnot, rightKnot, knot, output, temporary)
	Vector3.Copy(output, left)

	local denominator = rightKnot - leftKnot

	if math.abs(denominator) <= WorldRaceDungeonUtils.EPSILON then
		return output
	end

	Vector3.Mul(output, (rightKnot - knot) / denominator)
	Vector3.Copy(temporary, right)
	Vector3.Mul(temporary, (knot - leftKnot) / denominator)

	return Vector3.AddByCache(output, temporary, output)
end

function WorldRaceDungeonUtils._evaluateCentripetalCatmullRom(p0, p1, p2, p3, percent, t1, t2, t3, work)
	local knot = t1 + (t2 - t1) * math.max(0, math.min(1, percent))
	local a1, a2, a3, b1, b2, temporary = work[1], work[2], work[3], work[4], work[5], work[6]

	WorldRaceDungeonUtils._interpolateByKnot(p0, p1, 0, t1, knot, a1, temporary)
	WorldRaceDungeonUtils._interpolateByKnot(p1, p2, t1, t2, knot, a2, temporary)
	WorldRaceDungeonUtils._interpolateByKnot(p2, p3, t2, t3, knot, a3, temporary)
	WorldRaceDungeonUtils._interpolateByKnot(a1, a2, 0, t2, knot, b1, temporary)
	WorldRaceDungeonUtils._interpolateByKnot(a2, a3, t1, t3, knot, b2, temporary)

	return WorldRaceDungeonUtils._interpolateByKnot(b1, b2, t1, t2, knot, {}, temporary)
end

function WorldRaceDungeonUtils._buildDensePolyline(sortedPoints, sampleInterval, warnings)
	local densePoints = {
		WorldRaceDungeonUtils._copyPosition(sortedPoints[1].position)
	}
	local controlDenseIndices = {
		[1] = 1
	}
	local temporaryStep = math.min(sampleInterval / 4, 0.25)
	local work = {}

	for i = 1, 6 do
		work[i] = Vector3.GetFromPool()
	end

	for pointIndex = 1, #sortedPoints - 1 do
		local p1, p2 = sortedPoints[pointIndex].position, sortedPoints[pointIndex + 1].position
		local p0 = sortedPoints[pointIndex - 1] and sortedPoints[pointIndex - 1].position or p1
		local p3 = sortedPoints[pointIndex + 2] and sortedPoints[pointIndex + 2].position or p2
		local localControlLength = Vector3.Distance(p0, p1) + Vector3.Distance(p1, p2) + Vector3.Distance(p2, p3)
		local requestedSubdivision = math.ceil(localControlLength / temporaryStep)
		local subdivision = math.max(WorldRaceDungeonUtils.MIN_TEMP_SUBDIVISION, math.min(WorldRaceDungeonUtils.MAX_TEMP_SUBDIVISION, requestedSubdivision))

		if requestedSubdivision > WorldRaceDungeonUtils.MAX_TEMP_SUBDIVISION then
			warnings[#warnings + 1] = string.format("route segment %d-%d reached max temporary subdivisions %d", sortedPoints[pointIndex].routeOrder, sortedPoints[pointIndex + 1].routeOrder, WorldRaceDungeonUtils.MAX_TEMP_SUBDIVISION)
		end

		local t1 = WorldRaceDungeonUtils._getKnot(0, p0, p1)
		local t2 = WorldRaceDungeonUtils._getKnot(t1, p1, p2)
		local t3 = WorldRaceDungeonUtils._getKnot(t2, p2, p3)

		for subdivisionIndex = 1, subdivision do
			densePoints[#densePoints + 1] = WorldRaceDungeonUtils._evaluateCentripetalCatmullRom(p0, p1, p2, p3, subdivisionIndex / subdivision, t1, t2, t3, work)
		end

		controlDenseIndices[pointIndex + 1] = #densePoints
	end

	for i = 1, 6 do
		Vector3.returnToPool(work[i])
	end

	return densePoints, controlDenseIndices
end

function WorldRaceDungeonUtils._slicePoints(points, firstIndex, lastIndex)
	local slicedPoints = {}

	for pointIndex = firstIndex, lastIndex do
		slicedPoints[#slicedPoints + 1] = points[pointIndex]
	end

	return slicedPoints
end

function WorldRaceDungeonUtils._buildCumulativeDistances(points)
	if not Utils.isTable(points) or #points == 0 then
		return nil, nil, "points must not be empty"
	end

	local cumulativeDistances = {
		0
	}
	local totalLength = 0

	for pointIndex = 2, #points do
		totalLength = totalLength + Vector3.Distance(points[pointIndex - 1], points[pointIndex])
		cumulativeDistances[pointIndex] = totalLength
	end

	return cumulativeDistances, totalLength, nil
end

function WorldRaceDungeonUtils._resampleByDistance(densePoints, sampleInterval, denseCumulativeDistances, totalLength)
	if not Utils.isTable(densePoints) or #densePoints < 2 then
		return nil, nil, nil, "dense polyline must contain at least two points"
	end

	if totalLength <= WorldRaceDungeonUtils.EPSILON then
		return nil, nil, nil, "route length must be greater than zero"
	end

	local samples = {
		WorldRaceDungeonUtils._copyPosition(densePoints[1])
	}
	local cumulativeDistances = {
		0
	}
	local denseSegmentIndex = 1
	local targetDistance = sampleInterval
	local offset = Vector3.GetFromPool()

	while targetDistance < totalLength - WorldRaceDungeonUtils.EPSILON do
		while denseSegmentIndex < #densePoints - 1 and targetDistance > denseCumulativeDistances[denseSegmentIndex + 1] do
			denseSegmentIndex = denseSegmentIndex + 1
		end

		local segmentStartDistance = denseCumulativeDistances[denseSegmentIndex]
		local segmentLength = denseCumulativeDistances[denseSegmentIndex + 1] - segmentStartDistance

		if segmentLength > WorldRaceDungeonUtils.EPSILON then
			local percent = (targetDistance - segmentStartDistance) / segmentLength

			Vector3.SubByCache(densePoints[denseSegmentIndex + 1], densePoints[denseSegmentIndex], offset)
			Vector3.Mul(offset, percent)

			samples[#samples + 1] = Vector3.AddByCache(densePoints[denseSegmentIndex], offset, {})
			cumulativeDistances[#cumulativeDistances + 1] = targetDistance
		end

		targetDistance = targetDistance + sampleInterval
	end

	Vector3.returnToPool(offset)

	local lastDensePoint = densePoints[#densePoints]

	if Vector3.SqrDistance(samples[#samples], lastDensePoint) > WorldRaceDungeonUtils.EPSILON * WorldRaceDungeonUtils.EPSILON then
		samples[#samples + 1] = WorldRaceDungeonUtils._copyPosition(lastDensePoint)
		cumulativeDistances[#cumulativeDistances + 1] = totalLength
	else
		cumulativeDistances[#cumulativeDistances] = totalLength
	end

	return samples, cumulativeDistances, totalLength, nil
end

function WorldRaceDungeonUtils._copyRoutePoint(point, sourceKey)
	if not Utils.isTable(point) then
		return nil, "route point must be a table"
	end

	local position = WorldRaceDungeonUtils._copyPosition(point.position)

	if position == nil then
		return nil, "route point has invalid position"
	end

	if not WorldRaceDungeonUtils._isInteger(point.routeOrder) or point.routeOrder < 1 then
		return nil, "route point has invalid routeOrder"
	end

	local role = point.routePointRole
	local roleConst = WorldRaceDungeonConst.ROUTE_POINT_ROLE

	if role ~= roleConst.CONTROL and role ~= roleConst.START and role ~= roleConst.CHECKPOINT and role ~= roleConst.FINISH then
		return nil, "route point has invalid role"
	end

	local revivePortalId = point.revivePortalId

	if role == roleConst.CHECKPOINT and revivePortalId ~= nil and (not WorldRaceDungeonUtils._isInteger(revivePortalId) or revivePortalId <= 0) then
		return nil, "route checkpoint has invalid revivePortalId"
	end

	local copiedPoint = {
		id = point.id,
		sandboxId = point.sandboxId,
		worldRaceTrackId = point.worldRaceTrackId,
		routeOrder = point.routeOrder,
		routePointRole = role,
		gateWidth = point.gateWidth,
		gateHeight = point.gateHeight,
		gateThickness = point.gateThickness,
		revivePortalId = role == roleConst.CHECKPOINT and revivePortalId or nil,
		position = position,
		sourceKey = sourceKey
	}

	if role ~= roleConst.CONTROL then
		if role == roleConst.FINISH then
			copiedPoint.rotation = {
				0,
				0,
				0
			}
		else
			copiedPoint.rotation = WorldRaceDungeonUtils._copyPosition(point.rotation)
		end

		if copiedPoint.rotation == nil then
			return nil, "route gate has invalid rotation"
		end

		if not WorldRaceDungeonUtils._isFiniteNumber(point.gateWidth) or point.gateWidth <= 0 or not WorldRaceDungeonUtils._isFiniteNumber(point.gateHeight) or point.gateHeight <= 0 or role ~= roleConst.FINISH and (not WorldRaceDungeonUtils._isFiniteNumber(point.gateThickness) or point.gateThickness <= 0) then
			return nil, "route gate has invalid size"
		end
	elseif point.rotation ~= nil then
		copiedPoint.rotation = WorldRaceDungeonUtils._copyPosition(point.rotation)
	end

	return copiedPoint, nil
end

function WorldRaceDungeonUtils._compareRoutePoints(left, right)
	return left.routeOrder < right.routeOrder
end

function WorldRaceDungeonUtils._validateAndSortRoutePoints(routePoints)
	if not Utils.isTable(routePoints) then
		return nil, nil, nil, nil, "routePoints must be a table"
	end

	local sortedPoints = {}

	for sourceKey, point in pairs(routePoints) do
		local copiedPoint, copyError = WorldRaceDungeonUtils._copyRoutePoint(point, sourceKey)

		if copiedPoint == nil then
			return nil, nil, nil, nil, copyError
		end

		sortedPoints[#sortedPoints + 1] = copiedPoint
	end

	if #sortedPoints < 2 then
		return nil, nil, nil, nil, "route must contain at least two points"
	end

	table.sort(sortedPoints, WorldRaceDungeonUtils._compareRoutePoints)

	for pointIndex, point in ipairs(sortedPoints) do
		if point.routeOrder ~= pointIndex then
			return nil, nil, nil, nil, "routeOrder must be continuous from 1"
		end

		if pointIndex > 1 and Vector3.SqrDistance(sortedPoints[pointIndex - 1].position, point.position) <= WorldRaceDungeonUtils.POINT_MERGE_DISTANCE_SQ then
			return nil, nil, nil, nil, "adjacent route points are too close"
		end
	end

	local roleConst = WorldRaceDungeonConst.ROUTE_POINT_ROLE
	local meaningfulPoints = {}
	local startPointIndex, finishPointIndex
	local startCount = 0
	local finishCount = 0

	for pointIndex, point in ipairs(sortedPoints) do
		if point.routePointRole ~= roleConst.CONTROL then
			meaningfulPoints[#meaningfulPoints + 1] = point
		end

		if point.routePointRole == roleConst.START then
			startCount = startCount + 1
			startPointIndex = pointIndex
		elseif point.routePointRole == roleConst.FINISH then
			finishCount = finishCount + 1
			finishPointIndex = pointIndex
		end
	end

	if startCount ~= 1 then
		return nil, nil, nil, nil, "route must contain exactly one start"
	end

	if finishCount ~= 1 then
		return nil, nil, nil, nil, "route must contain exactly one finish"
	end

	if meaningfulPoints[1].routePointRole ~= roleConst.START then
		return nil, nil, nil, nil, "start must be the first meaningful route point"
	end

	if meaningfulPoints[#meaningfulPoints].routePointRole ~= roleConst.FINISH then
		return nil, nil, nil, nil, "finish must be the last meaningful route point"
	end

	local checkpointCount = #meaningfulPoints - 2

	for meaningfulIndex = 2, #meaningfulPoints - 1 do
		local checkpoint = meaningfulPoints[meaningfulIndex]
		local expectedCheckpointIndex = meaningfulIndex - 1

		if checkpoint.routePointRole ~= roleConst.CHECKPOINT then
			return nil, nil, nil, nil, "intermediate meaningful route point must be a checkpoint"
		end

		checkpoint.checkpointIndex = expectedCheckpointIndex
	end

	return sortedPoints, startPointIndex, finishPointIndex, checkpointCount, nil
end

function WorldRaceDungeonUtils._findNearestDistanceIndex(cumulativeDistances, targetDistance)
	local after = WorldRaceDungeonUtils._findDistanceIndexAtOrAfter(cumulativeDistances, targetDistance)
	local before = math.max(1, after - 1)
	local nearest = math.abs(cumulativeDistances[before] - targetDistance) <= math.abs(cumulativeDistances[after] - targetDistance) and before or after

	return WorldRaceDungeonUtils._findDistanceIndexAtOrAfter(cumulativeDistances, cumulativeDistances[nearest])
end

function WorldRaceDungeonUtils._findDistanceIndexAtOrBefore(cumulativeDistances, targetDistance)
	local low, high = 1, #cumulativeDistances
	local resultIndex = 1

	while low <= high do
		local middle = math.floor((low + high) / 2)

		if targetDistance >= cumulativeDistances[middle] then
			resultIndex = middle
			low = middle + 1
		else
			high = middle - 1
		end
	end

	return resultIndex
end

function WorldRaceDungeonUtils._findDistanceIndexAtOrAfter(cumulativeDistances, targetDistance)
	local low, high = 1, #cumulativeDistances
	local resultIndex = high

	while low <= high do
		local middle = math.floor((low + high) / 2)

		if targetDistance <= cumulativeDistances[middle] then
			resultIndex = middle
			high = middle - 1
		else
			low = middle + 1
		end
	end

	return resultIndex
end

function WorldRaceDungeonUtils._rotateEulerZXY(vector, eulerDegrees)
	local x, y, z = WorldRaceDungeonUtils._readVector(vector)
	local rx, ry, rz = WorldRaceDungeonUtils._readVector(eulerDegrees)

	if x == nil or rx == nil then
		return nil
	end

	local sinX, cosX = math.sin(math.rad(rx)), math.cos(math.rad(rx))
	local sinY, cosY = math.sin(math.rad(ry)), math.cos(math.rad(ry))
	local sinZ, cosZ = math.sin(math.rad(rz)), math.cos(math.rad(rz))
	local zx, zy = x * cosZ - y * sinZ, x * sinZ + y * cosZ
	local xy, xz = zy * cosX - z * sinX, zy * sinX + z * cosX

	return {
		zx * cosY + xz * sinY,
		xy,
		-zx * sinY + xz * cosY
	}
end

function WorldRaceDungeonUtils._buildGate(point, gateIndex, sampleIndex, routeDistance)
	local right = WorldRaceDungeonUtils._rotateEulerZXY(Vector3.constRight, point.rotation)
	local up = WorldRaceDungeonUtils._rotateEulerZXY(Vector3.constUp, point.rotation)
	local forward = WorldRaceDungeonUtils._rotateEulerZXY(Vector3.constForward, point.rotation)

	return {
		id = point.id,
		gateIndex = gateIndex,
		routeOrder = point.routeOrder,
		routePointRole = point.routePointRole,
		checkpointIndex = point.checkpointIndex,
		position = WorldRaceDungeonUtils._copyPosition(point.position),
		rotation = WorldRaceDungeonUtils._copyPosition(point.rotation),
		gateWidth = point.gateWidth,
		gateHeight = point.gateHeight,
		gateThickness = point.gateThickness,
		revivePortalId = point.revivePortalId,
		right = right,
		up = up,
		forward = forward,
		sampleIndex = sampleIndex,
		routeDistance = routeDistance
	}
end

function WorldRaceDungeonUtils._buildGatesAndSegments(sortedPoints, controlDenseIndices, activeDenseStartIndex, denseCumulativeDistances, sampleCumulativeDistances)
	local roleConst = WorldRaceDungeonConst.ROUTE_POINT_ROLE
	local gates = {}

	for pointIndex, point in ipairs(sortedPoints) do
		if point.routePointRole ~= roleConst.CONTROL then
			local activeDenseIndex = controlDenseIndices[pointIndex] - activeDenseStartIndex + 1
			local denseRouteDistance = denseCumulativeDistances[activeDenseIndex]
			local sampleIndex = WorldRaceDungeonUtils._findNearestDistanceIndex(sampleCumulativeDistances, denseRouteDistance)

			gates[#gates + 1] = WorldRaceDungeonUtils._buildGate(point, #gates + 1, sampleIndex, denseRouteDistance)
		end
	end

	local segments = {}

	for gateIndex = 1, #gates - 1 do
		local startGate = gates[gateIndex]
		local endGate = gates[gateIndex + 1]

		if endGate.routeDistance <= startGate.routeDistance then
			return nil, nil, "route gate distances must be strictly increasing"
		end

		segments[#segments + 1] = {
			lastCheckpointIndex = gateIndex - 1,
			startGateIndex = gateIndex,
			endGateIndex = gateIndex + 1,
			startSampleIndex = WorldRaceDungeonUtils._findDistanceIndexAtOrBefore(sampleCumulativeDistances, startGate.routeDistance),
			endSampleIndex = WorldRaceDungeonUtils._findDistanceIndexAtOrAfter(sampleCumulativeDistances, endGate.routeDistance),
			startDistance = startGate.routeDistance,
			endDistance = endGate.routeDistance
		}
	end

	return gates, segments, nil
end

function WorldRaceDungeonUtils.buildRoute(sceneId, trackId)
	local routePoints = SceneUtils.getSceneWorldRaceRoutePointGroupData(sceneId, trackId)

	if not Utils.isTable(routePoints) or next(routePoints) == nil then
		return nil, string.format("world race route points unavailable sceneId=%s trackId=%s", tostring(sceneId), tostring(trackId))
	end

	local routeCache, routeError = WorldRaceDungeonUtils._buildRouteFromPoints(routePoints, WorldRaceDungeonUtils.DEFAULT_SAMPLE_INTERVAL)

	if routeCache == nil then
		return nil, string.format("world race route build failed sceneId=%s trackId=%s: %s", tostring(sceneId), tostring(trackId), tostring(routeError))
	end

	return routeCache, nil
end

function WorldRaceDungeonUtils._buildRouteFromPoints(routePoints, sampleInterval)
	if not WorldRaceDungeonUtils._isFiniteNumber(sampleInterval) or sampleInterval < WorldRaceDungeonUtils.MIN_SAMPLE_INTERVAL then
		return nil, "sampleInterval must be at least 0.1"
	end

	local sortedPoints, startPointIndex, finishPointIndex, checkpointCount, validationError = WorldRaceDungeonUtils._validateAndSortRoutePoints(routePoints)

	if sortedPoints == nil then
		return nil, validationError
	end

	local warnings = {}
	local allDensePoints, controlDenseIndices = WorldRaceDungeonUtils._buildDensePolyline(sortedPoints, sampleInterval, warnings)
	local activeDenseStartIndex = controlDenseIndices[startPointIndex]
	local activeDenseEndIndex = controlDenseIndices[finishPointIndex]
	local densePoints = WorldRaceDungeonUtils._slicePoints(allDensePoints, activeDenseStartIndex, activeDenseEndIndex)
	local denseCumulativeDistances, denseTotalLength, denseCumulativeError = WorldRaceDungeonUtils._buildCumulativeDistances(densePoints)

	if denseCumulativeDistances == nil or denseTotalLength <= WorldRaceDungeonUtils.EPSILON then
		return nil, denseCumulativeError or "route length must be greater than zero"
	end

	local samples, cumulativeDistances, totalLength, resampleError = WorldRaceDungeonUtils._resampleByDistance(densePoints, sampleInterval, denseCumulativeDistances, denseTotalLength)

	if samples == nil then
		return nil, resampleError
	end

	local gates, segments, gateError = WorldRaceDungeonUtils._buildGatesAndSegments(sortedPoints, controlDenseIndices, activeDenseStartIndex, denseCumulativeDistances, cumulativeDistances)

	if gates == nil then
		return nil, gateError
	end

	return {
		samples = samples,
		cumulativeDistances = cumulativeDistances,
		totalLength = totalLength,
		segments = segments,
		gates = gates,
		warnings = warnings,
		checkpointCount = checkpointCount,
		sampleInterval = sampleInterval,
		projectionIndex = WorldRaceDungeonUtils._buildProjectionIndex(samples)
	}, nil
end

function WorldRaceDungeonUtils._buildProjectionIndex(samples)
	local blockEdgeCount = WorldRaceDungeonUtils.PROJECTION_BLOCK_EDGE_COUNT

	if blockEdgeCount >= #samples - 1 then
		return nil
	end

	local blocks = {}

	for firstSampleIndex = 1, #samples - 1, blockEdgeCount do
		local lastSampleIndex = math.min(firstSampleIndex + blockEdgeCount - 1, #samples - 1)
		local first = samples[firstSampleIndex]
		local minX, minY, minZ, maxX, maxY, maxZ = first[1], first[2], first[3], first[1], first[2], first[3]

		for sampleIndex = firstSampleIndex + 1, lastSampleIndex + 1 do
			local point = samples[sampleIndex]

			minX, minY, minZ = math.min(minX, point[1]), math.min(minY, point[2]), math.min(minZ, point[3])
			maxX, maxY, maxZ = math.max(maxX, point[1]), math.max(maxY, point[2]), math.max(maxZ, point[3])
		end

		local padding = WorldRaceDungeonUtils.EPSILON * math.max(1, math.abs(minX), math.abs(maxX), math.abs(minY), math.abs(maxY), math.abs(minZ), math.abs(maxZ))

		blocks[#blocks + 1] = {
			firstSampleIndex = firstSampleIndex,
			lastSampleIndex = lastSampleIndex,
			minX = minX - padding,
			minY = minY - padding,
			minZ = minZ - padding,
			maxX = maxX + padding,
			maxY = maxY + padding,
			maxZ = maxZ + padding
		}
	end

	return {
		blockEdgeCount = blockEdgeCount,
		blocks = blocks
	}
end

function WorldRaceDungeonUtils._getProjectionBlockDistanceSquared(block, x, y, z)
	local closestX = math.max(block.minX, math.min(block.maxX, x))
	local closestY = math.max(block.minY, math.min(block.maxY, y))
	local closestZ = math.max(block.minZ, math.min(block.maxZ, z))

	return Vector3.SqrDistanceEx(x, y, z, closestX, closestY, closestZ)
end

function WorldRaceDungeonUtils._buildProgressResult(routeCache, routeDistance, x, y, z, distanceSquared)
	return {
		routeDistance = routeDistance,
		progressPercent = routeDistance / routeCache.totalLength,
		projectedPosition = {
			x,
			y,
			z
		},
		distanceToRoute = math.sqrt(distanceSquared)
	}
end

function WorldRaceDungeonUtils._getPositionAtRouteDistance(routeCache, routeDistance, output)
	local clampedDistance = math.max(0, math.min(routeCache.totalLength, routeDistance))

	if clampedDistance <= WorldRaceDungeonUtils.EPSILON then
		Vector3.Copy(output, routeCache.samples[1])
	elseif clampedDistance >= routeCache.totalLength - WorldRaceDungeonUtils.EPSILON then
		Vector3.Copy(output, routeCache.samples[#routeCache.samples])
	else
		local sampleIndex = WorldRaceDungeonUtils._findDistanceIndexAtOrBefore(routeCache.cumulativeDistances, clampedDistance)
		local nextSampleIndex = math.min(sampleIndex + 1, #routeCache.samples)
		local startDistance = routeCache.cumulativeDistances[sampleIndex]
		local segmentLength = routeCache.cumulativeDistances[nextSampleIndex] - startDistance

		if segmentLength <= WorldRaceDungeonUtils.EPSILON then
			Vector3.Copy(output, routeCache.samples[sampleIndex])
		else
			Vector3.SubByCache(routeCache.samples[nextSampleIndex], routeCache.samples[sampleIndex], output)
			Vector3.Mul(output, (clampedDistance - startDistance) / segmentLength)
			Vector3.AddByCache(routeCache.samples[sampleIndex], output, output)
		end
	end
end

function WorldRaceDungeonUtils.getPositionAtRouteDistance(routeCache, routeDistance, output)
	if not Utils.isTable(routeCache) or not Utils.isTable(routeCache.samples) or not Utils.isTable(routeCache.cumulativeDistances) or not WorldRaceDungeonUtils._isFiniteNumber(routeCache.totalLength) or not WorldRaceDungeonUtils._isFiniteNumber(routeDistance) or not Utils.isTable(output) then
		return false
	end

	WorldRaceDungeonUtils._getPositionAtRouteDistance(routeCache, routeDistance, output)

	return true
end

function WorldRaceDungeonUtils.calculateProgress(routeCache, playerPosition, lastCheckpointIndex)
	local distance, x, y, z, distanceSquared, errorMessage = WorldRaceDungeonUtils._calculateProgressValues(routeCache, playerPosition, lastCheckpointIndex)

	if distance == nil then
		return nil, errorMessage
	end

	return WorldRaceDungeonUtils._buildProgressResult(routeCache, distance, x, y, z, distanceSquared), nil
end

function WorldRaceDungeonUtils._calculateProgressValues(routeCache, playerPosition, lastCheckpointIndex)
	if not Utils.isTable(routeCache) or not Utils.isTable(routeCache.samples) or not Utils.isTable(routeCache.cumulativeDistances) or not Utils.isTable(routeCache.segments) or not Utils.isTable(routeCache.gates) or not WorldRaceDungeonUtils._isFiniteNumber(routeCache.totalLength) or routeCache.totalLength <= WorldRaceDungeonUtils.EPSILON then
		return nil, nil, nil, nil, nil, "routeCache is invalid"
	end

	local x, y, z = WorldRaceDungeonUtils._readVector(playerPosition)

	if x == nil then
		return nil, nil, nil, nil, nil, "playerPosition is invalid"
	end

	if not WorldRaceDungeonUtils._isInteger(lastCheckpointIndex) or lastCheckpointIndex < -1 or lastCheckpointIndex > routeCache.checkpointCount then
		return nil, nil, nil, nil, nil, "lastCheckpointIndex is invalid"
	end

	if lastCheckpointIndex == -1 then
		local start = routeCache.gates[1].position

		return 0, start[1], start[2], start[3], Vector3.SqrDistanceEx(x, y, z, start[1], start[2], start[3]), nil
	end

	local segment = routeCache.segments[lastCheckpointIndex + 1]

	if segment == nil then
		return nil, nil, nil, nil, nil, "checkpoint segment is missing"
	end

	local vector, offset, projected = Vector3.GetFromPool(), Vector3.GetFromPool(), Vector3.GetFromPool()
	local distance, px, py, pz, distanceSquared, errorMessage = WorldRaceDungeonUtils._projectProgress(routeCache, segment, x, y, z, vector, offset, projected)

	Vector3.returnToPool(vector)
	Vector3.returnToPool(offset)
	Vector3.returnToPool(projected)

	return distance, px, py, pz, distanceSquared, errorMessage
end

function WorldRaceDungeonUtils._projectSampleRange(routeCache, segment, scanStartIndex, scanEndIndex, x, y, z, vector, offset, projected)
	local samples, cumulative = routeCache.samples, routeCache.cumulativeDistances
	local firstSampleIndex, lastSampleIndex = segment.startSampleIndex, segment.endSampleIndex - 1
	local startDistance, endDistance = segment.startDistance, segment.endDistance
	local nearestX, nearestY, nearestZ, nearestRouteDistance, nearestSampleIndex
	local nearestDistanceSquared = math.huge
	local epsilon = WorldRaceDungeonUtils.EPSILON

	for sampleIndex = scanStartIndex, scanEndIndex do
		local segmentStart, segmentEnd = samples[sampleIndex], samples[sampleIndex + 1]

		if segmentStart ~= nil and segmentEnd ~= nil then
			Vector3.SubByCache(segmentEnd, segmentStart, vector)

			local segmentLengthSquared = Vector3.SqrMagnitude(vector)

			if segmentLengthSquared > epsilon * epsilon then
				local minPercent, maxPercent = 0, 1

				if sampleIndex == firstSampleIndex or sampleIndex == lastSampleIndex then
					local sampleStartDistance = cumulative[sampleIndex]
					local sampleLength = cumulative[sampleIndex + 1] - sampleStartDistance

					if sampleLength > 0 then
						minPercent = math.max(0, (startDistance - sampleStartDistance) / sampleLength)
						maxPercent = math.min(1, (endDistance - sampleStartDistance) / sampleLength)
					else
						minPercent, maxPercent = 1, 0
					end
				end

				if minPercent <= maxPercent then
					Vector3.Set(offset, x, y, z)
					Vector3.Sub(offset, segmentStart)

					local percent = math.max(minPercent, math.min(maxPercent, Vector3.Dot(offset, vector) / segmentLengthSquared))

					Vector3.Mul(vector, percent)
					Vector3.AddByCache(segmentStart, vector, projected)

					local distanceSquared = Vector3.SqrDistanceEx(x, y, z, projected[1], projected[2], projected[3])

					if distanceSquared < nearestDistanceSquared then
						nearestDistanceSquared = distanceSquared
						nearestX, nearestY, nearestZ = projected[1], projected[2], projected[3]
						nearestRouteDistance = cumulative[sampleIndex] + (cumulative[sampleIndex + 1] - cumulative[sampleIndex]) * percent
						nearestSampleIndex = sampleIndex
					end
				end
			end
		end
	end

	return nearestRouteDistance, nearestX, nearestY, nearestZ, nearestDistanceSquared, nearestSampleIndex
end

function WorldRaceDungeonUtils._projectProgress(routeCache, segment, x, y, z, vector, offset, projected)
	local firstSampleIndex, lastSampleIndex = segment.startSampleIndex, segment.endSampleIndex - 1
	local startDistance, endDistance = segment.startDistance, segment.endDistance
	local nearestRouteDistance, nearestX, nearestY, nearestZ, nearestDistanceSquared, nearestSampleIndex
	local index = routeCache.projectionIndex

	if index == nil or lastSampleIndex - firstSampleIndex + 1 <= index.blockEdgeCount then
		nearestRouteDistance, nearestX, nearestY, nearestZ, nearestDistanceSquared = WorldRaceDungeonUtils._projectSampleRange(routeCache, segment, firstSampleIndex, lastSampleIndex, x, y, z, vector, offset, projected)
	else
		local blocks = index.blocks
		local firstBlockIndex = math.floor((firstSampleIndex - 1) / index.blockEdgeCount) + 1
		local lastBlockIndex = math.floor((lastSampleIndex - 1) / index.blockEdgeCount) + 1
		local seedBlockIndex, seedDistanceSquared = firstBlockIndex, math.huge

		for blockIndex = firstBlockIndex, lastBlockIndex do
			local distanceSquared = WorldRaceDungeonUtils._getProjectionBlockDistanceSquared(blocks[blockIndex], x, y, z)

			if distanceSquared < seedDistanceSquared then
				seedBlockIndex, seedDistanceSquared = blockIndex, distanceSquared
			end
		end

		local seed = blocks[seedBlockIndex]

		nearestRouteDistance, nearestX, nearestY, nearestZ, nearestDistanceSquared, nearestSampleIndex = WorldRaceDungeonUtils._projectSampleRange(routeCache, segment, math.max(firstSampleIndex, seed.firstSampleIndex), math.min(lastSampleIndex, seed.lastSampleIndex), x, y, z, vector, offset, projected)

		local searchDistanceSquared = nearestDistanceSquared + WorldRaceDungeonUtils.EPSILON * math.max(1, nearestDistanceSquared)

		for blockIndex = firstBlockIndex, lastBlockIndex do
			local block = blocks[blockIndex]

			if blockIndex ~= seedBlockIndex and searchDistanceSquared >= WorldRaceDungeonUtils._getProjectionBlockDistanceSquared(block, x, y, z) then
				local routeDistance, px, py, pz, distanceSquared, sampleIndex = WorldRaceDungeonUtils._projectSampleRange(routeCache, segment, math.max(firstSampleIndex, block.firstSampleIndex), math.min(lastSampleIndex, block.lastSampleIndex), x, y, z, vector, offset, projected)

				if routeDistance ~= nil and (distanceSquared < nearestDistanceSquared or distanceSquared == nearestDistanceSquared and sampleIndex < nearestSampleIndex) then
					nearestRouteDistance, nearestX, nearestY, nearestZ = routeDistance, px, py, pz
					nearestDistanceSquared, nearestSampleIndex = distanceSquared, sampleIndex
					searchDistanceSquared = nearestDistanceSquared + WorldRaceDungeonUtils.EPSILON * math.max(1, nearestDistanceSquared)
				end
			end
		end
	end

	if nearestX == nil then
		local samples, cumulative = routeCache.samples, routeCache.cumulativeDistances
		local fallback = samples[segment.startSampleIndex]

		nearestRouteDistance = cumulative[segment.startSampleIndex]

		if fallback == nil or nearestRouteDistance == nil then
			return nil, nil, nil, nil, nil, "checkpoint segment contains no valid samples"
		end

		nearestRouteDistance = math.max(startDistance, math.min(endDistance, nearestRouteDistance))

		WorldRaceDungeonUtils._getPositionAtRouteDistance(routeCache, nearestRouteDistance, projected)

		nearestX, nearestY, nearestZ = projected[1], projected[2], projected[3]
		nearestDistanceSquared = Vector3.SqrDistanceEx(x, y, z, nearestX, nearestY, nearestZ)
	end

	return math.max(startDistance, math.min(endDistance, nearestRouteDistance)), nearestX, nearestY, nearestZ, nearestDistanceSquared, nil
end

function WorldRaceDungeonUtils.checkNextGateCrossing(routeCache, previousPosition, currentPosition, lastCheckpointIndex)
	if not Utils.isTable(routeCache) or not Utils.isTable(routeCache.gates) or not WorldRaceDungeonUtils._isInteger(routeCache.checkpointCount) or routeCache.checkpointCount < 0 then
		return nil, "routeCache is invalid"
	end

	if not WorldRaceDungeonUtils._isInteger(lastCheckpointIndex) or lastCheckpointIndex < -1 or lastCheckpointIndex > routeCache.checkpointCount then
		return nil, "lastCheckpointIndex is invalid"
	end

	local nextGateIndex = lastCheckpointIndex + 2
	local gate = routeCache.gates[nextGateIndex]

	if gate == nil then
		return nil, "next gate is missing"
	end

	local px, py, pz = WorldRaceDungeonUtils._readVector(previousPosition)
	local cx, cy, cz = WorldRaceDungeonUtils._readVector(currentPosition)

	if px == nil or cx == nil then
		return nil, "gate crossing positions are invalid"
	end

	if not WorldRaceDungeonUtils._isFiniteNumber(gate.gateWidth) or gate.gateWidth <= 0 or not WorldRaceDungeonUtils._isFiniteNumber(gate.gateHeight) or gate.gateHeight <= 0 or gate.routePointRole ~= WorldRaceDungeonConst.ROUTE_POINT_ROLE.FINISH and (not WorldRaceDungeonUtils._isFiniteNumber(gate.gateThickness) or gate.gateThickness <= 0) or gate.position == nil or gate.forward == nil or gate.right == nil or gate.up == nil then
		return nil, "gate configuration is invalid"
	end

	local previous = Vector3.GetFromPool(px, py, pz)
	local current = Vector3.GetFromPool(cx, cy, cz)
	local offset = Vector3.GetFromPool()
	local passed, x, y, z, crossingPercent

	if gate.routePointRole == WorldRaceDungeonConst.ROUTE_POINT_ROLE.FINISH then
		passed, x, y, z, crossingPercent = WorldRaceDungeonUtils._checkFinishVolumeEntryValues(gate, previous, current, offset)
	else
		passed, x, y, z, crossingPercent = WorldRaceDungeonUtils._checkGateCrossingValues(gate, previous, current, offset)
	end

	Vector3.returnToPool(previous)
	Vector3.returnToPool(current)
	Vector3.returnToPool(offset)

	if not passed then
		return {
			passed = false
		}, nil
	end

	return {
		passed = true,
		gateIndex = nextGateIndex,
		routePointRole = gate.routePointRole,
		checkpointIndex = gate.checkpointIndex,
		revivePortalId = gate.revivePortalId,
		isFinish = gate.routePointRole == WorldRaceDungeonConst.ROUTE_POINT_ROLE.FINISH,
		intersectionPosition = {
			x,
			y,
			z
		},
		crossingPercent = crossingPercent
	}, nil
end

function WorldRaceDungeonUtils._clipGateVolumeAxis(start, finish, halfSize, enter, leave)
	local delta = finish - start

	if delta == 0 then
		if halfSize < math.abs(start) then
			return nil
		end

		return enter, leave
	end

	local near, far = (-halfSize - start) / delta, (halfSize - start) / delta

	if far < near then
		near, far = far, near
	end

	enter, leave = math.max(enter, near), math.min(leave, far)

	if leave < enter then
		return nil
	end

	return enter, leave
end

function WorldRaceDungeonUtils._checkFinishVolumeEntryValues(gate, previous, current, offset)
	Vector3.SubByCache(previous, gate.position, offset)

	local px, py, pz = offset[1], offset[2], offset[3]
	local radius = gate.gateWidth / 2 + WorldRaceDungeonUtils.EPSILON
	local halfHeight = gate.gateHeight / 2 + WorldRaceDungeonUtils.EPSILON
	local radiusSquared = radius * radius
	local startRadiusSquared = px * px + pz * pz

	if startRadiusSquared <= radiusSquared and halfHeight >= math.abs(py) then
		return false
	end

	Vector3.SubByCache(current, gate.position, offset)

	local cx, cy, cz = offset[1], offset[2], offset[3]
	local dx, dz = cx - px, cz - pz
	local horizontalLengthSquared = dx * dx + dz * dz
	local enter, leave = 0, 1

	if horizontalLengthSquared == 0 then
		if radiusSquared < startRadiusSquared then
			return false
		end
	else
		local dot = px * dx + pz * dz
		local cross = px * dz - pz * dx
		local discriminant = horizontalLengthSquared * radiusSquared - cross * cross

		if discriminant < 0 then
			return false
		end

		local root = math.sqrt(discriminant)

		enter = math.max(enter, (-dot - root) / horizontalLengthSquared)
		leave = math.min(leave, (-dot + root) / horizontalLengthSquared)

		if leave < enter then
			return false
		end
	end

	enter, leave = WorldRaceDungeonUtils._clipGateVolumeAxis(py, cy, halfHeight, enter, leave)

	if enter == nil then
		return false
	end

	Vector3.Sub(current, previous)
	Vector3.Mul(current, enter)
	Vector3.AddByCache(previous, current, current)

	return true, current[1], current[2], current[3], enter
end

function WorldRaceDungeonUtils._checkGateCrossingValues(gate, previous, current, offset)
	Vector3.SubByCache(previous, gate.position, offset)

	local previousDistance = Vector3.Dot(offset, gate.forward)

	Vector3.SubByCache(current, gate.position, offset)

	local currentDistance = Vector3.Dot(offset, gate.forward)

	if previousDistance == 0 then
		return false
	end

	local distanceDelta = currentDistance - previousDistance

	if math.abs(distanceDelta) <= WorldRaceDungeonUtils.EPSILON then
		return false
	end

	local percent = -previousDistance / distanceDelta

	if percent < 0 or percent > 1 then
		return false
	end

	Vector3.Sub(current, previous)
	Vector3.Mul(current, percent)
	Vector3.AddByCache(previous, current, current)
	Vector3.SubByCache(current, gate.position, offset)

	local rightDistance, upDistance = Vector3.Dot(offset, gate.right), Vector3.Dot(offset, gate.up)

	if math.abs(rightDistance) > gate.gateWidth / 2 + WorldRaceDungeonUtils.EPSILON or math.abs(upDistance) > gate.gateHeight / 2 + WorldRaceDungeonUtils.EPSILON then
		return false
	end

	return true, current[1], current[2], current[3], percent
end

function WorldRaceDungeonUtils._buildEntry(routeCache, player)
	if not Utils.isTable(player) then
		return nil, "player must be a table"
	end

	if type(player.playerId) ~= "string" or player.playerId == "" then
		return nil, "playerId must be a non-empty string"
	end

	if not WorldRaceDungeonUtils._isInteger(player.lastCheckpointIndex) then
		return nil, "lastCheckpointIndex must be an integer"
	end

	if type(player.isFinished) ~= "boolean" then
		return nil, "isFinished must be a boolean"
	end

	if player.isFinished then
		if not WorldRaceDungeonUtils._isInteger(player.finishOrder) or player.finishOrder <= 0 then
			return nil, "finishOrder must be a positive integer"
		end

		if not Utils.isTable(routeCache) or player.lastCheckpointIndex ~= routeCache.checkpointCount then
			return nil, "player finished before completing all checkpoints"
		end
	elseif player.finishOrder ~= nil then
		return nil, "finishOrder must be nil before finishing"
	end

	local routeDistance, _, _, _, _, progressError = WorldRaceDungeonUtils._calculateProgressValues(routeCache, player.position, player.lastCheckpointIndex)

	if routeDistance == nil then
		return nil, progressError
	end

	return {
		rank = 0,
		playerId = player.playerId,
		lastCheckpointIndex = player.lastCheckpointIndex,
		routeDistance = routeDistance,
		progressPercent = routeDistance / routeCache.totalLength,
		isFinished = player.isFinished,
		finishOrder = player.finishOrder
	}, nil
end

function WorldRaceDungeonUtils._getPreviousRank(previousRankMap, playerId)
	local previousRank = previousRankMap[playerId]

	if previousRank == nil then
		return math.huge
	end

	return previousRank
end

function WorldRaceDungeonUtils._compareEntries(left, right, previousRankMap)
	if left.isFinished ~= right.isFinished then
		return left.isFinished
	end

	if left.isFinished and left.finishOrder ~= right.finishOrder then
		return left.finishOrder < right.finishOrder
	end

	local leftCrossedStart = left.lastCheckpointIndex >= 0
	local rightCrossedStart = right.lastCheckpointIndex >= 0

	if leftCrossedStart ~= rightCrossedStart then
		return leftCrossedStart
	end

	if left.lastCheckpointIndex ~= right.lastCheckpointIndex then
		return left.lastCheckpointIndex > right.lastCheckpointIndex
	end

	local leftDistanceBucket = math.floor(left.routeDistance / WorldRaceDungeonUtils.ROUTE_DISTANCE_TIE_EPSILON)
	local rightDistanceBucket = math.floor(right.routeDistance / WorldRaceDungeonUtils.ROUTE_DISTANCE_TIE_EPSILON)

	if leftDistanceBucket ~= rightDistanceBucket then
		return rightDistanceBucket < leftDistanceBucket
	end

	local leftPreviousRank = WorldRaceDungeonUtils._getPreviousRank(previousRankMap, left.playerId)
	local rightPreviousRank = WorldRaceDungeonUtils._getPreviousRank(previousRankMap, right.playerId)

	if leftPreviousRank ~= rightPreviousRank then
		return leftPreviousRank < rightPreviousRank
	end

	return left.playerId < right.playerId
end

function WorldRaceDungeonUtils.calculateRanking(routeCache, players, previousRankMap)
	if not Utils.isTable(players) then
		return nil, "players must be a table"
	end

	local ranking = {}
	local playerIdSet = {}

	for _, player in pairs(players) do
		local entry, entryError = WorldRaceDungeonUtils._buildEntry(routeCache, player)

		if entry == nil then
			return nil, entryError
		end

		if playerIdSet[entry.playerId] then
			return nil, "duplicate playerId"
		end

		playerIdSet[entry.playerId] = true
		ranking[#ranking + 1] = entry
	end

	if #ranking == 0 then
		return {}, nil
	end

	if previousRankMap == nil then
		previousRankMap = {}
	elseif not Utils.isTable(previousRankMap) then
		return nil, "previousRankMap must be a table"
	end

	for playerId in pairs(playerIdSet) do
		local previousRank = previousRankMap[playerId]

		if previousRank ~= nil and (not WorldRaceDungeonUtils._isInteger(previousRank) or previousRank <= 0) then
			return nil, "previous rank must be a positive integer"
		end
	end

	table.sort(ranking, function(left, right)
		return WorldRaceDungeonUtils._compareEntries(left, right, previousRankMap)
	end)

	for rank, entry in ipairs(ranking) do
		entry.rank = rank
	end

	return ranking, nil
end

function WorldRaceDungeonUtils.calculateTimeThresholds(progressPercent, fullRaceTimes)
	if not WorldRaceDungeonUtils._isFiniteNumber(progressPercent) then
		return nil, "progressPercent must be a finite number"
	end

	if not Utils.isTable(fullRaceTimes) then
		return nil, "fullRaceTimes must be a table"
	end

	local a50Time = fullRaceTimes.a50Time
	local fullSTime = fullRaceTimes.sTime
	local fullBTime = fullRaceTimes.bTime

	if not WorldRaceDungeonUtils._isFiniteNumber(a50Time) or not WorldRaceDungeonUtils._isFiniteNumber(fullSTime) or not WorldRaceDungeonUtils._isFiniteNumber(fullBTime) or not (fullSTime > 0) or not (fullSTime < a50Time) or not (a50Time < fullBTime) then
		return nil, "fullRaceTimes must satisfy finite 0 < sTime < a50Time < bTime"
	end

	local progress = math.max(0, math.min(1, progressPercent))
	local remaining = 1 - progress
	local timeFactor = 2 * progress * progress - progress * progress * progress + remaining * remaining * math.sqrt(progress)
	local aTime = progress * a50Time
	local sTimeDelta = (fullSTime - a50Time) * timeFactor
	local bTimeDelta = (fullBTime - a50Time) * timeFactor
	local sTime = aTime + sTimeDelta
	local bTime = aTime + bTimeDelta

	if progress == 1 then
		sTime = fullSTime
		bTime = fullBTime
	end

	if not WorldRaceDungeonUtils._isFiniteNumber(aTime) or not WorldRaceDungeonUtils._isFiniteNumber(sTimeDelta) or not WorldRaceDungeonUtils._isFiniteNumber(bTimeDelta) or not WorldRaceDungeonUtils._isFiniteNumber(sTime) or not WorldRaceDungeonUtils._isFiniteNumber(bTime) then
		return nil, "calculated rating times must be finite"
	end

	if progress > 0 and (not (sTimeDelta < 0) or not (bTimeDelta > 0) or not (sTime < aTime) or not (aTime < bTime)) then
		return nil, "calculated rating intervals must be distinguishable"
	end

	return {
		progressPercent = progress,
		timeFactor = timeFactor,
		aTime = aTime,
		sTimeDelta = sTimeDelta,
		bTimeDelta = bTimeDelta,
		sTime = sTime,
		bTime = bTime
	}, nil
end

function WorldRaceDungeonUtils.calculateRating(progressPercent, elapsedTime, fullRaceTimes)
	if not WorldRaceDungeonUtils._isFiniteNumber(elapsedTime) or elapsedTime < 0 then
		return nil, "elapsedTime must be a non-negative finite number"
	end

	local result, errorMessage = WorldRaceDungeonUtils.calculateTimeThresholds(progressPercent, fullRaceTimes)

	if result == nil then
		return nil, errorMessage
	end

	if result.progressPercent == 0 then
		if elapsedTime == 0 then
			result.grade = "A"
			result.fillPercent = 0.5
		else
			result.grade = "B"
			result.fillPercent = 0
		end
	elseif elapsedTime <= result.sTime then
		result.grade = "S"
		result.fillPercent = 1
	elseif elapsedTime >= result.bTime then
		result.grade = "B"
		result.fillPercent = 0
	else
		local timeDifference = elapsedTime - result.aTime

		result.grade = "A"

		if timeDifference <= 0 then
			result.fillPercent = 0.5 + 0.5 * timeDifference / result.sTimeDelta
		else
			result.fillPercent = 0.5 - 0.5 * timeDifference / result.bTimeDelta
		end

		result.fillPercent = math.max(0, math.min(1, result.fillPercent))
	end

	return result, nil
end

return WorldRaceDungeonUtils
