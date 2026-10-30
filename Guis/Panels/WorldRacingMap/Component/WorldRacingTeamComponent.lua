-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRacingMap\\Component\\WorldRacingTeamComponent.lua

local logger = require("Core.Log.LoggerManager").getLogger("WorldRacingTeamComponent")
local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local ClientTextUtils = require("Utils.ClientTextUtils")
local TeamUtils = require("Utils.TeamUtils")
local UIConst = require("Const.UIConst")
local MessageName = require("Const.MessageName")
local Const = require("Common.Const.Const")
local ClientActivityUtils = require("Utils.ClientActivityUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local WorldRacingTeamComponent = Class.LightClass("WorldRacingTeamComponent", UIComponent)

WorldRacingTeamComponent.messages = {
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshTeamInfo",
		true
	},
	[MessageName.TEAM_MATCHED_STATUS_CHANGE] = {
		"refreshTeamInfo",
		true
	},
	[MessageName.TEAM_MATCH_ENTRY_INTERACTABLE_CHANGE] = {
		"onMatchEntryInteractableChange",
		true
	}
}

function WorldRacingTeamComponent:onCtor(info)
	self.dungeonSceneId = info and info.dungeonSceneId
	self.hardLv = info and info.hardLv
	self.panelObjectReference = info and info.panelObjectReference
	self.isConfirming = false
end

function WorldRacingTeamComponent:getRefValue(key)
	local value = self.objectReference and self.objectReference:GetRefValue(key)

	if value ~= nil and NotNil(value) then
		return value
	end

	if self.panelObjectReference and self.panelObjectReference ~= self.objectReference then
		return self.panelObjectReference:GetRefValue(key)
	end

	return nil
end

function WorldRacingTeamComponent:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.btnChat = self:getRefValue("btnChat")
	self.listUList = self:getRefValue("listUList")
	self.txtNumUSDFText = self:getRefValue("txtNumUSDFText")
	self.teamUButton = self:getRefValue("teamUButton")

	if IsNil(self.listUList) or IsNil(self.txtNumUSDFText) then
		logger:error("findObjects: team info bar refs are missing, add ObjectReference keys " .. "listUList/txtNumUSDFText/btnChat/teamUButton to UI_Pb_Map_Multiplayer_Racing")
	end
end

function WorldRacingTeamComponent:registerObjects()
	if NotNil(self.listUList) then
		function self.listUList.luaRenderItem(button, index, data)
			self:renderMemberItem(button, data)
		end
	end

	if NotNil(self.teamUButton) then
		function self.teamUButton.luaClick()
			pg.global.ui:open(UIConst.UI_ID_TEAM_ROOM)
		end
	end
end

function WorldRacingTeamComponent:initView()
	self:refreshTeamInfo()
end

function WorldRacingTeamComponent:onShow()
	self:refreshTeamInfo()
end

function WorldRacingTeamComponent:setTrackInfo(dungeonSceneId, hardLv)
	self.dungeonSceneId = dungeonSceneId
	self.hardLv = hardLv

	self:refreshTeamInfo()
end

function WorldRacingTeamComponent:refreshTeamChatWidget()
	if IsNil(self.btnChat) or not self:checkUIShow() then
		return
	end

	self.btnChat:SetActive(true)
	pg.game.chat:setTeamMiniChatWidget(self.btnChat)
end

function WorldRacingTeamComponent:refreshTeamInfo()
	self:refreshTeamMemberCount()
	self:refreshTeamMemberList()
	self:refreshTeamChatWidget()
end

function WorldRacingTeamComponent:getMemberMax()
	return ClientActivityUtils.getWorldRaceTeamMemberMax(self.dungeonSceneId)
end

function WorldRacingTeamComponent:getMemberCount()
	return pg.me and pg.me:isInTeam() and pg.me:getTeamMemberCount() or 1
end

function WorldRacingTeamComponent:refreshTeamMemberCount()
	if IsNil(self.txtNumUSDFText) then
		return
	end

	local currentCount = self:getMemberCount()
	local maxCount = self:getMemberMax()
	local countText = maxCount < currentCount and string.format("<style=Debuff>%d</style>", currentCount) or currentCount

	ClientTextUtils.setText(self.txtNumUSDFText, countText .. "/" .. maxCount)
end

function WorldRacingTeamComponent:getSelfMemberInfo()
	return {
		uid = pg.me.uid,
		playerName = pg.me.playerName,
		headIcon = pg.me.headIcon,
		headFrame = pg.me.headFrame,
		level = pg.me.level,
		starTitle = pg.me.starTitle
	}
end

