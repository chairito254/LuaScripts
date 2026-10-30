-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandFurnitureComplete\\HomelandFurnitureCompleteCtrl.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientHomelandUtils = require("Utils.ClientHomelandUtils")
local ItemData = require("Data.item_data")
local Const = require("Common.Const.Const")
local NoticeDef = require("Common.NoticeDef")
local UIConst = require("Const.UIConst")
local MessageName = require("Const.MessageName")
local HomeSeasonUtils = require("Utils.HomeSeasonUtils")
local HomelandFurnitureCompleteModel = require("Guis.Panels.HomelandFurnitureComplete.HomelandFurnitureCompleteModel")
local HomelandFurnitureCompleteCtrl = Class.LightClass("HomelandFurnitureCompleteCtrl", UICtrl)

HomelandFurnitureCompleteCtrl.modelClz = HomelandFurnitureCompleteModel
HomelandFurnitureCompleteCtrl.SELECT_PAGE_NORMAL = 0
HomelandFurnitureCompleteCtrl.SELECT_PAGE_SELECTED = 1
HomelandFurnitureCompleteCtrl.SELECT_PAGE_LOCK = 2
HomelandFurnitureCompleteCtrl.NAVIGATION_LISTENER_NAME = "HomelandFurnitureComplete"
HomelandFurnitureCompleteCtrl.messages = {
	[MessageName.HOME_SEASON_CHANGE] = {
		"refreshView",
		true
	},
	[MessageName.MONEY_UNBOUND_CHANGE] = {
		"refreshView",
		true
	},
	[MessageName.ITEM_COUNT_MAP_CHANGE] = {
		"refreshView",
		true
	},
	[MessageName.HOMELAND_ITEM_MAP_CHANGED] = {
		"refreshView",
		true
	}
}

function HomelandFurnitureCompleteCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.info = info or {}

	if self.model then
		self.model:init(self.info)
	end
end

function HomelandFurnitureCompleteCtrl:addListener()
	if self.view.btnBackUButton then
		function self.view.btnBackUButton.luaClick()
			self:closePanel()
		end
	end

	if self.view.btnSelectAllUButton then
		function self.view.btnSelectAllUButton.luaClick()
			self.model:setAllSelected(not self.model:isAllSelected())
			self:refreshView()
		end
	end

	if self.view.btnCompleteUButton then
		function self.view.btnCompleteUButton.luaClick()
			self:onCompleteButtonClick()
		end
	end

	if self.view.listConsumeUList then
		function self.view.listConsumeUList.luaRenderItem(button, _, data)
			LuaUIUtils.renderCostItem(button, data)
		end
	end

	if self.view.listGroupUList then
		function self.view.listGroupUList.luaRenderItem(button, _, data)
			self:renderGroup(button, data)
		end
	end

	if pg.global.navMgr then
		pg.global.navMgr:AddLuaHotkeyActivationChangedListener(HomelandFurnitureCompleteCtrl.NAVIGATION_LISTENER_NAME, function()
			self:onGamepadNavigationStateChanged()
		end)
	end
end

function HomelandFurnitureCompleteCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.info = info or self.info or {}

	if self.model then
		self.model:init(self.info)
	end

	self.detailItemId = nil

	self:refreshView()
end

function HomelandFurnitureCompleteCtrl:getFirstCategoryTitleButton()
	if not self.view or not self.view.listGroupUList then
		return nil
	end

	for index = 0, #(self.groupList or EMPTY_TABLE) - 1 do
		local success, groupButton = self.view.listGroupUList:TryGetChildAt(index)

		if success and not IsNil(groupButton) then
			local objectReference = groupButton:GetComponent("ObjectReference")
			local titleButton = objectReference and objectReference:GetRefValue("btnAllSelectedUButton")

			if not IsNil(titleButton) and titleButton.gameObject.activeInHierarchy then
				return titleButton
			end
		end
	end

	return nil
end

