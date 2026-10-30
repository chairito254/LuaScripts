-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TeamRoom\\Component\\TeamRoomBossRushComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local BossRushUtils = require("Utils.BossRushUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local UIConst = require("Const.UIConst")
local Const = require("Common.Const.Const")
local MessageName = require("Const.MessageName")
local BossRushBuffData = require("Data.bossrush_buff_data")
local BossRushLevelData = require("Data.bossrush_guanka_data")
local BossRushCycleData = require("Data.bossrush_cycle_data")
local PuppetData = require("Data.puppet_data")
local AvatarRobotData = require("Data.avatar_robot_data")
local RedDotConst = require("Const.RedDotConst")
local UICardRenderUtils = require("Guis.Utils.UICardRenderUtils")
local TeamRoomBossRushComponent = Class.LightClass("TeamRoomBossRushComponent", UIComponent)

function TeamRoomBossRushComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.envBuffLabelTextPlus = objectReference:GetRefValue("envBuffLabelTextPlus")
	self.envBuffListUList = objectReference:GetRefValue("envBuffListUList")
	self.bossPortraitUImage = objectReference:GetRefValue("bossPortraitUImage")
	self.bossNameTextPlus = objectReference:GetRefValue("bossNameTextPlus")
	self.recommendElementLabelTextPlus = objectReference:GetRefValue("recommendElementLabelTextPlus")
	self.recommendElementUList = objectReference:GetRefValue("recommendElementUList")
	self.cycleBuffLabelTextPlus = objectReference:GetRefValue("cycleBuffLabelTextPlus")
	self.seasonBuffLabelTextPlus = objectReference:GetRefValue("seasonBuffLabelTextPlus")
	self.cycleBuffAddUButton = objectReference:GetRefValue("cycleBuffAddUButton")
	self.seasonBuffUList = objectReference:GetRefValue("seasonBuffUList")
	self.cycleBuffUButton = objectReference:GetRefValue("cycleBuffUButton")
	self.btnConfirmUButton = objectReference:GetRefValue("btnConfirmUButton")
	self.readyUBaseText = objectReference:GetRefValue("readyUBaseText")
	self.buffContentUComponent = objectReference:GetRefValue("buffContentUComponent")
	self.topBossUComponent = objectReference:GetRefValue("topBossUComponent")
	self.bossPortraitDouble1UImage = objectReference:GetRefValue("bossPortraitDouble1UImage")
	self.bossPortraitDouble2UImage = objectReference:GetRefValue("bossPortraitDouble2UImage")
	self.bossNameDouble1TextPlus = objectReference:GetRefValue("bossNameDouble1TextPlus")
	self.bossNameDouble2TextPlus = objectReference:GetRefValue("bossNameDouble2TextPlus")
	self.conditionTipsUWidget = objectReference:GetRefValue("conditionTipsUWidget")
	self.conditionTipsTextPlus = objectReference:GetRefValue("conditionTipsTextPlus")
	self.btnCyclePanelUButton = objectReference:GetRefValue("btnCyclePanelUButton")
	self.btnSeasonPanelUButton = objectReference:GetRefValue("btnSeasonPanelUButton")
	self.btnConfirmUText = self.btnConfirmUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")

	ClientTextUtils.setText(self.envBuffLabelTextPlus, pg.getGameString("BOSS_RUSH_ENV_INFO_TIP"))
	ClientTextUtils.setText(self.recommendElementLabelTextPlus, pg.getGameString("Rift_RecommendElement"))
	ClientTextUtils.setTextWithId(self.cycleBuffLabelTextPlus, 1667600754)
	ClientTextUtils.setText(self.seasonBuffLabelTextPlus, pg.getGameString("BOSS_RUSH_CHALLENGE_TIP1"))
	ClientTextUtils.setText(self.conditionTipsTextPlus, pg.getGameString("BOSS_RUSH_CHALLENGE_TIP6"))
end

TeamRoomBossRushComponent.messages = {
	[MessageName.BOSS_RUSH_TEAM_INFO_CHANGED] = {
		"refreshTeamInfo",
		true
	},
	[MessageName.BOSS_RUSH_TEAM_BUFF_CHANGED] = {
		"refreshBuffInfo",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"onSyncTeamInfo",
		true
	},
	[MessageName.BOSS_RUSH_TEAM_LEVEL_ID_CHANGED] = {
		"refreshButtons",
		true
	}
}

function TeamRoomBossRushComponent:onCtor()
	self.levelId = BossRushUtils.getRoomLevelId()
end

function TeamRoomBossRushComponent:initView()
	function self.envBuffListUList.luaRenderItem(button, index, data)
		BossRushUtils.renderBuffItem(button, index, data)

		button.enabledTooltip = false
	end

	function self.envBuffListUList.luaClick(button, data)
		local config = BossRushBuffData[data.buffId] or {}

		LuaUIUtils.setSkillTipButton2(button, {
			tags = {},
			skillName = config.buffName or "",
			skillDesc = config.desc or "",
			skillIcon = config.buffIcon or ""
		})
		button:OpenTooltipWithUrl("$UI_Node_SkillInfoTips.prefab")
	end

	function self.seasonBuffUList.luaRenderItem(button, index, data)
		local levelText = button.transform:Find("TxtName"):GetComponent("USDFText")
		local icon = button.transform:Find("Normal/Icon"):GetComponent("UImage")

		if data.isUnlock ~= nil then
			button:TryChangePage("State", data.isUnlock and 0 or 1)
			levelText:SetActiveFastest(data.isUnlock)

			if data.level then
				ClientTextUtils.setText(levelText, ClientTextUtils.formatShortLevel(data.level))
			end
		end

		if data.state == 0 then
			local config = BossRushBuffData[data.buffId] or {}

			icon.url = config.buffIcon or ""
		end
	end

	function self.seasonBuffUList.luaClick()
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			buffIndex = 1,
			isShow = true,
			tab = 0
		})
	end

	function self.cycleBuffAddUButton.luaClick()
		self:openBuffSelect()
	end

	function self.cycleBuffUButton.luaClick()
		self:openBuffSelect()
	end

	function self.btnConfirmUButton.luaClick()
		self:confirm()
	end

	function self.btnCyclePanelUButton.luaClick()
		self:openBuffSelect()
	end

	function self.btnSeasonPanelUButton.luaClick()
		pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
			buffIndex = 1,
			isShow = true,
			tab = 0
		})
	end

	self.ctrl:bindHotKeyPerform("Raw/GamepadButtonNorth", function()
		self.btnConfirmUButton:OnClickSimulate()
	end)
	self.ctrl:bindHotKeyPerform("Raw/GamepadButtonWest", function()
		self:openBuffSelect()
	end)

	local levelData = BossRushLevelData[self.levelId]

	if levelData == nil then
		return
	end

	local bossInfo = PuppetData[levelData.bossId]

	if not bossInfo then
		return
	end

	self:setLevelInfo(levelData, bossInfo)
	BossRushUtils.checkSelfPetAvailable(self.levelId)
	pg.me:openChallengeBoss(self.levelId)
	self:refreshBuffInfo()
	self:refreshTeamInfo()
