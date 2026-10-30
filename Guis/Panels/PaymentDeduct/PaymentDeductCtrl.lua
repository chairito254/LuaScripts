-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PaymentDeduct\\PaymentDeductCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local CashShopConst = require("Const.CashShopConst")
local UIConst = require("Const.UIConst")
local MessageName = require("Const.MessageName")
local ItemUtils = require("Common.Utils.ItemUtils")
local SDKLoginConfig = require("SDK.SDKLoginConfig")
local PaymentDeductModel = require("Guis.Panels.PaymentDeduct.PaymentDeductModel")
local PaymentDeductView = require("Guis.Panels.PaymentDeduct.PaymentDeductView")
local PaymentDeductShopsComponent = require("Guis.Panels.PaymentDeduct.PaymentDeductShopsComponent")
local ClientRepo = require("Core.Client.ClientRepo")
local Const = require("Common.Const.Const")
local csSDKManager = CS.FunPlus.WorldX.SDK.SDKManager
local PaymentDeductCtrl = Class.LightClass("PaymentDeductCtrl", UICtrl)

PaymentDeductCtrl.modelClz = PaymentDeductModel
PaymentDeductCtrl.viewClz = PaymentDeductView
PaymentDeductCtrl.messages = {
	[MessageName.MONEY_COUNT_CHANGE] = {
		"onCurrencyChange",
		true
	}
}

function PaymentDeductCtrl:checkOpenExtra()
	return pg.game.recharge:isPenaltyPaymentRequired()
end

function PaymentDeductCtrl:onOpen(info)
	self._releaseRequested = false

	UICtrl.onOpen(self, info)
end

function PaymentDeductCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	if SDKLoginConfig.isEnabled() then
		local products = csSDKManager:GetPayProductsTable()

		if not products or next(products) == nil then
			csSDKManager:GetPayProductsInfo()
		end
	end

	self.paymentComponent = PaymentDeductShopsComponent.new(self, self.view.paymentUContainer, CashShopConst.CategoryType.RECHARGE)
	self.curComponent = self.paymentComponent

	self:addListener()
	self:_refreshCurrencyList()
	self.paymentComponent:onEnterPage(CashShopConst.CategoryType.RECHARGE)
end

function PaymentDeductCtrl:addListener()
	if self.view.btnBack then
		local function showQuitConfirm()
			self:showQuitConfirm()
		end

		self.view.btnBack.luaClick = showQuitConfirm

		self.view.btnBack:SetGamepadAction("Raw/GamepadButtonEast", nil, function()
			local navMgr = pg.global.navMgr

			if navMgr and navMgr:IsActionPathOccupied("Raw/GamepadButtonEast") then
				return
			end

			showQuitConfirm()
		end)
		self.view.btnBack:SetHotkeyConsoleBar("GAME_CLIENT_CLOSED", 10, self.view.consoleBar)
	end

	self:addNavFocusListener(function()
		self:refreshConsoleBarState()
	end, "PaymentDeductConsoleBar")
	self:refreshConsoleBarState()

	if self.view.minusBtn then
		self.view.minusBtn.enabledTooltip = false
		self.view.minusBtn.luaRenderTooltip = nil

		function self.view.minusBtn.luaClick()
			pg.global.ui:open(UIConst.UI_ID_CASH_SHOP_PENALTY_TIP)
		end
	end
end

function PaymentDeductCtrl:refreshConsoleBarState()
	local navMgr = pg.global.navMgr
	local isInCurrency = navMgr and navMgr:IsActionPathOccupied("Raw/GamepadButtonEast")

	CS.XGUI.Navigation.ConsoleBar.SetStateForAll("PaymentDeduct_InCurrency", isInCurrency == true)
end

function PaymentDeductCtrl:showQuitConfirm()
	local isConsole = pg.global.platform and pg.global.platform.isConsole and pg.global.platform:isConsole()

	if isConsole or ClientConfigCloudEnable == "true" then
		self:showQuitConfirmForConsole()
	else
		self:showQuitConfirmNormal()
	end
end

