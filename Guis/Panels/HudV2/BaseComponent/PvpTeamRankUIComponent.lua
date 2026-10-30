-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\BaseComponent\\PvpTeamRankUIComponent.lua

local Class = require("Core.Framework.Class")
local HudBaseComponent = require("Guis.Panels.HudV2.HudBaseComponent")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local RobEggBornData = require("Data.rob_egg_born_data")
local SysConfigData = require("Data.sys_config_data")
local Time = require("Core.Common.Time")
local DungeonConst = require("Common.Const.DungeonConst")
local COLOR_TEAM_IDS = {
	2,
	1,
	3
}
local MAX_UI_PARENT_DEPTH = 32

local function normalizePoint(point, maxPoint)
	return maxPoint and maxPoint > 0 and math.max(0, math.min(1, (point or 0) / maxPoint)) or 0
end

local function formatProgress(progress)
	return progress >= 1 and "100%" or string.format("%.1f%%", progress * 100)
end

local PvpTeamRankUIComponent = Class.LightClass("PvpTeamRankUIComponent", HudBaseComponent)

PvpTeamRankUIComponent.messages = {
	[MessageName.GRAB_EGG_TEAM_POINT_CHANGED] = {
		"refreshTeamRank",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshTeamRank",
		true
	},
	[MessageName.DUNGEON_STATE_CHANGE] = {
		"refreshTeamRank",
		true
	}
}

function PvpTeamRankUIComponent:onRootNodeLoaded(trans)
	local visible = self._visible

	HudBaseComponent.onRootNodeLoaded(self, trans)

	self._visible = visible
	self.rankMessagesRegistered = true

	self:refreshVisible()
end

function PvpTeamRankUIComponent:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.rootComponent = self.transform:GetComponent("UComponent")
	self.processbarAll = objectReference:GetRefValue("processbarAll")
	self.allProcessText = objectReference:GetRefValue("allProcessText")
	self.teamPanels = {}

	for index = 1, 3 do
		local panel = objectReference:GetRefValue("team" .. index .. "panel")
		local teamReference = panel:GetComponent("ObjectReference")

		self.teamPanels[index] = {
			component = panel:GetComponent("UComponent"),
			processText = teamReference:GetRefValue("processText")
		}

		if index == 1 then
			self.treasureTxt = teamReference:GetRefValue("treasureTxt")
			self.treasureLayoutBox = panel.transform:Find("Content/LayoutBox"):GetComponent("ULayoutBox")
		end
	end
end

function PvpTeamRankUIComponent:initView()
	for index, teamPanel in ipairs(self.teamPanels) do
		teamPanel.component:TryChangePage("State", index == 1 and 1 or 0)
	end

	self:refreshVisible()
end

function PvpTeamRankUIComponent:isRankUIVisible()
	if self._visible == false or not self.ctrl then
		return false
	end

	local owner = self.ctrl

	for _ = 1, MAX_UI_PARENT_DEPTH do
		if owner.layoutVisible == false then
			return false
		end

		if not owner.ctrl then
			if type(self.ctrl.checkUIShow) ~= "function" or type(owner.checkUIVisible) ~= "function" then
				return false
			end

			return self.ctrl:checkUIShow() == true and owner:checkUIVisible() == true
		end

		owner = owner.ctrl
	end

	return false
end

function PvpTeamRankUIComponent:stopFinishEffectTimer()
	self:killTimer(self.finishEffectTimer)

	self.finishEffectTimer = nil
end

function PvpTeamRankUIComponent:suspendRankUpdates()
	if self.rankMessagesRegistered then
		pg.global.ui:unRegisterComponentMessages(self)

		self.rankMessagesRegistered = false
	end

	self:stopFinishEffectTimer()
end

function PvpTeamRankUIComponent:refreshVisible()
	if not self.teamPanels then
		return
	end

	local space = pg.space
	local visible = space and space:isGrabEgg() and space.isPvp == true or false
	local active = visible and self:isRankUIVisible()

	if self.rankMessagesRegistered ~= nil and self.rankMessagesRegistered ~= active then
		if active then
			pg.global.ui:registerComponentMessages(self)
		else
			pg.global.ui:unRegisterComponentMessages(self)
		end

		self.rankMessagesRegistered = active
	end

	local show = visible and self._visible ~= false

	self.ctrl.pvpTeamRankUContainer:SetActive(show)
	self.uWidget:SetActive(show)

	if active then
		self:refreshTeamRank()

		if not self.finishEffectPlayed and not self.finishEffectTimer then
			self.finishEffectTimer = self:startTimer(function()
				self:tryPlayFinishEffect()
			end, 1, true)
		end
	else
		self:stopFinishEffectTimer()
	end
end

