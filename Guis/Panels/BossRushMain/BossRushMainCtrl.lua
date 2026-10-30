-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BossRushMain\\BossRushMainCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("BossRushMainCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local BossRushCycleData = require("Data.bossrush_cycle_data")
local BossRushLevelData = require("Data.bossrush_guanka_data")
local LevelData = require("Data.level_data")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PuppetData = require("Data.puppet_data")
local BossRushMainCtrl = Class.LightClass("BossRushMainCtrl", UICtrl)
local UIConst = require("Const.UIConst")
local BossRushUtils = require("Utils.BossRushUtils")
local Const = require("Common.Const.Const")
local CameraConst = require("GameApp.Camera.CameraConst")
local NoticeDef = require("Common.NoticeDef")
local SysConfigData = require("Data.sys_config_data")
local Time = require("Core.Common.Time")
local ClientConst = require("Const.ClientConst")
local RedDotConst = require("Const.RedDotConst")
local HotkeyConst = require("Const.HotkeyConst")
local BossRushSeasonData = require("Data.bossrush_season_data")
local TimeUtils = require("Common.Utils.TimeUtils")
local GameDungeonInfoChatComponent = require("Guis.Panels.GameDungeonInfo.Component.GameDungeonInfoChatComponent")
local TeamRoomChatBarrageComponent = require("Guis.Panels.TeamRoom.Component.TeamRoomChatBarrageComponent")

BossRushMainCtrl.messages = {
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshTeamInfo",
		true
	},
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"onInputDeviceChanged",
		true
	},
	[MessageName.TEAM_MATCHED_STATUS_CHANGE] = {
		"onTeamMatchedStatusChange",
		true
	},
	[MessageName.BOSS_RUSH_RED_DOT_CHANGED] = {
		"refreshBossRushRedDot",
		true
	}
}

function BossRushMainCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.openReward = info and info.openReward
	self.dungeonId = Const.BossRushSceneId

	self:initData()
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushMain, true)

	if self.uiScene then
		self.uiScene:showModels()
	end

	self:initUI()
	self:initChatComponent()
	self:onTeamMatchedStatusChange()

	if pg.game.input:isUsingGamepad() then
		self.view.btnInfoUButton.renderOpacity = 0.001
	else
		self.view.btnInfoUButton.renderOpacity = 1
	end
end

function BossRushMainCtrl:initData()
	self.isOpen = BossRushUtils.checkIsOpen()
	self.dungeonConfig = LevelData[self.dungeonId]

	local cycleId = self.isOpen and pg.me.curBossRushCycleId or pg.me.nextBossRushCycleId

	self.cycleData = BossRushCycleData[cycleId]
	self.displayCycleId = cycleId

	if not self.cycleData then
		logger:error("BossRushMainCtrl:initUI no cycle data for id:", cycleId)
		self:close()

		return
	end

	self.bossLevelIds = {
		self.cycleData.bossLeft,
		self.cycleData.bossMid,
		self.cycleData.bossRight
	}
	self.isRankValid = BossRushUtils.isRankOpen()
end

function BossRushMainCtrl:refreshAllUI()
	self:initData()

	if self.uiScene then
		self.uiScene:showModels()
	end

	self:initUI()

	if self.chatCom then
		self.chatCom:refreshTeamInfo()
	end
end

function BossRushMainCtrl:initChatComponent()
	if not self.view.chatUContainer then
		return
	end

	self.view.chatUContainer:LoadDefaultUrlManually(function(content)
		if not content or IsNil(content) or not self.view then
			return
		end

		self.chatCom = GameDungeonInfoChatComponent.new(self, content, {
			dungeonSceneId = self.dungeonId
		})
	end)
end

function BossRushMainCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.btnInfoUButton.luaClick()
		pg.global.ui.tips:openCommonPopUpTipById(Const.COMMON_POPUP_TIP_ID.BOSS_RUSH_MAIN)
	end

	self.view.btnInfoUButton:SetGamepadLongPress(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadStart, nil, 0, function()
		self.view.btnInfoUButton:OnClickSimulate()

		return false
	end)
	self.view.btnInfoUButton:SetHotkeyConsoleBar("CONSOLE_BAR_PLAYMODE_INFO", 6, self.view.consoleBarTransform)

	function self.view.rewardHelpUButton.luaClick()
		if BossRushUtils.hasUnreceivedAssistReward() then
			self:receiveAssistReward()
		else
			pg.global.ui.tips:openCommonPopUpTipById(Const.COMMON_POPUP_TIP_ID.BOSS_RUSH_HELP_REWARD)
		end
	end

	function self.view.btnSearchUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_REWARD)
	end

	function self.view.pointBossUButton.luaHover()
		if self.uiScene then
			self.uiScene:setBossHover(Const.BossRushTeleportTarget.BossMid, true)
		end
	end

	function self.view.pointBossUButton.luaUnhover()
		if self.uiScene then
			self.uiScene:setBossHover(Const.BossRushTeleportTarget.BossMid, false)
		end
	end

	function self.view.pointBossUButton.luaClick()
		if self.uiScene then
			self.uiScene:setBossSelected(Const.BossRushTeleportTarget.BossMid)
		end

		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_CHALLENGE, {
			isShow = true,
			levelId = self.cycleData.bossMid,
			levelIds = self.bossLevelIds
		})
	end

	function self.view.pointBossLeftUButton.luaHover()
		if self.uiScene then
			self.uiScene:setBossHover(Const.BossRushTeleportTarget.BossLeft, true)
		end
	end

	function self.view.pointBossLeftUButton.luaUnhover()
		if self.uiScene then
			self.uiScene:setBossHover(Const.BossRushTeleportTarget.BossLeft, false)
		end
	end

	function self.view.pointBossLeftUButton.luaClick()
		if self.uiScene then
			self.uiScene:setBossSelected(Const.BossRushTeleportTarget.BossLeft)
		end

		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_CHALLENGE, {
			isShow = true,
			levelId = self.cycleData.bossLeft,
			levelIds = self.bossLevelIds
		})
	end

	function self.view.pointBossRightUButton.luaHover()
		if self.uiScene then
			self.uiScene:setBossHover(Const.BossRushTeleportTarget.BossRight, true)
		end
	end

	function self.view.pointBossRightUButton.luaUnhover()
		if self.uiScene then
			self.uiScene:setBossHover(Const.BossRushTeleportTarget.BossRight, false)
		end
	end

	function self.view.pointBossRightUButton.luaClick()
		if self.uiScene then
			self.uiScene:setBossSelected(Const.BossRushTeleportTarget.BossRight)
		end

		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_CHALLENGE, {
			isShow = true,
			levelId = self.cycleData.bossRight,
			levelIds = self.bossLevelIds
		})
	end

	function self.view.btnSeasonUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_SEASON)
	end

	function self.view.messageListUList.luaRenderItem(button, index, data)
		self:onRenderMessageItem(button, index, data)
	end

	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.BOSS_RUSH_SEASON_REWARD, self.view.btnSeasonUButton, BossRushUtils.getSeasonRewardRedDotStyle)
	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.BOSS_RUSH_GRADE_REWARD, self.view.btnSearchUButton, BossRushUtils.getGradeRewardRedDotStyle)
	pg.global.setPreViewRedDot(RedDotConst.RedDotPath.BOSS_RUSH_ASSIST_REWARD, self.view.rewardHelpUButton, BossRushUtils.getAssistRewardRedDotStyle)

	function self.view.btnRealRankUButton.luaClick()
		if self.isRankValid then
			BossRushUtils.openRank()
		else
			pg.global.ui.tips:showTextTip(pg.getFormatText(pg.getGameString("BOSS_RUSH_RANK_OPEN_TIP"), BossRushUtils.getNearlyRankOpenTime()))
		end
	end

	function self.view.listUList.luaRenderItem(button, idx, data)
		LuaUIUtils.renderRewardItem(button, data)
	end
end

function BossRushMainCtrl:receiveAssistReward()
	local canRecv = pg.me.curBossRushCycCanRecvAssistNum or 0
	local cycleId = pg.me.curBossRushCycleId

	if self.receivingAssistReward or self.localAssistCycleId == cycleId and self.localAssistReceivedNum and canRecv <= self.localAssistReceivedNum then
		return
	end

	self.receivingAssistReward = true

	pg.me:serverMsg("RPC_CS_BossRushReceiveAllAssistReward", function(errno, awardIdList)
		self.receivingAssistReward = false

		if errno == NoticeDef.SUCCESS then
			self.localAssistCycleId = cycleId
			self.localAssistReceivedNum = canRecv

			BossRushUtils.showRewardObtainTips(awardIdList)
			self:renderRewardData()
		end
	end)
