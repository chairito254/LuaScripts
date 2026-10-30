-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Event\\Component\\AreaActivityComponent.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local EventContainerComponent = require("Guis.Panels.Event.Component.EventContainerComponent")
local RedDotConst = require("Const.RedDotConst")
local UIConst = require("Const.UIConst")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local Utils = require("Common.Utils.Utils")
local EventAreaActivityData = require("Data.event_area_activity_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local ActivityConst = require("Common.Const.ActivityConst")
local AreaActivityComponent = Class.LightClass("AreaActivityComponent", EventContainerComponent)

function AreaActivityComponent:findObjects()
	if not self:checkContentLoaded() then
		return
	end

	local objectReference = self.transform:GetChild(0):GetComponent("ObjectReference")

	self.taskEntrance1 = objectReference:GetRefValue("taskEntrance1")
	self.taskEntrance2 = objectReference:GetRefValue("taskEntrance2")
	self.taskEntrance3 = objectReference:GetRefValue("taskEntrance3")
	self.taskEntrance4 = objectReference:GetRefValue("taskEntrance4")
	self.taskEntranceRoot = objectReference:GetRefValue("taskEntranceRoot")
	self.btnGotoUButton = objectReference:GetRefValue("btnGotoUButton")
	self.activityLockUButton = objectReference:GetRefValue("activityLockUButton")
	self.lockInfoUButton = objectReference:GetRefValue("lockInfoUButton")
	self.txtLockUBaseText = objectReference:GetRefValue("txtLockUBaseText")
	self.rootWidget = objectReference:GetRefValue("rootWidget")
	self.eventTitleUContainer = objectReference:GetRefValue("eventTitleUContainer")
	self.eggUWidget = objectReference:GetRefValue("eggUWidget")
	self.eggDescTxt = objectReference:GetRefValue("eggDescTxt")
	self.eggUButton = objectReference:GetRefValue("eggUButton")
	self.btnSearchUButton = objectReference:GetRefValue("btnSearchUButton")
	self.rewardProgress = objectReference:GetRefValue("rewardProgress")
	self.rewardProgressText = objectReference:GetRefValue("rewardProgressText")
	self.pointProgressItem = objectReference:GetRefValue("pointProgressItem")
	self.pointHintItem = objectReference:GetRefValue("pointHintItem")
	self.rewardIcon = objectReference:GetRefValue("rewardIcon")
	self.moreRewardText = objectReference:GetRefValue("moreRewardText")
	self.rewardFx = objectReference:GetRefValue("rewardFx")
end

function AreaActivityComponent:addListener()
	function self.btnGotoUButton.luaClick()
		local areaTaskData = EventAreaActivityData[self.eventPhase]
		local eventId = areaTaskData.event

		if eventId then
			pg.global.showConfirmMsgRaw(pg.getGameString("PET_RESEARCH_TEXT1"), pg.getGameString("PET_RESEARCH_TEXT2"), function()
				pg.me:doEvent(eventId)
			end, nil)
		end
	end

	self.activityLockUButton.enabledTooltip = true
	self.activityLockUButton.luaRenderTooltip = CallbackHandler(self, "renderLockTooltip")
	self.lockInfoUButton.enabledTooltip = true
	self.lockInfoUButton.luaRenderTooltip = CallbackHandler(self, "renderLockTooltip")
	self.btnSearchUButton.interactable = true
	self.btnSearchUButton.luaClick = CallbackHandler(self, "openRewardPreview")

	function self.eggUButton.luaClick()
		local task = self.currentProgressRewardTask

		if not task then
			return
		end

		local taskState = ActivityUtils.getActTaskState(pg.me, task.taskId)

		if taskState == ActivityConst.TaskState.Finihed_CanRecv and not self.isLock then
			pg.me:reqActReceiveTaskReward(task.taskId, self.eventId)
		else
			local rewards = LuaUIUtils.getRewardItemByDropId(task.taskAward)
			local firstItem = rewards and rewards[1]

			if not firstItem then
				return
			end

			pg.global.ui:open(UIConst.UI_ID_COMMON_ITEM_TIP, {
				id = firstItem.id,
				num = firstItem.num,
				targetRect = self.eggUButton
			})
		end
	end
end

function AreaActivityComponent:renderLockTooltip(button, popup)
	LuaUIUtils.renderCommonSmallTip(popup, pg.getGameString("AREA_OPEN_CONDITION"), self.model:getEventLockInfo(self.eventId))
end

function AreaActivityComponent:openRewardPreview()
	pg.global.ui:open(UIConst.UI_ID_EVENT_AREA_ACTIVITY_REWARD, {
		eventPhase = self.eventPhase
	})
end

function AreaActivityComponent:onBeforeRefreshPage()
	EventContainerComponent.onBeforeRefreshPage(self)

	self.isLock = ActivityUtils.getOprActivityUnlockCond(self.eventId) == false
	self._cacheRemoveMap = self._cacheRemoveMap or {}
end

function AreaActivityComponent:onEnterPlayEvent()
	pg.game.audio:playEvent("SFX_UI_WaterArea_MoveIn")
end

function AreaActivityComponent:refreshPage()
	self.isLock = ActivityUtils.getOprActivityUnlockCond(self.eventId) == false

	local areaTaskData = EventAreaActivityData[self.eventPhase]
	local eventTimeCfg = Utils.getEventTimeConfig(self.eventId)
	local eventEndDayTime = eventTimeCfg and eventTimeCfg.tabEndDayTime

	self:setEventTitle(self.eventTitleUContainer, eventEndDayTime, pg.getLocalizationText(areaTaskData.trainTitle))
	self.rootWidget:TryChangePage("LevelRestrictions", self.isLock and "Lock" or "Unlock")
	ClientTextUtils.setText(self.txtLockUBaseText, pg.getGameString("AREA_UNABLE"))
	ClientTextUtils.setText(self.moreRewardText, pg.getGameString("AREA_MORE_PRIZE"))
	self:renderRootEntrance()

	for i = 1, #areaTaskData.petResearchTaskGroupId do
		self:renderSubEntrance(i)
	end

	self:renderRewardShow()
end

function AreaActivityComponent:renderRootEntrance()
	self:renderTaskEntrance(0)
end

function AreaActivityComponent:renderSubEntrance(index)
	self:renderTaskEntrance(index)
end

function AreaActivityComponent:onBeforeExitPage()
	if self.rewardCanReceive then
		self.eggUWidget:InvokeCallback(CS.XGUI.EInvokeTime.Custom2)
	end

	self.rewardCanReceive = nil

	self:clearCacheRemoveMap()
	self:refreshCommonNodeRedDot()
end

function AreaActivityComponent:clearCacheRemoveMap()
	for index, cacheType in pairs(self._cacheRemoveMap or EMPTY_TABLE) do
		self.model:setSubTaskPrefCache(self.eventId, index, cacheType == 2)
	end

	self._cacheRemoveMap = {}
end

function AreaActivityComponent:renderRewardShow()
	local tasks = self:getProgressRewardTasks()
	local currentTask = tasks[#tasks]

	for _, task in ipairs(tasks) do
		if task.taskState ~= ActivityConst.TaskState.Received and task.taskState ~= ActivityConst.TaskState.Received_SendMail then
			currentTask = task

			break
		end
	end

	self.currentProgressRewardTask = currentTask

	self.eggUWidget:SetActive(currentTask ~= nil)

	if not currentTask then
		return
	end

	local canReceive = not self.isLock and currentTask.taskState == ActivityConst.TaskState.Finihed_CanRecv
	local isReceived = currentTask.taskState == ActivityConst.TaskState.Received or currentTask.taskState == ActivityConst.TaskState.Received_SendMail
	local state = isReceived and "Claimed" or canReceive and "Recive" or "Normal"

	self.eggUButton:TryChangePage("State", state)
	self.rewardFx:SetActive(canReceive)

	if self.rewardCanReceive ~= canReceive then
		self.rewardCanReceive = canReceive

		self.eggUWidget:InvokeCallback(canReceive and CS.XGUI.EInvokeTime.Custom1 or CS.XGUI.EInvokeTime.Custom2)
	end

	self.rewardProgress.maxValue = currentTask.target > 0 and currentTask.target or 1
	self.rewardProgress.value = math.min(currentTask.progress, currentTask.target)

	local pointItemId = CustomTriggerData[currentTask.taskCondition].condition[1][2]

	for _, button in ipairs({
		self.pointProgressItem,
		self.pointHintItem
	}) do
		button:GetComponent("ObjectReference"):GetRefValue("itemIconUImage").url = LuaUIUtils.getIconByItemId(pointItemId)
		button.luaClick = CallbackHandler(self, "onPointItemClick", button, pointItemId)
	end

	ClientTextUtils.setText(self.rewardProgressText, string.format("%s %s/%s", pg.getGameString("AREA_GET"), currentTask.progress, currentTask.target))
	ClientTextUtils.setText(self.eggDescTxt, pg.getGameString("AREA_HINT"))

	local rewards = LuaUIUtils.getRewardItemByDropId(currentTask.taskAward)
	local firstItem = rewards and rewards[1]

	self.rewardIcon.url = firstItem and LuaUIUtils.getIconByItemId(firstItem.id) or ""

	pg.global.setRedDot(RedDotConst.RedDotPath.EVENT_AREA_ACTIVITY_PET_REWARD, self.eggUButton, canReceive, RedDotConst.RedDotStyle.REWARD)
end

function AreaActivityComponent:onPointItemClick(button, itemId, navConfirm)
	LuaUIUtils.onRewardItemClick(button, {
		id = itemId
	}, true, navConfirm)
end

function AreaActivityComponent:renderTaskEntrance(index)
	local button = index == 0 and self.taskEntranceRoot or self["taskEntrance" .. index]
	local data = EventAreaActivityData[self.eventPhase]
	local objectReference = button:GetComponent("ObjectReference")
	local scheduleUBaseText = objectReference:GetRefValue("scheduleUBaseText")
	local finishUBaseText = objectReference:GetRefValue("finishUBaseText")
	local entryNameText = objectReference:GetRefValue("entryNameText")
	local taskGroupId = index == 0 and data.islandTaskGroupId or data.petResearchTaskGroupId[index]
	local finishCnt, totalCnt = ActivityUtils.getActTaskNumByGroupId(nil, taskGroupId)
	local isOpen = not self.isLock
	local isCompleted = totalCnt > 0 and finishCnt == totalCnt

	button:TryChangePage("State", not isOpen and "Lock" or isCompleted and "Completed" or "InProgress")
	ClientTextUtils.setText(entryNameText, pg.getLocalizationText(data["entryName" .. index + 1]))
	ClientTextUtils.setText(scheduleUBaseText, string.format("%s/%s", finishCnt, totalCnt))
	ClientTextUtils.setText(finishUBaseText, pg.getGameString("AREA_FINISHED"))

	if index == 0 then
		objectReference:GetRefValue("islandUImage").url = data.islandMainImage
	else
		objectReference:GetRefValue("emoUImage").url = data["petImage" .. index]

		local fxRewardUWidget = objectReference:GetRefValue("fxRewardUWidget")
		local justFinish = isOpen and isCompleted and ClientActivityUtils.getAreaActivitySubTaskPrefCache(self.eventId, index, true) == 0

		fxRewardUWidget:SetActive(justFinish)

		if justFinish then
			self._cacheRemoveMap[index] = 2
		end
	end

	function button.luaClick()
		if not isOpen then
			pg.global.ui.tips:showTextTip(pg.getGameString("AREA_UNABLE"))

			return
		end

		self:clearCacheRemoveMap()
		pg.global.ui:enableVisibleWhitelistForDuration({
			UIConst.UI_ID_EVENT
		})
		pg.global.ui:open(UIConst.UI_ID_EVENT_AREA_ACTIVITY, {
			eventId = self.eventId,
			subTaskIndex = index,
			eventPhase = self.eventPhase,
			rootTask = index == 0,
			subTaskState = isCompleted and self.model.AREA_TASK_STATE.FINISH or self.model.AREA_TASK_STATE.OPEN
		})
	end

	local canReceive = isOpen and ClientActivityUtils.getCanGetRewardByTaskGroupId(taskGroupId)

	pg.global.setRedDot(string.format(RedDotConst.RedDotPath.EVENT_AREA_ACTIVITY_ENTRANCE, index), button, canReceive, RedDotConst.RedDotStyle.POINT)
end

function AreaActivityComponent:getProgressRewardTasks()
	local data = EventAreaActivityData[self.eventPhase]
	local tasks = ClientActivityUtils.getTaskInfoList(data.relatedTaskGroupId, true)
	local progress = 0

	for _, task in ipairs(tasks) do
		progress = math.max(progress, pg.me.triggerMap:getConditionFinishCount(task.taskCondition, 1))
		task.target = pg.me.triggerMap:getConditionTargetCount(task.taskCondition, 1)

		if task.taskState ~= ActivityConst.TaskState.UnFinished then
			progress = math.max(progress, task.target)
		end
	end

	for _, task in ipairs(tasks) do
		task.progress = progress
	end

	return tasks
end

return AreaActivityComponent
