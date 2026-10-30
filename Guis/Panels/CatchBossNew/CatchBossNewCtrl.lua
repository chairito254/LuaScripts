-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CatchBossNew\\CatchBossNewCtrl.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local logger = require("Core.Log.LoggerManager").getLogger("CatchBossNewCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientCaptureUtils = require("Utils.ClientCaptureUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local CameraConst = require("GameApp.Camera.CameraConst")
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local CommonSwitch = require("Common.CommonSwitch")
local AttributeConst = require("Common.Const.AttributeConst")
local Time = require("Core.Common.Time")
local NoticeDef = require("Common.NoticeDef")
local PetConfigData = require("Data.pet_config_data")
local SysConfigData = require("Data.sys_config_data")
local CashShopConst = require("Const.CashShopConst")
local AddressDataConst = require("Const.AddressDataConst")
local CatchBossNewCtrl = Class.LightClass("CatchBossNewCtrl", UICtrl)
local TimerManager = require("Core.Timer.TimerManager")
local rectTransformUtility = CS.UnityEngine.RectTransformUtility
local CATCH_BALL_SHOP_CLASSIFY_ID = 5
local NAV_GROUP_BALL = "ListBall"
local CONSOLE_BAR_STATE_REWARD_FOCUSED = "CatchBossNew_RewardFocused"
local CONSOLE_BAR_STATE_SHOP_PLUS_FOCUSED = "CatchBossNew_ShopPlusFocused"
local CONSOLE_BAR_LISTENER_NAME = "CatchBossNewConsoleBar"

CatchBossNewCtrl.MULTI_REWARD_MULTIPLIER = 2

local function setActive(target, active)
	if not target then
		return
	end

	if target.gameObject then
		target.gameObject:SetActiveEx(active)
	else
		target:SetActive(active)
	end
end

CatchBossNewCtrl.messages = {
	[MessageName.ON_BACKPACK_INFO_CHANGE] = {
		"onBackPackInfoChange",
		true
	},
	[MessageName.ITEM_COUNT_MAP_CHANGE] = {
		"refreshInfo",
		true
	},
	[MessageName.CURRENCY_CHANGE] = {
		"onCostCountChange",
		true
	},
	[MessageName.MONEY_COUNT_CHANGE] = {
		"onCostCountChange",
		true
	},
	[MessageName.MONTH_CARD_ACTIVATE] = {
		"refreshInfo",
		true
	},
	[MessageName.COMMON_SWITCH_STATE_CHANGED] = {
		"refreshConfirmButtonState",
		true
	}
}

function CatchBossNewCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function CatchBossNewCtrl:addListener()
	function self.view.btnCancelUButton.luaClick()
		self:onConfirmClick(1)
	end

	function self.view.btnConfirmUButton.luaClick()
		self:onMultiCatchConfirmClick()
	end

	function self.view.btnAbandonUButton.luaClick()
		self:onCancelClick()
	end

	function self.view.btnDoubleUButton.luaClick()
		self.view.btnDoubleUButton:OpenTooltipWithUrl(AddressDataConst.UI_TOOLTIP_SKILL_INFO_WITH_TITLE)
	end

	function self.view.btnDoubleUButton.luaRenderTooltip(_, tooltip)
		local objectReference = tooltip:GetComponent("ObjectReference")
		local btnUpUButton = objectReference:GetRefValue("btnUpUButton")

		tooltip:TryChangePage("Btn", 1)
		tooltip:TryChangePage("headTitle", 0)
		ClientTextUtils.setText(objectReference:GetRefValue("txtDesc"), pg.getGameString("PET_CATCHBOSS_DOUBLE_RIGHTS_TIP"))
		ClientTextUtils.setText(objectReference:GetRefValue("btnNameUSDFText"), pg.getGameString("INCUBATE_MONTHLY_GO_TO"))

		function btnUpUButton.luaClick()
			self:openMonthCardShop()
		end
	end

	function self.view.btnRightsUButton.luaClick()
		self.view.btnRightsUButton:OpenTooltipWithUrl(AddressDataConst.UI_TOOLTIP_SKILL_INFO_WITH_TITLE)
	end

	function self.view.btnRightsUButton.luaRenderTooltip(_, tooltip)
		local objectReference = tooltip:GetComponent("ObjectReference")

		tooltip:TryChangePage("Btn", 0)
		tooltip:TryChangePage("headTitle", 0)
		ClientTextUtils.setText(objectReference:GetRefValue("txtDesc"), pg.getGameString("PET_CATCHBOSS_DOUBLE_RIGHTS_TIP"))
	end

	if pg.global.navMgr then
		self:addNavFocusListener(function()
			self:refreshConsoleBarState()
			self:refreshConfirmButtonState()
			self:_scheduleCatchBallSelectedVisualRefresh()
		end, CONSOLE_BAR_LISTENER_NAME)

		self._consoleBarHotkeyListenerName = CONSOLE_BAR_LISTENER_NAME .. tostring(self.uid)

		pg.global.navMgr:AddLuaHotkeyActivationChangedListener(self._consoleBarHotkeyListenerName, function()
			self:refreshConsoleBarState()
			self:_scheduleCatchBallSelectedVisualRefresh()
		end)
	end
end

function CatchBossNewCtrl:_isUsingGamepad()
	local input = pg.game and pg.game.input

	if not input or not input.isUsingGamepad then
		return false
	end

	return input:isUsingGamepad() == true
end

function CatchBossNewCtrl:_isFocusedCatchBallPlus()
	local navMgr = pg.global.navMgr
	local focused = navMgr and navMgr.CurrentFocusedUContent
	local plusRoot = self._catchBallPlusRootButton
	local plusItem = self._catchBallPlusItemButton

	if not focused then
		return false
	end

	return focused == plusRoot or focused == plusItem
end

function CatchBossNewCtrl:refreshConsoleBarState()
	local navMgr = pg.global.navMgr
	local groupName = navMgr and navMgr.CurrentFocusedGroupName
	local plusFocused = groupName == NAV_GROUP_BALL and self:_isFocusedCatchBallPlus()

	CS.XGUI.Navigation.ConsoleBar.SetStateForAll(CONSOLE_BAR_STATE_SHOP_PLUS_FOCUSED, not not plusFocused)
	CS.XGUI.Navigation.ConsoleBar.SetStateForAll(CONSOLE_BAR_STATE_REWARD_FOCUSED, false)
end

function CatchBossNewCtrl:onDestroy()
	if self._consoleBarHotkeyListenerName and pg.global.navMgr then
		pg.global.navMgr:RemoveLuaHotkeyActivationChangedListener(self._consoleBarHotkeyListenerName)
	end

	self._consoleBarHotkeyListenerName = nil

	if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP) then
		pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)
	end

	self._tooltipItemId = nil

	UICtrl.onDestroy(self)
	pg.global.ui:show(UIConst.UI_ID_HUD_V2)
