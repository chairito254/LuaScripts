-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Event\\Component\\SignFourteenDayComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ActivityConst = require("Common.Const.ActivityConst")
local UIUtils = CS.FunPlus.WorldX.Utils.UIUtils
local SignFourteenDayComponent = Class.LightClass("SignFourteenDayComponent", UIComponent)

function SignFourteenDayComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.listUList = objectReference:GetRefValue("listUList")
	self.btnRightUButton = objectReference:GetRefValue("btnRightUButton")
	self.btnLeftUButton = objectReference:GetRefValue("btnLeftUButton")
	self.exTimeText = objectReference:GetRefValue("exTimeText")
	self.txtTime = objectReference:GetRefValue("txtTime")
	self.txtInfo = objectReference:GetRefValue("txtInfo")
	self.imgExIcon = objectReference:GetRefValue("imgExIcon")
	self.btnExIcon = objectReference:GetRefValue("btnExIcon")
	self.vXDateAnimation = objectReference:GetRefValue("vXDateAnimation")
	self.vXDateUComponent = objectReference:GetRefValue("vXDateUComponent")
end

function SignFourteenDayComponent:onCtor(info)
	self.eventId = info.eventId

	local signData = self.model:getSignData(self.eventId)

	self.curDay = signData and signData.totalSignNum or 1
end

function SignFourteenDayComponent:initView()
	self:addListener()
	self:refreshPage()
end

function SignFourteenDayComponent:addListener()
	function self.listUList.luaRenderItem(button, index, data)
		self:renderSignItem(button, index, data)
	end

	function self.listUList.luaFinishRender()
		self:scheduleEnterRewardPosition()
		self:refreshConsoleBarState()
	end

	function self.listUList.luaAsyncLoadComplete()
		if self.asyncEnterLocateSerial ~= nil then
			self.enterLocateSerial = self.asyncEnterLocateSerial
			self.asyncEnterLocateSerial = nil

			self:scheduleEnterRewardPosition()
		end

		self:refreshConsoleBarState()
	end

	function self.btnLeftUButton.luaClick()
		self:switchExShowSign(-1)
	end

	function self.btnRightUButton.luaClick()
		self:switchExShowSign(1)
	end

	if self.btnExIcon then
		function self.btnExIcon.luaClick()
			local signCfg = self.exShowSign and self.exShowSign[self.curShowSignIndex]

			if not signCfg then
				return
			end

			local taskState = signCfg.taskState
			local rewards = LuaUIUtils.getRewardItemByDropId(signCfg.taskAward, taskState >= ActivityConst.TaskState.Received, taskState == ActivityConst.TaskState.Finihed_CanRecv)

			if rewards[1] then
				self.ctrl:showSignItemInfo(rewards[1], self.btnExIcon)
			end
		end
	end
end

