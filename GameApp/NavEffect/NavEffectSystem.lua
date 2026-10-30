-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\NavEffect\\NavEffectSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local AddressDataConst = require("Const.AddressDataConst")
local ClientConst = require("Const.ClientConst")
local NavMeshServiceUtils = require("Common.Utils.NavMeshServiceUtils")
local AiConst = require("Common.Const.AiConst")
local MessageName = require("Const.MessageName")
local CallbackHandlerNoGC = require("Core.Common.CallbackHandlerNoGC")
local Time = require("Core.Common.Time")
local NavEffectConst = require("GameApp.NavEffect.NavEffectConst")
local Const = require("Common.Const.Const")
local GameObject = CS.UnityEngine.GameObject
local Object = CS.UnityEngine.Object
local UIUtils = CS.FunPlus.WorldX.Utils.UIUtils
local NavEffectSystem = Class.LightClass("NavEffectSystem", SystemBase)

function NavEffectSystem:onCtor()
	SystemBase.onCtor(self)
	self:init()
end

function NavEffectSystem:getMessageBindMap()
	return {
		[MessageName.ON_HIDE_ALL_UI] = "onAllUIStateChanged",
		[MessageName.ON_RESTORE_ALL_UI] = "onAllUIStateChanged"
	}
end

function NavEffectSystem:onSceneUnloaded(sceneId, sceneName)
	self:unPathForce()
	self:clearGuidingLineRender()
end

function NavEffectSystem:onSceneLoaded(sceneId, sceneName)
	self:unPathForce()
	self:clearGuidingLineRender()
end

function NavEffectSystem:onSceneReset(sceneId, sceneName)
	self:onSceneLoaded(sceneId, sceneName)
end

function NavEffectSystem:clearGuidingLineRender()
	if NotNil(self.guidingLineGameObject) then
		local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

		guidingLine:SetPoints({})
	end

	facade:SendMessageCommand(MessageName.DRAW_NAV_EFF_LINE, {})
end

function NavEffectSystem:init()
	self.pathPointsGameObject = GameObject("NavPath")

	Object.DontDestroyOnLoad(self.pathPointsGameObject)

	self.guidingLineGameObject = nil
	self.guidingLineData = nil
	self.temp1Vector3 = Vector3.zero
	self.temp2Vector3 = Vector3.zero
	self.temp3Vector3 = Vector3(0, 0, 0)
	self.temp4Vector3 = Vector3(0, 0, 0)
	self.lastPlayerPosition = Vector3(-9999, -9999, -9999)
	self.pathSessionVersion = 0
	self.recordPath = nil
end

function NavEffectSystem:copyPosition(position, result)
	if not position then
		return nil
	end

	if result then
		result:Copy(position)

		return result
	end

	return Vector3(position[1], position[2], position[3])
end

function NavEffectSystem:createEndPosList(position)
	return {
		{
			position[1],
			position[2],
			position[3]
		}
	}
end

function NavEffectSystem:resolveTargetPosition(data, allowFallback)
	if data.trackType ~= Const.MAP_MARK_TRACK_TYPE.DYNAMIC or data.isolatedIslandLinkPos then
		return data.fallbackEndPos
	end

	local position

	if pg.game and pg.game.map then
		position = pg.game.map:getEffectiveMarkPos(data.id)
	end

	if position or not allowFallback then
		return position
	end

	return data.fallbackEndPos
end

function NavEffectSystem:trackPath(request)
	if not request then
		return
	end

	self:unPathForce()

	if request.hidePath then
		return
	end

	local fallbackEndPos = request.fallbackEndPos or request.endPos
	local trackId = request.trackId or request.id

	if not fallbackEndPos or trackId == nil then
		return
	end

	local data = {
		requestVersion = 0,
		nextTargetSampleTime = 0,
		repathDirty = false,
		pendingPathRequest = false,
		id = trackId,
		sceneId = request.sceneId or pg.space.sceneId,
		fallbackEndPos = self:copyPosition(fallbackEndPos),
		trackType = request.trackType or Const.MAP_MARK_TRACK_TYPE.STATIC,
		successCallback = request.successCallback,
		overrideStartPosInfo = request.overrideStartPosInfo,
		duplicateCall = request.duplicateCall,
		isolatedIslandLinkPos = request.isolatedIslandLinkPos,
		sessionVersion = self.pathSessionVersion,
		lastRequestTime = -NavEffectConst.DYNAMIC_REPATH_MIN_INTERVAL
	}
	local initialEndPos = self:resolveTargetPosition(data, true)

	data.endPos = self:copyPosition(initialEndPos)
	data.latestTargetPos = self:copyPosition(initialEndPos)
	self.guidingLineData = data

	self.lastPlayerPosition:Copy(pg.me:getPosition())
	self:requestCurrentPath(false, true)
