-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TopLogo\\Component\\TopLogoPetWaterStorageComponent.lua

local Class = require("Core.Framework.Class")
local UIConst = require("Const.UIConst")
local TopLogoConst = require("Const.TopLogoConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientUtils = require("Utils.ClientUtils")
local Time = require("Core.Common.Time")
local TopLogoItemComponent = require("Guis.Panels.TopLogo.Component.TopLogoItemComponent")
local MAX_LINE_CNT = 10
local TOTAL_ARC_DEGREES = 360
local LINE_RETRY_SECONDS = 0.2
local CLOSE_TIME = 1
local COST_CLOSE_TIME = 0.5
local ANIM_HIDE = "VX_Node_Hud_Water_Storage_Bar_Out"
local ANIM_SHOW = "VX_Node_Hud_Water_Storage_Bar_In"
local ANIMATION_CHECK_INTERVAL = 0.03
local TopLogoPetWaterStorageComponent = Class.LightClass("TopLogoPetWaterStorageComponent", TopLogoItemComponent)

function TopLogoPetWaterStorageComponent:ctor(refUContainer, topLogoItem)
	TopLogoPetWaterStorageComponent.super.ctor(self, refUContainer, topLogoItem)

	self.totalVal = 0
	self.baseRecoveryVal = 0
	self.canUseVal = 0
	self.waterSnapshot = nil
	self.hideState = nil
end

function TopLogoPetWaterStorageComponent:onCtor()
	return
end

function TopLogoPetWaterStorageComponent:initUI()
	TopLogoPetWaterStorageComponent.super.initUI(self)
	self:restoreStateFromEntity()
	self:buildLines()
end

function TopLogoPetWaterStorageComponent:buildLines()
	if self._waterStorageDestroyed then
		return
	end

	local template = self.lineRectTransform
	local context = self._waterLineContext
	local parent = NotNil(template) and template.parent or nil

	if context and (context.template ~= template or context.parent ~= parent or context.entity ~= self.entity or context.renderVersion ~= (self._renderVersion or 0)) then
		self:destroyLines()

		context = nil
	end

	if IsNil(template) or IsNil(parent) then
		self:refreshLinesLayout()

		return
	end

	if not context then
		self.lineCache = {
			template
		}
		self.lineAsyncTaskMap = {}
		context = {
			template = template,
			parent = parent,
			entity = self.entity,
			renderVersion = self._renderVersion or 0
		}
		self._waterLineContext = context
	end

	for i = 2, MAX_LINE_CNT do
		if self._waterLineContext ~= context then
			return
		end

		if IsNil(self.lineCache[i]) and not self.lineAsyncTaskMap[i] then
			self:loadWaterLine(i, context)
		end
	end

	self:refreshLinesLayout()
end

function TopLogoPetWaterStorageComponent:refreshLinesLayout()
	local snapshot = self.waterSnapshot
	local ready = snapshot ~= nil and snapshot.ready == true and snapshot.entity == self.entity and self.totalVal > 0
	local complete = self.lineCache ~= nil
	local angleStep = TOTAL_ARC_DEGREES / MAX_LINE_CNT

	for i = 1, MAX_LINE_CNT do
		local lineRt = self.lineCache and self.lineCache[i]

		if NotNil(lineRt) then
			lineRt:SetLocalEulerAnglesEx(0, 0, angleStep * (i - 1))
		else
			complete = false
		end
	end

	local minimum = self.imgMinimumRectTransform

	if ready and NotNil(minimum) then
		minimum:SetLocalEulerAnglesEx(0, 0, self.canUseVal / self.totalVal * TOTAL_ARC_DEGREES)
	end

	LuaUIUtils.setUIViewVisible(minimum, ready)
	LuaUIUtils.setUIViewVisible(self.lineParentRectTransform, ready and complete and snapshot.value >= self.canUseVal)

	if complete then
		self:clearWaterLineRetry()
	end
end

function TopLogoPetWaterStorageComponent:findObjects()
	local objectReference = self.refUContainer.content:GetComponent("ObjectReference")

	self.barAnimation = objectReference:GetRefValue("barAnimation")
	self.sliderUSlider = objectReference:GetRefValue("sliderUSlider")
	self.iconUImage = objectReference:GetRefValue("iconUImage")
	self.lineRectTransform = objectReference:GetRefValue("lineRectTransform")
	self.imgMinimumRectTransform = objectReference:GetRefValue("imgMinimumRectTransform")
	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.lineParentRectTransform = objectReference:GetRefValue("lineParentRectTransform")
	self.objectReference = objectReference

	self.barAnimation:Stop()

	self.barAnimation.playAutomatically = false
	self.barAnimation.enabled = true
	self.waterContentWidget = self.barAnimation.transform:Find("Content"):GetComponent("UWidget")
	self.waterContentWidget.renderOpacity = 0
end

function TopLogoPetWaterStorageComponent:shouldBeActive()
	return self:isMainPawn() and self:haveExploreSkill()
end

function TopLogoPetWaterStorageComponent:refreshSelfVisible()
	self:refreshVisible()

	local active = self:shouldBeActive()

	if self._lastWaterActive ~= active then
		self._lastWaterActive = active

		self:notifyActiveStateChanged(active)
	end
end

function TopLogoPetWaterStorageComponent:clearHideTimers()
	local timerId = self.hideTimer

	self.hideTimer = nil
	self._feedbackTimerRevision = nil
	self._feedbackTimerDeadline = nil

	if timerId then
		self:killTimer(timerId)
	end
end

function TopLogoPetWaterStorageComponent:refreshBarProgress()
	local snapshot = self.waterSnapshot

	if not self:checkContainerLoaded() then
		return
	end

	if not snapshot or not snapshot.ready or self.totalVal <= 0 then
		self:refreshLinesLayout()

		return
	end

	local curVal = snapshot.value
	local recoveryVal = snapshot.recoveryValue or 0

	self.sliderUSlider.value = math.max(0, math.min(1, curVal / self.totalVal))

	if curVal < self.canUseVal then
		self.rootComponent:TryChangePage("Stage", 2)
	elseif curVal >= self.totalVal then
		self.rootComponent:TryChangePage("Stage", 0)
	else
		self.rootComponent:TryChangePage("Stage", 1)
	end

	self.rootComponent:TryChangePage("SpeedUp", recoveryVal > self.baseRecoveryVal and 1 or 0)
	self:buildLines()
end

function TopLogoPetWaterStorageComponent:onWaterStorageUpdate(state)
	if self._waterStorageDestroyed or self._syncingWaterStorage then
		return
	end

	self._syncingWaterStorage = true

	local ok, err = xpcall(self.syncWaterStoragePresentation, debug.traceback, self)

	self._syncingWaterStorage = nil

	if not ok then
		self:resetWaterPresentation()
		error(err, 0)
	end
end

function TopLogoPetWaterStorageComponent:startDelayHide(hideType)
	local feedback = self.waterSnapshot and self.waterSnapshot.feedback

	if not feedback then
		self:clearHideTimers()

		return
	end

	local now = Time.getTickSecond()
	local deadline = feedback.expiresAt

	if feedback.shownAt and feedback.holdUntil and now < feedback.holdUntil then
		deadline = feedback.holdUntil
	end

	if self._feedbackTimerRevision == feedback.revision and self._feedbackTimerDeadline == deadline then
		return
	end

	self:clearHideTimers()

	local revision = feedback.revision
	local renderVersion = self._renderVersion or 0

	self._feedbackTimerRevision = revision
	self._feedbackTimerDeadline = deadline
	self.hideTimer = self:startTimer(function()
		if self._waterStorageDestroyed or self._feedbackTimerRevision ~= revision or self._feedbackTimerDeadline ~= deadline or (self._renderVersion or 0) ~= renderVersion then
			return
		end

		self.hideTimer = nil
		self._feedbackTimerRevision = nil
		self._feedbackTimerDeadline = nil

		self:onWaterStorageUpdate()
	end, math.max(0, deadline - now))
end

function TopLogoPetWaterStorageComponent:cancelDelayHide()
	self:clearHideTimers()

	if self._waterPresentationPhase == "exiting" then
		self:playShowHideAnimation(false)
	end
end

function TopLogoPetWaterStorageComponent:onWaterStorageValueUpdate()
	self:onWaterStorageUpdate()
end

function TopLogoPetWaterStorageComponent:onWaterStorageStateUpdate(state)
	self:onWaterStorageUpdate(state)
end

function TopLogoPetWaterStorageComponent:updateWaterStorageBarUI()
	if not self.entity then
		return
	end

	self:refreshBarProgress()
end

function TopLogoPetWaterStorageComponent:playShowHideAnimation(isHide)
	local targetVisible = not isHide
	local phase = self._waterPresentationPhase

	if targetVisible and phase == "visible" or not targetVisible and phase == "hidden" then
		return
	end

	if phase == "entering" then
		return
	end

	if phase == "exiting" and not targetVisible then
		return
	end

	self._waterAnimationGeneration = (self._waterAnimationGeneration or 0) + 1

	if self.animTimer then
		self:killTimer(self.animTimer)

		self.animTimer = nil
	end

	local animation = self.barAnimation
	local widget = self.waterContentWidget

	self._waterAnimationTarget = targetVisible

	if targetVisible and phase == "exiting" then
		self:clearHideTimers()

		local hideClip = NotNil(animation) and animation:GetClip(ANIM_HIDE) or nil

		if NotNil(hideClip) then
			hideClip:SampleAnimation(animation.gameObject, 0)
		end

		if NotNil(animation) then
			animation:Stop()
		end

		if IsNil(hideClip) and NotNil(widget) then
			widget.renderOpacity = 1
		end

		self._waterAnimationLength = 0
		self._waterPresentationPhase = "visible"
		self._waterRenderedVisible = true

		return
	end

	local clipName = isHide and ANIM_HIDE or ANIM_SHOW
	local clip = NotNil(animation) and animation:GetClip(clipName) or nil
	local duration = NotNil(clip) and clip.length or 0

	self._waterAnimationLength = duration

	if duration <= 0 then
		if NotNil(animation) then
			animation:Stop()
		end

		if NotNil(widget) then
			widget.renderOpacity = targetVisible and 1 or 0
		end

		self._waterPresentationPhase = targetVisible and "visible" or "hidden"
		self._waterRenderedVisible = targetVisible

		return
	end

	self._waterPresentationPhase = targetVisible and "entering" or "exiting"

	animation:Stop()

	animation.enabled = true
	animation.playAutomatically = false

	animation:Play(clipName)
	clip:SampleAnimation(animation.gameObject, 0)
	self:scheduleWaterAnimationCompletion(duration)
end

function TopLogoPetWaterStorageComponent:loadAndUpdateWaterStorageBarUI(visible)
	if not visible then
		return
	end

	if not self.m_loadedWaterStorageCallback then
		local entity = self.entity
		local renderVersion = self._renderVersion or 0

		function self.m_loadedWaterStorageCallback(isSuccess)
			if not isSuccess or self._waterStorageDestroyed or self.entity ~= entity or (self._renderVersion or 0) ~= renderVersion then
				return
			end

			self:onWaterStorageUpdate()
		end
	end

	self:checkAndLoadUContainerUrlSupportAsync(self.m_loadedWaterStorageCallback, TopLogoConst.REF_CONTAINER_LOADED_CALLBACK_GROUP.CB_FUNC2)
end

function TopLogoPetWaterStorageComponent:refreshTopLogoInfo(callFromUpdate)
	self:onWaterStorageUpdate()
end

function TopLogoPetWaterStorageComponent:onDestroy()
	if self._waterStorageDestroyed then
		return
	end

	self._waterStorageDestroyed = true

	ClientUtils.tryWithLogErrorEx(self.clearHideTimers, self)
	ClientUtils.tryWithLogErrorEx(self.destroyLines, self)
	ClientUtils.tryWithLogErrorEx(self.resetWaterPresentation, self)

	self.waterSnapshot = nil

	self:clearWaterStorageRenderReferences()
	TopLogoPetWaterStorageComponent.super.onDestroy(self)
end

function TopLogoPetWaterStorageComponent:destroyLines()
	local tasks = self.lineAsyncTaskMap
	local lines = self.lineCache

	self._waterLineContext = nil
	self.lineAsyncTaskMap = nil
	self.lineCache = nil

	ClientUtils.tryWithLogErrorEx(self.clearWaterLineRetry, self)

	local resMgr = pg.global.resMgr

	if tasks then
		for _, task in pairs(tasks) do
			if task.id and task.id ~= 0 then
				ClientUtils.tryWithLogErrorEx(resMgr.ResStopInstantiateAsync, resMgr, task.id)
			end
		end
	end

	if lines then
		for i = 2, MAX_LINE_CNT do
			local lineRt = lines[i]

			if NotNil(lineRt) then
				ClientUtils.tryWithLogErrorEx(resMgr.ResDestroyObject, resMgr, lineRt.gameObject)
			end
		end
	end
end

function TopLogoPetWaterStorageComponent:getVisible()
	local phase = self._waterPresentationPhase

	return self:shouldBeActive() and (self:isRecovering() or phase == "entering" or phase == "visible" or phase == "exiting")
end

function TopLogoPetWaterStorageComponent:haveExploreSkill()
	return self.waterSnapshot ~= nil and self.waterSnapshot.ready == true
end

function TopLogoPetWaterStorageComponent:isRecovering()
	local snapshot = self.waterSnapshot

	if not snapshot or not snapshot.ready then
		return false
	end

	if snapshot.fastRecovery and snapshot.value < snapshot.maxValue then
		return true
	end

	local feedback = snapshot.feedback

	if not feedback then
		return false
	end

	local now = Time.getTickSecond()

	if now >= feedback.expiresAt then
		return false
	end

	return not feedback.shownAt or now < (feedback.holdUntil or feedback.expiresAt)
end

function TopLogoPetWaterStorageComponent:isMainPawn()
	local entity = self.entity

	if entity == nil or entity.destroyed then
		return false
	end

	local pawn
	local ctrl = pg.global.ui and pg.global.ui.topLogo

	if ctrl and ctrl.getVisualPawn then
		pawn = ctrl:getVisualPawn()
	else
		pawn = pg.pawn
	end

	if entity.isMainPet and pawn == entity then
		return true
	end

	return false
end

function TopLogoPetWaterStorageComponent:onLanguageChanged()
	if not self:checkContainerLoaded() then
		return
	end

	TopLogoPetWaterStorageComponent.super.onLanguageChanged(self)
end

function TopLogoPetWaterStorageComponent:getInitMaxDistance()
	return nil
end

function TopLogoPetWaterStorageComponent:innerGetVisible()
	return TopLogoPetWaterStorageComponent.super.innerGetVisible(self) and self:getVisible()
end

function TopLogoPetWaterStorageComponent:restoreStateFromEntity()
	local entity = self.entity
	local snapshot = entity and entity.getWaterStorageSnapshot and entity:getWaterStorageSnapshot()

	if not snapshot or not snapshot.ready or snapshot.entity ~= entity or type(snapshot.maxValue) ~= "number" or snapshot.maxValue <= 0 or type(snapshot.costValue) ~= "number" or snapshot.costValue < 0 or type(snapshot.value) ~= "number" then
		snapshot = nil
	end

	self.waterSnapshot = snapshot
	self.hideState = snapshot and snapshot.feedback and snapshot.feedback.kind or nil
	self.totalVal = snapshot and snapshot.maxValue or 0
	self.baseRecoveryVal = snapshot and snapshot.baseRecoveryValue or 0
	self.canUseVal = snapshot and snapshot.costValue or 0
end

function TopLogoPetWaterStorageComponent:tryRenderWaterStorage()
	if self._deferredInitialization or not self:checkFinalVisible() then
		return
	end

	local wantsVisible = self:isRecovering()

	if not self:checkContainerLoaded() then
		if not wantsVisible then
			self:resetWaterPresentation()

			return
		end

		self:loadAndUpdateWaterStorageBarUI(true)

		if not self:checkContainerLoaded() then
			return
		end
	end

	self:refreshBarProgress()
	self:playShowHideAnimation(not wantsVisible)

	local enteringFeedback = self.waterSnapshot and self.waterSnapshot.feedback

	if wantsVisible and self._waterPresentationPhase == "entering" and enteringFeedback then
		self.entity:beginWaterStorageFeedbackPresentation(enteringFeedback.revision, self._waterAnimationLength or 0)
		self:startDelayHide(enteringFeedback.kind)
	end

	if wantsVisible and self._waterPresentationPhase == "visible" then
		self._waterRenderedVisible = true

		local feedback = self.waterSnapshot and self.waterSnapshot.feedback

		if feedback then
			local duration = feedback.kind == "consumed" and COST_CLOSE_TIME or CLOSE_TIME
			local clip = NotNil(self.barAnimation) and self.barAnimation:GetClip(ANIM_HIDE) or nil

			feedback = self.entity:markWaterStorageFeedbackShown(feedback.revision, duration, clip and clip.length or 0)

			if feedback then
				self:startDelayHide(feedback.kind)
			end
		end
	end
end

function TopLogoPetWaterStorageComponent:resetRender()
	ClientUtils.tryWithLogErrorEx(self.clearHideTimers, self)
	ClientUtils.tryWithLogErrorEx(self.destroyLines, self)
	ClientUtils.tryWithLogErrorEx(self.resetWaterPresentation, self)
	self:clearWaterStorageRenderReferences()
	TopLogoPetWaterStorageComponent.super.resetRender(self)
end

function TopLogoPetWaterStorageComponent:resetWaterPresentation()
	self._waterAnimationGeneration = (self._waterAnimationGeneration or 0) + 1

	local timerId = self.animTimer

	self.animTimer = nil
	self._waterAnimationLength = nil
	self._waterAnimationTarget = nil
	self._waterPresentationPhase = nil
	self._waterRenderedVisible = false

	if timerId then
		self:killTimer(timerId)
	end

	local feedback = self.waterSnapshot and self.waterSnapshot.feedback

	if feedback and self.entity and self.entity.suspendWaterStorageFeedback then
		self.entity:suspendWaterStorageFeedback(feedback.revision)
	end

	if NotNil(self.barAnimation) then
		self.barAnimation:Stop()
	end

	if NotNil(self.waterContentWidget) then
		self.waterContentWidget.renderOpacity = 0
	end
end

function TopLogoPetWaterStorageComponent:onTopLogoCompVisibleChanged(visible, skipRefresh)
	if not visible then
		self:clearWaterLineRetry()
		self:resetWaterPresentation()
	end

	TopLogoPetWaterStorageComponent.super.onTopLogoCompVisibleChanged(self, visible, skipRefresh)
end

function TopLogoPetWaterStorageComponent:syncWaterStoragePresentation()
	self:restoreStateFromEntity()
	self:refreshSelfVisible()

	if self:shouldBeActive() then
		self:startDelayHide(self.hideState)
	else
		self:clearHideTimers()
		self:resetWaterPresentation()
	end

	if self:checkFinalVisible() then
		self:tryRenderWaterStorage()
		self:refreshVisible(true)
	else
		self._waterRenderedVisible = false
	end
end

function TopLogoPetWaterStorageComponent:scheduleWaterAnimationCompletion(delay)
	local generation = self._waterAnimationGeneration
	local renderVersion = self._renderVersion or 0
	local animation = self.barAnimation
	local widget = self.waterContentWidget
	local targetVisible = self._waterAnimationTarget
	local clipName = targetVisible and ANIM_SHOW or ANIM_HIDE

	self.animTimer = self:startTimer(function()
		if self._waterStorageDestroyed or generation ~= self._waterAnimationGeneration or renderVersion ~= (self._renderVersion or 0) or animation ~= self.barAnimation or widget ~= self.waterContentWidget then
			return
		end

		self.animTimer = nil

		if IsNil(animation) or IsNil(widget) or not widget.gameObject.activeInHierarchy or not self:innerGetVisible() or not self:checkParentVisible() then
			self:resetWaterPresentation()

			return
		end

		if not targetVisible then
			self:restoreStateFromEntity()

			if self:isRecovering() then
				self:onWaterStorageUpdate()

				return
			end
		end

		if animation:IsPlaying(clipName) then
			self:scheduleWaterAnimationCompletion(ANIMATION_CHECK_INTERVAL)

			return
		end

		local clip = animation:GetClip(clipName)

		if NotNil(clip) then
			clip:SampleAnimation(animation.gameObject, clip.length)
		end

		animation:Stop()

		self._waterPresentationPhase = targetVisible and "visible" or "hidden"
		self._waterRenderedVisible = targetVisible

		self:onWaterStorageUpdate()
	end, delay)
end

function TopLogoPetWaterStorageComponent:clearWaterStorageRenderReferences()
	self.m_loadedWaterStorageCallback = nil
	self.barAnimation = nil
	self.waterContentWidget = nil
	self.sliderUSlider = nil
	self.iconUImage = nil
	self.lineRectTransform = nil
	self.imgMinimumRectTransform = nil
	self.rootComponent = nil
	self.lineParentRectTransform = nil
	self.objectReference = nil
end

function TopLogoPetWaterStorageComponent:loadWaterLine(index, context)
	local tasks = self.lineAsyncTaskMap
	local task = {}

	tasks[index] = task

	local resMgr = pg.global.resMgr
	local ok, taskId = ClientUtils.tryWithLogErrorEx(resMgr.ResInstantiateAsync, resMgr, context.template.gameObject, function(gameObj)
		if self._waterStorageDestroyed or self._waterLineContext ~= context or self.entity ~= context.entity or (self._renderVersion or 0) ~= context.renderVersion or self.lineRectTransform ~= context.template or IsNil(context.template) or IsNil(context.parent) or context.template.parent ~= context.parent or tasks[index] ~= task then
			if NotNil(gameObj) then
				resMgr:ResDestroyObject(gameObj)
			end

			return
		end

		tasks[index] = nil

		if NotNil(gameObj) then
			local initialized, lineRt = ClientUtils.tryWithLogErrorEx(self.initializeWaterLine, self, gameObj, index, context)

			if self._waterLineContext ~= context then
				ClientUtils.tryWithLogErrorEx(resMgr.ResDestroyObject, resMgr, gameObj)

				return
			elseif initialized and NotNil(lineRt) then
				self.lineCache[index] = lineRt
			else
				ClientUtils.tryWithLogErrorEx(resMgr.ResDestroyObject, resMgr, gameObj)
			end
		end

		self:restoreStateFromEntity()
		self:refreshLinesLayout()

		if IsNil(self.lineCache[index]) then
			self:scheduleWaterLineRetry()
		end
	end, context.template.position, Quaternion.identity, context.parent)

	if tasks[index] == task then
		if ok and taskId and taskId ~= 0 then
			task.id = taskId
		else
			tasks[index] = nil

			self:scheduleWaterLineRetry()
		end
	end
end

function TopLogoPetWaterStorageComponent:initializeWaterLine(gameObj, index, context)
	local lineRt = gameObj.transform:GetComponent("RectTransform")

	if IsNil(lineRt) then
		return
	end

	local template = context.template

	lineRt:SetParent(context.parent, false)

	lineRt.anchorMin = template.anchorMin
	lineRt.anchorMax = template.anchorMax
	lineRt.pivot = template.pivot
	lineRt.sizeDelta = template.sizeDelta
	lineRt.anchoredPosition3D = template.anchoredPosition3D
	lineRt.localScale = template.localScale

	local widget = lineRt:GetComponent("UWidget")

	if NotNil(widget) then
		widget:TryInit()
		widget:ResetOriginCache()
	end

	lineRt:SetLocalEulerAnglesEx(0, 0, TOTAL_ARC_DEGREES / MAX_LINE_CNT * (index - 1))
	LuaUIUtils.setUIViewVisible(lineRt, true)

	return lineRt
end

function TopLogoPetWaterStorageComponent:scheduleWaterLineRetry()
	if self._waterStorageDestroyed or self._waterLineRetryTimer or not self._waterLineContext or not self:checkFinalVisible() then
		return
	end

	local context = self._waterLineContext
	local token = {}

	self._waterLineRetryToken = token
	self._waterLineRetryTimer = self:startTimer(function()
		if self._waterStorageDestroyed or self._waterLineContext ~= context or self._waterLineRetryToken ~= token then
			return
		end

		self._waterLineRetryTimer = nil
		self._waterLineRetryToken = nil

		if not self:checkContainerLoaded() or not self:checkFinalVisible() then
			return
		end

		self:restoreStateFromEntity()
		self:buildLines()
	end, LINE_RETRY_SECONDS)
end

function TopLogoPetWaterStorageComponent:clearWaterLineRetry()
	self._waterLineRetryToken = nil

	local timerId = self._waterLineRetryTimer

	self._waterLineRetryTimer = nil

	if timerId then
		self:killTimer(timerId)
	end
end

return TopLogoPetWaterStorageComponent
