-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CashShop\\Component\\CashShopGiftPackComponent.lua

local Class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientUtils = require("Utils.ClientUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local ItemUtils = require("Common.Utils.ItemUtils")
local ShopMallTabGroupData = require("Data.shopmall_tab_group_data")
local ShopMallCommodityData = require("Data.shopmall_commodity_data")
local ShopmallGiftData = require("Data.shopmall_gift_data")
local ShopmallLinkGiftData = require("Data.shopmall_link_gift_data")
local ShopmallLinkGiftGroupData = require("Data.shopmall_link_gift_group_data")
local ShopCommonHelper = require("Utils.ShopCommonHelper")
local ItemData = require("Data.item_data")
local CashShopContainerComponent = require("Guis.Panels.CashShop.Component.CashShopContainerComponent")
local CashShopConst = require("Const.CashShopConst")
local Utils = require("Common.Utils.Utils")
local TimeUtils = require("Common.Utils.TimeUtils")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local CashShopRedDotUtils = require("Utils.CashShopRedDotUtils")
local MessageName = require("Const.MessageName")
local HotkeyConst = require("Const.HotkeyConst")
local NoticeDef = require("Common.NoticeDef")
local ItemConst = require("Common.Const.ItemConst")
local RechargeUtils = require("GameApp.Recharge.RechargeUtils")
local CashShopGiftPackComponent = Class.LightClass("CashShopGiftPackComponent", CashShopContainerComponent)
local OPTIONAL_ITEM_MIN_DISPLAY_COUNT = 3

CashShopGiftPackComponent.FIX_LIST_ROWS = 2

function CashShopGiftPackComponent:ctor(ctrl, refUContainer, categoryType)
	CashShopContainerComponent.ctor(self, ctrl, refUContainer, categoryType)
	self:scheduleGiftPackTimeRefresh()
end

function CashShopGiftPackComponent:scheduleGiftPackTimeRefresh()
	if self.giftPackTimeRefreshTimer then
		self:killTimer(self.giftPackTimeRefreshTimer)

		self.giftPackTimeRefreshTimer = nil
	end

	local refreshTime = CashShopRedDotUtils.getNextGiftPackRefreshTime()
	local linkRefreshTime = self.model:getNextLinkGiftPackRefreshTime()

	if linkRefreshTime and (not refreshTime or linkRefreshTime < refreshTime) then
		refreshTime = linkRefreshTime
	end

	if not refreshTime then
		return
	end

	local delay = math.max(1, refreshTime - Time.secondCache)

	self.giftPackTimeRefreshTimer = self:startTimer(function()
		local timerId = self.giftPackTimeRefreshTimer

		self.giftPackTimeRefreshTimer = nil

		self:killTimer(timerId)

		if self.refUContainer and self.refUContainer.gameObjectActive and self:checkContentLoaded() then
			self:refreshPage()
		end

		CashShopRedDotUtils.refreshGiftPackTabRedDots()
		CashShopRedDotUtils.refreshRedDot(CashShopConst.CategoryType.GIFTPACK)
		self:scheduleGiftPackTimeRefresh()
	end, delay)
end

function CashShopGiftPackComponent:findObjects()
	if not self:checkContentLoaded() then
		return
	end

	local objectReference = self.transform:GetChild(0):GetComponent("ObjectReference")

	self.listTabUList = objectReference:GetRefValue("listTabUList")
	self.fixUList = objectReference:GetRefValue("fixUList")
	self.optionalUList = objectReference:GetRefValue("optionalUList")
	self.uiRoot = objectReference:GetRefValue("uiRoot")
	self.fixItemUButton = objectReference:GetRefValue("fixItemUButton")
	self.optionalItemUList = objectReference:GetRefValue("optionalItemUList")
	self.textGreatUBaseText = objectReference:GetRefValue("textGreatUBaseText")
	self.textLimitUBaseText = objectReference:GetRefValue("textLimitUBaseText")
	self.textOptionalUBaseText = objectReference:GetRefValue("textOptionalUBaseText")
	self.textBuyInfoUBaseText = objectReference:GetRefValue("textBuyInfoUBaseText")
	self.textFixedUBaseText = objectReference:GetRefValue("textFixedUBaseText")
	self.textSelfSelectionUBaseText = objectReference:GetRefValue("textSelfSelectionUBaseText")
	self.txtChoiceUBaseText = objectReference:GetRefValue("txtChoiceUBaseText")
	self.btnChooseUWidget = objectReference:GetRefValue("btnChooseUWidget")
	self.btnBuyUButton = objectReference:GetRefValue("btnBuyUButton")
	self.btnSoldOutUButton = objectReference:GetRefValue("btnSoldOutUButton")
	self.btnLevelLockUWidget = objectReference:GetRefValue("btnLevelLockUWidget")
	self.optionalCostUBaseText = objectReference:GetRefValue("optionalCostUBaseText")
	self.titleTextUBaseText = objectReference:GetRefValue("titleTextUBaseText")
	self.optionalCostUImage = objectReference:GetRefValue("optionalCostUImage")
	self.buyUBaseText = objectReference:GetRefValue("buyUBaseText")
	self.soldOutUBaseText = objectReference:GetRefValue("soldOutUBaseText")
	self.giftIconUImage = objectReference:GetRefValue("giftIconUImage")
	self.selectableGiftPackUWidget = objectReference:GetRefValue("selectableGiftPackUWidget")
	self.customizableUWidget = objectReference:GetRefValue("customizableUWidget")
	self.topRewardUButton = objectReference:GetRefValue("topRewardUButton")
	self.rewardNumUSDFText = objectReference:GetRefValue("rewardNumUSDFText")
	self.rightDownUComponent = objectReference:GetRefValue("rightDownUComponent")
	self.timeCustomizablePackUCountDown = objectReference:GetRefValue("timeCustomizablePackUCountDown")
	self.txtCustomTipsUSDFText = objectReference:GetRefValue("txtCustomTipsUSDFText")
	self.growupUContainer = objectReference:GetRefValue("growupUContainer")
end

function CashShopGiftPackComponent:addListener()
	if not self:checkContentLoaded() then
		return
	end

	CashShopContainerComponent.addListener(self)

	function self.listTabUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local iconUImage = objectReference:GetRefValue("iconUImage")
		local textUBaseText = objectReference:GetRefValue("textUBaseText")
		local tabData = ShopMallTabGroupData[data.id]

		if tabData then
			iconUImage.url = tabData.tabIcon

			ClientTextUtils.setText(textUBaseText, pg.getLocalizationText(tabData.tabName))
		end

		button:ClearRedDot()

		local redDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_TAB_LIST_ITEM, data.id)

		if data.id == CashShopConst.GiftPackTabType.Fix then
			self.fixTabButton = button

			pg.global.setPreViewRedDot(redDotPath, button, CashShopRedDotUtils.getCashShopGIFTPACK_FIX_RedDotStyle)
		elseif data.id == CashShopConst.GiftPackTabType.Optional then
			pg.global.setPreViewRedDot(redDotPath, button, CashShopRedDotUtils.getCashShopGIFTPACK_OPTIONAL_RedDotStyle)
		elseif data.id == CashShopConst.GiftPackTabType.Weekly then
			pg.global.setPreViewRedDot(redDotPath, button, CashShopRedDotUtils.getCashShopGIFTPACK_WEEKLY_RedDotStyle)
		elseif self.model:isLinkGiftPackTab(data.id) then
			pg.global.setPreViewRedDot(redDotPath, button, function()
				return CashShopRedDotUtils.getLinkGiftPackTabRedDotStyle(data.id)
			end)
		end
	end

	function self.listTabUList.luaSelectedChanged(uList, isSelected)
		if isSelected then
			self:switchTabPage(uList.selectedItem.id)
		end
	end

	function self.optionalUList.luaRenderItem(button, index, data)
		self:renderOptionalTabItem(button, data)
	end

	function self.fixUList.luaRenderItem(button, index, data)
		self:renderFixTabItem(button, data)
	end

	function self.fixUList.luaClick(button, data)
		self:markGiftPackCommodityRead(button, data.id)

		local commodityData = ShopMallCommodityData[data.id]
		local giftData = ShopmallGiftData[commodityData.itemId]

		if giftData.giftPackType == 3 then
			self:requestBuyItem(data.id, 1, {}, function(retStatus)
				if retStatus == 0 then
					local redDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_DAILY_REWARD_ITEM, data.id)

					pg.global.setRedDot(redDotPath, button, false, RedDotConst.RedDotStyle.REWARD)
				end
			end)
		else
			self.lastBuyCommodityId = data.id

			pg.global.ui:open(UIConst.UI_ID_GIFT_PACK_REWARD, {
				commodityId = data.id
			})
		end
	end

	function self.optionalItemUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local btnCancelUButton = objectReference:GetRefValue("btnCancelUButton")

		if data.tIndex == 1 then
			local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")

			ClientTextUtils.setText(txtNameUBaseText, data.index)

			button.luaClick = nil
			button.enabledLongPress = false
			button.luaBeginLongPress = nil

			if btnCancelUButton then
				btnCancelUButton:SetActive(false)

				btnCancelUButton.luaClick = nil
			end
		else
			LuaUIUtils.renderItem(button, data)

			local removeIndex = data.selectedGroupIndex or data.index
			local tipByLongPress = false

			function button.luaClick()
				if tipByLongPress then
					tipByLongPress = false

					return
				end

				self:removeOptionalSelectedItem(removeIndex)
			end

			button.enabledLongPress = true

			function button.luaBeginLongPress()
				tipByLongPress = true

				if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
					pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)

					return
				end

				pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
					id = data.id,
					num = data.num,
					targetRect = button
				})
			end

			if not IsNil(button) then
				button:SetGamepadLongPress(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth, nil, 0, function()
					if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
						pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)

						return false
					end

					pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
						id = data.id,
						num = data.num,
						targetRect = button
					})

					return false
				end)
				button:SetHotkeyActiveOnlyInCurrentItem(true)
				button:SetHotkeyConsoleBar("GIFTPACK_TIPS", 0)
			end

			if btnCancelUButton then
				btnCancelUButton:SetActive(true)

				function btnCancelUButton.luaClick()
					self:removeOptionalSelectedItem(removeIndex)
				end
			end
		end
	end

	function self.btnSoldOutUButton.luaClick()
		pg.global.ui.tips:showTextTip(pg.getGameString("CASH_SHOP_SOLD_OUT"))
	end

	self.btnBuyUButton.interactable = false

	function self.btnBuyUButton.luaClick()
		local rewards = {}
		local commodityData = ShopMallCommodityData[self.optionalCommodityId]
		local giftData = ShopmallGiftData[commodityData.itemId]

		table.insert(rewards, {
			id = giftData.FixItems[1][1],
			num = giftData.FixItems[1][2]
		})

		local selectItems = {}

		for _, item in pairs(self.selectItems) do
			table.insert(selectItems, item.id)
			table.insert(rewards, {
				id = item.id,
				num = item.num
			})
		end

		self.lastBuyCommodityId = self.optionalCommodityId

		ClientCashShopUtils.openBuyConfirm(self.optionalCommodityId, self.optionalCommodityCost, 1, selectItems, rewards, function(retStatus)
			if retStatus == 0 then
				local commodityData = ShopMallCommodityData[self.optionalCommodityId]
				local giftData = ShopmallGiftData[commodityData.itemId]
				local leftLimit = ClientCashShopUtils.getCommodityLeftLimit(self.optionalCommodityId)

				ClientTextUtils.setText(self.textLimitUBaseText, pg.getFormatText(pg.getGameString("SHOPMALL_BUNDLELIMITPURCHASE_TEXT"), leftLimit, commodityData.limitNum))

				if leftLimit <= 0 then
					ClientTextUtils.setText(self.soldOutUBaseText, pg.getGameString("CASH_SHOP_SOLD_OUT"))
					self.rightDownUComponent:TryChangePage("Kind", 2)
				end
			end
		end)
	end