end

function CatchBossNewCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	ClientTextUtils.setText(self.view.bossTxtRewardUSDFText, pg.getGameString("PET_CATCHBOSS_NEW_REWARD"))
	ClientTextUtils.setText(self.view.ballTxtCatchUSDFText, pg.getGameString("PET_CATCHBOSS_NEW_ACTION"))
	ClientTextUtils.setText(self.view.comsumeTxtNumUSDFText, pg.getGameString("PET_CATCHBOSS_NEW_COST"))
	ClientTextUtils.setText(self.view.btnCancelTxtNameUSDFText, pg.getGameString("PET_CATCHBOSS_NEW_GET"))
	ClientTextUtils.setText(self.view.btnConfirmTxtNameUSDFText, pg.getGameString("PET_CATCHBOSS_NEW_GET"))
	ClientTextUtils.setText(self.view.textRightUSDFText, pg.getGameString("PET_CATCHBOSS_MONTH_CARD_RIGHTS"))
	ClientTextUtils.setText(self.view.textBtnDoubleUSDFText, pg.getGameString("PET_CATCHBOSS_DOUBLE_REWARD"))
	ClientTextUtils.setText(self.view.textBackUSDFText, pg.getGameString("PET_CATCHBOSS_GIVEUP_BUTTON"))
	ClientTextUtils.setText(self.view.textTagDoubleUSDFText, pg.getGameString("X2"))
	pg.global.ui:hide(UIConst.UI_ID_HUD_V2)

	self.bossEntity = info.bossEntity
	self.curSelectIndex = nil
	self.curSelectCastItem = nil
	self.rewardMultiplier = 1
	self._returnFromCatchBallShop = false
	self._returnFromMonthCardShop = false

	self:refreshInfo()
end

function CatchBossNewCtrl:onShow()
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossCatch, true)
end

