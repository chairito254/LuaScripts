-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Homeland\\OrnamentBuild\\WallHoleDataUtils.lua

local WallHoleUtils = require("Common.Homeland.OrnamentBuild.WallHoleUtils")
local HomeWallHoleData = require("Data.home_wall_hole_data")
local WallHoleDataUtils = {}

function WallHoleDataUtils.getPose(ornamentInfo, homeConfig)
	if (homeConfig.prefabScale or 1) ~= 1 or (ornamentInfo.scaleX or 1000) ~= 1000 or (ornamentInfo.scaleY or 1000) ~= 1000 or (ornamentInfo.scaleZ or 1000) ~= 1000 or (ornamentInfo.rotX or 0) % 36000 ~= 0 or (ornamentInfo.rotZ or 0) % 36000 ~= 0 then
		return nil
	end

	return {
		x = (ornamentInfo.posX or 0) * 0.01,
		y = (ornamentInfo.posY or 0) * 0.01,
		z = (ornamentInfo.posZ or 0) * 0.01,
		yaw = (ornamentInfo.rotY or 0) * 0.01
	}
end

function WallHoleDataUtils.build(ornaments, attachData, homeObjectData)
	local walls = {}
	local holes = {}

	for ornamentId, ornamentInfo in pairs(ornaments) do
		local homeConfig = homeObjectData[ornamentInfo.homeId]

		if homeConfig then
			local wallConfig = WallHoleUtils.getWallConfig(ornamentInfo.homeId)
			local holeConfig = WallHoleUtils.getHoleConfig(ornamentInfo.homeId)

			if wallConfig or holeConfig then
				local pose = WallHoleDataUtils.getPose(ornamentInfo, homeConfig)

				if pose then
					local info = {
						pose = pose,
						areaId = ornamentInfo.areaId or 0
					}

					if wallConfig then
						info.config = wallConfig
						walls[ornamentId] = info
					elseif holeConfig then
						info.config = holeConfig
						holes[ornamentId] = info
					end
				end
			end
		end
	end

	local result = {}

	for holeId, hole in pairs(holes) do
		local attachInfo = attachData[holeId]
		local mainWall = attachInfo and walls[attachInfo.parentId]

		if mainWall and (attachInfo.slotId or 0) == 0 and mainWall.areaId == hole.areaId and WallHoleUtils.getHoleRect(mainWall.config, mainWall.pose, hole.config, hole.pose) then
			for wallId, wall in pairs(walls) do
				if wall.areaId == hole.areaId and WallHoleUtils.areWallsAligned(mainWall.config, mainWall.pose, wall.config, wall.pose) then
					local rect = WallHoleUtils.getHoleRect(wall.config, wall.pose, hole.config, hole.pose)

					if rect then
						local wallData = result[wallId]

						if not wallData then
							wallData = {}
							result[wallId] = wallData
						end

						wallData[holeId] = WallHoleUtils.packRect(rect)
					end
				end
			end
		end
	end

	return result
end

function WallHoleDataUtils.buildChanges(ornaments, extraData, homeObjectData, updates, attachChanges)
	local idMap = {}
	local pending = {}
	local changedIds = {}
	local changedWalls = {}
	local affected = {}
	local stored = extraData.wallHoleData

	for ornamentId, info in pairs(ornaments) do
		pending[ornamentId] = info
	end

	for ornamentId, update in pairs(updates) do
		if update.clientOrnamentId then
			idMap[update.clientOrnamentId] = ornamentId
		end

		changedIds[ornamentId] = true

		local oldInfo = ornaments[ornamentId]
		local info = {}

		for key, value in pairs(oldInfo or {}) do
			info[key] = value
		end

		for key, value in pairs(update) do
			info[key] = value
		end

		pending[ornamentId] = info

		local oldConfig = oldInfo and HomeWallHoleData[oldInfo.homeId]
		local config = HomeWallHoleData[info.homeId]

		if oldConfig and oldConfig.wallHoleConfig or config and config.wallHoleConfig then
			affected[ornamentId] = true
		end

		if oldConfig and oldConfig.wallPartConfig or config and config.wallPartConfig or stored[ornamentId] then
			changedWalls[ornamentId] = true
		end
	end

	local attachData = {}

	for holeId, attach in pairs(extraData.attachData) do
		attachData[holeId] = attach
	end

	for virtualId, attach in pairs(attachChanges or {}) do
		local holeId = idMap[virtualId] or virtualId
		local parentId = idMap[attach.parentId] or attach.parentId

		attachData[holeId] = parentId ~= 0 and {
			parentId = parentId,
			slotId = attach.slotId or 0
		} or nil
		changedIds[holeId] = true

		local info = pending[holeId]
		local config = info and HomeWallHoleData[info.homeId]

		if config and config.wallHoleConfig then
			affected[holeId] = true
		end
	end

	for wallId, sources in pairs(stored) do
		for holeId in pairs(sources) do
			if changedWalls[wallId] or changedIds[holeId] then
				affected[holeId] = true
			end
		end
	end

	for holeId, attach in pairs(attachData) do
		if changedWalls[attach.parentId] then
			local info = pending[holeId]
			local config = info and HomeWallHoleData[info.homeId]

			if config and config.wallHoleConfig then
				affected[holeId] = true
			end
		end
	end

	if next(affected) == nil and next(changedWalls) == nil then
		return {}
	end

	local built = WallHoleDataUtils.build(pending, attachData, homeObjectData)

	for wallId in pairs(changedWalls) do
		for holeId in pairs(built[wallId] or {}) do
			affected[holeId] = true
		end
	end

	local changes = {}

	for holeId in pairs(affected) do
		changes[holeId] = {}
	end

	for wallId, sources in pairs(built) do
		for holeId, code in pairs(sources) do
			if changes[holeId] then
				changes[holeId][wallId] = code
			end
		end
	end

	return changes
end

return WallHoleDataUtils
