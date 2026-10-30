-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\GrabEggsSeasonChallenge\\GrabEggsSeasonChallengeCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local Const = require("Common.Const.Const")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local TipAreaConst = require("Guis.Panels.Tips.TipAreaConst")
local logger = require("Core.Log.LoggerManager").getLogger("GrabEggsSeasonChallengeCtrl")
local GrabEggsSeasonChallengeCtrl = Class.LightClass("GrabEggsSeasonChallengeCtrl", UICtrl)
local DragEventListener = CS.XGUI.EventSystems.DragEventListener
local EInvokeTime = CS.XGUI.EInvokeTime
local SWIPE_DISTANCE = 80
local FLIGHT_TIMEOUT = 5
local REQUEST_TIMEOUT = 10
local OBTAIN_WAIT_INTERVAL = 0.1
local OBTAIN_WAIT_TICKS = 15
local CUP_COUNT_FIELDS = {
	"copper",
	"silver",
	"gold"
}

GrabEggsSeasonChallengeCtrl.messages = {
	[MessageName.GRAB_EGG_SEASON_CHALLENGE_CHANGED] = {
		"onChallengeChanged",
		true
	}
}

local function setText(widget, text)
	if NotNil(widget) then
		ClientTextUtils.setText(widget, text)
	end
end

function GrabEggsSeasonChallengeCtrl:onCreate(info)
	self.selectedLevels = {}
	self.rowContexts = {}
	self.rewardRedDotPaths = {}
	self.flights = {}
	self.rewardFlightCoins = {}
	self.lifecycleVersion = 0

	UICtrl.onCreate(self, info)
end

function GrabEggsSeasonChallengeCtrl:addListener()
	local view = self.view
	local buttons = view.widget:GetComponentsInChildren(typeof(CS.XGUI.UButton), true)

	for i = 0, buttons.Length - 1 do
		if buttons[i].name == "BtnBack" then
			local button = buttons[i]

			function button.luaClick()
				self:close()
			end

			self:bindCloseButton(button)

			break
		end
	end

	function view.challengeUList.luaRenderItem(button, _, data)
		if data.tIndex == 0 then
			self.rowContexts[button.gameObject:GetInstanceID()] = nil

			setText(button.title, data.title)

			button.luaClick = nil
		else
			self:renderChallenge(button, data, false)
		end
	end

	function view.btnReceiveUButton.luaClick()
		self:claimRewards(nil)
	end

	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.GRAB_EGG_MODE_SEASON_CHALLENGE_LIST, view.challengeUList, function()
		return self.model:hasClaimableReward() and RedDotConst.RedDotStyle.REWARD or RedDotConst.RedDotStyle.NONE
	end)
	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.GRAB_EGG_MODE_SEASON_CHALLENGE_RECEIVE, view.btnReceiveUButton, function()
		return self.model:hasClaimableReward() and RedDotConst.RedDotStyle.REWARD or RedDotConst.RedDotStyle.NONE
	end)
end

function GrabEggsSeasonChallengeCtrl:onShow()
	UICtrl.onShow(self)

	self.isShown = true
	self.lifecycleVersion = self.lifecycleVersion + 1

	self:bindSwipe()
	self:refresh(true)
end

function GrabEggsSeasonChallengeCtrl:isBusy()
	return self.requestPending or self.pendingRewardStages ~= nil or next(self.flights) ~= nil
end

function GrabEggsSeasonChallengeCtrl:refresh(firstShow)
	if not self.isShown then
		return
	end

	if self:isBusy() then
		return
	end

	self:clearRewardRedDots()

	local list = self.view.challengeUList
	local position = list.currentScrollPosition

	self.rows = self.model:buildChallengeList()
	self.swipe = nil
	self.rowContexts = {}

	if firstShow then
		list:SetList(self.rows)
	else
		list.itemData = self.rows

		list:RefreshList(true)

		list.currentScrollPosition = position
	end

	self:refreshSeason()
	self:refreshCareerCounts()
	self:refreshButtons()
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.GRAB_EGG_MODE_SEASON_CHALLENGE_LIST)
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.GRAB_EGG_MODE_SEASON_CHALLENGE_RECEIVE)
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.GRAB_EGG_MODE_SEASON_CHALLENGE)
end

