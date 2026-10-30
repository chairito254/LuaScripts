-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PlayerLvReward\\PlayerLvRewardCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("PlayerLvRewardCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local PlayerLvRewardCtrl = Class.LightClass("PlayerLvRewardCtrl", UICtrl)
local PlayerTitleData = require("Data.player_title_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local UIConst = require("Const.UIConst")
local RedDotConst = require("Const.RedDotConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local CallbackHandler = require("Core.Common.CallbackHandler")
local ClientConst = require("Const.ClientConst")
local TimerManager = require("Core.Timer.TimerManager")
local RewardStateUtils = require("Common.Utils.RewardStateUtils")

PlayerLvRewardCtrl.messages = {}

function PlayerLvRewardCtrl:getManagedBlurEffect()
	return self.view and self.view.bgBlurUIBlurEffect
end

function PlayerLvRewardCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
	self:initializeManagedBlur()
end

function PlayerLvRewardCtrl:addListener()
	local closeBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.btnBack.gameObject, "closeBind")

	closeBind.isVirtual = true
	closeBind.priority = -1
	closeBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.Cancel

	function closeBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" then
			self:onClosePanel()
		end
	end

	function self.view.btnBack.luaClick()
		self:onClosePanel()
	end

	function self.view.lvList.luaRenderItem(item, _, data)
		self:onRenderLvItem(item, data)
	end

	function self.view.lvList.luaSelectedChanged(uList)
		local index = uList.selectedIndex

		if index == self.lastSelectedIndex then
			return
		end

		self.lastSelectedIndex = index
		self.pendingFocusIndex = nil

		if IsNil(uList.selectedItem) then
			return
		end

		self.pendingFocusIndex = index

		local res, button = uList:TryGetChildAt(index)

		if res then
			self:onRenderSelectItem(button, uList.selectedItem)
			self:focusPendingLvItem(uList)
		end
	end

	function self.view.lvList.luaFinishLayout(uList)
		self:focusPendingLvItem(uList)
	end

	self:bindGamepadScrollUList(self.view.lvList, 200, false)

	local scrollBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.lvList.gameObject, "listScrollGamepadBind")
	local scrollTrigger = scrollBind.luaTrigger

	function scrollBind.luaTrigger(inputInfo)
		if inputInfo.phase == "Performed" and inputInfo.valueVec2.x ~= 0 then
			self:setLvListManualScroll(true)
		end

		return scrollTrigger(inputInfo)
	end

	local resumeActions = {
		HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadLeftStickMove,
		HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonSouth,
		"Common/GamepadConfirmLowPriority"
	}

	for index, actionPath in ipairs(resumeActions) do
		local isLeftStick = actionPath == HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadLeftStickMove
		local resumeBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.lvList.gameObject, "lvListResumeNavigation" .. index)

		resumeBind.isVirtual = true
		resumeBind.priority = 9999
		resumeBind.actionPath = actionPath

		function resumeBind.luaTrigger(inputInfo)
			if inputInfo.phase == "Performed" and (not isLeftStick or inputInfo.valueVec2.sqrMagnitude > 0) then
				self:setLvListManualScroll(false)
			end

			return true
		end
	end
end

function PlayerLvRewardCtrl:setLvListManualScroll(manual)
	if not manual then
		if self.ScrollGamepadTimer then
			self:killTimer(self.ScrollGamepadTimer)

			self.ScrollGamepadTimer = nil
		end

		self.ScrollGamepadDelta = nil
	end

	if manual == (self.lvListManualScroll or false) then
		return
	end

	self.lvListManualScroll = manual

	local list = self.view and self.view.lvList

	if IsNil(list) then
		return
	end

	if manual then
		self.pendingFocusIndex = nil
	else
		list:StopScroll()
	end

	list:SetNavGroupItemFocusStateOverride(manual, CS.XGUI.Navigation.NavFocusState.Hover)
	list:SetNavGroupBlockNavItemDrivenScroll(manual)
end

function PlayerLvRewardCtrl:onDestroy()
	self:setLvListManualScroll(false)
	pg.game.input:stopRumble(ClientConst.RumbleLayer.DEFAULT)
	UICtrl.onDestroy(self)
end

function PlayerLvRewardCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	self.iData = info
	self.closeCallBack = info.closeCallBack

	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.PLAYER_REWARD_LIST, self.view.lvList, function()
		if self.model:redDot_CheckHasLvReward() then
			return RedDotConst.RedDotStyle.REWARD
		end

		return RedDotConst.RedDotStyle.NONE
	end)
end