end

function BossRushMainCtrl:refreshBossRushRedDot()
	if self.localAssistCycleId ~= pg.me.curBossRushCycleId or (pg.me.curBossRushCycRecvedAssistNum or 0) >= (self.localAssistReceivedNum or 0) then
		self.localAssistReceivedNum = nil
	end

	self:renderRewardData()
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.BOSS_RUSH_SEASON_REWARD)
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.BOSS_RUSH_GRADE_REWARD)
	pg.global.refreshRedDotState(RedDotConst.RedDotPath.BOSS_RUSH_ASSIST_REWARD)
end

function BossRushMainCtrl:onVisibleChange(visible)
	if visible and self.uiScene then
		self.uiScene:switchCameraPos()
	end

	local modelVisible = visible or pg.global.ui:checkUIVisible(UIConst.UI_ID_BOSS_RUSH_CHALLENGE) or pg.global.ui:checkUIVisible(UIConst.UI_ID_CHAT) or false
	local envVisible = visible or pg.global.ui:checkUIVisible(UIConst.UI_ID_BOSS_RUSH_CHALLENGE) or pg.global.ui:checkUIVisible(UIConst.UI_ID_BOSS_RUSH_SEASON) or pg.global.ui:checkUIVisible(UIConst.UI_ID_CHAT) or false

	if self.uiScene then
		self.uiScene:setAllModelVisible(modelVisible)
		self.uiScene:setEnvComponentEnable(envVisible)
	end

	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushMain, visible)
end

function BossRushMainCtrl:initUI()
	local cycleData = self.cycleData

	self.displaySeasonId = BossRushUtils.getDisplaySeasonId()

	if self.displaySeasonId == 0 then
		self.displaySeasonId = 1
	end

	if self.uiScene then
		self:renderBossInfo(self.uiScene.pointBossUButton, cycleData.bossMid, true)
		self:renderBossInfo(self.uiScene.pointBossLeftUButton, cycleData.bossLeft)
		self:renderBossInfo(self.uiScene.pointBossRightUButton, cycleData.bossRight)
	end

	self:renderRankData()
	self:renderRewardData()
	self:refreshActionPanel()
	self:onInputDeviceChanged()

	if self.openReward then
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_REWARD)
	end

	self:playFirstAnimation()

	local seasonData = BossRushSeasonData[self.displaySeasonId]

	ClientTextUtils.setText(self.view.titleTMPUSDFText, ClientTextUtils.getFormatText(ClientTextUtils.getGameString("BOSS_RUSH_MAIN_TITLE"), ""))
	ClientTextUtils.setText(self.view.btnSeasonTxtUSDFText, pg.getLocalizationText(seasonData.seasonName))
	ClientTextUtils.setText(self.view.seasonIconTextPlus, pg.getLocalizationText(seasonData.seasonName))
	ClientTextUtils.setText(self.view.txtCountDownTextPlus, ClientTextUtils.getFormatText(ClientTextUtils.getGameString("BOSS_RUSH_MAIN_TIP3"), self.cycleData.cycleName or 0))
	self.view.messageListUList:SetList({
		{}
	})
	self:initTeamRoomChatBarrageComponent(self.view.chatBarrageUContainer)
end

function BossRushMainCtrl:initTeamRoomChatBarrageComponent(chatBarrageContainer)
	if not chatBarrageContainer then
		return
	end

	chatBarrageContainer:LoadDefaultUrlManually(function(content)
		self.chatBarrageCmp = TeamRoomChatBarrageComponent.new(self, content)
	end)
end

function BossRushMainCtrl:onRenderMessageItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local teamNumberUSDFText = objectReference:GetRefValue("teamNumberUSDFText")
	local playerTitleCondition = self.dungeonConfig and self.dungeonConfig.playerTitleCondition
	local needLevel = LuaUIUtils.getStarNeedLevel(playerTitleCondition) or 0

	ClientTextUtils.setText(txtNameUSDFText, ClientTextUtils.getGameString("Rift_RecommendLevel"))
	ClientTextUtils.setText(teamNumberUSDFText, ClientTextUtils.getFormatText(ClientTextUtils.getGameString("BOSS_RUSH_MAIN_TIP5"), needLevel))