function GrabEggsSeasonChallengeCtrl:refreshSeason()
	local view = self.view

	setText(view.challengeTitleUSDFText, pg.getGameString("GRAB_EGG_SEASON_CHALLENGE_UI_1"))
	setText(view.careerTipsUSDFText, pg.getGameString("GRAB_EGG_SEASON_CHALLENGE_UI_2"))
	setText(view.btnReceiveUButton.title, pg.getGameString("SEASON_CLAIMALL"))

	local info = self.model:getCurrentSeasonInfo()

	view.seasonTagUWidget:SetActive(info ~= nil)
	view.countDownUCountDown:SetActive(info ~= nil and info.endTime ~= nil)

	if not info then
		view.countDownUCountDown:Stop()

		return
	end

	local reference = view.seasonTagUWidget:GetComponent("ObjectReference")
	local icon = reference:GetRefValue("seasonTagUImage")
	local title = reference:GetRefValue("titleUSDFText")
	local config = info.config or {}

	setText(title, config.seasonTagText and pg.getLocalizationText(config.seasonTagText) or info.numText)

	if NotNil(icon) and config.seasonTagNo then
		icon.url = config.seasonTagNo
	end

	if info.endTime then
		LuaUIUtils.setCountDownTime(view.countDownUCountDown, info.endTime, UIConst.TimeType.Short)
	end
end

function GrabEggsSeasonChallengeCtrl:refreshCareerCounts()
	local counts = self.rewardDisplayCounts or self.model:getCareerCounts()

	setText(self.view.goldCountUSDFText, counts.gold)
	setText(self.view.silverCountUSDFText, counts.silver)
	setText(self.view.copperCountUSDFText, counts.copper)
end

function GrabEggsSeasonChallengeCtrl:refreshButtons()
	local available = not self:isBusy()

	self.view.btnReceiveUButton.interactable = available and self.model:hasClaimableReward()

	for _, context in pairs(self.rowContexts) do
		if NotNil(context.button) and context.stage then
			context.left.interactable = available and self.model:getAdjacentStage(context.group, context.stage.level, -1) ~= nil
			context.right.interactable = available and self.model:getAdjacentStage(context.group, context.stage.level, 1) ~= nil
		end
	end
end

function GrabEggsSeasonChallengeCtrl:getRowContext(button)
	local id = button.gameObject:GetInstanceID()
	local context = self.rowContexts[id]

	if context then
		return context
	end

	local reference = button:GetComponent("ObjectReference")

	context = {
		button = button,
		left = reference:GetRefValue("btnLeftUButton"),
		right = reference:GetRefValue("btnRightUButton"),
		pages = reference:GetRefValue("pageUList"),
		iconFake = reference:GetRefValue("iconFakeUImage"),
		text = reference:GetRefValue("txtNameUSDFText"),
		rewards = reference:GetRefValue("rewardUList"),
		coin = reference:GetRefValue("vXCupCoinGeneral")
	}
	self.rowContexts[id] = context
	context.iconFake.forceSyncLoad = true
	context.text.supportRichText = true

	function context.left.luaClick()
		self:switchStage(context, -1)
	end

	function context.right.luaClick()
		self:switchStage(context, 1)
	end

	function context.pages.luaRenderItem(page, _, data)
		page:TryChangePage("State", data.selected and 1 or 0, true)
	end

	function context.rewards.luaRenderItem(rewardButton, _, data)
		self:renderReward(rewardButton, data, context)
	end

	return context
end

function GrabEggsSeasonChallengeCtrl:renderChallenge(button, group, animate)
	local context = self:getRowContext(button)
	local oldStage = context.stage
	local sameGroup = context.group and context.group.key == group.key
	local stage = self.model:getStageForDisplay(group, self.selectedLevels[group.key])

	if not stage then
		return
	end

	if animate and sameGroup and oldStage then
		context.iconFake.url = self.model:getBadgeUrl(oldStage.level)
	end

	context.group = group
	context.stage = stage
	self.selectedLevels[group.key] = stage.level

	button:TryChangePage("Level", stage.controllerLevel, not animate or not sameGroup)
	button:TryChangePage("State", stage.state, true)
	setText(context.text, stage.text)

	local pages = {}

	for _, item in ipairs(group.stages) do
		pages[#pages + 1] = {
			selected = item.level == stage.level
		}
	end

	context.pages:SetList(pages)
	context.rewards:SetList(stage.rewards)

	context.left.interactable = not self:isBusy() and self.model:getAdjacentStage(group, stage.level, -1) ~= nil
	context.right.interactable = not self:isBusy() and self.model:getAdjacentStage(group, stage.level, 1) ~= nil
end

