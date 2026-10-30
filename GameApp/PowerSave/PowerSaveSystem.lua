-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\PowerSave\\PowerSaveSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local Time = require("Core.Common.Time")
local ClientConst = require("Const.ClientConst")
local UIConst = require("Const.UIConst")
local ClientSettingUtils = require("Utils.ClientSettingUtils")
local PowerSaveSystem = Class.LightClass("PowerSaveSystem", SystemBase)

PowerSaveSystem.STATE_TRACKING = 1
PowerSaveSystem.STATE_OPENING = 2
PowerSaveSystem.STATE_ACTIVE = 3
PowerSaveSystem.EXIT_DELAY_SECONDS = 0.05
PowerSaveSystem.STANDBY_SCREEN_BRIGHTNESS = 0.15
PowerSaveSystem.STANDBY_TARGET_FRAME_RATE = 10

function PowerSaveSystem:onCtor()
	self.state = PowerSaveSystem.STATE_TRACKING
	self.hasFocus = false
	self.idleStartTime = Time.realSecondCache
	self.exitTimerId = nil
	self.savedScreenBrightness = nil
	self.standbyFrameRateApplied = false
	self.gmBlockEnter = false
end

function PowerSaveSystem:onInit()
	self:resetIdleTimer()
end

function PowerSaveSystem:resetIdleTimer()
	self.idleStartTime = Time.realSecondCache
end

function PowerSaveSystem:hasAnyInput()
	return pg.global.inputMgr and pg.global.inputMgr:HasAnyInput() == true
end

function PowerSaveSystem:setGmBlockEnter(block)
	self.gmBlockEnter = block == true

	if self.gmBlockEnter then
		self:exitPowerSaveMode(true)
	end
end

function PowerSaveSystem:isGmBlockEnter()
	return self.gmBlockEnter == true
end

function PowerSaveSystem:getIdleTrackBlockReason()
	if self.gmBlockEnter then
		return "gmBlock"
	end

	if not self.hasFocus then
		return "notFocused"
	end

	if not pg.game.setting:isPowerSaveSupportedPlatform() then
		return "unsupportedPlatform"
	end

	if pg.game.gameState ~= ClientConst.GS_PLAYGAME then
		return "gameState=" .. tostring(pg.game.gameState)
	end

	if not pg.me then
		return "noPlayer"
	end

	if not pg.space then
		return "noSpace"
	end

	if pg.game.loading and not pg.game.loading:isFinished() then
		return "loading"
	end

	if pg.me.isInCombat and pg.me:isInCombat() then
		return "inCombat"
	end

	return nil
end

function PowerSaveSystem:canTrackIdle()
	return self:getIdleTrackBlockReason() == nil
end

function PowerSaveSystem:onTick()
	local hasInput = self:hasAnyInput()

	if self.state ~= PowerSaveSystem.STATE_TRACKING then
		if hasInput then
			self:requestExit()
		elseif self.state == PowerSaveSystem.STATE_ACTIVE and not pg.global.ui:checkUIOpen(UIConst.UI_ID_STANDBY) then
			self:exitPowerSaveMode(false)
		end

		return
	end

	if hasInput then
		self:resetIdleTimer()

		return
	end

	if self:getIdleTrackBlockReason() then
		self:resetIdleTimer()

		return
	end

	local idleSeconds = ClientSettingUtils.get_savePowerMode() * 60

	if idleSeconds > Time.realSecondCache - self.idleStartTime then
		return
	end

	self:enterPowerSaveMode()
end

function PowerSaveSystem:applyStandbyBrightness()
	if self.savedScreenBrightness ~= nil then
		return
	end

	local screen = CS.UnityEngine.Screen

	self.savedScreenBrightness = screen.brightness
	screen.brightness = PowerSaveSystem.STANDBY_SCREEN_BRIGHTNESS
end

