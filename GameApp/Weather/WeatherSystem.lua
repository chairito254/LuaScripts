-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Weather\\WeatherSystem.lua

local LoggerConst = require("Core.Log.LoggerConst")
local LoggerManager = require("Core.Log.LoggerManager")
local logger = LoggerManager.getLogger("DialogueItemCmd")
local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local SceneData = require("Data.scene_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Const = require("Common.Const.Const")
local SystemBase = require("GameApp.Core.SystemBase")
local ClientConst = require("Const.ClientConst")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local WeatherData = require("Data.weather_data")
local TimerManager = require("Core.Timer.TimerManager")
local SandboxConst = require("Common.Const.SandboxConst")
local TriggerConst = require("Common.Const.TriggerConst")
local WeatherSystem = Class.LightClass("WeatherSystem", SystemBase)

function WeatherSystem:onCtor()
	SystemBase.onCtor(self)

	self.sunWeatherId = 1
	self.todTimes = {}
	self.clientWeatherReasonKey = nil
end

function WeatherSystem:onInit()
	SystemBase.onInit(self)
	self:onClear()
end

function WeatherSystem:onClear()
	self.areaTimePeriod = {}
	self.areaTimePeriodOrder = {}

	self:clearWeatherTimers()
	self:clearClientWeather()
end

function WeatherSystem:onDestroy()
	self.areaTimePeriod = {}
	self.areaTimePeriodOrder = {}

	self:clearWeatherTimers()
	self:clearClientWeather()
end

function WeatherSystem:onSceneLoaded(sceneId, sceneName)
	self:refreshWeather()
end

function WeatherSystem:onSceneUnloaded(sceneId, sceneName)
	self.areaTimePeriod = {}
	self.areaTimePeriodOrder = {}

	self:clearWeatherTimers()
end

function WeatherSystem:enterArea(areaId)
	local areaData = pg.me.space and pg.me.space:getAreaData(areaId)

	if areaData and areaData.timePeriod and areaData.timePeriod ~= 0 then
		if areaData.timePeriod ~= self:getTimePeriod() then
			pg.space:timePeriodSwitch(areaData.timePeriod)
		end

		self.areaTimePeriod[areaId] = areaData.timePeriod

		RemoveTableItem(self.areaTimePeriodOrder, areaId, true)

		self.areaTimePeriodOrder[#self.areaTimePeriodOrder + 1] = areaId
	end
end

function WeatherSystem:exitArea(areaId)
	local oldTimePeriod = self:getTimePeriod()
	local isCurrentArea = self.areaTimePeriodOrder[#self.areaTimePeriodOrder] == areaId

	self.areaTimePeriod[areaId] = nil

	RemoveTableItem(self.areaTimePeriodOrder, areaId, true)

	if isCurrentArea and self:hasAreaTimePeriod() then
		local timePeriod = self:getTimePeriod()

		if timePeriod ~= oldTimePeriod then
			pg.space:timePeriodSwitch(timePeriod)
		end
	end
end

function WeatherSystem:exitAllArea()
	self.areaTimePeriod = {}
	self.areaTimePeriodOrder = {}
end

function WeatherSystem:hasAreaTimePeriod()
	return next(self.areaTimePeriod) ~= nil
end

function WeatherSystem:getTimePeriod()
	local areaId = self.areaTimePeriodOrder[#self.areaTimePeriodOrder]

	if areaId then
		return self.areaTimePeriod[areaId]
	end

	return pg.timePeriod
end

function WeatherSystem:refreshWeather()
	self:clearWeatherTimers()

	self.initTimer = TimerManager.addTimer(0.5, function()
		self.initTimer = nil
		self.blockTimer = TimerManager.addRepeatTimer(1, function()
			self:refreshCurrentWeather()
		end)

		self:refreshCurrentWeather()
	end)
end

function WeatherSystem:refreshCurrentWeather()
	local space = pg.space
	local player = pg.me

	if not space or not player or player.space ~= space then
		return
	end

	local blockId = pg.game.map:getCurBlockAreaId()
	local weatherId = player:getWeather()
	local oldWeatherId = self.lastWeatherId
	local isInitial = oldWeatherId == nil
	local needRefresh = isInitial
	local meteorologyId = 0

	if space:isHomeland() then
		needRefresh = needRefresh or oldWeatherId ~= weatherId
	elseif isInitial or self.lastBlockId ~= blockId then
		meteorologyId = player:getAreaMeteorology(blockId)

		if not isInitial then
			oldWeatherId = player:getWeatherByAreaId(self.lastBlockId)

			local oldMeteorologyId = player:getAreaMeteorology(self.lastBlockId)

			needRefresh = oldWeatherId ~= weatherId or oldMeteorologyId ~= meteorologyId
		end
	end

	self.lastBlockId = blockId
	self.lastWeatherId = weatherId

	if not needRefresh then
		return
	end

	self:applyWeatherProfile(weatherId)

	if isInitial then
		self:initWeatherEffects(weatherId, meteorologyId)
	end

	self:notifyWeatherChange(oldWeatherId, weatherId, blockId, isInitial)
end

function WeatherSystem:applyWeatherProfile(weatherId)
	if self.clientWeatherReasonKey ~= nil then
		return
	end

	local renderWeatherId = weatherId > 0 and weatherId or self.sunWeatherId

	appFacade.pipelineManager:TrySetWeatherProfile(WeatherData[renderWeatherId].weatherPrefab)
end

function WeatherSystem:initWeatherEffects(weatherId, meteorologyId)
	local enableAurora = false

	if not pg.space:isHomeland() then
		if weatherId > 0 then
			for meteorId, state in pairs(pg.me.meteorDict) do
				if state == 1 then
					pg.me:CreateImpactObj(meteorId)
				end
			end

			enableAurora = meteorologyId > 0

			if enableAurora then
				pg.me:recordMeteorologyTime()
				pg.me:startMeteorologyTimer()
			end
		else
			enableAurora = Utils.isSpaceCatchRogueDungeon(Utils.getSpaceType(pg.space.sceneId))
		end
	end

	appFacade.pipelineManager:TrySetAuroraState(enableAurora)
end

function WeatherSystem:notifyWeatherChange(oldWeatherId, weatherId, blockId, isInitial)
	local space = pg.space
	local isHomeland = space:isHomeland()

	if isHomeland then
		clientLevelUtils.notifyEcsWeather()
		pg.game.audio:refreshWeatherInfo(blockId)
		space:_notifyWeatherChange(oldWeatherId, weatherId, blockId)
		pg.me:tryClientTriggerAll(TriggerConst.TRIGGER_IN_TIME_WEATHER_BLOCK)
	elseif weatherId > 0 or not isInitial then
		facade:SendMessageCommand(MessageName.WEATHER_REFRESH, {
			blockAreaId = blockId
		})
	end

	if isHomeland or not isInitial then
		facade:sendLuaEvent(pg.me.id .. SandboxConst.COMMON_EVENT.CURRENT_AREA_WEATHER_REFRESH, {
			weatherId = weatherId
		})
	end
end

function WeatherSystem:setClientWeather(weatherId, reasonKey)
	local cfg = WeatherData[weatherId]

	if cfg == nil then
		return
	end

	self.clientWeatherReasonKey = reasonKey

	appFacade.pipelineManager:TrySetWeatherProfile(cfg.weatherPrefab)
end

function WeatherSystem:resetClientWeather(reasonKey)
	if self.clientWeatherReasonKey == nil or self.clientWeatherReasonKey ~= reasonKey then
		return
	end

	self:clearClientWeather()
	self:applyWeatherProfile(pg.me and pg.me:getWeather() or 0)
end

function WeatherSystem:clearClientWeather()
	self.clientWeatherReasonKey = nil
end

function WeatherSystem:clearWeatherTimers()
	self.lastWeatherId = nil
	self.lastBlockId = nil

	if self.blockTimer then
		TimerManager.removeTimer(self.blockTimer)
	end

	if self.initTimer then
		TimerManager.removeTimer(self.initTimer)
	end
end

function WeatherSystem:setTodTime(key, enable, hour, min, timePeriod)
	self.todTimes[key] = {
		key = key,
		enable = enable,
		hour = hour,
		min = min,
		timePeriod = timePeriod,
		priority = Const.TOD_TIME_KEY_PRIORITY[key] or -1
	}

	local curTodTime = self:getCurTodTime()

	if curTodTime and pg.me and pg.me.space then
		local st, err = xpcall(function()
			self:changeTodTime(curTodTime.hour, curTodTime.min, curTodTime.timePeriod)
		end, debug.traceback)

		if not st and LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("%s onRenderTimePeriodChange failed, %s", self:repr(), err)
		end
	end
end

function WeatherSystem:changeTodTime(hour, min, timePeriod)
	local sceneData = SceneData[pg.space.sceneId]

	if sceneData then
		local sceneName = sceneData.file
		local sceneType = ClientConst.TodScene[sceneName] or ClientConst.TodSceneSceneId[pg.space.sceneId]

		if sceneType == nil then
			timePeriod = -1
		end

		if sceneType == ClientConst.SetTime then
			appFacade.pipelineManager:OnChangeTime(hour, min, timePeriod, true)
		else
			appFacade.pipelineManager:OnChangeTime(hour, min, timePeriod, false)
		end
	end
end

function WeatherSystem:getCurTodTime()
	local res

	for _, todTime in pairs(self.todTimes) do
		if todTime.enable and (res == nil or todTime.priority > res.priority) then
			res = todTime
		end
	end

	return res
end

function WeatherSystem:backToHome()
	self:clearWeatherTimers()
	self:clearClientWeather()
	self:applyWeatherProfile(self.sunWeatherId)
end

function WeatherSystem:refreshTideState()
	local player = pg.me

	if player and player:isInTeam() then
		for id, info in pairs(player:getCurTeamInfo().membersInfo) do
			if info.entityId ~= player.id then
				local other = pg.getEntity(info.entityId)

				if Utils.isMainPlayer(other) then
					player = other

					break
				end
			end
		end
	end

	if not player or not pg.space then
		return
	end

	local tideState = Utils.getTideStateId(player)
	local mainSceneId = Utils.getPhaseMainSceneId(pg.space.sceneId) or pg.space.sceneId

	if mainSceneId ~= 3003 then
		return
	end

	if tideState == Const.TIDE_STATES.HIGH_TIDE then
		CS.FunPlus.WorldX.GameApp.Sandbox.SandboxUtils.SetOceanHeight(true, 3)
	else
		CS.FunPlus.WorldX.GameApp.Sandbox.SandboxUtils.SetOceanHeight(false, 3)
	end
end

return WeatherSystem
