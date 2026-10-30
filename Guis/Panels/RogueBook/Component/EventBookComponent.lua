-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\RogueBook\\Component\\EventBookComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RedDotConst = require("Const.RedDotConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local RogueConst = require("Const.RogueConst")
local EventBookComponent = Class.LightClass("EventBookComponent", UIComponent)

EventBookComponent.messages = {
	[MessageName.ROGUE_BOOK_EVENT_STATE_UPDATE] = {
		"onRogueBookEventStateUpdate",
		true
	}
}

function EventBookComponent:onCtor(info)
	return
end

function EventBookComponent:markRewardRefresh()
	self.rewardRefreshMark = true

	if self.rewardRefreshExpireTimer then
		self.ctrl:killTimer(self.rewardRefreshExpireTimer)
	end

	self.rewardRefreshExpireTimer = self.ctrl:startTimer(function()
		self.rewardRefreshMark = false
		self.rewardRefreshExpireTimer = nil
	end, 1)
end

function EventBookComponent:resetRewardRefreshMark()
	self.rewardRefreshMark = false

	if self.rewardRefreshExpireTimer then
		self.ctrl:killTimer(self.rewardRefreshExpireTimer)

		self.rewardRefreshExpireTimer = nil
	end
end

function EventBookComponent:refreshGetRewardRedDot()
	if self.btnGetUButton then
		local canGet = self.ctrl:checkBookCanGetReward(RogueConst.BookTypeId.Event)

		self.btnGetUButton.interactable = canGet

		self.btnGetUButton:TryChangePage("button", canGet and 0 or 4)

		local path = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GET_REWARD, RogueConst.BookTypeId.Event)

		pg.global.setRedDot(path, self.btnGetUButton, canGet, RedDotConst.RedDotStyle.REWARD)

		local key = canGet and "ROGUE_BOOK_FAST_GET_REWARD" or "Rogue_Week_Get_Reward_Tips"

		ClientTextUtils.setText(self.btnUSDFText, pg.getGameString(key))
	end
end

function EventBookComponent:refreshCurrentBookRedDot(eventTypeKey)
	self:refreshGetRewardRedDot()

	if eventTypeKey ~= nil then
		pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, RogueConst.BookTypeId.Event, eventTypeKey))
	end

	pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, RogueConst.BookTypeId.Event))
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.TOWER_BOOK)
end

function EventBookComponent:refreshOtherBookRedDot()
	if self.rewardRefreshTimer then
		self.ctrl:killTimer(self.rewardRefreshTimer)
	end

	self.rewardRefreshTimer = self.ctrl:startTimer(function()
		for eventTypeKey = 1, 3 do
			pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP, RogueConst.BookTypeId.Event, eventTypeKey))
		end

		pg.global.refreshRedDotState(string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB, RogueConst.BookTypeId.Event))
		pg.global.refreshRedDotState(RedDotConst.RedDotPath.TOWER_BOOK)

		self.rewardRefreshTimer = nil
	end, 0.2)
end

function EventBookComponent:findObjects()
	if IsNil(self.transform) then
		return
	end

	if not self.eventPanelLoad then
		return
	end
end

function EventBookComponent:registerObjects()
	if IsNil(self.transform) then
		return
	end

	if not self.eventPanelLoad then
		return
	end

	local objectReference = self.uWidget.content:GetComponent("ObjectReference")

	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.listTabUList = objectReference:GetRefValue("listTabUList")
	self.picUImage = objectReference:GetRefValue("picUImage")
	self.panelRightUContainer = objectReference:GetRefValue("panelRightUContainer")
	self.vXMaskUImage = objectReference:GetRefValue("vXMaskUImage")
	self.vXLineInUImage = objectReference:GetRefValue("vXLineInUImage")
	self.vXBlueInUImage = objectReference:GetRefValue("vXBlueInUImage")

	self.panelRightUContainer:LoadDefaultUrlManually(function()
		self.isPanelRightLoaded = true

		self:registerRightObjects()
		self:initRightView()

		if self.showEventData then
			self:showEventDetail(self.showEventData)
		end
	end)
end

function EventBookComponent:registerRightObjects()
	local objectReference = self.panelRightUContainer.content:GetComponent("ObjectReference")

	self.rightRootComponent = objectReference:GetRefValue("rootComponent")
	self.txtTitleUBaseText = objectReference:GetRefValue("txtTitleUBaseText")
	self.btnGetUButton = objectReference:GetRefValue("btnGetUButton")
	self.btnUSDFText = objectReference:GetRefValue("btnUSDFText")
	self.listFirstPassUList = objectReference:GetRefValue("listFirstPassUList")
	self.panelDetail2RectTransform = objectReference:GetRefValue("panelDetail2RectTransform")
	self.textTagUSDFText = objectReference:GetRefValue("textTagUSDFText")
	self.eventUSDFText = objectReference:GetRefValue("eventUSDFText")
	self.scrollRect2RectTransform = objectReference:GetRefValue("scrollRect2RectTransform")
	self.detailDescUSDText = self.scrollRect2RectTransform:Find("View/Content"):GetComponent("USDFText")

	self.rightRootComponent:TryChangePage("Tab", 1)
	ClientTextUtils.setText(self.txtTitleUBaseText, pg.getGameString("ROGUE_BOOK_FIRST_REWARD"))
	self:refreshGetRewardRedDot()
