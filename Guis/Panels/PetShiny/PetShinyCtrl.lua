-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PetShiny\\PetShinyCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local HotkeyConst = require("Const.HotkeyConst")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local ClientTextUtils = require("Utils.ClientTextUtils")
local Const = require("Common.Const.Const")
local AddressDataConst = require("Const.AddressDataConst")
local ItemUtils = require("Common.Utils.ItemUtils")
local CaptureUtils = require("Common.Utils.CaptureUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local Utils = require("Common.Utils.Utils")
local NoticeDef = require("Common.NoticeDef")
local Time = require("Core.Common.Time")
local ClientUtils = require("Utils.ClientUtils")
local PetManagementUtils = require("Utils.PetManagementUtils")
local ClientConst = require("Const.ClientConst")
local TimeUtils = require("Common.Utils.TimeUtils")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local PetShinySelectComponent = require("Guis.Panels.PetShiny.Component.PetShinySelectComponent")
local PetShinyCtrl = Class.LightClass("PetShinyCtrl", UICtrl)

PetShinyCtrl.REQUEST_TIMEOUT = 30
PetShinyCtrl.OPERATION_CHECK_INTERVAL = 0.1
PetShinyCtrl.GAMEPAD_ROTATE_SPEED = 120
PetShinyCtrl.messages = {
	[MessageName.ITEM_COUNT_MAP_CHANGE] = {
		"onItemCountMapChanged",
		true
	},
	[MessageName.CURRENCY_CHANGE] = {
		"refreshConsumeView",
		true
	},
	[MessageName.MONEY_COUNT_CHANGE] = {
		"refreshConsumeView",
		true
	}
}

function PetShinyCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.selectComponent = PetShinySelectComponent.new(self)
end

function PetShinyCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:onClickBack()
	end

	self:bindCloseButton(self.view.btnBackUButton)

	function self.view.btnBack2UButton.luaClick()
		if self.curMode == 2 then
			self:cancelSelectPet()
		else
			self:switchMode(0)
		end
	end

	function self.view.btnSelectBackUButton.luaClick()
		self:cancelSelectPet()
	end

	function self.view.btnReplaceUButton.luaClick()
		self:openSelectPetPanel()
	end

	function self.view.btnHistoryUButton.luaClick()
		self:openHistoryPanel()
	end

	self.view.btnInfoUButton.enabledTooltip = false

	function self.view.btnInfoUButton.luaClick()
		self:onClickInfoBtn()
	end

	function self.view.consumeItemUList.luaRenderItem(button, index, data)
		LuaUIUtils.renderItemWithCountCheck(button, data, nil, true)
	end

	function self.view.consumeUList.luaRenderItem(button, index, data)
		self:renderCurrencyConsumeItem(button, data)
	end

	function self.view.btnRefreshUButton.luaClick()
		self:onClickRefresh()
	end

	function self.view.btnRefreshUButton.luaTryChangePage(controllerName, pageIndex)
		if controllerName ~= "button" or pageIndex ~= 4 or self.curMode ~= 0 or self.model.tabId ~= self.model.TAB_ID.SWITCH or not self:checkUIShow() then
			return
		end

		local isCurrent = self.model:getShinyStyleState(self.model.petId, self.model.selectedStyleId)

		if isCurrent then
			self.view.btnRefreshUButton:TryChangePage("button", 5, true)
		end
	end

	function self.view.btnConfirmUButton.luaClick()
		self.selectComponent:confirmSelection()
	end

	self.view.showListUList.groupType = CS.XGUI.EGroupType.Radio

	function self.view.showListUList.luaRenderItem(button, index, data)
		self:renderStyleList(button, index, data)
	end

	function self.view.showListUList.luaSelectedChanged(uList, isSelected)
		if isSelected then
			self:onClickStyle(uList.selectedItem)
		end
	end

	function self.view.showListUList.luaClick(button, data)
		local petInfo = self.model.petInfo

		if self.shinyOperation or not petInfo or not Utils.isLabelShiny(petInfo.label) then
			return
		end

		local _, isUnlocked = self.model:getShinyStyleState(self.model.petId, data.styleId)

		if not isUnlocked then
			pg.global.ui.tips:showTextTip(pg.getGameString("PET_SHINY_REROLL_TO_UNLOCK"))
		end
	end

	self.view.cubeListUList.groupType = CS.XGUI.EGroupType.Radio

	function self.view.cubeListUList.luaRenderItem(button, index, data)
		self:renderLegendCubeItem(button, data)
	end

	function self.view.cubeListUList.luaSelectedChanged(uList, isSelected)
		if isSelected then
			self:onClickLegendCube(uList.selectedItem)
		end
	end

	function self.view.btnCubeUButton.luaClick()
		self:clickLegendBallBtn()
	end

	function self.view.cubeUButton.luaClick()
		self:showLegendCubeTip(self.view.cubeUButton, self.model.petInfo and self.model.petInfo.cubeItemId)
	end

	function self.view.cubeStaeUButton.luaClick()
		self:showLegendCubeTip(self.view.cubeStaeUButton, self.model.selectedCubeItemId)
	end

	function self.view.onwCubeUButton.luaClick()
		self:showLegendCubeTip(self.view.onwCubeUButton, self.model.petInfo and self.model.petInfo.cubeItemId)
	end

	self.dragButtonDragUpdateListener = self.view.dragButtonUButton:GetComponent(typeof(CS.FunPlus.WorldX.GUIS.Panels.Utils.DragUpdateListener))

	function self.dragButtonDragUpdateListener.luaDragUpdate(x, y)
		if x == 0 or not self:checkUIShow() or self.shinyOperation or not self.uiScene or not self.uiScene:isCreated() then
			return
		end

		self.uiScene:rotatePreviewEntity(-x * 0.2)
	end

	self.tabList = {
		{
			tabBtn = self.view.tab01UButton,
			tabNameText = self.view.tab01NameUSDFText
		},
		{
			tabBtn = self.view.tab03UButton,
			tabNameText = self.view.tab03NameUSDFText
		}
	}

	self:bindGamepadInput()
	self:initView()
end

function PetShinyCtrl:bindGamepadInput()
	self:bindHotKeyPerform(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadStart, function()
		if self.curMode ~= 0 or not self:checkUIShow() or self:checkUIClosing() or self.shinyOperation then
			return true
		end

		self:onClickInfoBtn()

		return false
	end, self.view.widget.gameObject, "petShinyInfoGamepad")

	local binding = KeyBindingPro.GetOrAddKeyBindingByName(self.view.widget.gameObject, "petShinyRotateGamepad")

	binding.isVirtual = true
	binding.priority = -1
	binding.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadRightStickMove

	function binding.luaTrigger(inputInfo)
		return self:onGamepadRotateInput(inputInfo)
	end
end

function PetShinyCtrl:canGamepadRotate()
	return (self.curMode == 0 or self.curMode == 1) and not self.shinyOperation and pg.game.input:isUsingGamepad() and self.uiScene ~= nil and self.uiScene:isCreated()
end

function PetShinyCtrl:onGamepadRotateInput(inputInfo)
	if inputInfo.phase == "Canceled" or not self:canGamepadRotate() then
		self:stopGamepadRotation()

		return true
	end

	if inputInfo.phase == "Performed" then
		self.gamepadRotateX = inputInfo.valueVec2.x

		if self.gamepadRotateX == 0 then
			self:stopGamepadRotation()
		elseif self.gamepadRotateTimer == nil then
			self.gamepadRotateTimer = self:startTimer(function()
				if not self:canGamepadRotate() then
					self:stopGamepadRotation()

					return
				end

				self.uiScene:rotatePreviewEntity(-self.gamepadRotateX * self.GAMEPAD_ROTATE_SPEED * Time.unscaledDeltaTime)
			end, 0, true)
		end
	end

	return false
end

function PetShinyCtrl:stopGamepadRotation()
	if self.gamepadRotateTimer then
		self:killTimer(self.gamepadRotateTimer)

		self.gamepadRotateTimer = nil
	end

	self.gamepadRotateX = nil
end

function PetShinyCtrl:checkCanOpen(showNotice, info)
	if not UICtrl.checkCanOpen(self, showNotice, info) then
		return false
	end

	if info and info.petId == nil and info.itemId ~= nil and self.model:findDefaultPetByItemId(info.itemId) == nil then
		if showNotice then
			pg.global.ui.tips:showTextTip(pg.getGameString("INVENTORY_PETPROP_NO_AVAILABLE_PET"))
		end

		return false
	end

	return true
end

function PetShinyCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:clearShinyOperation()

	self.curTabIndex = 1
	info = info or {}

	self.model:reset()

	self.model.itemId = info.itemId
	self.selectReturnMode = nil

	self.selectComponent:hide()

	self.curMode = nil

	local curMode = info.mode or info.itemId ~= nil and 2 or 0
	local petId = info.petId

	if petId == nil and info.itemId ~= nil then
		petId = self.model:findDefaultPetByItemId(info.itemId)
	end

	self.model:setPet(petId)
	self:updateStyleUnlockRecord(self.model:getCurStyleData(), false)

	self.model.tabId = self.model:getTabIdByItemId(info.itemId) or self.model:getTabData()[1].tabId

	self:switchMode(curMode)
end

function PetShinyCtrl:initView()
	ClientTextUtils.setText(self.view.tMPUSDFText, pg.getGameString("PET_SHINY_TITLE"))
	ClientTextUtils.setText(self.view.replaceTitleUSDFText, pg.getGameString("PET_SHINY_TITLE2"))
	ClientTextUtils.setText(self.view.reRollTitleUSDFText, pg.getGameString("PET_SHINY_SUB_TITLE"))
	ClientTextUtils.setText(self.view.txtReplaceUSDFText, pg.getGameString("PET_SHINY_TITLE2"))
	ClientTextUtils.setText(self.view.consumeTitleUSDFText, pg.getGameString("CONSUME_LABEL") .. ":")
	ClientTextUtils.setText(self.view.txtCubeUSDFText, pg.getGameString("PET_SHINY_USE_LEGEND_CUBE"))
	ClientTextUtils.setText(self.view.selectTitleUSDFText, pg.getGameString("TITLE_SELECT_PET"))
	ClientTextUtils.setText(self.view.btnCurrentNameUSDFText, pg.getGameString("BTN_CURRENT_SHINY_STYLE"))
	LuaUIUtils.setTopCurrencyItemList(self.view.listCurrencyUList, nil, self.model:getAllStyleCostItemIds())
end

function PetShinyCtrl:onShow()
	self:restorePetPreview()
end

function PetShinyCtrl:refreshConsoleBarState()
	local isShinyMode = self.curMode == 0
	local isLegendMode = self.curMode == 1
	local consoleBar = CS.XGUI.Navigation.ConsoleBar

	consoleBar.SetStateForAll("rotate", isShinyMode or isLegendMode)
	consoleBar.SetStateForAll("openGuide", isShinyMode)
	consoleBar.SetStateForAll("openDetail", isLegendMode)
	consoleBar.SetStateForAll("select", isShinyMode and self.model.tabId == self.model.TAB_ID.SWITCH)
end

function PetShinyCtrl:onHide()
	self:stopGamepadRotation()

	if not self:checkUIOpen() then
		self:clearShinyOperation()
	end

	self:restorePetPreview(true)
end

function PetShinyCtrl:onDestroy()
	self:stopGamepadRotation()

	if self.dragButtonDragUpdateListener then
		self.dragButtonDragUpdateListener.luaDragUpdate = nil
		self.dragButtonDragUpdateListener = nil
	end

	self:clearShinyOperation()
	self:restorePetPreview(true)
	UICtrl.onDestroy(self)
end

function PetShinyCtrl:onClickInfoBtn()
	self:stopGamepadRotation()
	pg.global.ui.tips:openCommonPopUpTipById(48)
end

function PetShinyCtrl:switchMode(curMode)
	curMode = curMode or 0

	local isModeChanged = self.curMode ~= curMode

	if isModeChanged then
		self:stopGamepadRotation()
	end

	self.curMode = curMode

	if curMode ~= 2 then
		self.selectComponent:hide()
	end

	self.view.widget:TryChangePage("Screenswitch", curMode)

	if curMode == 0 then
		self:refreshShinyMode()
	elseif curMode == 1 then
		self:refreshLegendMode()
	else
		self:refreshSelectMode()
	end

	if curMode == 2 then
		self:refreshConsumeView()
	end

	self:restorePetPreview()
	self:refreshConsoleBarState()

	if isModeChanged then
		self.view.widget:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end
end

function PetShinyCtrl:refreshShinyMode()
	self:refreshTabView()
end

function PetShinyCtrl:refreshLegendMode()
	local cubeData = self.model:getLegendCubeList()
	local selectedIndex

	for index, data in ipairs(cubeData) do
		if data.id == self.model.selectedCubeItemId then
			selectedIndex = index

			break
		end
	end

	selectedIndex = selectedIndex or #cubeData > 0 and 1 or nil

	if selectedIndex then
		self.model.selectedCubeItemId = cubeData[selectedIndex].id
	end

	for index, data in ipairs(cubeData) do
		data.selected = index == selectedIndex
	end

	self.view.cubeListUList:SetList(cubeData)
	self.view.cubeListUList:SetActiveFastest(#cubeData > 0)

	if selectedIndex then
		self.view.cubeListUList:SelectItem(selectedIndex - 1)
	end

	self:refreshLegendPanel()
end

function PetShinyCtrl:refreshSelectMode()
	local tabId = self.model.tabId or self.model:getTabData()[1].tabId
	local selectTabId

	if self.selectReturnMode == nil and self.model.itemId ~= nil then
		selectTabId = self.model:getTabIdByItemId(self.model.itemId)
	end

	local petId = self.model.petId or self.model:findDefaultPetByTabId(selectTabId)

	self.selectComponent:enter(tabId, petId, selectTabId)
end

function PetShinyCtrl:refreshTabView()
	local data = self.model:getTabData()

	if data[self.curTabIndex] == nil then
		self.curTabIndex = 1
	end

	local tabNum = #data

	if tabNum > 1 then
		self.view.rightPnlUComponent:TryChangePage("TabState", 0)

		for i, obj in ipairs(self.tabList) do
			self:renderTab(obj, i, data[i])
		end
	elseif tabNum == 1 then
		self.view.rightPnlUComponent:TryChangePage("TabState", 1)
		ClientTextUtils.setText(self.view.oneTabUSDFText, pg.getGameString(data[1].tabName))
	end

	self:onClickTab(data[self.curTabIndex].tabId)
end

function PetShinyCtrl:renderTab(button, index, data)
	button.tabBtn:SetActive(data ~= nil)

	if data == nil then
		button.tabBtn.luaClick = nil

		return
	end

	ClientTextUtils.setText(button.tabNameText, pg.getGameString(data.tabName))

	function button.tabBtn.luaClick()
		self:onClickTab(data.tabId)
	end
end

function PetShinyCtrl:onClickTab(tabId)
	if self.shinyOperation then
		return
	end

	local isTabChanged = self.model.tabId ~= tabId

	if isTabChanged then
		self:stopGamepadRotation()
	end

	self.model.tabId = tabId
	self.curTabIndex = tabId == self.model.TAB_ID.SWITCH and 2 or 1

	for index, tab in ipairs(self.tabList) do
		tab.tabBtn.isSelected = index == self.curTabIndex
	end

	if tabId == self.model.TAB_ID.GRANT then
		self:clickGrantTab()
	elseif tabId == self.model.TAB_ID.REROLL then
		self:clickReRollTab()
	else
		self:clickSwitchTab(isTabChanged)
	end

	self:restorePetPreview()
	self:refreshConsoleBarState()
end

function PetShinyCtrl:onItemCountMapChanged()
	if self.curMode == 1 then
		self:refreshLegendMode()
	else
		self:refreshConsumeView()
	end

	self:refreshCubeBtn()
end

function PetShinyCtrl:refreshConsumeView()
	local consumeData = {}

	if self.curMode == 0 then
		consumeData = self.model:getConsumeData()
	elseif self.curMode == 1 and self.model:checkLegendCube(self.model.petId, self.model.selectedCubeItemId) then
		consumeData = self.model:getLegendConsumeData()
	end

	local hasConsume = #consumeData > 0
	local isCurrencyOnly = hasConsume

	for index, data in ipairs(consumeData) do
		local displayData = LuaUIUtils.getItemDisplayData(data)

		consumeData[index] = displayData

		if not ItemUtils.isCommonMoney(displayData.id) then
			isCurrencyOnly = false
		end
	end

	local consumeType = hasConsume and (isCurrencyOnly and 1 or 0) or 1

	self.view.widget:TryChangePage("consumption", consumeType)

	if isCurrencyOnly then
		self.view.consumeItemUList:SetList({})
		self.view.consumeUList:SetList(consumeData)
	else
		self.view.consumeUList:SetList({})
		self.view.consumeItemUList:SetList(consumeData)
	end

	local showConsume = self.curMode == 0 or hasConsume

	if self.curMode == 0 then
		showConsume = hasConsume and self.model:checkRefreshPet(self.model.petId, self.model.tabId, self.model.selectedStyleId)
	end

	self.view.consumeUWidget:SetActive(showConsume and not isCurrencyOnly)
	self.view.consumeUList:SetActive(showConsume and isCurrencyOnly)

	local showCurrency = self.curMode == 0 and self.model.tabId == self.model.TAB_ID.SWITCH

	self.view.tabBarUWidget:SetActive(showCurrency)
	self.view.listCurrencyUList:SetActive(showCurrency)

	if showCurrency then
		self.view.listCurrencyUList:RefreshList()
	end

	self:refreshActionButton()
end

function PetShinyCtrl:renderCurrencyConsumeItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local icon = objectReference:GetRefValue("icon")
	local txtNum = objectReference:GetRefValue("txtNum")
	local ownNum = ItemUtils.getItemCountById(pg.me, data.id)

	icon.url = LuaUIUtils.getIconByItemId(data.id, nil, true)

	local numText = LuaUIUtils.formatStyledItemNum(nil, data.num, nil, ownNum < data.num, true)

	ClientTextUtils.setText(txtNum, numText)

	function button.luaClick()
		pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
			skipConditionConvert = true,
			id = data.id,
			num = data.num,
			targetRect = button
		})
	end
