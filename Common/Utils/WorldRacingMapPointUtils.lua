-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\WorldRacingMapPointUtils.lua

local logger = require("Core.Log.LoggerManager").getLogger("WorldRacingMapPointUtils")
local WorldRacingMapPointData = require("Data.world_racing_map_point_data")
local WorldRacingMapPointUtils = {}

WorldRacingMapPointUtils.UV_SCALE = 1000
WorldRacingMapPointUtils.POINT_TYPE = {
	TRACK = 1,
	EVENT = 2
}

function WorldRacingMapPointUtils.getMapIdByTrack(trackId)
	local trackMaps = WorldRacingMapPointData.trackMaps
	local mapId = trackMaps and trackMaps[trackId]

	if not mapId then
		logger:error("getMapIdByTrack: track not configured, table=world_racing_map_point_data, " .. "field=trackMaps, trackId=%s", tostring(trackId))

		return nil
	end

	return mapId
end

function WorldRacingMapPointUtils.getMapConfig(mapId)
	local maps = WorldRacingMapPointData.maps
	local map = maps and mapId and maps[mapId]

	if not map then
		logger:error("getMapConfig: map not configured, table=world_racing_map_point_data, " .. "field=maps, mapId=%s", tostring(mapId))

		return nil
	end

	return map
end

function WorldRacingMapPointUtils.getMapAspect(mapId)
	local map = WorldRacingMapPointUtils.getMapConfig(mapId)

	if not map then
		return nil
	end

	local width, height = map.width, map.height

	if not width or not height or width <= 0 or height <= 0 then
		logger:error("getMapAspect: map size not configured, table=world_racing_map_point_data, " .. "field=maps, mapId=%s, width=%s, height=%s", tostring(mapId), tostring(width), tostring(height))

		return nil
	end

	return width / height
end

function WorldRacingMapPointUtils.getMapBgUrl(mapId)
	local map = WorldRacingMapPointUtils.getMapConfig(mapId)

	if not map then
		return nil
	end

	local url = map.bgUrl

	if not url or url == "" then
		logger:error("getMapBgUrl: bg url not configured, table=world_racing_map_point_data, " .. "field=maps.bgUrl, mapId=%s, value=%s", tostring(mapId), tostring(url))

		return nil
	end

	return url
end

function WorldRacingMapPointUtils.getViewZoom(mapId, isMobile)
	local map = WorldRacingMapPointUtils.getMapConfig(mapId)

	if not map then
		return nil
	end

	local zoomKey = isMobile and "mobile" or "other"
	local zoom = map.zoom
	local value = zoom and zoom[zoomKey]

	if not value or value < 1 then
		logger:error("getViewZoom: zoom not configured, table=world_racing_map_point_data, " .. "field=maps.zoom.%s, mapId=%s, value=%s", zoomKey, tostring(mapId), tostring(value))

		return nil
	end

	return value
end

function WorldRacingMapPointUtils.getPoint(trackId, pointType)
	local trackPoints = WorldRacingMapPointData.points and WorldRacingMapPointData.points[trackId]

	if not trackPoints then
		logger:error("getPoint: track not configured, table=world_racing_map_point_data, " .. "field=points, trackId=%s", tostring(trackId))

		return nil
	end

	local point = trackPoints[pointType]

	if not point then
		logger:error("getPoint: point not configured, table=world_racing_map_point_data, " .. "field=points, trackId=%s, pointType=%s", tostring(trackId), tostring(pointType))

		return nil
	end

	return point
end

function WorldRacingMapPointUtils.getPointUV(trackId, pointType)
	local point = WorldRacingMapPointUtils.getPoint(trackId, pointType)

	if not point then
		return nil, nil
	end

	local scale = WorldRacingMapPointUtils.UV_SCALE
	local rawU, rawV = point.u, point.v

	if not rawU or not rawV or rawU < 0 or scale < rawU or rawV < 0 or scale < rawV then
		logger:error("getPointUV: uv out of range, table=world_racing_map_point_data, trackId=%s, " .. "pointType=%s, u=%s, v=%s, range=[0, %d]", tostring(trackId), tostring(pointType), tostring(rawU), tostring(rawV), scale)

		return nil, nil
	end

	return rawU / scale, rawV / scale
end

function WorldRacingMapPointUtils.getMarkPrefab(trackId, pointType)
	local point = WorldRacingMapPointUtils.getPoint(trackId, pointType)

	if not point then
		return nil
	end

	local markPrefab = point.markPrefab

	if not markPrefab or markPrefab == "" then
		logger:error("getMarkPrefab: mark prefab not configured, table=world_racing_map_point_data, " .. "field=points.markPrefab, trackId=%s, pointType=%s", tostring(trackId), tostring(pointType))

		return nil
	end

	return markPrefab
end

function WorldRacingMapPointUtils.getMarkScale(trackId, pointType)
	local point = WorldRacingMapPointUtils.getPoint(trackId, pointType)

	if not point then
		return nil
	end

	local markScale = point.markScale

	if not markScale or markScale <= 0 then
		logger:error("getMarkScale: mark scale not configured, table=world_racing_map_point_data, " .. "field=points.markScale, trackId=%s, pointType=%s, value=%s", tostring(trackId), tostring(pointType), tostring(markScale))

		return nil
	end

	return markScale
end

return WorldRacingMapPointUtils
