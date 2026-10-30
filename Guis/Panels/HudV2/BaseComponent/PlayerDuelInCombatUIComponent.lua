-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\BaseComponent\\PlayerDuelInCombatUIComponent.lua

local HudBaseComponent = require("Guis.Panels.HudV2.HudBaseComponent")
local Class = require("Core.Framework.Class")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Messagename = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local DungeonConst = require("Common.Const.DungeonConst")
local PlayerDuelInCombatUIComponent = Class.LightClass("PlayerDuelInCombatUIComponent", HudBaseComponent)

PlayerDuelInCombatUIComponent.messages = {
	[Messagename.PLAYER_DUEL_PET_DEATH] = {
		"refeshPetState"
	}
}

function PlayerDuelInCombatUIComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.leftCuratorObjectReference = objectReference:GetRefValue("leftCuratorObjectReference")
	self.rightPlayerObjectReference = objectReference:GetRefValue("rightPlayerObjectReference")
	self.titleUWidget = objectReference:GetRefValue("titleUWidget")
	self.listUList = objectReference:GetRefValue("listUList")
	self.hudTargetObjectReference = objectReference:GetRefValue("hudTargetObjectReference")

	self.titleUWidget.gameObject:SetActiveEx(false)
	self.listUList.gameObject:SetActiveEx(false)
end

function PlayerDuelInCombatUIComponent:initView()
	if not pg.space or not pg.space:isPlayerDuel() then
		return
	end

	local selfEntity, opponentEntity = pg.space:getPlayerEntities()

	if opponentEntity then
		local objectReference = self.leftCuratorObjectReference:GetComponent("ObjectReference")
		local textUSDFText = objectReference:GetRefValue("textUSDFText")
		local listUList = objectReference:GetRefValue("listUList")

		ClientTextUtils.setText(textUSDFText, opponentEntity.playerName)

		local camp = 1

		function listUList.luaRenderItem(button, index, data)
			local isDie = ToBool(data.isDie) or ToBool(data.isEmpty)

			button:TryChangePage("Camp", camp)
			button:TryChangePage("Stage", isDie and 1 or 0)
		end

		self.leftListUList = listUList
	end

	if selfEntity then
		local objectReference = self.rightPlayerObjectReference:GetComponent("ObjectReference")
		local textUSDFText = objectReference:GetRefValue("textUSDFText")
		local listUList = objectReference:GetRefValue("listUList")
		local camp = 0

		ClientTextUtils.setText(textUSDFText, selfEntity.playerName)

		function listUList.luaRenderItem(button, index, data)
			local isDie = ToBool(data.isDie) or ToBool(data.isEmpty)

			button:TryChangePage("Camp", camp)
			button:TryChangePage("Stage", isDie and 1 or 0)
		end

		self.rightListUList = listUList
	end

	self:refeshPetState()
	self:refreshCondi()
	self:refreshTask()
end

function PlayerDuelInCombatUIComponent:refeshPetState()
	if not pg.space or not pg.space:isPlayerDuel() then
		return
	end

	local playPetDieState, botPetDieState = pg.space:getPetDieState()

	self.rightListUList:SetList(playPetDieState)
	self.leftListUList:SetList(botPetDieState)
end

function PlayerDuelInCombatUIComponent:refreshCondi()
	local objectReference = self.hudTargetObjectReference
	local tabObjectReference = objectReference:GetRefValue("tabObjectReference")
	local detailsObjectReference = objectReference:GetRefValue("detailsObjectReference")
	local rootUComponent = objectReference:GetRefValue("rootUComponent")

	self.questListUList = detailsObjectReference:GetRefValue("questListUList")

	local questTitleUComponent = detailsObjectReference:GetRefValue("questTitleUComponent")
	local questTitleObjectReference = questTitleUComponent:GetComponent("ObjectReference")

	self.countDownTimerUContainer = detailsObjectReference:GetRefValue("timeCountdownUContainer")
	self.questTitleUSDFText = questTitleObjectReference:GetRefValue("textTitleUSDFText")

	ClientTextUtils.setText(self.questTitleUSDFText, pg.getGameString("NPCDUEL_BATTLE_WIN_CONDITION"))
	questTitleUComponent:TryChangePage("TaskType", "white")

	local listUList = tabObjectReference:GetRefValue("listUList")

	function listUList.luaRenderItem(button, idx, objcvData)
		local objectReference = button:GetComponent("ObjectReference")
		local ubutton = objectReference:GetRefValue("iconUButton")
		local line = objectReference:GetRefValue("lineUWidget")

		ubutton.isSelected = true

		line.gameObject:SetActiveEx(false)
		ubutton:TryChangePage("TaskType", "battleroom")
		ubutton:TryChangePage("TrackType", "quest")
	end

	function self.questListUList.luaRenderItem(button, idx, objcvData)
		self:setTargetObjectiveInfo(button, idx, objcvData)
	end

	rootUComponent:TryChangePage("challengeState", "show")
	rootUComponent:TryChangePage("TrackType", "target")
	listUList:SetList({
		{}
	})
	self:loadWinTimer()
end

function PlayerDuelInCombatUIComponent:refreshTask()
	local data = {}
	local winConditon = pg.me:getNpcDuelWinCondDesc()

	if not string.isNilOrEmpty(winConditon) then
		data[#data + 1] = {
			str = winConditon
		}
	end

	self.questListUList:SetList(data)
end

function PlayerDuelInCombatUIComponent:setTargetObjectiveInfo(button, idx, data)
	local objectReference = button:GetComponent("ObjectReference")
	local contentTxt = objectReference:GetRefValue("contentTxt")

	button:TryChangePage("TaskType", "white")
	ClientTextUtils.setText(contentTxt, pg.getGameString("NPCDUEL_BATTLE_DEFEAT_ALL"))
end

function PlayerDuelInCombatUIComponent:loadWinTimer()
	if self.countDownTimerUContainer:CheckURLLoaded() then
		self:startWinTimer(self.countDownTimerUContainer.content)
	else
		self.countDownTimerUContainer:LoadDefaultUrlManually(function(content)
			if not self.transform or IsNil(content) then
				return
			end

			self:startWinTimer(content)
		end)
	end
end

function PlayerDuelInCombatUIComponent:startWinTimer(button)
	local objectReference = button:GetComponent("ObjectReference")
	local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

	local function getRemainTime()
		if pg.space and pg.space:IsStatus(DungeonConst.STATUS.PLAYING) then
			return pg.space:getStateRemainTime()
		end

		return 0
	end

	ClientTextUtils.setText(txtNameUSDFText, LuaUIUtils.getCountDownFormateText(getRemainTime(), false))
	self:killTimer(self.winTimer)

	self.winTimer = self:startTimer(function()
		if not pg.space then
			self:stopWinTimer()

			return
		end

		local remainTime = getRemainTime()

		ClientTextUtils.setText(txtNameUSDFText, LuaUIUtils.getCountDownFormateText(remainTime, false))
	end, 1, true)
end

function PlayerDuelInCombatUIComponent:stopWinTimer()
	self:killTimer(self.winTimer)

	self.winTimer = nil
end

function PlayerDuelInCombatUIComponent:onClose()
	self:stopWinTimer()
	HudBaseComponent.onClose(self)
end

function PlayerDuelInCombatUIComponent:onDestroy()
	self:stopWinTimer()
	HudBaseComponent.onDestroy(self)
end

return PlayerDuelInCombatUIComponent
