-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingLimitedReward\\WorldRacingLimitedRewardCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("WorldRacingLimitedRewardCtrl")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local ActivityConst = require("Common.Const.ActivityConst")
local ActivityUtils = require("Common.Utils.ActivityUtils")
local TriggerConst = require("Common.Const.TriggerConst")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local RedDotConst = require("Const.RedDotConst")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Time = require("Core.Common.Time")
local Utils = require("Common.Utils.Utils")
local UIConst = require("Const.UIConst")
local ActivateTasksData = require("Data.activate_tasks_data")
local CustomTriggerData = require("Data.custom_trigger_data")
local EventTaskData = require("Data.event_task_data")
local ItemSourceData = require("Data.item_source_data")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local WorldRacingLimitedRewardCtrl = Class.LightClass("WorldRacingLimitedRewardCtrl", UICtrl)
local TITLE_TEXT_KEY = "OPEN_WORLD_RACING_LIMITED_REWARD"
local MODE_ORDER = {
	WorldRaceDungeonConst.MODE.SINGLE,
	WorldRaceDungeonConst.MODE.MULTI
}
local MODE_TEXT_KEYS = {
	[WorldRaceDungeonConst.MODE.SINGLE] = "OPEN_WORLD_RACING_SINGLE_MODE",
	[WorldRaceDungeonConst.MODE.MULTI] = "OPEN_WORLD_RACING_MULTI_MODE"
}
local PROGRESS_TASK_TYPES = {
	[ActivityConst.ActivityTaskSubType.WordRacingTask_SingleProgess] = true,
	[ActivityConst.ActivityTaskSubType.WordRacingTask_MultiProgess] = true
}
local COMPLEX_ARG_NONE = 0
local COMPLEX_ARG_RATING = 1
local COMPLEX_ARG_RANK = 2
local TRACK_TRIGGER_COMPLEX_ARGS = {
	[TriggerConst.TRIGGER_TARGET_TRACK_COMPLETE_RACE_COUNT] = COMPLEX_ARG_NONE,
	[TriggerConst.TRIGGER_TARGET_TRACK_RATING_COUNT] = COMPLEX_ARG_RATING,
	[TriggerConst.TRIGGER_TARGET_TRACK_SURPRISE_EVENT_COUNT] = COMPLEX_ARG_NONE,
	[TriggerConst.TRIGGER_TARGET_TRACK_TOP_RANK_COUNT] = COMPLEX_ARG_RANK,
	[TriggerConst.TRIGGER_TARGET_RACING_TRANS_THUNDER] = COMPLEX_ARG_NONE,
	[TriggerConst.TRIGGER_TARGET_SCENE_CONTROL_PET_ADD_BUFF] = COMPLEX_ARG_NONE
}
local STATE_PAGE_GO = 0
local STATE_PAGE_GOT = 1
local STATE_PAGE_GET = 2
local STATE_PAGE_LOCKED = 3
local STATE_SORT_PRIORITY = {
	[STATE_PAGE_GET] = 1,
	[STATE_PAGE_GO] = 2,
	[STATE_PAGE_LOCKED] = 3,
	[STATE_PAGE_GOT] = 4
}
local RATING_TEXTS = {
	[WorldRaceDungeonConst.SINGLE_RATING.S] = "S",
	[WorldRaceDungeonConst.SINGLE_RATING.A] = "A",
	[WorldRaceDungeonConst.SINGLE_RATING.B] = "B"
}

WorldRacingLimitedRewardCtrl.messages = {
	[MessageName.EVENT_CUR_PAGE_REFRESH] = {
		"refreshDataAndView",
		true
	},
	[MessageName.EVENT_TASK_STATE_CHANGE] = {
		"refreshDataAndView",
		true
	}
}

function WorldRacingLimitedRewardCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.eventId = info and info.eventId

	if not self.eventId then
		logger:error("onOpen: eventId is required")
		self:dismiss()

		return
	end

	self.selectedModeIndex = 1
	self.configErrorKey = nil

	ClientTextUtils.setText(self.view.titleUBaseText, pg.getGameString(TITLE_TEXT_KEY))
	self:refreshData()

	for index, modeData in ipairs(self.modeList) do
		if ClientActivityUtils.getWorldRaceRewardRedDotStyle(self.eventId, modeData.mode) == RedDotConst.RedDotStyle.REWARD then
			self.selectedModeIndex = index

			break
		end
	end

	self:refreshSelectedMode()
	self:killTimer(self.taskOpenStateTimerId)

	self.taskOpenStateTimerId = self:startTimer(function()
		self:refreshTaskOpenState()
	end, 1, true)
