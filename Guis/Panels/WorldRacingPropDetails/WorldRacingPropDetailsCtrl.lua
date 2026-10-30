-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingPropDetails\\WorldRacingPropDetailsCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("WorldRacingPropDetailsCtrl")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientConst = require("Const.ClientConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local Utils = require("Common.Utils.Utils")
local WorldRacingPropData = require("Data.world_racing_prop_data")
local WorldRacingPropDetailsCtrl = Class.LightClass("WorldRacingPropDetailsCtrl", UICtrl)
local TITLE_TEXT_KEY = "OPEN_WORLD_RACING_TRACK_ITEM_POOL"
local VIDEO_LOAD_TIMEOUT = 10

function WorldRacingPropDetailsCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.videoRequestSerial = 0
end

function WorldRacingPropDetailsCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:stopVideo()

	self.selectedProp = nil

	if not self:refreshPropData() then
		self:dismiss()

		return
	end

	ClientTextUtils.setText(self.view.titleUBaseText, pg.getGameString(TITLE_TEXT_KEY))

	self.selectedProp = self.propList[1]

	self.view.propListUList:SetList(self.propList)
	self:refreshPropDetails()
	self:startVideo()
end

function WorldRacingPropDetailsCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:dismiss()
	end

	function self.view.propListUList.luaRenderItem(button, index, data)
		self:renderPropItem(button, data)
	end
end

function WorldRacingPropDetailsCtrl:refreshPropData()
	local videoField = Utils.isOverseas() and "petshowVideoINT" or "propVideo"

	self.propList = {}

	for propId, config in pairs(WorldRacingPropData) do
		if type(propId) ~= "number" or type(config.propSort) ~= "number" or config.propName == nil or config.propDesc == nil or type(config.propIcon) ~= "string" or config.propIcon == "" or type(config[videoField]) ~= "string" or config[videoField] == "" then
			logger:error("world_racing_prop_data: invalid config, propId=%s; propSort, propName, propDesc, propIcon and %s are required", tostring(propId), videoField)

			return false
		end

		self.propList[#self.propList + 1] = {
			propId = propId,
			config = config,
			videoUrl = self:getPropVideoUrl(config[videoField])
		}
	end

	if #self.propList == 0 then
		logger:error("world_racing_prop_data: 大世界竞速_道具表 has no exported props")

		return false
	end

	table.sort(self.propList, function(a, b)
		if a.config.propSort ~= b.config.propSort then
			return a.config.propSort < b.config.propSort
		end

		return a.propId < b.propId
	end)

	return true
end

function WorldRacingPropDetailsCtrl:getPropVideoUrl(configuredUrl)
	configuredUrl = string.gsub(configuredUrl, "\\", "/")

	if string.match(configuredUrl, "^https?://") then
		return configuredUrl
	end

	configuredUrl = string.gsub(configuredUrl, "^/+", "")
	configuredUrl = string.gsub(configuredUrl, "^public/video/m/", "")
	configuredUrl = string.gsub(configuredUrl, "^public/video/", "")

	local host = Utils.isOverseas() and ClientConst.SERVER_LIST.GLOBAL_HOST or ClientConst.SERVER_LIST.CN_HOST
	local videoPath = IS_MOBILE and "/public/video/m/" or "/public/video/"

	return "https://" .. host .. videoPath .. configuredUrl
end

function WorldRacingPropDetailsCtrl:renderPropItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")

	ClientTextUtils.setText(objectReference:GetRefValue("txtNameUBaseText"), pg.getLocalizationText(data.config.propName))

	objectReference:GetRefValue("iconUImage").url = data.config.propIcon

	button:SetSelected(self.selectedProp == data)

	function button.luaClick()
		self:selectProp(data)
	end
end

function WorldRacingPropDetailsCtrl:selectProp(data)
	if self.selectedProp == data then
		return
	end

	self.selectedProp = data

	self.view.propListUList:RefreshList()
	self:refreshPropDetails()
	self:startVideo()
end

function WorldRacingPropDetailsCtrl:refreshPropDetails()
	local config = self.selectedProp.config

	ClientTextUtils.setText(self.view.propNameUBaseText, pg.getLocalizationText(config.propName))
	ClientTextUtils.setText(self.view.propDescUBaseText, pg.getLocalizationText(config.propDesc))
	self.view.descUScrollRect:SetNormalizedScrollPositionEx(0, 1)
end

function WorldRacingPropDetailsCtrl:onShow()
	UICtrl.onShow(self)

	if self.selectedProp and not self.activeVideoRequestSerial then
		self:startVideo()
	end
end

function WorldRacingPropDetailsCtrl:setVideoVisible(visible)
	local videoPlayer = self.view.videoPlayer
	local color = videoPlayer.color

	videoPlayer.color = Color(color.r, color.g, color.b, visible and 1 or 0)

	self.view:setVideoPlaceholderVisible(not visible)
end

function WorldRacingPropDetailsCtrl:onVideoFirstFrameReady(requestSerial)
	if self.activeVideoRequestSerial ~= requestSerial then
		return
	end

	self:clearVideoLoadTimer()
	self:setVideoVisible(true)
end

function WorldRacingPropDetailsCtrl:clearVideoLoadTimer()
	if self.videoLoadTimer then
		self:killTimer(self.videoLoadTimer)

		self.videoLoadTimer = nil
	end
end

function WorldRacingPropDetailsCtrl:startVideo()
	self:stopVideo()

	local videoPlayer = self.view.videoPlayer

	self.videoRequestSerial = self.videoRequestSerial + 1

	local requestSerial = self.videoRequestSerial

	self.activeVideoRequestSerial = requestSerial
	videoPlayer.videoLoop = true
	videoPlayer.autoPlay = false

	function videoPlayer.luaVideoPrepared()
		if self.activeVideoRequestSerial == requestSerial then
			videoPlayer:PlayVideo()
		end
	end

	function videoPlayer.luaVideoFirstFrameReady()
		self:onVideoFirstFrameReady(requestSerial)
	end

	if videoPlayer.url == self.selectedProp.videoUrl and videoPlayer.firstFrameReady then
		videoPlayer.luaVideoPrepared = nil

		videoPlayer:Seek(0)
		videoPlayer:PlayVideo()
		self:onVideoFirstFrameReady(requestSerial)

		return
	end

	if videoPlayer.url == self.selectedProp.videoUrl then
		videoPlayer.url = ""
	end

	self.videoLoadTimer = self:startTimer(function()
		if self.activeVideoRequestSerial == requestSerial then
			self.videoLoadTimer = nil

			self:onVideoLoadFailed(requestSerial)
		end
	end, VIDEO_LOAD_TIMEOUT)

	videoPlayer:SetVideoUrlWithCallback(self.selectedProp.videoUrl, nil, function()
		self:onVideoLoadFailed(requestSerial)
	end)
end

function WorldRacingPropDetailsCtrl:onVideoLoadFailed(requestSerial)
	if self.activeVideoRequestSerial ~= requestSerial then
		return
	end

	logger:error("world_racing_prop_data: video load failed, propId=%s", tostring(self.selectedProp.propId))
	self:stopVideo()
	self.view.videoPlayer:CloseVideo()
end

function WorldRacingPropDetailsCtrl:stopVideo()
	self.activeVideoRequestSerial = nil

	self:clearVideoLoadTimer()

	local videoPlayer = self.view and self.view.videoPlayer

	if not videoPlayer then
		return
	end

	videoPlayer.luaVideoPrepared = nil
	videoPlayer.luaVideoFirstFrameReady = nil

	self:setVideoVisible(false)
	videoPlayer:StopVideo()
end

function WorldRacingPropDetailsCtrl:onHide()
	self:stopVideo()
	UICtrl.onHide(self)
end

function WorldRacingPropDetailsCtrl:onDestroy()
	self:stopVideo()
	UICtrl.onDestroy(self)
end

return WorldRacingPropDetailsCtrl
