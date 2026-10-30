-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\BossRushChallenge\\BossRushChallengeCtrl.lua

local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local BossRushChallengeCtrl = Class.LightClass("BossRushChallengeCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")
local BossRushLevelData = require("Data.bossrush_guanka_data")
local PuppetData = require("Data.puppet_data")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetData = require("Data.pet_data")
local BossRushUtils = require("Utils.BossRushUtils")
local UIConst = require("Const.UIConst")
local Const = require("Common.Const.Const")
local BossRushCycleData = require("Data.bossrush_cycle_data")
local BossRushBuffData = require("Data.bossrush_buff_data")
local AvatarRobotData = require("Data.avatar_robot_data")
local CameraConst = require("GameApp.Camera.CameraConst")
local UICardRenderUtils = require("Guis.Utils.UICardRenderUtils")
local TeamMatchEntryComponent = require("Guis.Panels.ActiveDungeon.Component.TeamMatchEntryComponent")
local TeamRoomChatBarrageComponent = require("Guis.Panels.TeamRoom.Component.TeamRoomChatBarrageComponent")
local GameDungeonInfoChatComponent = require("Guis.Panels.GameDungeonInfo.Component.GameDungeonInfoChatComponent")

BossRushChallengeCtrl.messages = {
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshTeamInfo",
		true
	},
	[MessageName.TEAM_MATCHED_STATUS_CHANGE] = {
		"onTeamMatchedStatusChange",
		true
	}
}

function BossRushChallengeCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.levelId = info.levelId
	self.levelData = BossRushLevelData[self.levelId]
	self.target = info.target
	self.dungeonId = Const.BossRushSceneId
	self.levelIds = info.levelIds or {}

	if self.levelIds then
		for index, value in ipairs(self.levelIds) do
			if value == self.levelId then
				self.curBossIndex = index

				break
			end
		end
	end

	if self.target == nil and self.curBossIndex then
		self.target = Const.BossRushBattlePlace[self.curBossIndex]
	end

	self.isOpen = BossRushUtils.checkIsOpen()

	if self.isOpen then
		self.cycleData = BossRushCycleData[pg.me.curBossRushCycleId]
	else
		self.cycleData = BossRushCycleData[pg.me.nextBossRushCycleId]
	end

	self.showTarget = self.target or self:getShowTarget()

	self:initUI()
	self:renderBossModel()

	self.isInit = true
	self.matchCom = TeamMatchEntryComponent.new(self, self.view.matchBtnUComponent, {
		dungeonId = self.dungeonId,
		dungeonType = Const.CUR_DUNGEON_TYPE.BOSSRush,
		hardLv = self.curBossIndex,
		checkCanStart = BossRushUtils.checkIsOpen
	})

	self.matchCom:bindTeamRoomFrameStartButton()
	self.matchCom:refreshTeamRoomFrameMatchEntryState(self.dungeonId, self.curBossIndex)
end

function BossRushChallengeCtrl:onGamePadFocusChange()
	return
end

function BossRushChallengeCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.btnLeftUButton.luaClick()
		self.curBossIndex = self.curBossIndex - 1

		if self.curBossIndex < 1 then
			self.curBossIndex = #self.levelIds
		end

		self.levelId = self.levelIds[self.curBossIndex]

		self:onLevelIdUpdate()
	end

	function self.view.btnRightUButton.luaClick()
		self.curBossIndex = self.curBossIndex + 1

		if self.curBossIndex > #self.levelIds then
			self.curBossIndex = 1
		end

		self.levelId = self.levelIds[self.curBossIndex]

		self:onLevelIdUpdate()
	end

	function self.view.recommendUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_RECOMMEND_PET, {
			isBossRush = true,
			levelId = self.levelId
		})
	end

	ClientTextUtils.setText(self.view.recommendPetUBaseText, pg.getGameString("RECOMMEND_PET_POPUP_TITLE"))
	self:bindHotKeyPerform("Raw/GamepadLeftShoulder", function()
		self.view.btnLeftUButton:OnClickSimulate()
	end)
	self:bindHotKeyPerform("Raw/GamepadRightShoulder", function()
		self.view.btnRightUButton:OnClickSimulate()
	end)
	self:bindHotKeyPerform("Raw/GamepadLeftStickPress", function()
		self.view.luckyUButton:OnClickSimulate()
	end)

	function self.view.cycleBuffPanelUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			isShow = true,
			tab = 0
		})
	end

	function self.view.seasonBuffPanelUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			buffIndex = 1,
			isShow = true,
			tab = 0
		})
	end
