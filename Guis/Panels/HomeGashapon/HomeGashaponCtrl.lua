-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeGashapon\\HomeGashaponCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local CallbackHandler = require("Core.Common.CallbackHandler")
local ClientConst = require("Const.ClientConst")
local Const = require("Common.Const.Const")
local MessageName = require("Const.MessageName")
local NoticeDef = require("Common.NoticeDef")
local UIConst = require("Const.UIConst")
local EventConst = require("Const.EventConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Time = require("Core.Common.Time")
local CONSOLE_BAR_LISTENER_NAME = "HomeGashaponConsoleBar"
local CONSOLE_BAR_STATE_RULE = "HomeGashapon_Rule"
local CONSOLE_BAR_STATE_SELECT = "HomeGashapon_Select"
local NAV_GROUP_REWARD_LIST = "ListReward"
local NAV_GROUP_CURRENCY_LIST = "ListCurrency"
local DrawRpc = {
	Idle = 0,
	Ok = 2,
	Requesting = 1
}
local SkipPhase = {
	None = 0,
	Active = 3,
	Settling = 2,
	PendingSettle = 1
}
local ObtainPhase = {
	None = 0,
	Closed = 2,
	Waiting = 1
}
local UiPhase = {
	ContentShown = 0,
	ContentHidden = 2,
	ButtonAnim = 1
}
local HomeGashaponCtrl = Class.LightClass("HomeGashaponCtrl", UICtrl)

HomeGashaponCtrl.SHOWCASE_FOV = 48
HomeGashaponCtrl.SHOWCASE_VERTICAL_COVERAGE = 0.56
HomeGashaponCtrl.SHOWCASE_PITCH = 10
HomeGashaponCtrl.SHOWCASE_YAW = 0
HomeGashaponCtrl.SHOWCASE_HORIZONTAL_OFFSET_RATIO = 0
HomeGashaponCtrl.SHOWCASE_VERTICAL_OFFSET_RATIO = 0.02
HomeGashaponCtrl.SHOWCASE_BLEND_TIME = 0.8
HomeGashaponCtrl.DRAW_BUTTON_ANIM_DELAY = 0.8
HomeGashaponCtrl.DRAW_ANIM_FALLBACK_TIME = 15
HomeGashaponCtrl.PERIOD_RESET_DELAY_OFFSET = 1
HomeGashaponCtrl.DRAW_ANIM_REWARD_TIME = 7.5
HomeGashaponCtrl.messages = {
	[MessageName.ITEM_COUNT_MAP_CHANGE] = {
		"onItemCountChanged",
		true
	},
	[MessageName.HOMELAND_ITEM_MAP_CHANGED] = {
		"onItemCountChanged",
		true
	},
	[MessageName.HOMELAND_PETS_CHANGE] = {
		"onHomelandPetsChanged",
		true
	}
}

local function setText(target, text)
	if target then
		ClientTextUtils.setText(target, text)
	end
end

function HomeGashaponCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.ornamentId = nil
	self._session = nil
	self.drawButtonAnimTimer = nil
	self.drawAnimTimer = nil
	self.drawRewardVxAnimTimer = nil
	self.drawRewardVxTierId = nil
	self.isRewardVxDelayFinished = false
	self.onRewardPanelClose = nil
	self.periodResetTimer = nil
	self.periodStart = nil
	self._gashaponCtrlDestroyed = false
	self._focusEnabled = false
	self._showcaseActorsHidden = false
	self._hiddenHomePetIds = {}
	self.drawCount = 0
	self.drawLimit = 0
	self.nextCostCount = 0
end

function HomeGashaponCtrl:addListener()
	UICtrl.addListener(self)

	local view = self.view
	local closeButton = view.btnBackUButton
	local ruleButton = view.btnInfoUButton
	local drawButton = view.btnPlayUButton
	local skipButton = view.btnSkipUButton
	local rewardList = view.listRewardUList

	if closeButton then
		closeButton.luaClick = CallbackHandler(self, "onClickClose")
	end

	if ruleButton then
		ruleButton.luaClick = CallbackHandler(self, "onClickRule")
	end

	if drawButton then
		drawButton.luaClick = CallbackHandler(self, "onClickDraw")
	end

	if skipButton then
		skipButton.luaClick = CallbackHandler(self, "onClickSkip")

		if skipButton.SetPCAction then
			skipButton:SetPCAction("Raw/KeyBoardEsc")
		end
	end

	if rewardList then
		rewardList.luaRenderItem = CallbackHandler(self, "renderRewardItem")
	end

	if pg.global.navMgr then
		pg.global.navMgr:AddLuaHotkeyActivationChangedListener(CONSOLE_BAR_LISTENER_NAME, function()
			self:refreshConsoleBarState()
		end)
	end
end

function HomeGashaponCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	info = info or {}
	self.ornamentId = info.ornamentId
	self.periodStart = nil
	self._session = nil

	self:syncPeriodState()
	self:schedulePeriodReset()
	self:focusFurniture()
	self:refreshStaticTexts()
	self:refreshAll()
	self:applyDrawContentVisible(true)
	self:refreshSkipButton()
	self:refreshConsoleBarState()
end

function HomeGashaponCtrl:onDestroy()
	self._gashaponCtrlDestroyed = true

	if pg.global.navMgr then
		pg.global.navMgr:RemoveLuaHotkeyActivationChangedListener(CONSOLE_BAR_LISTENER_NAME)
	end

	self:killDrawTimers()
	self:clearRewardPanelCloseWait()

	if self.periodResetTimer then
		self:killTimer(self.periodResetTimer)

		self.periodResetTimer = nil
	end

	self.drawRewardVxTierId = nil
	self.isRewardVxDelayFinished = false
	self._session = nil

	self:resetFurnitureDraw()
	self:applyDrawContentVisible(true)

	if self._focusEnabled and pg.game and pg.game.camera then
		pg.game.camera:enableFocusTarget(false)

		self._focusEnabled = false
	end

	if self._showcaseActorsHidden and pg.me then
		pg.me:setVisible(ClientConst.MODEL_VISIBLE_KEY.HOME_GASHAPON, true)
		pg.me:setCurPetVisible(ClientConst.MODEL_VISIBLE_KEY.HOME_GASHAPON, true)

		for petId in pairs(self._hiddenHomePetIds) do
			local pet = pg.getEntity(petId)

			if pet then
				pet:setVisible(ClientConst.MODEL_VISIBLE_KEY.HOME_GASHAPON, true)
			end
		end

		table.clear(self._hiddenHomePetIds)

		self._showcaseActorsHidden = false
	end

	UICtrl.onDestroy(self)
end

function HomeGashaponCtrl:isDrawSessionActive()
	return self._session ~= nil
end

function HomeGashaponCtrl:canStartDraw()
	return self._session == nil and not self._gashaponCtrlDestroyed
end

function HomeGashaponCtrl:canSkipDraw()
	local session = self._session

	return session ~= nil and session.skip == SkipPhase.None and not self._gashaponCtrlDestroyed
end

function HomeGashaponCtrl:canClosePanel()
	return self._session == nil
end

function HomeGashaponCtrl:canCompleteSession()
	local session = self._session

	if not session then
		return false
	end

	if not session.furnitureDone then
		return false
	end

	if session.ui ~= UiPhase.ContentHidden then
		return false
	end

	if session.obtain == ObtainPhase.Waiting then
		return false
	end

	if session.skip == SkipPhase.Settling then
		return false
	end

	if session.skip ~= SkipPhase.None and session.obtain ~= ObtainPhase.Closed then
		return false
	end

	return true
end

function HomeGashaponCtrl:beginDrawSession()
	self._session = {
		furnitureDone = false,
		ui = UiPhase.ButtonAnim,
		drawRpc = DrawRpc.Idle,
		skip = SkipPhase.None,
		obtain = ObtainPhase.None
	}
end

function HomeGashaponCtrl:endDrawSession()
	if self.drawAnimTimer then
		self:killTimer(self.drawAnimTimer)

		self.drawAnimTimer = nil
	end

	self:clearRewardPanelCloseWait()

	self._session = nil

	self:refreshDrawState()
	self:applyDrawContentVisible(true)
	self:refreshSkipButton()
end

function HomeGashaponCtrl:tryCompleteDrawSession()
	if not self:canCompleteSession() then
		return
	end

	self:endDrawSession()
end

function HomeGashaponCtrl:killDrawTimers()
	if self.drawAnimTimer then
		self:killTimer(self.drawAnimTimer)

		self.drawAnimTimer = nil
	end

	if self.drawButtonAnimTimer then
		self:killTimer(self.drawButtonAnimTimer)

		self.drawButtonAnimTimer = nil
	end

	if self.drawRewardVxAnimTimer then
		self:killTimer(self.drawRewardVxAnimTimer)

		self.drawRewardVxAnimTimer = nil
	end
end

function HomeGashaponCtrl:refreshConsoleBarState()
	local navMgr = pg.global.navMgr

	if not navMgr then
		return
	end

	local inRewardList = navMgr.CurrentFocusedGroupName == NAV_GROUP_REWARD_LIST
	local inCurrencyList = navMgr.CurrentFocusedGroupName == NAV_GROUP_CURRENCY_LIST
	local isVirtualMouseMode = navMgr.IsVirtualMouseMode

	navMgr:SetConsoleBarState(CONSOLE_BAR_STATE_RULE, not inRewardList and not inCurrencyList and not isVirtualMouseMode)
	navMgr:SetConsoleBarState(CONSOLE_BAR_STATE_SELECT, inRewardList or inCurrencyList)
	self:refreshRuleButtonVisibility(isVirtualMouseMode)
end

function HomeGashaponCtrl:refreshRuleButtonVisibility(isVirtualMouseMode)
	local hideRuleButton = pg.game.input:isUsingGamepad() and not isVirtualMouseMode

	self.view.btnInfoUButton.renderOpacity = hideRuleButton and 0.001 or 1
end

function HomeGashaponCtrl:refreshStaticTexts()
	setText(self.view.tMPUSDFText, pg.getGameString("HOME_GACHA_TIPS_TITLE"))
	setText(self.view.txtNameUSDFText, pg.getGameString("BATTLEPASS_RULE_TITLE"))
	setText(self.view.txtNumUSDFText, "")
	setText(self.view.niuDanUSDFText, pg.getGameString("HOME_GACHA"))
end

function HomeGashaponCtrl:refreshAll()
	self:refreshCurrency()
	self:refreshDrawState()
	self:refreshDisplayRewards()
end

function HomeGashaponCtrl:syncPeriodState()
	local periodStart = self.model:getCurrentPeriodStart()

	if self.periodStart == periodStart then
		return false
	end

	self.periodStart = periodStart
	self.drawCount = self.model:getDrawCount()
	self.drawLimit = self.model:getDrawLimit()
	self.nextCostCount = self.model:getCostCount(self.drawCount + 1)

	return true
end

function HomeGashaponCtrl:schedulePeriodReset()
	if self.periodResetTimer then
		self:killTimer(self.periodResetTimer)

		self.periodResetTimer = nil
	end

	local nextResetTime = self.model:getNextResetTime()

	if nextResetTime <= 0 then
		return
	end

	local delay = nextResetTime - Time.secondCache + HomeGashaponCtrl.PERIOD_RESET_DELAY_OFFSET

	self.periodResetTimer = self:startTimer(function()
		self.periodResetTimer = nil

		self:syncPeriodState()
		self:refreshDrawState()
		self:schedulePeriodReset()
	end, delay)
end

function HomeGashaponCtrl:refreshCurrency()
	local costItemId = self.model:getCostItemId()
	local iconCostItem = self.view.iconCostUImage

	if iconCostItem then
		iconCostItem.url = LuaUIUtils.getIconByItemId(costItemId)
	end

	if self.view.listCurrencyUList and costItemId > 0 then
		LuaUIUtils.setTopCurrencyItemList(self.view.listCurrencyUList, nil, {
			costItemId
		})
	end
end

function HomeGashaponCtrl:refreshDrawState()
	local canDraw = self:canStartDraw()
	local ownCount = ClientUtils.getItemCountById(self.model:getCostItemId(), true) or 0
	local costCountText = tostring(self.nextCostCount)

	if ownCount < self.nextCostCount then
		costCountText = "<color=#FF6969>" .. costCountText .. "</color>"
	end

	setText(self.view.txtCostUSDFText, costCountText)

	local remainingDrawCount = math.max(self.drawLimit - self.drawCount, 0)

	setText(self.view.txtTitleUSDFText, pg.getFormatText(pg.getGameString("HOME_GACHA_NUM"), remainingDrawCount, self.drawLimit))

	local drawButton = self.view.btnPlayUButton

	if drawButton then
		drawButton.interactable = canDraw
	end
end

function HomeGashaponCtrl:refreshDisplayRewards()
	local list = self.view.listRewardUList

	if list then
		list:SetList(self.model:getDisplayRewards())
	end
end

function HomeGashaponCtrl:onItemCountChanged(message)
	local costItemId = self.model:getCostItemId()
	local changedItemId = message and tonumber(message.itemId or message.genId) or nil

	if changedItemId and changedItemId ~= costItemId then
		return
	end

	self:refreshCurrency()
	self:refreshDrawState()
end

function HomeGashaponCtrl:renderRewardItem(button, index, data)
	LuaUIUtils.renderRewardItem(button, data)
end

function HomeGashaponCtrl:onClickDraw()
	if not self:canStartDraw() then
		return
	end

	if self:syncPeriodState() then
		self:refreshDrawState()
	end

	if not self:canDrawWithNotice() then
		return
	end

	self:beginDrawSession()
	self:playFurnitureStart()
	self:playRewardVx()
	self:startDrawRequestAfterButtonAnim()
end

function HomeGashaponCtrl:onClickSkip()
	self:trySkipDraw()
end

function HomeGashaponCtrl:trySkipDraw()
	local session = self._session

	if not self:canSkipDraw() or not session then
		return
	end

	session.skip = SkipPhase.PendingSettle

	self:refreshSkipButton()

	if session.ui == UiPhase.ButtonAnim then
		self:forceFinishDrawButtonAnimForSkip()
	end

	self:clearRewardVxState()
	self:skipFurnitureDrawPresentation()

	if session.drawRpc == DrawRpc.Ok then
		self:requestSkipSettle()
	end
end

function HomeGashaponCtrl:forceFinishDrawButtonAnimForSkip()
	local session = self._session

	if not session or session.ui ~= UiPhase.ButtonAnim then
		return
	end

	if self.drawButtonAnimTimer then
		self:killTimer(self.drawButtonAnimTimer)

		self.drawButtonAnimTimer = nil
	end

	self:applyDrawContentVisible(false)

	if session.drawRpc == DrawRpc.Idle then
		self:requestDraw()
	end
end

function HomeGashaponCtrl:skipFurnitureDrawPresentation()
	if self.drawAnimTimer then
		self:killTimer(self.drawAnimTimer)

		self.drawAnimTimer = nil
	end

	local targetEntity = self:getTargetEntity()

	if targetEntity and targetEntity.skipHomeGashaponDraw then
		targetEntity:skipHomeGashaponDraw(CallbackHandler(self, "onFurnitureDrawFinished"))
	else
		self:resetFurnitureDraw()
		self:onFurnitureDrawFinished()
	end
end

function HomeGashaponCtrl:requestSkipSettle()
	local session = self._session

	if self._gashaponCtrlDestroyed or not session then
		return
	end

	if session.drawRpc ~= DrawRpc.Ok then
		session.skip = SkipPhase.PendingSettle

		return
	end

	if session.skip == SkipPhase.Settling or session.skip == SkipPhase.Active then
		return
	end

	session.skip = SkipPhase.Settling

	self:refreshSkipButton()
	pg.me:serverMsg("RPC_CS_HomeLotterySkipRewardDelay", CallbackHandler(self, "onSkipSettleResult"))
end

function HomeGashaponCtrl:onSkipSettleResult(_code)
	if self._gashaponCtrlDestroyed then
		return
	end

	local session = self._session

	if not session then
		return
	end

	session.skip = SkipPhase.Active

	if session.obtain ~= ObtainPhase.Waiting and session.obtain ~= ObtainPhase.Closed then
		self:waitRewardPanelClose()
	end

	self:refreshSkipButton()
end

function HomeGashaponCtrl:refreshSkipButton()
	local skipButton = self.view and self.view.btnSkipUButton

	if not skipButton then
		return
	end

	local session = self._session
	local showSkip = session ~= nil and session.ui == UiPhase.ContentHidden and self:canSkipDraw()
	local go = skipButton.gameObject

	if go then
		go:SetActiveEx(showSkip)
	end

	LuaUIUtils.setUIVisible(skipButton, showSkip)

	if skipButton.interactable ~= nil then
		skipButton.interactable = showSkip
	end
end

function HomeGashaponCtrl:canDrawWithNotice()
	if self.drawLimit <= 0 then
		pg.global.showBubbleMessage(NoticeDef.ERROR_CHECK_COND_FAILED)

		return false
	end

	if self.drawCount >= self.drawLimit then
		pg.global.showBubbleMessage(NoticeDef.HOME_LOTTERY_LIMIT_REACHED)

		return false
	end

	local costItemId = self.model:getCostItemId()
	local ownCount = ClientUtils.getItemCountById(costItemId, true) or 0

	if ownCount < self.nextCostCount then
		pg.global.showBubbleMessage(NoticeDef.HOME_GACHA_COIN_LACK)

		return false
	end

	return true
end

function HomeGashaponCtrl:startDrawRequestAfterButtonAnim()
	local session = self._session

	if not session then
		return
	end

	session.ui = UiPhase.ButtonAnim

	self:scheduleDrawButtonAnimDelay()
	self:refreshDrawState()
end

function HomeGashaponCtrl:scheduleDrawButtonAnimDelay()
	if self.drawButtonAnimTimer then
		self:killTimer(self.drawButtonAnimTimer)
	end

	self.drawButtonAnimTimer = self:startTimer(function()
		self.drawButtonAnimTimer = nil

		self:onDrawButtonAnimFinished()
	end, HomeGashaponCtrl.DRAW_BUTTON_ANIM_DELAY)
end

function HomeGashaponCtrl:onDrawButtonAnimFinished()
	local session = self._session

	if self._gashaponCtrlDestroyed or not session or session.ui ~= UiPhase.ButtonAnim then
		return
	end

	if self.drawButtonAnimTimer then
		self:killTimer(self.drawButtonAnimTimer)

		self.drawButtonAnimTimer = nil
	end

	self:applyDrawContentVisible(false)

	if session.drawRpc == DrawRpc.Idle then
		self:requestDraw()
	end

	self:tryCompleteDrawSession()
end

function HomeGashaponCtrl:requestDraw()
	local session = self._session

	if not session or session.drawRpc ~= DrawRpc.Idle then
		return
	end

	session.drawRpc = DrawRpc.Requesting

	self:refreshDrawState()
	pg.me:serverMsg("RPC_CS_HomeLotteryDraw", CallbackHandler(self, "onDrawResult"))
end

function HomeGashaponCtrl:onDrawResult(code, _tierId, _rewardConfigId, drawCount, drawLimit, costCount)
	if self._gashaponCtrlDestroyed then
		return
	end

	local session = self._session

	self.drawCount = drawCount
	self.drawLimit = drawLimit
	self.nextCostCount = costCount

	self:refreshAll()

	if code ~= NoticeDef.SUCCESS then
		pg.global.showBubbleMessage(code)
		self:clearRewardPanelCloseWait()
		self:clearRewardVxState()
		self:resetFurnitureDraw()

		if session then
			session.skip = SkipPhase.None
			session.drawRpc = DrawRpc.Idle
			session.furnitureDone = true

			if session.ui ~= UiPhase.ContentHidden then
				self:applyDrawContentVisible(false)
			end

			self:endDrawSession()
		end

		return
	end

	if not session then
		return
	end

	session.drawRpc = DrawRpc.Ok

	self:waitRewardPanelClose()

	if session.skip == SkipPhase.PendingSettle then
		self:clearRewardVxState()
		self:requestSkipSettle()

		return
	end

	self:cacheRewardVxTierId(_tierId)
end

function HomeGashaponCtrl:playRewardVx()
	if self.drawRewardVxAnimTimer then
		self:killTimer(self.drawRewardVxAnimTimer)
	end

	self.drawRewardVxTierId = nil
	self.isRewardVxDelayFinished = false
	self.drawRewardVxAnimTimer = self:startTimer(function()
		self.drawRewardVxAnimTimer = nil
		self.isRewardVxDelayFinished = true

		self:tryPlayRewardVx()
	end, HomeGashaponCtrl.DRAW_ANIM_REWARD_TIME)
end

function HomeGashaponCtrl:cacheRewardVxTierId(tierId)
	self.drawRewardVxTierId = tierId

	self:tryPlayRewardVx()
end

function HomeGashaponCtrl:tryPlayRewardVx()
	if not self.isRewardVxDelayFinished or not self.drawRewardVxTierId then
		return
	end

	local tierId = self.drawRewardVxTierId

	self:clearRewardVxState()

	if tierId == 1 then
		self:onRewardVxConfirmed()
	end
end

function HomeGashaponCtrl:clearRewardVxState()
	if self.drawRewardVxAnimTimer then
		self:killTimer(self.drawRewardVxAnimTimer)

		self.drawRewardVxAnimTimer = nil
	end

	self.drawRewardVxTierId = nil
	self.isRewardVxDelayFinished = false
end

function HomeGashaponCtrl:onRewardVxConfirmed()
	local targetEntity = self:getTargetEntity()

	if targetEntity and targetEntity.playHomeGashaponOpenBoxEffect then
		targetEntity:playHomeGashaponOpenBoxEffect()
	end
end

function HomeGashaponCtrl:playFurnitureStart()
	local session = self._session

	if not session then
		return
	end

	session.furnitureDone = false

	self:refreshDrawState()

	local targetEntity = self:getTargetEntity()
	local animStarted = false

	if targetEntity and targetEntity.playHomeGashaponDraw then
		animStarted = targetEntity:playHomeGashaponDraw(CallbackHandler(self, "onFurnitureDrawFinished"))
	end

	if not animStarted then
		session.furnitureDone = true

		return
	end

	if self.drawAnimTimer then
		self:killTimer(self.drawAnimTimer)
	end

	self.drawAnimTimer = self:startTimer(function()
		self:onFurnitureDrawFinished()
	end, HomeGashaponCtrl.DRAW_ANIM_FALLBACK_TIME)
end

function HomeGashaponCtrl:resetFurnitureDraw()
	local targetEntity = self:getTargetEntity()

	if targetEntity and targetEntity.playHomeGashaponIdleAnim then
		targetEntity:playHomeGashaponIdleAnim()
	end
end

function HomeGashaponCtrl:onFurnitureDrawFinished()
	if self._gashaponCtrlDestroyed then
		return
	end

	local session = self._session

	if not session then
		return
	end

	session.furnitureDone = true

	self:tryCompleteDrawSession()
end

function HomeGashaponCtrl:waitRewardPanelClose()
	local session = self._session

	self:clearRewardPanelCloseWait()

	if session then
		session.obtain = ObtainPhase.Waiting
	end

	function self.onRewardPanelClose()
		self:onRewardPanelClosed()
	end

	pg.global.eventEmitter:addEventListener(EventConst.ON_ITEM_OBTAIN_CLOSE_PANEL, self.onRewardPanelClose)
end

function HomeGashaponCtrl:onRewardPanelClosed()
	local session = self._session

	if session then
		session.obtain = ObtainPhase.Closed
	end

	self:removeRewardPanelCloseListener()
	self:tryCompleteDrawSession()
end

function HomeGashaponCtrl:removeRewardPanelCloseListener()
	if self.onRewardPanelClose then
		pg.global.eventEmitter:removeEventListener(EventConst.ON_ITEM_OBTAIN_CLOSE_PANEL, self.onRewardPanelClose)

		self.onRewardPanelClose = nil
	end
end

function HomeGashaponCtrl:clearRewardPanelCloseWait()
	self:removeRewardPanelCloseListener()

	local session = self._session

	if session and session.obtain == ObtainPhase.Waiting then
		session.obtain = ObtainPhase.None
	end
end

function HomeGashaponCtrl:applyDrawContentVisible(visible)
	local session = self._session

	if session then
		session.ui = visible and UiPhase.ContentShown or UiPhase.ContentHidden
	end

	LuaUIUtils.setUIVisible(self.view.topBackUWidget, visible)
	LuaUIUtils.setUIVisible(self.view.bottomUWidget, visible)
	self:refreshSkipButton()
end

function HomeGashaponCtrl:checkCommonQuit()
	if self:isDrawSessionActive() then
		if self:canSkipDraw() then
			self:trySkipDraw()
		end

		return false
	end

	if self.view and self.view.widget and self.view.widget.isClosing then
		return false
	end

	return UICtrl.checkCommonQuit(self)
end

function HomeGashaponCtrl:onClickRule()
	pg.global.ui:open(UIConst.UI_ID_HOME_GASHAPON_RULE)
end

function HomeGashaponCtrl:getTargetEntity()
	if not self.ornamentId or not pg.game or not pg.game.home then
		return nil
	end

	return pg.game.home:getHomeEntity(self.ornamentId)
end

function HomeGashaponCtrl:focusFurniture()
	if not self.ornamentId or not pg.game or not pg.game.home or not pg.game.camera then
		return
	end

	local targetEntity = self:getTargetEntity()

	if not targetEntity or not targetEntity.eModel or not targetEntity.getPositionAgentPosition or not targetEntity.getRotation then
		return
	end

	local furnitureHeight = tonumber(targetEntity.eModel:GetMeshSize(Const.COMPONENT_IDX_ITEM, 1)) or 0

	if furnitureHeight <= 0 and targetEntity.getBoundHeight then
		furnitureHeight = tonumber(targetEntity:getBoundHeight()) or 0
	end

	if furnitureHeight <= 0 then
		return
	end

	local furniturePosition = targetEntity:getPositionAgentPosition()
	local furnitureForward = targetEntity:getRotation():Forward()

	furnitureForward.y = 0

	if Vector3.SqrMagnitude(furnitureForward) <= 0.0001 then
		return
	end

	furnitureForward:Normalize()

	local furnitureRight = targetEntity:getRotation() * Vector3.right

	furnitureRight.y = 0

	if Vector3.SqrMagnitude(furnitureRight) <= 0.0001 then
		return
	end

	furnitureRight:Normalize()

	local furnitureCenter = furniturePosition + Vector3.up * (furnitureHeight * 0.5)
	local halfFovRadian = math.rad(HomeGashaponCtrl.SHOWCASE_FOV * 0.5)
	local cameraDistance = furnitureHeight * 0.5 / (math.tan(halfFovRadian) * HomeGashaponCtrl.SHOWCASE_VERTICAL_COVERAGE)
	local pitchRadian = math.rad(HomeGashaponCtrl.SHOWCASE_PITCH)
	local yawRadian = math.rad(HomeGashaponCtrl.SHOWCASE_YAW)
	local cameraDirection = furnitureForward * math.cos(yawRadian) - furnitureRight * math.sin(yawRadian)
	local cameraPosition = furnitureCenter + cameraDirection * (cameraDistance * math.cos(pitchRadian)) + Vector3.up * (cameraDistance * math.sin(pitchRadian))
	local baseRotation = Quaternion.LookRotation(furnitureCenter - cameraPosition, Vector3.up)
	local cameraRight = baseRotation * Vector3.right
	local lookAtPosition = furnitureCenter + cameraRight * (cameraDistance * HomeGashaponCtrl.SHOWCASE_HORIZONTAL_OFFSET_RATIO) + Vector3.up * (cameraDistance * HomeGashaponCtrl.SHOWCASE_VERTICAL_OFFSET_RATIO)
	local cameraRotation = Quaternion.LookRotation(lookAtPosition - cameraPosition, Vector3.up)

	pg.me:setVisible(ClientConst.MODEL_VISIBLE_KEY.HOME_GASHAPON, false)
	pg.me:setCurPetVisible(ClientConst.MODEL_VISIBLE_KEY.HOME_GASHAPON, false)

	self._showcaseActorsHidden = true

	self:onHomelandPetsChanged()
	pg.game.camera:enableFocusTarget(true, {
		homeGashapon = targetEntity
	}, {
		position = cameraPosition,
		rotation = cameraRotation,
		fov = HomeGashaponCtrl.SHOWCASE_FOV,
		blendTime = HomeGashaponCtrl.SHOWCASE_BLEND_TIME
	})

	self._focusEnabled = true
end

function HomeGashaponCtrl:onHomelandPetsChanged()
	if not self._showcaseActorsHidden or not pg.space or not pg.space.pets then
		return
	end

	for petId in pairs(pg.space.pets) do
		local pet = pg.getEntity(petId)

		if pet then
			pet:setVisible(ClientConst.MODEL_VISIBLE_KEY.HOME_GASHAPON, false)

			self._hiddenHomePetIds[petId] = true
		end
	end
end

function HomeGashaponCtrl:onClickClose()
	if not self:canClosePanel() then
		return
	end

	if self.view and self.view.widget and self.view.widget.isClosing then
		return
	end

	self:close()
end

return HomeGashaponCtrl
