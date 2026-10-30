-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientRobEggDungeon.lua

local Class = require("Core.Framework.Class")
local ClientDungeon = require("Entities.SpaceEntities.ClientDungeon")
local ClientConst = require("Const.ClientConst")
local DungeonConst = require("Common.Const.DungeonConst")
local MessageName = require("Const.MessageName")
local EffectConst = require("Const.EffectConst")
local Const = require("Common.Const.Const")
local Time = require("Core.Common.Time")
local LevelData = require("Data.level_data")
local RobEggBorn = require("Data.rob_egg_born_data")
local RobEggBase = require("Data.rob_egg_base_data")
local SceneDistributeAreaData = require("Data.scene_distribute_area_data")
local MapSmallAreaIdToIndex = require("Data.map_small_area_id_to_index")
local MapAreaToSmallArea = require("Data.map_area_to_small_area")
local MapUtils = require("Guis.Utils.MapUtils")
local SceneUtils = require("Common.Utils.SceneUtils")
local NoticeDef = require("Common.NoticeDef")
local WeatherData = require("Data.weather_data")
local SandboxConst = require("Common.Const.SandboxConst")
local TimerManager = require("Core.Timer.TimerManager")
local SysConfigData = require("Data.sys_config_data")
local ROB_EGG_READY_WALL_TEMPLATE_ID = 100002
local ClientRobEggDungeon = Class.Class("ClientRobEggDungeon", ClientDungeon)
local ClientSpaceComponents = {}

Class.AddComponents(ClientRobEggDungeon, ClientSpaceComponents)

function ClientRobEggDungeon:init(dict)
	self.teamInfo = dict.teamInfo or {}
	self.selectArea = dict.selectArea
	self.robEggWeatherIdByBlockId = {}

	ClientRobEggDungeon.super.init(self, dict)

	return true
end

function ClientRobEggDungeon:start()
	ClientRobEggDungeon.super.start(self)
	self:releaseExpiredReadyAirWalls()
	self:startRobEggWeatherBlockCheckTimer()
	pg.me:doEventByData({
		"changeMapLayerData",
		{
			0,
			0,
			0
		}
	}, {
		areaId = 0
	})

	if self.sceneId == Const.ROB_EGG_SCENE_CLIP_ID then
		self:singleModeStart()
	else
		self:multiModeStart()
	end

	if self.status == DungeonConst.STATUS.PLAYING then
		pg.game.grabEgg:tryStartEndTimeCountdown(self.end_ts, self.isPvp)
	end
end

function ClientRobEggDungeon:onEntityJoin(entity)
	ClientRobEggDungeon.super.onEntityJoin(self, entity)
	self:tryReleaseReadyAirWall(entity)
end

function ClientRobEggDungeon:onStatusChange(old, new)
	self:releaseExpiredReadyAirWalls()
	ClientRobEggDungeon.super.onStatusChange(self, old, new)
end

function ClientRobEggDungeon:releaseExpiredReadyAirWalls()
	if not self.status or self.status < DungeonConst.STATUS.PLAYING then
		return
	end

	for _, entity in pairs(self._globalId2Entity) do
		self:tryReleaseReadyAirWall(entity)
	end
end

function ClientRobEggDungeon:tryReleaseReadyAirWall(entity)
	if self.destroyed or self.sceneId ~= Const.ROB_EGG_SCENE_ID and self.sceneId ~= Const.ROB_EGG_SCENE_CLIP_ID or not self.status or self.status < DungeonConst.STATUS.PLAYING or entity.destroyed or entity.space ~= self or entity.className ~= "ClientAirWall" or entity.templateId ~= ROB_EGG_READY_WALL_TEMPLATE_ID then
		return
	end

	entity:releaseWallPresentation()
end

function ClientRobEggDungeon:singleModeStart()
	self:setSingleModeFogMask()
end