function CatchBossNewCtrl:onVisibleChange(visible)
	if not visible then
		return
	end

	local fromShop = self._returnFromCatchBallShop == true
	local fromMonthCardShop = self._returnFromMonthCardShop == true

	self._returnFromCatchBallShop = false
	self._returnFromMonthCardShop = false

	if fromMonthCardShop then
		local endTs = pg.me.groupDropEndTsMap[self.bossEntity.actorId]

		if self.bossEntity.destroyed or not endTs or endTs <= Time.secondCache then
			pg.me:finishBossCapture(self.bossEntity.actorId)

			return
		end
	end

	if fromShop or fromMonthCardShop or self._catchBallListDirty then
		self:refreshInfo()
	else
		self:refreshCostInfo()
	end

	if fromShop or fromMonthCardShop then
		local view = self.view

		TimerManager.addNextFrameCb(function()
			if self.view ~= view or not self:checkUIVisible() then
				return
			end

			self:_restoreCatchBallListScroll()
			self:_restoreCatchBallSelectedFocus()
			self:_syncCatchBallListSwitchIndex()
		end)
	end
end

function CatchBossNewCtrl:onHide()
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossCatch, false)
end

function CatchBossNewCtrl:refreshInfo()
	if not self:checkUIVisible() then
		self._catchBallListDirty = true

		return
	end

	self._catchBallListDirty = false
	self._catchBallPlusRootButton = nil
	self._catchBallPlusItemButton = nil
	self.itemList = self.model:getBossCapturePropInfos(self.bossEntity)

	table.insert(self.itemList, {
		empty = true
	})
	self:syncSelectedItem()

	function self.view.listUList.luaRenderItem(button, idx, data)
		self:renderCatchBallItem(button, idx, data)
	end

	self.view.listUList:SetList(self.itemList)
	self:refreshBossInfo()
	self:refreshRewardInfo()
	self:refreshCostInfo()
	self:refreshConsoleBarState()
	self:_syncCatchBallListSwitchIndex()
end

function CatchBossNewCtrl:initMultiCatchInfo()
	self.hasDoubleRewardPrivilege = self:hasBossDoubleRewardPrivilege()
	self.doubleItemId = SysConfigData.BossDoubleItem
	self.doubleItemCount = self.doubleItemId and ClientUtils.getItemCountById(self.doubleItemId) or 0

	setActive(self.view.btnRightsUButton, self.hasDoubleRewardPrivilege)

	local showDouble = not self.hasDoubleRewardPrivilege and self.doubleItemCount <= 0

	setActive(self.view.btnDoubleUButton, showDouble)

	if not showDouble then
		self.view.btnDoubleUButton:CloseTooltip()
	end

	self.view.btnConfirmUButton:TryChangePage("Consume", self.hasDoubleRewardPrivilege and 0 or 1)

	self.view.iconConsumeTicketUImage.url = self.doubleItemId and LuaUIUtils.getIconByItemId(self.doubleItemId) or ""

	ClientTextUtils.setText(self.view.txtNumTicketUSDFText, self.doubleItemCount > 0 and "1" or "<style=Debuff>0</style>")
end

function CatchBossNewCtrl:hasBossDoubleRewardPrivilege()
	return pg.me.actorCombatAttribute:getAttribValue(AttributeConst.double_boss_reward) == 1
end

function CatchBossNewCtrl:syncSelectedItem()
	local selectedItemId = self.curSelectCastItem and self.curSelectCastItem.itemId

	self.curSelectIndex = nil
	self.curSelectCastItem = nil

	local firstFreeIndex, firstFreeItem, firstAvailableIndex, firstAvailableItem

	for idx, itemInfo in ipairs(self.itemList or EMPTY_TABLE) do
		if not itemInfo.empty then
			if itemInfo.isFree and not firstFreeIndex then
				firstFreeIndex = idx
				firstFreeItem = itemInfo
			end

			if self:isBallItemEnough(itemInfo) and not firstAvailableIndex then
				firstAvailableIndex = idx
				firstAvailableItem = itemInfo
			end

			if selectedItemId and itemInfo.itemId == selectedItemId and self:isBallItemEnough(itemInfo) then
				self.curSelectIndex = idx
				self.curSelectCastItem = itemInfo

				return
			end
		end
	end

	self.curSelectIndex = firstFreeIndex or firstAvailableIndex
	self.curSelectCastItem = firstFreeItem or firstAvailableItem
end

