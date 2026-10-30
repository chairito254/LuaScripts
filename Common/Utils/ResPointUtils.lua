-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\ResPointUtils.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local ResPointConst = require("Common.Const.ResPointConst")
local SceneUtils = require("Common.Utils.SceneUtils")
local logger = LoggerManager.getLogger("ResPoint")
local TimerManager = require("Core.Timer.TimerManager")
local ListPool = require("Common.Container.ListPool")
local TablePool = require("Common.Container.TablePool")
local AIUtils = require("Common.Utils.AIUtils")
local ResPointUtils = {}
local EMPTY_TABLE = {}
local fixPointIdGenerator
local max_fix_point_id = 2147483647
local fixPointIdByNormalId = {}
local actorIdByFixPointId = {}
local pointIdByFixPointId = {}

function ResPointUtils.GenerateFixPointId()
	if Utils.checkClient() then
		return
	end

	if not fixPointIdGenerator then
		local IdGenerator = require("GameServer.IdGenerator")

		fixPointIdGenerator = IdGenerator.new(1, max_fix_point_id, IdGenerator.STRATEGY_MIN_FIRST)
	end

	return fixPointIdGenerator:generate()
end

function ResPointUtils.ReleaseFixPointId(fixPointId)
	if Utils.checkClient() then
		return
	end

	if not fixPointIdGenerator then
		return
	end

	fixPointIdGenerator:recycle(fixPointId)
end

function ResPointUtils.RegisterFixPointId(actorId, pointId, fixPointId)
	if not actorId or not pointId or not fixPointId then
		return
	end

	local pointIds = fixPointIdByNormalId[actorId]

	if not pointIds then
		pointIds = TablePool.getTable()
		fixPointIdByNormalId[actorId] = pointIds
	end

	pointIds[pointId] = fixPointId
	actorIdByFixPointId[fixPointId] = actorId
	pointIdByFixPointId[fixPointId] = pointId
end

function ResPointUtils.UnregisterFixPointId(actorId, pointId, fixPointId)
	if not actorId or not pointId or not fixPointId then
		return
	end

	local pointIds = fixPointIdByNormalId[actorId]

	if pointIds and pointIds[pointId] == fixPointId then
		pointIds[pointId] = nil

		if next(pointIds) == nil then
			TablePool.returnTable(pointIds)

			fixPointIdByNormalId[actorId] = nil
		end
	end

	if actorIdByFixPointId[fixPointId] == actorId and pointIdByFixPointId[fixPointId] == pointId then
		actorIdByFixPointId[fixPointId] = nil
		pointIdByFixPointId[fixPointId] = nil
	end
end

function ResPointUtils.ToFixPointId(actorId, pointId)
	local pointIds = fixPointIdByNormalId[actorId or 0]

	return pointIds and pointIds[pointId] or 0
end

function ResPointUtils.FromFixPointId(fixPointId)
	return actorIdByFixPointId[fixPointId] or 0, pointIdByFixPointId[fixPointId] or 0
end

function ResPointUtils.GetTrunkData(sceneId, spaceId)
	return SceneUtils.getSceneData(sceneId, "scene_resource_point_chunk_data", spaceId)
end

function ResPointUtils.GetResPointData(sceneId, spaceId)
	return SceneUtils.getSceneData(sceneId, "scene_resource_point_data", spaceId)
end

function ResPointUtils.GetResPointsInEntity(actorId)
	local ent = pg.getEntityByActorId(actorId)

	return ent and ent.resPoints
end

function ResPointUtils.GetResPointInEntity(actorId, pointId)
	local resPoints = ResPointUtils.GetResPointsInEntity(actorId)

	return resPoints and resPoints[pointId]
end

function ResPointUtils.GetPortsInResPoint(actorId, pointId)
	local resPoint = ResPointUtils.GetResPointInEntity(actorId, pointId)

	return resPoint and resPoint.ports
end

function ResPointUtils.GetPortInResPoint(actorId, pointId, portId)
	local ports = ResPointUtils.GetPortsInResPoint(actorId, pointId)

	return ports and ports[portId]
end

local function _checkPointHasTag(point, pointTag)
	return point:hasPointTag(pointTag)
end

