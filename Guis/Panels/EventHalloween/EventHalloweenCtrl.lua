-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloween\\EventHalloweenCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local EventConst = require("Const.EventConst")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local TimerManager = require("Core.Timer.TimerManager")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventHalloweenCtrl = Class.LightClass("EventHalloweenCtrl", UICtrl)

EventHalloweenCtrl.LONG_PRESS_SUBMIT_INTERVAL = 0.2
EventHalloweenCtrl.CANDY_CLICK_SUBMIT_DELAY = 0.3
EventHalloweenCtrl.CANDY_SUBMIT_SYNC_TIMEOUT = 30
EventHalloweenCtrl.CANDY_REWARD_DELAY = 1.8
EventHalloweenCtrl.OBTAIN_WAIT_INTERVAL = 0.1
EventHalloweenCtrl.OBTAIN_WAIT_TICKS = 15
EventHalloweenCtrl.CANDY_OBTAIN_WAIT_TICKS = 50
EventHalloweenCtrl.OBTAIN_CLOSE_DELAY_FRAMES = 2
EventHalloweenCtrl.messages = {
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.MONEY_COUNT_CHANGE] = {
		"onMoneyCountChanged",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.EVENT_REFRESH_TAB_LIST] = {
		"onActivityDataChanged",
		true
	}
}

function EventHalloweenCtrl:addListener()
	function self.view.roomDotUList.luaRenderItem(button, index, data)
		button:TryChangePage("State", data.state)
	end

	function self.view.listCurrencyUList.luaRenderItem(button, index, data)
		self:renderCurrencyItem(button, data)
	end

	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.diaryTaskUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_EVENT_HALLLOWEEN_TASK, {
			eventId = self.model:getEventId()
		})
	end

	function self.view.journalUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_EVENT_HALLLOWEEN_COLLECTION, {
			eventId = self.model:getEventId()
		})
	end

	function self.view.perfumeBlendingUButton.luaClick()
		local viewData = self.model:getPerfumeButtonViewData()

		if not viewData.canOpen then
			return
		end

		if self.model:markCurrentPerfumeEntryViewed(viewData.petId) then
			facade:sendMsgToUI(MessageName.EVENT_REFRESH_REDDOT)
		end

		pg.global.ui:open(UIConst.UI_ID_EVENT_HALLLOWEEN_PERFUME_BLENDING, {
			eventId = self.model:getEventId(),
			petIndex = viewData.petIndex
		})
	end

	function self.view.petUCountDown.onGetBaseText(days, hours, minutes)
		return self.model:getPetUnlockCountdownText(days, hours, minutes)
	end

	function self.view.petUCountDown.luaFinished()
		self:refreshPetState()
	end

	self.view.submitUButton.enabledLongPress = true

	function self.view.submitUButton.luaClick()
		if self._ignoreSubmitClick or self._candyClickSubmitTimer or self._candySubmitLocked or not self.model:canSubmitCandy() then
			return
		end

		self.view:playSubmitClickParticle()

		self._candyClickSubmitTimer = self:startTimer(function()
			self._candyClickSubmitTimer = nil

			if self:requestSubmitCandy(1) then
				pg.game.audio:playEvent("SFX_Halloween_Decorate")
			end
		end, self.CANDY_CLICK_SUBMIT_DELAY)
	end

	function self.view.submitUButton.luaBeginLongPress()
		if self._candyClickSubmitTimer or self._candySubmitLocked or not self.model:canSubmitCandy() then
			return
		end

		self._longPressCandyCount = math.min(self.model:getCandySubmitLimit(), 1)

		if self._longPressCandyCount > 0 then
			self.view:playSubmitClickParticle()
		end

		self:refreshCandyCountText()
		self:refreshCandyProgress(true)
		self:tryAutoSubmitCandyLongPress()
	end

	function self.view.submitUButton.luaLongPress(pressTime)
		if not self._longPressCandyCount then
			return
		end

		local submitCount = math.min(math.floor(pressTime / EventHalloweenCtrl.LONG_PRESS_SUBMIT_INTERVAL) + 1, self.model:getCandySubmitLimit())

		if submitCount ~= self._longPressCandyCount then
			self._longPressCandyCount = submitCount

			self.view:playSubmitClickParticle()
			self:refreshCandyCountText()
			self:refreshCandyProgress(true)
		end

		self:tryAutoSubmitCandyLongPress()
	end

	function self.view.submitUButton.luaEndLongPress()
		self:finishCandyLongPress()

		if self._longPressCandySubmitted then
			self._longPressCandySubmitted = false

			pg.game.audio:playEvent("SFX_Halloween_Decorate")
			self:refreshSubmitState()
		end
	end
