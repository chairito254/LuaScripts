-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LoadingShow\\LoadingShowCtrl.lua

local LoggerManager = require("Core.Log.LoggerManager")
local logger = LoggerManager.getLogger("LoadingShowCtrl")
local LoggerConst = require("Core.Log.LoggerConst")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local LoadingShowCtrl = Class.LightClass("LoadingShowCtrl", UICtrl)
local TimerManager = require("Core.Timer.TimerManager")
local BlackScreenData = require("Data.black_screen_data")
local NpcDialogueData = require("Data.npc_dialogue_data")
local Utils = require("Common.Utils.Utils")
local ClientConst = require("Const.ClientConst")
local LuaUIUtils = require("Utils.LuaUIUtils")

LoadingShowCtrl.messages = {
	[MessageName.SCENE_LOADED] = {
		"onSceneLoaded",
		true
	}
}

local CHANGE_MODE = {
	NONAUTO = 1,
	AUTO = 0
}

local function getAnimationSpeed(duration, defaultDuration)
	duration = tonumber(duration)

	return duration and duration > 0 and defaultDuration / duration or 1
end

function LoadingShowCtrl:onCreate(info)
	UICtrl.onCreate(self)

	self.SCREEN_IN_ANI = "VX_Pb_WhiteScreen_In"
	self.SCREEN_IN_ANI_TIME = 0.5
	self.SCREEN_OUT_ANI = "VX_Pb_WhiteScreen_Out"
	self.SCREEN_OUT_ANI_TIME = 0.5
end

function LoadingShowCtrl:onOpen(info)
	info = info or {}

	self:killAllLoadingTimers()

	self.deltaTime = 0.03
	self.oldProgress = 0
	self.closeEvent = nil
	self.closeToken = nil
	self.openToken = {}
	self.isScreenReady = false
	self.pendingLoadCompleted = false
	self.screenConfig = nil
	self.allDialogs = nil
	self.isreload = info.isreload
	self.isClosingScreen = false
	self.curDialogIndex = 1
	self.isScanFinished = false
	self.btnCanClose = false
	self.isLoadFinished = false
	self.changeMode = CHANGE_MODE.AUTO
	self.dialogsLength = 0

	self:refresh(info)
end

function LoadingShowCtrl:onHide()
	self.openToken = nil
	self.closeToken = nil

	self:killAllLoadingTimers()
	UICtrl.onHide(self)

	if pg.global.scene.blackScreenId ~= 0 then
		pg.global.scene.blackScreenId = 0
	end
end

function LoadingShowCtrl:onDestroy()
	self.openToken = nil
	self.closeToken = nil

	self:killAllLoadingTimers()
	UICtrl.onDestroy(self)
end

function LoadingShowCtrl:tryClosePanel(callback)
	self.closeEvent = callback
	self.isLoadFinished = true
	self.isreload = nil

	self:loadCompleted()
end

function LoadingShowCtrl:refresh(param)
	self.view:setNextBtnVisible(false)

	if param == nil or param.id == nil then
		self:closeScreen(true)

		return
	end

	self.screenConfig = BlackScreenData[param.id]

	if self.screenConfig == nil then
		self:closeScreen(true)

		return
	end

	if self.screenConfig.inOrNot == 1 and not self.screenConfig.backgroundVideo then
		local openToken = self.openToken
		local blendSpeed = getAnimationSpeed(self.screenConfig.inTime, self.SCREEN_IN_ANI_TIME)

		UIUtils.PlayAnimation(self.view.mainAni, self.SCREEN_IN_ANI, function()
			if self.openToken ~= openToken or self.isClosingScreen then
				return
			end

			self:refreshAll(param)
		end, blendSpeed)
	else
		self:refreshAll(param)
	end
end

function LoadingShowCtrl:refreshAll(param)
	if param.isreload then
		self.view:setLoadProgressVisible(false)
	else
		self.view:setLoadProgressVisible(true)
		self:startLoading()
	end

	self:refreshScreen()

	self.isScreenReady = true

	if self.pendingLoadCompleted then
		self.pendingLoadCompleted = false

		self:loadCompleted()
	end