end

function CashShopGiftPackComponent:markGiftPackCommodityRead(button, commodityId)
	local commodityData = ShopMallCommodityData[commodityId]

	if not commodityData then
		return
	end

	local success, redDotPath

	if commodityData.tabGroupId == CashShopConst.GiftPackTabType.Weekly then
		success = CashShopRedDotUtils.markWeeklyGiftPackRead(commodityId)
		redDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_WEEKLY_ITEM, commodityId)
	else
		success = CashShopRedDotUtils.markSeasonGiftPackRead(commodityId)
		redDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_SEASON_ITEM, commodityId)
	end

	if success then
		pg.global.setRedDot(redDotPath, button, false, RedDotConst.RedDotStyle.NEW)
	end
end

function CashShopGiftPackComponent:onEnterPage()
	self._completedLinkGiftPackTabs = self.model:getCompletedLinkGiftPackTabs()
	self._locateLinkGiftPackAfterBuy = nil
	self._locateLinkGiftPackOnEnter = true

	CashShopContainerComponent.onEnterPage(self)
	self:scheduleGiftPackTimeRefresh()
end

function CashShopGiftPackComponent:onBeforeExitPage()
	self:cancelLinkGiftPackFocus()

	self._completedLinkGiftPackTabs = nil
	self._locateLinkGiftPackAfterBuy = nil
	self._locateLinkGiftPackOnEnter = nil

	self:markCurrentTabRead()
	CashShopContainerComponent.onBeforeExitPage(self)