end

function EventBookComponent:initView()
	if not self.eventPanelLoad then
		return
	end

	function self.listTabUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")

		if data.tIndex == 1 then
			local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
			local lockTextUSDFText = objectReference:GetRefValue("lockTextUSDFText")
			local isUnlock = pg.me:isEventUnlock(data.eventType, data.eventIndex)

			button:TryChangePage("status", isUnlock and 0 or 1)
			ClientTextUtils.setText(txtNameUSDFText, data.eventName)
			ClientTextUtils.setText(lockTextUSDFText, "???")

			local itemPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP_ITEM, RogueConst.BookTypeId.Event, data.eventTypeKey, data.bookEventId)

			pg.global.setRedDot(itemPath, button, pg.me and pg.me.checkCanGetRewardEvent and pg.me:checkCanGetRewardEvent(data.eventType, data.eventIndex), RedDotConst.RedDotStyle.REWARD)
		else
			local objectReference = button:GetComponent("ObjectReference")
			local texTitleUSDFText = objectReference:GetRefValue("texTitleUSDFText")
			local textTagUSDFText = objectReference:GetRefValue("textTagUSDFText")

			ClientTextUtils.setText(texTitleUSDFText, data.eventName)

			local count = self:getUnlockCountByEventTypeKey(data.eventTypeKey)

			ClientTextUtils.setText(textTagUSDFText, string.format("%d/%d", count, data.totalCount or 10))
		end
	end

	function self.listTabUList.luaClick(button, data, navItem)
		if data.bookEventId == nil then
			return
		end

		self:onClickEventItem(button, data)
	end
end

function EventBookComponent:initRightView()
	function self.listFirstPassUList.luaClick(button, data, navItem)
		local canGet = pg.me:checkCanGetRewardEvent(self.showEventData.eventType, self.showEventData.eventIndex)

		if canGet then
			if navItem then
				return
			end

			self:onClickEventReward(self.showEventData)
		else
			if data.tIndex == 1 then
				return
			end

			LuaUIUtils.onRewardItemClick(button, data, nil, navItem)
		end
	end

	function self.btnGetUButton.luaClick()
		self:onClickGetReward()
	end
end

function EventBookComponent:loadContainer(bigTabDefaultOpen)
	if self.uWidget:CheckURLLoaded() then
		self:showEventList(bigTabDefaultOpen)
		self.rootComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	else
		self.uWidget:LoadDefaultUrlManually(function()
			self.eventPanelLoad = true

			self:findObjects()
			self:registerObjects()
			self:initView()
			self:showEventList(bigTabDefaultOpen)
			self.rootComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
		end)
	end
end

function EventBookComponent:showEventDetail(eventData)
	self.showEventData = eventData

	if not self.isPanelRightLoaded then
		return
	end

	local isUnlock = pg.me:isEventUnlock(eventData.eventType, eventData.eventIndex)

	self.rootComponent:TryChangePage("Lock", isUnlock and 1 or 0)
	ClientTextUtils.setText(self.textTagUSDFText, eventData.tagTitle)

	if isUnlock then
		ClientTextUtils.setText(self.eventUSDFText, eventData.eventName)
		ClientTextUtils.setText(self.detailDescUSDText, eventData.eventDesc or "")
	else
		ClientTextUtils.setText(self.eventUSDFText, pg.getGameString("ROGUE_BOOK_EVENT_UNKNOW"))
		ClientTextUtils.setText(self.detailDescUSDText, "???")
	end

	local hasGot = pg.me:isEventRewardGot(eventData.eventType, eventData.eventIndex)

	LuaUIUtils.setRewardListByDropIdWithoutClick(self.listFirstPassUList, eventData.bookEventCfg.reward, 4, hasGot, nil, nil, nil, function(button, index, rewardData)
		self:setRewardItemRedDot(button, index, rewardData, eventData)
	end)

	self.picUImage.url = eventData.bookEventCfg.icon
	self.vXMaskUImage.url = eventData.bookEventCfg.icon
	self.vXLineInUImage.url = eventData.bookEventCfg.icon
	self.vXBlueInUImage.url = eventData.bookEventCfg.icon
end

function EventBookComponent:onClickEventItem(button, data)
	self:showEventDetail(data)
	self.rootComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
end

function EventBookComponent:onClickGetReward()
	if not pg.me:checkEventBookCanGetReward() then
		pg.global.ui.tips:showTextTip(pg.getGameString("ROGUE_BOOK_NO_REWARDS_TIPS"))

		return
	end

	self:markRewardRefresh()
	pg.me:getGroupAll(RogueConst.BookTypeId.Event)