end

function TeamRoomBossRushComponent:setLevelInfo(levelData, bossInfo)
	local secondBossInfo = levelData.bossId_2 and levelData.bossId_2 ~= 0 and PuppetData[levelData.bossId_2]

	self.topBossUComponent:TryChangePage("State", secondBossInfo and 1 or 0)

	local bossName = secondBossInfo and self.bossNameDouble1TextPlus or self.bossNameTextPlus
	local bossPortrait = secondBossInfo and self.bossPortraitDouble1UImage or self.bossPortraitUImage

	ClientTextUtils.setText(bossName, pg.getLocalizationText(bossInfo.BossShowName or ""))

	bossPortrait.url = LuaUIUtils.getPetIcon(bossInfo.iconName, LuaUIUtils.PET_ICON, 0)

	if secondBossInfo then
		ClientTextUtils.setText(self.bossNameDouble2TextPlus, pg.getLocalizationText(secondBossInfo.BossShowName or ""))

		self.bossPortraitDouble2UImage.url = LuaUIUtils.getPetIcon(secondBossInfo.iconName, LuaUIUtils.PET_ICON, 0)
	end

	LuaUIUtils.renderPetElement(self.recommendElementUList, levelData.elementRecmmend or {})

	local cycle = BossRushCycleData[pg.me.curBossRushCycleId]
	local road = BossRushUtils.getLevelIdRoad(self.levelId)
	local suffix = road == Const.BossRushTeleportTarget.BossLeft and "Left" or road == Const.BossRushTeleportTarget.BossMid and "Mid" or "Right"
	local envBuffs = {}

	for _, key in ipairs({
		"interactBuffRef",
		"envBuffRef"
	}) do
		local id = cycle[key .. suffix]

		if id and id ~= 0 then
			envBuffs[#envBuffs + 1] = {
				state = 0,
				buffId = id
			}
		end
	end

	self.envBuffListUList:SetList(envBuffs)
end

function TeamRoomBossRushComponent:openBuffSelect()
	pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BUFF_SELECT, {
		interactiveBuffIndex = 0,
		allowRecommend = true,
		allowSelect = true,
		isShow = false,
		tab = 0
	})

	self.buffIsNew = false

	self:refreshBuffInfo()