end

function PetShinyCtrl:refreshActionButton()
	if self.curMode == 2 then
		self.view.btnRefreshUButton:SetActiveFastest(false)

		self.view.btnRefreshUButton.interactable = false
		self.view.btnRefreshUButton.visualInteractable = false

		self.selectComponent:refreshConfirmButton()

		return
	end

	local pending = self.shinyOperation ~= nil
	local petId, tabId = self.model.petId, self.model.tabId
	local canSubmit
	local isCurrentStyle = false

	if self.curMode == 1 then
		local canUse = self.model:checkLegendCube(petId, self.model.selectedCubeItemId)

		self.view.btnRefreshUButton:SetActiveFastest(canUse)

		canSubmit = not pending and canUse
	elseif tabId == self.model.TAB_ID.GRANT or tabId == self.model.TAB_ID.REROLL then
		local canUse = self.model:checkRefreshPet(petId, tabId)

		self.view.btnRefreshUButton:SetActiveFastest(canUse)

		canSubmit = not pending and canUse
	else
		local petInfo = self.model.petInfo
		local isShiny = petInfo and Utils.isLabelShiny(petInfo.label) or false

		self.view.btnRefreshUButton:SetActiveFastest(isShiny)

		canSubmit = not pending and isShiny and petId ~= nil and self.model.REFRESH_RPC[tabId] ~= nil

		if tabId == self.model.TAB_ID.SWITCH then
			canSubmit = canSubmit and self.canSwitchStyle

			local isUnlocked

			isCurrentStyle, isUnlocked = self.model:getShinyStyleState(petId, self.model.selectedStyleId)

			local textKey = "BTN_SWITCH_SHINY_STYLE"

			if isCurrentStyle then
				textKey = "BTN_CURRENT_SHINY_STYLE"
			end

			ClientTextUtils.setText(self.view.btnRefreshNameUText, pg.getGameString(textKey))
		end
	end

	if canSubmit and self.curMode == 0 then
		canSubmit = self.model:getRefreshCostShortage(tabId, self.model.selectedStyleId) == nil
	end

	self.view.btnRefreshUButton.interactable = canSubmit
	self.view.btnRefreshUButton.visualInteractable = canSubmit

	self.view.btnRefreshUButton:TryChangePage("button", isCurrentStyle and 5 or canSubmit and 0 or 4)

	for _, tab in ipairs(self.tabList) do
		tab.tabBtn.interactable = not pending
	end

	for _, list in ipairs({
		self.view.showListUList,
		self.view.cubeListUList
	}) do
		local buttons = list:GetAllButtons()

		for index = 0, buttons.Length - 1 do
			buttons[index].interactable = not pending
		end
	end