function PowerSaveSystem:restoreScreenBrightness()
	if self.savedScreenBrightness == nil then
		return
	end

	CS.UnityEngine.Screen.brightness = self.savedScreenBrightness
	self.savedScreenBrightness = nil
end

function PowerSaveSystem:applyStandbyFrameRate()
	if self.standbyFrameRateApplied then
		return
	end

	CS.UnityEngine.Application.targetFrameRate = PowerSaveSystem.STANDBY_TARGET_FRAME_RATE
	self.standbyFrameRateApplied = true
end

function PowerSaveSystem:restoreStandbyFrameRate()
	if not self.standbyFrameRateApplied then
		return
	end

	local setting = pg.game and pg.game.setting

	if setting and setting.applyMobileFramerate then
		setting:applyMobileFramerate()
	end

	self.standbyFrameRateApplied = false
end

function PowerSaveSystem:enterPowerSaveMode()
	if self.state ~= PowerSaveSystem.STATE_TRACKING then
		return
	end

	self.state = PowerSaveSystem.STATE_OPENING

	self:applyStandbyFrameRate()

	if pg.global.ui.setUIHideConfig then
		pg.global.ui:setUIHideConfig(UIConst.UI_HIDE_KEY.AFK, UIConst.UI_ID_STANDBY, true)
	end

	pg.global.ui:open(UIConst.UI_ID_STANDBY, nil, function()
		if self.state ~= PowerSaveSystem.STATE_OPENING then
			pg.global.ui:closeImmediately(UIConst.UI_ID_STANDBY)

			return
		end

		self.state = PowerSaveSystem.STATE_ACTIVE

		self:applyStandbyBrightness()
	end, function()
		self:onStandbyClosed()
	end)
end

function PowerSaveSystem:requestExit()
	if self.state == PowerSaveSystem.STATE_TRACKING or self.exitTimerId then
		return
	end

	self.exitTimerId = self:startTimer(function()
		self.exitTimerId = nil

		self:exitPowerSaveMode(true)
	end, PowerSaveSystem.EXIT_DELAY_SECONDS)
end

function PowerSaveSystem:exitPowerSaveMode(closeUI)
	if self.exitTimerId then
		self:killTimer(self.exitTimerId)
	end

	self.exitTimerId = nil
	self.state = PowerSaveSystem.STATE_TRACKING

	self:resetIdleTimer()

	local standbyStillOpen = closeUI and pg.global.ui and pg.global.ui:checkUIOpen(UIConst.UI_ID_STANDBY)

	if not standbyStillOpen then
		self:restoreScreenBrightness()
	end

	self:restoreStandbyFrameRate()

	if standbyStillOpen then
		local ctrl = pg.global.ui.tryGetCtrlByUid and pg.global.ui:tryGetCtrlByUid(UIConst.UI_ID_STANDBY)

		if not ctrl or not ctrl.checkUIClosing or not ctrl:checkUIClosing() then
			pg.global.ui:close(UIConst.UI_ID_STANDBY)
		end
	end
end

function PowerSaveSystem:onStandbyClosed()
	self:restoreScreenBrightness()

	if self.state ~= PowerSaveSystem.STATE_TRACKING then
		self:exitPowerSaveMode(false)
	end
end

function PowerSaveSystem:onAppFocusChanged(focus)
	self.hasFocus = focus == true

	self:exitPowerSaveMode(true)
end

function PowerSaveSystem:onClear()
	self:exitPowerSaveMode(true)
end

function PowerSaveSystem:onDestroy()
	self:exitPowerSaveMode(true)
end

function PowerSaveSystem:onBackToLogin()
	self:exitPowerSaveMode(true)
end

function PowerSaveSystem:onDisconnected()
	self:exitPowerSaveMode(true)
end

function PowerSaveSystem:onPlayerDestroy()
	self:exitPowerSaveMode(true)
end

function PowerSaveSystem:onWorldSceneDestroy()
	self:exitPowerSaveMode(true)
end

return PowerSaveSystem