function HomelandFurnitureCompleteCtrl:onGamepadNavigationStateChanged()
	local navMgr = pg.global.navMgr

	if not navMgr then
		return
	end

	local isVirtualMouseMode = navMgr.IsVirtualMouseMode
	local wasVirtualMouseMode = self.isVirtualMouseMode

	self.isVirtualMouseMode = isVirtualMouseMode

	if not self:checkUIShow() or self.adapter:getTopFirstPanel() ~= self.uid or wasVirtualMouseMode == nil or wasVirtualMouseMode == isVirtualMouseMode then
		return
	end

	if isVirtualMouseMode then
		local focusedContent = navMgr.CurrentFocusedUContent

		if focusedContent and not IsNil(focusedContent) then
			self.navigationFocusBeforeVirtualMouse = focusedContent
		end

		return
	end

	local focusTarget = self.navigationFocusBeforeVirtualMouse

	if not focusTarget or IsNil(focusTarget) or not focusTarget.gameObject.activeInHierarchy then
		focusTarget = self:getFirstCategoryTitleButton()
	end

	if focusTarget and not IsNil(focusTarget) then
		navMgr:FocusItem(focusTarget, CS.XGUI.Navigation.FocusEntryMode.Restore)
		navMgr:UpdateHotkeyActivationState()
	end
end

function HomelandFurnitureCompleteCtrl:onShow()
	UICtrl.onShow(self)

	if not pg.game.input or not pg.game.input:isUsingGamepad() or not pg.global.navMgr then
		return
	end

	self:startFrameTimer(function()
		if not self:checkUIShow() or not pg.game.input:isUsingGamepad() then
			return
		end

		local navModeSwitch = CS.XGUI.Navigation.NavModeSwitch.Instance

		if navModeSwitch then
			navModeSwitch:RefreshVirtualMouseToggleOwner()
		end

		pg.global.navMgr:SetVirtualMouseMode(false)

		self.isVirtualMouseMode = pg.global.navMgr.IsVirtualMouseMode

		local titleButton = self:getFirstCategoryTitleButton()

		if not titleButton then
			return
		end

		self.navigationFocusBeforeVirtualMouse = titleButton

		pg.global.navMgr:FocusItem(titleButton, CS.XGUI.Navigation.FocusEntryMode.Restore)

		if navModeSwitch then
			navModeSwitch:RefreshVirtualMouseToggleOwner()
		end

		pg.global.navMgr:UpdateHotkeyActivationState()
		pg.game.input:refreshCursorState()
	end, 1)
end

function HomelandFurnitureCompleteCtrl:getGroupList()
	local model = self.model
	local buyEntries = model:getCategoryEntries(model.CATEGORY_BUY)
	local redeemEntries = model:getCategoryEntries(model.CATEGORY_REDEEM)
	local unavailableEntries = model:getCategoryEntries(model.CATEGORY_UNAVAILABLE)
	local groups = {}

	if #buyEntries > 0 then
		table.insert(groups, {
			category = model.CATEGORY_BUY,
			title = pg.getGameString("HOMELAND_FURNITURE_COMPLETE_BUY_CATEGORY"),
			items = buyEntries
		})
	end

	if #redeemEntries > 0 then
		table.insert(groups, {
			category = model.CATEGORY_REDEEM,
			title = pg.getGameString("HOMELAND_REDEEM"),
			items = redeemEntries
		})
	end

	if #unavailableEntries > 0 then
		table.insert(groups, {
			category = model.CATEGORY_UNAVAILABLE,
			title = pg.getGameString("HOMELAND_FURNITURE_COMPLETE_UNAVAILABLE_CATEGORY"),
			items = unavailableEntries
		})
	end

	return groups
end

function HomelandFurnitureCompleteCtrl:refreshView()
	if not self.view or not self.model then
		return
	end

	self.model:refresh()
	self:refreshTitle()
	self:refreshTopCurrencyInfo()

	if self.view.listGroupUList then
		self.groupList = self:getGroupList()

		self.view.listGroupUList:SetList(self.groupList)
	end

	self:refreshItemInfo()
	self:refreshCostInfo()

	if self.view.btnSelectAllUButton then
		self.view.btnSelectAllUButton.interactable = self.model:hasSelectableFurniture()
		self.view.btnSelectAllUButton.isSelected = self.model:isAllSelected()
	end
end