end

function EventBookComponent:onClickEventReward(eventData)
	if not pg.me:checkCanGetRewardEvent(eventData.eventType, eventData.eventIndex) then
		pg.global.ui.tips:showTextTip(pg.getGameString("ROGUE_BOOK_NO_REWARDS_TIPS"))

		return
	end

	pg.me:getEventRewards(eventData.eventType, eventData.eventIndex)
end

function EventBookComponent:openPanel(bigTabDefaultOpen)
	self:resetRewardRefreshMark()
	self:loadContainer(bigTabDefaultOpen)
end

function EventBookComponent:showEventList(bigTabDefaultOpen)
	local eventList = self.model:GetShowEventList()

	self.eventList = eventList

	self.listTabUList:SetList(eventList)

	local defaultIndex = self:getDefaultSelectItemIndex(eventList, bigTabDefaultOpen)
	local defaultListIndex = defaultIndex - 1

	self.defaultEventListIndex = defaultListIndex

	self.listTabUList:SelectItem(defaultListIndex)
	self.listTabUList:GoToIndex(defaultListIndex, true)

	if pg.game.input:isUsingGamepad() then
		self:focusDefaultEventItem()
	end

	self.showEventData = eventList[defaultIndex]

	if self.isPanelRightLoaded then
		self:showEventDetail(self.showEventData)
	end

	self:refreshGetRewardRedDot()
end

function EventBookComponent:getUnlockCountByEventTypeKey(eventTypeKey)
	local count = 0

	for _, eventData in ipairs(self.model:getEventTypeKeyMap()[eventTypeKey] or {}) do
		if pg.me and pg.me.isEventUnlock and pg.me:isEventUnlock(eventData.eventType, eventData.eventIndex) then
			count = count + 1
		end
	end

	return count
end

function EventBookComponent:onRogueBookEventStateUpdate(data)
	self:refreshGetRewardRedDot()

	if not data then
		return
	end

	if self.rewardRefreshMark then
		if self.showEventData and self.showEventData.eventType then
			self:refreshCurrentBookRedDot(self.showEventData.eventTypeKey)
			self:showEventDetail(self.showEventData)
		end

		self:refreshOtherBookRedDot()
		self.listTabUList:RefreshList()

		return
	end

	self:refreshCurrentBookRedDot(self.showEventData and self.showEventData.eventTypeKey)

	if not self.eventList then
		return
	end

	local isTypeRefreshed = false

	for index, eventData in ipairs(self.eventList) do
		if eventData.eventType == data.eventType then
			isTypeRefreshed = true

			self.listTabUList:RefreshElement(index - 1)
		end
	end

	if isTypeRefreshed and self.showEventData and self.showEventData.eventType == data.eventType then
		self:showEventDetail(self.showEventData)
	end
end

function EventBookComponent:setRewardItemRedDot(button, index, rewardData, eventData)
	button:ClearRedDot()

	if rewardData.tIndex == 1 then
		return
	end

	local itemPath = string.format(RedDotConst.RedDotPath.TOWER_BOOK_TAB_GROUP_ITEM, RogueConst.BookTypeId.Event, eventData.eventTypeKey, eventData.bookEventId)

	pg.global.setRedDot(itemPath, button, pg.me:checkCanGetRewardEvent(eventData.eventType, eventData.eventIndex), RedDotConst.RedDotStyle.REWARD)
end

function EventBookComponent:checkCanGetRewardByEventTypeKey(eventTypeKey)
	for _, eventData in ipairs(self.model:getEventTypeKeyMap()[eventTypeKey] or {}) do
		if pg.me and pg.me.checkCanGetRewardEvent and pg.me:checkCanGetRewardEvent(eventData.eventType, eventData.eventIndex) then
			return true
		end
	end

	return false
end

function EventBookComponent:getDefaultSelectItemIndex(eventList, isFirst)
	local firstEventIndex

	for index, eventData in ipairs(eventList or {}) do
		if eventData.bookEventId ~= nil then
			firstEventIndex = firstEventIndex or index

			if isFirst and pg.me and pg.me.checkCanGetRewardEvent and pg.me:checkCanGetRewardEvent(eventData.eventType, eventData.eventIndex) then
				return index
			end
		end
	end

	return firstEventIndex or 1
end

function EventBookComponent:focusDefaultEventItem()
	if IsNil(self.transform) or IsNil(self.listTabUList) or not pg.game.input:isUsingGamepad() or not pg.global.navMgr then
		return
	end

	local hasDefaultItem, defaultItem = self.listTabUList:TryGetChildAt(self.defaultEventListIndex)

	if not hasDefaultItem then
		return
	end

	self.listTabUList:SetNavGroupDefaultItem(defaultItem)
	pg.global.navMgr:FocusItem(defaultItem, CS.XGUI.Navigation.FocusEntryMode.Restore)
end

return EventBookComponent
