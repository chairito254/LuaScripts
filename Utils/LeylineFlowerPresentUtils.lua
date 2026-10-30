-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\LeylineFlowerPresentUtils.lua

local LeylineFlowerConst = require("Const.LeylineFlowerConst")
local LeylineFlowerUtils = require("Common.Utils.LeylineFlowerUtils")
local SysConfigData = require("Data.sys_config_data")
local LoggerManager = require("Core.Log.LoggerManager")
local UIConst = require("Const.UIConst")
local TimerManager = require("Core.Timer.TimerManager")
local AddressDataConst = require("Const.AddressDataConst")
local EventConst = require("Const.EventConst")
local Time = require("Core.Common.Time")
local logger = LoggerManager.getLogger("LeylineFlowerPresentUtils")
local LeylineFlowerPresentUtils = {}
local FLOW_WATCHDOG_EXTRA = 5
local RAINBOW_PET_SCREEN_EFFECT_FALLBACK_DURATION = 3
local HIDE_RAINBOW_PET_SCREEN_EFFECT = true

LeylineFlowerPresentUtils.PRESENT_TYPE = {
	GuestRainbowPetSpawn = 3,
	RainbowEnergyChanged = 2,
	RainbowPetSpawn = 1
}

local PRESENT_POLICY = {
	[LeylineFlowerPresentUtils.PRESENT_TYPE.GuestRainbowPetSpawn] = {
		states = {
			LeylineFlowerConst.CULTIVATE_TIP_STATE.RainbowEnergy
		}
	},
	[LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowPetSpawn] = {
		openMap = true,
		states = {
			LeylineFlowerConst.CULTIVATE_TIP_STATE.RainbowEnergy
		}
	},
	[LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowEnergyChanged] = {
		states = {
			LeylineFlowerConst.CULTIVATE_TIP_STATE.RainbowEnergy
		}
	}
}
local flowVersion = 0
local sceneVersion = 0

function LeylineFlowerPresentUtils.createSceneValidator(space)
	local version = sceneVersion

	return function()
		return space ~= nil and pg.space == space and version == sceneVersion
	end
end

local activePetFlow, flowWatchdogTimerId
local presentationQueue = {}
local activePresentation, queueTimerId
local PRESENTATION_RETRY_INTERVAL = 0.1
local POINT_SYNC_TIMEOUT = 8

function LeylineFlowerPresentUtils.stopQueueTimer()
	if queueTimerId then
		TimerManager.removeTimer(queueTimerId)

		queueTimerId = nil
	end
end

function LeylineFlowerPresentUtils.scheduleNext(delay)
	LeylineFlowerPresentUtils.stopQueueTimer()

	queueTimerId = TimerManager.addTimer(delay or 0, function()
		queueTimerId = nil

		LeylineFlowerPresentUtils.tryPresentNext()
	end)
end

function LeylineFlowerPresentUtils.finishPresentation(task)
	if activePresentation ~= task then
		return
	end

	activePresentation = nil

	LeylineFlowerPresentUtils.scheduleNext()
end

function LeylineFlowerPresentUtils.discardPresentation(task, skipEffects)
	if task.presentType == LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowPetSpawn then
		task.space:removePendingRainbowPetPresentation(task.data.staticId, task.data)

		if not skipEffects then
			task.space:releaseDeferredRainbowPetEffects(task.data.staticId)
		end
	end
end

function LeylineFlowerPresentUtils.getTipsCtrl()
	return pg.global and pg.global.ui and pg.global.ui.tips
end

function LeylineFlowerPresentUtils.showCultivateTips(states, data)
	local tipsCtrl = LeylineFlowerPresentUtils.getTipsCtrl()

	if not tipsCtrl or not tipsCtrl.showCultivateTips then
		logger:error("@leylineflower show cultivate HUD skipped: tips ctrl unavailable")

		return false
	end

	local pushed = false
	local success, errorMessage = xpcall(function()
		pushed = tipsCtrl:showCultivateTips(states, data) == true
	end, debug.traceback)

	if not success then
		logger:error("@leylineflower show cultivate HUD failed: %s", tostring(errorMessage))

		return false
	end

	if not pushed then
		logger:error("@leylineflower show cultivate HUD dropped by tips ctrl, blockId: %s", tostring(data and data.blockId))
	end

	return pushed
end

