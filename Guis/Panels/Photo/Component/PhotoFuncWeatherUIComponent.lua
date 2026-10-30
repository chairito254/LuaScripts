-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Photo\\Component\\PhotoFuncWeatherUIComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("PhotoFuncWeatherUIComponent")
local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local PhotoFuncWeatherUIComponent = Class.LightClass("PhotoFuncWeatherUIComponent", UIComponent)
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local Utils = require("Common.Utils.Utils")
local MapBlockConfigData = require("Data.map_block_config_data")

PhotoFuncWeatherUIComponent.WeatherConfig = {
	{
		controlId = 0,
		id = 1
	},
	{
		controlId = 1,
		id = 2
	},
	{
		controlId = 2,
		id = 3
	},
	{
		controlId = 3,
		id = 4
	},
	{
		controlId = 8,
		id = 5
	}
}
PhotoFuncWeatherUIComponent.TimeConfig = {
	{
		controlId = 4,
		id = Const.TimePeriod.Morning
	},
	{
		controlId = 5,
		id = Const.TimePeriod.Day
	},
	{
		controlId = 6,
		id = Const.TimePeriod.Dusk
	},
	{
		controlId = 7,
		id = Const.TimePeriod.Night
	}
}

function PhotoFuncWeatherUIComponent:onCtor(info)
	if not info then
		return
	end

	self.preset = info.preset
end

function PhotoFuncWeatherUIComponent:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.listWeatherUList = self.objectReference:GetRefValue("listWeatherUList")
	self.listTimeUList = self.objectReference:GetRefValue("listTimeUList")
end

function PhotoFuncWeatherUIComponent:initView()
	self.supportedWeatherIds = self:getSupportedWeatherIds()
	self.lastWeatherId = pg.me:getWeather()

	if self.lastWeatherId == 0 then
		self.lastWeatherId = pg.game.weather.sunWeatherId
	end

	self.curWeatherId = self.lastWeatherId
	self.lastTimePeriod = pg.timePeriod
	self.curTimePeriod = self.lastTimePeriod

	function self.listWeatherUList.luaRenderItem(button, index, data)
		if not data.id then
			return
		end

		button:TryChangePage("Weather", data.controlId)
	end

	function self.listWeatherUList.luaClick(button, data)
		if not data.id then
			return
		end

		local weatherId

		if data.id == self.curWeatherId then
			weatherId = self.lastWeatherId

			if not self.supportedWeatherIds[weatherId] then
				weatherId = pg.game.weather.sunWeatherId
			end
		else
			weatherId = data.id
		end

		self.curWeatherId = weatherId

		pg.game.weather:setClientWeather(weatherId, ClientConst.WEATHER_REASON_KEY.PHOTO)

		self.preset = nil
	end

	function self.listTimeUList.luaRenderItem(button, index, data)
		if not data.id then
			return
		end

		button:TryChangePage("Weather", data.controlId)
	end

	function self.listTimeUList.luaClick(button, data)
		if not data.id then
			return
		end

		self.ctrl:hideLight()

		local timePeriod

		if data.id == self.curTimePeriod then
			timePeriod = self.curTimePeriod
		else
			timePeriod = data.id
		end

		self.curTimePeriod = timePeriod

		pg.space:setTimePeriodClient(timePeriod)
		self.ctrl:tryTriggerAllPetsAction()

		self.preset = nil
	end

	if self.preset then
		self:applyPreset(self.preset)
	end
end

function PhotoFuncWeatherUIComponent:onDestroy()
	UIComponent.onDestroy(self)
	pg.game.weather:resetClientWeather(ClientConst.WEATHER_REASON_KEY.PHOTO)

	if self.lastTimePeriod ~= self.curTimePeriod and pg.space then
		pg.space:setTimePeriodClient(self.lastTimePeriod)
	end
end

function PhotoFuncWeatherUIComponent:getSupportedWeatherIds()
	local blockId = pg.game.map:getCurBlockAreaId()
	local blockData = MapBlockConfigData[blockId]

	blockData = blockData and (blockData.weatherGroupId and MapBlockConfigData[blockData.weatherGroupId] or blockData)

	local canSubcribe = blockData and blockData.canSubcribe

	if blockData and not Utils.isTable(canSubcribe) then
		for _, config in pairs(MapBlockConfigData) do
			if config.mapAreaId == blockData.mapAreaId and Utils.isTable(config.canSubcribe) then
				canSubcribe = config.canSubcribe

				break
			end
		end
	end

	local supportedWeatherIds = {
		[pg.game.weather.sunWeatherId] = true
	}

	if not pg.space:isHomeland() and Utils.isTable(canSubcribe) then
		for _, weatherId in ipairs(canSubcribe) do
			supportedWeatherIds[weatherId] = true
		end
	else
		for _, config in ipairs(self.WeatherConfig) do
			if config.id ~= 5 then
				supportedWeatherIds[config.id] = true
			end
		end
	end

	return supportedWeatherIds
end

function PhotoFuncWeatherUIComponent:refreshUI()
	self.supportedWeatherIds = self:getSupportedWeatherIds()

	local dataList = {}

	for _, v in ipairs(self.WeatherConfig) do
		if self.supportedWeatherIds[v.id] then
			dataList[#dataList + 1] = v
		end
	end

	self.listWeatherUList:SetList(dataList)
	self.listWeatherUList:DeselectAll()

	if not self.haveRefreshed then
		dataList = {}

		for k, v in ipairs(self.TimeConfig) do
			dataList[#dataList + 1] = v
		end

		self.listTimeUList:SetList(dataList)
		self.listTimeUList:DeselectAll()

		self.haveRefreshed = true
	end

	local weatherData = self.listWeatherUList.itemData

	for index, data in pairs(weatherData) do
		if data.id == self.curWeatherId then
			self.listWeatherUList:SelectItem(index)

			break
		end
	end

	local timeData = self.listTimeUList.itemData

	for index, data in pairs(timeData) do
		if data.id == self.curTimePeriod then
			self.listTimeUList:SelectItem(index)

			break
		end
	end
end

function PhotoFuncWeatherUIComponent:applyPreset(preset)
	self.supportedWeatherIds = self:getSupportedWeatherIds()

	local weatherId = preset.weatherId

	if weatherId and self.supportedWeatherIds[weatherId] then
		self.curWeatherId = weatherId

		pg.game.weather:setClientWeather(weatherId, ClientConst.WEATHER_REASON_KEY.PHOTO)
	end

	local timeId = preset.timeId

	if timeId then
		self.curTimePeriod = timeId

		pg.space:setTimePeriodClient(timeId)
	end
end

function PhotoFuncWeatherUIComponent:saveToPreset(preset)
	preset.weatherId = self.curWeatherId
	preset.timeId = self.curTimePeriod
end

return PhotoFuncWeatherUIComponent
