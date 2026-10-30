-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\SeasonShop\\SeasonShopView.lua

local Class = require("Core.Framework.Class")
local ShopView = require("Guis.Panels.Shop.ShopView")
local SeasonShopView = Class.LightClass("SeasonShopView", ShopView)
local SEASON_ITEM_BACKGROUND_HORIZONTAL_PADDING = 198

function SeasonShopView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.listCoins = self.objectReference:GetRefValue("listCoins")
	self.pbBuyUComponent = self.objectReference:GetRefValue("pbBuyUComponent")
	self.btnExit = self.objectReference:GetRefValue("btnExit")
	self.consoleKeyUList = self.objectReference:GetRefValue("consoleKeyUList")
	self.uIPrefabShopPanelUComponent = self.objectReference:GetRefValue("uIPrefabShopPanelUComponent")
	self.listTabIconUList = self.objectReference:GetRefValue("listTabIconUList")
	self.btnJumpUWidget = self.objectReference:GetRefValue("btnJumpUWidget")
	self.jumpUButton = self.objectReference:GetRefValue("jumpUButton")
	self.panelPropInfoUContainer = self.objectReference:GetRefValue("panelPropInfoUContainer")
	self.backgroundUImage = self.objectReference:GetRefValue("backgroundUImage")
	self.seasonTimeUCountDown = self.objectReference:GetRefValue("seasonTimeUCountDown")
	self.subTitleIconUImage = self.objectReference:GetRefValue("subTitleIconUImage")
	self.subTitleUSDFText = self.objectReference:GetRefValue("subTitleUSDFText")
	self.contentUScrollRect = self.objectReference:GetRefValue("contentUScrollRect")

	if self.contentUScrollRect then
		local scrollRectObjectReference = self.contentUScrollRect.content:GetComponent("ObjectReference")

		self.seasonItemUList = scrollRectObjectReference:GetRefValue("seasonItemUList")
		self.pbBuyListProp = scrollRectObjectReference:GetRefValue("pbBuyListProp")
		self.bgUImage = scrollRectObjectReference:GetRefValue("bgUImage")
		self.leftLineUImage = scrollRectObjectReference:GetRefValue("leftLineUImage")
		self.rightLineUImage = scrollRectObjectReference:GetRefValue("rightLineUImage")
	end
end

function SeasonShopView:initView()
	return
end

function SeasonShopView:_getSeasonItemDecorationWidth()
	local shopList = self.pbBuyListProp

	if not shopList then
		return
	end

	local templateItem = shopList:GetTemplateItem(0)

	if not templateItem then
		return
	end

	local listRectTransform = shopList.rectTransform
	local templateRectTransform = templateItem.rectTransform

	if not listRectTransform or not templateRectTransform then
		return
	end

	local paddings = shopList:GetPaddings()
	local leftPadding = paddings[2]
	local rightPadding = paddings[3]
	local columnSpacing = shopList.colSpacing
	local listWidth = listRectTransform.rect.width
	local itemWidth = templateRectTransform.rect.width

	if itemWidth <= 0 then
		return
	end

	local availableWidth = math.max(0, listWidth - leftPadding - rightPadding)
	local columnCount = math.max(1, math.floor((availableWidth + columnSpacing) / (itemWidth + columnSpacing)))
	local contentWidth = leftPadding + rightPadding + columnCount * itemWidth + math.max(0, columnCount - 1) * columnSpacing

	return contentWidth + SEASON_ITEM_BACKGROUND_HORIZONTAL_PADDING * 2
end

function SeasonShopView:refreshSeasonItemDecorationLayout()
	local background = self.bgUImage
	local leftLine = self.leftLineUImage
	local rightLine = self.rightLineUImage

	if not background or not leftLine or not rightLine then
		return
	end

	local backgroundWidth = self:_getSeasonItemDecorationWidth()

	if not backgroundWidth then
		return
	end

	local halfWidthDelta = (backgroundWidth - background.rectTransform.rect.width) * 0.5

	if math.abs(halfWidthDelta) < 0.01 then
		return
	end

	local backgroundX = background.localPosition.x
	local leftLineDirection = backgroundX <= leftLine.localPosition.x and 1 or -1
	local rightLineDirection = backgroundX <= rightLine.localPosition.x and 1 or -1

	background:SetSizeX(backgroundWidth)
	leftLine:SetLocalPosX(leftLine.localPosition.x + halfWidthDelta * leftLineDirection)
	rightLine:SetLocalPosX(rightLine.localPosition.x + halfWidthDelta * rightLineDirection)
