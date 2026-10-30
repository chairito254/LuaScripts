-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PaymentDeduct\\PaymentDeductView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PaymentDeductView = Class.LightClass("PaymentDeductView", UIView)

function PaymentDeductView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.paymentUContainer = objectReference:GetRefValue("paymentUContainer")
	self.listCurrency = objectReference:GetRefValue("listCurrency")
	self.minusBtn = objectReference:GetRefValue("minusBtn")
	self.btnBack = objectReference:GetRefValue("btnBack")
	self.titleText = objectReference:GetRefValue("titleText")
	self.consoleBar = self.transform:Find("SafeBoxMobile/ConsoleBar")

	if self.consoleBar then
		self.consoleBar.gameObject:SetActiveEx(true)
	end

	ClientTextUtils.setText(self.titleText, pg.getGameString("GAME_CLIENT_CLOSED"))
end

function PaymentDeductView:refreshCurrencyList(currencyList)
	function self.listCurrency.luaRenderItem(button, _, data)
		LuaUIUtils.setTopCurrencyItem(button, data.itemId, nil, nil, nil, {
			hideAddButton = true
		})
	end

	self.listCurrency:SetList(currencyList or {})
end

function PaymentDeductView:setCurrencyPenaltyVisible(visible)
	if not self.minusBtn then
		return
	end

	self.minusBtn:SetActive(visible)

	if not visible then
		self.minusBtn:CloseTooltip()
	end
end

return PaymentDeductView