function SignFourteenDayComponent:switchExShowSign(offset)
	if self.isSwitchingSign or not self.curShowSignIndex or not self.exShowSign or #self.exShowSign == 0 then
		return
	end

	local targetIndex = math.max(1, math.min(self.curShowSignIndex + offset, #self.exShowSign))

	if targetIndex == self.curShowSignIndex then
		return
	end

	local animation = self.vXDateAnimation
	local outClipName = "VX_Ani_Pb_Event_SevenDaySignin_Switch_" .. (offset > 0 and "Right" or "Left")
	local clipName = outClipName .. "2"

	if IsNil(animation) or IsNil(animation:GetClip(outClipName)) or IsNil(animation:GetClip(clipName)) then
		self.curShowSignIndex = targetIndex

		self:refreshExShowSign()

		return
	end

	self.switchSignSerial = (self.switchSignSerial or 0) + 1

	local switchSerial = self.switchSignSerial

	self.isSwitchingSign = true
	self.switchSignAnimationName = clipName

	UIUtils.PlayAnimation(animation, outClipName, function()
		if self.switchSignSerial ~= switchSerial then
			return
		end

		if not self:checkActive(true) or IsNil(self.vXDateAnimation) then
			self:resetExShowSignSwitch()

			return
		end

		self.curShowSignIndex = targetIndex

		self:refreshExShowSign()
		UIUtils.PlayAnimation(animation, clipName, function()
			if self.switchSignSerial == switchSerial then
				self.isSwitchingSign = false
				self.switchSignAnimationName = nil
			end
		end)
	end)
end

function SignFourteenDayComponent:resetExShowSignSwitch()
	self.switchSignSerial = (self.switchSignSerial or 0) + 1

	if self.isSwitchingSign and not IsNil(self.vXDateAnimation) and self.switchSignAnimationName then
		local clip = self.vXDateAnimation:GetClip(self.switchSignAnimationName)

		if not IsNil(clip) then
			self.vXDateAnimation:Stop()
			UIUtils.SampleAnimation(self.vXDateAnimation, clip.length, self.switchSignAnimationName)
		end
	end

	self.isSwitchingSign = false
	self.switchSignAnimationName = nil
end

function SignFourteenDayComponent:refreshPage(noListAnim)
	self:resetExShowSignSwitch()

	local signData = self.model:getSignData(self.eventId)

	self.curDay = signData and signData.totalSignNum or 1
	self.enterLocateSerial = nil
	self.asyncEnterLocateSerial = nil
	self.exShowSign = {}
	self.rewardButtons = {}
	self.signItemStates = {}

	local signCfgList = self.model:getSignList(self.eventId) or {}

	self.signCfgList = signCfgList

	for _, signCfg in ipairs(signCfgList) do
		if signCfg.eventIcon then
			self.exShowSign[#self.exShowSign + 1] = signCfg
		end
	end

	ClientTextUtils.setText(self.txtTime, pg.getGameString("SIGNIN_LONG_TERM_1"))

	local showIndex = #self.exShowSign

	for i = 1, #self.exShowSign do
		if self.exShowSign[i].taskState < ActivityConst.TaskState.Received then
			showIndex = i

			break
		end
	end

	self.curShowSignIndex = math.max(1, showIndex)

	if noListAnim then
		self.listUList.itemData = signCfgList

		self.listUList:RefreshList(true)
	else
		self.listUList:SetList(signCfgList)
	end

	self:refreshExShowSign()
end

function SignFourteenDayComponent:onEnterPlayEvent()
	self.enterLocateSerial = self.ctrl.prepareEnterSerial
	self.asyncEnterLocateSerial = self.enterLocateSerial

	self:scheduleEnterRewardPosition()
end

function SignFourteenDayComponent:scheduleEnterRewardPosition()
	local enterSerial = self.enterLocateSerial

	if enterSerial == nil or not self.ctrl or self.ctrl.prepareEnterSerial ~= enterSerial then
		return
	end

	if self.enterLocateFrameId then
		self:killFrameTimer(self.enterLocateFrameId)
	end

	self.enterLocateFrameId = self:startFrameTimer(function()
		self.enterLocateFrameId = nil

		if self.enterLocateSerial ~= enterSerial or not self.ctrl or self.ctrl.prepareEnterSerial ~= enterSerial or not self:checkActive(true) then
			return
		end

		self.enterLocateSerial = nil

		if not self:locateUnclaimedReward() then
			self.enterLocateSerial = enterSerial
		end
	end, 1)
end

function SignFourteenDayComponent:locateUnclaimedReward()
	local signCfgList = self.signCfgList or {}

	if #signCfgList <= 0 then
		return true
	end

	local targetIndex = #signCfgList

	for index, signCfg in ipairs(signCfgList) do
		local taskState = signCfg.taskState

		if taskState ~= ActivityConst.TaskState.Received and taskState ~= ActivityConst.TaskState.Received_SendMail then
			targetIndex = index

			break
		end
	end

	self.listUList:GoToIndex(targetIndex - 1, true)

	if pg.game.input:isUsingGamepad() then
		local navManager = pg.global.navMgr or CS.XGUI.Navigation.NavManager.Instance
		local found, button = self.listUList:TryGetChildAt(targetIndex - 1)

		if not navManager or not found or IsNil(button) then
			return false
		end

		self.listUList:SetNavGroupDefaultItemInThis(button)

		return navManager:FocusItemInThis(button)
	end

	return true
end

function SignFourteenDayComponent:focusOnReward()
	local navManager = pg.global.navMgr or CS.XGUI.Navigation.NavManager.Instance
	local focusedItem = navManager and navManager.CurrentFocusedUContent

	if not focusedItem or IsNil(focusedItem) then
		return false
	end

	local focusedTransform = focusedItem.transform

	while not IsNil(focusedTransform) do
		for button in pairs(self.rewardButtons or {}) do
			if not IsNil(button) and focusedTransform == button.transform then
				return true
			end
		end

		focusedTransform = focusedTransform.parent
	end

	return false
end

function SignFourteenDayComponent:isCurrentItemCanGet()
	local navManager = pg.global.navMgr or CS.XGUI.Navigation.NavManager.Instance
	local focusedItem = navManager and navManager.CurrentFocusedUContent

	if IsNil(focusedItem) then
		return false
	end

	local focusedTransform = focusedItem.transform

	while not IsNil(focusedTransform) do
		local taskState = self.signItemStates and self.signItemStates[focusedTransform]

		if taskState then
			return taskState == ActivityConst.TaskState.Finihed_CanRecv
		end

		focusedTransform = focusedTransform.parent
	end

	return false
end

function SignFourteenDayComponent:refreshConsoleBarState()
	local eventCtrl = self.ctrl and self.ctrl.ctrl

	if eventCtrl and eventCtrl.curComponent == self.ctrl then
		eventCtrl:refreshConsoleBarState()
	end
end

function SignFourteenDayComponent:refreshExShowSign()
	local curExShowSign = self.exShowSign and self.exShowSign[self.curShowSignIndex]

	if not IsNil(self.vXDateUComponent) then
		local state = curExShowSign and curExShowSign.taskState >= ActivityConst.TaskState.Received and 1 or 0

		self.vXDateUComponent:TryChangePage("State", state)
	end

	if curExShowSign then
		self.btnLeftUButton.gameObject:SetActiveEx(self.curShowSignIndex ~= 1)
		self.btnRightUButton.gameObject:SetActiveEx(self.curShowSignIndex ~= #self.exShowSign)

		local eventTitle = curExShowSign.taskTitle

		ClientTextUtils.setText(self.txtInfo, eventTitle and pg.getLocalizationText(eventTitle) or "")
		ClientTextUtils.setText(self.exTimeText, string.format("%02d", curExShowSign.showIndex))

		self.imgExIcon.url = curExShowSign.eventIcon
	else
		self.btnLeftUButton.gameObject:SetActiveEx(false)
		self.btnRightUButton.gameObject:SetActiveEx(false)
		ClientTextUtils.setText(self.txtInfo, "")
		ClientTextUtils.setText(self.exTimeText, "")

		self.imgExIcon.url = ""
	end
end

function SignFourteenDayComponent:renderSignItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtLockText = objectReference:GetRefValue("txtLockText")
	local txtDayText = objectReference:GetRefValue("txtDayText")
	local item1UButton = objectReference:GetRefValue("item1UButton")
	local item2UButton = objectReference:GetRefValue("item2UButton")
	local dayIconPrefix = data.eventIcon and "UI_Event_AActivity_Brilliant_Star_Text_White_" or "UI_Event_AActivity_Brilliant_Star_Text_Black_"

	ClientTextUtils.setText(txtDayText, string.format("<sprite name=\"%s%02d\">", dayIconPrefix, data.showIndex))

	local taskState = data.taskState
	local btnState, getTex = self.model:getTaskInfo(taskState, self.curDay, data.showIndex)

	button:TryChangePage("Status", btnState)
	button:TryChangePage("specialState", data.eventIcon and 1 or 0)
	ClientTextUtils.setText(txtLockText, getTex)

	local rewards = LuaUIUtils.getRewardItemByDropId(data.taskAward, taskState >= ActivityConst.TaskState.Received, taskState == ActivityConst.TaskState.Finihed_CanRecv)

	self:setRewardItem(item1UButton, taskState, data.taskId, rewards[1], data.eventIcon)
	item2UButton.gameObject:SetActiveEx(rewards[2])

	if rewards[2] then
		self:setRewardItem(item2UButton, taskState, data.taskId, rewards[2], data.eventIcon)
	end

	local canGet = taskState == ActivityConst.TaskState.Finihed_CanRecv

	function button.luaClick()
		if canGet then
			self:getSignReward(data.taskId)
		end
	end

	self.signItemStates[button.transform] = taskState

	local widgets = button.gameObject:GetComponentsInChildren(typeof(CS.XGUI.UWidget), true)

	for i = 0, widgets.Length - 1 do
		local widget = widgets[i]

		if widget ~= button and widget.enableNavGroup then
			widget.navGroupForceNonInteractable = canGet
		end
	end

	self.ctrl:setSignRodDot(index, button, canGet)
end

function SignFourteenDayComponent:setRewardItem(button, taskState, taskId, reward, eventIcon)
	self.rewardButtons[button] = true

	local objectReference = button:GetComponent("ObjectReference")

	if objectReference:GetRefValue("itemIconUImage") then
		LuaUIUtils.renderRewards(button, 0, reward)
	else
		local textUBaseText = objectReference:GetRefValue("textUBaseText")
		local itemUImage = objectReference:GetRefValue("itemUImage")

		ClientTextUtils.setText(textUBaseText, string.format("x%s", reward.num))

		itemUImage.url = reward.iconUrl or reward.petId and eventIcon or LuaUIUtils.getIconByItemId(reward.id)
	end

	function button.luaClick()
		if taskState == ActivityConst.TaskState.Finihed_CanRecv then
			self:getSignReward(taskId)
		else
			self.ctrl:showSignItemInfo(reward, button)
		end
	end
end

function SignFourteenDayComponent:getSignReward(taskId)
	pg.me:reqActReceiveTaskReward(taskId, self.eventId)
end

function SignFourteenDayComponent:onDestroy()
	self:resetExShowSignSwitch()

	self.enterLocateSerial = nil
	self.asyncEnterLocateSerial = nil

	if self.enterLocateFrameId then
		self:killFrameTimer(self.enterLocateFrameId)

		self.enterLocateFrameId = nil
	end

	UIComponent.onDestroy(self)
end

return SignFourteenDayComponent
