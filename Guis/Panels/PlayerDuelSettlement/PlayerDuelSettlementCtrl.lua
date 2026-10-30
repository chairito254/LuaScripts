-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PlayerDuelSettlement\\PlayerDuelSettlementCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Time = require("Core.Common.Time")
local PlayerDuelSettlementCtrl = Class.LightClass("PlayerDuelSettlementCtrl", UICtrl)
local PetData = require("Data.pet_data")
local MessageName = require("Const.MessageName")
local DungeonConst = require("Common.Const.DungeonConst")

PlayerDuelSettlementCtrl.messages = {
	[MessageName.PLAYER_DUEL_END_CHOICES_CHANGED] = {
		"refreshChoiceState",
		true
	},
	[MessageName.DUNGEON_STATE_CHANGE] = {
		"refreshCountDown",
		true
	},
	[MessageName.ON_PLAYER_LEAVE_SPACE] = {
		"close",
		true
	}
}

function PlayerDuelSettlementCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function PlayerDuelSettlementCtrl:checkCommonQuit()
	return false
end

function PlayerDuelSettlementCtrl:addListener()
	function self.view.btnSwitchUButton.luaClick()
		self:onClickSwitch()
	end

	function self.view.btnEndUButton.luaClick()
		pg.me:serverSpaceMsg("RPC_CS_PlayerDuelExit")
	end

	function self.view.btnMoreRoundUButton.luaClick()
		pg.me:serverSpaceMsg("RPC_CS_PlayerDuelRematch")
	end
end

function PlayerDuelSettlementCtrl:onDestroy()
	self:killTimer(self.countDownTimer)
	UICtrl.onDestroy(self)
end

function PlayerDuelSettlementCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	local meResult, opponentResult

	for _, v in ipairs(info.playerResults) do
		if v.playerId == pg.me.id then
			meResult = v
		else
			opponentResult = v
		end
	end

	self.detalisUWidgets = {}
	self.isShowDetails = false

	self:refreshSwitchText()
	ClientTextUtils.setText(self.view.titleDownUSDFText, ClientTextUtils.getGameString("DUEL_END"))
	ClientTextUtils.setText(self.view.titleUpUSDFText, ClientTextUtils.getGameString("DUEL_END"))
	ClientTextUtils.setText(self.view.tipTextUSDFText, ClientTextUtils.getGameString("DUEL_INFO"))
	self:refreshAvatar(meResult, self.view.avatarLeftUComponent, self.view.textLeftUSDFText)
	self:refreshAvatar(opponentResult, self.view.avatarRightUComponent, self.view.textRightUSDFText)
	self:refreshDuelData(meResult, self.view.leftListUList, true)
	self:refreshDuelData(opponentResult, self.view.rightListUList, false)
	self:refreshCountDown()
	self:refeshChoiceButton()
end

PlayerDuelSettlementCtrl.END_CHOICE = {
	EXIT = 2,
	REMATCH = 1,
	NONE = 0
}

function PlayerDuelSettlementCtrl:refeshChoiceButton()
	local objectReference = self.view.btnEndUButton:GetComponent("ObjectReference")
	local uIBtn1stConfirmUButton = objectReference:GetRefValue("uIBtn1stConfirmUButton")
	local txtNameUText = objectReference:GetRefValue("txtNameUText")

	uIBtn1stConfirmUButton:TryChangePage("Type", "Cancel")

	local function refreshChoiceList(button, index, data, expectedChoice)
		local uwidget = button:GetComponent("UButton")

		if data.isOnePlayer then
			uwidget:TryChangePage("Teammate", "1P")
		else
			uwidget:TryChangePage("Teammate", "2P")
		end

		uwidget:TryChangePage("State", data.choice == expectedChoice and "Normal" or "Empty")
	end

	ClientTextUtils.setText(txtNameUText, ClientTextUtils.getGameString("DUEL_QUIT"))

	function self.view.choiceMoreRoundUList.luaRenderItem(button, index, data)
		refreshChoiceList(button, index, data, PlayerDuelSettlementCtrl.END_CHOICE.REMATCH)
	end

	objectReference = self.view.btnMoreRoundUButton:GetComponent("ObjectReference")
	uIBtn1stConfirmUButton = objectReference:GetRefValue("uIBtn1stConfirmUButton")
	txtNameUText = objectReference:GetRefValue("txtNameUText")

	ClientTextUtils.setText(txtNameUText, ClientTextUtils.getGameString("DUEL_REMATCH"))

	function self.view.choiceEndRoundUList.luaRenderItem(button, index, data)
		refreshChoiceList(button, index, data, PlayerDuelSettlementCtrl.END_CHOICE.EXIT)
	end

	self:refreshChoiceState()
end

