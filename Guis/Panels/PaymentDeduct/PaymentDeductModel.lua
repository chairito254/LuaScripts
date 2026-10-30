-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PaymentDeduct\\PaymentDeductModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local CashShopConst = require("Const.CashShopConst")
local ShopmallTabData = require("Data.shopmall_tab_data")
local PaymentDeductModel = Class.LightClass("PaymentDeductModel", UIModel)

function PaymentDeductModel:getCurrencyList()
	local tabConfig = ShopmallTabData[CashShopConst.CategoryType.RECHARGE]
	local result = {}

	for _, itemId in ipairs(tabConfig and tabConfig.currency or {}) do
		result[#result + 1] = {
			itemId = itemId
		}
	end

	return result
end

return PaymentDeductModel