end

function CashShopGiftPackComponent:onDestroy()
	self:cancelLinkGiftPackFocus()

	if self.linkGiftList then
		self.linkGiftList.luaFinishRender = nil
	end

	if self.linkGiftList and self._linkGiftScrollCallback then
		self.linkGiftList:UnRegisterToScrollEvent(self._linkGiftScrollCallback)

		self._linkGiftScrollCallback = nil
	end

	self._linkGiftLoadToken = (self._linkGiftLoadToken or 0) + 1
	self.growupUContainer = nil

	self:markCurrentTabRead()
	CashShopContainerComponent.onDestroy(self)
end

function CashShopGiftPackComponent:getGiftPackTabIndex(tabData, tabId)
	for index, data in ipairs(tabData) do
		if data.id == tabId then
			return index
		end
	end

	return 1
end

function CashShopGiftPackComponent:refreshPage()
	self.selectItems = {}

	local tabData = self.model:getGiftPackTabData(self._completedLinkGiftPackTabs)
	local tabIndex = self:getGiftPackTabIndex(tabData, self.curTabId)
	local targetTab = tabData[tabIndex]

	self.listTabUList.gameObject:SetActiveEx(#tabData > 1)

	local noListAnim = self._linkGiftLoaded and targetTab and targetTab.id == self.curTabId and self.model:isLinkGiftPackTab(targetTab.id) and not self._locateLinkGiftPackOnEnter

	self:updateLinkGiftPackList(self.listTabUList, tabData, noListAnim)

	if not targetTab then
		self:cancelLinkGiftPackFocus()

		self.curTabId = nil
		self.btnBuyUButton.interactable = false

		self.uiRoot:TryChangePage("Panel", 0)
		self.ctrl:refreshGroupCurrency(nil, self)
		self.fixUList:SetList({})

		if self.growupUContainer then
			self.growupUContainer:SetActive(false)
		end

		return
	end

	self.listTabUList:SelectItem(tabIndex - 1, false)
	self:switchTabPage(targetTab.id)
end

function CashShopGiftPackComponent:markCurrentTabRead()
	CashShopRedDotUtils.markGiftPackTabRead(self.curTabId)
end

function CashShopGiftPackComponent:switchTabPage(tabId)
	if self.curTabId and self.curTabId ~= tabId then
		self:markCurrentTabRead()
	end

	self:refreshTabPage(tabId)
end

function CashShopGiftPackComponent:refreshTabPage(tabId)
	if self.curTabId ~= tabId then
		self:cancelLinkGiftPackFocus()

		self._locateLinkGiftPackAfterBuy = nil
		self._locateLinkGiftPackOnEnter = self.model:isLinkGiftPackTab(tabId) or nil
	end

	self.curTabId = tabId

	self.ctrl:refreshGroupCurrency(tabId, self)

	if self.model:isLinkGiftPackTab(tabId) then
		self.uiRoot:TryChangePage("Panel", 2)
		self:refreshLinkGiftPackPage()

		return
	end

	local giftPackData = self.model:getGiftPackData(tabId)

	if tabId == CashShopConst.GiftPackTabType.Optional then
		self.uiRoot:TryChangePage("Panel", 1)
		self:refreshOptionalPage(giftPackData)

		self.btnBuyUButton.interactable = false

		CashShopRedDotUtils.markGiftPackTabRead(tabId)
	else
		self.uiRoot:TryChangePage("Panel", 0)
		self.fixUList:SetList(giftPackData)
	end
end

function CashShopGiftPackComponent:reorderFixListRowFirst(data)
	local n = #data

	if n <= CashShopGiftPackComponent.FIX_LIST_ROWS then
		return data
	end

	local cols = math.ceil(n / CashShopGiftPackComponent.FIX_LIST_ROWS)
	local result = {}

	for k = 0, n - 1 do
		local col = k % cols
		local row = math.floor(k / cols)
		local feedIndex = col * CashShopGiftPackComponent.FIX_LIST_ROWS + row

		result[feedIndex + 1] = data[k + 1]
	end

	return result
end

function CashShopGiftPackComponent:requestBuyItem(commodityId, count, giftSelectItemIds, callback)
	self.lastBuyCommodityId = commodityId

	ClientCashShopUtils.requestBuyItem(commodityId, count, giftSelectItemIds, callback)
end

function CashShopGiftPackComponent:onBuyItemResult(result)
	if result.success then
		if ShopmallLinkGiftData[result.commodityId] then
			self._linkGiftBuyingId = nil
			self._locateLinkGiftPackAfterBuy = self.model:isLinkGiftPackTab(self.curTabId) or nil

			self:refreshPage()

			return
		end

		local commodityData = ShopMallCommodityData[result.commodityId or self.lastBuyCommodityId]

		if not commodityData then
			return
		end

		local giftData = ShopmallGiftData[commodityData.itemId]

		if giftData and giftData.giftPackType ~= 2 then
			facade:sendMsgToUI(MessageName.CASH_SHOP_REWARD_CHANGED)
		end
	end
end

function CashShopGiftPackComponent:refreshLinkGiftPackPage()
	if not self.growupUContainer then
		return
	end

	if not self._linkGiftLoaded then
		if self.growupUContainer.transform.childCount > 0 then
			self:setupLinkGiftPackObjects()
		elseif not self._linkGiftLoading then
			self._linkGiftLoading = true
			self._linkGiftLoadToken = (self._linkGiftLoadToken or 0) + 1

			local loadToken = self._linkGiftLoadToken

			self.growupUContainer:LoadDefaultUrlManually(function(content)
				if loadToken ~= self._linkGiftLoadToken or not self.growupUContainer then
					return
				end

				self._linkGiftLoading = false

				if not content then
					return
				end

				self:setupLinkGiftPackObjects()

				if self.model and self.model:isLinkGiftPackTab(self.curTabId) and self.refUContainer and self.refUContainer.gameObjectActive then
					self:refreshPage()
				end
			end)

			return
		else
			return
		end
	end

	local groupId, groupData = self.model:getLinkGiftPackGroup(self.curTabId)

	if not groupData then
		self:refreshPage()

		return
	end

	if self._linkGiftDisplayedGroupId ~= groupId then
		self._locateLinkGiftPackOnEnter = true
		self._linkGiftDisplayedGroupId = groupId
	end

	ClientTextUtils.setText(self.linkGiftTitle, pg.getLocalizationText(groupData.giftPackName))
	ClientTextUtils.setText(self.linkGiftRate, groupData.rate and string.format("%s×", groupData.rate) or "")
	ClientTextUtils.setText(self.linkGiftTips, groupData.giftTips and pg.getLocalizationText(groupData.giftTips) or "")

	local endTime = Utils.getConfigTimeOfArea(groupData, "endTime")

	self.linkGiftCountDown:SetActive(endTime ~= nil)

	if endTime then
		LuaUIUtils.setCountDownTime(self.linkGiftCountDown, endTime, UIConst.TimeType.Short)
	end

	local giftPackData = self.model:getLinkGiftPackData(groupId)
	local lastReward = table.remove(giftPackData)

	self._linkGiftListCount = #giftPackData
	self._linkGiftDataOnlyRefresh = not self._locateLinkGiftPackOnEnter

	self:updateLinkGiftPackList(self.linkGiftList, giftPackData, self._linkGiftDataOnlyRefresh)
	self.linkGiftLastReward:SetActive(lastReward ~= nil)

	self.linkGiftLastReward.luaClick = nil

	if lastReward then
		self:renderLinkGiftPackItem(self.linkGiftLastReward, lastReward)

		function self.linkGiftLastReward.luaClick()
			self:onLinkGiftPackClick(lastReward.id)
		end
	end

	if self._locateLinkGiftPackOnEnter or self._locateLinkGiftPackAfterBuy then
		self._locateLinkGiftPackOnEnter = nil
		self._locateLinkGiftPackAfterBuy = nil

		self:locateFirstUnboughtLinkGiftPack(giftPackData, lastReward)
	end

	self:refreshLinkGiftLastRewardArrow()
end

function CashShopGiftPackComponent:locateFirstUnboughtLinkGiftPack(giftPackData, lastReward)
	self:cancelLinkGiftPackFocus()

	for index, data in ipairs(giftPackData) do
		if not data.isBought then
			self.linkGiftList:GoToIndex(index - 1, true)
			self:scheduleLinkGiftPackFocus(index - 1)

			return
		end
	end

	if lastReward and not lastReward.isBought then
		if #giftPackData > 0 then
			self.linkGiftList:GoToIndex(-1, true)
		end

		self:scheduleLinkGiftPackFocus(-1)
	end
end

function CashShopGiftPackComponent:cancelLinkGiftPackFocus()
	self._linkGiftFocusIndex = nil

	if self._linkGiftFocusFrameId then
		self:killFrameTimer(self._linkGiftFocusFrameId)

		self._linkGiftFocusFrameId = nil
	end
end

function CashShopGiftPackComponent:scheduleLinkGiftPackFocus(index)
	if not pg.game.input:isUsingGamepad() then
		return
	end

	self:cancelLinkGiftPackFocus()

	self._linkGiftFocusIndex = index

	local tabId = self.curTabId

	self._linkGiftFocusFrameId = self:startFrameTimer(function()
		self._linkGiftFocusFrameId = nil

		if self.isDestroyed or not self.model or self.curTabId ~= tabId or not self.model:isLinkGiftPackTab(tabId) or not self.refUContainer or not self.refUContainer.gameObjectActive or not pg.game.input:isUsingGamepad() or not pg.global.navMgr then
			return
		end

		local button = self.linkGiftLastReward

		if index >= 0 then
			if not self.linkGiftList then
				return
			end

			local found

			found, button = self.linkGiftList:TryGetChildAt(index)

			if not found then
				return
			end

			self.linkGiftList:SetNavGroupDefaultItemInThis(button)
		end

		if button and not IsNil(button) and pg.global.navMgr:FocusItemInThis(button) then
			self._linkGiftFocusIndex = nil
		end
	end, 1)
end

function CashShopGiftPackComponent:updateLinkGiftPackList(uList, data, noListAnim)
	if not noListAnim then
		uList:SetList(data)

		return
	end

	local previousData = uList.itemData

	if previousData and previousData.Count == #data then
		for index, itemData in ipairs(data) do
			uList:SetElement(index - 1, itemData)
		end
	else
		uList.itemData = data

		uList:RefreshList(true)
	end
end

function CashShopGiftPackComponent:setupLinkGiftPackObjects()
	if self.linkGiftList then
		self.linkGiftList.luaFinishRender = nil
	end

	if self.linkGiftList and self._linkGiftScrollCallback then
		self.linkGiftList:UnRegisterToScrollEvent(self._linkGiftScrollCallback)
	end

	local objectReference = self.growupUContainer.transform:GetChild(0):GetComponent("ObjectReference")

	self.linkGiftList = objectReference:GetRefValue("listUList")
	self.linkGiftLastReward = objectReference:GetRefValue("lastRewardUComponent")
	self.linkGiftTips = objectReference:GetRefValue("txtTips")
	self.linkGiftCountDown = objectReference:GetRefValue("countDown")
	self.linkGiftRate = objectReference:GetRefValue("txtRate")
	self.linkGiftTitle = objectReference:GetRefValue("txtTitle")
	self.linkGiftTime = objectReference:GetRefValue("txtTime")

	ClientTextUtils.setText(self.linkGiftTime, pg.getGameString("SHOPMALL_GIFT_TIME"))

	function self.linkGiftList.luaRenderItem(button, index, data)
		self:renderLinkGiftPackItem(button, data)
		button:TryChangePage("Arrow", index == 0 and 0 or 1)

		if self._linkGiftFocusIndex == index then
			self:scheduleLinkGiftPackFocus(index)
		end
	end

	function self.linkGiftList.luaFinishRender()
		if self._linkGiftFocusIndex ~= nil then
			self:scheduleLinkGiftPackFocus(self._linkGiftFocusIndex)
		end
	end

	function self.linkGiftList.luaClick(button, data)
		self:onLinkGiftPackClick(data.id)
	end

	function self._linkGiftScrollCallback(position)
		self:refreshLinkGiftLastRewardArrow(position)
	end

	self.linkGiftList:RegisterToScrollEvent(self._linkGiftScrollCallback)

	self._linkGiftLoaded = true
end

function CashShopGiftPackComponent:refreshLinkGiftLastRewardArrow(position)
	if not self.linkGiftList or not self.linkGiftLastReward then
		return
	end

	position = position or self.linkGiftList.normalizedScrollPosition

	local atEnd = (self._linkGiftListCount or 0) > 0 and (not self.linkGiftList.needScrollable or position and position.x >= 0.9999)

	self.linkGiftLastReward:TryChangePage("Arrow", atEnd and 1 or 0)
end

function CashShopGiftPackComponent:focusOnLinkGiftPackItem()
	if not self.model or not self.model:isLinkGiftPackTab(self.curTabId) or not self.refUContainer or not self.refUContainer.gameObjectActive then
		return false
	end

	local navMgr = pg.global.navMgr
	local focused = navMgr and navMgr.CurrentFocusedUContent

	if not focused or IsNil(focused) then
		return false
	end

	if focused == self.linkGiftLastReward then
		return true
	end

	if not self.linkGiftList then
		return false
	end

	for index = 0, (self._linkGiftListCount or 0) - 1 do
		local found, button = self.linkGiftList:TryGetChildAt(index)

		if found and button == focused then
			return true
		end
	end

	return false
end

function CashShopGiftPackComponent:getLinkGiftPackCosts(config)
	local costs = {}

	for _, cost in ipairs(config.cost or {}) do
		if cost[1] and (cost[2] or 0) > 0 then
			costs[#costs + 1] = cost
		end
	end

	return costs
end

function CashShopGiftPackComponent:renderLinkGiftPackItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtName = objectReference:GetRefValue("txtName")
	local rewardList = objectReference:GetRefValue("listUList")
	local imgCost = objectReference:GetRefValue("imgCost")
	local txtCost = objectReference:GetRefValue("txtCost")
	local txttForFree = objectReference:GetRefValue("txttForFree")
	local txtGot = objectReference:GetRefValue("txtGot")
	local config = data.config

	button:ClearRedDot()

	local groupData = ShopmallLinkGiftGroupData[config.tab]

	if groupData then
		local redDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_LINK_GIFT_ITEM, groupData.tab, data.id)

		pg.global.setPreViewRedDot(redDotPath, button, function()
			return CashShopRedDotUtils.getLinkGiftPackItemRedDotStyle(data.id)
		end)
	end

	ClientTextUtils.setText(txtName, pg.getLocalizationText(config.giftPackName))
	ClientTextUtils.setText(txttForFree, pg.getGameString("SHOPMALL_FREE_TEXT"))
	ClientTextUtils.setText(txtGot, pg.getGameString("SHOPMALL_GIFT_SOLD"))
	button:TryChangePage("State", data.state)

	local rewards = ClientCashShopUtils.buildBattlePassRewardList(config.selectItems, config.limitItems)

	function rewardList.luaRenderItem(itemButton, index, itemData)
		ClientCashShopUtils.renderBattlePassRewardItem(itemButton, index, itemData)
	end

	self:updateLinkGiftPackList(rewardList, rewards, self._linkGiftDataOnlyRefresh)

	local costs = self:getLinkGiftPackCosts(config)
	local primaryCost = costs[1]
	local currencyData = primaryCost and ItemData[primaryCost[1]]

	button:TryChangePage("Icon", #costs == 0 and 0 or 1)

	imgCost.url = currencyData and currencyData.icon or ""

	if #costs == 0 then
		ClientTextUtils.setText(txtCost, "")
	elseif #costs == 1 then
		ClientTextUtils.setText(txtCost, primaryCost[2])
	else
		local costTexts = {}

		for _, cost in ipairs(costs) do
			costTexts[#costTexts + 1] = string.format("%s%s", LuaUIUtils.getItemShowText(cost[1]), cost[2])
		end

		ClientTextUtils.setText(txtCost, table.concat(costTexts, " + "))
	end
end

function CashShopGiftPackComponent:canBuyLinkGiftPack(commodityId)
	local config = ShopmallLinkGiftData[commodityId]

	return self.model ~= nil and pg.me ~= nil and config ~= nil and self.model:isLinkGiftPackGroupAvailable(config.tab) and ShopCommonHelper.isConfigAvailableInArea(config) and self.model:getLinkGiftPackState(commodityId) == 1
end

function CashShopGiftPackComponent:checkLinkGiftPackCost(commodityId)
	local config = ShopmallLinkGiftData[commodityId]

	if not config then
		return false
	end

	local costIdNums = {}

	for _, cost in ipairs(self:getLinkGiftPackCosts(config)) do
		costIdNums[cost[1]] = (costIdNums[cost[1]] or 0) + cost[2]
	end

	return ClientCashShopUtils.canAffordCostIdNums(costIdNums)
end

function CashShopGiftPackComponent:onLinkGiftPackClick(commodityId)
	if self._linkGiftBuyingId then
		return
	end

	if not self:canBuyLinkGiftPack(commodityId) then
		if self.model then
			self:refreshPage()
		end

		return
	end

	local config = ShopmallLinkGiftData[commodityId]
	local costs = self:getLinkGiftPackCosts(config)

	if #costs == 0 then
		self:requestBuyLinkGiftPack(commodityId)

		return
	end

	self:openLinkGiftPackPurchaseConfirm(commodityId)
end

function CashShopGiftPackComponent:openLinkGiftPackPurchaseConfirm(commodityId)
	if self._linkGiftBuyingId or not self:canBuyLinkGiftPack(commodityId) then
		return
	end

	local config = ShopmallLinkGiftData[commodityId]
	local costs = self:getLinkGiftPackCosts(config)
	local costTexts = {}

	for _, cost in ipairs(costs) do
		costTexts[#costTexts + 1] = pg.getFormatText(pg.getGameString("SHOP_BUY_SELF"), LuaUIUtils.getItemShowText(cost[1]), cost[2])
	end

	local rewards = ClientCashShopUtils.buildBattlePassRewardList(config.selectItems, config.limitItems)

	if ClientCashShopUtils.onExchangeConfirmOpen then
		ClientCashShopUtils.onExchangeConfirmOpen()
	end

	ClientCashShopUtils.openBuyCommonUseConfirm(commodityId, 1, table.concat(costTexts, "\n"), function()
		self:requestBuyLinkGiftPack(commodityId)
	end, costs[1], rewards, nil, nil, {
		rewardOnly = true
	})
end

function CashShopGiftPackComponent:handleLinkGiftPackCostShortage(commodityId, costIdNums)
	local itemId = ClientCashShopUtils.getNotEnoughCostItemId(costIdNums)

	if not itemId then
		return
	end

	local needCount = costIdNums[itemId]

	if ClientUtils.isItemLockedForConsume(itemId, needCount) then
		pg.global.showBubbleMessage(NoticeDef.ITEM_LOCKED)

		return
	end

	if itemId == ItemConst.ITEM_SPECIAL_MONEY_COIN_BOUND or itemId == ItemConst.ITEM_SPECIAL_MONEY_CASH_BOUND then
		if ClientCashShopUtils.onPaymentJump then
			ClientCashShopUtils.onPaymentJump()
		end

		RechargeUtils.openQuickPay({
			itemId = 0,
			itemNum = 0,
			needCount = needCount,
			currencyID = itemId,
			categoryType = CashShopConst.CategoryType.GIFTPACK,
			buyCallBack = function()
				self:onLinkGiftPackClick(commodityId)
			end
		})
	elseif ItemData[itemId] then
		pg.global.showBubbleMessage(NoticeDef.SHOP_ITEM_NOT_ENOUGH, pg.getLocalizationText(ItemData[itemId].itemName))
	else
		pg.global.showBubbleMessageById(NoticeDef.SHOP_BUY_COSTITEM_NOT_ENOUGH)
	end
end

function CashShopGiftPackComponent:requestBuyLinkGiftPack(commodityId)
	if self._linkGiftBuyingId then
		return
	end

	if not self:canBuyLinkGiftPack(commodityId) then
		if self.model then
			self:refreshPage()
		end

		return
	end

	local canAfford, costIdNums = self:checkLinkGiftPackCost(commodityId)

	if not canAfford then
		self:handleLinkGiftPackCostShortage(commodityId, costIdNums)

		return
	end

	self._linkGiftBuyingId = commodityId

	if self.model:isLinkGiftPackTab(self.curTabId) then
		self:refreshLinkGiftPackPage()
	end

	ClientCashShopUtils.requestBuyItem(commodityId, 1, {}, function(retStatus)
		self._linkGiftBuyingId = nil

		if retStatus ~= 0 and self.model then
			self:refreshPage()
		end
	end)
end

function CashShopGiftPackComponent:getOptionalItemDisplayCount()
	return math.max(self.selectItemCount or 0, OPTIONAL_ITEM_MIN_DISPLAY_COUNT)
end

function CashShopGiftPackComponent:removeOptionalSelectedItem(groupIndex)
	if not groupIndex or not self.selectItems[groupIndex] then
		return
	end

	self.selectItems[groupIndex] = nil

	self:_onOptionalSelectionChanged(groupIndex)
end

function CashShopGiftPackComponent:refreshOptionalPage(giftPackData)
	local giftPackOptionalData = giftPackData[#giftPackData]

	if not giftPackOptionalData then
		self.customizableUWidget.gameObject:SetActiveEx(false)

		return
	end

	local fixItem = giftPackOptionalData.FixItems and giftPackOptionalData.FixItems[1]

	if fixItem then
		local fixData = {
			index = 1,
			id = giftPackOptionalData.id,
			type = CashShopConst.GiftPackTabType.Fix,
			items = {
				fixItem
			}
		}

		self:renderOptionalTabItem(self.topRewardUButton, fixData)

		if self.fixItemUButton then
			LuaUIUtils.renderItem(self.fixItemUButton, {
				id = fixItem[1],
				num = fixItem[2]
			})
		end
	end

	local optionalData = {}
	local index = 1

	for _, selectItem in ipairs(giftPackOptionalData.selectItems) do
		local entry = {}

		entry.id = giftPackOptionalData.id
		entry.type = CashShopConst.GiftPackTabType.Optional
		entry.items = selectItem
		entry.index = index
		index = index + 1

		table.insert(optionalData, entry)
	end

	self.selectItemCount = index - 1

	local oldSelectItems = self.selectItems or {}

	self.selectItems = {}

	for i = 1, self.selectItemCount do
		if oldSelectItems[i] then
			oldSelectItems[i].selectedGroupIndex = i
			self.selectItems[i] = oldSelectItems[i]
		end
	end

	self.optionalUList:SetList(optionalData)

	self.optionalCommodityId = giftPackOptionalData.id

	local commodityData = ShopMallCommodityData[giftPackOptionalData.id]
	local giftData = ShopmallGiftData[commodityData.itemId]

	if self.timeCustomizablePackUCountDown then
		local optionalEndTime = Utils.getConfigTimeOfArea(commodityData, "endTime")

		if optionalEndTime then
			LuaUIUtils.setCountDownTime(self.timeCustomizablePackUCountDown, optionalEndTime, UIConst.TimeType.Short)
		end
	end

	local specialStartTime = Utils.getConfigTimeOfArea(commodityData, "specialStartTime")
	local specialEndTime = Utils.getConfigTimeOfArea(commodityData, "specialEndTime")
	local isInDiscount = specialStartTime and specialEndTime and TimeUtils.isInRangeTimestamp(specialStartTime, specialEndTime)

	ClientTextUtils.setText(self.textGreatUBaseText, pg.getGameString("BATTLEPASS_GREATDEALS_TAGS"))

	local cost = ClientCashShopUtils.getCommodityPrimaryCost(giftPackOptionalData.id, 1, {
		isInDiscount = isInDiscount
	})
	local costItemId = cost and cost[1] or commodityData.cost[1][1]
	local costItemCount = cost and cost[2] or commodityData.cost[1][2]

	self.optionalCommodityCost = cost
	self.btnBuyUButton.interactable = false
	self.optionalCostUImage.url = ItemData[costItemId].icon
	self.giftIconUImage.url = giftData.giftPackIcon

	ClientTextUtils.setText(self.titleTextUBaseText, pg.getGameString("SHOPMALL_BUNDLECUSTOMIZE_TITLE"))
	ClientTextUtils.setText(self.optionalCostUBaseText, costItemCount)
	ClientTextUtils.setText(self.buyUBaseText, pg.getGameString("SHOP_BUY"))
	ClientTextUtils.setText(self.textOptionalUBaseText, pg.getLocalizationText(giftData.giftPackName))
	ClientTextUtils.setText(self.textBuyInfoUBaseText, pg.getGameString("SHOPMALL_CHOICEGIFT_SELECTED"))
	ClientTextUtils.setText(self.textFixedUBaseText, pg.getGameString("SHOPMALL_BUNDLEFIXED_TEXT"))
	ClientTextUtils.setText(self.textSelfSelectionUBaseText, pg.getGameString("SHOPMALL_BUNDLEOPTIONAL_TEXT"))
	ClientTextUtils.setText(self.txtCustomTipsUSDFText, pg.getGameString("GIFTPACK_TIPS"))
	self.rightDownUComponent:TryChangePage("Kind", 1)

	if commodityData.limitNum and commodityData.limitNum > 0 then
		local leftLimit = ClientCashShopUtils.getCommodityLeftLimit(self.optionalCommodityId)

		ClientTextUtils.setText(self.textLimitUBaseText, pg.getFormatText(pg.getGameString("SHOPMALL_BUNDLELIMITPURCHASE_TEXT"), leftLimit, commodityData.limitNum))

		if leftLimit <= 0 then
			ClientTextUtils.setText(self.soldOutUBaseText, pg.getGameString("CASH_SHOP_SOLD_OUT"))
			self.rightDownUComponent:TryChangePage("Kind", 2)
		end
	end

	self:_syncOptionalSelectionUI()
end

function CashShopGiftPackComponent:_syncOptionalSelectionUI()
	local selectedCount = 0

	for i = 1, self.selectItemCount or 0 do
		if self.selectItems[i] then
			selectedCount = selectedCount + 1
		end
	end

	if self.rewardNumUSDFText then
		ClientTextUtils.setText(self.rewardNumUSDFText, pg.getFormatText(pg.getGameString("SHOPMALL_BUNDLESELECTPROGRESS_TEXT"), selectedCount, self.selectItemCount))
	end

	if selectedCount == self.selectItemCount then
		self.btnBuyUButton.interactable = true

		self.selectableGiftPackUWidget:TryChangePage("Kind", 1)
	else
		self.btnBuyUButton.interactable = false

		self.selectableGiftPackUWidget:TryChangePage("Kind", 0)
	end

	local displayItems = {}

	for i = 1, self:getOptionalItemDisplayCount() do
		if self.selectItems[i] then
			table.insert(displayItems, self.selectItems[i])
		else
			table.insert(displayItems, {
				tIndex = 1,
				index = i
			})
		end
	end

	self.optionalItemUList:SetList(displayItems)
end

function CashShopGiftPackComponent:_onOptionalSelectionChanged(groupIndex)
	if groupIndex and self.optionalUList then
		self.optionalUList:RefreshElement(groupIndex - 1)
	end

	self:_syncOptionalSelectionUI()
end

function CashShopGiftPackComponent:_toggleOptionalItemTip(itemButton, itemData)
	if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
		pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)

		return
	end

	if itemData.extraFunc ~= nil then
		itemData.extraFunc()

		return
	end

	pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
		id = itemData.id,
		num = itemData.num,
		targetRect = itemButton
	})
end

function CashShopGiftPackComponent:renderOptionalTabItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local txtNumUSDFText = objectReference:GetRefValue("txtNumUSDFText")
	local txtIndexUSDFText = objectReference:GetRefValue("txtIndexUSDFText")
	local listItemUList = objectReference:GetRefValue("listItemUList")
	local textStateUBaseText = objectReference:GetRefValue("textStateUBaseText")
	local isFix = data.type == CashShopConst.GiftPackTabType.Fix
	local dataIndex = data.index

	if isFix then
		if txtIndexUSDFText then
			ClientTextUtils.setText(txtIndexUSDFText, "")
		end

		if txtNumUSDFText then
			ClientTextUtils.setText(txtNumUSDFText, "1/1")
		end
	else
		if txtIndexUSDFText then
			ClientTextUtils.setText(txtIndexUSDFText, data.index)
		end

		if txtNumUSDFText then
			local selectedNum = self.selectItems[data.index] and 1 or 0

			ClientTextUtils.setText(txtNumUSDFText, string.format("%d/%d", selectedNum, 1))
		end
	end

	function listItemUList.luaRenderItem(itemButton, index, itemData)
		LuaUIUtils.renderItem(itemButton, itemData)

		local itemObjRef = itemButton:GetComponent("ObjectReference")
		local imgBatchUImage = itemObjRef:GetRefValue("imgBatchUImage")

		if imgBatchUImage then
			local selectedItem = not isFix and self.selectItems[data.index] or nil
			local isSelected = selectedItem ~= nil and itemData.id == selectedItem.id and itemData.num == selectedItem.num

			imgBatchUImage:SetActive(isSelected)
		end

		itemButton.luaClick = nil
		itemButton.enabledLongPress = true

		function itemButton.luaBeginLongPress()
			self:_toggleOptionalItemTip(itemButton, itemData)
		end

		if not IsNil(itemButton) then
			itemButton:SetGamepadLongPress(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth, nil, 0, function()
				self:_toggleOptionalItemTip(itemButton, itemData)

				return false
			end)
			itemButton:SetHotkeyActiveOnlyInCurrentItem(true)
			itemButton:SetHotkeyConsoleBar("GIFTPACK_TIPS", 0)
		end
	end

	if isFix then
		listItemUList.luaSelectedChanged = nil

		ClientTextUtils.setText(txtNameUBaseText, pg.getGameString("SHOPMALL_FIXEDGOODS_TEXT"))
		ClientTextUtils.setText(textStateUBaseText, pg.getGameString("SHOPMALL_SELECTED_TEXT"))
		button:TryChangePage("Type", 2)
	else
		listItemUList.luaSelectedChanged = nil

		function listItemUList.luaClick(button, itemData)
			if not itemData then
				return
			end

			local selected = self.selectItems[dataIndex]

			if selected and selected.id == itemData.id and selected.num == itemData.num then
				self.selectItems[dataIndex] = nil
			else
				local commodityData = ShopMallCommodityData[self.optionalCommodityId]

				if commodityData.limitNum and commodityData.limitNum > 0 then
					local leftLimit = ClientCashShopUtils.getCommodityLeftLimit(self.optionalCommodityId)

					if leftLimit <= 0 then
						return
					end
				end

				self.selectItems[dataIndex] = {
					id = itemData.id,
					num = itemData.num,
					selectedGroupIndex = dataIndex
				}
			end

			self:_onOptionalSelectionChanged(dataIndex)
		end

		ClientTextUtils.setText(txtNameUBaseText, pg.getFormatText(pg.getGameString("SHOPMALL_BUNDLESELFSELECT_TITLE"), data.index))

		if self.selectItems[data.index] then
			ClientTextUtils.setText(textStateUBaseText, pg.getGameString("SHOPMALL_SELECTED_TEXT"))
			button:TryChangePage("Type", 1)
		else
			ClientTextUtils.setText(textStateUBaseText, pg.getGameString("SHOPMALL_BUNDLEPENDINGSELECT_TEXT"))
			button:TryChangePage("Type", 0)
		end
	end

	local items = {}

	for _, item in ipairs(data.items) do
		local entry = {}

		entry.id = item[1]
		entry.num = item[2]

		table.insert(items, entry)
	end

	listItemUList:SetList(items)

	if not isFix then
		local selectedIndex = -1
		local selectedItem = self.selectItems[data.index]

		if selectedItem then
			for idx, item in ipairs(items) do
				if item.id == selectedItem.id and item.num == selectedItem.num then
					selectedIndex = idx - 1

					break
				end
			end
		end

		listItemUList:SelectItem(selectedIndex, false)
	end
end

function CashShopGiftPackComponent:renderFixTabItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local root = objectReference:GetRefValue("root")
	local giftUImage = objectReference:GetRefValue("giftUImage")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local countDownUCountDown = objectReference:GetRefValue("countDownUCountDown")
	local freeUWidget = objectReference:GetRefValue("freeUWidget")
	local greatValue3UWidget = objectReference:GetRefValue("greatValue3UWidget")
	local limitedTextUBaseText = objectReference:GetRefValue("limitedTextUBaseText")
	local costIconUImage = objectReference:GetRefValue("costIconUImage")
	local costTextUBaseText = objectReference:GetRefValue("costTextUBaseText")
	local txtGreatValue3USDFText = objectReference:GetRefValue("txtGreatValue3USDFText")
	local freeTextUBaseText = objectReference:GetRefValue("freeTextUBaseText")
	local freeGetTextUBaseText = objectReference:GetRefValue("freeGetTextUBaseText")
	local textLockUBaseText = objectReference:GetRefValue("textLockUBaseText")
	local textSoldOutUBaseText = objectReference:GetRefValue("textSoldOutUBaseText")
	local gift1UImage = objectReference:GetRefValue("gift1UImage")
	local definitiveUWidget = objectReference:GetRefValue("definitiveUWidget")
	local getTxt = objectReference:GetRefValue("getTxt")
	local commodityData = ShopMallCommodityData[data.id]
	local giftData = ShopmallGiftData[commodityData.itemId]
	local showLimitTag = giftData.limitType and giftData.limitType == 1

	button:ClearRedDot()
	ClientTextUtils.setText(txtNameUBaseText, pg.getLocalizationText(giftData.giftPackName))
	root:TryChangePage("Type", giftData.giftPackType == 1 and 0 or 1)

	giftUImage.url = giftData.giftPackIcon
	gift1UImage.url = giftData.giftPackIcon

	root:TryChangePage("Quality", giftData.giftQuality - 1)

	if commodityData.tabGroupId == CashShopConst.GiftPackTabType.Weekly then
		local weeklyRedDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_WEEKLY_ITEM, data.id)

		pg.global.setRedDot(weeklyRedDotPath, button, CashShopRedDotUtils.isWeeklyGiftPackNew(data.id), RedDotConst.RedDotStyle.NEW)
	elseif showLimitTag then
		local seasonRedDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_SEASON_ITEM, data.id)

		pg.global.setRedDot(seasonRedDotPath, button, CashShopRedDotUtils.isSeasonGiftPackNew(data.id), RedDotConst.RedDotStyle.NEW)
	end

	local specialStartTime = Utils.getConfigTimeOfArea(commodityData, "specialStartTime")
	local specialEndTime = Utils.getConfigTimeOfArea(commodityData, "specialEndTime")
	local endTime = Utils.getConfigTimeOfArea(commodityData, "endTime")
	local isInDiscount = specialStartTime and specialEndTime and TimeUtils.isInRangeTimestamp(specialStartTime, specialEndTime)

	LuaUIUtils.setCountDownTime(countDownUCountDown, endTime, UIConst.TimeType.Short)

	local currentCost = ClientCashShopUtils.getCommodityPrimaryCost(data.id, 1, {
		isInDiscount = isInDiscount
	})
	local costItemId = currentCost and currentCost[1] or commodityData.cost[1][1]
	local costItemCount = currentCost and currentCost[2] or commodityData.cost[1][2]
	local hasSpecialCost = commodityData.specialCostText and commodityData.specialCostText ~= ""

	if greatValue3UWidget then
		greatValue3UWidget.gameObject:SetActiveEx(hasSpecialCost)
	end

	if hasSpecialCost and txtGreatValue3USDFText then
		ClientTextUtils.setText(txtGreatValue3USDFText, pg.getLocalizationText(commodityData.specialCostText))
	end

	costIconUImage.url = ItemData[costItemId].icon

	ClientTextUtils.setText(costTextUBaseText, costItemCount)
	freeUWidget.gameObject:SetActiveEx(giftData.giftPackType == 3)

	if giftData.giftPackType == 3 then
		ClientTextUtils.setText(freeTextUBaseText, pg.getGameString("SHOPMALL_FREE_TEXT"))
		ClientTextUtils.setText(freeGetTextUBaseText, pg.getGameString("SHOPMALL_FREECLAIM_TEXT"))
	end

	if commodityData.limitNum and commodityData.limitNum > 0 then
		local leftLimit = ClientCashShopUtils.getCommodityLeftLimit(data.id)
		local limitText = string.format("%d/%d", leftLimit, commodityData.limitNum)
		local limitTypeText = LuaUIUtils.getLimitTitleString(commodityData.limitType)

		ClientTextUtils.setText(limitedTextUBaseText, limitTypeText .. limitText)
		limitedTextUBaseText.gameObject:SetActiveEx(true)

		if leftLimit <= 0 then
			root:TryChangePage("Status", 2)
			ClientTextUtils.setText(textSoldOutUBaseText, pg.getGameString("CASH_SHOP_SOLD_OUT"))
		else
			root:TryChangePage("Status", 0)
		end

		if giftData.giftPackType == 3 then
			local redDotPath = string.format(RedDotConst.RedDotPath.CASH_SHOP_GIFTPACK_DAILY_REWARD_ITEM, data.id)

			pg.global.setRedDot(redDotPath, button, leftLimit > 0, RedDotConst.RedDotStyle.REWARD)
		end
	else
		limitedTextUBaseText.gameObject:SetActiveEx(false)
	end

	if commodityData.condition and not ClientCashShopUtils.checkConditions(commodityData.condition) then
		root:TryChangePage("Status", 1)
		ClientTextUtils.setText(textLockUBaseText, LuaUIUtils.getConditionUnlockDesc(commodityData.condition))
	end

	if definitiveUWidget then
		definitiveUWidget.gameObject:SetActiveEx(showLimitTag)
	end

	if getTxt then
		ClientTextUtils.setText(getTxt, showLimitTag and pg.getGameString("CASH_LIMIT_TITLE") or "")
	end
end

return CashShopGiftPackComponent
