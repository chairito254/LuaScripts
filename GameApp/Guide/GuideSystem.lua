-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Guide\\GuideSystem.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local UIConst = require("Const.UIConst")
local lume = require("Core.Common.lume")
local ClientUtils = require("Utils.ClientUtils")
local GuideData = require("Data.guide_data")
local GuideUIRevertData = require("Data.guide_ui_revert_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local Const = require("Common.Const.Const")
local TriggerConst = require("Common.Const.TriggerConst")
local MessageName = require("Const.MessageName")
local GuideStepData = require("Data.guide_step_data")
local SystemBase = require("GameApp.Core.SystemBase")
local CommonSwitch = require("Common.CommonSwitch")
local TimerManager = require("Core.Timer.TimerManager")
local SingleGuide = require("GameApp.Guide.SingleGuide")
local Class = require("Core.Framework.Class")
local logger = LoggerManager.getLogger("GuideSystem")
local LuaUIUtils = require("Utils.LuaUIUtils")
local GuideUtils = require("Utils.GuideUtils")
local TriggerUtils = require("Common.Utils.TriggerUtils")
local GuideMgr = CS.XGUI.GuideMgr
local GuideSystem = Class.LightClass("GuideSystem", SystemBase)
local INFERIOR_SHOW_RETRY_INTERVAL = 0.1
local INFERIOR_SHOW_MAX_RETRY_TIMES = 30
local EMPTY_TABLE = {}

function GuideSystem:getMessageBindMap()
	return {
		[MessageName.UI_ON_OPEN] = "onHandleOnOpenUI",
		[MessageName.UI_ON_CLOSE] = "onHandleOnCloseUI",
		[MessageName.UI_ON_VISIBLE_CHANGE] = "onHandleOnVisibleChange",
		[MessageName.INPUT_DEVICE_CHANGED] = {
			"onInputDeviceChanged"
		},
		[MessageName.INPUT_ACTION_TRIGGERED] = "onHandleInputActionTriggered"
	}
end

function GuideSystem:onCtor()
	self.hadRegistEvent = true
end

function GuideSystem:onPlayerInit()
	self.currentGuideId = nil
	self.activeGuideIds = nil
	self.inferiorGuideId = nil
	self.inferiorOpeningUI = nil
	self.inferiorShowRetryGuideId = nil
	self.inferiorShowRetryOpeningUI = nil
	self.inferiorShowRetryReason = nil
	self.inferiorShowRetryTimer = nil
	self.inferiorShowRetryTimes = 0

	self:activeRegistEvents(true)
end

function GuideSystem:onSceneLoaded(resId, gameObj)
	self:startGuides()
end

function GuideSystem:startGuides(extraArg)
	if not self:checkEnableGuide() and (not LoggerManager.checkLogger(LoggerConst.INFO) or true) then
		return
	end

	self.activeGuideIds = self:getAllActiveGuides()

	local executableGuideIds = {}

	for _, guideId in ipairs(self.activeGuideIds) do
		local guideConfig = self:getGuideConfig(guideId)

		if guideConfig.groupStartType ~= 1 then
			table.insert(executableGuideIds, guideId)
		end
	end

	self.activeGuideIds = executableGuideIds

	if (self.activeGuideIds == nil or #self.activeGuideIds == 0) and (not LoggerManager.checkLogger(LoggerConst.INFO) or true) then
		return
	end

	if extraArg and not self:canPlayGuide(extraArg) then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("当前有引导正在播放！", self.currentGuideId, extraArg)
		end

		return
	end

	self:skipCurrentGuide()

	local ret, errors = ClientUtils.tryWithLogError(function()
		self:startGuide(self.activeGuideIds[1])
	end)

	if not ret then
		self:closeGuide(self.currentGuideId)
	end
end

local function containsUI(openingUIs, uid)
	if openingUIs == nil or uid == nil then
		return false
	end

	if type(openingUIs) == "table" then
		return table.contains(openingUIs, uid)
	end

	return openingUIs == uid
end

function GuideSystem:isInferiorGuideEndConditionCompleted(guideConfig)
	local conditionId = guideConfig and guideConfig.groupEndCondition

	return conditionId ~= nil and conditionId ~= 0 and pg.me ~= nil and pg.me.triggerMap ~= nil and pg.me.triggerMap:isCompleteOrMeetCondition(conditionId)
end

function GuideSystem:isInferiorReopenStartConditionMet(conditionId)
	if conditionId == nil or conditionId == 0 then
		return true
	end

	if pg.me == nil or pg.me.triggerMap == nil then
		return false
	end

	local triggerMap = pg.me.triggerMap

	if triggerMap:isCompleteOrMeetCondition(conditionId) then
		return true
	end

	local conditionConfig = CustomTriggerData[conditionId]

	if conditionConfig == nil then
		return false
	end

	for pos, condition in ipairs(conditionConfig.condition or EMPTY_TABLE) do
		local trigger = TriggerUtils.getTriggerType(condition)

		if trigger == TriggerConst.TRIGGER_TARGET_OPENING_INTERFACE and TriggerUtils.checkSingleStatusCondition(pg.me, condition) and triggerMap:checkMeetCustomTrigger(conditionConfig, pos) then
			return true
		end
	end

	return false
end

function GuideSystem:canReopenInferiorGuide(guideConfig)
	return guideConfig ~= nil and guideConfig.groupStartType == 1 and self:isInferiorReopenStartConditionMet(guideConfig.groupStartCondition) and not self:isInferiorGuideEndConditionCompleted(guideConfig)
end

function GuideSystem:tryShowInferiorGuideByOpeningUI(uid)
	local guideIds = GuideUIRevertData[uid]

	if guideIds == nil then
		return false
	end

	if pg.me == nil or not self:checkEnableGuide() then
		return false
	end

	if self.currentGuideId ~= nil or self.inferiorGuideId ~= nil or self.inferiorShowRetryGuideId ~= nil then
		return true
	end

	local uiCtrl = pg.global.ui:tryGetCtrlByUid(uid)

	if uiCtrl == nil or not uiCtrl:checkUIOpen() then
		return false
	end

	local openingUIReady = self:isInferiorOpeningUIReady(uid)
	local selectedId, selectedWeight

	for _, guideId in ipairs(guideIds) do
		local config = GuideData[guideId]

		if config ~= nil and config.groupStartType == 1 and not self:checkSingleGuideIsClose(guideId) and (not openingUIReady or self:canReopenInferiorGuide(config)) then
			local weight = config.weight or 0

			if selectedId == nil or selectedWeight < weight or weight == selectedWeight and guideId < selectedId then
				selectedId = guideId
				selectedWeight = weight
			end
		end
	end

	if selectedId == nil then
		return false
	end

	return self:showInferiorGuide(selectedId, uid)
end

function GuideSystem:getInferiorGuideOpeningUI(guideConfig, openingUid)
	local openingUIs = guideConfig and guideConfig.openingUIs

	if containsUI(openingUIs, openingUid) then
		return openingUid
	end

	if type(openingUIs) == "table" then
		for _, uid in ipairs(openingUIs) do
			if pg.global.ui:checkUIShow(uid) then
				return uid
			end
		end
	elseif openingUIs ~= nil and pg.global.ui:checkUIShow(openingUIs) then
		return openingUIs
	end
end

function GuideSystem:clearInferiorShowRetry()
	if self.inferiorShowRetryTimer ~= nil then
		TimerManager.removeTimer(self.inferiorShowRetryTimer)

		self.inferiorShowRetryTimer = nil
	end

	self.inferiorShowRetryGuideId = nil
	self.inferiorShowRetryOpeningUI = nil
	self.inferiorShowRetryReason = nil
	self.inferiorShowRetryTimes = 0
end

function GuideSystem:isInferiorOpeningUIReady(uid)
	local uiCtrl = pg.global.ui:tryGetCtrlByUid(uid)

	if uiCtrl == nil or not uiCtrl:checkUIAssetReady() or not uiCtrl:checkUIVisible() then
		return false
	end

	if uiCtrl._deferredUISceneActivationPending or uiCtrl._deferBlackCloseForUIScene or uiCtrl._releaseUISceneBlackFrameId ~= nil or uiCtrl._releaseUISceneBlackTimerId ~= nil then
		return false
	end

	return uiCtrl._blackFadeOutDuration == nil
end

function GuideSystem:retryShowInferiorGuide(guideId, openingUid, reason)
	if self.inferiorShowRetryGuideId ~= guideId or self.inferiorShowRetryOpeningUI ~= openingUid then
		self:clearInferiorShowRetry()

		self.inferiorShowRetryGuideId = guideId
		self.inferiorShowRetryOpeningUI = openingUid
	elseif self.inferiorShowRetryReason ~= reason then
		self.inferiorShowRetryTimes = 0
	end

	self.inferiorShowRetryReason = reason

	if self.inferiorShowRetryTimer ~= nil or reason ~= "ui_ready" and self.inferiorShowRetryTimes >= INFERIOR_SHOW_MAX_RETRY_TIMES then
		return
	end

	self.inferiorShowRetryTimes = self.inferiorShowRetryTimes + 1
	self.inferiorShowRetryTimer = TimerManager.addTimer(INFERIOR_SHOW_RETRY_INTERVAL, function()
		self.inferiorShowRetryTimer = nil

		if self.inferiorShowRetryGuideId ~= guideId or self.inferiorShowRetryOpeningUI ~= openingUid then
			return
		end

		local uiCtrl = pg.global.ui:tryGetCtrlByUid(openingUid)

		if uiCtrl == nil or not uiCtrl:checkUIOpen() then
			self:clearInferiorShowRetry()

			return
		end

		if self:isInGuide() then
			self:clearInferiorShowRetry()

			return
		end

		self:showInferiorGuide(guideId, openingUid)
	end)
end

function GuideSystem:showInferiorGuide(guideId, openingUid)
	local guideConfig = self:getGuideConfig(guideId)

	if guideConfig == nil or guideConfig.groupStartType ~= 1 then
		return false
	end

	self:activeRegistEvents(true)

	local matchedUid = self:getInferiorGuideOpeningUI(guideConfig, openingUid)

	if matchedUid == nil then
		return true
	end

	if not self:isInferiorOpeningUIReady(matchedUid) then
		self:retryShowInferiorGuide(guideId, matchedUid, "ui_ready")

		return true
	end

	if not self:canReopenInferiorGuide(guideConfig) then
		self:clearInferiorShowRetry()

		if self:tryShowInferiorGuideByOpeningUI(matchedUid) then
			return true
		end

		return false
	end

	local targetBtnTrans

	if guideConfig.groupDirectionMethod == Const.GUIDE_DIRECTION_TYPE.GUIDE_PORINT_TYPE_CONTROL then
		targetBtnTrans = GuideUtils.getFocusTarget(guideConfig.groupDirectionParams)

		if IsNil(targetBtnTrans) then
			if self.inferiorShowRetryReason ~= "focus_target" and LoggerManager.checkLogger(LoggerConst.WARN) then
				logger:warn("[GuideInferior] focus target missing", guideId, inspect(guideConfig.groupDirectionParams))
			end

			self:retryShowInferiorGuide(guideId, matchedUid, "focus_target")

			return true
		end
	end

	self:clearInferiorShowRetry()

	self.inferiorGuideId = guideId
	self.inferiorOpeningUI = matchedUid

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[GuideInferior] show panel", guideId, "openingUid", matchedUid)
	end

	pg.global.ui:show(UIConst.UI_ID_GUIDE_PANEL)
	pg.global.ui:open(UIConst.UI_ID_GUIDE_PANEL, {
		inferiorGuide = true,
		guideId = guideId,
		groupName = guideConfig.groupName,
		groupMsg = guideConfig.groupMsg,
		groupDirectionMethod = guideConfig.groupDirectionMethod,
		groupOrientation = guideConfig.groupOrientation,
		targetBtnTrans = targetBtnTrans,
		onStartGuide = function(requestGuideId)
			if self.inferiorGuideId ~= requestGuideId then
				return
			end

			self.inferiorGuideId = nil
			self.inferiorOpeningUI = nil

			pg.global.ui:hide(UIConst.UI_ID_GUIDE_PANEL)
			self:startGuidanceRecord(requestGuideId)
			self:startGuide(requestGuideId)
		end
	})

	return true
end

function GuideSystem:closeInferiorGuide(guideId)
	if self.inferiorGuideId ~= guideId then
		return
	end

	self.inferiorGuideId = nil
	self.inferiorOpeningUI = nil

	pg.global.ui:hide(UIConst.UI_ID_GUIDE_PANEL)
end

function GuideSystem:onGuidanceEndConditionCompleted(guideIds)
	if self:isInGuide() or self.inferiorGuideId == nil then
		return
	end

	local guideId = self.inferiorGuideId
	local containsGuide = type(guideIds) == "table" and table.contains(guideIds, guideId) or guideIds == guideId

	if not containsGuide then
		return
	end

	self:closeInferiorGuide(guideId)
end

function GuideSystem:startGuide(guideId, stepId)
	if not self:checkEnableGuide() then
		return
	end

	if self.currentGuideId ~= nil then
		self:closeGuide(self.currentGuideId)
	end

	self:clearInferiorShowRetry()

	if self.inferiorGuideId ~= nil then
		self:closeInferiorGuide(self.inferiorGuideId)
	end

	self.currentGuideId = guideId

	if not pg.game.loading:isFinished() and pg.me then
		if self.tickTimer ~= nil then
			TimerManager.removeTimer(self.tickTimer)
		end

		self.tickTimer = TimerManager.addRepeatTimer(0.5, function()
			self:tick()
		end)

		return
	end

	self:activeCurrentGuide(stepId)
	LuaUIUtils.sendCustomLog(Const.BILogName.GUIDANCE_FLOW, {
		guidance_state = 1,
		guidance_id = self.currentGuideId
	})
end

function GuideSystem:clientStartGuide(guideId, callback)
	if not self:normalPassCheck(guideId) then
		if callback then
			callback(guideId)
		end

		return
	end

	self:registerGuideFinishCallback(callback)

	if self:isGuideActive(guideId) then
		self:startGuide(guideId)
	else
		pg.me:doEventByData({
			"startGuide",
			{
				guideId
			}
		})
	end
end

function GuideSystem:activeCurrentGuide(stepId)
	self:initSingleGuide(self.currentGuideId)

	if not self.currentGuideId then
		self:executeNextGuide()

		return
	end

	self.currentGuide:start(self.currentGuideId, stepId)
end

function GuideSystem:initSingleGuide(guideId)
	self:activeRegistEvents(true)

	if self.currentGuide == nil then
		self.currentGuide = SingleGuide.new()

		function self.currentGuide.onFinishGuide(guideId, serverFinish)
			self:onFinishGuide(guideId, serverFinish)
		end
	end

	self:doGuideGroupEvents(guideId)
end

function GuideSystem:doGuideGroupEvents(guideId)
	local guideConfig = self:getGuideConfig(guideId)

	if guideConfig == nil or guideConfig.events == nil then
		return
	end

	local events = guideConfig.events

	for i = 1, #events do
		pg.me:doEvent(events[i])
	end
end

function GuideSystem:executeNextGuide()
	if self.currentGuideId then
		return
	end

	if self.activeGuideIds == nil or #self.activeGuideIds == 0 then
		return
	end

	self:startGuide(self.activeGuideIds[1])
end

function GuideSystem:getAllActiveGuides()
	local activeGuideIds = {}

	if pg.me == nil then
		return activeGuideIds
	end

	local guidanceCurs = pg.me.guidanceCurs

	for k, v in pairs(guidanceCurs) do
		local guideId = k

		if self:normalPassCheck(guideId) then
			table.insert(activeGuideIds, guideId)
		end
	end

	local function sortFunc(a, b)
		local configA = self:getGuideConfig(a)
		local configB = self:getGuideConfig(b)

		return configA.weight > configB.weight
	end

	table.sort(activeGuideIds, sortFunc)

	return activeGuideIds
end

function GuideSystem:skipCurrentGuide()
	self:finishGuide(self.currentGuideId)
end

function GuideSystem:eventfinishStep(stepId)
	if self:isInGuide() then
		self.currentGuide:eventfinishStep(stepId)
	end
end

function GuideSystem:finishGuide(guideId, reason)
	if guideId == nil then
		return
	end

	if self.currentGuideId == guideId and self.currentGuide then
		self.currentGuide:skipCurrentGuide(reason)
	end

	LuaUIUtils.sendCustomLog(Const.BILogName.GUIDANCE_FLOW, {
		guidance_state = 2,
		guidance_id = self.currentGuideId
	})
end

function GuideSystem:closeGuide(guideId)
	if guideId == nil then
		return
	end

	if self.currentGuideId == guideId then
		if self.currentGuide ~= nil then
			self.currentGuide:closeCurrentGuide()
		end

		self:clearCurrentGuide()
	end
end

function GuideSystem:clearCurrentGuide()
	self.currentGuideId = nil
end

function GuideSystem:registerGuideFinishCallback(callback)
	if not self.finishedCb then
		self.finishedCb = {}
	end

	table.insert(self.finishedCb, callback)
end

function GuideSystem:exeFinishCallback(guideId)
	if self.finishedCb then
		for i = 1, #self.finishedCb do
			local cb = self.finishedCb[i]

			if cb ~= nil then
				cb(guideId)
			end
		end
	end

	self.finishedCb = nil
end

function GuideSystem:onHandleOnOpenUI(uid)
	if uid == UIConst.UI_ID_GUIDE_PANEL then
		return
	end

	if self.inferiorShowRetryGuideId ~= nil then
		local retryGuideConfig = self:getGuideConfig(self.inferiorShowRetryGuideId)

		if retryGuideConfig ~= nil and containsUI(retryGuideConfig.openingUIs, uid) then
			self:clearInferiorShowRetry()
		end
	end

	if not self:isInGuide() then
		if self:tryShowInferiorGuideByOpeningUI(uid) then
			return
		end

		if self:hasActiveGuide() then
			self:startGuides()
		end
	else
		if uid == UIConst.UI_ID_LOADING then
			self:skipCurrentGuide()

			return
		end

		self.currentGuide:onOpenUI(uid)
	end
end

function GuideSystem:onHandleOnCloseUI(uid)
	if self.inferiorShowRetryGuideId ~= nil then
		local guideConfig = self:getGuideConfig(self.inferiorShowRetryGuideId)

		if guideConfig ~= nil and containsUI(guideConfig.openingUIs, uid) then
			self:clearInferiorShowRetry()
		end
	end

	if self.inferiorGuideId ~= nil and self.inferiorOpeningUI == uid then
		self:closeInferiorGuide(self.inferiorGuideId)
	end

	if self:isInGuide() then
		self.currentGuide:onCloseUI(uid)
	end
end

function GuideSystem:onHandleOnVisibleChange(arg)
	if arg.uid == UIConst.UI_ID_GUIDE_PANEL then
		return
	end

	if self:isInGuide() then
		self.currentGuide:onUIVisibleChange(arg)
	elseif self.inferiorOpeningUI == arg.uid and not arg.visible then
		self:closeInferiorGuide(self.inferiorGuideId)
	elseif arg.visible then
		if self:tryShowInferiorGuideByOpeningUI(arg.uid) then
			return
		end

		if self:hasActiveGuide() then
			self:startGuides()
		end
	end
end

function GuideSystem:onHandleInputActionTriggered(arg)
	if self:isInGuide() then
		self.currentGuide:onInputActionTriggered(arg)
	end
end

function GuideSystem:onInputDeviceChanged(deviceType)
	if self:isInGuide() then
		self.currentGuide:onInputDeviceChanged(deviceType)
	end
end

function GuideSystem:onSkipGuideStep(stepId)
	if pg.game.guide.currentGuide then
		pg.game.guide.currentGuide:skipCurrentGuide()
	end
end

function GuideSystem:onCloseGuideStep(stepId)
	if pg.game.guide:isInGuide() then
		pg.game.guide.currentGuide:finishStep()
	end
end

function GuideSystem:onIncorrectCloseGuideStep(stepId)
	return
end

function GuideSystem:onFinishGuide(guideId, reason)
	if not guideId or self.currentGuideId ~= guideId then
		return
	end

	self:clearCurrentGuide()

	if reason ~= Const.GUIDE_FINISH_REASON.SERVER_FINISH then
		if pg.me and pg.me:isServerLost() then
			self.hasFailedGuide = guideId

			if LoggerManager.checkLogger(LoggerConst.WARN) then
				logger:warn("[Guide] finishGuide exception ... %d ", self.hasFailedGuide)
			end
		end

		local guideConfig = self:getGuideConfig(guideId)

		if guideConfig ~= nil and guideConfig.groupStartType == 1 then
			if reason == Const.GUIDE_FINISH_REASON.SUCESS then
				self:finishGuidanceRecord(guideId)
			end
		else
			pg.me:doEventByData({
				"finishGuide",
				{
					guideId
				}
			})
		end
	end

	self:exeFinishCallback(guideId)
	facade:sendLuaEvent("GuideFinish")
	self:removeAndExecuteNextGuide(guideId)
end

function GuideSystem:removeAndExecuteNextGuide(guideId)
	if not guideId or self.activeGuideIds == nil then
		return
	end

	local activeGuideIds = self.activeGuideIds

	for i, v in ipairs(activeGuideIds) do
		if v == guideId then
			table.remove(activeGuideIds, i)

			break
		end
	end

	self.currentGuideId = nil

	self:executeNextGuide()
end

function GuideSystem:reactiveCurrentGuide()
	if self.currentGuideId == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("当前没有引导，无法重新激活！")
		end

		return
	end

	local guideCfg = GuideData.data[self.currentGuideId]
	local guideFirstStepId = guideCfg.step[1]
	local stepCfg = GuideStepData.data[guideFirstStepId]

	if stepCfg.type == Const.GUIDE_ARROW_TYPE then
		pg.global.ui:close(uiConst.UI_ID_GUIDE_WHEEL, uiConst.UI_OPEN_FIXED)

		self.currentGuideId = nil

		self:executeNextGuide()
	end

	LuaUIUtils.sendCustomLog(Const.BILogName.GUIDANCE_FLOW, {
		guidance_state = 3,
		guidance_id = self.currentGuideId
	})
end

function GuideSystem:checkClientTriggerCondition(triggerType, value)
	local guideId = self.clientCheck:checkCondition(triggerType, value)

	if not guideId then
		return
	end

	self:addActiveGuide(guideId)
end

function GuideSystem:forceStartGuide(guideId)
	self:addActiveGuide(guideId, true)
end

function GuideSystem:addActiveGuide(guideId, isForceStart)
	if not guideId then
		return
	end

	if not self:normalPassCheck(guideId) then
		return
	end

	if table.contains(self.completeGuideIds, guideId) then
		if not isForceStart then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_GUIDE_NORMAL)
	end

	if not table.contains(self.activeGuideIds, guideId) then
		self.activeGuideIds[#self.activeGuideIds + 1] = guideId
	end

	self:executeNextGuide()
end

function GuideSystem:tick()
	if self.currentGuideId then
		if not pg.game.loading:isFinished() then
			return
		end

		self:activeCurrentGuide()
	end

	self:clearTick()
end

function GuideSystem:clearTick()
	if self.tickTimer then
		TimerManager.removeTimer(self.tickTimer)

		self.tickTimer = nil
	end
end

function GuideSystem:startSafeTimer(guideId)
	self:stopSafeTimer()

	self.safeTimer = TimerManager.addTimer(10, function()
		self:removeAndExecuteNextGuide(guideId)
	end)

	self.safeTimer:Start()
end

function GuideSystem:stopSafeTimer()
	if self.safeTimer then
		TimerManager.removeTimer(self.safeTimer)

		self.safeTimer = nil
	end
end

function GuideSystem:activeRegistEvents(active)
	if self.hadRegistEvent ~= active then
		if active then
			self:registAllMessage()
		else
			self:unregistAllMessage()
		end

		self.hadRegistEvent = active
	end
end

function GuideSystem:onTriggerEnter(triggerType)
	self.currentGuide:onTriggerEnter(triggerType)
end

function GuideSystem:onConnected()
	local guideId = self.hasFailedGuide

	self.hasFailedGuide = nil

	if guideId ~= nil then
		pg.me:doEventByData({
			"finishGuide",
			{
				guideId
			}
		})

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("[Guide] onConnected after finishGuide ... %d ", guideId)
		end
	end
end

function GuideSystem:onPlayerLeaveScene()
	self:clearGuide()
end

function GuideSystem:clearGuide()
	self:clearInferiorShowRetry()

	if self.inferiorGuideId ~= nil then
		self:closeInferiorGuide(self.inferiorGuideId)
	end

	self.inferiorGuideId = nil
	self.inferiorOpeningUI = nil

	if self:isInGuide() then
		self:closeGuide(self.currentGuideId)
	end

	self.activeGuideIds = nil
	self.currentGuideId = nil
	self.currentGuide = nil
end

function GuideSystem:onSpaceDestroy(space)
	self:clearGuide()
end

function GuideSystem:normalPassCheck(guideId)
	if not self:checkEnableGuide() then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("引导系统已经关闭 CommonSwitch.GUIDE == false")
		end

		return false
	end

	if self:checkSingleGuideIsClose(guideId) then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("当前引导已经关闭turnOff", guideId)
		end

		return false
	end

	if self:checkGuideConfigValid(guideId) then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("当前引导配置不存在", guideId)
		end

		return false
	end

	if self:isGuideFinished(guideId) then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("当前引导已经完成", guideId)
		end

		return false
	end

	if not self:checkSceneValid(guideId) then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("当前引导场景不匹配", guideId)
		end

		return false
	end

	if not pg.game.loading:isFinished() then
		return false
	end

	return true
end

function GuideSystem:checkEnableGuide()
	return CommonSwitch.GUIDE and not pg.game.setting:getHideGuide()
end

function GuideSystem:onGuideEnableChanged(enabled)
	if enabled then
		return
	end

	self:clearInferiorShowRetry()

	if self.inferiorGuideId ~= nil then
		self:closeInferiorGuide(self.inferiorGuideId)
	end
end

function GuideSystem:checkSingleGuideIsClose(guideId)
	local guideCfg = self:getGuideConfig(guideId)

	if not guideCfg then
		return true
	end

	return guideCfg.turnOff == 1
end

function GuideSystem:checkSceneValid(guideId)
	local guideCfg = self:getGuideConfig(guideId)

	if not guideCfg then
		return false
	end

	local curScene = pg.space and pg.space.sceneId or 0

	if guideCfg.scene ~= nil then
		if type(guideCfg.scene) ~= "number" then
			return table.contains(guideCfg.scene, curScene)
		else
			return guideCfg.scene == curScene
		end
	end

	return true
end

function GuideSystem:checkGuideConfigValid(guideId)
	return GuideData[guideId] == nil or #GuideData[guideId].step == 0
end

function GuideSystem:isInGuide()
	return self.currentGuideId ~= nil and self.currentGuide ~= nil and self.currentGuide.isInGuide
end

function GuideSystem:isInFocusGuide()
	return self:isInGuide() and self.currentGuide:isInFocusStep()
end

function GuideSystem:canPlayGuide(guideId)
	if not self:isInGuide(guideId) then
		return true
	end

	if guideId ~= nil then
		local waitGuide = self:getGuideConfig(guideId)
		local curGuide = self:getGuideConfig(self.currentGuideId)

		if waitGuide ~= nil and curGuide ~= nil and waitGuide.weight > curGuide.weight then
			return true
		end
	end

	return false
end

function GuideSystem:isGuideFinished(guideId)
	if pg.me.guidanceRecords[guideId] ~= nil then
		local guideConfig = self:getGuideConfig(guideId)

		if guideConfig == nil then
			return true
		end

		local times = pg.me.guidanceRecords[guideId]

		return times >= guideConfig.triggerTimes
	end

	return false
end

function GuideSystem:hasActiveGuide()
	if pg.me == nil or pg.space == nil then
		return false
	end

	return lume.tableLength(pg.me.guidanceCurs) > 0
end

function GuideSystem:isGuideActive(guideId)
	return table.contains(pg.me.guidanceCurs, guideId)
end

function GuideSystem:getGuideConfig(guideId)
	if GuideData[guideId] == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("引导组配置不存在！", guideId)
		end

		return
	end

	if GuideData[guideId].step == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("引导组中Step不存在！", guideId)
		end

		return
	end

	return GuideData[guideId]
end

function GuideSystem:getGuideStepConfig(stepId)
	if GuideStepData[stepId] == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("引导步骤配置不存在！", stepId)
		end

		return
	end

	return GuideStepData[stepId]
end

function GuideSystem:getNextStep(guideId, curStepId)
	local guideConfig = self:getGuideConfig(guideId)

	if guideConfig == nil then
		return
	end

	local index

	for i = 1, #guideConfig.step do
		if guideConfig.step[i] == curStepId then
			index = i

			break
		end
	end

	if index == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("引导组的StepId不存在！", guideId, curStepId)
		end

		return
	end

	if index < #guideConfig.step then
		return guideConfig.step[index + 1]
	end
end

function GuideSystem:isLastStep(guideId, curStepId)
	local guideConfig = self:getGuideConfig(guideId)

	if guideConfig == nil then
		return
	end

	return guideConfig.step[#guideConfig.step] == curStepId
end

function GuideSystem:startGuidanceRecord(id)
	pg.me:serverMsg("RPC_CS_StartGuidanceRecord", id)
end

function GuideSystem:finishGuidanceRecord(id)
	pg.me:serverMsg("RPC_CS_FinishGuidanceRecord", id)
end

return GuideSystem
