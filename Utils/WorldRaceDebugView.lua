-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\WorldRaceDebugView.lua

local LoggerManager = require("Core.Log.LoggerManager")
local TimerManager = require("Core.Timer.TimerManager")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local WorldRaceDungeonUtils = require("Common.Utils.WorldRaceDungeonUtils")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local DungeonConst = require("Common.Const.DungeonConst")
local Time = require("Core.Common.Time")
local logger = LoggerManager.getLogger("WorldRaceDebugView")
local GmCS = CS.FunPlus.WorldX.Utils.GmToolUtils
local WorldRaceDebugView = {
	_localLastCheckpointIndex = -1,
	_enabled = false,
	TICK_INTERVAL = 0.1,
	MODE_NAMES = {
		[WorldRaceDungeonConst.MODE.UNKNOWN] = "UNKNOWN",
		[WorldRaceDungeonConst.MODE.SINGLE] = "SINGLE",
		[WorldRaceDungeonConst.MODE.MULTI] = "MULTI"
	},
	STATUS_NAMES = {
		[DungeonConst.STATUS.CREATING] = "CREATING",
		[DungeonConst.STATUS.INIT] = "INIT",
		[DungeonConst.STATUS.PLAYER_READY] = "PLAYER_READY",
		[DungeonConst.STATUS.COUNT_DONW] = "COUNT_DOWN",
		[DungeonConst.STATUS.PLAYING] = "PLAYING",
		[DungeonConst.STATUS.REWARD] = "REWARD",
		[DungeonConst.STATUS.CLOSE] = "CLOSE",
		[DungeonConst.STATUS.DESTROY] = "DESTROY"
	},
	ROLE_NAMES = {
		[WorldRaceDungeonConst.ROUTE_POINT_ROLE.START] = "起点",
		[WorldRaceDungeonConst.ROUTE_POINT_ROLE.CHECKPOINT] = "检查点",
		[WorldRaceDungeonConst.ROUTE_POINT_ROLE.FINISH] = "终点"
	}
}

function WorldRaceDebugView.setEnabled(enabled)
	enabled = enabled and true or false

	if WorldRaceDebugView._enabled == enabled then
		return
	end

	WorldRaceDebugView._enabled = enabled

	if not enabled then
		WorldRaceDebugView.stopTick()
		WorldRaceDebugView.clearRoute()
		GmCS.SetWorldRaceDebugEnabled(false)

		return
	end

	GmCS.SetWorldRaceDebugEnabled(true)
	WorldRaceDebugView.rebuildRoute()
	WorldRaceDebugView.startTick()
end

function WorldRaceDebugView.startTick()
	WorldRaceDebugView.stopTick()
	WorldRaceDebugView.tick()

	WorldRaceDebugView._timerId = TimerManager.addRepeatTimer(WorldRaceDebugView.TICK_INTERVAL, function()
		WorldRaceDebugView.tick()
	end)
end

function WorldRaceDebugView.stopTick()
	if not WorldRaceDebugView._timerId then
		return
	end

	TimerManager.removeTimer(WorldRaceDebugView._timerId)

	WorldRaceDebugView._timerId = nil
end

function WorldRaceDebugView.clearRoute()
	WorldRaceDebugView._routeCache = nil
	WorldRaceDebugView._routeError = nil
	WorldRaceDebugView._sceneId = nil
	WorldRaceDebugView._trackId = nil
	WorldRaceDebugView._fullRaceTimes = nil
	WorldRaceDebugView._localLastCheckpointIndex = -1
	WorldRaceDebugView._previousPosition = nil
	WorldRaceDebugView._checkpointToastContext = nil

	GmCS.ClearWorldRaceDebugGates()
end

function WorldRaceDebugView.getRacingSpace()
	local space = pg.space

	if not space or not space.racingDungeonGetMode then
		return nil
	end

	return space
end

function WorldRaceDebugView.rebuildRoute()
	WorldRaceDebugView.clearRoute()

	local space = WorldRaceDebugView.getRacingSpace()

	if not space then
		return
	end

	local sceneId, trackId = space.sceneId, space.trackId

	WorldRaceDebugView._sceneId = sceneId
	WorldRaceDebugView._trackId = trackId

	local routeCache, routeError = WorldRaceDungeonUtils.buildRoute(sceneId, trackId)

	if not routeCache then
		WorldRaceDebugView._routeError = tostring(routeError)

		logger:error("rebuildRoute failed, sceneId=%s, trackId=%s, error=%s", tostring(sceneId), tostring(trackId), tostring(routeError))

		return
	end

	WorldRaceDebugView._routeCache = routeCache
	WorldRaceDebugView._fullRaceTimes = WorldRaceDebugView.buildFullRaceTimes(trackId)
	WorldRaceDebugView._previousPosition = WorldRaceDebugView.clonePosition(pg.me and pg.me:getPosition())

	for _, gate in ipairs(routeCache.gates) do
		local position, rotation = gate.position, gate.rotation

		GmCS.AddWorldRaceDebugGate(gate.gateIndex, gate.routePointRole, position[1], position[2], position[3], rotation[1], rotation[2], rotation[3], gate.gateWidth, gate.gateHeight, gate.gateThickness)
	end
