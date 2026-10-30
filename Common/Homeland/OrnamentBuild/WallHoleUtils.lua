-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Homeland\\OrnamentBuild\\WallHoleUtils.lua

local HomeWallHoleData = require("Data.home_wall_hole_data")
local WallHoleUtils = {}

WallHoleUtils.CELL_SIZE = 0.5
WallHoleUtils.POSITION_EPSILON = 0.015
WallHoleUtils.ANGLE_EPSILON = 0.1
WallHoleUtils.DEFAULT_ROTATION_DOT_THRESHOLD = 0.95
WallHoleUtils.wallConfigCache = {}
WallHoleUtils.holeConfigCache = {}

function WallHoleUtils.round(value)
	return math.floor(value + 0.5)
end

function WallHoleUtils.normalizeNodes(sources, state)
	local result = {}
	local cellCount = 0

	for _, source in ipairs(sources) do
		state.nextId = state.nextId + 1

		local node = {
			id = state.nextId,
			rect = {
				source.rect[1],
				source.rect[2],
				source.rect[3],
				source.rect[4]
			},
			source = source
		}

		result[#result + 1] = node

		if source.children ~= nil then
			node.children, node.cellCount = WallHoleUtils.normalizeNodes(source.children, state)
		else
			node.cellCount = 1
			state.occupiedCells[node.rect[2] * state.widthCells + node.rect[1]] = true
		end

		cellCount = cellCount + node.cellCount
	end

	return result, cellCount
end

function WallHoleUtils.getWallConfig(homeTemplateId)
	local config = HomeWallHoleData[homeTemplateId]
	local source = config and config.wallPartConfig

	if source == nil then
		return nil
	end

	local cached = WallHoleUtils.wallConfigCache[source]

	if cached then
		return cached
	end

	local widthCells = WallHoleUtils.round(source.width / WallHoleUtils.CELL_SIZE)
	local heightCells = WallHoleUtils.round(source.height / WallHoleUtils.CELL_SIZE)
	local width = widthCells * WallHoleUtils.CELL_SIZE
	local height = heightCells * WallHoleUtils.CELL_SIZE
	local wall = {
		width = width,
		height = height,
		thickness = source.thickness,
		centerX = source.position[1],
		centerY = source.position[2],
		centerZ = source.position[3],
		minX = source.position[1] - width * 0.5,
		minY = source.position[2] - height * 0.5,
		widthCells = widthCells,
		heightCells = heightCells,
		occupiedCells = {}
	}

	wall.parts = WallHoleUtils.normalizeNodes(source.parts, {
		nextId = 0,
		widthCells = widthCells,
		occupiedCells = wall.occupiedCells
	})
	WallHoleUtils.wallConfigCache[source] = wall

	return wall
end

function WallHoleUtils.getHoleConfig(homeTemplateId)
	local config = HomeWallHoleData[homeTemplateId]
	local source = config and config.wallHoleConfig

	if source == nil then
		return nil
	end

	local cached = WallHoleUtils.holeConfigCache[source]

	if cached then
		return cached
	end

	local widthCells = WallHoleUtils.round(source.width / WallHoleUtils.CELL_SIZE)
	local heightCells = WallHoleUtils.round(source.height / WallHoleUtils.CELL_SIZE)
	local hole = {
		width = widthCells * WallHoleUtils.CELL_SIZE,
		height = heightCells * WallHoleUtils.CELL_SIZE,
		centerX = source.position[1],
		centerY = source.position[2],
		widthCells = widthCells,
		heightCells = heightCells
	}

	WallHoleUtils.holeConfigCache[source] = hole

	return hole
end

function WallHoleUtils.worldToWall(pose, x, y, z)
	local radians = math.rad(pose.yaw)
	local cosine, sine = math.cos(radians), math.sin(radians)
	local dx, dz = x - pose.x, z - pose.z

	return cosine * dx - sine * dz, y - pose.y, sine * dx + cosine * dz
end

function WallHoleUtils.wallToWorld(pose, x, y, z)
	local radians = math.rad(pose.yaw)
	local cosine, sine = math.cos(radians), math.sin(radians)

	return pose.x + cosine * x + sine * z, pose.y + y, pose.z - sine * x + cosine * z
end

function WallHoleUtils.getFacing(wallPose, holePose, dotThreshold)
	local dot = math.cos(math.rad(holePose.yaw - wallPose.yaw))

	if dotThreshold > math.abs(dot) then
		return nil
	end

	return dot >= 0 and 1 or -1
end

function WallHoleUtils.clipRect(wall, x, y, width, height)
	local minX, minY = math.max(0, x), math.max(0, y)
	local maxX = math.min(wall.widthCells, x + width)
	local maxY = math.min(wall.heightCells, y + height)

	if maxX <= minX or maxY <= minY then
		return nil
	end

	for cellY = minY, maxY - 1 do
		for cellX = minX, maxX - 1 do
			if wall.occupiedCells[cellY * wall.widthCells + cellX] then
				return {
					x = minX,
					y = minY,
					width = maxX - minX,
					height = maxY - minY
				}
			end
		end
	end

	return nil
end

function WallHoleUtils.packRect(rect)
	return rect.x + rect.y * 16 + rect.width * 256 + rect.height * 4096
end

function WallHoleUtils.unpackRect(code)
	return {
		x = code % 16,
		y = math.floor(code / 16) % 16,
		width = math.floor(code / 256) % 16,
		height = math.floor(code / 4096) % 16
	}
end

function WallHoleUtils.getHoleRect(wall, wallPose, hole, holePose)
	local facing = WallHoleUtils.getFacing(wallPose, holePose, math.cos(math.rad(WallHoleUtils.ANGLE_EPSILON)))

	if not facing then
		return nil
	end

	local rootX, rootY, rootZ = WallHoleUtils.worldToWall(wallPose, holePose.x, holePose.y, holePose.z)

	if math.abs(rootZ - wall.centerZ) > WallHoleUtils.POSITION_EPSILON then
		return nil
	end

	local minX = rootX + facing * hole.centerX - hole.width * 0.5 - wall.minX
	local minY = rootY + hole.centerY - hole.height * 0.5 - wall.minY
	local gridX = WallHoleUtils.round(minX / WallHoleUtils.CELL_SIZE)
	local gridY = WallHoleUtils.round(minY / WallHoleUtils.CELL_SIZE)

	if math.abs(minX - gridX * WallHoleUtils.CELL_SIZE) > WallHoleUtils.POSITION_EPSILON or math.abs(minY - gridY * WallHoleUtils.CELL_SIZE) > WallHoleUtils.POSITION_EPSILON then
		return nil
	end

	return WallHoleUtils.clipRect(wall, gridX, gridY, hole.widthCells, hole.heightCells)
end

function WallHoleUtils.snapHole(wall, wallPose, hole, holePose, rotationDotThreshold)
	local facing = WallHoleUtils.getFacing(wallPose, holePose, rotationDotThreshold or WallHoleUtils.DEFAULT_ROTATION_DOT_THRESHOLD)

	if not facing then
		return nil
	end

	local rootX, rootY = WallHoleUtils.worldToWall(wallPose, holePose.x, holePose.y, holePose.z)
	local minX = rootX + facing * hole.centerX - hole.width * 0.5 - wall.minX
	local minY = rootY + hole.centerY - hole.height * 0.5 - wall.minY
	local gridX = WallHoleUtils.round(minX / WallHoleUtils.CELL_SIZE)
	local gridY = WallHoleUtils.round(minY / WallHoleUtils.CELL_SIZE)
	local rect = WallHoleUtils.clipRect(wall, gridX, gridY, hole.widthCells, hole.heightCells)

	if not rect then
		return nil
	end

	local x = wall.minX + gridX * WallHoleUtils.CELL_SIZE + hole.width * 0.5 - facing * hole.centerX
	local y = wall.minY + gridY * WallHoleUtils.CELL_SIZE + hole.height * 0.5 - hole.centerY
	local worldX, worldY, worldZ = WallHoleUtils.wallToWorld(wallPose, x, y, wall.centerZ)

	return {
		x = worldX,
		y = worldY,
		z = worldZ,
		yaw = (wallPose.yaw + (facing < 0 and 180 or 0)) % 360
	}, rect
end

function WallHoleUtils.areWallsAligned(wallA, poseA, wallB, poseB)
	if not WallHoleUtils.getFacing(poseA, poseB, math.cos(math.rad(WallHoleUtils.ANGLE_EPSILON))) then
		return false
	end

	local worldX, worldY, worldZ = WallHoleUtils.wallToWorld(poseB, wallB.minX, wallB.minY, wallB.centerZ)
	local x, y, z = WallHoleUtils.worldToWall(poseA, worldX, worldY, worldZ)

	if math.abs(z - wallA.centerZ) > WallHoleUtils.POSITION_EPSILON then
		return false
	end

	local gridX = (x - wallA.minX) / WallHoleUtils.CELL_SIZE
	local gridY = (y - wallA.minY) / WallHoleUtils.CELL_SIZE

	return math.abs(gridX - WallHoleUtils.round(gridX)) * WallHoleUtils.CELL_SIZE <= WallHoleUtils.POSITION_EPSILON and math.abs(gridY - WallHoleUtils.round(gridY)) * WallHoleUtils.CELL_SIZE <= WallHoleUtils.POSITION_EPSILON
end

function WallHoleUtils.selectNodes(nodes, widthCells, covered, selected)
	for _, node in ipairs(nodes) do
		local rect = node.rect
		local coveredCount = 0

		for y = rect[2], rect[2] + rect[4] - 1 do
			for x = rect[1], rect[1] + rect[3] - 1 do
				if covered[y * widthCells + x] then
					coveredCount = coveredCount + 1
				end
			end
		end

		if coveredCount == 0 then
			selected[node.id] = node.source
		elseif coveredCount < node.cellCount then
			WallHoleUtils.selectNodes(node.children, widthCells, covered, selected)
		end
	end
end

function WallHoleUtils.selectParts(wall, holes)
	local selected = {}

	if not holes or next(holes) == nil then
		return selected, false
	end

	local covered = {}

	for _, rect in pairs(holes) do
		local minX, minY = math.max(0, rect.x), math.max(0, rect.y)
		local maxX = math.min(wall.widthCells, rect.x + rect.width)
		local maxY = math.min(wall.heightCells, rect.y + rect.height)

		for y = minY, maxY - 1 do
			for x = minX, maxX - 1 do
				local cell = y * wall.widthCells + x

				if wall.occupiedCells[cell] then
					covered[cell] = true
				end
			end
		end
	end

	WallHoleUtils.selectNodes(wall.parts, wall.widthCells, covered, selected)

	return selected, next(covered) ~= nil
end

return WallHoleUtils