function LeylineFlowerPresentUtils.getCurrentSpace(flow)
	local space = pg.space

	if not pg.me or not space then
		return nil
	end

	if space.id ~= flow.spaceId or space.sceneId ~= flow.sceneId then
		return nil
	end

	if space.ownerPlayerId ~= pg.me.id then
		return nil
	end

	local pointCountMap = space.rainbowPetPosFlags and space.rainbowPetPosFlags[flow.staticId]

	if not pointCountMap or (pointCountMap[flow.pointId] or 0) <= 0 then
		return nil
	end

	return space
end

function LeylineFlowerPresentUtils.isPetFlowValid(flow)
	return flow and activePetFlow == flow and not flow.cancelled and flow.flowId == flowVersion and LeylineFlowerPresentUtils.getCurrentSpace(flow) ~= nil
end

function LeylineFlowerPresentUtils.playRainbowPetScreenEffect(duration)
	if HIDE_RAINBOW_PET_SCREEN_EFFECT then
		return
	end

	if not pg.pawn or not pg.pawn.playScreenEffect then
		return
	end

	duration = tonumber(duration) or 0

	if duration <= 0 then
		duration = RAINBOW_PET_SCREEN_EFFECT_FALLBACK_DURATION
	end

	pg.pawn:playScreenEffect(AddressDataConst.LEYLINEFLOWER_RAINBOW_PET_SCREEN_EFFECT_RES, duration)
end

function LeylineFlowerPresentUtils.emitRainbowPetSpawnPresented(staticId, pointId, presentation)
	local eventEmitter = pg.global and pg.global.eventEmitter

	if not eventEmitter then
		return
	end

	eventEmitter:emit(EventConst.ON_LEYLINE_RAINBOW_PET_SPAWN_PRESENTED, {
		staticId = staticId,
		pointId = pointId,
		presentation = presentation
	})
end

function LeylineFlowerPresentUtils.notifyPetFlowSpawnPresented(flow)
	if not flow or flow.spawnPresentedNotified then
		return
	end

	flow.spawnPresentedNotified = true

	local space = pg.space

	if space and space.id == flow.spaceId and space.sceneId == flow.sceneId then
		LeylineFlowerPresentUtils.emitRainbowPetSpawnPresented(flow.staticId, flow.pointId, flow)
	end
end

function LeylineFlowerPresentUtils.notifyRainbowPetSpawnPresented(staticId, pointId)
	LeylineFlowerPresentUtils.emitRainbowPetSpawnPresented(staticId, pointId)
end

function LeylineFlowerPresentUtils.getCameraConfig()
	return {
		focusDelay = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_FOCUS_DELAY or 1,
		rotateTime = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_ROTATE_TIME or 1,
		heightOffset = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_HEIGHT or 12,
		focusDuration = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_FOCUS_DURATION or 2,
		backBlendTime = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_BACK_TIME or 0.8,
		startFOV = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_START_FOV or 40,
		endFOV = SysConfigData.LEYLINE_FLOWER_RAINBOW_CAMERA_END_FOV or 70
	}
end

function LeylineFlowerPresentUtils.stopFlowWatchdog()
	if flowWatchdogTimerId then
		TimerManager.removeTimer(flowWatchdogTimerId)

		flowWatchdogTimerId = nil
	end
end

function LeylineFlowerPresentUtils.resetPetFlow(skipSpawnNotify)
	local flow = activePetFlow

	activePetFlow = nil

	LeylineFlowerPresentUtils.stopFlowWatchdog()

	if skipSpawnNotify then
		return
	end

	LeylineFlowerPresentUtils.notifyPetFlowSpawnPresented(flow)
end

function LeylineFlowerPresentUtils.finishPetFlow(flow)
	if activePetFlow ~= flow then
		return
	end

	LeylineFlowerPresentUtils.resetPetFlow()

	if flow.onPresentationFinished then
		flow.onPresentationFinished()
	end
end

function LeylineFlowerPresentUtils.getFlowWatchdogTimeout()
	local cameraConfig = LeylineFlowerPresentUtils.getCameraConfig()
	local hudMaxDuration = tonumber(SysConfigData.LEYLINE_FLOWER_RAINBOW_HUD_MAX_DURATION) or 30

	return hudMaxDuration + cameraConfig.focusDelay + cameraConfig.rotateTime + cameraConfig.focusDuration + cameraConfig.backBlendTime + FLOW_WATCHDOG_EXTRA