local function _checkPortHasTag(port, portTag)
	return port:hasPortTag(portTag)
end

local function _hasTags(obj, tags, checkFunc)
	if obj == nil then
		return false
	end

	if not tags or #tags == 0 then
		return true
	end

	for _, tag in ipairs(tags) do
		if checkFunc(obj, tag) then
			return true
		end
	end

	return false
end

local function _checkPointValid(resPoint, entPos, range, maxDeltaHeight, pointTags)
	if not resPoint:canBeSearch() then
		return false, ResPointConst.SearchFailReason.CAN_NOT_BE_SEARCH
	end

	local rpPos = resPoint:getWorldPosition()

	if maxDeltaHeight > 0 and maxDeltaHeight < math.abs(rpPos[2] - entPos[2]) then
		return false, ResPointConst.SearchFailReason.HEIGHT_EXCEED
	end

	if range < math.abs(rpPos[1] - entPos[1]) or range < math.abs(rpPos[3] - entPos[3]) then
		return false, ResPointConst.SearchFailReason.RANGE_EXCEED
	end

	if not _hasTags(resPoint, pointTags, _checkPointHasTag) then
		return false, ResPointConst.SearchFailReason.POINT_TAG_NOT_MATCH
	end

	return true
end

local function _checkPortValid(resPointPort, portTags)
	if resPointPort:isFull() then
		return false, ResPointConst.SearchFailReason.PORT_FULL
	end

	if not _hasTags(resPointPort, portTags, _checkPortHasTag) then
		return false, ResPointConst.SearchFailReason.PORT_TAG_NOT_MATCH
	end

	return true
end

