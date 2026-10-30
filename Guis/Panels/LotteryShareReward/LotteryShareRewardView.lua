-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LotteryShareReward\\LotteryShareRewardView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local LotteryShareRewardView = Class.LightClass("LotteryShareRewardView", UIView)

function LotteryShareRewardView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.component = objectReference:GetRefValue("component")
	self.exitBtn = objectReference:GetRefValue("exitBtn")
	self.choseList = objectReference:GetRefValue("choseList")
	self.btn1UButton = objectReference:GetRefValue("btn1UButton")
	self.btn2UButton = objectReference:GetRefValue("btn2UButton")
	self.tipsUSDFText = objectReference:GetRefValue("tipsUSDFText")
	self.textUSDFText = objectReference:GetRefValue("textUSDFText")
	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.moneyObjectReference = objectReference:GetRefValue("moneyObjectReference")
	self.getNumObjectReference = objectReference:GetRefValue("getNumObjectReference")
	self.allNumObjectReference = objectReference:GetRefValue("allNumObjectReference")
	self.tipTextUSDFText = objectReference:GetRefValue("tipTextUSDFText")

	local tryObjectReference = self.btn1UButton:GetComponent("ObjectReference")

	self.tryButton = tryObjectReference:GetRefValue("uIBtn1stConfirmUButton")
	self.tryButtonText = tryObjectReference:GetRefValue("txtNameUText")

	local thanksObjectReference = self.btn2UButton:GetComponent("ObjectReference")

	self.thanksButton = thanksObjectReference:GetRefValue("uIBtn1stConfirmUButton")
	self.thanksButtonText = thanksObjectReference:GetRefValue("txtNameUText")
	self.btnPlayerInfoUWidget = objectReference:GetRefValue("btnPlayerInfoUWidget")

	local playerObjectReference = self.btnPlayerInfoUWidget:GetComponent("ObjectReference")

	self.playerHeadUWidget = playerObjectReference:GetRefValue("playerHeadUWidget")
	self.textLvUSDFText = playerObjectReference:GetRefValue("textLvUSDFText")

	local headObjectReference = self.playerHeadUWidget:GetComponent("ObjectReference")

	self.avatarUImage = headObjectReference:GetRefValue("avatarUImage")
	self.avatarFrameUImage = headObjectReference:GetRefValue("avatarFrameUImage")
	self.moneyUWidget = self.moneyObjectReference:GetRefValue("moneyUWidget")
end

function LotteryShareRewardView:initView()
	self.choseList:SetList({})
	ClientTextUtils.setText(self.tryButtonText, pg.getGameString("GACHA_SHARE_TRY_LUCK"))
	ClientTextUtils.setText(self.thanksButtonText, pg.getGameString("GACHA_SHARE_ACCEPT_THANKS"))
end

function LotteryShareRewardView:setInfo(viewData)
	local senderInfo = viewData.senderInfo
	local formatText = pg.getFormatText(pg.getGameString("GACHA_SHARE_FROM"), senderInfo.playerName or "")

	ClientTextUtils.setText(self.textUSDFText, formatText)

	self.avatarUImage.url = pg.game.chat:getPlayerIcon(senderInfo)
	self.avatarFrameUImage.url = pg.game.chat:getPlayerIconFrame(senderInfo)

	ClientTextUtils.setText(self.textLvUSDFText, senderInfo.level or "")
	self.choseList:SetList(viewData.items)

	local hasStatus = viewData.statusKey ~= nil

	self.moneyUWidget:SetActive(not hasStatus)
	self.tipTextUSDFText:SetActive(hasStatus)

	if hasStatus then
		ClientTextUtils.setText(self.tipTextUSDFText, pg.getGameString(viewData.statusKey))
	end

	ClientTextUtils.setText(self.tipsUSDFText, pg.getGameString("GACHA_SHARE_OPEN_TIP"))

	local iconUrl = LuaUIUtils.getIconByItemId(viewData.itemId)

	if not hasStatus then
		self:setRewardSummary(self.moneyObjectReference, "GACHA_SHARE_RECEIVED", iconUrl, viewData.itemNum)
	end

	self:setRewardSummary(self.getNumObjectReference, "GACHA_SHARE_CLAIMED", nil, string.format("%d/%d", viewData.claimedCount, viewData.totalCount))
	self:setRewardSummary(self.allNumObjectReference, "GACHA_SHARE_TOTAL", iconUrl, viewData.totalNum)
end

function LotteryShareRewardView:setRewardSummary(objectReference, textKey, iconUrl, numberText)
	local tipsUSDFText = objectReference:GetRefValue("tipsUSDFText")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local numUSDFText = objectReference:GetRefValue("numUSDFText")

	ClientTextUtils.setText(tipsUSDFText, pg.getGameString(textKey))

	local hasIcon = iconUrl ~= nil

	iconUImage:SetActive(hasIcon)

	if iconUrl then
		iconUImage.url = iconUrl
	end

	ClientTextUtils.setText(numUSDFText, numberText)
end

return LotteryShareRewardView