end

function PetShinyCtrl:checkRefreshOperation(petId, tabId, shinyStyle, cubeItemId)
	local isOK, desc

	if cubeItemId ~= nil then
		isOK, desc = self.model:checkLegendCubePet(petId, cubeItemId)
	else
		isOK, desc = self.model:checkRefreshPet(petId, tabId, shinyStyle)
	end

	if isOK == false then
		if desc then
			pg.global.ui.tips:showTextTip(pg.getLocalizationText(desc))
		end

		return false
	end

	if LuaUIUtils.checkWarehousePetOperationLocked(petId, PetWarehouseConst.PetWarehouseText.CULTIVATE_FORBIDDEN) or PetManagementUtils.checkHomePetOperationLocked(petId) then
		return false
	end

	local lackItemId, needNum = self.model:getRefreshCostShortage(tabId, shinyStyle, cubeItemId)

	if lackItemId then
		if ClientUtils.isItemLockedForConsume(lackItemId, needNum) then
			pg.global.showBubbleMessage(NoticeDef.ITEM_LOCKED)
		else
			LuaUIUtils.showItemNotEnough(lackItemId, true)
		end

		return false
	end

	return true
end

function PetShinyCtrl:onClickRefresh()
	if self.shinyOperation then
		return
	end

	if self.curMode == 1 then
		self:onClickUseLegendCube()

		return
	elseif self.curMode ~= 0 then
		return
	end

	local petId, tabId = self.model.petId, self.model.tabId
	local petInfo = petId and pg.me.pets[petId]

	if not petInfo or not self.model.REFRESH_RPC[tabId] then
		return
	end

	local isSwitch = tabId == self.model.TAB_ID.SWITCH
	local shinyStyle = isSwitch and self.model.selectedStyleId or nil

	if not self.model:checkRefreshPet(petId, tabId, shinyStyle) then
		return
	end

	local operation = {
		petId = petId,
		tabId = tabId,
		shinyStyle = shinyStyle
	}

	self.shinyOperation = operation

	self:refreshActionButton()

	local isReroll = tabId == self.model.TAB_ID.REROLL
	local isBlackWhiteReroll = isReroll and (petInfo.shinyStyle == Const.PET_SHINY_STYLE.WHITE or petInfo.shinyStyle == Const.PET_SHINY_STYLE.BLACK)
	local rerollDescKey = isBlackWhiteReroll and "PET_SHINY_REROLL_OPT_DESC2" or "PET_SHINY_REROLL_OPT_DESC"
	local consumeData = self.model:getConsumeData(tabId, shinyStyle)
	local switchDescKey = #consumeData == 0 and "PET_SHINY_SWITCH_OPT_DESC2" or "PET_SHINY_SWITCH_OPT_DESC"

	self:showShinyOperationConfirm(operation, {
		titleKey = isSwitch and "PET_SHINY_SWITCH_OPT_TITLE" or isReroll and "PET_SHINY_REROLL_OPT_TITLE" or "PET_SHINY_GRANT_OPT_TITLE",
		descKey = isSwitch and switchDescKey or isReroll and rerollDescKey or "PET_SHINY_GRANT_OPT_DESC",
		consumeData = consumeData,
		prefKey = isSwitch and ClientConst.PrefKey.InventoryPetShinySwitchTipTs or isReroll and ClientConst.PrefKey.InventoryPetShinyRefreshTipTs or ClientConst.PrefKey.InventoryPetShinyChangeTipTs,
		forceConfirm = isBlackWhiteReroll
	}, function()
		self:sendRefreshRequest(operation)
	end)