end

function LoadingShowCtrl:refreshScreen()
	self.view:changeLoadingStyle((self.screenConfig.type or 1) - 1)
	self:refreshBackground()

	local dialogueId = self.screenConfig.dialogue

	self.allDialogs = Utils.deepCopyTable(NpcDialogueData[dialogueId])

	if self.allDialogs == nil or #self.allDialogs == 0 then
		self.view:setNextBtnVisible(false)
		self.view:refreshTxtContent("")

		self.changeMode = CHANGE_MODE.AUTO
		self.dialogsLength = 0
	else
		local intervalTime = tonumber(self.screenConfig.intervalTime) or 1

		if intervalTime <= 0 then
			intervalTime = 1
		end

		self.changeMode = self.screenConfig.loadingCompleteClose or CHANGE_MODE.AUTO
		self.dialogsLength = #self.allDialogs

		if self.changeMode == CHANGE_MODE.AUTO then
			self.view:setNextBtnVisible(false)
			self:autoPlayTxt(intervalTime)
		else
			self.isScanFinished = self.curDialogIndex == self.dialogsLength

			self.view:setNextBtnVisible(true)
			self:refreshNextBtnState()
			self:refreshTxtContent()
		end
	end
end

function LoadingShowCtrl:refreshBackground()
	local backgroundVideo = self.screenConfig.backgroundVideo
	local backgroundPicture = self.screenConfig.backgroundPicture
	local backgroundType = 0

	if backgroundVideo then
		if self.view.videoPlayer then
			backgroundType = 1
		end
	elseif backgroundPicture ~= nil and self.view.picImg then
		backgroundType = 2
	end

	self.view:changeBackgroundType(backgroundType)

	if backgroundType == 1 then
		self.view.videoPlayer.resID = backgroundVideo
	elseif backgroundType == 2 then
		self.view.picImg.url = backgroundPicture
	end
end

function LoadingShowCtrl:autoPlayTxt(intervalTime)
	self:killTickTimer()
	self:refreshTxtContent()

	self.tickTimer = self:startScaleTimer(function()
		self:onAutoPlayTxt()
	end, intervalTime, true)
end

function LoadingShowCtrl:onAutoPlayTxt()
	self.curDialogIndex = self.curDialogIndex + 1

	self:clampDialogIndex()
	self:refreshTxtContent()
end

function LoadingShowCtrl:refreshTxtContent()
	if self.allDialogs == nil then
		return
	end

	local curDialog = self.allDialogs[self.curDialogIndex]

	if curDialog then
		self.view:refreshTxtContent(curDialog.chat)
	end
end

function LoadingShowCtrl:clampDialogIndex()
	if self.curDialogIndex > self.dialogsLength then
		self.curDialogIndex = 1
	end
end

function LoadingShowCtrl:startLoading()
	self:killProgressTimer()

	self.ticId = TimerManager.addRepeatTimer(self.deltaTime, function()
		local progress = pg.game.loading:getProgress()

		self:setProgress(progress)
	end)

	local progress = 0

	self:setProgress(progress)
end

function LoadingShowCtrl:setProgress(progress)
	if not progress or progress < self.oldProgress then
		return
	end

	if pg.game.loading.curSceneId == ClientConst.SCENE_LOADING_ID or pg.game.loading.curSceneId == ClientConst.SCENE_LOGIN_ID then
		return
	end

	if progress >= 1 then
		progress = 1

		self:killProgressTimer()
	end

	self.oldProgress = progress

	if self.view ~= nil then
		self.view:updateLoadProgress(progress)
	end
end

function LoadingShowCtrl:addListener()
	local function onClick()
		self:onBtnNextClickHandler()
	end

	self.view.btnNextUButton.luaClick = onClick
	self.view.backGroundCloseUButton.luaClick = onClick
end