end

function BossRushMainCtrl:refreshTeamInfo()
	self:refreshActionPanel()

	if self.uiScene then
		self.uiScene:refreshPlayerModel()
	end

	if self.chatCom then
		self.chatCom:refreshTeamInfo()
	end
end

function BossRushMainCtrl:refreshActionPanel()
	local isLegalLevel = self:refreshLevelCondition()

	self:refreshOpenTime()

	local canEnter = isLegalLevel and self.isOpen

	self.view.rootUComponent:TryChangePage("Stage", canEnter and 0 or 1)
	self.view.rootUComponent:TryChangePage("time", self.isOpen and 0 or 1)
end

function BossRushMainCtrl:refreshLevelCondition()
	local result, playerName, titleCondition = pg.me:checkLevelConditionTitle()

	if result then
		return result
	end

	ClientTextUtils.setText(self.view.textTipsUBaseText, pg.me:getTitleTip(playerName, titleCondition))

	return result
end

function BossRushMainCtrl:refreshOpenTime()
	if self.isOpen then
		local endTime = BossRushUtils.getCurCycleEndTime()

		LuaUIUtils.setCountDownTime(self.view.seasonUCountDown, endTime + 3, UIConst.TimeType.Short)
		ClientTextUtils.setText(self.view.countDownTextUSDFText, ClientTextUtils.getGameString("BOSS_RUSH_MAIN_TIP6"))
	else
		ClientTextUtils.setText(self.view.countDownTextUSDFText, ClientTextUtils.getGameString("BOSS_RUSH_MAIN_TIP7"))

		local openTime = pg.me.nextBossRushCycleBegTm or 0

		ClientTextUtils.setText(self.view.textTipsUBaseText, BossRushUtils.getNotOpenTips())
		LuaUIUtils.setCountDownTime(self.view.seasonUCountDown, openTime + 3, UIConst.TimeType.Short)
	end

	function self.view.seasonUCountDown.luaFinished()
		self:refreshAllUI()
	end
end

function BossRushMainCtrl:renderBossInfo(button, levelId, isMid)
	local bossData = BossRushLevelData[levelId]

	if not bossData or not bossData.bossId then
		return
	end

	local bossInfo = PuppetData[bossData.bossId]

	if not bossInfo then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local rewardProgressUBaseText = objectReference:GetRefValue("rewardProgressUBaseText")
	local elementUList = objectReference:GetRefValue("elementUList")
	local bossNameUBaseText = objectReference:GetRefValue("bossNameUBaseText")
	local bossNameBackUBaseText = objectReference:GetRefValue("bossNameBackUBaseText")
	local txtNameDouble1USDFText = objectReference:GetRefValue("txtNameDouble1USDFText")
	local txtNameDouble2UBaseText = objectReference:GetRefValue("txtNameDouble2UBaseText")
	local txtNameDouble1UList = objectReference:GetRefValue("txtNameDouble1UList")
	local txtNameDouble2UList = objectReference:GetRefValue("txtNameDouble2UList")

	button:TryChangePage("LevelType", self.cycleData.bossMid == levelId and 1 or 0)

	local secondBossInfo = bossData.bossId_2 and bossData.bossId_2 ~= 0 and PuppetData[bossData.bossId_2]

	button:TryChangePage("BossState", secondBossInfo and 1 or 0)

	local star = 0

	if self.isOpen then
		star = pg.me.curBossRushCycBossBestGrades[bossData.bossId] or 0
	else
		star = 0
	end

	local maxStar = SysConfigData.BossRushMaxStarSideBoss

	if isMid then
		maxStar = maxStar * SysConfigData.BossRushStarMultiplierMidBoss
	end

	ClientTextUtils.setText(rewardProgressUBaseText, star, "/", maxStar)

	local elementData = {}
	local elementType = bossInfo.elementType or {}

	for key, value in pairs(elementType) do
		table.insert(elementData, key)
	end

	LuaUIUtils.renderPetElement(secondBossInfo and txtNameDouble1UList or elementUList, elementData)
	ClientTextUtils.setText(secondBossInfo and txtNameDouble1USDFText or bossNameUBaseText, pg.getLocalizationText(bossInfo.BossShowName or ""))
	ClientTextUtils.setText(bossNameBackUBaseText, pg.getLocalizationText(bossInfo.BossShowName or ""))

	if secondBossInfo then
		ClientTextUtils.setText(txtNameDouble2UBaseText, pg.getLocalizationText(secondBossInfo.BossShowName or ""))

		local secondElementData = {}

		for key, value in pairs(secondBossInfo.elementType or {}) do
			table.insert(secondElementData, key)
		end

		LuaUIUtils.renderPetElement(txtNameDouble2UList, secondElementData)
	end