end

function BossRushChallengeCtrl:initUI()
	self:refreshPageInfoType()
	self:renderRankData()
	self:renderBossInfo()
	self:initTeamInfo()
	self:initBuffInfo()
	self:initChatComponent()
end

function BossRushChallengeCtrl:initChatComponent()
	if not self.view.teamUContainer then
		return
	end

	self.view.teamUContainer:LoadDefaultUrlManually(function(content)
		if not content or IsNil(content) or not self.view then
			return
		end

		self.chatCom = GameDungeonInfoChatComponent.new(self, content, {
			dungeonSceneId = self.dungeonId
		})
		self.chatBarrageCmp = TeamRoomChatBarrageComponent.new(self, content)
	end)
end

function BossRushChallengeCtrl:onLevelIdUpdate()
	self.levelData = BossRushLevelData[self.levelId]

	if not self.levelData then
		return
	end

	self.showTarget = self:getShowTarget()

	self:refreshPageInfoType()
	self:renderRankData()
	self:renderBossInfo()
	self:renderBossModel()
	self:refreshBuffInfo()
	self:refreshTeamInfo()
end

function BossRushChallengeCtrl:refreshPageInfoType()
	if not self.levelData then
		return
	end

	self.type = 2

	self.view.rootUComponent:TryChangePage("InfoType", self.type)
	self.view.btnLeftUButton:SetActive(#self.levelIds > 1)
	self.view.btnRightUButton:SetActive(#self.levelIds > 1)
end

function BossRushChallengeCtrl:checkHasRecord()
	return self.isOpen and pg.me.curBossRushCycBossBestScores[self.levelData.bossId] and pg.me.curBossRushCycBossBestScores[self.levelData.bossId] > 0
end

function BossRushChallengeCtrl:renderRankData()
	if not self.levelData then
		return
	end

	local score = 0
	local star = 0

	if self.isOpen then
		score = pg.me.curBossRushCycBossBestScores[self.levelData.bossId] or 0
		star = pg.me.curBossRushCycBossBestGrades[self.levelData.bossId] or 0
	end

	ClientTextUtils.setText(self.view.scoreUBaseText, ClientTextUtils.concatByLanguage("", score))
	ClientTextUtils.setText(self.view.starUBaseText, star)
end

function BossRushChallengeCtrl:renderBossInfo()
	local levelData = self.levelData

	if not levelData or not levelData.bossId then
		return
	end

	local bossInfo = PuppetData[levelData.bossId]

	if not bossInfo then
		return
	end

	ClientTextUtils.setText(self.view.bossTitleUBaseText, pg.getLocalizationText(bossInfo.BossShowName or ""))
	ClientTextUtils.setText(self.view.timeUBaseText, LuaUIUtils.getLoginWaitingCountDownFormateText(BossRushUtils.getCombatDuration()))

	local playId, envId

	if self.showTarget == Const.BossRushTeleportTarget.BossLeft then
		playId = self.cycleData.interactBuffRefLeft
		envId = self.cycleData.envBuffRefLeft
	elseif self.showTarget == Const.BossRushTeleportTarget.BossMid then
		playId = self.cycleData.interactBuffRefMid
		envId = self.cycleData.envBuffRefMid
	elseif self.showTarget == Const.BossRushTeleportTarget.BossRight then
		playId = self.cycleData.interactBuffRefRight
		envId = self.cycleData.envBuffRefRight
	end

	local playInfo = BossRushBuffData[playId] or {}

	self.view.playIconUImage.url = playInfo.buffIcon or ""

	ClientTextUtils.setText(self.view.playTitleUBaseText, pg.getLocalizationText(playInfo.buffName or ""))
	ClientTextUtils.setText(self.view.playDetailUScrollRect.content, pg.getLocalizationText(playInfo.descShort or ""))
	LuaUIUtils.setSkillTipButton2(self.view.detail1UButton, {
		tags = {},
		skillName = playInfo.buffName or "",
		skillDesc = playInfo.desc or "",
		skillIcon = playInfo.buffIcon or ""
	})

	local envInfo = BossRushBuffData[envId] or {}

	self.view.envIconUImage.url = envInfo.buffIcon or ""

	ClientTextUtils.setText(self.view.envTitleUBaseText, pg.getLocalizationText(envInfo.buffName or ""))
	ClientTextUtils.setText(self.view.envDetailUScrollRect.content, pg.getLocalizationText(envInfo.descShort or ""))
	LuaUIUtils.setSkillTipButton2(self.view.detail2UButton, {
		tags = {},
		skillName = envInfo.buffName or "",
		skillDesc = envInfo.desc or "",
		skillIcon = envInfo.buffIcon or ""
	})

	local recommendEle = levelData.elementRecmmend or {}

	LuaUIUtils.renderPetElement(self.view.recommentEleUList, recommendEle)

	function self.view.listTipsUList.luaRenderItem(button, index, data)
		button:TryChangePage("Recommend", data.isRecommend and 0 or 1)
	end

	local tags = BossRushUtils.getLevelTagInfos(self.levelId)

	self.view.listTipsUList:SetList(tags)

	function self.view.luckyUButton.luaRenderTooltip(button, popup)
		LuaUIUtils.renderCommonSmallTip(popup, pg.getGameString("BOSS_RUSH_LUCKY_PET_TIP_TITLE"), pg.getGameString("BOSS_RUSH_LUCKY_PET_TIP"))
	end
end

function BossRushChallengeCtrl:refreshBossBaseInfo(target)
	local levelData = self.levelData

	if not levelData or not levelData.bossId then
		return
	end

	local bossInfo = PuppetData[levelData.bossId]

	if not bossInfo then
		return
	end

	local titleText = ""
	local uCom

	if target == Const.BossRushTeleportTarget.BossLeft then
		titleText = pg.getGameString("BOSS_RUSH_TITLE_LEFT")
		uCom = self.uiScene.bossInfoLeftUComponent
	elseif target == Const.BossRushTeleportTarget.BossMid then
		titleText = pg.getGameString("BOSS_RUSH_TITLE_MID")
		uCom = self.uiScene.bossInfoUComponent
	elseif target == Const.BossRushTeleportTarget.BossRight then
		titleText = pg.getGameString("BOSS_RUSH_TITLE_RIGHT")
		uCom = self.uiScene.bossInfoRightUComponent
	end

	if not uCom then
		return
	end

	local objectReference = uCom:GetComponent("ObjectReference")
	local textLevelUBaseText = objectReference:GetRefValue("textLevelUBaseText")
	local textNameUBaseText = objectReference:GetRefValue("textNameUBaseText")
	local titleUBaseText = objectReference:GetRefValue("titleUBaseText")
	local listElementUList = objectReference:GetRefValue("listElementUList")
	local textNameBackUBaseText = objectReference:GetRefValue("textNameBackUBaseText")
	local textNameDoubleUSDFText = objectReference:GetRefValue("textNameDoubleUSDFText")
	local listElement2UList = objectReference:GetRefValue("listElement2UList")
	local listElement1UList = objectReference:GetRefValue("listElement1UList")
	local textNameBackDoubleUSDFText = objectReference:GetRefValue("textNameBackDoubleUSDFText")
	local secondBossInfo = levelData.bossId_2 and levelData.bossId_2 ~= 0 and PuppetData[levelData.bossId_2]

	uCom:TryChangePage("BossState", secondBossInfo and 1 or 0)
	ClientTextUtils.setText(textLevelUBaseText, self.cycleData.bossLv)

	local bossName = pg.getLocalizationText(bossInfo.BossShowName or "")

	ClientTextUtils.setText(textNameUBaseText, bossName)
	ClientTextUtils.setText(textNameBackUBaseText, bossName)
	ClientTextUtils.setText(titleUBaseText, titleText)

	local elementData = {}
	local elementType = bossInfo.elementType or {}

	for key, value in pairs(elementType) do
		table.insert(elementData, key)
	end

	LuaUIUtils.renderPetElement(secondBossInfo and listElement1UList or listElementUList, elementData)

	if secondBossInfo then
		local secondBossName = pg.getLocalizationText(secondBossInfo.BossShowName or "")

		ClientTextUtils.setText(textNameDoubleUSDFText, secondBossName)
		ClientTextUtils.setText(textNameBackDoubleUSDFText, secondBossName)

		local secondElementData = {}

		for key, value in pairs(secondBossInfo.elementType or {}) do
			table.insert(secondElementData, key)
		end

		LuaUIUtils.renderPetElement(listElement2UList, secondElementData)
	end
end

function BossRushChallengeCtrl:initTeamInfo()
	function self.view.listPlayerUList.luaRenderItem(button, index, data)
		if data.tIndex == 1 then
			return
		end

		local objectReference = button:GetComponent("ObjectReference")
		local playerNameUBaseText = objectReference:GetRefValue("playerNameUBaseText")
		local playerHeadUButton = objectReference:GetRefValue("playerHeadUButton")
		local petIconUImage = objectReference:GetRefValue("petIconUImage")
		local iconTakenUWidget = objectReference:GetRefValue("iconTakenUWidget")

		iconTakenUWidget:SetActive(false)

		button.draggable = false

		button:TryChangePage("Belong", data.uid == pg.me.uid and 0 or 1)
		playerHeadUButton:TryChangePage("Teammate", data.isAi and 4 or index)
		playerHeadUButton:TryChangePage("Ready", 0)

		local ent = data.entId and pg.getEntity(data.entId)

		if ent then
			local playerName = ent.playerName

			if data.isAi then
				local robotData = AvatarRobotData[ent.botTemplateId]

				if robotData and robotData.name then
					playerName = pg.getLocalizationText(robotData.name)
				end
			end

			local _h = BossRushChallengeCtrl._platformHooks

			playerName = _h and _h.getMaskedEntDisplayName and _h.getMaskedEntDisplayName(self, ent, playerName) or playerName

			ClientTextUtils.setText(playerNameUBaseText, playerName)
		else
			local playerInfo = pg.game.chat:getPlayerInfo(data.uid)

			if playerInfo then
				local playerName = playerInfo.playerName
				local _h = BossRushChallengeCtrl._platformHooks

				playerName = _h and _h.getMaskedPlayerDisplayName and _h.getMaskedPlayerDisplayName(self, data.uid, playerInfo, playerName) or playerName

				ClientTextUtils.setText(playerNameUBaseText, playerName)
			else
				pg.game.chat:getPlayerInfoFromServer(data.uid, nil, function()
					playerInfo = pg.game.chat:getPlayerInfo(data.uid)

					if playerInfo then
						local playerName = playerInfo.playerName
						local _h = BossRushChallengeCtrl._platformHooks

						playerName = _h and _h.getMaskedPlayerDisplayName and _h.getMaskedPlayerDisplayName(self, data.uid, playerInfo, playerName) or playerName

						ClientTextUtils.setText(playerNameUBaseText, playerName)
					end
				end)
			end
		end

		playerHeadUButton:TryChangePage("Empty", data.empty and 1 or 0)

		if not data.empty and data.petInfo.templateId then
			petIconUImage.url = LuaUIUtils.getPetIcon(PetData[data.petInfo.templateId].iconName, LuaUIUtils.PET_ICON, data.petInfo.label)
		end

		button.enabledTooltip = not data.empty

		function button.luaRenderTooltip(button2, popup)
			local petList = {}

			for index, pet in ipairs(data.pList) do
				local cData = PetData[pet.templateId]

				table.insert(petList, {
					mainElementType = cData.mainElementType,
					coreAbilityId = pet.coreAbilityId,
					icon = LuaUIUtils.getPetIcon(cData.iconName, LuaUIUtils.PET_ICON, pet.label),
					level = pet.level,
					cp = pet.cp,
					name = pg.getLocalizationText(pet.name)
				})
			end

			UICardRenderUtils.render1Plus3Pet(popup, {
				petList = petList,
				isSelf = data.isSelf
			})
		end
	end

	self:refreshTeamInfo()
end

function BossRushChallengeCtrl:refreshTeamInfo()
	if self.chatCom then
		self.chatCom:refreshTeamInfo()
	end

	if self.type == 1 then
		self:refreshHistoryChallengeRecord()
	end

	if self.matchCom then
		self.matchCom.initialHardLv = self.curBossIndex or 0

		self.matchCom:refreshView()
	end
end

function BossRushChallengeCtrl:onTeamMatchedStatusChange()
	if self.chatCom then
		self.chatCom:refreshTeamInfo()
	end
end

function BossRushChallengeCtrl:refreshHistoryChallengeRecord()
	local levelData = self.levelData

	if not levelData or not levelData.bossId then
		return
	end

	local record

	if self.isOpen then
		record = pg.me.curBossRushCycBestScoreTeamInfo[levelData.bossId]
	else
		record = nil
	end

	if not record then
		return
	end

	local teamInfo = {}

	for i, info in ipairs(record) do
		local petInfo = info.pets and info.pets[1]

		table.insert(teamInfo, {
			isReady = true,
			uid = info.uid,
			petInfo = petInfo,
			empty = petInfo == nil
		})
	end

	self.memTeamInfo = teamInfo

	self.view.listPlayerUList:SetList(teamInfo)
end

function BossRushChallengeCtrl:initBuffInfo()
	function self.view.buffUList.luaRenderItem(button, index, data)
		BossRushUtils.renderBuffItem(button, index, data)
	end

	function self.view.buffUList.luaClick(button, data)
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			buffIndex = 1,
			isShow = true,
			tab = 0
		})
	end

	function self.view.specialBuffUList.luaRenderItem(button, index, data)
		BossRushUtils.renderBuffItem(button, index, data)
	end

	function self.view.specialBuffUList.luaClick(button, data)
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			isShow = true,
			tab = 0
		})
	end

	function self.view.normalBuffUList.luaRenderItem(button, index, data)
		BossRushUtils.renderBuffItem(button, index, data)
	end

	function self.view.normalBuffUList.luaClick(button, data)
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			buffIndex = 1,
			isShow = true,
			tab = 0
		})
	end

	function self.view.cycleBuffUList.luaRenderItem(button, index, data)
		BossRushUtils.renderBuffItem(button, index, data)
	end

	function self.view.cycleBuffUList.luaClick(button, data)
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			isShow = true,
			tab = 0
		})
	end

	function self.view.seasonBuffBtnSearchUButton.luaClick()
		pg.global.ui.tips:openCommonPopUpTipById(Const.COMMON_POPUP_TIP_ID.BOSS_RUSH_HELP_SEASON_BUFF)
	end

	function self.view.seasonBuffBtnSearch2UButton.luaClick()
		pg.global.ui.tips:openCommonPopUpTipById(Const.COMMON_POPUP_TIP_ID.BOSS_RUSH_HELP_SEASON_BUFF)
	end

	function self.view.cycleBuffBtnSearchUButton.luaClick()
		pg.global.ui.tips:openCommonPopUpTipById(Const.COMMON_POPUP_TIP_ID.BOSS_RUSH_HELP_CYCLE_BUFF)
	end

	self:refreshBuffInfo()
