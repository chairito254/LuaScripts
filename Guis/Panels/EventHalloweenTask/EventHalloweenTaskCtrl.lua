-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\EventHalloweenTask\\EventHalloweenTaskCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventHalloweenTaskCtrl = Class.LightClass("EventHalloweenTaskCtrl", UICtrl)

EventHalloweenTaskCtrl.messages = {
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"onTaskDataChanged",
		true
	},
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"onTaskDataChanged",
		true
	},
	[MessageName.NOTIFY_ACTIVITY_DAY_UPDATED] = {
		"onTaskDataChanged",
		true
	},
	[MessageName.EVENT_REFRESH_TAB_LIST] = {
		"onTaskDataChanged",
		true
	}
}

function EventHalloweenTaskCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.model:setEventId(info and info.eventId)
	ClientTextUtils.setText(self.view.titleUSDFText, pg.getGameString("HALLOWEEN_DAILY_TASK"))
	self:refreshTaskList()
end

function EventHalloweenTaskCtrl:addListener()
	function self.view.closeUButton.luaClick()
		self:dismiss()
	end

	function self.view.taskList.luaRenderItem(button, index, data)
		self:renderTask(button, index, data)
	end
end

function EventHalloweenTaskCtrl:onTaskDataChanged()
	if self:checkUIClosing() then
		return
	end

	if not self.model:isActivityOpen() then
		self:close()

		return
	end

	self:refreshTaskList()
end

function EventHalloweenTaskCtrl:refreshTaskList()
	self.view.taskList:SetList(self.model:getDailyTaskList())
end

function EventHalloweenTaskCtrl:renderTask(button, index, data)
	if not button or not data then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local numUBaseText = objectReference:GetRefValue("numUBaseText")
	local btnGoUButton = objectReference:GetRefValue("btnGoUButton")
	local btnGetUButton = objectReference:GetRefValue("btnGetUButton")
	local listUList = objectReference:GetRefValue("listUList")

	btnGetUButton:ClearRedDot()

	local goRef = btnGoUButton:GetComponent("ObjectReference")
	local goTxt = goRef and goRef:GetRefValue("txtNameUText")

	if goTxt then
		ClientTextUtils.setText(goTxt, pg.getGameString("BUTTON_NAME_1"))
	end

	local getRef = btnGetUButton:GetComponent("ObjectReference")
	local getTxt = getRef and getRef:GetRefValue("txtNameUText")

	if getTxt then
		ClientTextUtils.setText(getTxt, pg.getGameString("BUTTON_NAME_2"))
	end

	ClientTextUtils.setText(txtNameUBaseText, data.descriptionText)
	ClientTextUtils.setText(numUBaseText, data.progressText)
	button:TryChangePage("state", data.statePage)

	function listUList.luaRenderItem(rewardButton, rewardIndex, rewardData)
		LuaUIUtils.renderRewardItem(rewardButton, rewardData)
	end

	listUList:SetList(data.rewardList)

	btnGoUButton.luaClick = nil
	btnGetUButton.luaClick = nil

	if data.canGo then
		function btnGoUButton.luaClick()
			LuaUIUtils.clueSeek(data.sourceData, nil, nil, data.sourceId)
		end
	elseif data.canReceive then
		function btnGetUButton.luaClick()
			if self:checkUIClosing() or not self.model:isActivityOpen() then
				return
			end

			pg.me:reqActReceiveTaskReward(data.taskId, self.model:getEventId())
		end
	end

	pg.global.setRedDot(data.redDot.path, btnGetUButton, data.redDot.visible, data.redDot.style)
end

return EventHalloweenTaskCtrl
