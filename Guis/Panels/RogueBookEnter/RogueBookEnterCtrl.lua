-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBookEnter\\RogueBookEnterCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local RogueUtils = require("Utils.RogueUtils")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RedDotConst = require("Const.RedDotConst")
local UIConst = require("Const.UIConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local RogueConst = require("Const.RogueConst")
local Const = require("Common.Const.Const")
local TimerManager = require("Core.Timer.TimerManager")
local COLLECTION_COMPLETE_RECORD_KEY = "rogue_book_collection_complete_%d"
local RogueBookEnterCtrl = Class.LightClass("RogLevelSelectCtrl", UICtrl)

function RogueBookEnterCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
	self:initUI()
end

function RogueBookEnterCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:close()
	end
end

function RogueBookEnterCtrl:initUI()
	ClientTextUtils.setText(self.view.tMPUSDFText, pg.getGameString("ROGUE_BOOK_TITLE"))

	self.listBooks = {
		self.view.cardEnter1UButton,
		self.view.cardEnter2UButton,
		self.view.cardEnter3UButton
	}

	local books = self.model:getBookTypeList()

	for i, button in ipairs(self.listBooks) do
		self:renderCardItem(button, books[i])
	end
end

function RogueBookEnterCtrl:checkBookCanGetReward(bookId)
	if bookId == RogueConst.BookTypeId.Buff then
		return pg.me and pg.me.checkCanGetReward and pg.me:checkCanGetReward()
	elseif bookId == RogueConst.BookTypeId.Event then
		return pg.me and pg.me.checkEventBookCanGetReward and pg.me:checkEventBookCanGetReward()
	elseif bookId == RogueConst.BookTypeId.Boss then
		return pg.me and pg.me.checkBossBookCanGetReward and pg.me:checkBossBookCanGetReward()
	end

	return false
end

function RogueBookEnterCtrl:renderCardItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local rootComponent = objectReference:GetRefValue("rootComponent")
	local collectionNumUSDFText = objectReference:GetRefValue("collectionNumUSDFText")
	local textTitleUSDFText = objectReference:GetRefValue("textTitleUSDFText")
	local textInfoUSDFText = objectReference:GetRefValue("textInfoUSDFText")

	ClientTextUtils.setText(textTitleUSDFText, pg.getLocalizationText(data.cfg.name))

	local collectionCount = 0
	local collectionTotal = 0

	if pg.me and pg.me.getRogueBookUnlockCount then
		local countData = pg.me:getRogueBookUnlockCount()

		if data.bookId == RogueConst.BookTypeId.Buff then
			collectionCount = countData.buffCount or 0
			collectionTotal = countData.buffTotal or 0

			ClientTextUtils.setText(textInfoUSDFText, pg.getLocalizationText(data.cfg.desc))
		elseif data.bookId == RogueConst.BookTypeId.Event then
			collectionCount = countData.eventCount or 0
			collectionTotal = countData.eventTotal or 0

			ClientTextUtils.setText(textInfoUSDFText, "")
		elseif data.bookId == RogueConst.BookTypeId.Boss then
			collectionCount = countData.bossCount or 0
			collectionTotal = countData.bossTotal or 0

			ClientTextUtils.setText(textInfoUSDFText, "")
		end
	end

	ClientTextUtils.setText(collectionNumUSDFText, string.format("%d/%d", collectionCount, collectionTotal))

	self.bookRootComponentMap = self.bookRootComponentMap or {}
	self.bookRootComponentMap[data.bookId] = rootComponent

	local recordKey = string.format(COLLECTION_COMPLETE_RECORD_KEY, data.bookId)
	local lastCompleteTotal = pg.me:getRedDotRecord(Const.CLIENT_KEY.ROGUE, recordKey, 0)
	local isFinish = collectionTotal <= collectionCount and lastCompleteTotal <= collectionTotal

	rootComponent:TryChangePage("Lock", isFinish and 1 or 0)

	local tabPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, data.bookId)

	pg.global.setPreViewRedDot(tabPath, button, function()
		return self:checkBookCanGetReward(data.bookId) and RedDotConst.RedDotStyle.REWARD or RedDotConst.RedDotStyle.NONE
	end)

	function button.luaClick()
		self:onClickBookItem(data.bookId)
	end
end

function RogueBookEnterCtrl:onClickBookItem(bookId)
	pg.global.ui:open(UIConst.UI_ID_ROGUE_BOOK_MAIN, {
		bookId = bookId
	})
end

function RogueBookEnterCtrl:onFirstCollectionComplete(bookId)
	local rootComponent = self.bookRootComponentMap and self.bookRootComponentMap[bookId]

	if not rootComponent then
		return
	end

	self.collectionCompleteTimers = self.collectionCompleteTimers or {}

	if self.collectionCompleteTimers[bookId] then
		TimerManager.removeTimer(self.collectionCompleteTimers[bookId])
	end

	self.collectionCompleteTimers[bookId] = TimerManager.addTimer(0.5, function()
		self.collectionCompleteTimers[bookId] = nil

		if rootComponent then
			rootComponent:TryChangePage("Lock", 1)
		end
	end)
end

function RogueBookEnterCtrl:checkFirstCollectionComplete()
	if not pg.me or not pg.me.getRogueBookUnlockCount then
		return
	end

	local countData = pg.me:getRogueBookUnlockCount()
	local collectionData = {
		[RogueConst.BookTypeId.Buff] = {
			count = countData.buffCount or 0,
			total = countData.buffTotal or 0
		},
		[RogueConst.BookTypeId.Event] = {
			count = countData.eventCount or 0,
			total = countData.eventTotal or 0
		},
		[RogueConst.BookTypeId.Boss] = {
			count = countData.bossCount or 0,
			total = countData.bossTotal or 0
		}
	}

	for bookId, data in pairs(collectionData) do
		local isComplete = data.total > 0 and data.count >= data.total

		if isComplete then
			local recordKey = string.format(COLLECTION_COMPLETE_RECORD_KEY, bookId)
			local lastCompleteTotal = pg.me:getRedDotRecord(Const.CLIENT_KEY.ROGUE, recordKey, 0)

			if type(lastCompleteTotal) ~= "number" then
				lastCompleteTotal = 0
			end

			if lastCompleteTotal < data.total then
				local saved = pg.me:setRedDotRecord(Const.CLIENT_KEY.ROGUE, recordKey, data.total)

				if saved then
					self:onFirstCollectionComplete(bookId)
				end
			end
		end
	end
end

function RogueBookEnterCtrl:testFirstCollectionComplete()
	for bookId in pairs(self.bookRootComponentMap or {}) do
		self:onFirstCollectionComplete(bookId)
	end
end

function RogueBookEnterCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:checkFirstCollectionComplete()
end

function RogueBookEnterCtrl:onDestroy()
	for bookId, timerId in pairs(self.collectionCompleteTimers or {}) do
		TimerManager.removeTimer(timerId)

		self.collectionCompleteTimers[bookId] = nil
	end

	self.bookRootComponentMap = nil

	UICtrl.onDestroy(self)
end

return RogueBookEnterCtrl