function ClientRobEggDungeon:setSingleModeFogMask()
	local cData = RobEggBorn[self.sceneId]

	if cData == nil then
		return
	end

	local id_to_team = self.teamInfo.id_to_team
	local teams = self.teamInfo.teams

	if not id_to_team or not teams then
		return
	end

	local teamId = id_to_team[pg.me.uid]
	local team = teams[teamId]

	if not team then
		return
	end

	local spawnerId = team.bornSpawnerId
	local mapAreaId = cData.areaIndex[spawnerId]

	pg.game.map:setMapFogMaskStatus(self.sceneId, {
		mapAreaId
	})
end

function ClientRobEggDungeon:getGrabEggTeamIndex(uid)
	local id_to_team = self.teamInfo.id_to_team
	local teams = self.teamInfo.teams

	if not id_to_team or not teams then
		return 0
	end

	local myTeamId = id_to_team[pg.me.uid]
	local teamId = id_to_team[uid]

	if teamId ~= myTeamId then
		return 0
	end

	local team = teams[teamId]

	if not team then
		return 0
	end

	for index, curUid in ipairs(team.members) do
		if curUid == uid then
			return index
		end
	end

	return 0
end

function ClientRobEggDungeon:multiModeStart()
	self:setMultiModeFogMask()
	self:refreshCoreAreaMapStatus()
end