end

local buyShopTagItemComs = {}

function SeasonShopView:getBuyShopTagItemComs(button)
	if buyShopTagItemComs[button] == nil then
		buyShopTagItemComs[button] = {}

		local objectReference = button.transform:GetComponent("ObjectReference")

		buyShopTagItemComs[button].nameTxt = objectReference:GetRefValue("txtNameUText")
		buyShopTagItemComs[button].consoleSelected = objectReference:GetRefValue("consoleSelected")
	end

	return buyShopTagItemComs[button]
end

local buyPropPriceRuleComs = {}

function SeasonShopView:getBuyPropPriceRuleComs(button)
	if buyPropPriceRuleComs[button] == nil then
		buyPropPriceRuleComs[button] = {}
		buyPropPriceRuleComs[button].nameTxt = button:Find("TxtName"):GetComponent("UBaseText")
		buyPropPriceRuleComs[button].numberTxt = button:Find("TxtNumber"):GetComponent("UBaseText")
		buyPropPriceRuleComs[button].icon = button:Find("TxtNumber/Icon"):GetComponent("UImage")
	end

	return buyPropPriceRuleComs[button]
end

local currencyItemsComs = {}

function SeasonShopView:getCurrencyItemComs(button)
	if currencyItemsComs[button] == nil then
		currencyItemsComs[button] = {}

		local objectReference = button.transform:GetComponent("ObjectReference")

		currencyItemsComs[button].icon = objectReference:GetRefValue("iconUImage")
		currencyItemsComs[button].countTxt = objectReference:GetRefValue("countUText")
	end

	return currencyItemsComs[button]
end

local seasonExclusiveItemComs = {}

function SeasonShopView:getSeasonExclusiveItemComs(button)
	if seasonExclusiveItemComs[button] == nil then
		local objectReference = button.transform:GetComponent("ObjectReference")
		local seasonTagUWidget = objectReference:GetRefValue("seasonTagUWidget")
		local seasonTagObjectReference = seasonTagUWidget and seasonTagUWidget.transform:GetComponent("ObjectReference")
		local costIconUImage = objectReference:GetRefValue("costIconUImage")
		local costPriceUSDFText = objectReference:GetRefValue("costPriceUSDFText")

		seasonExclusiveItemComs[button] = {
			iconUImage = objectReference:GetRefValue("iconUImage"),
			seasonTagUWidget = seasonTagUWidget,
			seasonTagUImage = seasonTagObjectReference and seasonTagObjectReference:GetRefValue("seasonTagUImage"),
			seasonTagTitleUSDFText = seasonTagObjectReference and seasonTagObjectReference:GetRefValue("titleUSDFText"),
			costIconUImage = costIconUImage,
			costPriceUSDFText = costPriceUSDFText,
			imgCoinIcon_1 = costIconUImage,
			txtCoinNumber_1 = costPriceUSDFText,
			itemNameUSDFText = objectReference:GetRefValue("itemNameUSDFText"),
			lockConditionUSDFText = objectReference:GetRefValue("lockConditionUSDFText"),
			lockIconUImage = objectReference:GetRefValue("lockIconUImage"),
			lockUCountDown = objectReference:GetRefValue("lockUCountDown")
		}
	end

	return seasonExclusiveItemComs[button]
end

function SeasonShopView:onDestroy()
	for key in next, seasonExclusiveItemComs do
		seasonExclusiveItemComs[key] = nil
	end

	for key in next, currencyItemsComs do
		currencyItemsComs[key] = nil
	end

	for key in next, buyPropPriceRuleComs do
		buyPropPriceRuleComs[key] = nil
	end

	for key in next, buyShopTagItemComs do
		buyShopTagItemComs[key] = nil
	end

	SeasonShopView.super.onDestroy(self)
end

return SeasonShopView