end

function WorldRacingLimitedRewardCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:dismiss()
	end

	function self.view.tabListUList.luaRenderItem(button, index, data)
		self:renderModeTab(button, data)
	end

	function self.view.taskListUList.luaRenderItem(button, index, data)
		self:renderTaskItem(button, data)
	end
end

function WorldRacingLimitedRewardCtrl:getComplexArgValue(complexArg)
	if complexArg == nil then
		return nil
	end

	return tonumber(complexArg) or tonumber(complexArg[1])
end

function WorldRacingLimitedRewardCtrl:getTrackName(trackId)
	local trackConfig = trackId and WorldRacingTrackData[trackId]

	return trackConfig and pg.getLocalizationText(trackConfig.name) or ""
end

function WorldRacingLimitedRewardCtrl:getComplexArgText(triggerInfo)
	local complexArgType = TRACK_TRIGGER_COMPLEX_ARGS[triggerInfo.trigger]

	if complexArgType == COMPLEX_ARG_RATING then
		return RATING_TEXTS[triggerInfo.complexValue] or ""
	end

	if complexArgType == COMPLEX_ARG_RANK then
		return triggerInfo.complexValue and tostring(triggerInfo.complexValue) or ""
	end

	return ""
end

function WorldRacingLimitedRewardCtrl:getTaskTriggerInfo(taskInfo, taskCfg)
	local conditionId = taskInfo.taskCondition
	local conditionCfg = conditionId and CustomTriggerData[conditionId]
	local condition = conditionCfg and conditionCfg.condition and conditionCfg.condition[1]

	if not condition then
		logger:error("getTaskTriggerInfo: table=custom_trigger_data, id=%s, field=condition[1], condition is missing, taskId=%s", tostring(conditionId), tostring(taskInfo.taskId))

		return nil
	end

	local trigger, trackId, complexArg = TriggerConst.getTriggerInfo(condition)

	if not trigger or not PROGRESS_TASK_TYPES[taskCfg.actSubTaskType] and TRACK_TRIGGER_COMPLEX_ARGS[trigger] == nil then
		logger:error("getTaskTriggerInfo: table=custom_trigger_data, id=%s, field=condition[1][1], unsupported trigger=%s, taskId=%s", tostring(conditionId), tostring(condition[TriggerConst.CUSTOM_TRIGGER_NAME_POS]), tostring(taskInfo.taskId))

		return nil
	end

	local targetCount = tonumber(condition[TriggerConst.CUSTOM_TRIGGER_NUM_POS])

	if not targetCount or targetCount <= 0 or targetCount % 1 ~= 0 then
		logger:error("getTaskTriggerInfo: table=custom_trigger_data, id=%s, field=condition[1][5], positive integer count is required, value=%s", tostring(conditionId), tostring(condition[TriggerConst.CUSTOM_TRIGGER_NUM_POS]))

		return nil
	end

	local complexValue

	if trigger == TriggerConst.TRIGGER_TARGET_SCENE_CONTROL_PET_ADD_BUFF then
		local sceneId = tonumber(trackId)

		trackId = taskCfg.param

		local trackConfig = trackId and WorldRacingTrackData[trackId]

		if not trackConfig then
			logger:error("getTaskTriggerInfo: table=event_task_data, id=%s, field=param, world_racing_track_data id=%s not found", tostring(taskInfo.taskId), tostring(trackId))

			return nil
		end

		if not sceneId or sceneId <= 0 or sceneId % 1 ~= 0 or sceneId ~= trackConfig.sceneId then
			logger:error("getTaskTriggerInfo: table=custom_trigger_data, id=%s, field=condition[1][2], positive integer sceneId matching the track is required, sceneId=%s, world_racing_track_data id=%s sceneId=%s", tostring(conditionId), tostring(sceneId), tostring(trackId), tostring(trackConfig.sceneId))

			return nil
		end

		complexValue = tonumber(complexArg)

		if not complexValue or complexValue <= 0 or complexValue % 1 ~= 0 then
			logger:error("getTaskTriggerInfo: table=custom_trigger_data, id=%s, field=condition[1][3], positive integer Buff id is required, value=%s", tostring(conditionId), tostring(complexArg))

			return nil
		end
	else
		complexValue = self:getComplexArgValue(complexArg)
	end

	return {
		trigger = trigger,
		trackId = trackId,
		complexValue = complexValue,
		targetCount = targetCount
	}