function CatchBossNewCtrl:refreshBossInfo()
	if not self.bossEntity then
		return
	end

	local gender = 2

	if self.bossEntity.gender == Const.GENDER_TYPE_MALE then
		gender = 0
	elseif self.bossEntity.gender == Const.GENDER_TYPE_FEMALE then
		gender = 1
	end

	local pData = self.bossEntity:getConfigData()

	self.view.bossInfoUComponent:TryChangePage("Gender", gender)
	ClientTextUtils.setText(self.view.txtLvUBaseText, string.format("%s %s", pg.getGameString("LEVEL_TAG"), self.bossEntity.level))
	ClientTextUtils.setText(self.view.txtNameUBaseText, pg.getLocalizationText(pData.name))

	function self.view.listElementUList.luaRenderItem(button, idx, data)
		self:renderBossElementItem(button, idx, data)
	end

	local _, elementNames = LuaUIUtils.getElementInfo(pData.elementType)

	self.view.listElementUList:SetList(elementNames)

	local petType = pData.functionId
	local petTypeIcon = petType and PetConfigData.petFunctionIcon[petType]
	local petTypeText = petType and PetConfigData[string.format("petFunctionText%s", petType)]

	setActive(self.view.bossOccupationUWidget, petTypeIcon ~= nil or petTypeText ~= nil)

	if petTypeIcon then
		self.view.bossIconOccupationUImage.url = petTypeIcon
	end

	if petTypeText then
		ClientTextUtils.setText(self.view.bossTxtOccupationUSDFText, pg.getLocalizationText(petTypeText))
	end
end

function CatchBossNewCtrl:refreshRewardInfo()
	local rewards = self.model:getBossCaptureRewardInfos(self.bossEntity)

	function self.view.bossRewardsUList.luaRenderItem(button, idx, data)
		LuaUIUtils.renderRewards(button, idx, data)
	end

	self.view.bossRewardsUList:SetList(rewards)
end

function CatchBossNewCtrl:refreshCostInfo()
	self:initMultiCatchInfo()

	self.costInfo = self.model:getBossCaptureCostInfo(self.bossEntity)

	setActive(self.view.consumeUWidget, self.costInfo ~= nil)
	setActive(self.view.consumeOneUWidget, self.costInfo ~= nil)

	if self.costInfo then
		self.costInfo.ownCount = ClientUtils.getItemCountById(self.costInfo.itemId)
		self.view.iconConsumeUImage.url = self.costInfo.icon
		self.view.iconConsumeOneUImage.url = self.costInfo.icon

		local normalText = tostring(self.costInfo.count)
		local doubleText = tostring(self.costInfo.count * self.MULTI_REWARD_MULTIPLIER)

		if not self:isCostEnough() then
			normalText = string.format("<style=Debuff>%s</style>", normalText)
		end

		if not self:isCostEnough(self.MULTI_REWARD_MULTIPLIER) then
			doubleText = string.format("<style=Debuff>%s</style>", doubleText)
		end

		ClientTextUtils.setText(self.view.txtNumOneUSDFText, normalText)
		ClientTextUtils.setText(self.view.comsumeTxtNumUSDFText, doubleText)

		local consumeText = pg.getGameString("PET_CATCHBOSS_NEW_COST")

		ClientTextUtils.setText(self.view.txtConsumeUSDFText, consumeText)
		ClientTextUtils.setText(self.view.consumeOneUSDFText, consumeText)
	end

	local currencyItems = {}

	if not self.hasDoubleRewardPrivilege and self.doubleItemId then
		currencyItems[#currencyItems + 1] = self.doubleItemId
	end

	if self.costInfo then
		currencyItems[#currencyItems + 1] = self.costInfo.itemId
	end

	LuaUIUtils.setTopCurrencyItemList(self.view.listCurrencyUList, nil, currencyItems)
	self:refreshConfirmButtonState()
end

function CatchBossNewCtrl:isCostEnough(multiplier)
	if not self.costInfo or not self.costInfo.count or self.costInfo.count <= 0 then
		return true
	end

	return ClientUtils.getItemCountById(self.costInfo.itemId) >= self.costInfo.count * (multiplier or 1)
end

function CatchBossNewCtrl:isBallItemEnough(item)
	if not item or item.empty then
		return false
	end

	if item.isFree then
		return true
	end

	return ClientUtils.getItemCountById(item.itemId) > 0
end

function CatchBossNewCtrl:isCurSelectBallEnough()
	return self:isBallItemEnough(self.curSelectCastItem)
end

function CatchBossNewCtrl:refreshConfirmButtonState()
	if not self.view or not self.view.btnConfirmUButton then
		return
	end

	local plusBlocked = self:_isUsingGamepad() and self:_isFocusedCatchBallPlus()
	local canCatch = not plusBlocked and self:isCurSelectBallEnough()
	local normalEnabled = canCatch and self:isCostEnough()
	local doubleEnabled = CommonSwitch.CAPTURE_REWARDS_DOUBLE ~= false and canCatch and self:isCostEnough(self.MULTI_REWARD_MULTIPLIER) and (self.hasDoubleRewardPrivilege or (self.doubleItemCount or 0) > 0)

	self._catchConfirmBlockedByPlus = plusBlocked

	self:refreshCatchButtonState(self.view.btnCancelUButton, normalEnabled, plusBlocked)
	self:refreshCatchButtonState(self.view.btnConfirmUButton, doubleEnabled, plusBlocked)
end

function CatchBossNewCtrl:refreshCatchButtonState(button, enabled, plusBlocked)
	button.visualInteractable = enabled
	button.interactable = not plusBlocked

	button:TryChangePage("button", enabled and 1 or 4)

	if button.SetHotkeyForceHidden then
		button:SetHotkeyForceHidden(plusBlocked)
	end

	TimerManager.addNextFrameCb(function()
		if not self.view then
			return
		end

		local rayBox = button.transform:Find("RayBox")

		if rayBox and rayBox.gameObject then
			rayBox.gameObject:SetActiveEx(not plusBlocked)
		end
	end)
end

function CatchBossNewCtrl:_toggleItemTooltip(data, targetButton)
	local opened = pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_ITEM_TIP)

	if not opened then
		self._tooltipItemId = nil
	end

	local sameItem = opened and self._tooltipItemId == data.itemId

	if opened then
		pg.global.ui:close(UIConst.UI_ID_COMMON_ITEM_TIP)
	end

	if sameItem then
		self._tooltipItemId = nil

		return
	end

	self._tooltipItemId = data.itemId

	pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
		checkTouchBegin = false,
		id = data.itemId,
		num = data.count or 0,
		targetRect = targetButton,
		allowedSourceIds = PetConfigData.bossCatchBallGetMethodsWhitelist,
		validateTouch = function(pos)
			if not NotNil(targetButton) then
				return true
			end

			local rt = targetButton.rectTransform

			if not rt then
				return true
			end

			return not rectTransformUtility.RectangleContainsScreenPoint(rt, pos, CS.XGUI.UWidget.uiCamera)
		end
	})