end

function BossRushMainCtrl:renderRankData()
	if self.isOpen then
		local score, star = BossRushUtils.getCurCycleTotalScore()

		ClientTextUtils.setText(self.view.rankUBaseTex, ClientTextUtils.concatByLanguage("", score))
		ClientTextUtils.setText(self.view.scoreUBase, star)
	else
		ClientTextUtils.setText(self.view.rankUBaseTex, ClientTextUtils.concatByLanguage("", 0))
		ClientTextUtils.setText(self.view.scoreUBase, 0)
		ClientTextUtils.setText(self.view.txtNotOpenUBaseText, pg.getGameString("BOSS_RUSH_CYCLE_NOT_START"))
	end
end

function BossRushMainCtrl:renderRewardData()
	local assistStar = self.isOpen and (pg.me.curBossRushCycRecvedAssistNum or 0) or 0

	if self.isOpen and self.localAssistCycleId == pg.me.curBossRushCycleId then
		assistStar = math.max(assistStar, self.localAssistReceivedNum or 0)
	end

	local totalAssistCount = SysConfigData.BossRushAssistRewardNumLimit or 0

	ClientTextUtils.setText(self.view.helpRewardNumTextPlus, string.format("%d/%d", assistStar, totalAssistCount))

	local awardStar = 0
	local totalStar = 60

	if self.isOpen then
		awardStar = select(2, BossRushUtils.getCurCycleTotalScore())
		totalStar = self.model:getMaxCurCycleStar(pg.me.curBossRushCycleId)
	else
		totalStar = self.model:getMaxCurCycleStar(pg.me.nextBossRushCycleId)
	end

	ClientTextUtils.setText(self.view.txtNameRewardUSDFText, string.format("%d/%d", awardStar, totalStar))
	self.view.listUList:SetList(self.model:getRewardPreviewItemsByRarityDesc())
end

function BossRushMainCtrl:onDestroy()
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushMain, false)
	UICtrl.onDestroy(self)
end

function BossRushMainCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function BossRushMainCtrl:onShow()
	return
end

function BossRushMainCtrl:onHide()
	return
end

function BossRushMainCtrl:onInputDeviceChanged(deviceType)
	if pg.game.input:isUsingGamepad() then
		self.view.btnInfoUButton.renderOpacity = 0.001
	else
		self.view.btnInfoUButton.renderOpacity = 1
	end
end

function BossRushMainCtrl:playFirstAnimation()
	local key = ClientConst.PrefKey.BossRushCycleFirstInKey
	local flag = ClientConst.CACHE_TYPE_FLAG.USER
	local curStage = self.displayCycleId

	self.view.btnRealRankUButton:SetActiveFastest(self.isRankValid)

	if pg.global.prefsCacheUtils:getInt(key, 0, flag) == curStage then
		self.view.rootUComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
		self.view.rootUComponent:TryChangePage("Lock", self.isRankValid and 1 or 0, false, true, false)
	else
		self.view.rootUComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom2)
		self:startTimer(function()
			self.view.rootUComponent:TryChangePage("Lock", self.isRankValid and 1 or 0)
		end, 1)
	end

	pg.global.prefsCacheUtils:setInt(key, curStage, flag)
end

function BossRushMainCtrl:onTeamMatchedStatusChange()
	if self.chatCom then
		self.chatCom:refreshTeamInfo()
	end
end

return BossRushMainCtrl