function GrabEggsSeasonChallengeCtrl:switchStage(context, direction)
	if self:isBusy() or not context.stage then
		return
	end

	local nextStage = self.model:getAdjacentStage(context.group, context.stage.level, direction)

	if not nextStage then
		return
	end

	self.selectedLevels[context.group.key] = nextStage.level

	self:renderChallenge(context.button, context.group, true)
end

function GrabEggsSeasonChallengeCtrl:renderReward(button, reward, context)
	LuaUIUtils.renderRewardItem(button, reward)

	button.draggable = false

	local canClaim = context.stage and context.stage.isClaimable
	local path = string.format(RedDotConst.RedDotPath.GRAB_EGG_MODE_SEASON_CHALLENGE_REWARD_ITEM, button.gameObject:GetInstanceID())

	self.rewardRedDotPaths[path] = true

	pg.global.setRedDot(path, button, canClaim, RedDotConst.RedDotStyle.REWARD)

	if canClaim then
		function button.luaClick()
			self:claimRewards(context.stage)
		end
	end
end

function GrabEggsSeasonChallengeCtrl:clearRewardRedDots()
	for path in pairs(self.rewardRedDotPaths) do
		pg.global.setRedDot(path, nil, false, RedDotConst.RedDotStyle.NONE)
	end

	self.rewardRedDotPaths = {}
end

function GrabEggsSeasonChallengeCtrl:onChallengeChanged()
	if not self.isShown then
		return
	end

	if self:isBusy() then
		return
	end

	if self.refreshScheduled then
		return
	end

	self.refreshScheduled = true

	local version = self.lifecycleVersion

	self:startFrameTimer(function()
		if not self.isShown or version ~= self.lifecycleVersion then
			return
		end

		self.refreshScheduled = false

		self:refresh(false)
	end, 1)
end

function GrabEggsSeasonChallengeCtrl:claimRewards(stage)
	if self:isBusy() or self.refreshScheduled then
		return
	end

	if not pg.me or stage and stage.seasonId ~= pg.me.seasonId then
		return
	end

	local stages = stage and {
		stage
	} or self.model:getClaimableStages()

	if #stages == 0 or stage and not stage.isClaimable then
		return
	end

	self.rewardDisplayCounts = self.model:getCareerCounts()
	self.requestPending = true
	self.requestVersion = (self.requestVersion or 0) + 1

	self:refreshButtons()

	local version = self.lifecycleVersion
	local requestVersion = self.requestVersion

	local function callback(result)
		if not self.isShown or version ~= self.lifecycleVersion then
			return
		end

		if requestVersion ~= self.requestVersion or not self.requestPending then
			return
		end

		self:stopRewardRequest()

		if result ~= Const.RPC_ERROR_CODE.SUCCESS then
			logger:warn("season challenge reward request failed, result=%s", tostring(result))

			self.rewardDisplayCounts = nil

			self:refresh(false)

			return
		end

		self:waitForRewardObtain(stages)
	end

	self.requestTimer = self:startTimer(function()
		if not self.isShown or version ~= self.lifecycleVersion or requestVersion ~= self.requestVersion then
			return
		end

		self.requestTimer = nil

		self:stopRewardRequest()

		self.rewardDisplayCounts = nil

		self:refresh(false)
	end, REQUEST_TIMEOUT)

	if stage then
		pg.me:requestGrabEggSeasonChallengeReward(stage.id, callback)
	else
		pg.me:requestAllGrabEggSeasonChallengeRewards(callback)
	end
end

function GrabEggsSeasonChallengeCtrl:stopRewardRequest()
	if self.requestTimer then
		self:killTimer(self.requestTimer)

		self.requestTimer = nil
	end

	self.requestPending = false
	self.requestVersion = (self.requestVersion or 0) + 1
end

function GrabEggsSeasonChallengeCtrl:hasQueuedRewardObtain()
	local tips = pg.global.ui:tryGetCtrlByUid(UIConst.UI_ID_TIPS)
	local manager = tips and tips.areaManager

	if not manager or not manager:hasAreaItem(TipAreaConst.AREAS.MI, "PropsObtain") then
		return false
	end

	local item = manager:getAreaItem(TipAreaConst.AREAS.MI, "PropsObtain")

	return item ~= nil and (not item:isQueueEmpty() or item:firstRunItem() ~= nil)
end

