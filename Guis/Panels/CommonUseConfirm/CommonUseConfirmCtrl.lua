-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonUseConfirm\\CommonUseConfirmCtrl.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("CommonUseConfirmCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local CommonUseConfirmCtrl = Class.LightClass("CommonUseConfirmCtrl", UICtrl)
local UIConst = require("Const.UIConst")
local NoticeDef = require("Common.NoticeDef")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Const = require("Common.Const.Const")
local ItemUtils = require("Common.Utils.ItemUtils")
local TimerManager = require("Core.Timer.TimerManager")

CommonUseConfirmCtrl.ShowType = {
	CashShop = 5,
	OnlyText = 4,
	OpenChest = 3,
	RogueExchangeReward = 2,
	CommonUse = 1
}
CommonUseConfirmCtrl.messages = {
	[MessageName.ITEM_CONDITION_CONVERT_CHANGED] = {
		"onItemConditionConvertChanged",
		true
	},
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"onInputDeviceChanged",
		true
	},
	[MessageName.EXCHANGE_REWARD_RESULT] = {
		"onExchangeRewardResult",
		true
	},
	[MessageName.CURRENCY_CHANGE] = {
		"refreshCurrency",
		true
	},
	[MessageName.MONEY_COUNT_CHANGE] = {
		"refreshCurrency",
		true
	},
	[MessageName.ITEM_COUNT_MAP_CHANGE] = {
		"refreshCurrency",
		true
	}
}

function CommonUseConfirmCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.isResetBlur = info and info.extra and info.extra.resetBlur
end

function CommonUseConfirmCtrl:onOpen()
	if self.isResetBlur then
		local blurTs = self.view.transform:Find("Blur")

		if NotNil(blurTs) then
			blurTs.gameObject:SetActiveEx(false)
			TimerManager.addNextFrameCb(function()
				blurTs.gameObject:SetActiveEx(true)
			end)
		end
	end

	CommonUseConfirmCtrl.super.onOpen(self)
end

function CommonUseConfirmCtrl:addListener()
	local closeBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.widget.gameObject, "closeBind")

	closeBind.isVirtual = true
	closeBind.priority = -1
	closeBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.Cancel

	function closeBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			self:onCancel()
		end
	end

	function self.view.btnCancel.luaClick()
		self:onCancel()
	end

	function self.view.btnConfirm.luaClick()
		self:onConfirm()
	end

	function self.view.listCurrencyUList.luaRenderItem(item, index, data)
		self:rendererCurrencyItem(item, data)
	end

	if pg.global.navMgr then
		pg.global.navMgr:AddLuaFocusCursorMovedListener("CommonUseConfirm", function()
			if self.view then
				self:refreshConsoleBarState()
			end
		end)
	end
end

function CommonUseConfirmCtrl:checkCanOpen(_, data)
	if data == nil then
		return false
	end

	self.iData = data

	return true
end

function CommonUseConfirmCtrl:rendererCurrencyItem(item, data)
	local itemId = data.itemId
	local needAdd = data.needAdd
	local maxValue = data.maxValue
	local jumpOptions = {
		skipConditionConvert = data.skipConditionConvert,
		closeOnJumpToSource = function()
			self:close()
		end
	}

	if data.hideAddButton == true then
		jumpOptions.hideAddButton = true
	end

	LuaUIUtils.setTopCurrencyItem(item, itemId, needAdd, maxValue, nil, jumpOptions)
end

function CommonUseConfirmCtrl:setCurrencyData(itemId, needAdd, maxValue, hideAddButton, skipConditionConvert)
	local currencyData = {
		itemId = itemId,
		needAdd = needAdd,
		maxValue = maxValue,
		hideAddButton = hideAddButton,
		skipConditionConvert = skipConditionConvert
	}

	self.view.listCurrencyUList:SetList({
		currencyData
	})
end

function CommonUseConfirmCtrl:setCurrencyDataList(currencyList)
	if not currencyList or #currencyList == 0 then
		return
	end

	self.view.listCurrencyUList:SetList(currencyList)
end