function PlayerLvRewardCtrl:onShow()
	self:setLvListManualScroll(false)

	local dataList = self.model:getPlayerLvDataList()
	local list = self.view.lvList
	local foldedWidth = list:GetTemplateItem(0):GetTargetSize(0)

	list:SetViewExtend(Vector2(foldedWidth * 3, 0))

	for _, data in ipairs(dataList) do
		data.size = foldedWidth
	end

	local targetIndex, center = self:getAutoSelectTarget(dataList)

	if targetIndex then
		dataList[targetIndex + 1].selected = true
		dataList[targetIndex + 1].size = 0
	end

	self.lastSelectedIndex = targetIndex or -1
	self.pendingFocusIndex = nil

	list:SetList(dataList)
	self:autoGoToItem(targetIndex, center)
end

function PlayerLvRewardCtrl:getAutoSelectTarget(dataList)
	local targetIndex

	for i, v in ipairs(dataList) do
		if v.rewardState == self.model.REWARD_STATE.NOT_REWARD and v.lvState ~= self.model.LEVEL_STATE.LEVEL_LESS then
			targetIndex = i - 1

			break
		end
	end

	if targetIndex then
		return targetIndex, false
	end

	for i, v in ipairs(dataList) do
		if v.starState == self.model.ASSESS_STATE.CAN_ASSESS then
			targetIndex = i - 1

			break
		end
	end

	if not targetIndex then
		for i, v in ipairs(dataList) do
			if v.lvState == self.model.LEVEL_STATE.LEVEL_LESS then
				targetIndex = i - 1

				break
			end
		end
	end

	return targetIndex, true
end

function PlayerLvRewardCtrl:autoGoToItem(targetIndex, center)
	if targetIndex == nil then
		return
	end

	local list = self.view.lvList

	self.pendingFocusIndex = targetIndex

	if center then
		list:RedirectToCenter(targetIndex, false, true)
	else
		list:GoToIndex(math.max(targetIndex - 1, 0), true)
	end

	CS.XGUI.LayoutMgr.ForceRebuildLayoutImmediate(list)

	if center then
		list:RedirectToCenter(targetIndex, false, true)
	end

	self:focusPendingLvItem(list)
end

function PlayerLvRewardCtrl:focusPendingLvItem(list)
	local index = self.pendingFocusIndex

	if index == nil then
		return
	end

	if list.selectedIndex ~= index then
		self.pendingFocusIndex = nil

		return
	end

	local res, button = list:TryGetChildAt(index)

	if not res then
		return
	end

	self.pendingFocusIndex = nil

	CS.XGUI.Navigation.NavManager.Instance:FocusItem(button, CS.XGUI.Navigation.FocusEntryMode.Restore)
end

function PlayerLvRewardCtrl:onRenderLvItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local levelText = objectReference:GetRefValue("levelText")
	local redDotBox = objectReference:GetRefValue("redDotBox")
	local starText = objectReference:GetRefValue("starText")
	local innerLevelText = objectReference:GetRefValue("innerLevelText")

	ClientTextUtils.setText(innerLevelText, "")
	ClientTextUtils.setText(levelText, data.lv)
	button:TryChangePage("LevelState", data.lvState)

	if data.assessStar > 0 then
		button:TryChangePage("ExamState", 1)
		ClientTextUtils.setText(starText, data.starName)
	else
		button:TryChangePage("ExamState", 0)
	end

	local treePath = string.format(RedDotConst.RedDotPath.PLAYER_REWARD_LIST_ITEM, data.lv or 0)

	pg.global.setRedDot(treePath, redDotBox, data.isShowRedDot, RedDotConst.RedDotStyle.REWARD)

	if data.selected then
		self:onRenderSelectItem(button, data)
	end
end