function GrabEggsSeasonChallengeCtrl:waitForRewardObtain(stages)
	self.pendingRewardStages = stages

	local version = self.lifecycleVersion
	local waitTicks, obtainSeen = 0, false

	self:refreshButtons()

	self.rewardObtainTimer = self:startTimer(function()
		if not self.isShown or version ~= self.lifecycleVersion or self.pendingRewardStages ~= stages then
			return
		end

		if pg.global.ui:checkUIOpen(UIConst.UI_ID_COMMON_OBTAIN) then
			obtainSeen = true

			return
		end

		if self:hasQueuedRewardObtain() or pg.global.ui:checkHasWaitingShowFullPanel() or pg.global.ui:checkHasPendingDestroyFullPanel() then
			return
		end

		waitTicks = waitTicks + 1

		if not obtainSeen and waitTicks < OBTAIN_WAIT_TICKS then
			return
		end

		self:stopRewardObtainWait()
		self:startRewardFlights(stages)
	end, OBTAIN_WAIT_INTERVAL, true)
end

function GrabEggsSeasonChallengeCtrl:stopRewardObtainWait()
	if self.rewardObtainTimer then
		self:killTimer(self.rewardObtainTimer)

		self.rewardObtainTimer = nil
	end

	self.pendingRewardStages = nil
end

function GrabEggsSeasonChallengeCtrl:getFlyTarget(level)
	if level == 1 then
		return self.view.copperFlyNodeUWidget, EInvokeTime.Custom3
	end

	if level == 2 then
		return self.view.silverFlyNodeUWidget, EInvokeTime.Custom2
	end

	return self.view.goldFlyNodeUWidget, EInvokeTime.Custom1
end

function GrabEggsSeasonChallengeCtrl:findVisibleContext(groupKey)
	local list = self.view.challengeUList

	for index, row in ipairs(self.rows or {}) do
		if row.key == groupKey then
			local ok, button = list:TryGetChildAt(index - 1)

			if ok and NotNil(button) then
				local context = self.rowContexts[button.gameObject:GetInstanceID()]

				if context and context.group.key == groupKey then
					return context
				end
			end
		end
	end
end

function GrabEggsSeasonChallengeCtrl:getRewardFlightCoin(index, template)
	local coin = self.rewardFlightCoins[index]

	if IsNil(coin) then
		local gameObject = CS.UnityEngine.Object.Instantiate(template.source.gameObject, self.view.widget.rectTransform, false)
		local widget = gameObject:GetComponent(typeof(CS.XGUI.UWidget))

		widget:TryInit()
		widget:SetActive(false)

		coin = gameObject:GetComponent(typeof(CS.FunPlus.WorldX.UI.Panels.Utils.CoinGeneral))
		self.rewardFlightCoins[index] = coin
	end

	return coin
end

function GrabEggsSeasonChallengeCtrl:startRewardFlights(stages)
	local coinIndex = 0

	for _, stage in ipairs(stages) do
		self.selectedLevels[stage.groupKey] = nil

		local context = self:findVisibleContext(stage.groupKey)

		if context and NotNil(context.coin) then
			coinIndex = coinIndex + 1
			self.flights[stage.id] = {
				coin = self:getRewardFlightCoin(coinIndex, context.coin),
				position = context.coin.source.transform.position,
				stage = stage
			}
		end
	end

	if not next(self.flights) then
		self.rewardDisplayCounts = nil

		self:refresh(false)

		return
	end

	self:refreshButtons()

	local version = self.lifecycleVersion

	for id, flight in pairs(self.flights) do
		self:playRewardFlight(id, flight, version)
	end

	self.flightTimer = self:startTimer(function()
		self.flightTimer = nil

		if not self.isShown or version ~= self.lifecycleVersion then
			return
		end

		self:stopRewardFlights()
		self:refresh(false)
	end, FLIGHT_TIMEOUT)
end

function GrabEggsSeasonChallengeCtrl:playRewardFlight(id, flight, version)
	local stage = flight.stage
	local target, event = self:getFlyTarget(stage.level)
	local coin = flight.coin

	coin.subParent = self.view.widget.rectTransform
	coin.sourcePosition = flight.position
	coin.targetPosition = target.transform.position
	coin.coinIconUrl = ""

	function coin.luaEndFly()
		if not self.isShown or version ~= self.lifecycleVersion then
			return
		end

		if self.flights[id] ~= flight or IsNil(coin) then
			return
		end

		coin.luaEndFly = nil
		self.flights[id] = nil

		self.view.widget:InvokeCallback(event)

		local field = CUP_COUNT_FIELDS[stage.level]

		if self.rewardDisplayCounts then
			local counts = self.model:getCareerCounts()

			self.rewardDisplayCounts[field] = math.min(counts[field], self.rewardDisplayCounts[field] + 1)
		end

		self:refreshCareerCounts()

		if not next(self.flights) then
			if self.flightTimer then
				self:killTimer(self.flightTimer)

				self.flightTimer = nil
			end

			self.rewardDisplayCounts = nil

			self:onChallengeChanged()
		end
	end

	coin:PlayCoinSingle()