end

function BossRushChallengeCtrl:refreshBuffInfo()
	if self.type == 1 then
		local bossId = self.levelData and self.levelData.bossId

		self.view.buffUList:SetList(BossRushUtils.getHistoryRecordSeasonBuffs(self.isOpen, bossId, true))
		self.view.cycleBuffUList:SetList(BossRushUtils.getHistoryRecordBatBuffs(self.isOpen, bossId))
	elseif self.type == 2 then
		self.view.normalBuffUList:SetList(BossRushUtils.getNormalBuffList())
		self.view.specialBuffUList:SetList(BossRushUtils.getSpecialBuffList(self.isOpen))
	end
end

function BossRushChallengeCtrl:renderBossModel()
	if not self.uiScene then
		return
	end

	self.showLuckyPet = false

	if self.showTarget then
		local leftEntity = self.showTarget == Const.BossRushTeleportTarget.BossLeft and {
			applyAnim = true,
			templateId = self.levelData.bossId
		} or nil
		local rightEntity = self.showTarget == Const.BossRushTeleportTarget.BossRight and {
			applyAnim = true,
			templateId = self.levelData.bossId
		} or nil
		local midEntity = self.showTarget == Const.BossRushTeleportTarget.BossMid and {
			applyAnim = true,
			templateId = self.levelData.bossId
		} or nil

		self.uiScene:setEntities(leftEntity, rightEntity, midEntity, nil, nil)

		if self.showTarget == Const.BossRushTeleportTarget.BossMid and self.cycleData.recommendPet then
			self.uiScene:setLuckyPetModel(self.cycleData.recommendPet, self.view.luckyUButton.transform, self.showTarget)
		elseif self.showTarget == Const.BossRushTeleportTarget.BossLeft and self.cycleData.recommendPetLeft then
			self.uiScene:setLuckyPetModel(self.cycleData.recommendPetLeft, self.view.luckyUButton.transform, self.showTarget)
		elseif self.showTarget == Const.BossRushTeleportTarget.BossRight and self.cycleData.recommendPetRight then
			self.uiScene:setLuckyPetModel(self.cycleData.recommendPetRight, self.view.luckyUButton.transform, self.showTarget)
		else
			self.uiScene:setLuckyPetModel(nil, nil)
		end
	end

	if self.showTarget then
		self.uiScene:switchCameraPos(self.showTarget)
		self:refreshDof(true)
	end

	self:refreshBossBaseInfo(self.showTarget)
	self.view.luckyPetUWidget:SetActive(self.showLuckyPet)