end

function EventHalloweenCtrl:tryAutoSubmitCandyLongPress()
	local submitCount = self._longPressCandyCount

	if submitCount and submitCount > 0 and submitCount >= self.model:getCandyHouseStageRemaining() then
		self:finishCandyLongPress()
	end
end

function EventHalloweenCtrl:finishCandyLongPress()
	local submitCount = self._longPressCandyCount

	self._longPressCandyCount = nil
	self._ignoreSubmitClick = true

	TimerManager.addNextFrameCb(function()
		self._ignoreSubmitClick = false
	end)

	if submitCount and submitCount > 0 then
		if self:requestSubmitCandy(submitCount) then
			self._longPressCandySubmitted = true
		else
			self:refreshCandyProgress(true)
		end
	elseif submitCount ~= nil then
		self:refreshCandyProgress(true)
	end

	self:refreshCandyCountText()
	self:refreshSubmitState()
end

function EventHalloweenCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:clearCandyClickSubmitTimer()
	self:flushPendingCandyRewards()
	self:clearObtainWait()
	self.model:setEventId(info and info.eventId)
	self.model:clearCandySubmitPreview()

	self._longPressCandyCount = nil
	self._longPressCandySubmitted = false
	self._ignoreSubmitClick = false
	self._pendingCandyRoomStage = nil
	self._pendingPetStickerPetId = nil
	self._lastCandyHouseLevel = self.model:getCandyHouseLevel()

	self:refreshView(true)
	pg.game.audio:playEvent("SFX_Halloween_MoveIn")
end

function EventHalloweenCtrl:onPostOpen(info, isReOpen)
	UICtrl.onPostOpen(self, info, isReOpen)

	if not isReOpen then
		self.view:playEnterAnimation()
	end
end

function EventHalloweenCtrl:onActivityDataChanged(messageBody)
	if self:checkUIClosing() then
		return
	end

	if not self.model:isActivityOpen() then
		self:close()

		return
	end

	local submitSuccess

	if messageBody and messageBody.isHalloweenCandySubmitResult then
		submitSuccess = messageBody.success
	end

	self.model:updateCandySubmitPreview(submitSuccess)

	if messageBody and messageBody.isHalloweenCandySubmitResult and not messageBody.success then
		self:flushPendingCandyRewards()
	end

	local candyHouseLevel = self.model:getCandyHouseLevel()
	local roomUpgraded = self._lastCandyHouseLevel and candyHouseLevel > self._lastCandyHouseLevel

	if roomUpgraded then
		self._pendingCandyRoomStage = candyHouseLevel
	end

	if messageBody and messageBody.isHalloweenBlendPetResult and messageBody.success and messageBody.petId then
		self._pendingPetStickerPetId = messageBody.petId
	end

	self._lastCandyHouseLevel = candyHouseLevel

	self:refreshView()

	if roomUpgraded then
		pg.game.audio:playEvent("SFX_Halloween_House")

		if self._pendingCandyRewards then
			self:killTimer(self._candyRewardTimer)

			self._candyRewardReadyTime = Time.realSecondCache + self.CANDY_REWARD_DELAY
			self._candyRewardTimer = self:startTimer(function()
				self:flushPendingCandyRewards()
			end, self.CANDY_REWARD_DELAY)
		end
	end

	if roomUpgraded or self._pendingPetStickerPetId then
		self:waitForObtainClose()
	end
