-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\WorldRaceShowcaseUtils.lua

local logger = require("Core.Log.LoggerManager").getLogger("WorldRaceShowcaseUtils")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local WorldRaceDungeonUtils = require("Common.Utils.WorldRaceDungeonUtils")
local FixedCameraMode = require("GameApp.Camera.CameraMode.FixedCameraMode")
local CameraConst = require("GameApp.Camera.CameraConst")
local Vector3 = Vector3
local Quaternion = Quaternion
local WorldRaceShowcaseUtils = {}
local NOMINAL_SPEED = 120
local MIN_DURATION = 8
local MAX_DURATION = 14
local CAMERA_HEIGHT_OFFSET = 15
local LOOK_AHEAD_DISTANCE = 40
local LOOK_TARGET_HEIGHT_OFFSET = 2
local SHOWCASE_FOV = 55
local ENTER_BLEND_TIME = 1
local EXIT_BLEND_TIME = 1
local state
local cameraSample = {
	0,
	0,
	0
}
local lookSample = {
	0,
	0,
	0
}

local function onLateUpdate()
	local data = state

	if not data then
		return
	end

	local routeCache = data.routeCache
	local progress = math.min((Time.realSecondCache - data.startTime) / data.duration, 1)
	local eased = progress * progress * (3 - 2 * progress)
	local routeDistance = eased * routeCache.totalLength

	WorldRaceDungeonUtils.getPositionAtRouteDistance(routeCache, routeDistance, cameraSample)

	local lookDistance = routeDistance + LOOK_AHEAD_DISTANCE

	WorldRaceDungeonUtils.getPositionAtRouteDistance(routeCache, lookDistance, lookSample)

	local overshoot = lookDistance - routeCache.totalLength
	local finishForward = routeCache.gates[#routeCache.gates].forward

	if overshoot > 0 and finishForward then
		lookSample[1] = lookSample[1] + finishForward[1] * overshoot
		lookSample[2] = lookSample[2] + finishForward[2] * overshoot
		lookSample[3] = lookSample[3] + finishForward[3] * overshoot
	end

	local cameraPos = Vector3.New(cameraSample[1], cameraSample[2] + CAMERA_HEIGHT_OFFSET, cameraSample[3])
	local lookDir = Vector3.New(lookSample[1] - cameraPos[1], lookSample[2] + LOOK_TARGET_HEIGHT_OFFSET - cameraPos[2], lookSample[3] - cameraPos[3])

	data.camera:setPosition(cameraPos)

	if lookDir[1] * lookDir[1] + lookDir[2] * lookDir[2] + lookDir[3] * lookDir[3] > 1e-06 then
		data.camera:setRotation(Quaternion.LookRotation(lookDir, Vector3.up))
	end

	if progress >= 1 then
		WorldRaceShowcaseUtils.stop()
	end
end

function WorldRaceShowcaseUtils.isPlaying()
	return state ~= nil
end

function WorldRaceShowcaseUtils.start(sceneId, trackId, onFinish)
	WorldRaceShowcaseUtils.stop()

	if not pg.game or not pg.game.camera or not pg.global or not pg.global.ui then
		return false, "camera or ui system unavailable"
	end

	local routeCache, routeError = WorldRaceDungeonUtils.buildRoute(sceneId, trackId)

	if not routeCache then
		return false, routeError
	end

	local camera = FixedCameraMode.new()

	camera:setCameraName("worldRaceShowcase")

	camera.cameraMode.defaultBlendTime = ENTER_BLEND_TIME

	camera:setFov(SHOWCASE_FOV)

	state = {
		routeCache = routeCache,
		camera = camera,
		onFinish = onFinish,
		startTime = Time.realSecondCache,
		duration = math.max(MIN_DURATION, math.min(MAX_DURATION, routeCache.totalLength / NOMINAL_SPEED))
	}

	onLateUpdate()
	pg.game.camera:addCamera(camera, CameraConst.PRIORITY_FIXED)

	state.lateUpdateTimerId = pg.game.camera:addLateUpdateTimer(onLateUpdate)

	pg.global.ui:hideAllUIByCustomKey(UIConst.UI_HIDE_KEY.WORLD_RACE_SHOWCASE, {
		[UIConst.UI_ID_SKIP_PANEL] = true,
		[UIConst.UI_ID_NET_LOADING] = true
	})
	pg.global.ui:open(UIConst.UI_ID_SKIP_PANEL, {
		skipFunc = function()
			WorldRaceShowcaseUtils.stop()
		end
	})

	return true
end

function WorldRaceShowcaseUtils.stop()
	local data = state

	if not data then
		return
	end

	state = nil

	if data.lateUpdateTimerId and pg.game and pg.game.camera then
		pg.game.camera:removeLateUpdateTimer(data.lateUpdateTimerId)
	end

	if pg.global and pg.global.ui then
		if pg.global.ui:checkUIOpen(UIConst.UI_ID_SKIP_PANEL) then
			pg.global.ui:close(UIConst.UI_ID_SKIP_PANEL)
		end

		pg.global.ui:restoreAllUIByCustomKey(UIConst.UI_HIDE_KEY.WORLD_RACE_SHOWCASE)
	end

	if pg.game and pg.game.camera then
		local isOk, err = xpcall(function()
			data.camera:onCanceled()

			data.camera.cameraMode.defaultBlendTime = EXIT_BLEND_TIME

			pg.game.camera:removeCamera(data.camera)
		end, debug.traceback)

		if not isOk then
			logger:error("remove showcase camera failed: %s", tostring(err))
		end
	end

	if data.onFinish then
		local isOk, err = xpcall(data.onFinish, debug.traceback)

		if not isOk then
			logger:error("showcase onFinish callback failed: %s", tostring(err))
		end
	end
end

return WorldRaceShowcaseUtils