function HomelandFurnitureCompleteCtrl:refreshTopCurrencyInfo()
	local currencyItemIds = {
		Const.HomeCoinItemId,
		Const.HomeDecCoinItemId
	}
	local seasonMoneyId = HomeSeasonUtils.getSeasonMoneyId(pg.me)

	if seasonMoneyId then
		table.insert(currencyItemIds, seasonMoneyId)
	end

	LuaUIUtils.setTopCurrencyItemList(self.view.listCurrencyUList, nil, currencyItemIds)
end

function HomelandFurnitureCompleteCtrl:refreshTitle()
	if self.view.txtTitleUSDFText then
		local titleKey = self.model.isPlan and "HOMELAND_FURNITURE_COMPLETE_PLAN_TITLE" or "HOMELAND_FURNITURE_COMPLETE_COMBINATION_TITLE"

		ClientTextUtils.setText(self.view.txtTitleUSDFText, pg.getGameString(titleKey))
	end

	if self.view.txtCompleteUSDFText then
		ClientTextUtils.setText(self.view.txtCompleteUSDFText, pg.getGameString("SHOP_BUY"))
	end

	if self.view.txtConsumeUSDFText then
		ClientTextUtils.setText(self.view.txtConsumeUSDFText, pg.getGameString("HOMELAND_FURNITURE_COMPLETE_COST_TITLE"))
	end
end

function HomelandFurnitureCompleteCtrl:refreshCurrencyInfo(currencyCosts)
	self:refreshCurrencyItem(self.view.consume1UButton, self.view.consume1ObjectReference, currencyCosts[1])
	self:refreshCurrencyItem(self.view.consume2UButton, self.view.consume2ObjectReference, currencyCosts[2])
	self:refreshCurrencyItem(self.view.consume3UButton, self.view.consume3ObjectReference, currencyCosts[3])
end

function HomelandFurnitureCompleteCtrl:refreshCurrencyItem(button, objectReference, cost)
	button:SetActive(cost ~= nil)

	if not cost then
		return
	end

	local iconUImage = objectReference:GetRefValue("icon")
	local txtNumUSDFText = objectReference:GetRefValue("txtNum")

	iconUImage.url = LuaUIUtils.getIconByItemId(cost.id, nil, true)

	local costNumText = cost.costNum

	if cost.num < cost.costNum then
		costNumText = pg.getFormatText("<style=Debuff>{0}</style>", cost.costNum)
	end

	ClientTextUtils.setText(txtNumUSDFText, costNumText)
end

function HomelandFurnitureCompleteCtrl:renderGroup(button, data)
	button:SetActive(true)

	local objectReference = button:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	local listUList = objectReference:GetRefValue("listUList")
	local btnAllSelectedUButton = objectReference:GetRefValue("btnAllSelectedUButton")

	if txtTitleUSDFText then
		ClientTextUtils.setText(txtTitleUSDFText, data.title)
	end

	local isSelectableCategory = self.model:isSelectableCategory(data.category)

	if btnAllSelectedUButton then
		btnAllSelectedUButton:SetActive(isSelectableCategory)

		btnAllSelectedUButton.luaClick = nil

		if isSelectableCategory then
			btnAllSelectedUButton.isSelected = self.model:isCategoryAllSelected(data.category)

			function btnAllSelectedUButton.luaClick()
				self.model:setCategorySelected(data.category, not self.model:isCategoryAllSelected(data.category))
				self:refreshView()
			end
		end
	end

	if not listUList then
		return
	end

	function listUList.luaRenderItem(itemButton, _, itemData)
		function itemButton.luaClick()
			self:onItemClick(itemData)
		end

		self:renderItem(itemButton, itemData)
	end

	listUList:SetList(data.items or EMPTY_TABLE)
end