end

function BossRushChallengeCtrl:refreshDof(visible)
	local visibleL, visibleM, visibleR = false, false, false

	if self.showTarget == Const.BossRushTeleportTarget.BossLeft then
		visibleL = visible
	elseif self.showTarget == Const.BossRushTeleportTarget.BossMid then
		visibleM = visible
	elseif self.showTarget == Const.BossRushTeleportTarget.BossRight then
		visibleR = visible
	end

	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushChallengeL, visibleL)
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushChallengeM, visibleM)
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushChallengeR, visibleR)
end

function BossRushChallengeCtrl:getShowTarget()
	if not self.levelIds then
		return
	end

	if self.levelId == self.levelIds[1] then
		return Const.BossRushTeleportTarget.BossLeft
	elseif self.levelId == self.levelIds[2] then
		return Const.BossRushTeleportTarget.BossMid
	elseif self.levelId == self.levelIds[3] then
		return Const.BossRushTeleportTarget.BossRight
	end
end

function BossRushChallengeCtrl:onVisibleChange(visible)
	self:refreshDof(visible)
end

function BossRushChallengeCtrl:onDestroy()
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushChallengeL, false)
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushChallengeM, false)
	pg.game.camera:setDofEnable(CameraConst.DofStateKeys.BossRushChallengeR, false)
	UICtrl.onDestroy(self)
end

function BossRushChallengeCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function BossRushChallengeCtrl:onShow()
	return
end

function BossRushChallengeCtrl:onHide()
	return
end

return BossRushChallengeCtrl
