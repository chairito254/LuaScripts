-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientRacingDungeonBase.lua

local Class = require("Core.Framework.Class")
local ClientDungeon = require("Entities.SpaceEntities.ClientDungeon")
local DungeonConst = require("Common.Const.DungeonConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local AudioConst = require("Const.AudioConst")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local Const = require("Common.Const.Const")
local SceneUtils = require("Common.Utils.SceneUtils")
local TargetUtils = require("GameApp.Target.TargetUtils")
local ClientRacingDungeonBase = Class.Class("ClientRacingDungeonBase", ClientDungeon)
local emptyTable = {}

function ClientRacingDungeonBase:ctor(entityId)
	ClientRacingDungeonBase.super.ctor(self, entityId)

	self._worldRaceClientReadyReported = false
	self.racingGroundReady = false
	self.waitGroundReadySet = {}
end

function ClientRacingDungeonBase:init(createInfo)
	if not EnableBotTest then
		appFacade.abilityMgr:SetContinuousTrapDetectionEnabled(true)
	end

	self.racingGroundReady = EnableBotTest == true
	self.waitGroundReadySet = {}
	self.racingStartSandboxId = nil
	self._worldRaceTrackShowcasePending = false

	local result = ClientRacingDungeonBase.super.init(self, createInfo)

	if self.racingGroundReady and self.status >= DungeonConst.STATUS.PLAYING then
		return result
	end

	local trackConfig = WorldRacingTrackData[self.trackId]
	local sandboxId = trackConfig and trackConfig.startSandboxId

	if type(sandboxId) ~= "number" or sandboxId <= 0 or sandboxId % 1 ~= 0 then
		self.logger:error("world race invalid startSandboxId, trackId=%s startSandboxId=%s", tostring(self.trackId), tostring(sandboxId))
	else
		self.racingStartSandboxId = sandboxId

		self:racingDungeonOnSandboxReady(self.sandboxes[sandboxId])
	end

	return result
end

function ClientRacingDungeonBase:onBeforeSceneLoad(createInfo)
	self.racingGroundReady = EnableBotTest == true or self.status >= DungeonConst.STATUS.PLAYING
end

function ClientRacingDungeonBase:registerWaitGroundReady(entity)
	self.waitGroundReadySet[entity] = true
end

function ClientRacingDungeonBase:unregisterWaitGroundReady(entity)
	self.waitGroundReadySet[entity] = nil
end

function ClientRacingDungeonBase:racingDungeonOnSandboxReady(sandbox)
	if self.racingGroundReady or self.isDestroyed or not sandbox then
		return
	end

	if sandbox.id ~= self.racingStartSandboxId or self.sandboxes[sandbox.id] ~= sandbox then
		return
	end

	if not sandbox.enabled or sandbox.ready ~= true then
		return
	end

	self.racingGroundReady = true

	local waiting = self.waitGroundReadySet

	self.waitGroundReadySet = {}

	for entity, _ in pairs(waiting) do
		if not entity.isDestroyed and entity.space == self then
			entity:onRogueGroundReady()
		end
	end

	if self._worldRaceTrackShowcasePending then
		self:onWorldRaceTrackShowcaseFinished()
	end
end

function ClientRacingDungeonBase:racingDungeonGetMode()
	return WorldRaceDungeonConst.MODE.UNKNOWN
end

function ClientRacingDungeonBase:refreshWorldRaceFinishMark(forceHide)
	local map = pg.game and pg.game.map

	if not map then
		return
	end

	local me = pg.me
	local isInRaceSpace = pg.space == self and me and me.space == self
	local show = not forceHide and isInRaceSpace and self.status == DungeonConst.STATUS.PLAYING

	if show and self.isWorldRacePlayerFinished then
		show = not self:isWorldRacePlayerFinished(me.id)
	end

	local markId = self._worldRaceFinishMarkId

	if markId then
		local mark = map.tempMarkPointData[markId]

		if not mark then
			map:unStoreTrackMarks(markId)
			map:removeTempMark(self.sceneId, markId)
		elseif mark == self._worldRaceFinishMark then
			if show then
				return
			end

			map:unStoreTrackMarks(markId)
			map:removeTempMark(self.sceneId, markId)
		end

		self._worldRaceFinishMarkId = nil
		self._worldRaceFinishMark = nil
	end

	if not show then
		return
	end

	local trackConfig = WorldRacingTrackData[self.trackId]

	if not trackConfig or not trackConfig.trackTarget then
		return
	end

	local routePoints = SceneUtils.getSceneWorldRaceRoutePointGroupData(self.sceneId, self.trackId) or emptyTable

	for _, point in pairs(routePoints) do
		if point.routePointRole == WorldRaceDungeonConst.ROUTE_POINT_ROLE.FINISH then
			local pos = point.position
			local icon = TargetUtils.getTargetIcon(trackConfig.trackTarget)

			markId = trackConfig.trackTarget
			self._worldRaceFinishMarkId = markId

			map:addOrUpdateTempMark(self.sceneId, pos[1], pos[2], pos[3], markId, Const.MAP_MARK_TRACE, {
				replaceIcon = icon
			})

			self._worldRaceFinishMark = map.tempMarkPointData[markId]

			map:storeTrackMarks(markId, self.sceneId, Const.MAP_MARK_TRACE, pos, icon)
			map:manualTraceQuestMark(Const.MAP_MARK_TRACE, markId, false)

			return
		end
	end
end

function ClientRacingDungeonBase:onStatusChange(old, new)
	ClientRacingDungeonBase.super.onStatusChange(self, old, new)
	self:refreshWorldRaceFinishMark()
end

function ClientRacingDungeonBase:hasTrackShowcaseFinished()
	return self._worldRaceClientReadyReported == true or pg.me and pg.me.racingReadyed == 1
end

function ClientRacingDungeonBase:racingDungeonRestoreTrackShowcaseFinished()
	if not pg.me or pg.me.racingReadyed ~= 1 then
		return
	end

	self._worldRaceClientReadyReported = true

	if self._refreshWorldRaceReadyTips then
		self:_refreshWorldRaceReadyTips()
	end
end

function ClientRacingDungeonBase:racingDungeonPlayBgm()
	if not pg.game or not pg.game.audio then
		return
	end

	local trackConfig = WorldRacingTrackData[self.trackId]
	local bgmEvent = trackConfig and trackConfig.trackBgm

	if bgmEvent == nil or bgmEvent == "" then
		return
	end

	pg.game.audio:playBgmByLevel(WorldRaceDungeonConst.BGM_REASON_KEY, bgmEvent, AudioConst.BgmPriority.Level, true)
end

function ClientRacingDungeonBase:racingDungeonStopBgm()
	if not pg.game or not pg.game.audio then
		return
	end

	pg.game.audio:stopBgmByLevel(WorldRaceDungeonConst.BGM_REASON_KEY)
end

function ClientRacingDungeonBase:onStatusPlaying(params)
	ClientRacingDungeonBase.super.onStatusPlaying(self, params)
	self:racingDungeonPlayBgm()
end

function ClientRacingDungeonBase:onStatusClosed(params)
	ClientRacingDungeonBase.super.onStatusClosed(self, params)
	self:racingDungeonStopBgm()
end

function ClientRacingDungeonBase:onWorldRaceTrackShowcaseFinished()
	if self:hasTrackShowcaseFinished() or pg.space ~= self or not pg.me or not pg.me.reportWorldRaceClientReady then
		return false
	end

	self._worldRaceTrackShowcasePending = true

	if self.racingGroundReady ~= true then
		return false
	end

	self._worldRaceTrackShowcasePending = false
	self._worldRaceClientReadyReported = true

	pg.me:reportWorldRaceClientReady()

	return true
end

function ClientRacingDungeonBase:destroy()
	self:refreshWorldRaceFinishMark(true)

	if not EnableBotTest and pg.space == self then
		appFacade.abilityMgr:SetContinuousTrapDetectionEnabled(false)
	end

	self.waitGroundReadySet = {}
	self.racingStartSandboxId = nil
	self._worldRaceClientReadyReported = nil

	ClientRacingDungeonBase.super.destroy(self)
end

return ClientRacingDungeonBase