function HomelandFurnitureCompleteCtrl:renderItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local itemData = ItemData[data.itemId] or {}
	local iconUImage = objectReference:GetRefValue("itemIconUImage")
	local txtNameUSDFText = objectReference:GetRefValue("itemUnderName")
	local txtNumUSDFText = objectReference:GetRefValue("txtNumUBaseText")

	if iconUImage then
		iconUImage.url = itemData.icon
	end

	button:TryChangePage("Quality", itemData.quality or 0)

	if txtNameUSDFText then
		ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(itemData.itemName or ""))
	end

	if txtNumUSDFText then
		ClientTextUtils.setText(txtNumUSDFText, LuaUIUtils.formatShortItemNum(data.needCount))
	end

	local isLocked = data.category == self.model.CATEGORY_UNAVAILABLE

	button.isSelected = data.selected == true and not isLocked

	local selectPage = HomelandFurnitureCompleteCtrl.SELECT_PAGE_NORMAL

	if isLocked then
		selectPage = HomelandFurnitureCompleteCtrl.SELECT_PAGE_LOCK
	elseif data.selected == true then
		selectPage = HomelandFurnitureCompleteCtrl.SELECT_PAGE_SELECTED
	end

	button:TryChangePage("Select", selectPage)
end

function HomelandFurnitureCompleteCtrl:onItemClick(data)
	if not data then
		return
	end

	self.detailItemId = data.itemId

	if data.needCount > 0 and self.model:isSelectableCategory(data.category) then
		self.model:setEntrySelected(data.itemId, not data.selected)
	end

	self:refreshView()
end

function HomelandFurnitureCompleteCtrl:refreshItemInfo()
	if not self.view.propInfoUContainer then
		return
	end

	local entry = self.model:getEntry(self.detailItemId) or self.model.entries[1]

	if not entry then
		return
	end

	self.detailItemId = entry.itemId
	self.itemInfoRenderToken = (self.itemInfoRenderToken or 0) + 1

	local renderToken = self.itemInfoRenderToken

	LuaUIUtils.renderItemInfo(self.view.propInfoUContainer, {
		fromParamCount = true,
		itemId = entry.itemId,
		itemCount = entry.ownedCount,
		validate = function()
			return self.view ~= nil and self.detailItemId == entry.itemId and self.itemInfoRenderToken == renderToken
		end
	})
end

function HomelandFurnitureCompleteCtrl:refreshCostInfo()
	local model = self.model
	local isEnough = model:validateSelectedResources()
	local selectedCount = model:getSelectedItemCount()

	if self.view.txtSelectedUSDFText then
		ClientTextUtils.setText(self.view.txtSelectedUSDFText, pg.getFormatText(pg.getGameString("HOMELAND_FURNITURE_COMPLETE_SELECTED_COUNT"), selectedCount))
	end

	local costs = model:getCosts()
	local materialCosts = {}
	local currencyCosts = {}

	for _, cost in ipairs(costs) do
		if cost.resourceType == "material" then
			table.insert(materialCosts, cost)
		elseif cost.resourceType == "money" then
			table.insert(currencyCosts, cost)
		end
	end

	if self.view.listConsumeUList then
		self.view.listConsumeUList:SetList(materialCosts)
		self.view.listConsumeUList:SetActive(#materialCosts > 0)
	end

	self:refreshCurrencyInfo(currencyCosts)

	if self.view.btnCompleteUButton then
		self.view.btnCompleteUButton.interactable = selectedCount > 0 and isEnough and not self.isSubmitting
	end

	if self.view.txtConsumeUSDFText then
		self.view.txtConsumeUSDFText.gameObject:SetActiveEx(selectedCount > 0)
	end
end

function HomelandFurnitureCompleteCtrl:onCompleteButtonClick()
	self:refreshView()

	local model = self.model
	local isEnough, lackInfo = model:validateSelectedResources()

	if not isEnough then
		if lackInfo.resourceType == "material" then
			pg.global.showBubbleMessage(NoticeDef.HOME_REDEEM_LACK)
		else
			pg.global.showBubbleMessage(NoticeDef.SHOP_ITEM_NOT_ENOUGH, pg.getLocalizationText((ItemData[lackInfo.itemId] or {}).itemName or ""))
		end

		return
	end

	local rpcItems = model:getRpcItems()

	if #rpcItems <= 0 then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_HOMELAND_FURNITURE_COMPLETE_CONFIRM, {
		completionModel = model,
		confirmCb = function(confirmedItems)
			self:requestComplete(confirmedItems)
		end
	})
end

