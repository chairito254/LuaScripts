-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBook\\RogueBookCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local RogueConst = require("Const.RogueConst")
local RedDotConst = require("Const.RedDotConst")
local BuffBookComponent = require("Guis.Panels.RogueBook.Component.BuffBookComponent")
local EventBookComponent = require("Guis.Panels.RogueBook.Component.EventBookComponent")
local BossBookComponent = require("Guis.Panels.RogueBook.Component.BossBookComponent")
local RogueBookCtrl = Class.LightClass("RogueBookCtrl", UICtrl)

function RogueBookCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function RogueBookCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.listTabUList.luaClick(button, data)
		self:onClickTab(data.tab)
	end

	function self.view.listBuffTypeUList.luaClick(button, data)
		ClientTextUtils.setText(self.view.textTopTitleUSDFText, pg.getLocalizationText(data.cfg.buffSeriesName))
		self:onClickBuffSeries(data.buffSeries)
	end
end

function RogueBookCtrl:initUI()
	self.buffComponent = BuffBookComponent.new(self)
	self.eventComponent = EventBookComponent.new(self, self.view.tabEventUContainer)
	self.bossComponent = BossBookComponent.new(self, self.view.tabBossUContainer)

	self:initTabList()
end

function RogueBookCtrl:initTabList()
	local titleData = {
		{
			tIndex = 0,
			label = pg.getLocalizationText(self.model:getBookConfig(RogueConst.BookTypeId.Buff).name),
			tab = RogueConst.BookTypeId.Buff
		},
		{
			tIndex = 1,
			label = pg.getLocalizationText(self.model:getBookConfig(RogueConst.BookTypeId.Event).name),
			tab = RogueConst.BookTypeId.Event
		},
		{
			tIndex = 2,
			label = pg.getGameString("ROGUE_BOOK_BOSS"),
			tab = RogueConst.BookTypeId.Boss
		}
	}

	function self.view.listTabUList.luaRenderItem(button, index, data)
		LuaUIUtils.renderTitleTab(button, index, data)

		local tabPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, data.tab)

		pg.global.setPreViewRedDot(tabPath, button, function()
			return self:checkBookCanGetReward(data.tab) and RedDotConst.RedDotStyle.REWARD or RedDotConst.RedDotStyle.NONE
		end)
	end

	self.view.listTabUList:SetList(titleData)

	self.redDotBookId = self.model:getBookId()

	local buffSeries = self.model:getBuffSeries()

	function self.view.listBuffTypeUList.luaRenderItem(button, index, data)
		button.gameObject.name = index

		local objectReference = button:GetComponent("ObjectReference")
		local iconUImage = objectReference:GetRefValue("iconUImage")
		local nameUBaseText = objectReference:GetRefValue("nameUBaseText")

		ClientTextUtils.setText(nameUBaseText, pg.getLocalizationText(data.cfg.buffSeriesName))

		iconUImage.url = data.cfg.buffSeriesIcon or ""

		button:ClearRedDot()
		self:registerGroupRedDot(button, self.redDotBookId, data.buffSeries)
	end

	self.view.listBuffTypeUList:SetList(buffSeries)
end

function RogueBookCtrl:refreshBuffSeriesRedDot(bookId)
	self.redDotBookId = bookId

	self.view.listBuffTypeUList:SetList(self.model:getBuffSeries())
end

function RogueBookCtrl:registerGroupRedDot(button, bookId, groupId)
	local groupPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, bookId, groupId)

	pg.global.setPreViewRedDot(groupPath, button, function()
		return self:checkGroupCanGetReward(bookId, groupId) and RedDotConst.RedDotStyle.REWARD or RedDotConst.RedDotStyle.NONE
	end)
end

function RogueBookCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	if info and info.bookId then
		self.model:setBookId(info.bookId)
	end

	self:initUI()

	self.bookId = self.model:getBookId()
	self.bigTabDefaultOpen = true

	self:openTab(self.bookId, true)
end

function RogueBookCtrl:onClickBuffSeries(buffSeries)
	self.bookId = self.model:getBookId()
	self.selectBuffSeries = buffSeries

	local bigTabDefaultOpen = self.bigTabDefaultOpen

	if self:isBuffTab() then
		self.buffComponent:changeSeries(buffSeries, bigTabDefaultOpen)
	elseif self:isTargetTab(RogueConst.BookTypeId.Boss) then
		self.bossComponent:changeSeries(buffSeries, bigTabDefaultOpen)
	end
end

function RogueBookCtrl:onClickTab(bookId)
	self.bigTabDefaultOpen = false

	self:openTab(bookId, false)