end

function EventHalloweenCtrl:waitForObtainClose()
	if self._obtainWatchTimer or self._obtainCloseListening then
		return
	end

	local waitTicks = 0

	self._obtainWatchTimer = self:startTimer(function()
		if pg.global.ui:checkUIOpen(UIConst.UI_ID_COMMON_OBTAIN) then
			self:stopObtainWatchTimer()

			self._onObtainClose = self._onObtainClose or function()
				self:onObtainClosed()
			end
			self._obtainCloseListening = true

			pg.global.eventEmitter:addEventListener(EventConst.ON_ITEM_OBTAIN_CLOSE_PANEL, self._onObtainClose)

			return
		end

		waitTicks = waitTicks + 1

		local waitLimit = self._pendingCandyRoomStage and self.CANDY_OBTAIN_WAIT_TICKS or self.OBTAIN_WAIT_TICKS

		if waitLimit <= waitTicks then
			self:applyPendingRewardFeedback()
		end
	end, self.OBTAIN_WAIT_INTERVAL, true)
end

function EventHalloweenCtrl:onObtainClosed()
	self:startFrameTimer(function()
		if (self._pendingCandyRoomStage or self._pendingPetStickerPetId) and self.view and not pg.global.ui:checkUIOpen(UIConst.UI_ID_COMMON_OBTAIN) then
			self:applyPendingRewardFeedback()
		end
	end, self.OBTAIN_CLOSE_DELAY_FRAMES)
end

function EventHalloweenCtrl:applyPendingRewardFeedback()
	local stage = self._pendingCandyRoomStage
	local petId = self._pendingPetStickerPetId

	if not stage and not petId then
		return
	end

	self:clearObtainWait()

	self._pendingCandyRoomStage = nil
	self._pendingPetStickerPetId = nil

	if not self.view then
		return
	end

	if stage then
		pg.global.showBubbleMessageRaw(self.model:getCandyHouseUnlockTipText(stage))
	end

	if petId then
		pg.global.showBubbleMessageRaw(self.model:getPetStickerUnlockTipText(petId))
	end
end

function EventHalloweenCtrl:stopObtainWatchTimer()
	if self._obtainWatchTimer then
		self:killTimer(self._obtainWatchTimer)

		self._obtainWatchTimer = nil
	end
end

function EventHalloweenCtrl:clearObtainWait()
	self:stopObtainWatchTimer()

	if self._obtainCloseListening and self._onObtainClose then
		pg.global.eventEmitter:removeEventListener(EventConst.ON_ITEM_OBTAIN_CLOSE_PANEL, self._onObtainClose)
	end

	self._obtainCloseListening = false
	self._onObtainClose = nil
end

function EventHalloweenCtrl:onMoneyCountChanged()
	self:refreshCurrency()
	self:refreshSubmitState()
end

function EventHalloweenCtrl:refreshView(skipRoomTransition)
	local viewData = self.model:getMainViewData()

	self.view.widget:TryChangePage("StatePet", viewData.completedPerfumePetCount)
	ClientTextUtils.setText(self.view.titleUSDFText, self.model:getActivityTitle())
	ClientTextUtils.setText(self.view.progressTipsUSDFText, self.model:getProgressTipsText())
	ClientTextUtils.setText(self.view.perfumeBlendingUSDFText, viewData.perfumeBlendingText)
	ClientTextUtils.setText(self.view.submitBtnUSDFText, viewData.submitButtonText)
	ClientTextUtils.setText(self.view.candyNumUSDFText, "1")
	ClientTextUtils.setText(self.view.doneTipsUSDFText, viewData.doneTipsText)
	ClientTextUtils.setText(self.view.taskDesUSDFText, viewData.taskDescriptionText)
	ClientTextUtils.setText(self.view.diaryTaskTitle1UBaseText, viewData.diaryTaskTitle1Text)
	ClientTextUtils.setText(self.view.diaryTaskTitle2UBaseText, viewData.diaryTaskTitle2Text)
	ClientTextUtils.setText(self.view.diaryTaskTitle3UBaseText, viewData.diaryTaskTitle3Text)
	self:refreshDiaryTaskRedDot(viewData.diaryTaskRedDot)
	ClientTextUtils.setText(self.view.journalTitle1UBaseText, viewData.journalTitle1Text)
	ClientTextUtils.setText(self.view.journalTitle2UBaseText, viewData.journalTitle2Text)
	ClientTextUtils.setText(self.view.journalTitle3UBaseText, viewData.journalTitle3Text)
	self:refreshJournalRedDot(viewData.journalRedDot)
	self:refreshCurrency()
	self:refreshCandyProgress(false, skipRoomTransition)
	self:refreshPetState()
	self:refreshSubmitState()