function WorldRacingTeamComponent:getTeamMemberData()
	local maxCount = self:getMemberMax()
	local memberCount = self:getMemberCount()
	local showCount = self.isConfirming and memberCount or math.max(maxCount, memberCount)
	local data = {}

	for index = 1, showCount do
		data[index] = {
			empty = true,
			tIndex = 0
		}
	end

	if not pg.me then
		return data
	end

	if pg.me:isInTeam() then
		local teamInfo = pg.me:getShowTeamInfo()

		for index, uid in ipairs(teamInfo and teamInfo.sortList or EMPTY_TABLE) do
			if data[index] then
				data[index] = {
					tIndex = 0,
					uid = uid,
					playerInfo = teamInfo.membersInfo and teamInfo.membersInfo[uid]
				}
			end
		end
	elseif data[1] then
		data[1] = {
			tIndex = 0,
			uid = pg.me.uid,
			playerInfo = self:getSelfMemberInfo()
		}
	end

	return data
end

function WorldRacingTeamComponent:refreshTeamMemberList()
	if IsNil(self.listUList) then
		return
	end

	self.listUList:SetList(self:getTeamMemberData())
end

function WorldRacingTeamComponent:onMatchEntryInteractableChange(interactable)
	self.isConfirming = interactable ~= true

	self:refreshTeamInfo()
end

function WorldRacingTeamComponent:canInviteMember()
	return pg.me ~= nil and pg.me.matchState == Const.PLAYER_MATCH_STATUS.IDLE and not self.isConfirming and (not pg.me:isInTeam() or pg.me:isTeamLeader())
end

function WorldRacingTeamComponent:renderMemberItem(button, data)
	if not pg.me then
		return
	end

	local objectReference = button:GetComponent("ObjectReference")
	local playerHeadUContainer = objectReference:GetRefValue("playerHeadUContainer")
	local titleIconUImage = objectReference:GetRefValue("titleIconUImage")
	local textLvUSDFText = objectReference:GetRefValue("textLvUSDFText")
	local btnInviteUButton = objectReference:GetRefValue("btnInviteUButton")
	local canInvite = self:canInviteMember()

	button:TryChangePage("Empty", data.empty and (canInvite and 2 or 1) or 0)
	button:TryChangePage("Captain", not data.empty and pg.me:isUidTeamLeader(data.uid) and 1 or 0)

	if data.empty then
		button:ClosePopup()

		button.luaTooltipPopup = nil
		button.luaRenderTooltip = nil
		button.luaClick = nil

		button:TryChangePage("Selected", 0)
		ClientTextUtils.setText(textLvUSDFText, "")

		if NotNil(btnInviteUButton) then
			btnInviteUButton.luaClick = canInvite and function()
				self:openInvite()
			end or nil
		end

		return
	end

	if NotNil(btnInviteUButton) then
		btnInviteUButton.luaClick = nil
	end

	local playerInfo = data.playerInfo or pg.game.chat:getPlayerInfo(data.uid)

	if NotNil(titleIconUImage) then
		titleIconUImage:SetActiveFastest(false)
	end

	ClientTextUtils.setText(textLvUSDFText, playerInfo and playerInfo.level or "")

	if playerInfo then
		self:renderPlayerHead(playerHeadUContainer, playerInfo)
	end

	TeamUtils.handleTeamMemberTooltip(button, data.uid, button)
end

function WorldRacingTeamComponent:openInvite()
	if not self.dungeonSceneId then
		logger:error("openInvite: track scene is unavailable, hardLv=%s", tostring(self.hardLv))

		return
	end

	pg.global.ui:open(UIConst.UI_ID_DUNGEON_INVITE, {
		dungeonId = self.dungeonSceneId,
		hardLv = self.hardLv
	})
end

function WorldRacingTeamComponent:renderPlayerHead(playerHeadUContainer, playerInfo)
	if IsNil(playerHeadUContainer) then
		return
	end

	if playerHeadUContainer:CheckURLLoaded() then
		self:renderLoadedPlayerHead(playerHeadUContainer.content, playerInfo)
	else
		playerHeadUContainer:LoadDefaultUrlManually(function(content)
			self:renderLoadedPlayerHead(content, playerInfo)
		end)
	end
end

function WorldRacingTeamComponent:renderLoadedPlayerHead(content, playerInfo)
	if not content or IsNil(content) then
		return
	end

	LuaUIUtils.renderPlayerAvatarImages(content, {
		avatarIconId = playerInfo.headIcon,
		avatarFrameIconId = playerInfo.headFrame
	})
end

function WorldRacingTeamComponent:onDestroy()
	pg.game.chat:clearTeamMiniChatWidget()
	UIComponent.onDestroy(self)
end

return WorldRacingTeamComponent