end

function WorldRaceDebugView.buildFullRaceTimes(trackId)
	local trackConfig = WorldRacingTrackData[trackId]
	local racingEvaluate = trackConfig and trackConfig.racingEvaluate

	if not racingEvaluate or not racingEvaluate[1] then
		return nil
	end

	return {
		sTime = racingEvaluate[1],
		a50Time = racingEvaluate[2],
		bTime = racingEvaluate[3]
	}
end

function WorldRaceDebugView.clonePosition(position)
	if not position then
		return nil
	end

	local x = position.x or position[1]
	local y = position.y or position[2]
	local z = position.z or position[3]

	if not x or not y or not z then
		return nil
	end

	return {
		x,
		y,
		z
	}
end

function WorldRaceDebugView.getCommStateMap()
	local space = WorldRaceDebugView.getRacingSpace()

	return space and space.racingPlayerCommStates or nil
end

function WorldRaceDebugView.getCommState(playerId)
	local commStates = WorldRaceDebugView.getCommStateMap()

	return commStates and playerId and commStates[playerId] or nil
end

function WorldRaceDebugView.collectCrossedGates(commState)
	local routeCache = WorldRaceDebugView._routeCache

	if not routeCache then
		return nil, nil, false, 0
	end

	local gateCount = #routeCache.gates
	local crossedIndex = commState and commState.crossedIndex or nil
	local toastContext, notifyCheckpoint = WorldRaceDebugView.prepareCheckpointToast(crossedIndex)
	local newCheckpoints
	local crossedList, missingGateIndex = {}

	for gateIndex = 1, gateCount do
		local passed = crossedIndex and crossedIndex[gateIndex] == true or false

		if toastContext then
			local gate = routeCache.gates[gateIndex]

			if notifyCheckpoint and passed and not toastContext.passed[gateIndex] and gate.routePointRole == WorldRaceDungeonConst.ROUTE_POINT_ROLE.CHECKPOINT then
				newCheckpoints = newCheckpoints or {}
				newCheckpoints[#newCheckpoints + 1] = tostring(gate.checkpointIndex)
			end

			toastContext.passed[gateIndex] = passed
		end

		GmCS.SetWorldRaceDebugGatePassed(gateIndex, passed)

		if passed then
			crossedList[#crossedList + 1] = gateIndex
		else
			missingGateIndex = missingGateIndex or gateIndex
		end
	end

	if newCheckpoints then
		pg.global.showBubbleMessageRaw("[竞速调试] 已通过检查点 " .. table.concat(newCheckpoints, "、"), 3)
	end

	local isFinished = crossedIndex and crossedIndex[gateCount] == true or false

	return crossedList, missingGateIndex, isFinished, gateCount
end

function WorldRaceDebugView.prepareCheckpointToast(crossedIndex)
	local space = WorldRaceDebugView.getRacingSpace()
	local playerId = pg.me and pg.me.id

	if not WorldRaceDebugView._enabled or not crossedIndex or not space or not playerId then
		WorldRaceDebugView._checkpointToastContext = nil

		return nil, false
	end

	local context = WorldRaceDebugView._checkpointToastContext

	if context and context.space == space and context.playerId == playerId and context.startTs == space.start_ts then
		return context, true
	end

	context = {
		space = space,
		playerId = playerId,
		startTs = space.start_ts,
		passed = {}
	}
	WorldRaceDebugView._checkpointToastContext = context

	return context, false
end

function WorldRaceDebugView.updateLocalGate(currentPosition)
	local routeCache = WorldRaceDebugView._routeCache
	local previousPosition = WorldRaceDebugView._previousPosition

	if not routeCache or not previousPosition or not currentPosition then
		return
	end

	if WorldRaceDebugView._localLastCheckpointIndex >= routeCache.checkpointCount then
		return
	end

	local result = WorldRaceDungeonUtils.checkNextGateCrossing(routeCache, previousPosition, currentPosition, WorldRaceDebugView._localLastCheckpointIndex)

	if not result or not result.passed then
		return
	end

	if result.routePointRole == WorldRaceDungeonConst.ROUTE_POINT_ROLE.START then
		WorldRaceDebugView._localLastCheckpointIndex = 0
	elseif result.checkpointIndex then
		WorldRaceDebugView._localLastCheckpointIndex = result.checkpointIndex
	end
end

function WorldRaceDebugView.tick()
	if not WorldRaceDebugView._enabled then
		return
	end

	local space = WorldRaceDebugView.getRacingSpace()

	if not space then
		WorldRaceDebugView.clearRoute()
		GmCS.SetWorldRaceDebugInfoText("[大世界竞速调试]\n当前不在竞速副本内，进入赛道后自动生效")

		return
	end

	if space.sceneId ~= WorldRaceDebugView._sceneId or space.trackId ~= WorldRaceDebugView._trackId then
		WorldRaceDebugView.rebuildRoute()
	end

	local currentPosition = WorldRaceDebugView.clonePosition(pg.me and pg.me:getPosition())

	if currentPosition then
		WorldRaceDebugView.updateLocalGate(currentPosition)

		WorldRaceDebugView._previousPosition = currentPosition
	end

	GmCS.SetWorldRaceDebugInfoText(WorldRaceDebugView.buildInfoText(space, currentPosition))
end

function WorldRaceDebugView.buildInfoText(space, currentPosition)
	local lines = {}
	local mode = space:racingDungeonGetMode()

	lines[#lines + 1] = string.format("[大世界竞速调试]  模式 %s(%s)  场景 %s  赛道 %s  阶段 %s(%s)", WorldRaceDebugView.MODE_NAMES[mode] or "?", tostring(mode), tostring(space.sceneId), tostring(space.trackId), WorldRaceDebugView.STATUS_NAMES[space.status] or "?", tostring(space.status))

	if not WorldRaceDebugView._routeCache then
		lines[#lines + 1] = string.format("赛道构建失败: %s", tostring(WorldRaceDebugView._routeError))

		return table.concat(lines, "\n")
	end

	WorldRaceDebugView.appendAuthorityLines(lines)
	WorldRaceDebugView.appendProgressLines(lines, space, currentPosition)
	WorldRaceDebugView.appendPlayerPropertyLine(lines)
	WorldRaceDebugView.appendAllPlayerLine(lines)
	WorldRaceDebugView.appendCommStateDiagnostic(lines)

	return table.concat(lines, "\n")
end

function WorldRaceDebugView.appendAuthorityLines(lines)
	local playerId = pg.me and pg.me.id
	local commStates = WorldRaceDebugView.getCommStateMap()

	if not commStates then
		lines[#lines + 1] = "服务端权威: 属性 racingPlayerCommStates 不可用（双端 Config 是否已生成？）"

		WorldRaceDebugView.collectCrossedGates(nil)

		return
	end

	local commState = WorldRaceDebugView.getCommState(playerId)
	local crossedList, missingGateIndex, isFinished, gateCount = WorldRaceDebugView.collectCrossedGates(commState)
	local authorityCheckpoint = commState and commState.lastCheckpointIndex or nil

	lines[#lines + 1] = string.format("服务端权威: 最后检查点 %s/%s   已过门 %s / 共 %s   缺 %s   冲线 %s", tostring(authorityCheckpoint), tostring(WorldRaceDebugView._routeCache.checkpointCount), #crossedList > 0 and table.concat(crossedList, ",") or "无", tostring(gateCount), missingGateIndex and tostring(missingGateIndex) or "无", isFinished and "是" or "否")

	local localCheckpoint = WorldRaceDebugView._localLastCheckpointIndex
	local consistency = "权威值缺失"

	if authorityCheckpoint then
		consistency = authorityCheckpoint == localCheckpoint and "与权威一致" or "与权威不一致!"
	end

	lines[#lines + 1] = string.format("客户端本地: 最后检查点 %s   （%s）", tostring(localCheckpoint), consistency)
end

function WorldRaceDebugView.appendProgressLines(lines, space, currentPosition)
	local routeCache = WorldRaceDebugView._routeCache

	if not currentPosition then
		lines[#lines + 1] = "进度: 取不到主角位置"

		return
	end

	local commState = WorldRaceDebugView.getCommState(pg.me and pg.me.id)
	local baseCheckpoint = commState and commState.lastCheckpointIndex or WorldRaceDebugView._localLastCheckpointIndex
	local progressInfo, progressError = WorldRaceDungeonUtils.calculateProgress(routeCache, currentPosition, baseCheckpoint)

	if not progressInfo then
		lines[#lines + 1] = string.format("进度: 计算失败 %s（基准检查点 %s）", tostring(progressError), tostring(baseCheckpoint))

		return
	end

	local nextGate = routeCache.gates[baseCheckpoint + 2]
	local nextGateText = "无（已到终点）"

	if nextGate then
		local gatePosition = nextGate.position
		local dx = currentPosition[1] - gatePosition[1]
		local dy = currentPosition[2] - gatePosition[2]
		local dz = currentPosition[3] - gatePosition[3]

		nextGateText = string.format("#%s %s%s 距离 %.1fm", tostring(nextGate.gateIndex), WorldRaceDebugView.ROLE_NAMES[nextGate.routePointRole] or "?", nextGate.checkpointIndex and tostring(nextGate.checkpointIndex) or "", math.sqrt(dx * dx + dy * dy + dz * dz))
	end

	lines[#lines + 1] = string.format("进度: %.1f%%  路程 %.1f/%.1fm  离路线 %.1fm   下一道门 %s", progressInfo.progressPercent * 100, progressInfo.routeDistance, routeCache.totalLength, progressInfo.distanceToRoute, nextGateText)

	local elapsedTime = math.max(0, Time.secondCache - (space.start_ts or Time.secondCache))
	local bestTimes = pg.me and pg.me.racingSingleBestTimes
	local bestTime = bestTimes and bestTimes[space.trackId] or 0
	local fullRaceTimes = WorldRaceDebugView._fullRaceTimes

	if not fullRaceTimes then
		lines[#lines + 1] = string.format("评级: 该赛道无 racingEvaluate 配置   本局 %.1fs   最佳 %ss", elapsedTime, tostring(bestTime))

		return
	end

	local ratingInfo = WorldRaceDungeonUtils.calculateRating(progressInfo.progressPercent, elapsedTime, fullRaceTimes)

	if not ratingInfo then
		lines[#lines + 1] = string.format("评级: 计算失败   本局 %.1fs   最佳 %ss", elapsedTime, tostring(bestTime))

		return
	end

	lines[#lines + 1] = string.format("评级: %s  fill %.2f   本局 %.1fs   最佳 %ss", tostring(ratingInfo.grade), ratingInfo.fillPercent, elapsedTime, tostring(bestTime))
end

function WorldRaceDebugView.appendPlayerPropertyLine(lines)
	local player = pg.me

	if not player then
		lines[#lines + 1] = "同步属性: 取不到主角"

		return
	end

	lines[#lines + 1] = string.format("同步属性: 金币 %s  道具 %s  增益Buff %s", tostring(player.racingGoldCoins), tostring(player.racingItemId), tostring(player.racingSelectedBuffId))
end

function WorldRaceDebugView.appendAllPlayerLine(lines)
	local commStates = WorldRaceDebugView.getCommStateMap()

	if not commStates then
		return
	end

	local myPlayerId = pg.me and pg.me.id
	local parts = {}

	for playerId, commState in pairs(commStates) do
		local label = playerId == myPlayerId and "自己" or tostring(playerId)

		parts[#parts + 1] = string.format("[%s]%s", label, tostring(commState and commState.lastCheckpointIndex))
	end

	if #parts > 0 then
		lines[#lines + 1] = string.format("全场: %s", table.concat(parts, "  "))
	end
end

function WorldRaceDebugView.appendCommStateDiagnostic(lines)
	local space = WorldRaceDebugView.getRacingSpace()
	local commStates = space and space.racingPlayerCommStates or nil
	local playerId = pg.me and pg.me.id

	if commStates and playerId ~= nil and commStates[playerId] ~= nil then
		return
	end

	if not commStates then
		lines[#lines + 1] = string.format("[属性诊断] racingPlayerCommStates = nil   主角id %s(%s)", tostring(playerId), type(playerId))

		return
	end

	local keyParts, count = {}, 0

	for key in pairs(commStates) do
		count = count + 1

		if count <= 4 then
			keyParts[#keyParts + 1] = string.format("%s(%s)", tostring(key), type(key))
		end
	end

	lines[#lines + 1] = string.format("[属性诊断] 取不到本机条目: 共 %s 条  key %s  主角id %s(%s)", tostring(count), #keyParts > 0 and table.concat(keyParts, ",") or "无", tostring(playerId), type(playerId))
end

return WorldRaceDebugView