function PlayerLvRewardCtrl:onRenderSelectItem(button, data)
	local objectReference = button:GetComponent("ObjectReference")
	local innerLevelText = objectReference:GetRefValue("innerLevelText")
	local innerStarText = objectReference:GetRefValue("innerStarText")
	local innerLvNotEnough = objectReference:GetRefValue("innerLvNotEnough")
	local btnStar = objectReference:GetRefValue("btnStar")
	local starIcon = objectReference:GetRefValue("starIcon")
	local btnReward1 = objectReference:GetRefValue("btnReward1")
	local btnReward2 = objectReference:GetRefValue("btnReward2")
	local btnAssess = objectReference:GetRefValue("btnAssess")
	local btnAssessTip = objectReference:GetRefValue("btnAssessTip")
	local content = objectReference:GetRefValue("content")
	local txtMaxCurLv = objectReference:GetRefValue("txtMaxCurLv")
	local btnExamNameUSDFText = objectReference:GetRefValue("btnExamNameUSDFText")
	local btnRewardNameUSDFText = objectReference:GetRefValue("btnRewardNameUSDFText")
	local reward1NameUSDFText = objectReference:GetRefValue("reward1NameUSDFText")
	local ExamName1USDFText = objectReference:GetRefValue("ExamName1USDFText")

	ClientTextUtils.setText(btnExamNameUSDFText, pg.getGameString("PLAYER_BTN_EXAM_NAME"))
	ClientTextUtils.setText(ExamName1USDFText, pg.getGameString("PLAYER_BTN_EXAM_NAME"))

	local claimAllText = pg.getGameString("OBTAIN_ALL")

	ClientTextUtils.setText(btnRewardNameUSDFText, claimAllText)
	ClientTextUtils.setText(reward1NameUSDFText, claimAllText)

	local btnReward1Text = btnReward1.transform:Find("Btn/LayoutBox/TxtName")

	if not IsNil(btnReward1Text) then
		ClientTextUtils.setText(btnReward1Text:GetComponent("USDFText"), claimAllText)
	end

	local btnReward2Text = btnReward2.transform:Find("Btn/TxtName")

	if not IsNil(btnReward2Text) then
		ClientTextUtils.setText(btnReward2Text:GetComponent("USDFText"), claimAllText)
	end

	local subOc = content.gameObject:GetComponent("ObjectReference")
	local lvRewardList = subOc:GetRefValue("lvRewardList")
	local skillRewardList = subOc:GetRefValue("skillRewardList")
	local starRewardList = subOc:GetRefValue("starRewardList")

	ClientTextUtils.setText(innerStarText, data.starName)
	ClientTextUtils.setText(innerLevelText, data.lv)

	if pg.me.level == data.lv then
		txtMaxCurLv:SetActiveFastest(true)
		ClientTextUtils.setText(txtMaxCurLv, pg.getFormatText(pg.getGameString("CURRENT_MAX_LEVEL"), data.maxPetLv))
	else
		txtMaxCurLv:SetActiveFastest(false)
	end

	button:TryChangePage("LevelState", data.lvState)
	button:TryChangePage("RewardState", data.rewardState)
	button:TryChangePage("ExamState", data.starState)
	btnAssess:RefreshActiveCtrl()

	if data.assessStar == 1 and data.starState == 1 then
		btnAssess:SetActive(false)
	end

	if data.lvState == self.model.LEVEL_STATE.LEVEL_LESS then
		local formatLv = pg.getGameString("NEED_PLAYER_FORMATTER_LEVEL")

		ClientTextUtils.setText(innerLvNotEnough, pg.getFormatText(formatLv, data.lv))
	end

	starIcon.url = data.icon or ""

	function lvRewardList.luaRenderItem(subBtn, _, subData)
		if subData.tIndex == 0 then
			self:onRenderLvRewardItem(subBtn, subData, data)
		end
	end

	lvRewardList:SetList(data.lvReward or {})

	function skillRewardList.luaRenderItem(subBtn, _, subData)
		self:onRenderSkillRewardItem(subBtn, subData, data)
	end

	skillRewardList:SetList(data.skReward or {})

	function starRewardList.luaRenderItem(subBtn, _, subData)
		self:onRenderStarRewardItem(subBtn, subData)
	end

	starRewardList:SetList(data.propReward or {})

	function btnStar.luaRenderTooltip(_, toolTip)
		LuaUIUtils.renderStarToolTip(toolTip, data.assessStar)
	end

	function btnReward1.luaClick()
		self:receiveReward(data)
	end

	function btnReward2.luaClick()
		self:receiveReward(data)
	end

	local canClaimReward = data.lvState == self.model.LEVEL_STATE.LEVEL_MATCH and data.rewardState ~= self.model.REWARD_STATE.HAS_REWARD
	local claimButtonPath = string.format(RedDotConst.RedDotPath.PLAYER_REWARD_LIST_ITEM, data.lv or 0)

	RewardStateUtils.applyClaimButton(btnReward1, canClaimReward, claimButtonPath, false, "claimButton", 1)
	RewardStateUtils.applyClaimButton(btnReward2, canClaimReward, claimButtonPath, false, "claimButton", 2)

	function btnAssess.luaClick()
		pg.global.showConfirmMsgRaw(pg.getGameString("TITLE_CONFIRM_NAME"), pg.getGameString("TITLE_CONFIRM_TXT"), function()
			pg.global.ui.SpecialTrainNew:open()
		end, true)
	end

	local path = string.format(RedDotConst.RedDotPath.PLAYER_UP_STAR_LIST_ITEM, data.lv or 0)
	local canUPStar = self.model:redDot_CheckCanUPForCurTitle(data.assessStar)

	pg.global.setRedDot(path, btnAssess, canUPStar, RedDotConst.RedDotStyle.UP_SIGN)
	ClientTextUtils.setText(btnAssessTip, data.unlockTimeFormat)