end

function NavEffectSystem:path(sceneId, endPos, id, successCallback, hidePath, overrideStartPosInfo, duplicateCall, isolatedIslandLinkPos)
	self:trackPath({
		sceneId = sceneId,
		trackId = id,
		fallbackEndPos = endPos,
		successCallback = successCallback,
		hidePath = hidePath,
		overrideStartPosInfo = overrideStartPosInfo,
		duplicateCall = duplicateCall,
		isolatedIslandLinkPos = isolatedIslandLinkPos
	})
end

function NavEffectSystem:requestCurrentPath(isInner, force)
	local data = self.guidingLineData

	if not data or not pg.me then
		return
	end

	if data.pendingPathRequest then
		data.repathDirty = true

		return
	end

	local now = Time.realSecondCache

	if not force and now - data.lastRequestTime < NavEffectConst.DYNAMIC_REPATH_MIN_INTERVAL then
		data.repathDirty = true

		return
	end

	local latestTargetPos = self:resolveTargetPosition(data, true)

	if not latestTargetPos then
		return
	end

	data.latestTargetPos = self:copyPosition(latestTargetPos, data.latestTargetPos)
	data.endPos = self:copyPosition(latestTargetPos, data.endPos)

	local requestEndPos = self:copyPosition(data.latestTargetPos)
	local processedEndPos = self:createEndPosList(requestEndPos)

	if data.isolatedIslandLinkPos then
		requestEndPos = self:copyPosition(data.fallbackEndPos)
		processedEndPos = self:createEndPosList(data.isolatedIslandLinkPos)
	end

	local newSceneId = pg.game.map:convertSceneId(data.sceneId)

	if pg.space.sceneId == ClientConst.SCENE_ROOKIE then
		newSceneId = ClientConst.SCENE_ROOKIE
	end

	local startPos = pg.me:getPosition()

	if not isInner and data.overrideStartPosInfo then
		startPos = data.overrideStartPosInfo.startPos
	end

	self.temp4Vector3:Copy(startPos)
	self.lastPlayerPosition:Copy(pg.me:getPosition())

	data.sceneId = newSceneId
	data.requestVersion = data.requestVersion + 1
	data.pendingPathRequest = true
	data.pendingRequestVersion = data.requestVersion
	data.lastRequestTime = now
	data.repathDirty = false

	NavMeshServiceUtils.findPath(newSceneId, self.temp4Vector3, processedEndPos, CallbackHandlerNoGC.newOnce(self, "onPathRequestComplete", data.sessionVersion, data.requestVersion, isInner, requestEndPos, processedEndPos))
end

function NavEffectSystem:onPathRequestComplete(sessionVersion, requestVersion, isInner, requestEndPos, processedEndPos, aiConstReqState, path)
	local data = self.guidingLineData

	if not data or data.sessionVersion ~= sessionVersion or data.id == nil then
		return
	end

	if data.pendingRequestVersion ~= requestVersion then
		return
	end

	data.pendingPathRequest = false
	data.pendingRequestVersion = nil

	if aiConstReqState ~= AiConst.AUTO_PATH_REQ_STATE.Success and aiConstReqState ~= AiConst.AUTO_PATH_REQ_STATE.PartialSuccess or not path then
		if isInner then
			print("Inner Nav failed")

			return
		end

		print("Nav failed")

		data.firstPoint = self:copyPosition(pg.me:getPosition(), data.firstPoint)
		data.endPos = self:copyPosition(requestEndPos, data.endPos)
		data.processedEndPos = processedEndPos

		pg.global.showBubbleMessageById(2128)
		facade:SendMessageCommand(MessageName.DRAW_NAV_EFF_LINE, {})

		return
	end

	if isInner then
		-- block empty
	end

	local overrideStartPosInfo = data.overrideStartPosInfo

	if isInner then
		-- block empty
	end

	local duplicateCall = data.duplicateCall

	self.recordPath = {
		sceneId = data.sceneId,
		path = path,
		overrideStartPosInfo = overrideStartPosInfo,
		isInner = isInner or nil,
		duplicateCall = duplicateCall,
		trackId = data.id
	}

	facade:SendMessageCommand(MessageName.DRAW_NAV_EFF_LINE, self.recordPath)
	self:pathProcess(data.sceneId, data.id, requestEndPos, processedEndPos, path, data.successCallback, isInner, data.isolatedIslandLinkPos)