function HomelandFurnitureCompleteCtrl:requestComplete(rpcItems)
	if self.isSubmitting then
		return
	end

	for _, item in ipairs(rpcItems) do
		local releaseState = ClientHomelandUtils.getFurnitureReleaseState(item.itemId)

		if not releaseState.isReleased or releaseState.isReleaseTimeOffShelf then
			if releaseState.isReleaseTimeOffShelf then
				pg.global.ui.tips:showTextTip(pg.getGameString("HOMELAND_ITEM_OFF_SHELF"))
			end

			self:refreshView()

			return
		end
	end

	self.isSubmitting = true

	self:refreshCostInfo()

	local hasRemainingFurniture = self.model:hasMissingFurnitureAfter(rpcItems)
	local requestView = self.view

	pg.me:serverMsg("RPC_CS_BuyOrnaments", rpcItems, function(returnCode)
		if self.view ~= requestView then
			return
		end

		self.isSubmitting = false

		if returnCode ~= Const.HOMELAND_ORNAMENT_OP_RETURN_CODE.SUCCESS then
			self:showCompleteReturnNotice(returnCode)
			self:refreshView()

			return
		end

		local obtainedItems = {}

		for _, item in ipairs(rpcItems) do
			table.insert(obtainedItems, {
				skipConditionConvert = true,
				itemId = item.itemId,
				itemCount = item.itemNum
			})
		end

		if self.info and self.info.onComplete then
			self.info.onComplete()
		end

		if hasRemainingFurniture then
			self.model:refresh()
			self:refreshView()
		else
			self:closePanel()
		end

		pg.global.ui.itemObtain:open({
			itemList = obtainedItems
		})
	end)
end

function HomelandFurnitureCompleteCtrl:showCompleteReturnNotice(returnCode)
	local returnCodes = Const.HOMELAND_ORNAMENT_OP_RETURN_CODE
	local noticeByCode = {
		[returnCodes.ERROR_CHECK_FAIL] = NoticeDef.HOME_CHECK_FAILED,
		[returnCodes.ERROR_NOT_HOME] = NoticeDef.HOME_NOT_HOME,
		[returnCodes.ERROR_PARAM] = NoticeDef.HOME_ERROR_PARAM,
		[returnCodes.ERROR_ITEM_NOT_VALID] = NoticeDef.HOME_ERROR_ITEM_NOT_VALID,
		[returnCodes.ERROR_ITEM_NOT_ENOUGH] = NoticeDef.HOME_REDEEM_LACK,
		[returnCodes.ERROR_MONEY_NOT_ENOUGH] = NoticeDef.SHOP_BUY_MONEY_NOT_ENOUGH,
		[returnCodes.ERROR_ORNAMENT_BUY_COUNT_MAX] = NoticeDef.HOME_ERROR_ORNAMENT_BUY_COUNT_MAX,
		[returnCodes.ERROR_ORNAMENT_BUY_BAG_FULL] = NoticeDef.ITEM_BAG_FULL,
		[returnCodes.ERROR_NOT_HOME_CAR] = NoticeDef.HOME_CAR_CAMP_NOT_IN_CAMP,
		[returnCodes.ERROR_NOT_FIND_CAR] = NoticeDef.HOME_CAR_CAMP_SELF_CAR_NOT_FIND,
		[returnCodes.ERROR_HOMECAR_ORNAMENT_COUNT_MAX] = NoticeDef.HOME_CAR_CAMP_ORNAMENT_COUNT_MAX,
		[returnCodes.ERROR_AREA_LOAD_LIMIT] = NoticeDef.HOME_BLUEPRINT_ERROR_AREA_LOAD_LIMIT
	}

	pg.global.showBubbleMessage(noticeByCode[returnCode] or NoticeDef.BUY_FAILED)
end

function HomelandFurnitureCompleteCtrl:onDestroy()
	if pg.global.navMgr then
		pg.global.navMgr:RemoveLuaHotkeyActivationChangedListener(HomelandFurnitureCompleteCtrl.NAVIGATION_LISTENER_NAME)
	end

	pg.global.ui:close(UIConst.UI_ID_HOMELAND_FURNITURE_COMPLETE_CONFIRM)

	self.isSubmitting = false
	self.navigationFocusBeforeVirtualMouse = nil
	self.itemInfoRenderToken = (self.itemInfoRenderToken or 0) + 1

	UICtrl.onDestroy(self)
end

return HomelandFurnitureCompleteCtrl