end

function WorldRacingLimitedRewardCtrl:getTaskProgress(taskInfo, taskCfg)
	local triggerMap = pg.me and pg.me.triggerMap

	if not triggerMap or not taskInfo.taskCondition then
		return 0, 0
	end

	local target = taskCfg.taskFinishCnt or taskInfo.triggerInfo and taskInfo.triggerInfo.targetCount or 0
	local progress = triggerMap:getConditionFinishCount(taskInfo.taskCondition, 1) or 0

	if taskInfo.taskState ~= ActivityConst.TaskState.UnFinished then
		progress = target
	end

	return progress, target
end

function WorldRacingLimitedRewardCtrl:getTaskDesText(taskInfo)
	local taskDes = pg.getLocalizationText(taskInfo.taskDes)

	if PROGRESS_TASK_TYPES[taskInfo.taskSubType] then
		return pg.getFormatText(taskDes, taskInfo.progress, taskInfo.target)
	end

	local triggerInfo = taskInfo.triggerInfo

	return pg.getFormatText(taskDes, taskInfo.target or triggerInfo.targetCount, self:getTrackName(triggerInfo.trackId), self:getComplexArgText(triggerInfo))
end

function WorldRacingLimitedRewardCtrl:getTaskOpenTime(taskInfo)
	local trackConfig = WorldRacingTrackData[taskInfo.trackId]

	if not trackConfig then
		logger:error("getTaskOpenTime: table=world_racing_track_data, id=%s, field=trackId, track not found, taskId=%s", tostring(taskInfo.trackId), tostring(taskInfo.taskId))

		return nil
	end

	local openTime = Utils.getConfigTimeOfArea(trackConfig, "trackStartTime")

	if type(openTime) ~= "number" or openTime <= 0 then
		logger:error("getTaskOpenTime: table=world_racing_track_data, id=%s, field=trackStartTime[%s], positive timestamp is required, taskId=%s", tostring(taskInfo.trackId), tostring(pg.me.serverArea), tostring(taskInfo.taskId))

		return nil
	end

	return openTime
end