function CommonUseConfirmCtrl:refreshHintCheckBox(showHint, hintText)
	self.isSelected = false

	local listCheckBox = self.view.listCheckBox

	if not listCheckBox then
		return
	end

	if not showHint then
		listCheckBox:SetActiveFastestAndMarkIgnoreLayout(false)

		return
	end

	listCheckBox:SetActiveFastestAndMarkIgnoreLayout(true)
	listCheckBox:SetActiveFastest(true, true)
	listCheckBox:SetList({
		{}
	})

	local buttons = listCheckBox:GetAllButtons()

	if not buttons or buttons.Length <= 0 then
		return
	end

	local checkButton = buttons[0]

	checkButton.buttonType = CS.XGUI.EButtonType.Check

	checkButton:TryChangePage("Stage", 0)
	checkButton:SetSelected(false)

	function checkButton.luaSelectChanged(isSelected)
		self.isSelected = isSelected

		checkButton:TryChangePage("Stage", isSelected and 1 or 0)
	end

	local hintKeyBind = KeyBindingPro.GetOrAddKeyBindingByName(checkButton.gameObject, "nextTimeKeyBind")

	hintKeyBind.isVirtual = true
	hintKeyBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonWest
	hintKeyBind.priority = 30000

	function hintKeyBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			checkButton.isSelected = not checkButton.isSelected
		end
	end

	local itemReference = checkButton:GetComponent("ObjectReference")
	local itemText = itemReference:GetRefValue("txtNameUSDFText")

	if itemText then
		ClientTextUtils.setText(itemText, hintText or pg.getGameString("HOME_ORDER_PAY_HINT_TEXT"))
	end
end

function CommonUseConfirmCtrl:refreshCostCurrency()
	if self.iData.hideCurrency then
		return
	end

	local extra = self.iData.extra
	local costItemIds = extra and extra.costItemIds

	if costItemIds and #costItemIds > 0 then
		local currencyList = {}

		for index = 1, #costItemIds do
			currencyList[index] = {
				itemId = costItemIds[index]
			}
		end

		self:setCurrencyDataList(currencyList)

		return
	end

	local mainCostId = self.iData.costId
	local hideAddButton = self.iData.hideCurrencyAddButton == true
	local skipConditionConvert

	if not mainCostId and self.dataList and #self.dataList > 0 then
		local firstItem = self.dataList[1]

		skipConditionConvert = firstItem.skipConditionConvert
		mainCostId = skipConditionConvert and firstItem.id or firstItem.sourceItemId or firstItem.id
	end

	if not mainCostId then
		return
	end

	if self.iData.exchangeCostId then
		self:setCurrencyDataList({
			{
				itemId = mainCostId,
				hideAddButton = hideAddButton,
				skipConditionConvert = skipConditionConvert
			},
			{
				itemId = self.iData.exchangeCostId,
				hideAddButton = hideAddButton
			}
		})
	else
		self:setCurrencyData(mainCostId, nil, nil, hideAddButton, skipConditionConvert)
	end
end