end

function GrabEggsSeasonChallengeCtrl:stopRewardFlights()
	if self.flightTimer then
		self:killTimer(self.flightTimer)

		self.flightTimer = nil
	end

	for _, coin in ipairs(self.rewardFlightCoins) do
		if NotNil(coin) then
			coin.luaEndFly = nil

			coin:StopCoin()
		end
	end

	self.flights = {}
	self.rewardDisplayCounts = nil
end

function GrabEggsSeasonChallengeCtrl:findSwipeContext(pointerObject, position)
	local transform = NotNil(pointerObject) and pointerObject.transform or nil
	local origin = transform

	while NotNil(transform) and transform ~= self.view.challengeUList.transform do
		local context = self.rowContexts[transform.gameObject:GetInstanceID()]

		if context then
			local current = origin
			local rewardTransform = context.rewards.transform

			while NotNil(current) and current ~= transform do
				if current == rewardTransform then
					return nil
				end

				current = current.parent
			end

			return context
		end

		transform = transform.parent
	end

	if not position then
		return nil
	end

	local utility, camera = CS.UnityEngine.RectTransformUtility, CS.XGUI.UWidget.uiCamera

	for _, context in pairs(self.rowContexts) do
		if NotNil(context.button) and context.button.gameObject.activeInHierarchy and utility.RectangleContainsScreenPoint(context.button.rectTransform, position, camera) then
			if utility.RectangleContainsScreenPoint(context.rewards.rectTransform, position, camera) then
				return nil
			end

			return context
		end
	end
end

function GrabEggsSeasonChallengeCtrl:bindSwipe()
	if not pg.global.ui:runPlatformByMobile() or self.dragHandle then
		return
	end

	local listener = DragEventListener.Get(self.view.challengeUList.gameObject)
	local handle = {
		listener = listener,
		init = listener.onInitDrag,
		finish = listener.onEndDrag
	}

	self.dragHandle = handle

	function listener.onInitDrag(data)
		self.swipe = nil

		if data and data.isValid then
			local context = self:findSwipeContext(data.pointerObject, data.position)

			if context then
				self.swipe = {
					context = context,
					key = context.group.key,
					x = data.position.x,
					y = data.position.y
				}
			end
		end

		if handle.init then
			handle.init(data)
		end
	end

	function listener.onEndDrag(data)
		local swipe = self.swipe

		self.swipe = nil

		local valid = data and data.isValid
		local dx = valid and swipe and data.position.x - swipe.x or 0
		local dy = valid and swipe and data.position.y - swipe.y or 0

		if handle.finish then
			handle.finish(data)
		end

		if not swipe or not valid or not self.isShown then
			return
		end

		if swipe.context.group.key ~= swipe.key then
			return
		end

		if math.abs(dx) >= SWIPE_DISTANCE and math.abs(dx) > math.abs(dy) then
			self:switchStage(swipe.context, dx < 0 and 1 or -1)
		end
	end

	handle.ownInit, handle.ownFinish = listener.onInitDrag, listener.onEndDrag
end

function GrabEggsSeasonChallengeCtrl:unbindSwipe()
	local handle = self.dragHandle

	if handle and NotNil(handle.listener) then
		if handle.listener.onInitDrag == handle.ownInit then
			handle.listener.onInitDrag = handle.init
		end

		if handle.listener.onEndDrag == handle.ownFinish then
			handle.listener.onEndDrag = handle.finish
		end
	end

	self.dragHandle, self.swipe = nil
end

function GrabEggsSeasonChallengeCtrl:onHide()
	self.isShown = false
	self.lifecycleVersion = self.lifecycleVersion + 1
	self.refreshScheduled = false

	self:stopRewardRequest()
	self:stopRewardObtainWait()
	self:stopRewardFlights()
	self:unbindSwipe()
	self:clearRewardRedDots()
	self.view.countDownUCountDown:Stop()
	UICtrl.onHide(self)
end

function GrabEggsSeasonChallengeCtrl:onDestroy()
	self.isShown = false
	self.lifecycleVersion = self.lifecycleVersion + 1

	self:stopRewardRequest()
	self:stopRewardObtainWait()
	self:stopRewardFlights()
	self:unbindSwipe()
	self:clearRewardRedDots()
	UICtrl.onDestroy(self)
end

return GrabEggsSeasonChallengeCtrl