end

function LeylineFlowerPresentUtils.startFlowWatchdog(flow)
	LeylineFlowerPresentUtils.stopFlowWatchdog()

	flowWatchdogTimerId = TimerManager.addTimer(LeylineFlowerPresentUtils.getFlowWatchdogTimeout(), function()
		flowWatchdogTimerId = nil

		if activePetFlow ~= flow then
			return
		end

		logger:error("@leylineflower rainbow pet flow timeout, staticId: %s pointId: %s", tostring(flow.staticId), tostring(flow.pointId))
		LeylineFlowerPresentUtils.finishPetFlow(flow)
		LeylineFlowerUtils.cancelCameraFocus(flow.staticId, flow.pointId)
	end)
end

function LeylineFlowerPresentUtils.openRainbowPetMap(flow)
	if activePetFlow ~= flow then
		return
	end

	if not LeylineFlowerPresentUtils.isPetFlowValid(flow) then
		LeylineFlowerPresentUtils.finishPetFlow(flow)

		return
	end

	local globalUI = pg.global and pg.global.ui
	local map = pg.game and pg.game.map

	if not globalUI or not map then
		LeylineFlowerPresentUtils.finishPetFlow(flow)

		return
	end

	local success, errorMessage = xpcall(function()
		local markInfo = map:getMarkInfo(flow.pointId)

		if not markInfo then
			logger:error("@leylineflower rainbow pet mark missing, pointId: %s", tostring(flow.pointId))
			LeylineFlowerPresentUtils.finishPetFlow(flow)

			return
		end

		LeylineFlowerPresentUtils.startFlowWatchdog(flow)
		map:openMapAndLocateMark(flow.sceneId, markInfo.markType, flow.pointId, true, 1, function()
			if activePetFlow ~= flow then
				return
			end

			local callbackSuccess, callbackError = xpcall(function()
				if not LeylineFlowerPresentUtils.isPetFlowValid(flow) then
					return
				end

				local tipsCtrl = LeylineFlowerPresentUtils.getTipsCtrl()

				if tipsCtrl then
					tipsCtrl:showRainbowPetAppear(flow.petTemplateId, flow.duration)
				end
			end, debug.traceback)

			if not callbackSuccess then
				logger:error("@leylineflower show map tip failed: %s", tostring(callbackError))
			end

			LeylineFlowerPresentUtils.finishPetFlow(flow)
		end, true)
	end, debug.traceback)

	if not success then
		logger:error("@leylineflower open rainbow pet map failed: %s", tostring(errorMessage))
		LeylineFlowerPresentUtils.finishPetFlow(flow)
	end
end

function LeylineFlowerPresentUtils.startRainbowPetCamera(data, policy)
	local cameraStarted = LeylineFlowerUtils.focusCameraToPosition(data.staticId, data.targetPosition, LeylineFlowerPresentUtils.getCameraConfig(), {
		pointId = data.pointId,
		canStart = function()
			return LeylineFlowerPresentUtils.isPetFlowValid(data)
		end,
		onBackBlendFinished = function()
			if activePetFlow ~= data then
				return
			end

			LeylineFlowerPresentUtils.stopFlowWatchdog()

			if policy.openMap then
				LeylineFlowerPresentUtils.openRainbowPetMap(data)
			else
				LeylineFlowerPresentUtils.finishPetFlow(data)
			end
		end,
		onCancelled = function()
			LeylineFlowerPresentUtils.finishPetFlow(data)
		end
	})

	if not cameraStarted then
		LeylineFlowerPresentUtils.finishPetFlow(data)
	end

	return cameraStarted
end