end

function PetShinyCtrl:getConsumeConfirmText(consumeData)
	local texts = {}

	for _, data in ipairs(consumeData) do
		local displayData = LuaUIUtils.getItemDisplayData(data)
		local name = LuaUIUtils.getNameByItemId(displayData.id, true)

		texts[#texts + 1] = string.format("%s×%s", name, LuaUIUtils.formatShortItemNum(displayData.num))
	end

	return table.concat(texts, "、")
end

function PetShinyCtrl:showShinyOperationConfirm(operation, info, confirmCb)
	local canIgnore = info.prefKey ~= nil and not info.forceConfirm
	local prefsCacheUtils = pg.global.prefsCacheUtils

	if canIgnore then
		local lastIgnoreTime = prefsCacheUtils:getInt(info.prefKey, 0, ClientConst.CACHE_TYPE_FLAG.USER)

		if lastIgnoreTime > 0 and TimeUtils.getAreaDayBegin(lastIgnoreTime) == TimeUtils.getAreaDayBegin(Time.secondCache) then
			confirmCb()

			return
		end
	end

	local descArgs = info.descArgs or {
		self:getConsumeConfirmText(info.consumeData)
	}
	local desc = pg.getFormatText(pg.getGameString(info.descKey), unpack(descArgs))
	local ignoreToday = false

	local function cancelCb()
		self:finishShinyOperation(operation)
	end

	ClientUtils.showConfirmRaw(pg.getGameString(info.titleKey), desc, function()
		if not self:isShinyOperationCurrent(operation) then
			cancelCb()

			return
		end

		if canIgnore and ignoreToday then
			prefsCacheUtils:setInt(info.prefKey, Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
			prefsCacheUtils:save()
		end

		confirmCb()
	end, nil, cancelCb, nil, nil, {
		textLocalized = true,
		hint = canIgnore,
		hintDesc = string.format(pg.getGameString("DISABLE_HINT"), 1),
		hintCb = function(isSelected)
			ignoreToday = isSelected
		end,
		onSupersededCb = cancelCb
	})
end

function PetShinyCtrl:isShinyOperationCurrent(operation)
	return self.shinyOperation == operation and self:checkUIOpen() and self.model.petId == operation.petId
end

function PetShinyCtrl:sendRefreshRequest(operation)
	if operation.requestSent then
		return
	end

	if not self:isShinyOperationCurrent(operation) then
		self:finishShinyOperation(operation)

		return
	end

	if operation.cubeItemId ~= nil then
		local petInfo = pg.me.pets[operation.petId]

		if self.curMode ~= 1 or not petInfo then
			self:finishShinyOperation(operation)

			return
		end

		if (petInfo.cubeItemId or 0) ~= operation.oldCubeItemId then
			self:finishShinyOperation(operation, NoticeDef.ERROR_INVALID_STATUS)

			return
		end
	end

	if not self:checkRefreshOperation(operation.petId, operation.tabId, operation.shinyStyle, operation.cubeItemId) then
		self:finishShinyOperation(operation)

		return
	end

	operation.oldPetInfo = pg.me.pets[operation.petId]:getRawTable()
	operation.requestSent = true
	operation.timer = self:startTimer(function()
		self:finishShinyOperation(operation, NoticeDef.ERROR_CALLBACK_TIMEOUT)
	end, self.REQUEST_TIMEOUT)

	local function callback(result)
		self:onRefreshResult(operation, result)
	end

	local rpcName = self.model.REFRESH_RPC[operation.tabId]
	local requestId

	if operation.cubeItemId ~= nil then
		requestId = pg.me:serverMsg(self.model.LEGEND_RPC, operation.petId, operation.cubeItemId, callback)
	elseif operation.tabId == self.model.TAB_ID.SWITCH then
		requestId = pg.me:serverMsg(rpcName, operation.petId, operation.shinyStyle, callback)
	else
		requestId = pg.me:serverMsg(rpcName, operation.petId, callback)
	end

	if requestId == nil then
		self:finishShinyOperation(operation, NoticeDef.ERROR_SERVICE_CALLBACK)
	end
end

function PetShinyCtrl:onRefreshResult(operation, result)
	if not self:isShinyOperationCurrent(operation) then
		self:finishShinyOperation(operation)

		return
	end

	if not Utils.isTable(result) then
		self:finishShinyOperation(operation, NoticeDef.ERROR_SERVICE_CALLBACK)

		return
	end

	if result.noticeId ~= NoticeDef.SUCCESS then
		self:finishShinyOperation(operation, result.noticeId or NoticeDef.ERROR_SERVICE_CALLBACK)

		return
	end

	if operation.cubeItemId ~= nil and (result.petID ~= operation.petId or result.cubeItemId ~= operation.cubeItemId) then
		self:finishShinyOperation(operation, NoticeDef.ERROR_SERVICE_CALLBACK)

		return
	end

	self:killTimer(operation.timer)

	operation.result = result

	local newPetInfo = pg.me.pets[operation.petId]

	if not newPetInfo then
		self:finishShinyOperation(operation, NoticeDef.ERROR_INVALID_STATUS)

		return
	end

	function operation.closeCallback()
		self:finishShinyOperation(operation)
	end

	operation.timer = self:startTimer(function()
		if not self:isShinyOperationCurrent(operation) or pg.game.evolution.presentationCloseCallback ~= operation.closeCallback then
			self:finishShinyOperation(operation)
		end
	end, self.OPERATION_CHECK_INTERVAL, true)

	if self.uiScene and self.uiScene:isCreated() then
		self.uiScene:setPetRootActive(false)
	end

	pg.game.evolution:startPresentation(operation.oldPetInfo, newPetInfo:getRawTable(), operation.closeCallback)
end

function PetShinyCtrl:clearShinyOperation()
	local operation = self.shinyOperation

	self.shinyOperation = nil

	if not operation then
		return
	end

	self:killTimer(operation.timer)

	if operation.closeCallback and pg.game.evolution.presentationCloseCallback == operation.closeCallback then
		pg.game.evolution:finishEvolution()
	end
end

function PetShinyCtrl:finishShinyOperation(operation, noticeId)
	if self.shinyOperation ~= operation then
		return
	end

	local isCurrent = self:isShinyOperationCurrent(operation)

	self:clearShinyOperation()

	if not self:checkUIOpen() then
		return
	end

	if operation.closeCallback and self:checkUIVisible() and not self:checkUIClosing() and self.uiScene and self.uiScene:isCreated() then
		local sceneSystem = pg.game.uiScene
		local topScene = sceneSystem.uiSceneStack[#sceneSystem.uiSceneStack]

		if not self.uiScene.enable or not topScene or topScene.name ~= self._uiSceneName or topScene.ownerKey ~= self.module then
			sceneSystem:switchToScene(self._uiSceneName, self._uiSceneIgnoreDisableMainCamera, self._uiSceneOpenAdditive, self._uiSceneIgnoreResetUICamera, self.module)
		end
	end

	if isCurrent then
		local selectedStyleId = self.model.selectedStyleId

		self.model:setPet(operation.petId)

		if operation.cubeItemId ~= nil then
			if self.model.petInfo then
				self.model.selectedStyleId = selectedStyleId
			end
		else
			local isSwitch = operation.tabId == self.model.TAB_ID.SWITCH

			self.curTabIndex = isSwitch and 2 or 1

			if isSwitch and self.model.petInfo and (not operation.result or noticeId) then
				self.model.selectedStyleId = operation.shinyStyle
			end
		end
	end

	if self.curMode == 0 then
		self:refreshTabView()
	elseif self.curMode == 1 then
		self:refreshLegendMode()
	else
		self:refreshConsumeView()
	end

	self:restorePetPreview()

	if not isCurrent then
		return
	end

	if noticeId then
		pg.global.showBubbleMessage(noticeId)
	elseif operation.result and operation.result.duplicate then
		self:showShinyReturnReward(operation.result.reward)
	end
end

function PetShinyCtrl:refreshSelectedPetIcon()
	local petInfo = self.model.petInfo

	if not petInfo then
		LuaUIUtils.clearPetHeadIcon(self.view.btnSelectIconUImage)

		return
	end

	local petData = petInfo:getConfigData()

	self.view.btnSelectIconUImage.url = LuaUIUtils.getPetIcon(petData.iconName, LuaUIUtils.PET_ICON, petInfo.label, petInfo.gender)
end

function PetShinyCtrl:restorePetPreview(useActualAppearance)
	self:refreshSelectedPetIcon()

	local petId = self.model.petId
	local previewStyle, previewEffectReplace
	local previewUnknown = false
	local previewTextKey

	if self.curMode == 2 then
		petId = self.selectComponent.browsePetId
	elseif not useActualAppearance and self.model.petInfo then
		if self.curMode == 1 and self.model:getSelectedLegendCubeData() then
			local cubeConfig = CaptureUtils.getBallCfg(self.model.selectedCubeItemId)

			previewEffectReplace = cubeConfig.shinyEffectReplace or ""

			if self.model.selectedCubeItemId ~= self.model.petInfo.cubeItemId then
				previewTextKey = "PET_SHINY_LEGEND_PREVIEW"
			end
		elseif self.curMode == 0 and self.model.tabId == self.model.TAB_ID.SWITCH then
			previewStyle = self.model.selectedStyleId

			if previewStyle ~= nil then
				local isCurrent, isUnlocked = self.model:getShinyStyleState(petId, previewStyle)

				previewUnknown = not isUnlocked

				if not isCurrent then
					previewTextKey = "PET_SHINY_PREVIEW"
				end
			end
		end
	end

	if previewTextKey then
		ClientTextUtils.setText(self.view.previewUSDFText, pg.getGameString(previewTextKey))
	end

	self.view.previewUSDFText:SetActiveFastest(previewTextKey ~= nil)
	self.view.widget:TryChangePage("Preview", previewTextKey and 1 or 0)

	if self.shinyOperation and self.shinyOperation.closeCallback then
		return
	end

	if self.uiScene and self.uiScene:isCreated() then
		self.uiScene:switchCamera(self.curMode == 2)
		self.uiScene:setPetRootActive(true)
		self.uiScene:setSceneDisplayPet(petId, previewStyle, previewEffectReplace, previewUnknown)
	end
end

function PetShinyCtrl:showShinyReturnReward(reward)
	local itemIds = {}

	for itemId, count in pairs(reward) do
		if count > 0 then
			itemIds[#itemIds + 1] = itemId
		end
	end

	table.sort(itemIds)

	if #itemIds == 0 then
		return
	end

	local texts = {}

	for _, itemId in ipairs(itemIds) do
		texts[#texts + 1] = LuaUIUtils.getItemShowText(itemId, true) .. "X" .. ClientTextUtils.getFormatNumber(reward[itemId])
	end

	pg.global.ui.tips:showTextTip(pg.getFormatText(pg.getGameString("REROLL_RETURN_REWARD"), table.concat(texts, " ")))
end

function PetShinyCtrl:refreshCubeBtn()
	local show = self.model:hasLegendCube()

	self.view.btnCubeUButton:SetActiveFastest(show)
	self.view.lineUWidget:SetActiveFastest(show)
end

function PetShinyCtrl:clickGrantTab()
	self.view.rightPnlUComponent:TryChangePage("RightState", 0)
	self.view.widget:TryChangePage("BtnPnlState", 0)
	ClientTextUtils.setText(self.view.btnRefreshNameUText, pg.getGameString("PET_SHINY_TAB1"))
	ClientTextUtils.setText(self.view.txtNullUSDFText, pg.getLocalizationText(self.model:getTabUnusableDesc(self.model.TAB_ID.GRANT)))
	self.view.btnHistoryUButton:SetActiveFastest(false)
	self:refreshGrantShinyPanel()
end

function PetShinyCtrl:refreshGrantShinyPanel()
	ClientTextUtils.setText(self.view.txtStateUSDFText, pg.getGameString("PET_LABEL_NORMAL"))
	ClientTextUtils.setText(self.view.txtStateNewUSDFText, pg.getGameString("INVENTORY_PETPROP_RANDOM_SHINY"))

	self.view.iconUImage.url = AddressDataConst.UI_PET_SHINY_STATE_ICON.NORMAL
	self.view.randomIconUImage.url = AddressDataConst.UI_PET_SHINY_STATE_ICON.RANDOM

	self:refreshConsumeView()
end

function PetShinyCtrl:clickReRollTab()
	self.view.widget:TryChangePage("BtnPnlState", 2)
	self.view.btnHistoryUButton:SetActiveFastest(true)

	local canReroll = self.model:checkRefreshPet(self.model.petId, self.model.TAB_ID.REROLL)

	self.view.rightPnlUComponent:TryChangePage("RightState", canReroll and 0 or 1)
	ClientTextUtils.setText(self.view.btnRefreshNameUText, pg.getGameString("PET_SHINY_TAB2"))
	ClientTextUtils.setText(self.view.txtStateNewUSDFText, pg.getGameString("INVENTORY_PETPROP_RANDOM_SHINY"))
	ClientTextUtils.setText(self.view.txtNullUSDFText, pg.getLocalizationText(self.model:getTabUnusableDesc(self.model.TAB_ID.REROLL)))

	self.view.randomIconUImage.url = AddressDataConst.UI_PET_SHINY_STATE_ICON.RANDOM

	self:refreshReRollShinyPanel()
	self:refreshCubeBtn()
end

function PetShinyCtrl:refreshReRollShinyPanel()
	local icons = AddressDataConst.UI_PET_SHINY_STATE_ICON
	local shinyStyle = self.model.petInfo.shinyStyle
	local icon = icons.SHINY

	if shinyStyle == Const.PET_SHINY_STYLE.WHITE then
		icon = icons.WHITE
	elseif shinyStyle == Const.PET_SHINY_STYLE.BLACK then
		icon = icons.BLACK
	end

	self.view.iconUImage.url = icon

	ClientTextUtils.setText(self.view.txtStateUSDFText, pg.getLocalizationText(self.model:getShinyStyleName(shinyStyle)))
	self:refreshConsumeView()
end

function PetShinyCtrl:clickSwitchTab(playUnlock)
	self.view.widget:TryChangePage("BtnPnlState", 2)

	local petInfo = self.model.petInfo

	self.view.btnHistoryUButton:SetActiveFastest(petInfo and Utils.isLabelShiny(petInfo.label) or false)
	self.view.rightPnlUComponent:TryChangePage("RightState", 2)
	self:refreshCubeBtn()
	self:refreshSwitchShinyPanel(playUnlock)
end

function PetShinyCtrl:updateStyleUnlockRecord(styleData, comparePrevious)
	local previous = self.unlockedStyleRecord
	local unlockedStyles = {}

	for _, data in ipairs(styleData) do
		data.playUnlock = comparePrevious and data.isUnlocked and not previous[data.styleId]

		if data.isUnlocked then
			unlockedStyles[data.styleId] = true
		end
	end

	self.unlockedStyleRecord = unlockedStyles
end

function PetShinyCtrl:refreshSwitchShinyPanel(playUnlock)
	self.canSwitchStyle = false

	local styleData = self.model:getCurStyleData()

	if playUnlock or self.model.selectedStyleId == nil then
		local firstStyle = styleData[1]

		self.model.selectedStyleId = firstStyle and firstStyle.styleId

		for _, data in ipairs(styleData) do
			if data.isCurrent then
				self.model.selectedStyleId = data.styleId

				break
			end
		end
	end

	if playUnlock then
		self:updateStyleUnlockRecord(styleData, true)
	end

	local selectedData, selectedIndex

	for index, data in ipairs(styleData) do
		data.selected = data.styleId == self.model.selectedStyleId

		if data.selected then
			selectedData, selectedIndex = data, index - 1
		end
	end

	local styleList = self.view.showListUList

	styleList:SetList(styleData)

	if selectedData then
		self:onClickStyle(selectedData)
		styleList:GoToIndex(selectedIndex, true)
	else
		self:refreshConsumeView()
	end
end

function PetShinyCtrl:renderStyleList(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local iconUImage = objectReference:GetRefValue("iconUImage")

	ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.name))

	iconUImage.url = data.icon

	function button.luaSelectChanged(isSelected)
		button:TryChangePage("button", isSelected and 2 or 0)
	end

	local lockState = data.isCurrent and 1 or data.isUnlocked and 2 or 0

	if data.playUnlock then
		data.playUnlock = false

		button:TryChangePage("button", 4, true, false, false)
		button:TryChangePage("LockStateitem", 0, true, false, false)
		button:TryChangePage("button", 0)
		button:TryChangePage("LockStateitem", lockState)
		pg.game.audio:triggerEvent("SFX_UI_Shiny_Function_ShinyStytle_Unlock")
	else
		button:TryChangePage("LockStateitem", lockState, true, false, false)
	end

	button:TryChangePage("button", button.isSelected and 2 or 0, true, false, false)
end

function PetShinyCtrl:onClickStyle(data)
	if self.shinyOperation or not data or self.curMode ~= 0 or self.model.tabId ~= self.model.TAB_ID.SWITCH then
		return
	end

	self.model.selectedStyleId = data.styleId
	self.canSwitchStyle = self.model:checkRefreshPet(self.model.petId, self.model.tabId, data.styleId)

	self:refreshConsumeView()
	self:restorePetPreview()
end

function PetShinyCtrl:openSelectPetPanel()
	if self.shinyOperation or self.curMode ~= 0 then
		return
	end

	self.selectReturnMode = self.curMode

	self:switchMode(2)
end

function PetShinyCtrl:closePanel()
	self:onClickBack()
end

function PetShinyCtrl:onClickBack()
	if self.curMode == 2 then
		self:cancelSelectPet()
	elseif self.curMode == 1 then
		self:switchMode(0)
	else
		self:dismiss()
	end
end

function PetShinyCtrl:cancelSelectPet()
	if self.selectReturnMode == nil then
		self:dismiss()

		return
	end

	self:switchMode(self.selectReturnMode)

	self.selectReturnMode = nil

	self:restorePetPreview()
end

function PetShinyCtrl:confirmSelectPet(petId, tabId)
	local previousPetId = self.model.petId

	if not self.model:setPet(petId) then
		return
	end

	if previousPetId ~= self.model.petId then
		self:updateStyleUnlockRecord(self.model:getCurStyleData(), false)
	end

	self.curTabIndex = 1
	self.selectReturnMode = nil

	self:switchMode(0)
	self:restorePetPreview()
end

function PetShinyCtrl:clickLegendBallBtn()
	if self.shinyOperation then
		return
	end

	ClientTextUtils.setText(self.view.btnRefreshNameUText, pg.getGameString("USE"))
	self:switchMode(1)
end

function PetShinyCtrl:onClickUseLegendCube()
	local petId, cubeItemId = self.model.petId, self.model.selectedCubeItemId

	if not self.model:checkLegendCube(petId, cubeItemId) then
		return
	end

	local petInfo = pg.me.pets[petId]
	local oldCubeItemId = petInfo.cubeItemId or 0
	local hasLegendCube = self.model:isLegendCube(oldCubeItemId)
	local targetName = LuaUIUtils.getNameByItemId(cubeItemId, true)
	local descArgs = {
		targetName
	}

	if hasLegendCube then
		descArgs = {
			LuaUIUtils.getNameByItemId(oldCubeItemId, true),
			targetName
		}
	end

	local operation = {
		petId = petId,
		cubeItemId = cubeItemId,
		oldCubeItemId = oldCubeItemId
	}

	self.shinyOperation = operation

	self:refreshActionButton()
	self:showShinyOperationConfirm(operation, {
		titleKey = "PET_SHINY_LEGEND_OPT_TITLE",
		descKey = hasLegendCube and "PET_SHINY_LEGEND_OPT_DESC" or "PET_SHINY_LEGEND_OPT_DESC2",
		descArgs = descArgs
	}, function()
		self:sendRefreshRequest(operation)
	end)
end

function PetShinyCtrl:renderLegendCubeItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("iconUImage")

	iconUImage.url = LuaUIUtils.getIconByItemId(data.id, nil, true)

	button:TryChangePage("ItemState", data.id == self.model.selectedCubeItemId and 0 or 1)

	local currentCubeItemId = self.model.petInfo and self.model.petInfo.cubeItemId

	button:TryChangePage("IconState", data.id == currentCubeItemId and 1 or 0)
end

function PetShinyCtrl:onClickLegendCube(data)
	if self.shinyOperation or data.id == self.model.selectedCubeItemId then
		return
	end

	self.model.selectedCubeItemId = data.id

	self.view.cubeListUList:RefreshList()
	self:refreshLegendPanel()
end

function PetShinyCtrl:showLegendCubeTip(button, itemId)
	if itemId == nil or itemId == 0 then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
		skipConditionConvert = true,
		id = itemId,
		targetRect = button
	})
end

function PetShinyCtrl:refreshLegendPanel()
	local cubeData = self.model:getSelectedLegendCubeData()

	if cubeData then
		ClientTextUtils.setText(self.view.ballTitleUSDFText, pg.getLocalizationText(cubeData.title))
		ClientTextUtils.setText(self.view.ballDescUSDFText, pg.getLocalizationText(cubeData.Desc))
	else
		ClientTextUtils.setText(self.view.ballTitleUSDFText, "")
		ClientTextUtils.setText(self.view.ballDescUSDFText, "")
	end

	local currentCubeItemId = self.model.petInfo and self.model.petInfo.cubeItemId or 0
	local selectedCubeItemId = self.model.selectedCubeItemId
	local isCurrent = selectedCubeItemId ~= nil and selectedCubeItemId == currentCubeItemId
	local replaceState = isCurrent and 2 or currentCubeItemId == 0 and 1 or 0

	self.view.replaceStateUComponent:TryChangePage("ReplaceCube", replaceState)

	local currentIcon = currentCubeItemId ~= 0 and LuaUIUtils.getIconByItemId(currentCubeItemId, nil, true) or ""

	self.view.cubeiconUImage.url = currentIcon
	self.view.onwCubeUImage.url = currentIcon
	self.view.cubeRightUImage.url = selectedCubeItemId and LuaUIUtils.getIconByItemId(selectedCubeItemId, nil, true) or ""

	local _, unusableDesc = self.model:checkLegendCube(self.model.petId, selectedCubeItemId)
	local replaceText = pg.getGameString(isCurrent and "PET_SHINY_TITLE3" or "PET_SHINY_TITLE2")

	if not isCurrent and unusableDesc then
		replaceText = pg.getLocalizationText(unusableDesc)
	end

	ClientTextUtils.setText(self.view.txtReplaceUSDFText, replaceText)
	self:refreshConsumeView()
	self:restorePetPreview()
end

function PetShinyCtrl:openHistoryPanel()
	local petId = self.model.petId

	if petId == nil then
		return
	end

	pg.global.ui:open(UIConst.UI_ID_PET_SHINY_HISTORY, {
		petId = petId
	})
end

return PetShinyCtrl