end

function CatchBossNewCtrl:renderCatchBallItem(button, idx, data)
	local objectReference = button:GetComponent("ObjectReference")
	local rootComponent = objectReference:GetRefValue("rootComponent")
	local iconBallUImage = objectReference:GetRefValue("iconBallUImage")
	local txtNumUBaseText = objectReference:GetRefValue("txtNumUBaseText")
	local txtPercentUBaseText = objectReference:GetRefValue("txtPercentUBaseText")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local rootButton = objectReference:GetRefValue("rootButton")
	local freeTagUWidget = objectReference:GetRefValue("freeTagUWidget")
	local txtFreeUSDFText = objectReference:GetRefValue("txtFreeUSDFText")

	ClientTextUtils.setText(txtFreeUSDFText, pg.getGameString("PET_CATCHBOSS_NEW_FREE"))

	local itemIndex = idx + 1

	if data.empty then
		rootComponent:TryChangePage("Empty", 0)

		self._catchBallPlusRootButton = rootButton
		self._catchBallPlusItemButton = button

		function rootButton.luaClick(isFromNavigation)
			self:_tryOpenCatchBallShopFromPlus(isFromNavigation)
		end

		rootButton.interactable = true

		self:_applyCatchBallItemNavFlags(button, rootButton, false, false, false)

		rootButton.isSelected = false

		self:_applyCatchBallSelectedPage(rootButton, false)

		rootButton.enabledLongPress = false
		rootButton.luaLongPress = nil
		rootButton.luaBeginLongPress = nil

		freeTagUWidget:SetActive(false)

		return
	end

	if self._catchBallPlusRootButton == rootButton then
		self._catchBallPlusRootButton = nil
	end

	if self._catchBallPlusItemButton == button then
		self._catchBallPlusItemButton = nil
	end

	rootComponent:TryChangePage("Empty", 1)
	rootComponent:TryChangePage("Quality", data.quality or 0)

	iconBallUImage.url = LuaUIUtils.getIconByItemId(data.itemId)

	ClientTextUtils.setText(txtNumUBaseText, data.isFree and "" or tostring(data.count or 0))
	ClientTextUtils.setText(txtNameUBaseText, pg.getLocalizationText(data.name))
	ClientTextUtils.setText(txtPercentUBaseText, LuaUIUtils.formatCatchRate(data.prob) .. "%")
	rootComponent:TryChangePage("SuccessRate", ClientCaptureUtils.getBossCatchPageByRate(data.prob))

	local enabled = self:isBallItemEnough(data)
	local isUnavailable = not enabled

	rootButton.enabledLongPress = true
	rootButton.luaLongPress = nil

	local longPressFired = false

	function rootButton.luaBeginLongPress()
		longPressFired = true

		self:_toggleItemTooltip(data, rootButton)
	end

	if isUnavailable then
		rootButton.interactable = true
		rootButton.visualInteractable = false

		self:_applyCatchBallItemNavFlags(button, rootButton, true, true, true)

		local dim = Color(0.4, 0.4, 0.4, 1)

		iconBallUImage.color = dim
		txtNumUBaseText.color = dim

		function rootButton.luaClick()
			if longPressFired then
				longPressFired = false

				return
			end

			self:selectItem(itemIndex)
		end
	else
		rootButton.interactable = enabled
		rootButton.visualInteractable = enabled

		self:_applyCatchBallItemNavFlags(button, rootButton, false, false, true)

		local normal = Color(1, 1, 1, 1)

		iconBallUImage.color = normal
		txtNumUBaseText.color = normal

		function rootButton.luaClick()
			if longPressFired then
				longPressFired = false

				return
			end

			self:selectItem(itemIndex)
		end
	end

	local selected = enabled and self.curSelectIndex == itemIndex

	rootButton.isSelected = selected

	self:_applyCatchBallSelectedPage(rootButton, selected)
	freeTagUWidget:SetActive(data.isFree == true)
