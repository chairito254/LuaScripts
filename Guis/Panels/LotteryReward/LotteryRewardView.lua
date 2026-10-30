-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LotteryReward\\LotteryRewardView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientCashShopUtils = require("Utils.ClientCashShopUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LotteryRewardView = Class.LightClass("LotteryRewardView", UIView)

function LotteryRewardView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.itemList = objectReference:GetRefValue("itemList")
	self.closeBtn = objectReference:GetRefValue("closeBtn")
	self.root = objectReference:GetRefValue("root")
	self.txtTitle = objectReference:GetRefValue("txtTitle")
	self.txtTips = objectReference:GetRefValue("txtTips")
	self.doubleRewardUWidget = objectReference:GetRefValue("doubleRewardUWidget")
	self.btnShare = objectReference:GetRefValue("btnShare")
	self.btnConfirm = objectReference:GetRefValue("btnConfirm")
	self.discountUWidget = objectReference:GetRefValue("discountUWidget")
	self.txtDiscount = objectReference:GetRefValue("txtDiscount")
	self.imgConsume = objectReference:GetRefValue("imgConsume")
	self.txtConsume = objectReference:GetRefValue("txtConsume")
	self.txtBtnConfirm = objectReference:GetRefValue("txtBtnConfirm")
	self.imgBG = objectReference:GetRefValue("imgBG")
	self.animTor = objectReference:GetRefValue("animTor")
	self.imageDoceUImage = objectReference:GetRefValue("imageDoceUImage")
end

function LotteryRewardView:registerObjects()
	function self.itemList.luaRenderItem(button, index, data)
		self:renderRewardItem(button, index, data)
	end
end

function LotteryRewardView:renderRewardItem(button, index, data)
	LuaUIUtils.renderRewardItem(button, data, tostring(data.num or 1), nil, nil, true)

	local hasDecomposeReward = data.decomposeRewardId ~= nil

	button:TryChangePage("State", hasDecomposeReward and 1 or 0)

	if not hasDecomposeReward then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local imgExChange = objectReference:GetRefValue("imgExChange")
	local numExChange = objectReference:GetRefValue("numExChange")

	imgExChange.url = data.decomposeItemId and LuaUIUtils.getIconByItemId(data.decomposeItemId) or ""

	ClientTextUtils.setText(numExChange, data.decomposeItemNum or 0)
end

function LotteryRewardView:initView()
	self.itemList:SetList({})
	self.btnShare:SetActive(false)
	self.discountUWidget:SetActive(false)
end

function LotteryRewardView:setInfo(viewData)
	viewData = viewData or {}
	self.imgBG.url = viewData.bgImage or ""

	ClientCashShopUtils.setImageColorByHex(self.imageDoceUImage, viewData.textColor)
	ClientTextUtils.setText(self.txtTitle, viewData.title or "")
	ClientTextUtils.setText(self.txtTips, viewData.tips or "")
	self.itemList:SetList(viewData.itemList or {})
	self.discountUWidget:SetActive(viewData.hasDiscount == true)
	ClientTextUtils.setText(self.txtDiscount, viewData.discountText or "")

	self.imgConsume.url = viewData.consumeItemId and LuaUIUtils.getIconByItemId(viewData.consumeItemId) or ""

	ClientTextUtils.setText(self.txtConsume, viewData.consumeNum or 0)
end

function LotteryRewardView:playEntranceAnimation(drawId)
	drawId = tonumber(drawId)

	if not drawId or drawId <= 0 or IsNil(self.animTor) then
		return
	end

	self.animTor:Stop()
	self.animTor:Play("Ani_Pop_Event_Lottery_Reward_In_" .. tostring(drawId))
end

return LotteryRewardView
