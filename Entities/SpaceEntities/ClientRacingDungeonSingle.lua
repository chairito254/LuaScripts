-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientRacingDungeonSingle.lua

local Class = require("Core.Framework.Class")
local ClientRacingDungeonBase = require("Entities.SpaceEntities.ClientRacingDungeonBase")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local WorldRaceDungeonUtils = require("Common.Utils.WorldRaceDungeonUtils")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local Time = require("Core.Common.Time")
local MessageName = require("Const.MessageName")
local DungeonConst = require("Common.Const.DungeonConst")
local ClientRacingDungeonSingle = Class.Class("ClientRacingDungeonSingle", ClientRacingDungeonBase)

function ClientRacingDungeonSingle:racingDungeonGetMode()
	return WorldRaceDungeonConst.MODE.SINGLE
end

function ClientRacingDungeonSingle:onStatusPlayerReady(params)
	ClientRacingDungeonSingle.super.onStatusPlayerReady(self, params)
	self:_refreshWorldRaceReadyTips()
end

function ClientRacingDungeonSingle:on_readyEndTm_changed(oldVal, newVal)
	if self.status == DungeonConst.STATUS.PLAYER_READY then
		self:_refreshWorldRaceReadyTips()
	end
end

function ClientRacingDungeonSingle:_refreshWorldRaceReadyTips()
	local tips = pg.global and pg.global.ui and pg.global.ui.tips

	if not tips then
		return
	end

	tips:hideGrabEggWaitingInfo()

	if pg.space ~= self or self.status ~= DungeonConst.STATUS.PLAYER_READY then
		return
	end

	local endTime = tonumber(self.readyEndTm) or 0

	if endTime > 0 then
		tips:showGrabEggWaitingInfo({
			tipsTextKey = "RACING_WAITING_START",
			endTime = endTime
		})
	end
end

function ClientRacingDungeonSingle:onStatusCountDown(params)
	ClientRacingDungeonSingle.super.onStatusCountDown(self, params)
	self:_stopWorldRaceSingleUIRefresh(true)
	self:_showWorldRaceCountDown()
end

function ClientRacingDungeonSingle:on_countDownEndTm_changed(oldVal, newVal)
	if self.status == DungeonConst.STATUS.COUNT_DONW then
		self:_showWorldRaceCountDown()
	end
end

function ClientRacingDungeonSingle:_showWorldRaceCountDown()
	if not pg.global or not pg.global.ui or not pg.global.ui.tips then
		return
	end

	local endTime = tonumber(self.countDownEndTm) or 0

	pg.global.ui.tips:hideGrabEggWaitingInfo()
	pg.global.ui.tips:hideCountDownBeat()

	if endTime <= Time.secondCache then
		return
	end

	pg.global.ui.tips:showCountDownBeat(endTime)
end

function ClientRacingDungeonSingle:racingDungeonRefreshSinglePresentation()
	local tips = pg.global and pg.global.ui and pg.global.ui.tips

	if self.status == DungeonConst.STATUS.PLAYER_READY then
		self:_refreshWorldRaceReadyTips()
	elseif tips then
		tips:hideGrabEggWaitingInfo()
	end

	if self.status ~= DungeonConst.STATUS.COUNT_DONW and self.status ~= DungeonConst.STATUS.PLAYING and tips then
		tips:hideCountDownBeat()
	end

	if self.status ~= DungeonConst.STATUS.PLAYING then
		self:_stopWorldRaceSingleUIRefresh(true)
	end

	if self.status == DungeonConst.STATUS.COUNT_DONW then
		self:_showWorldRaceCountDown()
	elseif self.status == DungeonConst.STATUS.PLAYING then
		if not self._worldRaceSingleRouteCache then
			self:_buildWorldRaceSingleUIContext()
		end

		if not self._worldRaceSingleUITimer then
			self:_startWorldRaceSingleUIRefresh()
		end
	end
end

function ClientRacingDungeonSingle:onStatusPlaying(params)
	ClientRacingDungeonSingle.super.onStatusPlaying(self, params)

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
	end

	self:_buildWorldRaceSingleUIContext()
	self:_startWorldRaceSingleUIRefresh()
end

function ClientRacingDungeonSingle:onStatusReward(params)
	ClientRacingDungeonSingle.super.onStatusReward(self, params)
	self:_stopWorldRaceSingleUIRefresh(false)

	if self._worldRaceSingleUISnapshot then
		self._worldRaceSingleUISnapshot.status = self.status

		self:_publishWorldRaceSingleSnapshot(self._worldRaceSingleUISnapshot)
	end

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
		pg.global.ui.tips:hideCountDownBeat()
	end
end

function ClientRacingDungeonSingle:onStatusClosed(params)
	ClientRacingDungeonSingle.super.onStatusClosed(self, params)
	self:_stopWorldRaceSingleUIRefresh(true)

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
		pg.global.ui.tips:hideCountDownBeat()
	end
end

function ClientRacingDungeonSingle:destroy()
	self:_stopWorldRaceSingleUIRefresh(true)

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
		pg.global.ui.tips:hideCountDownBeat()
	end

	ClientRacingDungeonSingle.super.destroy(self)