function WorldRacingLimitedRewardCtrl:refreshData()
	local activateTaskCfg = ActivateTasksData[self.eventId]
	local taskGroupIds = activateTaskCfg and activateTaskCfg.foreverTaskGroup

	if not taskGroupIds or #taskGroupIds == 0 then
		logger:error("refreshData: foreverTaskGroup is missing, eventId=%s", tostring(self.eventId))

		self.modeList = {}

		return
	end

	local configErrors = {}
	local modeDataMap = {}

	for _, taskGroupId in ipairs(taskGroupIds) do
		for _, taskInfo in ipairs(ClientActivityUtils.getTaskInfoList(taskGroupId, true)) do
			local taskCfg = EventTaskData[taskInfo.taskId]
			local mode = taskCfg and ClientActivityUtils.WORLD_RACE_TASK_MODES[taskCfg.actSubTaskType]

			if taskCfg and not mode then
				configErrors[#configErrors + 1] = string.format("%s:subType=%s", tostring(taskInfo.taskId), tostring(taskCfg.actSubTaskType))
			elseif taskCfg then
				taskInfo.taskGroupId = taskGroupId
				taskInfo.taskSubType = taskCfg.actSubTaskType
				taskInfo.triggerInfo = self:getTaskTriggerInfo(taskInfo, taskCfg)

				if not taskInfo.triggerInfo then
					self.modeList = {}

					self:reportConfigErrors(configErrors)

					return
				end

				taskInfo.trackId = taskInfo.triggerInfo and taskInfo.triggerInfo.trackId

				if not PROGRESS_TASK_TYPES[taskInfo.taskSubType] then
					taskInfo.openTime = self:getTaskOpenTime(taskInfo)

					if not taskInfo.openTime then
						self.modeList = {}

						return
					end
				end

				taskInfo.progress, taskInfo.target = self:getTaskProgress(taskInfo, taskCfg)

				self:collectTaskConfigError(taskInfo, mode, configErrors)

				local modeData = modeDataMap[mode]

				if not modeData then
					modeData = {
						completedCount = 0,
						mode = mode,
						textKey = MODE_TEXT_KEYS[mode],
						taskList = {}
					}
					modeDataMap[mode] = modeData
				end

				if PROGRESS_TASK_TYPES[taskInfo.taskSubType] then
					modeData.progressTask = taskInfo
				else
					modeData.taskList[#modeData.taskList + 1] = taskInfo

					if taskInfo.taskState ~= ActivityConst.TaskState.UnFinished then
						modeData.completedCount = modeData.completedCount + 1
					end
				end
			end
		end
	end

	self.modeList = {}

	for _, mode in ipairs(MODE_ORDER) do
		local modeData = modeDataMap[mode]

		if modeData then
			modeData.taskCount = #modeData.taskList
			modeData.modeIndex = #self.modeList + 1
			self.modeList[#self.modeList + 1] = modeData
		end
	end

	if self.selectedModeIndex > #self.modeList then
		self.selectedModeIndex = 1
	end

	self:reportConfigErrors(configErrors)
end

function WorldRacingLimitedRewardCtrl:collectTaskConfigError(taskInfo, mode, configErrors)
	local taskId = tostring(taskInfo.taskId)
	local triggerInfo = taskInfo.triggerInfo

	if not ActivityUtils.getActTaskData(pg.me, taskInfo.taskId) then
		configErrors[#configErrors + 1] = string.format("%s:notAccepted", taskId)
	end

	if not triggerInfo then
		configErrors[#configErrors + 1] = string.format("%s:condition=%s", taskId, tostring(taskInfo.taskCondition))

		return
	end

	if PROGRESS_TASK_TYPES[taskInfo.taskSubType] then
		return
	end

	local complexArgType = TRACK_TRIGGER_COMPLEX_ARGS[triggerInfo.trigger]

	if complexArgType == nil then
		configErrors[#configErrors + 1] = string.format("%s:trigger=%s", taskId, tostring(triggerInfo.trigger))

		return
	end

	local trackConfig = triggerInfo.trackId and WorldRacingTrackData[triggerInfo.trackId]

	if not trackConfig or trackConfig.trackType ~= mode then
		configErrors[#configErrors + 1] = string.format("%s:trackId=%s", taskId, tostring(triggerInfo.trackId))
	end

	if complexArgType ~= COMPLEX_ARG_NONE and self:getComplexArgText(triggerInfo) == "" then
		configErrors[#configErrors + 1] = string.format("%s:complexArg=%s", taskId, tostring(triggerInfo.complexValue))
	end

	if not taskInfo.taskEvent and not taskInfo.sourceId then
		configErrors[#configErrors + 1] = string.format("%s:jump", taskId)
	end
end

function WorldRacingLimitedRewardCtrl:reportConfigErrors(configErrors)
	local errorKey = table.concat(configErrors, ",")

	if errorKey ~= "" and errorKey ~= self.configErrorKey then
		logger:error("refreshData: invalid task config, eventId=%s, errors=%s", tostring(self.eventId), errorKey)
	end

	self.configErrorKey = errorKey
end

function WorldRacingLimitedRewardCtrl:refreshDataAndView()
	if not self.eventId then
		return
	end

	self:refreshData()
	self:refreshSelectedMode()
end

function WorldRacingLimitedRewardCtrl:getTaskStatePage(taskInfo)
	if taskInfo.taskState == ActivityConst.TaskState.Finihed_CanRecv then
		return STATE_PAGE_GET
	end

	if taskInfo.taskState == ActivityConst.TaskState.UnFinished then
		return Time.secondCache < taskInfo.openTime and STATE_PAGE_LOCKED or STATE_PAGE_GO
	end

	return STATE_PAGE_GOT
end

function WorldRacingLimitedRewardCtrl:compareTaskOrder(a, b)
	local aPriority = STATE_SORT_PRIORITY[a.statePage]
	local bPriority = STATE_SORT_PRIORITY[b.statePage]

	if aPriority ~= bPriority then
		return aPriority < bPriority
	end

	if a.showIndex ~= b.showIndex then
		return a.showIndex < b.showIndex
	end

	return a.taskId < b.taskId
end

function WorldRacingLimitedRewardCtrl:refreshSelectedMode()
	local modeData = self.modeList[self.selectedModeIndex]

	if not modeData then
		self.view.tabListUList:SetList({})
		self.view.taskListUList:SetList({})
		self.view.summaryUButton:SetActive(false)

		return
	end

	for _, taskInfo in ipairs(modeData.taskList) do
		taskInfo.statePage = self:getTaskStatePage(taskInfo)
	end

	table.sort(modeData.taskList, function(a, b)
		return self:compareTaskOrder(a, b)
	end)
	self.view.tabListUList:SetList(self.modeList)
	self.view.taskListUList:SetList(modeData.taskList)
	self:refreshSummary(modeData.progressTask)
end

function WorldRacingLimitedRewardCtrl:refreshTaskLockTime(button, taskInfo)
	local objectReference = button:GetComponent("ObjectReference")
	local lockTimeUBaseText = objectReference:GetRefValue("lockTimeUBaseText")
	local remainTime = math.ceil(taskInfo.openTime - Time.secondCache)
	local timeText = LuaUIUtils.getCountDownString(remainTime, UIConst.TimeType.Short, true)

	ClientTextUtils.setText(lockTimeUBaseText, pg.getFormatText(pg.getGameString("CONDITION_LESS"), timeText) .. "\n" .. pg.getGameString("COMMODITY_STATE_LOCKED"))
end

function WorldRacingLimitedRewardCtrl:refreshTaskOpenState()
	local modeData = self.modeList[self.selectedModeIndex]

	if not modeData then
		return
	end

	for index, taskInfo in ipairs(modeData.taskList) do
		if taskInfo.statePage == STATE_PAGE_LOCKED then
			if Time.secondCache >= taskInfo.openTime then
				self:refreshSelectedMode()

				return
			end

			local found, button = self.view.taskListUList:TryGetChildAt(index - 1)

			if found then
				self:refreshTaskLockTime(button, taskInfo)
			end
		end
	end
end

function WorldRacingLimitedRewardCtrl:refreshSummary(taskInfo)
	self.view.summaryUButton:SetActive(taskInfo ~= nil)

	if not taskInfo then
		return
	end

	ClientTextUtils.setText(self.view.summaryTitleUBaseText, self:getTaskDesText(taskInfo))
	ClientTextUtils.setText(self.view.summaryProgressUBaseText, string.format("%d/%d", taskInfo.progress, taskInfo.target))

	self.view.summaryProgressUImage.fillAmount = taskInfo.target > 0 and math.min(taskInfo.progress / taskInfo.target, 1) or 0

	local received = taskInfo.taskState == ActivityConst.TaskState.Received or taskInfo.taskState == ActivityConst.TaskState.Received_SendMail
	local canReceive = taskInfo.taskState == ActivityConst.TaskState.Finihed_CanRecv
	local mode = self.modeList[self.selectedModeIndex].mode

	function self.view.summaryRewardListUList.luaRenderItem(button, index, data)
		LuaUIUtils.renderRewardItem(button, data)

		local treePath = string.format(RedDotConst.RedDotPath.EVENT_WORLD_RACING_PROGRESS_REWARD, self.eventId, mode, taskInfo.taskId, index)

		pg.global.setRedDot(treePath, button, canReceive, RedDotConst.RedDotStyle.REWARD)
	end

	self.view.summaryRewardListUList:SetList(LuaUIUtils.getRewardItemByDropId(taskInfo.taskAward, received, canReceive))

	self.view.summaryUButton.luaClick = nil

	if canReceive then
		function self.view.summaryUButton.luaClick()
			pg.me:reqActReceiveGroupTaskReward(taskInfo.taskGroupId, self.eventId)
		end
	end
end

function WorldRacingLimitedRewardCtrl:renderModeTab(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local nameUBaseText = objectReference:GetRefValue("txtNameUBaseText")
	local progressUBaseText = objectReference:GetRefValue("txtProgressUBaseText")

	ClientTextUtils.setText(nameUBaseText, pg.getGameString(data.textKey))
	ClientTextUtils.setText(progressUBaseText, string.format("%d/%d", data.completedCount, data.taskCount))

	local treePath = string.format(RedDotConst.RedDotPath.EVENT_WORLD_RACING_MODE_TAB, self.eventId, data.mode)

	pg.global.setPreViewRedDot(treePath, button, function()
		return ClientActivityUtils.getWorldRaceRewardRedDotStyle(self.eventId, data.mode)
	end)
	button:SetSelected(data.modeIndex == self.selectedModeIndex)

	function button.luaClick()
		if self.selectedModeIndex == data.modeIndex then
			return
		end

		self.selectedModeIndex = data.modeIndex

		self:refreshSelectedMode()
	end
end

function WorldRacingLimitedRewardCtrl:renderTaskItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local taskTitleUBaseText = objectReference:GetRefValue("txtTitleUBaseText")
	local rewardListUList = objectReference:GetRefValue("rewardListUList")
	local progressUBaseText = objectReference:GetRefValue("progressUBaseText")
	local progressUImage = objectReference:GetRefValue("progressUImage")
	local gotoObjectReference = objectReference:GetRefValue("gotoObjectReference")
	local receiveObjectReference = objectReference:GetRefValue("receiveObjectReference")
	local gotoUButton = gotoObjectReference:GetRefValue("uIBtn1stConfirmUButton")
	local gotoNameUBaseText = gotoObjectReference:GetRefValue("txtNameUText")
	local receiveUButton = receiveObjectReference:GetRefValue("uIBtn1stConfirmUButton")
	local receiveNameUBaseText = receiveObjectReference:GetRefValue("txtNameUText")

	ClientTextUtils.setText(taskTitleUBaseText, self:getTaskDesText(data))
	ClientTextUtils.setText(progressUBaseText, string.format("%d/%d", data.progress, data.target))
	ClientTextUtils.setText(gotoNameUBaseText, pg.getGameString("GOTO"))
	ClientTextUtils.setText(receiveNameUBaseText, pg.getGameString("BUTTON_NAME_2"))

	progressUImage.fillAmount = data.target > 0 and math.min(data.progress / data.target, 1) or 0

	local received = data.taskState == ActivityConst.TaskState.Received or data.taskState == ActivityConst.TaskState.Received_SendMail
	local canReceive = data.taskState == ActivityConst.TaskState.Finihed_CanRecv

	gotoUButton.luaClick = nil
	receiveUButton.luaClick = nil

	if canReceive then
		button:TryChangePage("State", STATE_PAGE_GET)

		function receiveUButton.luaClick()
			pg.me:reqActReceiveGroupTaskReward(data.taskGroupId, self.eventId)
		end
	elseif data.statePage == STATE_PAGE_LOCKED then
		button:TryChangePage("State", STATE_PAGE_LOCKED)
		self:refreshTaskLockTime(button, data)
	elseif data.taskState == ActivityConst.TaskState.UnFinished then
		button:TryChangePage("State", STATE_PAGE_GO)

		local canJump = data.sourceId ~= nil or data.taskEvent ~= nil

		gotoUButton.interactable = canJump
		gotoUButton.visualInteractable = canJump

		if canJump then
			function gotoUButton.luaClick()
				self:jumpToTask(data)
			end
		end
	else
		button:TryChangePage("State", STATE_PAGE_GOT)
	end

	function rewardListUList.luaRenderItem(rewardButton, index, rewardData)
		LuaUIUtils.renderRewardItem(rewardButton, rewardData)
	end

	rewardListUList:SetList(LuaUIUtils.getRewardItemByDropId(data.taskAward, received, canReceive))

	local mode = ClientActivityUtils.WORLD_RACE_TASK_MODES[data.taskSubType]
	local treePath = string.format(RedDotConst.RedDotPath.EVENT_WORLD_RACING_TASK, self.eventId, mode, data.taskId)

	pg.global.setRedDot(treePath, receiveUButton, canReceive, RedDotConst.RedDotStyle.REWARD)
end

function WorldRacingLimitedRewardCtrl:jumpToTask(taskInfo)
	if taskInfo.sourceId then
		local sourceData = ItemSourceData[taskInfo.sourceId]

		if not sourceData then
			logger:error("jumpToTask: ItemSourceData is missing, taskId=%s, sourceId=%s", tostring(taskInfo.taskId), tostring(taskInfo.sourceId))

			return
		end

		LuaUIUtils.clueSeek(sourceData)
		self:dismiss()
	elseif taskInfo.taskEvent then
		pg.me:doEvent(taskInfo.taskEvent)
		self:dismiss()
	else
		logger:error("jumpToTask: task event/sourceId is missing, taskId=%s", tostring(taskInfo.taskId))
	end
end

function WorldRacingLimitedRewardCtrl:onDestroy()
	self:killTimer(self.taskOpenStateTimerId)

	self.taskOpenStateTimerId = nil

	UICtrl.onDestroy(self)
end

return WorldRacingLimitedRewardCtrl