function LeylineFlowerPresentUtils.presentRainbowPetSpawn(data, policy)
	if not data or not data.staticId or not data.pointId or not data.targetPosition then
		return false
	end

	if not data.petTemplateId or data.petTemplateId <= 0 then
		return false
	end

	if activePetFlow then
		return false
	end

	flowVersion = flowVersion + 1
	data.flowId = flowVersion
	data.duration = data.duration or 2
	data.isRainbowSpawn = true

	local finishNotified = false

	function data.onCultivateFinished(completed)
		if finishNotified then
			return
		end

		finishNotified = true

		if not completed or not LeylineFlowerPresentUtils.isPetFlowValid(data) then
			LeylineFlowerPresentUtils.finishPetFlow(data)

			return
		end

		LeylineFlowerPresentUtils.startRainbowPetCamera(data, policy)
	end

	local watchdogStarted = false

	function data.onCultivateRendered()
		if watchdogStarted or activePetFlow ~= data then
			return
		end

		watchdogStarted = true

		LeylineFlowerPresentUtils.startFlowWatchdog(data)
	end

	local rushNotified = false

	function data.onCultivateRushStart(rushDuration)
		if rushNotified then
			return
		end

		rushNotified = true

		if not LeylineFlowerPresentUtils.isPetFlowValid(data) then
			return
		end

		LeylineFlowerPresentUtils.playRainbowPetScreenEffect(rushDuration)
	end

	function data.onRainbowPetShown()
		LeylineFlowerPresentUtils.notifyPetFlowSpawnPresented(data)
	end

	activePetFlow = data

	if not LeylineFlowerPresentUtils.showCultivateTips(policy.states, data) then
		finishNotified = true
		watchdogStarted = true
		rushNotified = true
		data.onCultivateFinished = nil
		data.onCultivateRendered = nil
		data.onCultivateRushStart = nil
		data.onRainbowPetShown = nil

		LeylineFlowerPresentUtils.finishPetFlow(data)

		return false
	end

	return true
end

function LeylineFlowerPresentUtils.presentGuestRainbowPetSpawn(data, policy)
	if not data or not data.blockId or not data.petTemplateId or data.petTemplateId <= 0 then
		return false
	end

	local isSceneValid = data.isCultivateValid or LeylineFlowerPresentUtils.createSceneValidator(pg.space)

	function data.isCultivateValid()
		return isSceneValid() and LeylineFlowerUtils.isGuestWorld()
	end

	if not data.isCultivateValid() then
		return false
	end

	data.isRainbowSpawn = true
	data.isGuestRainbowSpawn = true

	local finishNotified = false

	function data.onCultivateFinished(completed)
		if finishNotified then
			return
		end

		finishNotified = true

		if not completed or not data.isCultivateValid() then
			data.onPresentationFinished()

			return
		end

		local success, errorMessage = xpcall(function()
			local tipsCtrl = LeylineFlowerPresentUtils.getTipsCtrl()

			if tipsCtrl then
				tipsCtrl:showTextTipByArgs({
					deleteOnSceneUnload = 1,
					desc = string.format(pg.getGameString("RAINBOW_PET_APPEAR_MY_WORLD"), LeylineFlowerUtils.getRainbowPetNameText(data.petTemplateId))
				})
			end
		end, debug.traceback)

		if not success then
			logger:error("@leylineflower guest rainbow toast failed", errorMessage)
		end

		data.onPresentationFinished()
	end

	function data.onCultivateRushStart(duration)
		if data.isCultivateValid() then
			LeylineFlowerPresentUtils.playRainbowPetScreenEffect(duration)
		end
	end

	if not LeylineFlowerPresentUtils.showCultivateTips(policy.states, data) then
		finishNotified = true

		return false
	end

	return true
end

function LeylineFlowerPresentUtils.presentRainbowEnergyChanged(data, policy)
	if not data or not data.blockId then
		logger:error("@leylineflower present energy changed missing blockId")

		return false
	end

	data.onCultivateFinished = data.onPresentationFinished

	return LeylineFlowerPresentUtils.showCultivateTips(policy.states, data)
end

function LeylineFlowerPresentUtils.present(presentType, data)
	local policy = PRESENT_POLICY[presentType]

	if not policy then
		return false
	end

	if presentType == LeylineFlowerPresentUtils.PRESENT_TYPE.GuestRainbowPetSpawn then
		return LeylineFlowerPresentUtils.presentGuestRainbowPetSpawn(data, policy)
	end

	if presentType == LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowPetSpawn then
		return LeylineFlowerPresentUtils.presentRainbowPetSpawn(data, policy)
	end

	if presentType == LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowEnergyChanged then
		return LeylineFlowerPresentUtils.presentRainbowEnergyChanged(data, policy)
	end

	return false
end