end

function NavEffectSystem:internalPath(sceneId, endPos, processedEndPos, id, successCallback, alreadyPath, overrideStartPosInfo, duplicateCall, isolatedIslandLinkPos)
	if alreadyPath then
		self:pathProcess(sceneId, id, endPos, processedEndPos, alreadyPath, successCallback, true, isolatedIslandLinkPos)

		self.recordPath = {
			isInner = true,
			sceneId = sceneId,
			path = alreadyPath,
			overrideStartPosInfo = overrideStartPosInfo,
			duplicateCall = duplicateCall
		}

		facade:SendMessageCommand(MessageName.DRAW_NAV_EFF_LINE, self.recordPath)

		return
	end

	self:trackPath({
		sceneId = sceneId,
		trackId = id,
		fallbackEndPos = endPos,
		successCallback = successCallback,
		overrideStartPosInfo = overrideStartPosInfo,
		duplicateCall = duplicateCall,
		isolatedIslandLinkPos = isolatedIslandLinkPos
	})
end

function NavEffectSystem:onTick()
	local data = self.guidingLineData

	if not pg.me or not data or IsNil(self.pathPointsGameObject) then
		return
	end

	self:sampleDynamicTarget()

	local playerPosition = pg.me:getPosition()

	self:updateGuidingLineProgress(playerPosition)

	if data.firstPoint then
		local playerMoved = Vector3.HasChanged(playerPosition, self.lastPlayerPosition, NavEffectConst.PLAYER_POSITION_CHANGE_EPSILON)
		local repathDistance = NavEffectConst.PLAYER_REPATH_DISTANCE

		if playerMoved and Vector3.SqrDistance(data.firstPoint, playerPosition) > repathDistance * repathDistance then
			data.repathDirty = true
		end
	end

	if data.repathDirty then
		self:requestCurrentPath(true, false)
	end
end