function CommonUseConfirmCtrl:onShow()
	ClientTextUtils.setText(self.view.iTitle, pg.getLocalizationText(self.iData.title))
	ClientTextUtils.setText(self.view.btnTipsUSDFText, pg.getGameString("CONSOLE_BAR_ITEM_DETAILS"))

	local flag = 0

	if not string.isNilOrEmpty(self.iData.tipTop) then
		ClientTextUtils.setText(self.view.iTipTop, pg.getLocalizationText(self.iData.tipTop))

		flag = 1
	end

	if not string.isNilOrEmpty(self.iData.tipBot) then
		ClientTextUtils.setText(self.view.iTipBot, pg.getLocalizationText(self.iData.tipBot))

		flag = flag + 2
	end

	self.view.component:TryChangePage("tipInfo", flag)

	if self.iData.type == self.ShowType.RogueExchangeReward then
		LuaUIUtils.setRewardListByDropId(self.view.iPropList, self.iData.dropId)
		self:setCurrencyData(Const.CommonEnergyType_Stamina, true, LuaUIUtils.getVitalityMaxStoreNum())
		self:refreshExchangeRewardInfo(true)
	elseif self.iData.type == self.ShowType.OpenChest then
		LuaUIUtils.setRewardListByDropId(self.view.iPropList, self.iData.dropId)
		self:setCurrencyData(Const.CommonEnergyType_Stamina, true, LuaUIUtils.getVitalityMaxStoreNum())
	elseif self.iData.type == self.ShowType.CashShop then
		self.dataList = self.model:parsePropData(self.iData.data)

		function self.view.iPropList.luaRenderItem(item, _, data)
			self:instantiateItem(item, data)
		end

		self.view.iPropList:SetList(self.dataList)
		self.view.btnTipsUSDFText:SetActive(#self.dataList > 0)

		if self.iData.costId then
			self:setCurrencyData(self.iData.costId)
		end
	else
		self.dataList = self.model:parsePropData(self.iData.data)

		if self.iData.type == self.ShowType.OnlyText then
			self.view.iPropList:SetActive(false)

			self.view.layoutBoxUWidget.visibility = CS.XGUI.EVisibility.Hidden
		else
			function self.view.iPropList.luaRenderItem(item, _, data)
				self:instantiateItem(item, data)
			end

			self.view.iPropList:SetList(self.dataList)
			self.view.btnTipsUSDFText:SetActive(#self.dataList > 0)
		end

		if not self.iData.hideCurrency then
			self:refreshCostCurrency()
		end
	end

	self:refreshHintCheckBox(self.iData.showHint, self.iData.hintText)

	local hasItems = self.iData.type ~= self.ShowType.OnlyText and self.view.iPropList.itemCount > 0

	self.view.component:TryChangePage("NoKey", hasItems and 0 or 1)
end

function CommonUseConfirmCtrl:refreshConsoleBarState()
	local currentFocusedGroupName = pg.global.navMgr.CurrentFocusedGroupName
	local isItemMode = currentFocusedGroupName == "ListItem"
	local isGamePad = pg.game.input:isUsingGamepad()

	self.view.consoleBarUWidget:SetActive(isItemMode and isGamePad)
end

function CommonUseConfirmCtrl:_refreshPropData()
	self.dataList = self.model:parsePropData(self.iData.data)

	if self.iData.type ~= self.ShowType.OnlyText then
		self.view.iPropList:SetList(self.dataList)
		self.view.btnTipsUSDFText:SetActive(#self.dataList > 0)
	end
end

function CommonUseConfirmCtrl:onItemConditionConvertChanged()
	if self.iData.type == self.ShowType.RogueExchangeReward or self.iData.type == self.ShowType.OpenChest then
		LuaUIUtils.setRewardListByDropId(self.view.iPropList, self.iData.dropId)
	end

	self:refreshCurrency()
end

function CommonUseConfirmCtrl:refreshCurrency()
	if self.iData.type ~= self.ShowType.RogueExchangeReward and self.iData.type ~= self.ShowType.OpenChest then
		self:_refreshPropData()
	end

	if self.iData.type == self.ShowType.RogueExchangeReward then
		self:setCurrencyData(Const.CommonEnergyType_Stamina, true, LuaUIUtils.getVitalityMaxStoreNum())
	elseif self.iData.type == self.ShowType.OpenChest then
		self:setCurrencyData(Const.CommonEnergyType_Stamina, true, LuaUIUtils.getVitalityMaxStoreNum())
	elseif self.iData.type == self.ShowType.CashShop then
		if self.iData.costId then
			self:setCurrencyData(self.iData.costId)
		end
	elseif not self.iData.hideCurrency then
		self:refreshCostCurrency()
	end

	local hasItems = self.iData.type ~= self.ShowType.OnlyText and self.view.iPropList.itemCount > 0

	self.view.component:TryChangePage("NoKey", hasItems and 0 or 1)
end

function CommonUseConfirmCtrl:instantiateItem(item, data)
	local objectReference = item:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("itemIconUImage")
	local txtNameUText = objectReference:GetRefValue("txtNumUBaseText")

	function item.luaClick()
		pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
			skipConditionConvert = true,
			id = data.id,
			num = data.num,
			targetRect = item,
			hideSource = self.iData.hideSource == true,
			closeOnJumpToSource = function()
				self:close()
			end
		})
	end

	item:TryChangePage("Quality", data.quality)

	iconUImage.url = data.icon

	txtNameUText:SetActive(not data.hideNum)

	if data.hideNum then
		ClientTextUtils.setText(txtNameUText, "")
	elseif not data.hideOwnNum then
		LuaUIUtils.renderConsumeText(txtNameUText, data.ownNum, data.num, UIConst.ITEM_STATE.FULL)

		local isEnough = data.ownNum >= data.num

		item:TryChangePage("isEnough", isEnough and 0 or 1)
	elseif data.showLack then
		local isEnough = data.ownNum >= data.num

		if isEnough then
			ClientTextUtils.setText(txtNameUText, data.num)
		else
			ClientTextUtils.setText(txtNameUText, LuaUIUtils.formatStyledItemNum(nil, data.num, nil, true))
		end

		item:TryChangePage("isEnough", isEnough and 0 or 1)
	else
		ClientTextUtils.setText(txtNameUText, data.num)
	end
end

function CommonUseConfirmCtrl:onCancel()
	self:close()

	if self.iData.cancelCb == nil then
		if LoggerManager.checkLogger(LoggerConst.DEBUG) then
			logger:debug("[CommonUseConfirmCtrl] cancelCb is nil.")
		end

		return
	end

	pcall(self.iData.cancelCb)
end

function CommonUseConfirmCtrl:onConfirm()
	if self.iData.type == self.ShowType.RogueExchangeReward or self.iData.type == self.ShowType.OpenChest then
		if self.iData.confirmCb then
			pcall(self.iData.confirmCb)
		end
	else
		self:commonUseConfirm()
	end

	if self.iData.hintCb then
		self.iData.hintCb(self.isSelected)
	end
end

function CommonUseConfirmCtrl:commonUseConfirm()
	self.dataList = self.model:parsePropData(self.iData.data)

	local enough = true
	local lackItem
	local consumeGroups = {}

	for _, v in ipairs(self.dataList) do
		local resolvedId = v.id
		local group = consumeGroups[resolvedId]

		if group then
			group.needNum = group.needNum + v.num
		else
			consumeGroups[resolvedId] = {
				needNum = v.num,
				ownNum = v.ownNum
			}
		end
	end

	for _, v in ipairs(self.dataList) do
		local group = consumeGroups[v.id]

		if group.ownNum < group.needNum then
			enough = false
			lackItem = v

			break
		end
	end

	if not self.iData.muteCheckEnough and not enough then
		if self.iData.notEnoughCallback then
			self.iData.notEnoughCallback(lackItem.sourceItemId or lackItem.id, lackItem.num)
		else
			pg.global.showBubbleMessageById(NoticeDef.ITEM_COUNT_LACK)
		end

		if lackItem.id == Const.CommonEnergyType_Stamina then
			LuaUIUtils.openVitalityGot(Const.CommonEnergyType_Stamina)
		end

		return
	end

	self:close()

	if self.iData.confirmCb == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[CommonUseConfirmCtrl] confirmCb is nil.")
		end

		return
	end

	pcall(self.iData.confirmCb)
end

function CommonUseConfirmCtrl:onExchangeRewardResult(param)
	if param.code == 0 then
		self:refreshExchangeRewardInfo()
	elseif param.code == 1 then
		-- block empty
	elseif param.code == 3 then
		pg.global.ui.tips:showTextTip(pg.getGameString("EXCHANGE_REWARD_ENERGY_LACK"))
	end
end

function CommonUseConfirmCtrl:refreshExchangeRewardInfo(isInit)
	self.view.countUBaseText:SetActive(true)

	local tipText = string.gsub(pg.getGameString("EXCHANGE_REWARD_TIP"), "{0}", LuaUIUtils.getItemCountConsumeShowText(Const.CommonEnergyType_Stamina, self.iData.exchangeCost))

	ClientTextUtils.setText(self.view.iTipTop, tipText)

	local exchangeCount = pg.me.rogueExchangeMap[pg.me.curRogueLayer] or 0
	local remaindCount = self.iData.exchangeTotalCount - exchangeCount

	if remaindCount <= 0 and not isInit then
		self:close()
	else
		ClientTextUtils.setText(self.view.countUBaseText, string.format("%s: %d/%d", pg.getGameString("TOWER_ROGUE_BUFF_RESET_TIMES"), remaindCount, self.iData.exchangeTotalCount))
	end
end

function CommonUseConfirmCtrl:onInputDeviceChanged(deviceType)
	return
end

function CommonUseConfirmCtrl:onDestroy()
	if pg.global.navMgr then
		pg.global.navMgr:RemoveLuaFocusCursorMovedListener("CommonUseConfirm")
	end

	UICtrl.onDestroy(self)
end

return CommonUseConfirmCtrl