end

function EventHalloweenCtrl:refreshDiaryTaskRedDot(redDotData)
	if not redDotData or not redDotData.path then
		self.view.diaryTaskUButton:ClearRedDot()

		return
	end

	pg.global.setPreViewRedDot(redDotData.path, self.view.diaryTaskUButton, function()
		return self.model:getDailyTaskRewardRedDotStyle(self.model:getEventId())
	end)
end

function EventHalloweenCtrl:refreshJournalRedDot(redDotData)
	if not redDotData or not redDotData.path then
		self.view.journalUButton:ClearRedDot()

		return
	end

	pg.global.setPreViewRedDot(redDotData.path, self.view.journalUButton, function()
		return self.model:getCollectionRewardRedDotStyle(self.model:getEventId())
	end)
end

function EventHalloweenCtrl:refreshCurrency()
	self.model:updateCandySubmitPreview()
	self.view.listCurrencyUList:SetList(self.model:getCandyCurrencyList())
end

function EventHalloweenCtrl:refreshCandyCountText()
	self.view.listCurrencyUList:RefreshList(true)
end

function EventHalloweenCtrl:renderCurrencyItem(button, data)
	LuaUIUtils.setTopCurrencyItem(button, data.itemId)

	local candyCountText = self._longPressCandyCount and self.model:getCandyItemCountAfterSubmitText(self._longPressCandyCount) or self.model:getCandyItemCountText()
	local objectReference = button:GetComponent("ObjectReference")
	local countUText = objectReference:GetRefValue("countUText")

	ClientTextUtils.setText(countUText, candyCountText)
end

function EventHalloweenCtrl:refreshCandyProgress(progressOnly, skipRoomTransition)
	local progressData = self.model:getCandyProgressViewData(self._longPressCandyCount)

	self.view.stageProgressUProgress.maxValue = 1
	self.view.stageProgressUProgress.value = progressData.progress

	if progressOnly then
		return
	end

	if skipRoomTransition then
		self.view.widget:TryChangePage("StateRoom", progressData.stage, true, false, false)
	else
		self.view.widget:TryChangePage("StateRoom", progressData.stage)
	end

	self.view.roomDotUList:SetList(progressData.roomDotList)
end

function EventHalloweenCtrl:refreshPetState()
	local viewData = self.model:getPerfumeButtonViewData()

	self.view.perfumeBlendingUButton:SetActive(viewData.visible)
	self.view.perfumeBlendingUButton:TryChangePage("Skin", viewData.petPageIndex)
	self.view.perfumeBlendingUButton:TryChangePage("State", viewData.state)
	self.view:refreshPetCountdown(viewData.countdownSeconds)
	pg.global.setRedDot(viewData.redDot.path, self.view.perfumeBlendingUButton, viewData.redDot.visible, viewData.redDot.style)
end