end

function PlayerLvRewardCtrl:onRenderLvRewardItem(button, subData, data)
	local objectReference = button:GetComponent("ObjectReference")
	local itemIconUImage = objectReference:GetRefValue("itemIconUImage")
	local txtNumUText = objectReference:GetRefValue("txtNumUText")

	itemIconUImage.url = subData.icon

	ClientTextUtils.setText(txtNumUText, subData.num)
	button:TryChangePage("Quality", subData.quality)
	RewardStateUtils.applyItemState(button, {
		hasGet = data.rewardState == self.model.REWARD_STATE.HAS_REWARD,
		canGet = data.lvState == self.model.LEVEL_STATE.LEVEL_MATCH
	})

	function button.luaClick()
		LuaUIUtils.popupPropTip({
			checkTouchBegin = false,
			addSibling = 1,
			id = subData.id,
			num = subData.ownNum,
			targetRect = button,
			rayCastParent = self.view.lvList
		})
	end
end

function PlayerLvRewardCtrl:onRenderStarRewardItem(button, subData)
	local objectReference = button:GetComponent("ObjectReference")
	local iIcon = objectReference:GetRefValue("icon")
	local textNum = objectReference:GetRefValue("textNum")
	local txtName = objectReference:GetRefValue("txtName")

	iIcon.url = subData.icon

	ClientTextUtils.setText(textNum, string.format("+%d", subData.num))
	ClientTextUtils.setText(txtName, subData.name)
end

function PlayerLvRewardCtrl:onRenderSkillRewardItem(button, subData, data)
	local oc = button:GetComponent("ObjectReference")
	local tLevel = oc:GetRefValue("txtLevel")
	local tName = oc:GetRefValue("txtName")
	local iIcon = oc:GetRefValue("icon")

	iIcon.url = subData.icon

	button:TryChangePage("HideText", 1)
	button:TryChangePage("SkillLevel", 1)

	if data.starState == self.model.ASSESS_STATE.FINISHED then
		button:TryChangePage("SkillStage", 2)
	else
		button:TryChangePage("SkillStage", 0)
	end

	button:TryChangePage("SkillType", subData.isRare and 1 or 0)

	function button.luaClick()
		if pg.global.ui:checkUIShow(UIConst.UI_ID_COMMON_PLAYER_SKILL_TIP) then
			pg.global.ui:close(UIConst.UI_ID_COMMON_PLAYER_SKILL_TIP)
		else
			pg.global.ui:open(UIConst.UI_ID_COMMON_PLAYER_SKILL_TIP, {
				autoHor = true,
				checkTouchBegin = false,
				addSibling = 1,
				targetRect = button,
				data = subData,
				rayCastParent = self.view.lvList
			})
		end
	end
end

function PlayerLvRewardCtrl:receiveReward(data)
	local dataList = self.view.lvList.itemData
	local resLv = {}

	for i = 1, dataList.Count do
		local item = dataList[i - 1]

		if item.lvState == self.model.LEVEL_STATE.LEVEL_MATCH then
			resLv[#resLv + 1] = item.lv
		end
	end

	if #resLv == 0 then
		return
	end

	pg.me:serverMsg("RPC_CS_GetLevelReward", resLv, CallbackHandler(self, "onReceiveRewardCallback"))
end

function PlayerLvRewardCtrl:onReceiveRewardCallback(info)
	if not info then
		return
	end

	self:onShow()
end

function PlayerLvRewardCtrl:goForTheAssessment()
	local curStarTitle = pg.me.starTitle or 0
	local nextTitle = curStarTitle + 1
	local cData = PlayerTitleData[nextTitle]

	pg.global.ui:open(UIConst.UI_ID_QUEST_PANEL, {
		questId = cData.quest
	})
end

function PlayerLvRewardCtrl:onClosePanel()
	self:dismiss()

	if self.closeCallBack then
		self.closeCallBack()
	end
end

function PlayerLvRewardCtrl:onHide()
	self:setLvListManualScroll(false)
end

return PlayerLvRewardCtrl