function ClientRobEggDungeon:setMultiModeFogMask()
	if self.isPvp then
		local validAreaIds = {}

		if self.selectArea and MapSmallAreaIdToIndex[self.selectArea] then
			validAreaIds[1] = self.selectArea
		end

		pg.game.map:setMapFogMaskStatus(self.sceneId, validAreaIds)
	else
		local cData = SceneDistributeAreaData[self.sceneId]

		if cData then
			local mapId = cData[1]
			local areaIds = MapAreaToSmallArea[mapId] or {}
			local validAreaIds = {}

			for _, v in ipairs(areaIds) do
				if MapSmallAreaIdToIndex[v] then
					validAreaIds[#validAreaIds + 1] = v
				end
			end

			pg.game.map:setMapFogMaskStatus(self.sceneId, validAreaIds)
		end
	end

	local cData = RobEggBase[self.sceneId]

	if cData and cData.coreAreaID then
		pg.game.map:setMapWarningAreaStatus(self.sceneId, {
			cData.coreAreaID
		})
	end
end

function ClientRobEggDungeon:getRobEggPvpReviveTime()
	if self.destroyed or self.sceneId ~= Const.ROB_EGG_SCENE_ID or self.status ~= DungeonConst.STATUS.PLAYING then
		return nil
	end

	local interval = self.reliveCountDown

	if type(interval) ~= "number" or interval <= 0 then
		interval = SysConfigData.grabegg_pvp_player_respawn_sec or 30
	end

	local startTime = self.start_ts or 0

	if startTime <= 0 or interval <= 0 then
		return nil
	end

	local elapsed = math.max(0, Time.secondCache - startTime)

	return startTime + (math.floor(elapsed / interval) + 1) * interval, interval
end

function ClientRobEggDungeon:on_reliveCountDown_changed(oldv, newv)
	if self.sceneId == Const.ROB_EGG_SCENE_ID then
		facade:sendMsgToUI(MessageName.GRAB_EGG_RELIVE_COUNT_DOWN_CHANGED)
	end
end

function ClientRobEggDungeon:on_start_ts_changed(oldv, newv)
	if self.sceneId == Const.ROB_EGG_SCENE_ID then
		facade:sendMsgToUI(MessageName.GRAB_EGG_RELIVE_COUNT_DOWN_CHANGED)
	end
end

function ClientRobEggDungeon:on_escapeStage_changed(oldv, newv)
	if newv == DungeonConst.RobEggStage.PVP then
		pg.me:grabEgg_PvpAreaUnlock()
	end

	self:refreshCoreAreaMapStatus()
end

function ClientRobEggDungeon:refreshCoreAreaMapStatus()
	local cData = RobEggBase[self.sceneId]

	if cData == nil or cData.coreAreaNameID == nil then
		return
	end

	local state = self.escapeStage == DungeonConst.RobEggStage.PVP and Const.MAP_MARK_STATUS_UNLOCKED or Const.MAP_MARK_STATUS_LOCKED

	MapUtils.setDynamicMarkStatus(cData.coreAreaNameID, state)
end

function ClientRobEggDungeon:on_teamPointInfo_changed()
	facade:sendMsgToUI(MessageName.GRAB_EGG_TEAM_POINT_CHANGED)
end

function ClientRobEggDungeon:on_teamPointInfo_value_changed()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamPointInfo_entry_added()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamPointInfo_entry_deleted()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_curControlTeam_changed()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_totalPointValue_changed()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_changed()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_entry_added()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_entry_deleted()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_team_changed()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_reward_added()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_reward_deleted()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_teamRewardBox_count_changed()
	self:on_teamPointInfo_changed()
end

function ClientRobEggDungeon:on_superEggInfo_changed(oldv, newv)
	if newv and newv.expireOpenTime > Time.secondCache then
		self:tryStartSpaceEggEffect(newv)
	end
end

function ClientRobEggDungeon:tryStartSpaceEggEffect(superEggInfo)
	local egg = pg.getEntity(superEggInfo.entityId)

	if egg then
		egg:refreshEffectAfterModelLoaded()
		egg:refreshInteractTriggerEvent()
	end
end

function ClientRobEggDungeon:tryEndSpaceEggEffect()
	if not self.superEggInfo then
		return
	end

	local egg = pg.getEntity(self.superEggInfo.entityId)

	if egg then
		egg:endEffect()
		egg:refreshInteractTriggerEvent()
	end
end

function ClientRobEggDungeon:checkNeedShowSpaceEggEffect()
	if self.superEggInfo == nil then
		return false
	end

	return self.superEggInfo.expireOpenTime > Time.secondCache
end

function ClientRobEggDungeon:checkIsPVPStage()
	return self.escapeStage == DungeonConst.RobEggStage.PVP
end

function ClientRobEggDungeon:isSingleMode()
	return self.sceneId == Const.ROB_EGG_SCENE_CLIP_ID
end

function ClientRobEggDungeon:showDefaultA3AirWallTips()
	if self:isSingleMode() then
		return
	end

	local noticeId

	if self:checkIsPVPStage() then
		noticeId = NoticeDef.GRAB_EGG_TAKE_BOAT_TP_PVP_TIP
	else
		noticeId = NoticeDef.GRAB_EGG_NEED_ACTIVE_PVP_STATE_TIP
	end

	pg.global.showBubbleMessage(noticeId)
end

function ClientRobEggDungeon:onStatusCountDown(params)
	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
	end

	local levelData = LevelData[self.sceneId] or {}
	local maxEndTime = Time.secondCache + (levelData.readyTime or 10)

	if self:isSingleMode() or self.isPvp == true then
		self.openingCountdownEndTime = math.min(self.end_ts, maxEndTime)

		pg.global.ui.tips:showCountDownBeat(self.openingCountdownEndTime)
	else
		pg.global.ui.tips:showCountDownBeat(math.min(self.end_ts, maxEndTime))
	end

	facade:sendMsgToUI(MessageName.DUNGEON_PLAYER_COUNTDOWN)
end

function ClientRobEggDungeon:onStatusPlaying(params)
	if self:isSingleMode() or self.isPvp == true then
		self.openingCountdownEndTime = nil
	end

	ClientRobEggDungeon.super.onStatusPlaying(self, params)

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
	end

	pg.game.grabEgg:tryStartEndTimeCountdown(self.end_ts, self.isPvp)
end

function ClientRobEggDungeon:startRobEggWeatherBlockCheckTimer()
	self:clearRobEggWeatherBlockCheckTimer()

	self.robEggWeatherBlockCheckTimer = TimerManager.addRepeatTimer(1, function()
		self:refreshRobEggWeatherByCurBlock()
	end)
end

function ClientRobEggDungeon:clearRobEggWeatherBlockCheckTimer()
	if self.robEggWeatherBlockCheckTimer then
		TimerManager.removeTimer(self.robEggWeatherBlockCheckTimer)

		self.robEggWeatherBlockCheckTimer = nil
	end
end

function ClientRobEggDungeon:cacheRobEggWeather(weatherId, blockIds)
	self.robEggWeatherIdByBlockId = self.robEggWeatherIdByBlockId or {}

	for _, blockId in ipairs(blockIds) do
		self.robEggWeatherIdByBlockId[blockId] = weatherId
	end
end

function ClientRobEggDungeon:getRobEggWeatherId(blockAreaId)
	if self.robEggWeatherIdByBlockId and self.robEggWeatherIdByBlockId[blockAreaId] then
		return self.robEggWeatherIdByBlockId[blockAreaId]
	end

	if self.getWeatherByAreaId then
		return self:getWeatherByAreaId(blockAreaId)
	end
end

function ClientRobEggDungeon:refreshRobEggWeatherByCurBlock(force)
	local curBlockAreaId = pg.game and pg.game.map and pg.game.map:getCurBlockAreaId()

	if not curBlockAreaId then
		return
	end

	local weatherId = self:getRobEggWeatherId(curBlockAreaId)

	if not weatherId or weatherId <= 0 then
		return
	end

	if not force and self.robEggLastWeatherBlockId == curBlockAreaId and self.robEggLastWeatherId == weatherId then
		return
	end

	self.robEggLastWeatherBlockId = curBlockAreaId
	self.robEggLastWeatherId = weatherId

	self:refreshRobEggWeather(curBlockAreaId, weatherId)
end

function ClientRobEggDungeon:refreshRobEggWeather(blockAreaId, weatherId)
	if not pg.me then
		return
	end

	local weatherData = WeatherData[weatherId]

	if not weatherData then
		self.logger:error("rob_egg_weather_data_not_found: weatherId=%s blockAreaId=%s", weatherId, blockAreaId)

		return
	end

	if not weatherData.weatherPrefab then
		self.logger:error("rob_egg_weather_prefab_empty: weatherId=%s blockAreaId=%s", weatherId, blockAreaId)

		return
	end

	pg.game.weather:applyWeatherProfile(weatherId)
	clientLevelUtils.notifyEcsWeather()
	facade:SendMessageCommand(MessageName.WEATHER_REFRESH, {
		blockAreaId = blockAreaId
	})
	facade:sendLuaEvent(pg.me.id .. SandboxConst.COMMON_EVENT.CURRENT_AREA_WEATHER_REFRESH, {
		weatherId = weatherId
	})
end

function ClientRobEggDungeon:RPC_SC_BloomDropItems(bloomInfo)
	local bloomPos = bloomInfo.bloomPos
	local entities = bloomInfo.entities

	bloomPos = Vector3.New(bloomPos[1], bloomPos[2] + 0.5, bloomPos[3])

	for _, entId in ipairs(entities) do
		local collectItem = pg.getEntity(entId)

		if collectItem then
			collectItem:playBloomEffect(bloomPos)
		end
	end
end

function ClientRobEggDungeon:RPC_SC_RobEggWeatherChanged(weatherId, blockIds)
	if not weatherId or not blockIds then
		return
	end

	self:cacheRobEggWeather(weatherId, blockIds)
	self:refreshRobEggWeatherByCurBlock(true)
end

function ClientRobEggDungeon:destroy()
	if self:isSingleMode() or self.isPvp == true then
		self.openingCountdownEndTime = nil
	end

	self:clearRobEggWeatherBlockCheckTimer()
	appFacade.pipelineManager:TrySetWeatherProfile(nil)
	ClientRobEggDungeon.super.destroy(self)
	pg.game.map:clearMapFogMaskStatus(self.sceneId)
	pg.game.map:clearMapWarningAreaStatus(self.sceneId)
end

return ClientRobEggDungeon