function PaymentDeductCtrl:showQuitConfirmForConsole()
	local function returnLogin()
		ClientRepo.loginAgent:logout()
	end

	pg.global.showConfirmMsgRaw(pg.getGameString("WARNING"), pg.getGameString("QUIT_GAME_WARNING"), returnLogin, nil, nil, nil, nil, {
		pauseGame = true,
		escSpecial = true,
		okBtnDesc = pg.getGameString("EXIT_GAME_BACK_TO_LOGIN"),
		cancelBtnDesc = pg.getGameString("EXIT_GAME_CANCEL"),
		okBtnType = UIConst.MENU_EXIT_BTN_TYPE.ReturnLogin,
		cancelType = UIConst.MENU_EXIT_BTN_TYPE.Confirm,
		okBtnKey = Const.ExitButtonType.TEMPORARY_EXIT,
		cancelBtnKey = Const.ExitButtonType.CONTINUE
	})
end

function PaymentDeductCtrl:showQuitConfirmNormal()
	local function exitGame()
		ClientRepo.loginAgent:logoutService()
		appFacade.QuitGame()
	end

	local function returnLogin()
		ClientRepo.loginAgent:logout()
	end

	local quitQrCodeUrl, quitQrCodeTip = pg.global.ui.login.model:getQuitQrCodeUrlAndTip()

	pg.global.showConfirmMsgRaw(pg.getGameString("WARNING"), pg.getGameString("QUIT_GAME_WARNING"), exitGame, nil, returnLogin, true, nil, {
		pauseGame = true,
		escSpecial = true,
		okBtnDesc = pg.getGameString("EXIT_GAME_IMMEDIATELY"),
		cancelBtnDesc = pg.getGameString("EXIT_GAME_BACK_TO_LOGIN"),
		nextBtnDesc = pg.getGameString("EXIT_GAME_CANCEL"),
		okBtnType = UIConst.MENU_EXIT_BTN_TYPE.ExitGame,
		cancelType = UIConst.MENU_EXIT_BTN_TYPE.ReturnLogin,
		nextBtnType = UIConst.MENU_EXIT_BTN_TYPE.Confirm,
		okBtnKey = Const.ExitButtonType.END_AND_EXIT,
		cancelBtnKey = Const.ExitButtonType.TEMPORARY_EXIT,
		nextBtnKey = Const.ExitButtonType.CONTINUE,
		qrCodeUrl = quitQrCodeUrl,
		qrCodeTip = quitQrCodeTip
	})
end

function PaymentDeductCtrl:onShow()
	self:_refreshCurrencyList()

	if self.paymentComponent then
		self.paymentComponent:onVisibleChange(true)
	end
end

function PaymentDeductCtrl:onHide()
	if self.paymentComponent then
		self.paymentComponent:onVisibleChange(false)
	end
end

function PaymentDeductCtrl:onDestroy()
	if self.paymentComponent then
		self.paymentComponent:onDestroy()

		self.paymentComponent = nil
	end

	self.curComponent = nil

	UICtrl.onDestroy(self)
end

function PaymentDeductCtrl:close()
	if not self._releaseRequested then
		return
	end

	UICtrl.close(self)
end

function PaymentDeductCtrl:closeImmediately()
	if not self._releaseRequested then
		return
	end

	UICtrl.closeImmediately(self)
end

function PaymentDeductCtrl:release(immediate)
	self._releaseRequested = true

	if immediate then
		self:closeImmediately()
	else
		self:close()
	end
end

function PaymentDeductCtrl:onCurrencyChange()
	self:_refreshCurrencyList()
end

function PaymentDeductCtrl:_refreshCurrencyList()
	local currencyList = self.model:getCurrencyList()

	self.view:refreshCurrencyList(currencyList)

	local negativeCurrencyIdSet = {}

	for _, currency in ipairs(ItemUtils.getNegativeMoneyList(pg.me)) do
		negativeCurrencyIdSet[currency.itemId] = true
	end

	local hasNegativeCurrencyInBar = false

	for _, currency in ipairs(currencyList) do
		if negativeCurrencyIdSet[currency.itemId] then
			hasNegativeCurrencyInBar = true

			break
		end
	end

	self.view:setCurrencyPenaltyVisible(hasNegativeCurrencyInBar)
end

return PaymentDeductCtrl