function PvpTeamRankUIComponent:refreshTeamRank()
	local space = pg.space

	if not self.teamPanels or not space or not space:isGrabEgg() or space.isPvp ~= true or not self:isRankUIVisible() then
		return
	end

	local bornData = RobEggBornData[space.masterDungeonSceneId or space.sceneId]
	local teamSpawners = bornData and bornData.egglinkTeamID or {}
	local teamInfo = space.teamInfo or {}
	local myTeamId = pg.me and teamInfo.id_to_team and teamInfo.id_to_team[pg.me.uid]

	if myTeamId == "" then
		myTeamId = nil
	end

	local points = space.teamPointInfo or {}
	local maxPoint = SysConfigData.grabegg_pvp_capture_progress_max
	local spawnerToTeam = {}

	for teamId, info in pairs(teamInfo.teams or {}) do
		if info.bornSpawnerId then
			spawnerToTeam[info.bornSpawnerId] = teamId
		end
	end

	local teamsByColor = {}
	local teamColors = {}

	for index, colorTeamId in ipairs(COLOR_TEAM_IDS) do
		for _, spawnerId in ipairs(teamSpawners[colorTeamId] or {}) do
			local teamId = spawnerToTeam[spawnerId]

			if teamId then
				teamsByColor[index] = teamId
				teamColors[teamId] = index - 1

				break
			end
		end
	end

	local totalProgress = normalizePoint(space.totalPointValue, maxPoint)

	self.processbarAll.normalizedValue = totalProgress

	ClientTextUtils.setText(self.allProcessText, formatProgress(totalProgress))
	self.rootComponent:TryChangePage("Color", teamColors[space.curControlTeam] or 3)

	local panelTeams = {
		myTeamId
	}
	local myColor = teamColors[myTeamId] or 0
	local panelColors = {
		myColor
	}
	local panelIndex = 2

	for index = 1, #COLOR_TEAM_IDS do
		if index - 1 ~= myColor then
			panelTeams[panelIndex] = teamsByColor[index]
			panelColors[panelIndex] = index - 1
			panelIndex = panelIndex + 1
		end
	end

	for index, teamPanel in ipairs(self.teamPanels) do
		local teamId = panelTeams[index]
		local progress = normalizePoint(teamId and points[teamId], maxPoint)
		local isLinking = teamId ~= nil and teamId == space.curControlTeam

		teamPanel.component:TryChangePage("TeamColor", panelColors[index])
		teamPanel.component:TryChangePage("Highlight", isLinking and 1 or 0)
		ClientTextUtils.setText(teamPanel.processText, formatProgress(progress))
	end

	local treasureCount = 0
	local rewards = myTeamId and space.teamRewardBox and space.teamRewardBox[myTeamId]

	for _, count in pairs(rewards or {}) do
		treasureCount = treasureCount + count
	end

	ClientTextUtils.setText(self.treasureTxt, treasureCount)

	local playTreasureEffect = self.lastTreasureSpace == space and self.lastTreasureTeamId == myTeamId and self.lastTreasureCount ~= nil and treasureCount > self.lastTreasureCount

	self.lastTreasureSpace = space
	self.lastTreasureTeamId = myTeamId
	self.lastTreasureCount = treasureCount

	if playTreasureEffect then
		self.treasureLayoutBox:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end

	self:tryPlayFinishEffect()
end

function PvpTeamRankUIComponent:tryPlayFinishEffect()
	local space = pg.space

	if not self.rootComponent or not space or not space:isGrabEgg() or space.isPvp ~= true or not self:isRankUIVisible() then
		self:suspendRankUpdates()

		return
	end

	if self.finishEffectSpace ~= space then
		self.finishEffectSpace = space
		self.finishEffectPlayed = false
	end

	if self.finishEffectPlayed then
		return
	end

	local progressFull = normalizePoint(space.totalPointValue, SysConfigData.grabegg_pvp_capture_progress_max) >= 1
	local timeOver = space.status == DungeonConst.STATUS.PLAYING and (space.end_ts or 0) > 0 and space.end_ts <= Time.secondCache
	local settled = space.status == DungeonConst.STATUS.REWARD or space.status == DungeonConst.STATUS.CLOSE

	if progressFull or timeOver or settled then
		self.finishEffectPlayed = true

		self:stopFinishEffectTimer()
		self.rootComponent:InvokeCallback(CS.XGUI.EInvokeTime.Custom1)
	end
end

function PvpTeamRankUIComponent:onShow()
	self:refreshVisible()
end

function PvpTeamRankUIComponent:onHide()
	self:suspendRankUpdates()
end

function PvpTeamRankUIComponent:onVisibleChange(visible)
	if visible then
		self:refreshVisible()
	else
		self:suspendRankUpdates()
	end
end

function PvpTeamRankUIComponent:onDestroy()
	self:stopFinishEffectTimer()

	self.finishEffectSpace = nil
	self.lastTreasureSpace = nil

	if self.uWidget then
		self.uWidget:SetActive(false)
	end

	HudBaseComponent.onDestroy(self)
end

return PvpTeamRankUIComponent
