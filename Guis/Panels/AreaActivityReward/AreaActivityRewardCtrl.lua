-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AreaActivityReward\\AreaActivityRewardCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local CallbackHandler = require("Core.Common.CallbackHandler")
local MessageName = require("Const.MessageName")
local ActivityConst = require("Common.Const.ActivityConst")
local CustomTriggerData = require("Data.custom_trigger_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local AreaActivityRewardCtrl = Class.LightClass("AreaActivityRewardCtrl", UICtrl)

AreaActivityRewardCtrl.messages = {
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"refreshUI",
		true
	}
}

function AreaActivityRewardCtrl:addListener()
	self.view.btnCloseUButton.luaClick = CallbackHandler(self, "dismiss")
	self.view.closeIconUButton.luaClick = CallbackHandler(self, "dismiss")
	self.view.rewardList.luaRenderItem = CallbackHandler(self, "renderRewardItem")
end

function AreaActivityRewardCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.eventPhase = info.eventPhase

	self:refreshUI()
end

function AreaActivityRewardCtrl:refreshUI()
	ClientTextUtils.setText(self.view.titleText, pg.getGameString("AREA_PRIZE_OVERVIEW"))
	self.view.rewardList:SetList(self.model:getRewardTasks(self.eventPhase))
end

function AreaActivityRewardCtrl:renderRewardItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local progressText = objectReference:GetRefValue("progressText")
	local rewardItem = objectReference:GetRefValue("rewardItem"):GetComponent("UButton")
	local pointItem = objectReference:GetRefValue("pointItem")
	local pointItemId = CustomTriggerData[data.taskCondition].condition[1][2]

	pointItem:GetComponent("ObjectReference"):GetRefValue("itemIconUImage").url = LuaUIUtils.getIconByItemId(pointItemId)
	pointItem.luaClick = CallbackHandler(self, "onPointItemClick", pointItem, pointItemId)

	ClientTextUtils.setText(progressText, string.format("%s %s/%s", pg.getGameString("AREA_GET"), data.progress, data.target))

	local isReceived = data.taskState == ActivityConst.TaskState.Received or data.taskState == ActivityConst.TaskState.Received_SendMail
	local canReceive = data.taskState == ActivityConst.TaskState.Finihed_CanRecv
	local rewards = LuaUIUtils.getRewardItemByDropId(data.taskAward, isReceived, canReceive)
	local firstItem = rewards[1]

	rewardItem:SetActive(firstItem ~= nil)

	if firstItem then
		LuaUIUtils.renderRewards(rewardItem, 0, firstItem, true)

		rewardItem.enabledTooltip = false
	end
end

function AreaActivityRewardCtrl:onPointItemClick(button, itemId, navConfirm)
	LuaUIUtils.onRewardItemClick(button, {
		id = itemId
	}, true, navConfirm)
end

return AreaActivityRewardCtrl
