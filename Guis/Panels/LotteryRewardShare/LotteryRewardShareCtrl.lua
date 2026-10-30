-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LotteryRewardShare\\LotteryRewardShareCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local Utils = require("Common.Utils.Utils")
local ChatSystem = require("GameApp.Chat.ChatSystem")
local GachaBaseData = require("Data.gacha_base_data")
local LotteryRewardShareModel = require("Guis.Panels.LotteryRewardShare.LotteryRewardShareModel")
local LotteryRewardShareCtrl = Class.LightClass("LotteryRewardShareCtrl", UICtrl)

LotteryRewardShareCtrl.modelClz = LotteryRewardShareModel
LotteryRewardShareCtrl.messages = {}

function LotteryRewardShareCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function LotteryRewardShareCtrl:addListener()
	function self.view.closeBtn.luaClick()
		self:dismiss()
	end

	function self.view.btnShare.luaClick()
		self:shareReward()
	end
end

function LotteryRewardShareCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self._openInfo = Utils.isTable(info) and info or {}

	self.view:setInfo(self._openInfo, self.model:getGiftUrl(self._openInfo.drawId))
	pg.game.audio:playEvent("SFX_UI_Fashion_Get_Redbag")
end

function LotteryRewardShareCtrl:shareReward()
	local drawId = self._openInfo and self._openInfo.drawId or nil
	local bgUrl = self.model:getGiftUrl(drawId)
	local shareInfo = self._openInfo
	local shareCallback = self._openInfo and self._openInfo.shareCallback or nil
	local sent = pg.game.chat:sendGiftMessage(pg.game.chat.channelType.Friend, pg.game.chat.channelType.Friend, ChatSystem.giftType.Lottery, bgUrl, {
		gachaId = drawId,
		itemId = GachaBaseData.share_award
	}, false, function()
		pg.global.ui.tips:showTextTip(pg.getGameString("LOTTERY_SHARE_DONE_TIPS"))
		self:dismiss()

		if type(shareCallback) == "function" then
			shareCallback(shareInfo)
		end
	end)

	if sent ~= true then
		return
	end
end

function LotteryRewardShareCtrl:onDestroy()
	self._openInfo = nil

	UICtrl.onDestroy(self)
end

return LotteryRewardShareCtrl