end

function ClientRacingDungeonSingle:_buildWorldRaceSingleUIContext()
	local routeCache, routeError = WorldRaceDungeonUtils.buildRoute(self.sceneId, self.trackId)
	local trackConfig = WorldRacingTrackData[self.trackId]
	local racingEvaluate = trackConfig and trackConfig.racingEvaluate
	local fullRaceTimes = racingEvaluate and {
		sTime = racingEvaluate[1],
		a50Time = racingEvaluate[2],
		bTime = racingEvaluate[3]
	}

	self._worldRaceSingleRouteCache = routeCache
	self._worldRaceSingleFullRaceTimes = nil

	if routeCache == nil and not self._worldRaceSingleRouteErrorLogged then
		self._worldRaceSingleRouteErrorLogged = true

		self.logger:error("world race single UI route invalid sceneId=%s spaceId=%s trackId=%s routeError=%s", tostring(self.sceneId), tostring(self.id), tostring(self.trackId), tostring(routeError))
	end

	if trackConfig == nil or trackConfig.sceneId ~= self.sceneId then
		if not self._worldRaceSingleRatingErrorLogged then
			self._worldRaceSingleRatingErrorLogged = true

			self.logger:error("world race single UI rating config invalid sceneId=%s spaceId=%s trackId=%s", tostring(self.sceneId), tostring(self.id), tostring(self.trackId))
		end

		return
	end

	local ratingInfo, ratingError = WorldRaceDungeonUtils.calculateRating(0, 0, fullRaceTimes)

	if ratingInfo == nil then
		if not self._worldRaceSingleRatingErrorLogged then
			self._worldRaceSingleRatingErrorLogged = true

			self.logger:error("world race single UI rating config invalid sceneId=%s spaceId=%s trackId=%s ratingError=%s", tostring(self.sceneId), tostring(self.id), tostring(self.trackId), tostring(ratingError))
		end

		return
	end

	self._worldRaceSingleFullRaceTimes = fullRaceTimes
end

function ClientRacingDungeonSingle:_startWorldRaceSingleUIRefresh()
	self:_stopWorldRaceSingleUIRefresh(false)
	self:_tickWorldRaceSingleUI()

	self._worldRaceSingleUITimer = self:addRepeatTimer(0.1, function()
		self:_tickWorldRaceSingleUI()
	end)
end

function ClientRacingDungeonSingle:_stopWorldRaceSingleUIRefresh(clearSnapshot)
	if self._worldRaceSingleUITimer then
		self:removeTimer(self._worldRaceSingleUITimer)

		self._worldRaceSingleUITimer = nil
	end

	if clearSnapshot then
		self._worldRaceSingleRouteCache = nil
		self._worldRaceSingleFullRaceTimes = nil

		self:_publishWorldRaceSingleSnapshot(nil)
	end
end

function ClientRacingDungeonSingle:_tickWorldRaceSingleUI()
	if pg.space ~= self or not pg.me or pg.me.space ~= self or self.status ~= DungeonConst.STATUS.PLAYING then
		return
	end

	local elapsedTime = math.max(0, Time.secondCache - (self.start_ts or Time.secondCache))
	local bestTimes = pg.me and pg.me.racingSingleBestTimes
	local snapshot = self._worldRaceSingleUISnapshot or {}

	snapshot.elapsedTime = elapsedTime
	snapshot.bestTime = bestTimes and bestTimes[self.trackId] or 0
	snapshot.progressPercent = 0
	snapshot.grade = "Node"
	snapshot.fillPercent = 0
	snapshot.hasRating = false
	snapshot.status = self.status

	local currentPosition = pg.me and pg.me:getPosition() or nil
	local routeCache = self._worldRaceSingleRouteCache
	local playerState = self.racingPlayerCommStates and self.racingPlayerCommStates[pg.me.id]

	if currentPosition and routeCache and playerState then
		local progressInfo = WorldRaceDungeonUtils.calculateProgress(routeCache, currentPosition, playerState.lastCheckpointIndex)

		if progressInfo then
			local isFinished = playerState.crossedIndex and playerState.crossedIndex[#routeCache.gates] == true

			snapshot.progressPercent = isFinished and 1 or progressInfo.progressPercent

			local ratingInfo = WorldRaceDungeonUtils.calculateRating(snapshot.progressPercent, elapsedTime, self._worldRaceSingleFullRaceTimes)

			if ratingInfo then
				snapshot.grade = ratingInfo.grade
				snapshot.fillPercent = ratingInfo.fillPercent
				snapshot.hasRating = true
			end
		end
	end

	self:_publishWorldRaceSingleSnapshot(snapshot)
end

function ClientRacingDungeonSingle:_publishWorldRaceSingleSnapshot(snapshot)
	self._worldRaceSingleUISnapshot = snapshot

	facade:sendMsgToUI(MessageName.WORLD_RACE_SINGLE_SNAPSHOT_CHANGED, snapshot)
end

function ClientRacingDungeonSingle:getWorldRaceSingleUISnapshot()
	return self._worldRaceSingleUISnapshot
end

return ClientRacingDungeonSingle