end

function RogueBookCtrl:getFirstRewardBuffSeries()
	local buffMap = self.model:getBuffMap()

	for _, seriesData in ipairs(self.model:getBuffSeries()) do
		local buffList = buffMap[seriesData.buffSeries] or {}

		for _, buffData in ipairs(buffList) do
			if pg.me and pg.me.checkCanGetRewardBuff and pg.me:checkCanGetRewardBuff(buffData.buffId) then
				return seriesData.buffSeries
			end
		end
	end

	return 0
end

function RogueBookCtrl:checkBuffSeriesCanGetReward(buffSeries)
	for _, buffData in ipairs(self.model:getBuffList(buffSeries)) do
		if pg.me and pg.me.checkCanGetRewardBuff and pg.me:checkCanGetRewardBuff(buffData.buffId) then
			return true
		end
	end

	return false
end

function RogueBookCtrl:checkEventTypeCanGetReward(eventTypeKey)
	local eventTypeKeyMap = self.model:getEventTypeKeyMap()

	for _, eventData in ipairs(eventTypeKeyMap[eventTypeKey] or {}) do
		if pg.me and pg.me.checkCanGetRewardEvent and pg.me:checkCanGetRewardEvent(eventData.eventType, eventData.eventIndex) then
			return true
		end
	end

	return false
end

function RogueBookCtrl:checkBossSeriesCanGetReward(buffSeries)
	local bossMap = self.model:GetBossMap()

	for _, bossData in ipairs(bossMap[buffSeries] and bossMap[buffSeries].bossList or {}) do
		if pg.me and pg.me.checkCanGetRewardBoss and pg.me:checkCanGetRewardBoss(bossData.buffSeries, bossData.bossIndex) then
			return true
		end
	end

	return false
end

function RogueBookCtrl:checkGroupCanGetReward(bookId, groupId)
	if bookId == RogueConst.BookTypeId.Buff then
		return self:checkBuffSeriesCanGetReward(groupId)
	elseif bookId == RogueConst.BookTypeId.Boss then
		return self:checkBossSeriesCanGetReward(groupId)
	elseif bookId == RogueConst.BookTypeId.Event then
		return self:checkEventTypeCanGetReward(groupId)
	end

	return false
end

function RogueBookCtrl:checkBookCanGetReward(bookId)
	if bookId == RogueConst.BookTypeId.Buff then
		for _, seriesData in ipairs(self.model:getBuffSeries()) do
			if self:checkBuffSeriesCanGetReward(seriesData.buffSeries) then
				return true
			end
		end
	elseif bookId == RogueConst.BookTypeId.Event then
		for eventTypeKey = 1, 3 do
			if self:checkEventTypeCanGetReward(eventTypeKey) then
				return true
			end
		end
	elseif bookId == RogueConst.BookTypeId.Boss then
		for _, seriesData in ipairs(self.model:getBuffSeries()) do
			if self:checkBossSeriesCanGetReward(seriesData.buffSeries) then
				return true
			end
		end
	end

	return false
end

function RogueBookCtrl:openTab(bookId, bigTabDefaultOpen)
	self.model:setBookId(bookId)

	if bookId == RogueConst.BookTypeId.Buff or bookId == RogueConst.BookTypeId.Boss then
		self:refreshBuffSeriesRedDot(bookId)
	end

	if bookId == RogueConst.BookTypeId.Event then
		self.view.rootComponent:TryChangePage("Tab", 1)
		self.view.listTabUList:SelectItem(1)
		self.eventComponent:openPanel(self.bigTabDefaultOpen)
	elseif bookId == RogueConst.BookTypeId.Boss then
		self.view.rootComponent:TryChangePage("Tab", 2)
		self.view.listTabUList:SelectItem(2)
		self.bossComponent:openPanel(self.bigTabDefaultOpen)
	else
		self.view.rootComponent:TryChangePage("Tab", 0)
		self.view.listTabUList:SelectItem(0)

		if bigTabDefaultOpen then
			self.selectBuffSeries = self:getFirstRewardBuffSeries()
		else
			self.selectBuffSeries = 0
		end

		self.view.listBuffTypeUList:SelectItem(self.selectBuffSeries)
		self.buffComponent:changeSeries(self.selectBuffSeries, self.bigTabDefaultOpen)
	end
end

function RogueBookCtrl:isBuffTab()
	local bookId = self.model:getBookId()

	return bookId == RogueConst.BookTypeId.Buff
end

function RogueBookCtrl:isTargetTab(targetTab)
	local bookId = self.model:getBookId()

	return bookId == targetTab
end

return RogueBookCtrl