function PlayerDuelSettlementCtrl:refreshChoiceState()
	local playerDuelEndChoices = pg.space.playerDuelEndChoices or {}
	local leaderUid = pg.space.playerDuelLeaderUid
	local onePlayer, secondPlayer

	for _playerUid, choice in pairs(playerDuelEndChoices) do
		if _playerUid == leaderUid then
			onePlayer = choice
		else
			secondPlayer = choice
		end
	end

	local choiceState = {
		{
			isOnePlayer = true,
			choice = onePlayer or PlayerDuelSettlementCtrl.END_CHOICE.NONE
		},
		{
			isOnePlayer = false,
			choice = secondPlayer or PlayerDuelSettlementCtrl.END_CHOICE.NONE
		}
	}

	self.view.choiceMoreRoundUList:SetList(choiceState)
	self.view.choiceEndRoundUList:SetList(choiceState)
end

function PlayerDuelSettlementCtrl:refreshAvatar(result, widget, nameText)
	local playerInfo = result.playerInfo

	LuaUIUtils.renderPlayerAvatarImages(widget, {
		avatarIconId = playerInfo.headIcon,
		avatarFrameIconId = playerInfo.headFrame
	}, true)
	ClientTextUtils.setText(nameText, playerInfo.playerName)
end

function PlayerDuelSettlementCtrl:refreshDuelData(result, listUList, reverse)
	local petStats = result.petStats

	function listUList.luaRenderItem(button, index, data)
		self:refeshListItem(button, index, data)
	end

	local stats = {}

	for i = 1, 4 do
		stats[i] = petStats[i] or {
			isEmpty = true
		}
	end

	if reverse then
		local reversedStats = {}

		for i = #stats, 1, -1 do
			table.insert(reversedStats, stats[i])
		end

		listUList:SetList(reversedStats)
	else
		listUList:SetList(stats)
	end
end

function PlayerDuelSettlementCtrl:refeshListItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
	local panelCPUContainer = objectReference:GetRefValue("panelCPUContainer")
	local rootUWidget = objectReference:GetRefValue("rootUWidget")
	local progressUProgress = objectReference:GetRefValue("progressUProgress")
	local tagTitleUWidget = objectReference:GetRefValue("tagTitleUWidget")

	tagTitleUWidget.gameObject:SetActiveEx(false)

	local topTitleObjectReference = objectReference:GetRefValue("topTitleObjectReference")
	local listUList = objectReference:GetRefValue("listUList")

	if data.isEmpty then
		rootUWidget:TryChangePage("State", "Empty")

		return
	end

	rootUWidget:TryChangePage("State", self.isShowDetails and "Details" or "Head")
	table.insert(self.detalisUWidgets, rootUWidget)

	progressUProgress.value = data.hpRatio or 0

	local iconUrl = LuaUIUtils.getPetIconByTemplateId(data.templateId, LuaUIUtils.PET_CARD_ILLUSTRATE_BOOK)

	iconUImage.url = iconUrl

	local pData = PetData[data.templateId]

	if not pData then
		return
	end

	local nameKey = pData.name
	local defaultName = pg.getLocalizationText(nameKey)

	ClientTextUtils.setText(txtNameUSDFText, defaultName)
	LuaUIUtils.refreshPanelCPUContainer(panelCPUContainer, data.templateId, data.level)

	local details = {
		{
			title = pg.getGameString("DUEL_DPS"),
			value = data.avgDps or 0
		},
		{
			title = pg.getGameString("DUEL_BREAK"),
			value = data.breakValue or 0
		},
		{
			title = pg.getGameString("DUEL_DT"),
			value = data.damageTaken or 0
		},
		{
			title = pg.getGameString("DUEL_HEAL"),
			value = data.healValue or 0
		}
	}

	function listUList.luaRenderItem(button, index, data)
		self:refeshSingleData(button, index, data)
	end

	listUList:SetList(details)
end

function PlayerDuelSettlementCtrl:refeshSingleData(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	local textNumUSDFText = objectReference:GetRefValue("textNumUSDFText")

	ClientTextUtils.setText(txtTitleUSDFText, data.title)
	ClientTextUtils.setText(textNumUSDFText, data.value)
end

function PlayerDuelSettlementCtrl:refreshCountDown()
	self:killTimer(self.countDownTimer)

	local function updateCountDown()
		local remainTime = 0

		if pg.space and pg.space.status == DungeonConst.STATUS.REWARD then
			remainTime = pg.space:getStateRemainTime()
		end

		ClientTextUtils.setText(self.view.countDownUSDFText, string.format("%ds", remainTime))

		if pg.space == nil then
			self:killTimer(self.countDownTimer)
		end
	end

	self.countDownTimer = self:startTimer(updateCountDown, 1, true)

	updateCountDown()
end

function PlayerDuelSettlementCtrl:onClickSwitch()
	self.isShowDetails = not self.isShowDetails

	for _, widget in ipairs(self.detalisUWidgets) do
		widget:TryChangePage("State", self.isShowDetails and "Details" or "Head")
	end

	self:refreshSwitchText()
end

function PlayerDuelSettlementCtrl:refreshSwitchText()
	ClientTextUtils.setText(self.view.buttonSwitchUSDFText, self.isShowDetails and ClientTextUtils.getGameString("DUEL_CLOSE_DETAILS") or ClientTextUtils.getGameString("DUEL_DETAILS"))
end

return PlayerDuelSettlementCtrl
