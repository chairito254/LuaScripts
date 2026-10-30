-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\AreaActivity\\AreaActivityCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("AreaActivityCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local ActivityConst = require("Common.Const.ActivityConst")
local EventAreaActivityData = require("Data.event_area_activity_data")
local EventTaskData = require("Data.event_task_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local RedDotConst = require("Const.RedDotConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local Time = require("Core.Common.Time")
local UIConst = require("Const.UIConst")
local Utils = require("Common.Utils.Utils")
local ItemSourceData = require("Data.item_source_data")
local AreaActivityCtrl = Class.LightClass("AreaActivityCtrl", UICtrl)

AreaActivityCtrl.messages = {
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"onRefreshUI",
		true
	},
	[MessageName.EVENT_REFRESH_TAB_LIST] = {
		"onRefreshUI",
		true
	},
	[MessageName.PLAYER_ONTELEPORT] = {
		"onPlayerTeleport",
		true
	}
}

function AreaActivityCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function AreaActivityCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnInfoUButton.luaClick()
		return
	end

	self.view.nextUButton.luaClick = CallbackHandler(self, "switchTaskGroup", 1)
	self.view.previousUButton.luaClick = CallbackHandler(self, "switchTaskGroup", -1)
	self.view.taskUList.luaRenderItem = CallbackHandler(self, "renderTaskItem")
	self.view.taskUList.luaFinishLayout = CallbackHandler(self, "onTaskListFinishLayout")

	function self.view.btnGotoUButton.luaClick()
		local areaTaskData = EventAreaActivityData[self.eventPhase]
		local eventId = areaTaskData.event

		if eventId then
			pg.global.showConfirmMsgRaw(pg.getGameString("PET_RESEARCH_TEXT1"), pg.getGameString("PET_RESEARCH_TEXT2"), function()
				pg.me:doEvent(eventId)
			end, nil)
		end
	end

	function self.view.getAllBtn.luaClick()
		pg.me:reqActReceiveGroupTaskReward(self.taskGroupId, self.eventId)
	end
end

function AreaActivityCtrl:onDestroy()
	self:_cancelUnlockTick()
	UICtrl.onDestroy(self)
end

function AreaActivityCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.eventId = info.eventId
	self.eventPhase = info.eventPhase
	self.rootTask = info.rootTask
	self.subTaskIndex = info.subTaskIndex
	self.subTaskState = info.subTaskState

	local data = EventAreaActivityData[self.eventPhase]

	if self.rootTask then
		self.taskGroupId = data.islandTaskGroupId
		self.subTaskIndex = 0
	else
		self.taskGroupId = data.petResearchTaskGroupId[self.subTaskIndex]
	end

	self.view.rootAnimation.playAutomatically = false

	if self._hideEventTimer then
		self:killTimer(self._hideEventTimer)

		self._hideEventTimer = nil
	end

	self._hideEventTimer = self:startTimer(function()
		self._hideEventTimer = nil

		pg.global.ui.event:hide()
	end, 0.5)

	self:refreshUI()
end

function AreaActivityCtrl:onShow()
	pg.game.audio:playEvent("SFX_UI_WaterArea_TaskMoveIn")
	self:refreshUI()
end

function AreaActivityCtrl:onHide()
	self._focusFirstTask = nil

	self:_cancelUnlockTick()

	if self._hideEventTimer then
		self:killTimer(self._hideEventTimer)

		self._hideEventTimer = nil
	end

	pg.global.ui.event:show()
end

function AreaActivityCtrl:onVisibleChange(visible)
	if visible then
		self:refreshUI()
	else
		self:_cancelUnlockTick()
	end
end

function AreaActivityCtrl:refreshUI()
	local areaTaskData = EventAreaActivityData[self.eventPhase]

	if not areaTaskData then
		return
	end

	self.view.bigBubbleUWidget:TryChangePage("Type", self.subTaskIndex == 0 and "Island" or "Emo")

	local getAllBtnTxt = self.view.getAllBtn:GetComponent("ObjectReference"):GetRefValue("txtNameUText")

	ClientTextUtils.setText(getAllBtnTxt, pg.getGameString("PET_RESEARCH_GET_REWARD_ALL"))
	self.view.titleTxt:SetActive(true)
	ClientTextUtils.setText(self.view.titleTxt, pg.getLocalizationText(self.subTaskIndex == 0 and areaTaskData.islandTitle or areaTaskData.petResearchTitle[self.subTaskIndex]))
	self.view.bigBubbleDownTxt:SetActive(false)

	if self.subTaskIndex == 0 then
		self.view.lslandsUImage.url = areaTaskData.islandImage
	else
		self.view.emoUImage.url = areaTaskData["petMainImage" .. self.subTaskIndex]
	end

	local tempTaskList = ClientActivityUtils.getTaskInfoList(self.taskGroupId)
	local taskList = {}

	for taskIdx = 1, #tempTaskList, 2 do
		taskList[#taskList + 1] = {
			taskData = {
				tempTaskList[taskIdx],
				tempTaskList[taskIdx + 1]
			}
		}
	end

	self.view.taskUList:SetList(taskList)
	self:_refreshGetAllBtnVisible()
	self:_refreshSideBtnVisible()
	self:_cancelUnlockTick()

	self._unlockTickDelay = nil

	local now = Time.secondCache

	for _, t in ipairs(tempTaskList) do
		local cfg = EventTaskData[t.taskId]
		local taskStartTime = Utils.getConfigTimeOfArea(cfg, "taskStartDayTime")

		if taskStartTime and now < taskStartTime then
			self._unlockTickDelay = math.min(self._unlockTickDelay or 60, taskStartTime - now)
		end
	end

	if self._unlockTickDelay then
		self:_scheduleUnlockTick()
	end
end

function AreaActivityCtrl:renderTaskItem(button, index, outerData)
	local innerData = outerData.taskData

	button:TryChangePage("Quantity", #innerData == 2 and "Two" or "One")

	local outerObjectReference = button:GetComponent("ObjectReference")

	for i = 1, #innerData do
		local taskBtn = outerObjectReference:GetRefValue("task" .. i .. "UButton")

		if taskBtn then
			local data = innerData[i]
			local objectReference = taskBtn:GetComponent("ObjectReference")
			local goUButton = objectReference:GetRefValue("goUButton")
			local receiveUButton = objectReference:GetRefValue("receiveUButton")
			local describeUBaseText = objectReference:GetRefValue("describeUBaseText")
			local progressUBaseText = objectReference:GetRefValue("progressUBaseText")
			local listRewardUList = objectReference:GetRefValue("listRewardUList")
			local aniWidget = objectReference:GetRefValue("aniWidget")

			listRewardUList.luaRenderItem = CallbackHandler(self, "renderTaskRewardItem")

			aniWidget:SetActiveQuickly(false)

			local taskId = data.taskId
			local taskState = data.taskState
			local received = taskState == ActivityConst.TaskState.Received or taskState == ActivityConst.TaskState.Received_SendMail
			local cfg = EventTaskData[taskId]
			local nowSec = Time.secondCache
			local taskStartTime = Utils.getConfigTimeOfArea(cfg, "taskStartDayTime")
			local locked = taskStartTime and nowSec < taskStartTime

			if locked then
				taskBtn:TryChangePage("TaskState", 3)

				local unlockTimeUBaseText = objectReference:GetRefValue("lockUBaseText")
				local countDownUCountDown = objectReference:GetRefValue("countDownUCountDown")

				ClientTextUtils.setText(unlockTimeUBaseText, pg.getGameString("ACCESSORY_UNLOCK"))
				LuaUIUtils.setCountDownTime(countDownUCountDown, taskStartTime, UIConst.TimeType.Short)
			elseif not taskState or taskState == ActivityConst.TaskState.UnFinished then
				taskBtn:TryChangePage("TaskState", 0)
			elseif taskState == ActivityConst.TaskState.Finihed_CanRecv then
				taskBtn:TryChangePage("TaskState", 1)
			elseif received then
				taskBtn:TryChangePage("TaskState", 2)
			end

			local canReceive = not locked and taskState == ActivityConst.TaskState.Finihed_CanRecv
			local rewards = LuaUIUtils.getRewardItemByDropId(data.taskAward, received, canReceive)

			listRewardUList:SetList(rewards)

			local curCnt = pg.me.triggerMap:getConditionFinishCount(data.taskCondition, 1)
			local finishCnt = pg.me.triggerMap:getConditionTargetCount(data.taskCondition, 1)

			if cfg.taskFinishCnt then
				finishCnt = cfg.taskFinishCnt
			end

			if taskState == ActivityConst.TaskState.Finihed_CanRecv or received then
				curCnt = finishCnt
			end

			local note = CustomTriggerData[data.taskCondition].note or data.taskDes

			ClientTextUtils.setText(describeUBaseText, pg.getFormatText(pg.getLocalizationText(note), curCnt, finishCnt))
			ClientTextUtils.setText(progressUBaseText, self.subTaskIndex == 0 and "" or string.format("%s/%s", curCnt, finishCnt))

			local goBtnTxt = goUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")

			ClientTextUtils.setText(goBtnTxt, pg.getGameString("PET_RESEARCH_HELP_TIP"))

			local receBtnTxt = receiveUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")

			ClientTextUtils.setText(receBtnTxt, pg.getGameString("PET_RESEARCH_GET_REWARD"))
			goUButton:SetActive(data.taskEvent ~= nil or cfg.sourceId ~= nil)

			goUButton.luaClick = CallbackHandler(self, "onGoTask", taskId)

			local treePath = string.format(RedDotConst.RedDotPath.EVENT_AREA_ACTIVITY_TASK_REWARD, taskId)

			pg.global.setRedDot(treePath, receiveUButton, canReceive, RedDotConst.RedDotStyle.POINT)

			receiveUButton.luaClick = CallbackHandler(self, "onReceiveTask", taskId)
		end
	end
end

function AreaActivityCtrl:_refreshGetAllBtnVisible()
	local getAllVisible = self:hasReceivableTask(self.taskGroupId)

	self.view.getAllBtn:SetActive(getAllVisible)
	pg.global.setRedDot(RedDotConst.RedDotPath.EVENT_AREA_ACTIVITY_GET_ALL_REWARD, self.view.getAllBtn, getAllVisible, RedDotConst.RedDotStyle.POINT)
end

function AreaActivityCtrl:_refreshSideBtnVisible()
	local areaTaskData = EventAreaActivityData[self.eventPhase]
	local available, targetIndex = self.model:getNextSubTaskIndex(self.eventPhase, self.subTaskIndex, -1)

	self.view.nextUButton:SetActive(available)
	self.view.previousUButton:SetActive(available)

	local taskGroupId = targetIndex == 0 and areaTaskData.islandTaskGroupId or areaTaskData.petResearchTaskGroupId[targetIndex]
	local leftBtnRewardShow = available and self:hasReceivableTask(taskGroupId)

	available, targetIndex = self.model:getNextSubTaskIndex(self.eventPhase, self.subTaskIndex, 1)
	taskGroupId = targetIndex == 0 and areaTaskData.islandTaskGroupId or areaTaskData.petResearchTaskGroupId[targetIndex]

	local rightBtnRewardShow = available and self:hasReceivableTask(taskGroupId)

	pg.global.setRedDot(RedDotConst.RedDotPath.EVENT_AREA_ACTIVITY_LEFT_BTN_REWARD, self.view.previousUButton, leftBtnRewardShow, RedDotConst.RedDotStyle.POINT)
	pg.global.setRedDot(RedDotConst.RedDotPath.EVENT_AREA_ACTIVITY_RIGHT_BTN_REWARD, self.view.nextUButton, rightBtnRewardShow, RedDotConst.RedDotStyle.POINT)
end

function AreaActivityCtrl:onRefreshUI()
	self:refreshUI()
end

function AreaActivityCtrl:onPlayerTeleport()
	self:dismiss()
end

function AreaActivityCtrl:_scheduleUnlockTick()
	self._unlockTimer = self:startTimer(CallbackHandler(self, "_onUnlockTick"), self._unlockTickDelay)
end

function AreaActivityCtrl:_onUnlockTick()
	self._unlockTimer = nil

	self:refreshUI()
end

function AreaActivityCtrl:_cancelUnlockTick()
	if self._unlockTimer then
		self:killTimer(self._unlockTimer)

		self._unlockTimer = nil
	end
end

function AreaActivityCtrl:switchTaskGroup(direction)
	local available, targetIndex = self.model:getNextSubTaskIndex(self.eventPhase, self.subTaskIndex, direction)

	if not available then
		return
	end

	self.view.taskUList.luaPreInterval = 0
	self.subTaskIndex = targetIndex
	self.subTaskState = nil

	local data = EventAreaActivityData[self.eventPhase]

	self.taskGroupId = targetIndex == 0 and data.islandTaskGroupId or data.petResearchTaskGroupId[targetIndex]
	self._focusFirstTask = pg.game.input:isUsingGamepad()

	self:refreshUI()
	self.view.taskUList:GoToIndex(0, false)
	UIUtils.PlayAnimation(self.view.rootAnimation, "VX_Ani_Pb_Event_WaterArea_TaskList_Switch")
end

function AreaActivityCtrl:onTaskListFinishLayout()
	if not self._focusFirstTask then
		return
	end

	local found, row = self.view.taskUList:TryGetChildAt(0)

	if not found then
		return
	end

	local taskButton = row:GetComponent("ObjectReference"):GetRefValue("task1UButton")

	self.view.taskUList:SetNavGroupDefaultItem(taskButton)

	if pg.global.navMgr:FocusItem(taskButton, CS.XGUI.Navigation.FocusEntryMode.Restore) then
		self._focusFirstTask = nil
	end
end

function AreaActivityCtrl:renderTaskRewardItem(button, index, data)
	LuaUIUtils.renderRewardItem(button, data)
end

function AreaActivityCtrl:onGoTask(taskId)
	local data = EventTaskData[taskId]

	if data.sourceId then
		LuaUIUtils.clueSeek(ItemSourceData[data.sourceId])
	elseif data.event then
		pg.me:doEvent(data.event)
	end
end

function AreaActivityCtrl:onReceiveTask(taskId)
	pg.me:reqActReceiveTaskReward(taskId, self.eventId)
end

function AreaActivityCtrl:hasReceivableTask(taskGroupId)
	for _, taskId in ipairs(ActivityUtils.getActTaskIdsByGroupId(taskGroupId)) do
		local taskStartTime = Utils.getConfigTimeOfArea(EventTaskData[taskId], "taskStartDayTime")

		if (not taskStartTime or taskStartTime <= Time.secondCache) and ClientActivityUtils.getCanGetRewardByTaskId(taskId) then
			return true
		end
	end

	return false
end

return AreaActivityCtrl
