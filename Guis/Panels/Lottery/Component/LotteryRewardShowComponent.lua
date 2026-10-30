-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Lottery\\Component\\LotteryRewardShowComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local UIConst = require("Const.UIConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Utils = require("Common.Utils.Utils")
local Time = require("Core.Common.Time")
local ItemData = require("Data.item_data")
local ItemShowTypeData = require("Data.item_type_show_data")
local LotteryRewardShowComponent = Class.LightClass("LotteryRewardShowComponent", UIComponent)

function LotteryRewardShowComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.listLeftUList = objectReference:GetRefValue("listLeftUList")
	self.listRightUList = objectReference:GetRefValue("listRightUList")
	self.btnReward = objectReference:GetRefValue("btnReward")
	self.txtBtnReward = objectReference:GetRefValue("txtBtnReward")
	self.btnGotoGacha = objectReference:GetRefValue("btnGotoGacha")
	self.btnMakeupUButton = objectReference:GetRefValue("btnMakeupUButton")
	self.txtTitle = objectReference:GetRefValue("txtTitle")
	self.txtBtnGotoGacha = objectReference:GetRefValue("txtBtnGotoGacha")
end

function LotteryRewardShowComponent:registerObjects()
	function self.listLeftUList.luaRenderItem(button, index, data)
		self:renderLeftItem(button, index, data)
	end

	function self.listLeftUList.luaClick(button, data)
		self:selectItem(data)
	end

	function self.listRightUList.luaRenderItem(button, index, data)
		LuaUIUtils.renderRewardItem(button, data)
	end

	function self.btnReward.luaClick()
		self:openOtherReward()
	end

	function self.btnGotoGacha.luaClick()
		self.ctrl:gotoGacha()
	end

	function self.btnMakeupUButton.luaClick()
		self:toggleLotteryMakeup()
	end
end

function LotteryRewardShowComponent:initView()
	ClientTextUtils.setText(self.txtBtnReward, pg.getGameString("LOTTERY_OTHER_REWARD"))
	ClientTextUtils.setText(self.txtTitle, pg.getGameString("LOTTERY_HAS_REWARD"))
	ClientTextUtils.setText(self.txtBtnGotoGacha, pg.getGameString("LOTTERY_GO_GACHA"))
	self.listLeftUList:SetList({})
	self.listRightUList:SetList({})
	self.btnMakeupUButton:SetSelected(false)
	self.btnMakeupUButton:TryChangePage("showType", 0)
end

function LotteryRewardShowComponent:setInfo(info)
	self._info = Utils.isTable(info) and info or {}
	self._itemList = Utils.isTable(self._info.itemList) and self._info.itemList or {}
	self._drawId = tonumber(self._info.drawId)
	self._lotteryMakeupId = tonumber(self._info.makeupId)
	self._useLotteryMakeup = false

	self.btnMakeupUButton:SetActive(self._lotteryMakeupId ~= nil)
	self.btnMakeupUButton:SetSelected(false)
	self.btnMakeupUButton:TryChangePage("showType", 0)

	self._selectedItemKeys = {}
	self._selectedItemOrder = {}
	self._focusedItem = nil

	self:refreshItemMap()

	local firstItem = self._itemList[1]

	if firstItem and firstItem.rewardShowKey then
		self._focusedItem = firstItem
		self._selectedItemKeys[firstItem.rewardShowKey] = true
		self._selectedItemOrder[1] = firstItem.rewardShowKey
	end

	self.listLeftUList:SetList(self._itemList)
	self:refreshContentList()
	self:refreshAppearancePreview()
end

function LotteryRewardShowComponent:refreshItemMap()
	self._itemByKey = {}

	for _, itemData in ipairs(self._itemList) do
		if itemData.rewardShowKey then
			self._itemByKey[itemData.rewardShowKey] = itemData
		end
	end
end

function LotteryRewardShowComponent:clearSelectedFurniture(keepRewardShowKey)
	for index = #self._selectedItemOrder, 1, -1 do
		local selectedKey = self._selectedItemOrder[index]
		local selectedItem = self._itemByKey and self._itemByKey[selectedKey] or nil

		if selectedKey ~= keepRewardShowKey and Utils.isTable(selectedItem) and tonumber(selectedItem.showType) == 4 then
			self._selectedItemKeys[selectedKey] = nil

			table.remove(self._selectedItemOrder, index)
		end
	end
end

function LotteryRewardShowComponent:renderLeftItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local txtTitle = objectReference:GetRefValue("txtTitle")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local imgCost = objectReference:GetRefValue("imgCost")
	local txtBaseCost = objectReference:GetRefValue("txtBaseCost")
	local txtHas = objectReference:GetRefValue("txtHas")
	local txtDiscountCost = objectReference:GetRefValue("txtDiscountCost")
	local discountUWidget = objectReference:GetRefValue("discountUWidget")
	local txtDiscount = objectReference:GetRefValue("txtDiscount")
	local newUWidget = objectReference:GetRefValue("newUWidget")
	local pullUWidget = objectReference:GetRefValue("pullUWidget")
	local discountCountdownUWidget = objectReference:GetRefValue("discountCountdownUWidget")
	local txtDiscountCountDown = objectReference:GetRefValue("txtDiscountCountDown")
	local countDownDiscount = objectReference:GetRefValue("countDownDiscount")
	local itemConfig = ItemData[data.itemId]
	local isCommodity = data.rewardShowType == "commodity"
	local showDiscount = isCommodity and tonumber(data.onlyExchange) == 1

	ClientTextUtils.setText(txtTitle, data.name and pg.getLocalizationText(data.name) or LuaUIUtils.getNameByItemId(data.itemId))

	if iconUImage then
		local commodityBanner = isCommodity and ClientCashShopUtils.getCommodityBannerByGender(data) or nil

		if not string.isNilOrEmpty(commodityBanner) then
			iconUImage.url = commodityBanner
		else
			iconUImage.url = itemConfig and LuaUIUtils.getIconByIconId(itemConfig.icon) or ""
		end
	end

	if imgCost then
		imgCost:SetActive(false)
	end

	if txtBaseCost then
		txtBaseCost:SetActive(isCommodity)

		local itemShowType = itemConfig and ItemShowTypeData[itemConfig.displayType] or nil

		ClientTextUtils.setText(txtBaseCost, isCommodity and itemShowType and pg.getLocalizationText(itemShowType.type) or "")
	end

	if txtHas then
		ClientTextUtils.setText(txtHas, pg.getGameString("SHOP_ALREADYHAVE"))
	end

	if txtDiscountCost then
		txtDiscountCost:SetActive(false)
	end

	if discountUWidget then
		discountUWidget:SetActive(showDiscount)
	end

	if txtDiscount then
		ClientTextUtils.setText(txtDiscount, showDiscount and pg.getGameString("LOTTERY_SHOP_OLNY") or "")
	end

	if newUWidget then
		newUWidget:SetActive(false)
	end

	if pullUWidget then
		pullUWidget:SetActive(false)
	end

	if discountCountdownUWidget then
		discountCountdownUWidget:SetActive(false)
	end

	if txtDiscountCountDown then
		ClientTextUtils.setText(txtDiscountCountDown, isCommodity and pg.getGameString("LOTTERY_DISCOUNT_TIME") or "")
	end

	if countDownDiscount then
		countDownDiscount.luaFinished = nil

		countDownDiscount:Stop()
		countDownDiscount:SetActive(false)
	end

	local closeTime = Utils.isTable(self._info) and tonumber(self._info.closeTime) or nil
	local showCountDown = isCommodity and closeTime ~= nil and closeTime > Time.getSecond()

	if discountCountdownUWidget then
		discountCountdownUWidget:SetActive(showCountDown)
	end

	if countDownDiscount then
		countDownDiscount:SetActive(showCountDown)

		if showCountDown then
			function countDownDiscount.luaFinished()
				if discountCountdownUWidget then
					discountCountdownUWidget:SetActive(false)
				end

				countDownDiscount:SetActive(false)
			end

			LuaUIUtils.setCountDownTime(countDownDiscount, closeTime, UIConst.TimeType.Short)
		end
	end

	button:TryChangePage("State", data.owned and 1 or 0)
	button:TryChangePage("Quality", itemConfig and itemConfig.quality or 0)
	button:SetSelected(self._selectedItemKeys[data.rewardShowKey] == true)
end

function LotteryRewardShowComponent:selectItem(data)
	if not Utils.isTable(data) or not data.rewardShowKey then
		return
	end

	local rewardShowKey = data.rewardShowKey

	self._focusedItem = data

	local showType = tonumber(data.showType) or 1

	self:clearSelectedFurniture(showType == 4 and rewardShowKey or nil)

	if self._selectedItemKeys[rewardShowKey] then
		self._selectedItemKeys[rewardShowKey] = nil

		for index, selectedKey in ipairs(self._selectedItemOrder) do
			if selectedKey == rewardShowKey then
				table.remove(self._selectedItemOrder, index)

				break
			end
		end
	else
		self._selectedItemKeys[rewardShowKey] = true
		self._selectedItemOrder[#self._selectedItemOrder + 1] = rewardShowKey
	end

	self.listLeftUList:RefreshList()
	self:refreshContentList()
	self:refreshAppearancePreview()
end

function LotteryRewardShowComponent:refreshContentList()
	local isSuit = Utils.isTable(self._focusedItem) and tonumber(self._focusedItem.isSuit) == 1

	self.rootUComponent:TryChangePage("IsSuit", isSuit and 1 or 0)

	local contentList = self.model:getRewardShowContentList(self._focusedItem)

	self.listRightUList:SetList(contentList)
end

function LotteryRewardShowComponent:getSelectedItemList()
	local selectedItems = {}

	for _, rewardShowKey in ipairs(self._selectedItemOrder or {}) do
		local itemData = self._itemByKey and self._itemByKey[rewardShowKey] or nil

		if itemData then
			selectedItems[#selectedItems + 1] = itemData
		end
	end

	return selectedItems
end

function LotteryRewardShowComponent:refreshAppearancePreview()
	if not self.ctrl or not self.ctrl.updateRewardShowPreview then
		return
	end

	local previewData = self.model:getRewardShowPreviewData(self:getSelectedItemList(), self._focusedItem)

	if self._useLotteryMakeup and self._lotteryMakeupId then
		local hasMakeup = false

		for _, makeupId in ipairs(previewData.makeupIds) do
			if tonumber(makeupId) == self._lotteryMakeupId then
				hasMakeup = true

				break
			end
		end

		if not hasMakeup then
			previewData.makeupIds[#previewData.makeupIds + 1] = self._lotteryMakeupId
		end
	end

	self.ctrl:updateRewardShowPreview(previewData)
end

function LotteryRewardShowComponent:toggleLotteryMakeup()
	if not self._lotteryMakeupId then
		return
	end

	self._useLotteryMakeup = not self._useLotteryMakeup

	self.btnMakeupUButton:SetSelected(self._useLotteryMakeup)
	self.btnMakeupUButton:TryChangePage("showType", self._useLotteryMakeup and 1 or 0)
	self:refreshAppearancePreview()
end

function LotteryRewardShowComponent:openOtherReward()
	local drawId = Utils.isTable(self._info) and self._info.drawId or nil

	pg.global.ui:open(UIConst.UI_ID_LOTTERY_OTHER_REWARD, {
		drawId = drawId
	})
end

function LotteryRewardShowComponent:onDestroy()
	self.listLeftUList.luaRenderItem = nil
	self.listLeftUList.luaClick = nil
	self.listRightUList.luaRenderItem = nil
	self.btnReward.luaClick = nil
	self.btnGotoGacha.luaClick = nil
	self.btnMakeupUButton.luaClick = nil
	self._info = nil
	self._itemList = nil
	self._itemByKey = nil
	self._selectedItemKeys = nil
	self._selectedItemOrder = nil
	self._focusedItem = nil
	self._drawId = nil
	self._lotteryMakeupId = nil
	self._useLotteryMakeup = nil
end

return LotteryRewardShowComponent