end

function TeamRoomBossRushComponent:refreshBuffInfo()
	if not pg.space then
		return
	end

	if self.buffIsNew == nil then
		local key = RedDotConst.RedDotPath.BOSS_RUSH_MAIN_BUFF .. pg.me.curBossRushCycleId

		self.buffIsNew = pg.me:getRedDotRecord(Const.CLIENT_KEY.BOSS_RUSH, key, true)
	end

	self.seasonBuffUList:SetList(BossRushUtils.getNormalBuffList(pg.space.teamLeaderSeasonStar))

	local data = BossRushUtils.getSelectBatBuffs(self.buffIsNew)[1]
	local isLeader = not pg.me:isInTeam() or pg.me:isTeamLeader()
	local hasBuff = data.state == 0

	self.buffContentUComponent:TryChangePage("BuffState", hasBuff and 1 or isLeader and 0 or 2)
	self.cycleBuffAddUButton:SetActive(not hasBuff)
	self.cycleBuffUButton:SetActive(hasBuff)
	BossRushUtils.renderBuffItem(self.cycleBuffUButton, 1, data)
	self:refreshButtons()
end

function TeamRoomBossRushComponent.getTeamInfo(model)
	local source = model:getTeamInfo()
	local info = {
		sortList = {},
		membersInfo = {},
		prepareInfos = {},
		leaderUid = source.leaderUid,
		dungeonSceneId = Const.BossRushSceneId,
		hardLv = source.hardLv
	}

	if not pg.space then
		return info
	end

	local levelId = BossRushUtils.getRoomLevelId()

	local function addMember(uid, entId, member, isBot)
		local copy = {}

		for k, v in pairs(member) do
			copy[k] = v
		end

		local petList = BossRushUtils.getPlayerSelectPets(entId, levelId)

		if isBot and #petList == 0 then
			petList = BossRushUtils.getPlayerSelectPets(entId, 0)
		end

		copy.petInfoList = petList
		copy.entityId = entId
		copy.isBot = isBot
		info.sortList[#info.sortList + 1] = uid
		info.membersInfo[uid] = copy
		info.prepareInfos[uid] = {
			petInfoList = petList,
			isPrepare = isBot or uid == info.leaderUid or BossRushUtils.isPlayerReady(entId, levelId)
		}
	end

	for _, uid in ipairs(source.sortList) do
		local member = source.membersInfo[uid]

		addMember(uid, uid == pg.me.uid and pg.me.id or member.entityId, member, false)
	end

	for _, entId in ipairs(pg.space.playerBotUidList or {}) do
		local ent = pg.getEntity(entId)

		if ent then
			local robot = AvatarRobotData[ent.botTemplateId]

			addMember(entId, entId, {
				playerName = robot and pg.getLocalizationText(robot.name) or ent.playerName,
				botTemplateId = ent.botTemplateId
			}, true)
		end
	end

	return info
end

function TeamRoomBossRushComponent:onSyncTeamInfo()
	self:refreshBuffInfo()
	self:refreshTeamInfo()
end

function TeamRoomBossRushComponent:refreshTeamInfo()
	if not pg.space then
		return
	end

	local info = TeamRoomBossRushComponent.getTeamInfo(self.model)
	local previousMembers = self.realTeamMembers
	local currentMembers = {}

	for _, uid in ipairs(info.sortList) do
		if not info.membersInfo[uid].isBot then
			currentMembers[uid] = true
		end
	end

	self.realTeamMembers = currentMembers

	if previousMembers and info.leaderUid == pg.me.uid then
		for uid in pairs(previousMembers) do
			if uid ~= pg.me.uid and not currentMembers[uid] then
				pg.global.ui.tips:showTextTip(pg.getGameString("BOSS_RUSH_TEAM_ADD_AI"))
				pg.me:serverMsg("RPC_CS_BossRushRequireAddBot")

				break
			end
		end
	end

	local previous = self.readyStates or {}

	self.readyStates = {}

	for _, uid in ipairs(info.sortList) do
		local ready = info.prepareInfos[uid].isPrepare

		self.readyStates[uid] = ready

		if previous[uid] ~= nil and previous[uid] ~= ready then
			if ready then
				self.ctrl.uiScene:onPlayerReady(uid)
			else
				self.ctrl.uiScene:onPlayerUnReady(uid)
			end
		end
	end

	self.ctrl:refreshTeamInfo()
end

function TeamRoomBossRushComponent:refreshButtons()
	if not pg.space then
		return
	end

	local isLeader = not pg.me:isInTeam() or pg.me:isTeamLeader()
	local isReady = BossRushUtils.isPlayerReady(pg.me.id, self.levelId)
	local prepareCount = 0
	local info = TeamRoomBossRushComponent.getTeamInfo(self.model)

	for _, uid in ipairs(info.sortList) do
		if info.prepareInfos[uid].isPrepare then
			prepareCount = prepareCount + 1
		end
	end

	local teamMembersCount = #info.sortList

	ClientTextUtils.setText(self.readyUBaseText, prepareCount, "/", teamMembersCount)
	self.view.btnConfirmUButton:SetActive(false)
	self.btnConfirmUButton:SetActive(true)
	self.view.btnCancelUButton:SetActive(false)
	self.view.btnCancelMatchUButton:SetActive(false)
	self.view.btnReleaseUButton:SetActive(false)
	self.view.btnReleaseUButton2:SetActive(false)
	self.view.challengeTipUBaseText:SetActive(false)

	local btnNeedDisable = isLeader and prepareCount ~= teamMembersCount

	self.btnConfirmUButton.interactable = not btnNeedDisable
	self.btnConfirmUButton.visualInteractable = not btnNeedDisable

	self.conditionTipsUWidget:SetActive(false)
	ClientTextUtils.setText(self.btnConfirmUText, pg.getGameString(isLeader and "TEAM_START_CHALLENGE" or isReady and "TEAM_CANCEL_READY" or "TEAM_READY"))
end

function TeamRoomBossRushComponent:confirm()
	local isLeader = not pg.me:isInTeam() or pg.me:isTeamLeader()

	if not isLeader and BossRushUtils.isPlayerReady(pg.me.id, self.levelId) then
		pg.me:serverMsg("RPC_CS_BossRushPrepare", self.levelId, 0)

		return
	end

	if #BossRushUtils.getPlayerSelectPets(pg.me.id, self.levelId) == 0 then
		pg.global.ui.tips:showTextTip(pg.getGameString("BOSS_RUSH_CHALLENGE_NO_PET"))

		return
	end

	if isLeader then
		if not (pg.space.selectBatBuffs or {})[1] then
			self:openBuffSelect()

			return
		end

		pg.me:goBossRushDungeon(self.levelId)
		self.ctrl:dismiss()
	else
		pg.me:serverMsg("RPC_CS_BossRushPrepare", self.levelId, 1)
	end
end

function TeamRoomBossRushComponent:selectPets()
	pg.global.ui.petManagement:open({
		isBossRush = true,
		levelId = self.levelId
	}, nil, nil, nil, nil, true)
end

function TeamRoomBossRushComponent:renderMembers()
	local ctrl = self.ctrl
	local info = TeamRoomBossRushComponent.getTeamInfo(self.model)

	for i, button in ipairs(self.view:getTeamMemberButtons()) do
		local uid = info.sortList[i]

		button:SetActive(uid ~= nil)

		if uid then
			local member = info.membersInfo[uid]
			local data = {}

			for k, v in pairs(member) do
				data[k] = v
			end

			data.uid, data.isSelf = uid, uid == pg.me.uid
			data.isLeader, data.isReady = uid == info.leaderUid, info.prepareInfos[uid].isPrepare
			data.petList = {}

			self.model:parsePetList(member.petInfoList, data.petList)

			function data.switchPetsFunc()
				self:selectPets()
			end

			function data.onNavFocused()
				if ctrl.commonCmp then
					ctrl.commonCmp:onMemberNavFocused(uid, i, data.isSelf)
				end
			end

			function data.onNavUnfocused()
				if ctrl.commonCmp then
					ctrl.commonCmp:onMemberNavUnfocused()
				end
			end

			button:TryChangePage("Team", #info.sortList > 1 and 0 or 1)
			button:TryChangePage("Position", i - 1)
			button:TryChangePage("PlayerState", 0)
			button:GetComponent("ObjectReference"):GetRefValue("uINodeTeamRoomCenterItemUComponent"):TryChangePage("Type", 1)
			UICardRenderUtils.render1Plus3RoomCard(button, data)

			function button.luaClick()
				if data.isSelf then
					self:selectPets()
				elseif not member.isBot then
					self.ctrl:playerClickHandle(button, data)
				end
			end
		end
	end

	self:refreshButtons()
end

function TeamRoomBossRushComponent.exitRoom(ctrl)
	if BossRushUtils.isInBossRushBattleLevel() then
		ctrl:dismiss()
	else
		pg.global.showConfirmMsgRaw(pg.getGameString("WARNING"), pg.getGameString("BOSS_RUSH_EXIT_CONFIRM_TIP"), function()
			pg.me:serverMsg("RPC_CS_BossRushQuitAndSettle")
			ctrl:dismiss()
		end, nil)
	end
end

return TeamRoomBossRushComponent