end

function CatchBossNewCtrl:_applyCatchBallSelectedPage(rootButton, selected)
	if not rootButton then
		return
	end

	if selected and rootButton.TryChangePage then
		rootButton:TryChangePage("button", "s_focus")
	end
end

function CatchBossNewCtrl:_refreshCatchBallSelectedVisual()
	local list = self.view and self.view.listUList

	if not list or not list.TryGetChildAt then
		return
	end

	local itemList = self.itemList or EMPTY_TABLE

	for i = 1, #itemList do
		local ok, button = list:TryGetChildAt(i - 1)

		if ok and button then
			local objectReference = button:GetComponent("ObjectReference")
			local rootButton = objectReference and objectReference:GetRefValue("rootButton")
			local data = itemList[i]
			local selected = false

			if data and not data.empty then
				selected = self.curSelectIndex == i and self:isBallItemEnough(data)
			end

			if rootButton then
				rootButton.isSelected = selected

				self:_applyCatchBallSelectedPage(rootButton, selected)
			end
		end
	end
end

function CatchBossNewCtrl:_scheduleCatchBallSelectedVisualRefresh()
	self:_refreshCatchBallSelectedVisual()
	self:_prefetchCatchBallPrevValid()
	self:_syncCatchBallListSwitchIndex()
	TimerManager.addNextFrameCb(function()
		if not self.view then
			return
		end

		self:_refreshCatchBallSelectedVisual()
		self:_prefetchCatchBallPrevValid()
		self:_syncCatchBallListSwitchIndex()
	end)
end

function CatchBossNewCtrl:renderBossElementItem(button, idx, data)
	LuaUIUtils.setElementGrade(button, data.element, self.bossEntity.templateId, false)
end