function EventHalloweenCtrl:refreshSubmitState()
	local pendingSubmit = self.model:hasPendingCandySubmit()

	if not pendingSubmit then
		self:killTimer(self._candySubmitTimer)

		self._candySubmitTimer = nil
	end

	self._candySubmitLocked = pendingSubmit or self._pendingCandyRewards ~= nil

	local hasCandy = self.model:getCandyItemCount() > 0
	local submitState = self.model:isCandyHouseMaxLevel() and 2 or hasCandy and 0 or 1

	self.view.submitUButton:TryChangePage("State", submitState)
end

function EventHalloweenCtrl:requestSubmitCandy(submitCount)
	if self:checkUIClosing() or not self.model:isActivityOpen() or self._candyClickSubmitTimer or self._candySubmitLocked then
		return false
	end

	local candyNum = math.min(submitCount or 1, self.model:getCandySubmitLimit())

	if candyNum <= 0 then
		return false
	end

	if self.model:getCandyRewardDropId() and candyNum >= self.model:getCandyHouseStageRemaining() then
		self._pendingCandyRewards = {}
		self._candyRewardTimer = self:startTimer(function()
			self:flushPendingCandyRewards()
		end, 30)
	end

	self.model:beginCandySubmitPreview(candyNum)

	self._candySubmitLocked = true
	self._candySubmitTimer = self:startTimer(function()
		self._candySubmitTimer = nil

		self.model:clearCandySubmitPreview()
		self:refreshCurrency()
		self:refreshSubmitState()
	end, self.CANDY_SUBMIT_SYNC_TIMEOUT)

	local requested = pg.me:reqPutCandyToCandyHouse(self.model:getEventId(), candyNum)

	if not requested then
		self.model:clearCandySubmitPreview()
		self:flushPendingCandyRewards()
	end

	self:refreshCandyCountText()
	self:refreshSubmitState()

	return requested
end

function EventHalloweenCtrl:filterCandyHouseRewards(notifyList, showRewards)
	if not self._pendingCandyRewards then
		return notifyList
	end

	local rewards, normal = {}, {}

	for _, notifyInfo in ipairs(notifyList) do
		local target = self.model:isCandyHouseRewardNotify(notifyInfo) and rewards or normal

		target[#target + 1] = notifyInfo
	end

	if #rewards > 0 then
		self._pendingCandyRewards[#self._pendingCandyRewards + 1] = function()
			showRewards(rewards)
		end
	end

	return normal
end

function EventHalloweenCtrl:flushPendingCandyRewards()
	local delay = math.max(0, (self._candyRewardReadyTime or 0) - Time.realSecondCache)

	self:killTimer(self._candyRewardTimer)

	self._candyRewardTimer = nil

	if delay > 0 then
		if not self._candyRewardDelayTimer then
			self._candyRewardDelayTimer = pg.global.ui.tips:startTimer(function()
				self._candyRewardDelayTimer = nil

				self:flushPendingCandyRewards()
			end, delay)
		end

		return
	end

	if self._candyRewardDelayTimer then
		pg.global.ui.tips:killTimer(self._candyRewardDelayTimer)

		self._candyRewardDelayTimer = nil
	end

	local pendingRewards = self._pendingCandyRewards

	self._pendingCandyRewards = nil
	self._candyRewardReadyTime = nil

	for _, showRewards in ipairs(pendingRewards or {}) do
		showRewards()
	end

	if self.view then
		self:refreshSubmitState()
	end
end

function EventHalloweenCtrl:clearCandyClickSubmitTimer()
	self:killTimer(self._candyClickSubmitTimer)

	self._candyClickSubmitTimer = nil
end

function EventHalloweenCtrl:close()
	if self:checkUIClosing() then
		return
	end

	self._longPressCandyCount = nil

	self:clearCandyClickSubmitTimer()
	UICtrl.close(self)
end

function EventHalloweenCtrl:onDestroy()
	self:clearCandyClickSubmitTimer()
	self.model:clearCandySubmitPreview()

	self._candySubmitTimer = nil

	self:flushPendingCandyRewards()
	self:clearObtainWait()
	UICtrl.onDestroy(self)
end

return EventHalloweenCtrl
