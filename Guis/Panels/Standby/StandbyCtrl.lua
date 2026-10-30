-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Standby\\StandbyCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local UIConst = require("Const.UIConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local StandbyCtrl = Class.LightClass("StandbyCtrl", UICtrl)
local WEEKDAY_TEXT_KEYS = {
	"STANDBY_WEEKDAY_SUN",
	"STANDBY_WEEKDAY_MON",
	"STANDBY_WEEKDAY_TUE",
	"STANDBY_WEEKDAY_WED",
	"STANDBY_WEEKDAY_THU",
	"STANDBY_WEEKDAY_FRI",
	"STANDBY_WEEKDAY_SAT"
}
local TIME_SPRITE_NAMES = {
	["5"] = "UI_Icon_StandbyNum_05",
	["8"] = "UI_Icon_StandbyNum_08",
	["4"] = "UI_Icon_StandbyNum_04",
	["9"] = "UI_Icon_StandbyNum_09",
	["3"] = "UI_Icon_StandbyNum_03",
	[":"] = "UI_Icon_StandbyNum_Dot",
	["2"] = "UI_Icon_StandbyNum_02",
	["1"] = "UI_Icon_StandbyNum_01",
	["0"] = "UI_Icon_StandbyNum_00",
	["7"] = "UI_Icon_StandbyNum_07",
	["6"] = "UI_Icon_StandbyNum_06"
}

function StandbyCtrl:addListener()
	function self.view.backGroundCloseUButton.luaClick()
		self:close()
	end
end

function StandbyCtrl:prepareWorldBeforeCloseAnim()
	local ui = pg.global.ui

	if ui and ui.fullscreenUID == UIConst.UI_ID_STANDBY then
		ui:enableMainCamera(true)
	end

	local powerSave = pg.game and pg.game.powerSave

	if powerSave and powerSave.restoreScreenBrightness then
		powerSave:restoreScreenBrightness()
	end
end

function StandbyCtrl:close()
	self:prepareWorldBeforeCloseAnim()
	UICtrl.close(self)
end

function StandbyCtrl:getTimeSpriteText(ts)
	local hm = os.date("%H:%M", ts)
	local text = ""

	for i = 1, #hm do
		local spriteName = TIME_SPRITE_NAMES[hm:sub(i, i)]

		if spriteName then
			text = text .. string.format("<sprite name=\"%s\">", spriteName)
		end
	end

	return text
end

function StandbyCtrl:getWeekdayText(ts)
	local key = WEEKDAY_TEXT_KEYS[os.date("*t", ts).wday]
	local text = key and pg.getGameString(key)

	if not text or text == "" or text == key then
		return ""
	end

	return text
end

function StandbyCtrl:refreshDisplay()
	local now = os.time()

	ClientTextUtils.setText(self.view.txtTimeUSDFText, self:getTimeSpriteText(now))

	local dateText = pg.getLocalizationTimeYMD(now, true)
	local weekdayText = self:getWeekdayText(now)

	if weekdayText ~= "" then
		dateText = dateText .. "·" .. weekdayText
	end

	ClientTextUtils.setText(self.view.txtDateUSDFText, dateText)

	local batteryLevel = CS.UnityEngine.SystemInfo.batteryLevel

	self.view.batteryProgressUProgress.value = batteryLevel >= 0 and batteryLevel or 1

	local reachability = CS.UnityEngine.Application.internetReachability
	local signalPage = 0

	if reachability == CS.UnityEngine.NetworkReachability.ReachableViaCarrierDataNetwork then
		signalPage = 1
	elseif reachability == CS.UnityEngine.NetworkReachability.ReachableViaLocalAreaNetwork then
		signalPage = 3
	end

	self.view.btnWifiUButton:TryChangePage("SignalIntensity", signalPage)
end

function StandbyCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:refreshDisplay()

	self.refreshTimerId = self:startTimer(function()
		self:refreshDisplay()
	end, 1, true)
end

function StandbyCtrl:onHide()
	self:killTimer(self.refreshTimerId)

	self.refreshTimerId = nil

	UICtrl.onHide(self)
end

function StandbyCtrl:onDestroy()
	self:killTimer(self.refreshTimerId)

	self.refreshTimerId = nil

	UICtrl.onDestroy(self)
end

return StandbyCtrl