function CatchBossNewCtrl:selectItem(itemIndex)
	itemIndex = math.clamp(itemIndex, 1, #self.itemList)

	local itemInfo = self.itemList[itemIndex]

	if not itemInfo then
		return false
	end

	if itemInfo.empty then
		return false
	end

	if not self:isBallItemEnough(itemInfo) then
		LuaUIUtils.showItemNotEnough(itemInfo.itemId)

		return false
	end

	self.curSelectIndex = itemIndex
	self.curSelectCastItem = itemInfo

	self.view.listUList:RefreshList()
	self:refreshConfirmButtonState()

	return true
end

function CatchBossNewCtrl:_saveCatchBallListScroll()
	local list = self.view and self.view.listUList
	local pos = list and list.currentScrollPosition

	if not pos then
		self._catchBallListScrollX = nil
		self._catchBallListScrollY = nil

		return
	end

	self._catchBallListScrollX = pos.x
	self._catchBallListScrollY = pos.y
end

function CatchBossNewCtrl:_applyCatchBallItemNavFlags(button, rootButton, skip, forceNon, disableClick)
	if rootButton then
		rootButton.skipInListSwitch = skip
		rootButton.navForceNonInteractable = forceNon
		rootButton.navItemDisableClick = disableClick
	end

	if button then
		button.skipInListSwitch = skip
		button.navForceNonInteractable = forceNon
		button.navItemDisableClick = disableClick
	end
end

function CatchBossNewCtrl:_isCatchBallListSwitchable(data)
	if not data then
		return false
	end

	if data.empty then
		return true
	end

	return self:isBallItemEnough(data)
end

function CatchBossNewCtrl:_getCatchBallFocusedDataIndex()
	local navMgr = pg.global.navMgr
	local focused = navMgr and navMgr.CurrentFocusedUContent

	if not focused then
		return nil
	end

	local list = self.view and self.view.listUList

	if not list or not list.TryGetChildAt then
		return nil
	end

	local itemList = self.itemList or EMPTY_TABLE

	for i = 1, #itemList do
		local ok, child = list:TryGetChildAt(i - 1)

		if ok and child then
			if focused == child then
				return i - 1
			end

			local objectReference = child:GetComponent("ObjectReference")
			local rootButton = objectReference and objectReference:GetRefValue("rootButton")

			if focused == rootButton then
				return i - 1
			end
		end
	end

	return nil
end

function CatchBossNewCtrl:_findPrevValidCatchBallIndex(fromIndex)
	if fromIndex == nil or fromIndex <= 0 then
		return nil
	end

	local itemList = self.itemList or EMPTY_TABLE

	for i = fromIndex, 1, -1 do
		if self:_isCatchBallListSwitchable(itemList[i]) then
			return i - 1
		end
	end

	return nil
end

function CatchBossNewCtrl:_prefetchCatchBallPrevValid()
	if not self:_isUsingGamepad() then
		return
	end

	if self:_isFocusedCatchBallPlus() then
		return
	end

	local list = self.view and self.view.listUList

	if not list or not list.GoToIndexMinCost then
		return
	end

	local fromIndex = self:_getCatchBallFocusedDataIndex()

	if fromIndex == nil then
		return
	end

	local prev = self:_findPrevValidCatchBallIndex(fromIndex)

	if prev == nil then
		return
	end

	local ok = list:TryGetChildAt(prev)

	if ok then
		return
	end

	list:GoToIndexMinCost(prev, false, true)
end

function CatchBossNewCtrl:_syncCatchBallListSwitchIndex()
	local list = self.view and self.view.listUList

	if not list or not list.SetUListSwitchCurrentIndex then
		return
	end

	local idx = self:_getCatchBallFocusedDataIndex()

	if idx == nil then
		idx = list.focusedIndex
	end

	if idx == nil or idx < 0 then
		if self:_isFocusedCatchBallPlus() then
			idx = #(self.itemList or EMPTY_TABLE) - 1
		else
			idx = (self.curSelectIndex or 1) - 1
		end
	end

	if idx < 0 then
		return
	end

	list:SetUListSwitchCurrentIndex(idx)
end

function CatchBossNewCtrl:_restoreCatchBallSelectedFocus()
	local list = self.view and self.view.listUList
	local navMgr = pg.global.navMgr

	if not list or not navMgr or not self.curSelectIndex or not self:_isUsingGamepad() or not navMgr:IsFocusInNavGroupOf(list) then
		return
	end

	local index = self.curSelectIndex - 1

	list:GoToIndexMinCost(index, false, true)

	local found, button = list:TryGetChildAt(index)

	if not found or not button then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local rootButton = objectReference:GetRefValue("rootButton")

	if rootButton.isSelected and navMgr.CurrentFocusedUContent ~= rootButton then
		navMgr:FocusItem(rootButton, CS.XGUI.Navigation.FocusEntryMode.Restore)
	end
end

function CatchBossNewCtrl:_restoreCatchBallListScroll()
	local list = self.view and self.view.listUList

	if not list then
		return
	end

	local x = self._catchBallListScrollX
	local y = self._catchBallListScrollY

	if x == nil or y == nil then
		return
	end

	list:SetCurrentScrollPositionEx(x, y)
end

function CatchBossNewCtrl:_tryOpenCatchBallShopFromPlus(isFromNavigation)
	if isFromNavigation then
		return
	end

	if self:_isUsingGamepad() then
		if self:_isFocusedCatchBallPlus() then
			self:openCatchBallShop()
		end

		return
	end

	self:openCatchBallShop()
end

function CatchBossNewCtrl:openCatchBallShop()
	if LuaUIUtils.checkFuncTemporaryDisable(UIConst.UI_ID_SHOP_MAIN) then
		return
	end

	self:_saveCatchBallListScroll()

	self._returnFromCatchBallShop = true

	pg.global.ui:open(UIConst.UI_ID_SHOP_MAIN, {
		shopTags = {
			CATCH_BALL_SHOP_CLASSIFY_ID
		}
	})
end

function CatchBossNewCtrl:openMonthCardShop()
	if LuaUIUtils.checkFuncTemporaryDisable(UIConst.UI_ID_BP_PERMIT) then
		return
	end

	self.view.btnDoubleUButton:CloseTooltip()
	self:_saveCatchBallListScroll()

	self._returnFromMonthCardShop = true

	pg.global.ui:open(UIConst.UI_ID_BP_PERMIT, {
		hideTabBar = true,
		tabId = CashShopConst.CardShopType.MonthCard
	})
end

function CatchBossNewCtrl:closePanel()
	self:onCancelClick()
end

function CatchBossNewCtrl:onCancelClick()
	local prefsKey = ClientConst.PrefKey.CatchBossCancelTipTs
	local lastConfirmTime = pg.global.prefsCacheUtils:getInt(prefsKey, 0, ClientConst.CACHE_TYPE_FLAG.USER)

	if lastConfirmTime > 0 and lastConfirmTime + 604800 > Time.secondCache then
		self:doCancelCapture()

		return
	end

	local bossEntity = self.bossEntity
	local hideSevenDays = false

	pg.global.showConfirmMsgRaw(pg.getGameString("PET_CATCHBOSS_GIVEUP_CONFIRM_TITLE"), pg.getGameString("PET_CATCHBOSS_GIVEUP_CONFIRM_DESC"), function()
		if not self:checkUIOpen() or self.bossEntity ~= bossEntity or bossEntity.destroyed then
			return
		end

		if hideSevenDays then
			pg.global.prefsCacheUtils:setInt(prefsKey, Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
			pg.global.prefsCacheUtils:save()
		end

		self:doCancelCapture()
	end, false, nil, nil, nil, {
		textLocalized = true,
		hint = true,
		hintDesc = string.format(pg.getGameString("DISABLE_HINT"), 7),
		hintCb = function(isSelected)
			hideSevenDays = isSelected
		end
	})
end

function CatchBossNewCtrl:doCancelCapture()
	pg.me:cancelBossCapture(self.bossEntity.actorId)
	self:dismiss()
end

function CatchBossNewCtrl:showCostNotEnoughConfirm()
	if not self.costInfo then
		return
	end

	if self.costInfo.itemId == Const.CommonEnergyType_Stamina then
		LuaUIUtils.openVitalityGot(Const.CommonEnergyType_Stamina)
	else
		LuaUIUtils.showItemNotEnough(self.costInfo.itemId)
	end
end

function CatchBossNewCtrl:onConfirmClick(rewardMultiplier)
	if rewardMultiplier > 1 and CommonSwitch.CAPTURE_REWARDS_DOUBLE == false then
		pg.global.ui.tips:showTextTip(pg.getGameString("NOTIFY_SERVER_SWITCH"))

		return
	end

	if self.lastClickTime and Time.realSecondCache - self.lastClickTime <= 1 then
		return
	end

	self.lastClickTime = Time.realSecondCache

	if self._catchConfirmBlockedByPlus or self:_isFocusedCatchBallPlus() then
		return
	end

	local itemInfo = self.curSelectCastItem

	if not itemInfo or itemInfo.empty then
		return
	end

	if not self:isBallItemEnough(itemInfo) then
		self:refreshInfo()
		LuaUIUtils.showItemNotEnough(itemInfo.itemId)

		return
	end

	if rewardMultiplier > 1 then
		self:initMultiCatchInfo()

		if not self.hasDoubleRewardPrivilege and self.doubleItemCount <= 0 then
			pg.global.ui.tips:showTextTip(pg.getGameString("PET_CATCHBOSS_DOUBLE_TICKET_NOT_ENOUGH"))

			return
		end
	end

	if not self:isCostEnough(rewardMultiplier) then
		self:showCostNotEnoughConfirm()

		return
	end

	self.rewardMultiplier = rewardMultiplier

	if pg.game.controller.onHandleSwitchProp then
		pg.game.controller:onHandleSwitchProp()
	end

	if pg.game.controller.onHandleThrow then
		pg.game.controller:onHandleThrow()
	end
end

function CatchBossNewCtrl:onMultiCatchConfirmClick()
	self:onConfirmClick(self.MULTI_REWARD_MULTIPLIER)
end

function CatchBossNewCtrl:getRewardMultiplier()
	return self.rewardMultiplier
end

function CatchBossNewCtrl:getCurSelectPropId()
	return self.curSelectCastItem and self.curSelectCastItem.itemId
end

function CatchBossNewCtrl:isCurSelectFree()
	return self.curSelectCastItem and self.curSelectCastItem.isFree == true
end

function CatchBossNewCtrl:getCurSelectPropInfo()
	return self.curSelectCastItem
end

function CatchBossNewCtrl:onBackPackInfoChange()
	self:refreshInfo()
end

function CatchBossNewCtrl:onCostCountChange()
	self:refreshCostInfo()

	if self.view and self.view.listCurrencyUList then
		self.view.listCurrencyUList:RefreshList()
	end
end

return CatchBossNewCtrl
