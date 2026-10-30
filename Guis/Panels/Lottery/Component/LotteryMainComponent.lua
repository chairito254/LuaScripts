-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Lottery\\Component\\LotteryMainComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("LotteryMainComponent")
local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ItemPropUIUtils = require("Utils.ItemPropUIUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Utils = require("Common.Utils.Utils")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local SuitPowerInteractionComponent = require("Guis.Panels.CashShop.Component.SuitPowerInteractionComponent")
local LotteryRewardComponent = require("Guis.Panels.Lottery.Component.LotteryRewardComponent")
local CallbackHandler = require("Core.Common.CallbackHandler")
local DiscreteBannerController = require("Guis.Helper.DiscreteBannerController")
local LotteryMainComponent = Class.LightClass("LotteryMainComponent", UIComponent)

LotteryMainComponent.TOP_REWARD_VISIBLE_COUNT = 6

function LotteryMainComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.listTopReward = objectReference:GetRefValue("listTopReward")
	self.txtGachaNum = objectReference:GetRefValue("txtGachaNum")
	self.txtGachaTitle = objectReference:GetRefValue("txtGachaTitle")
	self.btnHistory = objectReference:GetRefValue("btnHistory")
	self.btnRewardShow = objectReference:GetRefValue("btnRewardShow")
	self.btnUseStuff = objectReference:GetRefValue("btnUseStuff")
	self.imgStuff = objectReference:GetRefValue("imgStuff")
	self.btnGacha1 = objectReference:GetRefValue("btnGacha1")
	self.txtBtnGacha1 = objectReference:GetRefValue("txtBtnGacha1")
	self.btnGacha1Currency = objectReference:GetRefValue("btnGacha1Currency")
	self.btnGacha10 = objectReference:GetRefValue("btnGacha10")
	self.txtBtnGacha10 = objectReference:GetRefValue("txtBtnGacha10")
	self.btnGacha10Currency = objectReference:GetRefValue("btnGacha10Currency")
	self.txtExGacha1Currency = objectReference:GetRefValue("txtExGacha1Currency")
	self.txtGacha10Discount = objectReference:GetRefValue("txtGacha10Discount")
	self.txtGacha10First = objectReference:GetRefValue("txtGacha10First")
	self.txtName = objectReference:GetRefValue("txtName")
	self.timeCountDown = objectReference:GetRefValue("timeCountDown")
	self.proGetNum = objectReference:GetRefValue("proGetNum")
	self.txtGetNum = objectReference:GetRefValue("txtGetNum")
	self.listBannerObj = objectReference:GetRefValue("listBanner")

	local bannerObjectReference = self.listBannerObj:GetComponent("ObjectReference")

	self.listBanner = bannerObjectReference:GetRefValue("listULoopList")
	self.nameUSDFText = bannerObjectReference:GetRefValue("nameUSDFText")
	self.numUSDFText = bannerObjectReference:GetRefValue("numUSDFText")
	self.iconUImage = bannerObjectReference:GetRefValue("iconUImage")
	self.btnBannerLeft = bannerObjectReference:GetRefValue("leftBtnUButton")
	self.btnBannerRight = bannerObjectReference:GetRefValue("rightBtnUButton")
	self.btnSkipAnim = objectReference:GetRefValue("btnSkipAnim")
	self.btnMakeup = objectReference:GetRefValue("btnMakeup")
	self.btnHide = objectReference:GetRefValue("btnHide")
	self.btnPlayMV = objectReference:GetRefValue("btnPlayMV")
	self.btnGift = objectReference:GetRefValue("btnGift")
	self.txtInteraction = objectReference:GetRefValue("txtInteraction")
	self.listInteraction = objectReference:GetRefValue("listInteraction")
	self.rewardUContainer = objectReference:GetRefValue("rewardUContainer")
	self.rewardUButton = objectReference:GetRefValue("rewardUButton")
	self.btnShowUI = objectReference:GetRefValue("btnShowUI")
	self.discount10UWidget = objectReference:GetRefValue("discount10UWidget")
end

function LotteryMainComponent:registerObjects()
	function self.btnGacha1.luaClick()
		self.ctrl:requestDraw(1)
	end

	function self.btnGacha10.luaClick()
		self.ctrl:requestDraw(10)
	end

	function self.btnBannerLeft.luaClick()
		self:changeBanner(-1)
	end

	function self.btnBannerRight.luaClick()
		self:changeBanner(1)
	end

	function self.btnSkipAnim.luaClick()
		self.ctrl:setSkipEntranceTimeline(not self._skipEntranceTimeline)
	end

	function self.btnHide.luaClick()
		self:setUIHidden(not self._uiHidden)
	end

	function self.btnShowUI.luaClick()
		self:setUIHidden(not self._uiHidden)
	end

	function self.btnPlayMV.luaClick()
		self.ctrl:playEntranceTimeline(true)
	end

	function self.btnMakeup.luaClick()
		self.ctrl:switchMakeup()
	end

	function self.btnRewardShow.luaClick()
		self.ctrl:openRewardUI()
	end

	function self.btnHistory.luaClick()
		self.ctrl:openHistory()
	end

	function self.btnGift.luaClick()
		self.ctrl:openRewardShare()
	end

	function self.rewardUButton.luaClick()
		self:openRewardContainer()
	end

	self.ctrl:addNavFocusListener(CallbackHandler(self, "refreshConsoleBarState"), "LotteryMain")
end

function LotteryMainComponent:initView()
	self._bannerIndex = 1
	self._uiHidden = false
	self._skipEntranceTimeline = false
	self._bannerController = DiscreteBannerController.new(self.listBanner, {
		getCurrentIndex = function()
			return self._bannerIndex
		end,
		getItemCount = function()
			return self._bannerList and #self._bannerList or 0
		end,
		onSwitch = function(targetIndex)
			self:setBannerIndex(targetIndex, false)
		end
	})

	function self.listTopReward.luaRenderItem(button, index, data)
		self:renderTopRewardItem(button, index, data)

		if data.tIndex == 0 then
			button:TryChangePage("Size", index == 0 and 0 or 1)
		end
	end

	function self.listBanner.luaRenderItem(button, index, data)
		self:renderBannerItem(button, index, data)
	end

	self.suitPowerInteractionComponent = SuitPowerInteractionComponent.new(self, self.listInteraction.transform, {
		titleTextKey = "LOTTERY_INTER",
		listInteraction = self.listInteraction,
		txtInteraction = self.txtInteraction,
		getAvatarComponent = function()
			return self.ctrl and self.ctrl.avatarComponent or nil
		end,
		isShowingPet = function()
			return self.ctrl and self.ctrl:isInteractionShowingPet() or false
		end,
		isInteractionBlocked = function()
			local scene = self.ctrl and self.ctrl.uiScene

			return scene and scene._activeTimelineSerial ~= nil or false
		end,
		switchToPlayer = function(onLoaded)
			if not self.ctrl then
				return false
			end

			return self.ctrl:showInteractionPlayer(onLoaded)
		end,
		switchToPet = function(petTemplateId, onLoaded)
			if not self.ctrl then
				return false
			end

			return self.ctrl:showInteractionPet(petTemplateId, onLoaded)
		end,
		beforePreview = function()
			if self.ctrl then
				self.ctrl:stopInteractionEntranceTimeline()
			end
		end
	})

	self:setButtonTitle(self.btnHistory, "LOTTERY_HISTORY")
	self:setButtonTitle(self.btnRewardShow, "LOTTERY_SHOW_REWARD")
	self:setButtonTitle(self.btnSkipAnim, "LOTTERY_SKIP_ANIM")

	local gachaText = ClientTextUtils.getGameString("LOTTERY_GACHA")

	ClientTextUtils.setText(self.txtBtnGacha1, ClientTextUtils.getFormatText(gachaText, 1))
	ClientTextUtils.setText(self.txtBtnGacha10, ClientTextUtils.getFormatText(gachaText, 10))
	ClientTextUtils.setText(self.txtGachaTitle, pg.getGameString("LOTTERY_CUMUL"))
	self.btnUseStuff:SetActive(false)
	self.btnMakeup:SetActive(false)
	self:setMakeupSelected(false)
	self.btnGift:SetActive(false)
	self:setUIHidden(false)
	self:setSkipEntranceTimeline(self.ctrl and self.ctrl:isSkipEntranceTimelineEnabled() or false)

	if self.rewardUContainer then
		self.rewardUContainer:SetActive(false)
	end

	self:refreshConsoleBarState()
end

function LotteryMainComponent:setConsoleBarState(chose, rule, getReward)
	local consoleBar = CS.XGUI.Navigation.ConsoleBar

	if not consoleBar or not consoleBar.SetStateForAll then
		return
	end

	consoleBar.SetStateForAll("Chose", chose == true)
	consoleBar.SetStateForAll("Rule", rule == true)
	consoleBar.SetStateForAll("GetReward", getReward == true)
end

function LotteryMainComponent:refreshConsoleBarState()
	local navMgr = CS.XGUI.Navigation.NavManager.Instance
	local focusedItem = navMgr and navMgr.CurrentFocusedUContent or nil
	local focusOnList = focusedItem and not IsNil(focusedItem) and focusedItem.dataFromUList ~= nil or false
	local topRewardData = focusOnList and self.listTopReward and self.listTopReward:GetData(focusedItem) or nil
	local focusOnClaimableTopReward = Utils.isTable(topRewardData) and topRewardData.claimable == true

	self:setConsoleBarState(focusOnList and not focusOnClaimableTopReward, not focusOnList, focusOnClaimableTopReward)
end

function LotteryMainComponent:openRewardContainer()
	if not self.rewardUContainer then
		return
	end

	if self.ctrl and self.ctrl.stopInteractionPreview then
		self.ctrl:stopInteractionPreview(true)
	end

	self._rewardPreviewRequested = true

	if self.rewardComponent then
		self.rewardUContainer:SetActive(true)
		self.rewardComponent:show()

		return
	end

	if self._rewardLoading then
		return
	end

	self._rewardLoading = true

	self.rewardUContainer:SetActive(true)
	self.rewardUContainer:LoadDefaultUrlManually(function(content)
		self._rewardLoading = false

		if not self.ctrl then
			return
		end

		local contentWidget = content or self.rewardUContainer.content
		local contentTransform = contentWidget and contentWidget.transform or nil
		local objectReference = contentTransform and contentTransform:GetComponent("ObjectReference") or nil

		if not contentTransform or not objectReference then
			logger:error("抽奖奖励预览资源缺少 ObjectReference")

			self._rewardPreviewRequested = false

			self.rewardUContainer:SetActive(false)

			return
		end

		self.rewardComponent = LotteryRewardComponent.new(self, contentTransform)

		if self._info then
			self.rewardComponent:setInfo(self._info.rewardViewData)
		end

		if not self._rewardPreviewRequested then
			self.rewardComponent:hide()
		end
	end)
end

function LotteryMainComponent:closeRewardContainer()
	if not self._rewardPreviewRequested then
		return false
	end

	self._rewardPreviewRequested = false

	if self.rewardComponent then
		self.rewardComponent:hide()
	end

	return true
end

function LotteryMainComponent:onDestroy()
	self:setConsoleBarState(false, false)

	self._rewardLoading = false

	if self._bannerController then
		self._bannerController:destroy()

		self._bannerController = nil
	end

	if self._topRewardRefreshFrameId then
		self:killFrameTimer(self._topRewardRefreshFrameId)

		self._topRewardRefreshFrameId = nil
	end
end

function LotteryMainComponent:setButtonTitle(button, textKey)
	if button and button.title then
		ClientTextUtils.setText(button.title, pg.getGameString(textKey))
	end
end

function LotteryMainComponent:getDisplayText(value)
	if type(value) == "number" then
		return pg.getLocalizationText(value)
	end

	return value or ""
end

function LotteryMainComponent:setInfo(info)
	if not Utils.isTable(info) then
		return
	end

	self._info = info
	self._bannerList = info.bannerList or {}
	self._bannerIndex = math.max(1, math.min(self._bannerIndex or 1, math.max(1, #self._bannerList)))

	ClientTextUtils.setText(self.txtGachaNum, info.drawCount or 0)
	self:refreshCost(info.entryConfig, info.drawCostInfo, info.drawId)
	self:refreshSuitInfo(info.suitDisplayInfo, info.entryConfig)
	self:refreshTimesRewards(info.timesRewardList)
	self:refreshCollectionProgress(info.acquiredCount, info.totalCount)
	self:refreshBannerList(self._bannerList)
	self:refreshInteractionList(info.interactionList)

	if self.rewardComponent then
		self.rewardComponent:setInfo(info.rewardViewData)
	end

	local curCanShareCount = math.max(math.floor(tonumber(info.curCanShareCount) or 0), 0)
	local canShare = curCanShareCount > 0

	self.btnGift:SetActive(canShare)
	pg.global.setRedDot(RedDotConst.RedDotPath.LOTTERY_REWARD_SHARE_COUNT, self.btnGift, canShare and curCanShareCount > 1, RedDotConst.RedDotStyle.NUM, curCanShareCount)
	self:setSkipEntranceTimeline(info.skipEntranceTimeline == true)
end

function LotteryMainComponent:refreshCost(entryConfig, drawCostInfo, drawId)
	if not Utils.isTable(entryConfig) then
		return
	end

	local singleCostInfo = Utils.isTable(drawCostInfo) and drawCostInfo.single or nil
	local tenCostInfo = Utils.isTable(drawCostInfo) and drawCostInfo.ten or nil

	if not Utils.isTable(singleCostInfo) then
		singleCostInfo = self.ctrl.model:getDrawCostInfo(entryConfig, 1, drawId)
	end

	if not Utils.isTable(tenCostInfo) then
		tenCostInfo = self.ctrl.model:getDrawCostInfo(entryConfig, 10, drawId)
	end

	local currencyItemId = singleCostInfo.itemId
	local hasDiscount = tenCostInfo.hasDiscount == true

	self.imgStuff.url = LuaUIUtils.getIconByItemId(currencyItemId)

	ItemPropUIUtils.renderConsumeItem(self.btnGacha1Currency, {
		currencyItemId,
		singleCostInfo.consumeNum
	}, false)
	ItemPropUIUtils.renderConsumeItem(self.btnGacha10Currency, {
		currencyItemId,
		tenCostInfo.consumeNum
	}, false)
	self.btnGacha10Currency:TryChangePage("Money", hasDiscount and 1 or 0)
	self.discount10UWidget:SetActive(hasDiscount)
	self.txtGacha10First.gameObject:SetActiveEx(hasDiscount)

	if hasDiscount then
		ClientTextUtils.setText(self.txtExGacha1Currency, tenCostInfo.originalConsumeNum)
		ClientTextUtils.setText(self.txtGacha10Discount, tenCostInfo.discountText)
		ClientTextUtils.setText(self.txtGacha10First, pg.getGameString(tenCostInfo.discountTitleKey))
	end

	local closeTime = Utils.getConfigTimeOfArea(entryConfig, "closeTime")

	if closeTime and closeTime > 0 then
		LuaUIUtils.setCountDownTime(self.timeCountDown, closeTime, UIConst.TimeType.Short)
	else
		self.timeCountDown:Stop()
	end
end

function LotteryMainComponent:refreshSuitInfo(suitDisplayInfo, entryConfig)
	local name = Utils.isTable(suitDisplayInfo) and suitDisplayInfo.name or entryConfig.name

	ClientTextUtils.setText(self.txtName, self:getDisplayText(name))
	self.btnMakeup:SetActive(Utils.isTable(suitDisplayInfo) and suitDisplayInfo.canSwitchMakeup == true)
end

function LotteryMainComponent:setMakeupSelected(selected)
	self.btnMakeup:SetSelected(selected == true)
	self.btnMakeup:TryChangePage("showType", selected == true and 1 or 0)
end

function LotteryMainComponent:refreshTimesRewards(timesRewardList)
	local rewardList = Utils.isTable(timesRewardList) and timesRewardList or {}

	self.listTopReward:SetList(rewardList)

	local targetIndex

	if #rewardList > 0 then
		targetIndex = #rewardList - 1

		for index, rewardData in ipairs(rewardList) do
			if rewardData.claimed ~= true then
				targetIndex = index - 1

				break
			end
		end
	end

	if self._topRewardRefreshFrameId then
		self:killFrameTimer(self._topRewardRefreshFrameId)
	end

	self._topRewardRefreshFrameId = self:startFrameTimer(function()
		self._topRewardRefreshFrameId = nil

		if targetIndex then
			local scrollIndex = math.min(targetIndex + LotteryMainComponent.TOP_REWARD_VISIBLE_COUNT - 1, #rewardList - 1)

			self.listTopReward:GoToIndex(scrollIndex, true)
		end
	end, 1)

	self:refreshConsoleBarState()
end

function LotteryMainComponent:refreshCollectionProgress(acquiredCount, totalCount)
	acquiredCount = tonumber(acquiredCount) or 0
	totalCount = tonumber(totalCount) or 0
	self.proGetNum.value = totalCount > 0 and acquiredCount / totalCount or 0

	ClientTextUtils.setText(self.txtGetNum, ClientTextUtils.getFormatText(ClientTextUtils.getGameString("LOTTERY_REWARD_PRO"), acquiredCount, totalCount))
end

function LotteryMainComponent:refreshBannerList(bannerList)
	bannerList = Utils.isTable(bannerList) and bannerList or {}
	self._bannerList = bannerList
	self._bannerIndex = math.max(1, math.min(self._bannerIndex or 1, math.max(1, #bannerList)))

	self._bannerController:setEnabled(#bannerList > 1)
	self.listBanner:SetList(bannerList)
	self.btnBannerLeft:SetActive(#bannerList > 1)
	self.btnBannerRight:SetActive(#bannerList > 1)

	if #bannerList > 0 then
		self.listBanner:SelectItem(self._bannerIndex - 1, false)
	end

	self:refreshBannerInfo(bannerList[self._bannerIndex])
end

function LotteryMainComponent:refreshInteractionList(interactionList)
	if self.suitPowerInteractionComponent then
		self.suitPowerInteractionComponent:setInteractionList(interactionList)
	end
end

function LotteryMainComponent:clearInteractionPreview(resetSelection)
	if self.suitPowerInteractionComponent then
		self.suitPowerInteractionComponent:clearPreviewState(resetSelection)
	end
end

function LotteryMainComponent:changeBanner(offset)
	local bannerCount = self._bannerList and #self._bannerList or 0

	if bannerCount <= 1 then
		return
	end

	self:setBannerIndex(self._bannerIndex + offset, false)
end

function LotteryMainComponent:setBannerIndex(bannerIndex, instant)
	local bannerCount = self._bannerList and #self._bannerList or 0

	if bannerCount <= 0 then
		return
	end

	self._bannerIndex = (bannerIndex - 1) % bannerCount + 1

	self.listBanner:SelectItem(self._bannerIndex - 1, false)
	self.listBanner:GoToIndex(self._bannerIndex - 1, instant == true)
	self.listBanner:RefreshList()
	self:refreshBannerInfo(self._bannerList[self._bannerIndex])
end

function LotteryMainComponent:setSkipEntranceTimeline(skipEntranceTimeline)
	self._skipEntranceTimeline = skipEntranceTimeline == true

	self.btnSkipAnim:SetSelected(self._skipEntranceTimeline)
end

function LotteryMainComponent:setUIHidden(hidden)
	self._uiHidden = hidden == true

	if self.uWidget then
		self.uWidget:TryChangePage("UIstate", self._uiHidden and 0 or 1)
	end

	if self.ctrl then
		self.ctrl:setUIPreviewVisible(self._uiHidden)
	end
end

function LotteryMainComponent:renderTopRewardItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local progressUProgress = objectReference:GetRefValue("progressUProgress")
	local imgIcon = objectReference:GetRefValue("imgIcon")
	local txtNum = objectReference:GetRefValue("txtNum")
	local numUSDFText = objectReference:GetRefValue("numUSDFText")
	local discountUWidget = objectReference:GetRefValue("discountUWidget")

	progressUProgress.value = data.progress or 0
	imgIcon.url = LuaUIUtils.getIconByItemId(data.itemId)

	ClientTextUtils.setText(txtNum, data.num or 0)
	ClientTextUtils.setText(numUSDFText, data.itemNum or 1)

	if discountUWidget then
		discountUWidget:SetActive(data.onlyExchange == true)
	end

	button:TryChangePage("State", data.claimed and 2 or data.claimable and 1 or 0)

	local drawId = self._info and tonumber(self._info.drawId) or 0
	local rewardIndex = tonumber(data.index) or index + 1

	pg.global.setRedDot(string.format(RedDotConst.RedDotPath.LOTTERY_TIMES_REWARD_ITEM, drawId, rewardIndex), button, data.claimable == true, RedDotConst.RedDotStyle.REWARD)

	if data.index and data.claimable then
		function button.luaClick()
			self.ctrl:claimTimesReward(data.index)
		end

		return
	end

	if data.itemId then
		function button.luaClick()
			if self.ctrl and self.ctrl.stopInteractionPreview then
				self.ctrl:stopInteractionPreview(true)
			end

			pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
				id = data.itemId,
				num = data.itemNum or 1,
				targetRect = button
			})
		end
	else
		button.luaClick = nil
	end
end

function LotteryMainComponent:renderBannerItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local imgIcon = objectReference:GetRefValue("imgIcon")

	if imgIcon then
		imgIcon.url = data.icon and LuaUIUtils.getIconByIconId(data.icon) or LuaUIUtils.getIconByItemId(data.itemId)
	end

	button:TryChangePage("Quality", data.quality or 0)
	button:SetSelected(index + 1 == self._bannerIndex)

	function button.luaClick()
		self._bannerIndex = index + 1

		self:refreshBannerInfo(data)
		self.listBanner:RefreshList()
		self.ctrl:openLotteryShop(data.commodityId)
	end
end

function LotteryMainComponent:refreshBannerInfo(data)
	local firstCost = Utils.isTable(data) and Utils.isTable(data.cost) and data.cost[1] or nil
	local isOwned = Utils.isTable(data) and data.owned == true

	self.listBannerObj:TryChangePage("State", isOwned and 1 or 0)
	ClientTextUtils.setText(self.nameUSDFText, Utils.isTable(data) and self:getDisplayText(data.name) or "")
	ClientTextUtils.setText(self.numUSDFText, isOwned and pg.getGameString("SHOP_ALREADYHAVE") or LuaUIUtils.formatShortItemNum(Utils.isTable(firstCost) and firstCost[2] or 0))

	local costItemId = Utils.isTable(firstCost) and firstCost[1] or nil

	self.iconUImage.url = costItemId and LuaUIUtils.getIconByItemId(costItemId, LuaUIUtils.ITEM_ICON_TYPE.ICON_SMALL) or ""
end

return LotteryMainComponent