function NavEffectSystem:updateGuidingLineProgress(playerPosition)
	local data = self.guidingLineData
	local points = data and data.guidingLinePoints

	if not points or #points <= 1 or IsNil(self.guidingLineGameObject) then
		return
	end

	local passedPointCount = data.passedPointCount or 0
	local startIndex = passedPointCount + 1

	if startIndex > #points then
		return
	end

	local closestIndex = startIndex
	local closestDistance = Vector3.SqrDistance(points[startIndex], playerPosition)
	local endIndex = math.min(#points, startIndex + NavEffectConst.GUIDING_LINE_PROGRESS_LOOKAHEAD_POINTS - 1)

	for i = startIndex + 1, endIndex do
		local distance = Vector3.SqrDistance(points[i], playerPosition)

		if distance < closestDistance then
			closestIndex = i
			closestDistance = distance
		end
	end

	local newPassedPointCount = closestIndex - 1

	if newPassedPointCount <= passedPointCount then
		return
	end

	data.passedPointCount = newPassedPointCount

	local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

	guidingLine:PassPoints(newPassedPointCount)
end

function NavEffectSystem:sampleDynamicTarget()
	local data = self.guidingLineData

	if not data or data.trackType ~= Const.MAP_MARK_TRACK_TYPE.DYNAMIC or data.isolatedIslandLinkPos then
		return
	end

	local now = Time.realSecondCache

	if now < data.nextTargetSampleTime then
		return
	end

	data.nextTargetSampleTime = now + NavEffectConst.DYNAMIC_TARGET_SAMPLE_INTERVAL

	local targetPos = self:resolveTargetPosition(data, false)

	if not targetPos then
		return
	end

	local epsilon = NavEffectConst.DYNAMIC_TARGET_POSITION_EPSILON

	if data.latestTargetPos and Vector3.SqrDistance(data.latestTargetPos, targetPos) <= epsilon * epsilon then
		return
	end

	data.latestTargetPos = self:copyPosition(targetPos, data.latestTargetPos)
	data.endPos = self:copyPosition(targetPos, data.endPos)

	self:updateGuidingLineEndPoint(data.latestTargetPos)

	if not data.plannedEndPos then
		data.repathDirty = true

		return
	end

	local repathDistance = self:getDynamicRepathDistance(data.latestTargetPos)

	if Vector3.SqrDistance(data.plannedEndPos, data.latestTargetPos) >= repathDistance * repathDistance then
		data.repathDirty = true
	end
end

function NavEffectSystem:getDynamicRepathDistance(targetPos)
	local nearDistance = NavEffectConst.DYNAMIC_NEAR_TARGET_DISTANCE

	if Vector3.SqrDistance(pg.me:getPosition(), targetPos) <= nearDistance * nearDistance then
		return NavEffectConst.DYNAMIC_NEAR_REPATH_DISTANCE
	end

	return NavEffectConst.DYNAMIC_FAR_REPATH_DISTANCE
end

function NavEffectSystem:updateGuidingLineEndPoint(targetPos)
	local data = self.guidingLineData

	if not data or not data.canUpdateLastPoint or IsNil(self.guidingLineGameObject) then
		return
	end

	local points = data.guidingLinePoints

	if points and #points > 0 then
		points[#points]:Copy(targetPos)
	end

	local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

	guidingLine:UpdateLastPoint(targetPos)
end

function NavEffectSystem:pathProcess(sceneId, id, endPos, processedEndPos, path, successCallback, isInner, isolatedIslandLinkPos)
	local data = self.guidingLineData

	if not data or data.id ~= id then
		return
	end

	if not self.guidingLineGameObject then
		self.guidingLineGameObject = pg.global.uiMgr:SyncInstantiateItem(AddressDataConst.Guiding_Line, self.pathPointsGameObject.transform)
	end

	self.guidingLineGameObject.name = "GuidingLine" .. id

	local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

	guidingLine:Init()

	data.firstPoint = self:copyPosition(path[1], data.firstPoint)
	data.sceneId = sceneId
	data.plannedEndPos = self:copyPosition(endPos, data.plannedEndPos)
	data.processedEndPos = processedEndPos
	data.isolatedIslandLinkPos = isolatedIslandLinkPos
	path[#path] = endPos

	local lerpPath = self:lerpPathPoints(path)
	local points = {}
	local maxPointsCount = guidingLine:GetMaxPointsCount()
	local length = math.min(#lerpPath, maxPointsCount)

	for i = 1, length do
		points[i] = Vector3(lerpPath[i][1], lerpPath[i][2], lerpPath[i][3])
	end

	data.guidingLinePoints = points
	data.passedPointCount = 0
	data.canUpdateLastPoint = maxPointsCount >= #lerpPath

	guidingLine:SetPoints(points, CallbackHandlerNoGC.newOnceCSharpCb(self, "onGuidingLineSetPointsComplete", data.sessionVersion, isInner, successCallback))

	self.pathPointsGameObject.transform.position = pg.me:getPosition()
end

function NavEffectSystem:onGuidingLineSetPointsComplete(sessionVersion, isInner, successCallback)
	local data = self.guidingLineData

	if not data or data.sessionVersion ~= sessionVersion or IsNil(self.guidingLineGameObject) then
		return
	end

	local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

	guidingLine:PassPoints(data.passedPointCount or 0)

	if data.trackType == Const.MAP_MARK_TRACK_TYPE.DYNAMIC and data.latestTargetPos then
		self:updateGuidingLineEndPoint(data.latestTargetPos)
	end

	if not isInner then
		guidingLine:PlayGuidingLine(10)
	end

	if self.navPathDisplayFlag == nil then
		guidingLine:SetVisible(1)
	else
		guidingLine:SetVisible(self.navPathDisplayFlag and 1 or 0)
	end

	if successCallback then
		successCallback()
	end
end

function NavEffectSystem:innerUnPath(id, successCallback)
	if self.guidingLineData and self.guidingLineData.id ~= id then
		return
	end

	if successCallback then
		successCallback()
	end

	self.recordPath = nil
end

function NavEffectSystem:unPath(id, successCallback)
	if self.guidingLineData and self.guidingLineData.id ~= id then
		return
	end

	self:unPathForce()

	if NotNil(self.guidingLineGameObject) then
		local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

		guidingLine:SetPoints({})
	end

	if successCallback then
		successCallback()
	end

	self.recordPath = nil

	facade:SendMessageCommand(MessageName.DRAW_NAV_EFF_LINE, {})
end

function NavEffectSystem:unPathForce()
	self.pathSessionVersion = (self.pathSessionVersion or 0) + 1
	self.guidingLineData = nil
	self.recordPath = nil

	if pg.game and pg.game.map then
		pg.game.map:setTrackPathStart("nav", nil)
		pg.game.map:clearTrackSelectStart()
	end

	self.lastPlayerPosition:Set(-9999, -9999, -9999)
end

function NavEffectSystem:cutRoutePointsByClosetPointFromPlayer(routePoint, playerPos)
	local closetDistance = math.maxInt
	local closetPointKey

	for k, v in pairs(routePoint) do
		local dis = Vector3.Distance(v, playerPos)

		if dis < closetDistance then
			closetDistance = dis
			closetPointKey = k
		end
	end

	if not closetPointKey then
		return nil
	end

	local result = {}

	for i = closetPointKey, #routePoint do
		result[#result + 1] = routePoint[i]
	end

	return result
end

function NavEffectSystem:distance(point1, point2)
	local dx = point2[1] - point1[1]
	local dy = point2[2] - point1[2]
	local dz = point2[3] - point1[3]

	return math.sqrt(dx * dx + dy * dy + dz * dz)
end

function NavEffectSystem:lerpPathPoints(path)
	local newPoints = {}

	for i = 1, #path - 1 do
		local startPoint = path[i]
		local endPoint = path[i + 1]

		table.insert(newPoints, startPoint)

		local dist = self:distance(startPoint, endPoint)
		local numSegments = math.floor(dist / NavEffectConst.PATH_POINT_MIN_GAP)

		for j = 1, numSegments do
			local t = j * NavEffectConst.PATH_POINT_MIN_GAP / dist
			local addX = startPoint[1] + t * (endPoint[1] - startPoint[1])
			local addY = startPoint[2] + t * (endPoint[2] - startPoint[2])
			local addZ = startPoint[3] + t * (endPoint[3] - startPoint[3])
			local _, calX, calY, calZ = UIUtils.GetStickGroundPos(addX, addY, addZ, NavEffectConst.PLAYER_HEIGHT_OFFSET)

			table.insert(newPoints, {
				calX,
				calY,
				calZ
			})
		end
	end

	local finalPoint = path[#path]
	local _, calX, calY, calZ = UIUtils.GetStickGroundPos(finalPoint[1], finalPoint[2], finalPoint[3], NavEffectConst.PLAYER_HEIGHT_OFFSET)

	table.insert(newPoints, {
		calX,
		calY,
		calZ
	})

	return newPoints
end

function NavEffectSystem:onAllUIStateChanged(info)
	local hide = next(pg.global.ui.uiHideConfig) ~= nil

	self.navPathDisplayFlag = not hide

	if IsNil(self.guidingLineGameObject) then
		return
	end

	local guidingLine = self.guidingLineGameObject:GetComponent("GenerateGuidingLinePoints")

	guidingLine:SetVisible(self.navPathDisplayFlag and 1 or 0)
end

function NavEffectSystem:onDestroy()
	SystemBase.onDestroy(self)
	self:unPathForce()

	if NotNil(self.guidingLineGameObject) then
		pg.global.uiMgr:DestroyItem(self.guidingLineGameObject)
	end

	self.guidingLineGameObject = nil

	if self.pathPointsGameObject then
		GameObject.Destroy(self.pathPointsGameObject)
	end

	self.pathPointsGameObject = nil
end

return NavEffectSystem