function LoadingShowCtrl:onBtnNextClickHandler()
	if not self.isScreenReady or self.isClosingScreen or self.dialogsLength == 0 then
		return
	end

	if self.btnCanClose then
		self:closeScreen()
	else
		self.curDialogIndex = self.curDialogIndex + 1

		if self.curDialogIndex >= self.dialogsLength then
			self.isScanFinished = true
		end

		if self.changeMode == CHANGE_MODE.NONAUTO then
			self:refreshNextBtnState()
		end

		self:clampDialogIndex()
		self:refreshTxtContent()
	end
end

function LoadingShowCtrl:setNextBtn(str)
	local textId = pg.getGameString(str)

	self.view:setNextBtnTxt(textId)
	self.view.btnNextUButton:TryChangePage("Type", str == "CLICK_TO_CLOSE" and 1 or 0)
	self.view.backGroundCloseUButton:SetHotkeyConsoleBar(str, 1, self.view.consoleBar.transform)
end

function LoadingShowCtrl:refreshConsoleBarState()
	if self.isScreenReady and self.changeMode == CHANGE_MODE.NONAUTO then
		self:refreshNextBtnState()
	end
end

function LoadingShowCtrl:loadCompleted()
	if self.openToken == nil or self.isClosingScreen then
		return
	end

	if not self.isScreenReady then
		self.pendingLoadCompleted = true

		return
	end

	if self.changeMode == CHANGE_MODE.AUTO then
		self:closeScreen()
	else
		self:refreshNextBtnState()
	end
end

function LoadingShowCtrl:refreshNextBtnState()
	self.btnCanClose = self.isLoadFinished and self.isScanFinished

	self:setNextBtn(self.btnCanClose and "CLICK_TO_CLOSE" or "CLICK_TO_CONTINUE")
end

function LoadingShowCtrl:closeScreen(immediate)
	if self.isClosingScreen then
		return
	end

	self.isClosingScreen = true
	self.openToken = nil

	self:killAllLoadingTimers()

	local closeToken = {}

	self.closeToken = closeToken

	if not immediate and self.screenConfig ~= nil and self.screenConfig.outOrNot == 1 then
		local blendSpeed = getAnimationSpeed(self.screenConfig.outTime, self.SCREEN_OUT_ANI_TIME)

		UIUtils.PlayAnimation(self.view.mainAni, self.SCREEN_OUT_ANI, function()
			if self.closeToken ~= closeToken then
				return
			end

			self:closeSelfPanel()
		end, blendSpeed)
	else
		self:closeSelfPanel()
	end
end

function LoadingShowCtrl:closeSelfPanel()
	self:killCloseTimer()
	self:killProgressTimer()

	self.closeToken = nil

	local cb = self.closeEvent

	self.closeEvent = nil

	self:dismiss()

	if cb then
		cb()
	end
end

function LoadingShowCtrl:killProgressTimer()
	if self.ticId ~= nil then
		TimerManager.removeTimer(self.ticId)

		self.ticId = nil
	end
end

function LoadingShowCtrl:killTickTimer()
	if self.tickTimer ~= nil then
		self:killScaleTimer(self.tickTimer)

		self.tickTimer = nil
	end
end

function LoadingShowCtrl:killAllLoadingTimers()
	self:killProgressTimer()
	self:killTickTimer()
	self:killCloseTimer()
end

function LoadingShowCtrl:onSceneLoaded()
	if self.openToken == nil or self.isClosingScreen then
		return
	end

	self.isLoadFinished = true

	self:killCloseTimer()

	local openToken = self.openToken

	self.delayToClosePanelTimer = self:startTimer(function()
		if self.openToken ~= openToken then
			return
		end

		self.delayToClosePanelTimer = nil

		self:loadCompleted()
	end, 0.5)

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("LoadingShowCtrl:onSceneLoaded", self.isLoadFinished)
	end
end

function LoadingShowCtrl:killCloseTimer()
	if self.delayToClosePanelTimer ~= nil then
		self:killTimer(self.delayToClosePanelTimer)

		self.delayToClosePanelTimer = nil
	end
end

function LoadingShowCtrl:checkUIShowVirtualMouseCursor()
	return false
end

return LoadingShowCtrl
