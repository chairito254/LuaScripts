-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenCollection\\EventHalloweenCollectionCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventHalloweenCollectionCtrl = Class.LightClass("EventHalloweenCollectionCtrl", UICtrl)

EventHalloweenCollectionCtrl.messages = {
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"onActivityDataChanged",
		true
	},
	[MessageName.EVENT_REFRESH_TAB_LIST] = {
		"onActivityDataChanged",
		true
	}
}

function EventHalloweenCollectionCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.rewardList.luaRenderItem(button, index, data)
		self:renderReward(button, index, data)
	end
end

function EventHalloweenCollectionCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.model:setEventId(info and info.eventId)
	self:refreshView()
end

function EventHalloweenCollectionCtrl:onActivityDataChanged()
	if self:checkUIClosing() then
		return
	end

	if not self.model:isActivityOpen() then
		self:close()

		return
	end

	self:refreshView()
end

function EventHalloweenCollectionCtrl:refreshView()
	local viewData = self.model:getViewData()

	ClientTextUtils.setText(self.view.titleUSDFText, viewData.titleText)
	ClientTextUtils.setText(self.view.curProgressUSDFText, viewData.progressText)
	ClientTextUtils.setText(self.view.progressTitleUSDFText, viewData.progressTitleText)
	ClientTextUtils.setText(self.view.tips1USDFText, pg.getGameString("HALLOWEEN_BOOK_UNLOCK_TIP_1"))
	ClientTextUtils.setText(self.view.tips2USDFText, pg.getGameString("HALLOWEEN_BOOK_UNLOCK_TIP_2"))
	self:refreshBadges(viewData)
	self.view.rewardList:SetList(viewData.rewardList)
end

function EventHalloweenCollectionCtrl:refreshBadges(viewData)
	for index = 1, self.model.ROOM_BADGE_COUNT do
		local roomButton = self.view["room" .. index .. "UButton"]

		roomButton:TryChangePage("Lock", viewData.roomUnlockMap[index] and 0 or 1)
	end

	for index = 1, self.model.PET_BADGE_COUNT do
		local petButton = self.view["pet" .. index .. "UButton"]

		petButton:TryChangePage("Lock", viewData.petCompleteMap[index] and 0 or 1)
	end
end

function EventHalloweenCollectionCtrl:renderReward(button, index, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local rewardItem = objectReference:GetRefValue("rewardItem")
	local progressNum = objectReference:GetRefValue("progressNum")
	local progress = objectReference:GetRefValue("progress")
	local renderData = self.model:getRewardRenderData(data)

	rewardItem:ClearRedDot()

	progress.maxValue = renderData.maxValue
	progress.value = renderData.value

	ClientTextUtils.setText(progressNum, renderData.targetText)
	button:TryChangePage("State", renderData.buttonState)

	local rewardData = renderData.rewardData

	rewardItem:SetActiveFastest(rewardData ~= nil)

	rewardItem.luaClick = nil

	if not rewardData then
		return
	end

	if renderData.canReceive then
		function rewardData.extraFunc()
			if self:checkUIClosing() or not self.model:isActivityOpen() then
				return
			end

			pg.me:reqActReceiveTaskReward(data.taskId, self.model:getEventId())
		end
	else
		rewardData.extraFunc = nil
	end

	LuaUIUtils.renderRewardItem(rewardItem, rewardData)
	pg.global.setRedDot(renderData.redDot.path, rewardItem, renderData.redDot.visible, renderData.redDot.style)
end

return EventHalloweenCollectionCtrl
