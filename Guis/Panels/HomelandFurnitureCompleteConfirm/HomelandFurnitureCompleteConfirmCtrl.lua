-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandFurnitureCompleteConfirm\\HomelandFurnitureCompleteConfirmCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local MessageName = require("Const.MessageName")
local NoticeDef = require("Common.NoticeDef")
local ItemData = require("Data.item_data")
local HomelandFurnitureCompleteConfirmCtrl = Class.LightClass("HomelandFurnitureCompleteConfirmCtrl", UICtrl)

HomelandFurnitureCompleteConfirmCtrl.messages = {
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

function HomelandFurnitureCompleteConfirmCtrl:addListener()
	function self.view.btnCancelUButton.luaClick()
		self:closePanel()
	end

	function self.view.btnConfirmUButton.luaClick()
		self:onConfirm()
	end

	function self.view.listConsumeUList.luaRenderItem(button, _, data)
		LuaUIUtils.renderRewardItem(button, {
			skipConditionConvert = true,
			id = data.itemId,
			num = data.itemNum
		}, tostring(data.itemNum))
	end
end

function HomelandFurnitureCompleteConfirmCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.completionModel = info.completionModel
	self.confirmCb = info.confirmCb

	self:refreshView()
end

function HomelandFurnitureCompleteConfirmCtrl:refreshView()
	if not self.view or not self.completionModel then
		return
	end

	local model = self.completionModel

	model:refresh()

	local isEnough = model:validateSelectedResources()

	self.rpcItems = model.rpcItems

	self.view.listConsumeUList:SetList(self.rpcItems)

	self.view.btnConfirmUButton.interactable = #self.rpcItems > 0 and isEnough

	ClientTextUtils.setText(self.view.txtTitleUSDFText, pg.getGameString("HOMELAND_FURNITURE_COMPLETE_CONFIRM_TITLE"))

	local selectedCountText = pg.getFormatText("<style=Hint_BgL>{0}</style>", model:getSelectedItemCount())

	ClientTextUtils.setText(self.view.txtDescUSDFText, pg.getFormatText(pg.getGameString("HOMELAND_FURNITURE_COMPLETE_CONFIRM_DESC"), selectedCountText))
	ClientTextUtils.setText(self.view.txtCancelUSDFText, pg.getGameString("COMMON_CANCEL"))
	ClientTextUtils.setText(self.view.txtConfirmUSDFText, pg.getGameString("COMMON_CONFIRM"))
end

function HomelandFurnitureCompleteConfirmCtrl:onConfirm()
	local model = self.completionModel

	model:refresh()

	local isEnough, lackInfo = model:validateSelectedResources()

	if not isEnough then
		if lackInfo.resourceType == "material" then
			pg.global.showBubbleMessage(NoticeDef.HOME_REDEEM_LACK)
		else
			pg.global.showBubbleMessage(NoticeDef.SHOP_ITEM_NOT_ENOUGH, pg.getLocalizationText((ItemData[lackInfo.itemId] or {}).itemName or ""))
		end

		self:refreshView()

		return
	end

	local rpcItems = model.rpcItems

	if #rpcItems == 0 then
		self:closePanel()

		return
	end

	local hasChanged = #rpcItems ~= #self.rpcItems

	for index, item in ipairs(rpcItems) do
		local confirmedItem = self.rpcItems[index]

		if not confirmedItem or item.itemId ~= confirmedItem.itemId or item.itemNum ~= confirmedItem.itemNum then
			hasChanged = true

			break
		end
	end

	if hasChanged then
		self:refreshView()

		return
	end

	local confirmCb = self.confirmCb

	self.view.btnConfirmUButton.interactable = false

	self:closePanel()
	confirmCb(rpcItems)
end

function HomelandFurnitureCompleteConfirmCtrl:onDestroy()
	self.completionModel = nil
	self.confirmCb = nil
	self.rpcItems = nil

	UICtrl.onDestroy(self)
end

return HomelandFurnitureCompleteConfirmCtrl