function LeylineFlowerPresentUtils.enqueue(presentType, data, delay, space)
	if not PRESENT_POLICY[presentType] or not data or not space or pg.space ~= space then
		return false
	end

	data.blockId = LeylineFlowerUtils.getBlockIdByStaticId(space.sceneId, data.flowerId or data.staticId)

	if not data.blockId then
		logger:error("@leylineflower presentation missing blockId", data.flowerId or data.staticId)

		return false
	end

	data.sceneId = space.sceneId
	data.spaceId = space.id

	local task = {
		presentType = presentType,
		data = data,
		space = space,
		isSceneValid = LeylineFlowerPresentUtils.createSceneValidator(space),
		readyTime = Time.realSecondCache + math.max(0, tonumber(delay) or 0)
	}

	if presentType == LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowPetSpawn then
		if not space:isLocalSpaceOwner() then
			return false
		end

		space:setRainbowPetTemplateId(data.staticId, data.petTemplateId, data.pointId)
		space:setPendingRainbowPetPresentation(data.staticId, data)
	end

	for _, waiting in ipairs(presentationQueue) do
		waiting.readyTime = Time.realSecondCache
	end

	presentationQueue[#presentationQueue + 1] = task

	LeylineFlowerPresentUtils.tryPresentNext()

	return true
end

function LeylineFlowerPresentUtils.tryPresentNext()
	if activePresentation then
		return
	end

	LeylineFlowerPresentUtils.stopQueueTimer()

	while #presentationQueue > 0 do
		local task = presentationQueue[1]
		local data = task.data

		if not task.isSceneValid() or data.cancelled then
			table.remove(presentationQueue, 1)
			LeylineFlowerPresentUtils.discardPresentation(task, not task.isSceneValid())
		else
			local remaining = task.readyTime - Time.realSecondCache

			if remaining > 0 then
				LeylineFlowerPresentUtils.scheduleNext(remaining)

				return
			end

			local ready = task.presentType ~= LeylineFlowerPresentUtils.PRESENT_TYPE.RainbowPetSpawn or task.space:prepareRainbowPetPresentation(data)

			if not ready then
				local ui = pg.global and pg.global.ui

				if ui and ui:checkUIOpen(UIConst.UI_ID_MAP) then
					task.pointWaitStart = nil

					LeylineFlowerPresentUtils.scheduleNext(PRESENTATION_RETRY_INTERVAL)

					return
				end

				task.pointWaitStart = task.pointWaitStart or Time.realSecondCache

				if Time.realSecondCache - task.pointWaitStart < POINT_SYNC_TIMEOUT then
					LeylineFlowerPresentUtils.scheduleNext(PRESENTATION_RETRY_INTERVAL)

					return
				end

				logger:error("@leylineflower rainbow presentation point timeout", data.staticId, data.pointId)
				table.remove(presentationQueue, 1)
				LeylineFlowerPresentUtils.discardPresentation(task)
			else
				table.remove(presentationQueue, 1)

				activePresentation = task

				function data.isCultivateValid()
					return activePresentation == task and task.isSceneValid() and not data.cancelled
				end

				function data.onPresentationFinished()
					LeylineFlowerPresentUtils.finishPresentation(task)
				end

				local success, shown = xpcall(function()
					return LeylineFlowerPresentUtils.present(task.presentType, data)
				end, debug.traceback)

				if not success then
					logger:error("@leylineflower presentation failed", shown)
				end

				if not success or not shown then
					if activePetFlow == data then
						LeylineFlowerPresentUtils.finishPetFlow(data)
					end

					LeylineFlowerPresentUtils.discardPresentation(task)
					LeylineFlowerPresentUtils.finishPresentation(task)
				end

				return
			end
		end
	end
end

function LeylineFlowerPresentUtils.clear()
	sceneVersion = sceneVersion + 1
	flowVersion = flowVersion + 1

	LeylineFlowerPresentUtils.stopQueueTimer()

	for _, task in ipairs(presentationQueue) do
		LeylineFlowerPresentUtils.discardPresentation(task, true)
	end

	presentationQueue = {}

	if activePresentation then
		LeylineFlowerPresentUtils.discardPresentation(activePresentation, true)
	end

	activePresentation = nil

	local flow = activePetFlow

	LeylineFlowerPresentUtils.resetPetFlow(true)

	if flow then
		LeylineFlowerUtils.cancelCameraFocus(flow.staticId, flow.pointId)
	end
end

return LeylineFlowerPresentUtils