function ResPointUtils.GetResPointPortInRange(entityActorId, range, maxDeltaHeight, pointTags, portTags, resultTable)
	local ent = pg.getEntityByActorId(entityActorId)

	if ent == nil or ent.space == nil then
		return false
	end

	local resPoints = ListPool.getList(3)
	local staticRpEnt
	local staticRpActorIds = ListPool.getList(3)
	local count = AIUtils.SearchEntitiesInRangeWithCache(ent, range, Const.SEARCH_USR_TYPE_RESPOINT, staticRpActorIds)

	for i = 1, count do
		staticRpEnt = pg.getEntityByActorId(staticRpActorIds[i])

		if staticRpEnt and staticRpEnt.resPoints then
			for _, resPoint in pairs(staticRpEnt.resPoints) do
				resPoints[#resPoints + 1] = resPoint
			end
		end
	end

	ListPool.returnList(staticRpActorIds, 3)

	local aiMgr = ent.space.aiMgr

	if aiMgr then
		local dynamicRps = aiMgr.resPointModule:getDynamicResPoints()

		for point, _ in pairs(dynamicRps) do
			resPoints[#resPoints + 1] = point
		end
	end

	local selfPos = ent:getPosition()

	for _, resPoint in ipairs(resPoints) do
		local pointValid = _checkPointValid(resPoint, selfPos, range, maxDeltaHeight, pointTags)

		if pointValid then
			local resPointPorts = resPoint.ports or EMPTY_TABLE

			for _, resPointPort in pairs(resPointPorts) do
				local portValid = _checkPortValid(resPointPort, portTags)

				if portValid then
					table.insert(resultTable, resPointPort:getPortIdTable())
				end
			end
		end
	end

	ListPool.returnList(resPoints, 3)

	if #resultTable > 0 then
		ResPointUtils.Log(entityActorId, "ResPointUtils.GetResPointPortInRange, entityActorId: %d, range: %f, maxDeltaHeight: %f, resultNum: %s", entityActorId, range, maxDeltaHeight, #resultTable)
	end

	return resultTable
end

function ResPointUtils.GetNearestInteractPosition(entityActorId, targetActorId, pointId, portId, lockDirDescId)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		local ret, pos, dirDescId = port:getNearestInteractPosition(entityActorId, lockDirDescId)

		if ret then
			return pos, dirDescId
		end
	end
end

function ResPointUtils.GetNearestInteractPositionInDist(entityActorId, targetActorId, pointId, portId, lockDirDescId, interactDist, ignoreSelfBodySize, ignorePointBodySize)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		local ret, pos, dirDescId = port:getNearestInteractPositionInDist(entityActorId, lockDirDescId, interactDist, ignoreSelfBodySize, ignorePointBodySize)

		if ret then
			return pos, dirDescId
		end
	end
end

function ResPointUtils.GetInteractDirectionYaw(entityActorId, targetActorId, pointId, portId)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		return port:getInteractDirectionYaw(entityActorId)
	end
end

function ResPointUtils.PreJoinPort(entityActorId, targetActorId, pointId, portId, lockDirDescId)
	if lockDirDescId == nil then
		local pos, dirDescId = ResPointUtils.GetNearestInteractPosition(entityActorId, targetActorId, pointId, portId, nil)

		if pos and dirDescId then
			lockDirDescId = dirDescId
		else
			ResPointUtils.Log("unknown reason cause pre join failed! maybe group behaviour...")

			return false
		end
	end

	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		return port:preJoin(entityActorId, lockDirDescId)
	end

	return false
end

function ResPointUtils.GetPreJoinPortDirDescId(entityActorId, targetActorId, pointId, portId)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		return port:getPreJoinDirDescId(entityActorId)
	end
end

function ResPointUtils.CheckCanInteract(entityActorId, targetActorId, pointId, portId)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		return port:checkCanInteract(entityActorId)
	end

	return false
end

function ResPointUtils.JoinPort(entityActorId, targetActorId, pointId, portId)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		port:join(entityActorId)
	end
end

function ResPointUtils.ExitPort(entityActorId, targetActorId, pointId, portId, delayTime, exitDistance)
	local port = ResPointUtils.GetPortInResPoint(targetActorId, pointId, portId)

	if port then
		port:exit(entityActorId, delayTime, exitDistance)
	end
end

function ResPointUtils.GetRouteIdFromResPoint(actorId, pointId)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	return point and point:getRouteId() or 0
end

function ResPointUtils.GetRouteIdFromResPointWithIndex(actorId, pointId, index)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	return point and point:getRouteIdWithIndex(index) or 0
end

function ResPointUtils.GetGroupBehaviourFromResPoint(actorId, pointId)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	return point and point.groupBehaviour
end

function ResPointUtils.GetRouteIdFromEntity(actorId)
	local ent = pg.getEntityByActorId(actorId)

	return ent and ent.routeId or 0
end

function ResPointUtils.GetClimbDataIdFromResPoint(actorId, pointId)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	return point and point:getClimbDataId() or 0
end

function ResPointUtils.CanPhoto(fixPointId)
	local actorId, pointId = ResPointUtils.FromFixPointId(fixPointId)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	return point and point:canPhoto()
end

function ResPointUtils.EnterPhotoEcology(fixPointId, puppetActorId)
	local actorId, pointId = ResPointUtils.FromFixPointId(fixPointId)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	if point then
		point:tryEnterPhotoEcology({
			puppetActorId
		})
	end
end

function ResPointUtils.ExitPhotoEcology(fixPointId)
	local actorId, pointId = ResPointUtils.FromFixPointId(fixPointId)
	local point = ResPointUtils.GetResPointInEntity(actorId, pointId)

	if point then
		point:tryExitPhotoEcology()
	end
end

function ResPointUtils.RefreshPhotoMessage()
	if Utils.checkClient() and pg.space and pg.space.aiMgr then
		local points = pg.space.aiMgr.resPointModule.resPoints

		for point, _ in pairs(points) do
			point:refreshPhotoMessage()
		end
	end
end

function ResPointUtils.ActivatePointByScene(staticId, enable)
	if Utils.checkClient() and pg.space and pg.space.aiMgr then
		local rpEnt = pg.space.aiMgr.resPointModule:getResPointEntByStaticId(staticId)

		if rpEnt then
			local resPoints = rpEnt.resPoints or EMPTY_TABLE

			for _, point in pairs(resPoints) do
				point:activeByScene(enable)
			end
		end
	end
end

function ResPointUtils.JoinFormationFollow(entityActorId, targetActorId)
	local point = ResPointUtils.GetResPointInEntity(targetActorId, ResPointConst.FormationPointIndex)

	if point then
		return point:joinFormationFollow(entityActorId)
	end

	return false
end

function ResPointUtils.ExitFormationFollow(entityActorId, targetActorId)
	local point = ResPointUtils.GetResPointInEntity(targetActorId, ResPointConst.FormationPointIndex)

	if point then
		return point:exitFormationFollow(entityActorId)
	end

	return false
end

function ResPointUtils.DebugGetResPointPortInRange(entityActorId, range, maxDeltaHeight, pointTags, portTags)
	local ent = pg.getEntityByActorId(entityActorId)

	if ent == nil or ent.space == nil then
		return
	end

	local result = {}
	local resPoints = ListPool.getList(3)
	local staticRpEnt
	local staticRpActorIds = ListPool.getList(3)
	local count = AIUtils.SearchEntitiesInRangeWithCache(ent, range, Const.SEARCH_USR_TYPE_RESPOINT, staticRpActorIds)

	for i = 1, count do
		staticRpEnt = pg.getEntityByActorId(staticRpActorIds[i])

		if staticRpEnt and staticRpEnt.resPoints then
			for _, resPoint in pairs(staticRpEnt.resPoints) do
				resPoints[#resPoints + 1] = resPoint
			end
		end
	end

	ListPool.returnList(staticRpActorIds, 3)

	local aiMgr = pg.space and pg.space.aiMgr

	if aiMgr then
		local dynamicRps = aiMgr.resPointModule:getDynamicResPoints()

		for point, _ in pairs(dynamicRps) do
			resPoints[#resPoints + 1] = point
		end
	end

	local selfPos = ent:getPosition()

	for _, resPoint in ipairs(resPoints) do
		local actorId = resPoint.owner.actorId
		local pointId = resPoint.pointId
		local pointValid, failReason = _checkPointValid(resPoint, selfPos, range, maxDeltaHeight, pointTags)

		if pointValid then
			local resPointPorts = resPoint.ports or EMPTY_TABLE

			for portId, resPointPort in pairs(resPointPorts) do
				local portValid, failReason2 = _checkPortValid(resPointPort, portTags)

				if portValid then
					table.insert(result, {
						actorId = actorId,
						pointId = pointId,
						portId = portId,
						reason = ResPointConst.SearchFailReason.NONE
					})
				else
					table.insert(result, {
						actorId = actorId,
						pointId = pointId,
						portId = portId,
						reason = failReason2
					})
				end
			end
		else
			table.insert(result, {
				portId = 0,
				actorId = actorId,
				pointId = pointId,
				reason = failReason
			})
		end
	end

	ListPool.returnList(resPoints, 3)

	return result
end

function ResPointUtils.Log(entActorId, ...)
	if not ResPointConst.OpenLog then
		return
	end

	if entActorId ~= nil and ResPointConst.DebugLogEntActorId ~= nil and ResPointConst.DebugLogEntActorId ~= 0 and entActorId ~= ResPointConst.DebugLogEntActorId then
		return
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info(...)
	end
end

function ResPointUtils.LogError(...)
	if LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error(...)
	end

	if LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error(debug.traceback())
	end
end

function ResPointUtils.LogWithPoint(entActorId, point, formatStr, ...)
	if ResPointConst.OpenLog then
		formatStr = string.format("[Point][Temp:%d][%d,%d] %s", point.templateId, point.owner.actorId, point.pointId, formatStr)

		ResPointUtils.Log(entActorId, formatStr, ...)
	end
end

function ResPointUtils.LogWithPort(entActorId, port, formatStr, ...)
	if ResPointConst.OpenLog then
		formatStr = string.format("[Port][Temp:%d][%d,%d,%d] %s", port.owner.templateId, port.owner.owner.actorId, port.owner.pointId, port.portId, formatStr)

		ResPointUtils.Log(entActorId, formatStr, ...)
	end
end

function ResPointUtils.LogWithDirDesc(entActorId, dirDesc, formatStr, ...)
	if ResPointConst.OpenLog then
		formatStr = string.format("[DirDecs][Temp:%d][%d,%d,%d,%d] %s", dirDesc.owner.owner.templateId, dirDesc.owner.owner.owner.actorId, dirDesc.owner.owner.pointId, dirDesc.owner.portId, dirDesc.dirId, formatStr)

		ResPointUtils.Log(entActorId, formatStr, ...)
	end
end

return ResPointUtils
