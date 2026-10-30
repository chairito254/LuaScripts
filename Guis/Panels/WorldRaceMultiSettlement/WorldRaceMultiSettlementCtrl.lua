-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\WorldRaceMultiSettlement\\WorldRaceMultiSettlementCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local CallbackHandler = require("Core.Common.CallbackHandler")
local MessageName = require("Const.MessageName")
local ClientConst = require("Const.ClientConst")
local NoticeDef = require("Common.NoticeDef")
local SysNoticeData = require("Data.sys_notice_data")
local WorldRaceMultiSettlementCtrl = Class.LightClass("WorldRaceMultiSettlementCtrl", UICtrl)

WorldRaceMultiSettlementCtrl.messages = {
	[MessageName.DUNGEON_STATE_CHANGE] = {
		"_refreshRaceTimes",
		true
	},
	[MessageName.WORLD_RACE_MULTI_RANK_CHANGED] = {
		"onPlayerInfoChanged",
		true
	},
	[MessageName.WORLD_RACE_MULTI_LIKE_CHANGED] = {
		"_refreshLikeButtons",
		true
	},
	[MessageName.RECV_FRIEND_LIST] = {
		"onFriendListChanged",
		true
	}
}

function WorldRaceMultiSettlementCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	if self.uiScene and self.view.renRawImagePro then
		self.uiScene:setRawImageProRef(self.view.renRawImagePro)
	end

	if self.view.rankingListUList then
		function self.view.rankingListUList.luaRenderItem(item, index, data)
			self:_renderRankingItem(item, index, data)
		end

		function self.view.rankingListUList.luaFinishLayout()
			self:_refreshCurrentPlayerItem()
		end

		function self._rankingListScrollCallback()
			self:_refreshCurrentPlayerItem()
		end

		self.view.rankingListUList:RegisterToScrollEvent(self._rankingListScrollCallback)
	end

	if self.view.addFriendUButton then
		self.view.addFriendUButton:SetActive(false)
	end

	if self.view.likeUButton then
		self.view.likeUButton:SetActive(false)
	end

	if self.view.textInteractiveUBaseText then
		self.view.textInteractiveUBaseText:SetActive(true)
	end

	if self.view.textRankingUBaseText then
		ClientTextUtils.setText(self.view.textRankingUBaseText, pg.getGameString("OPEN_WORLD_RACING_END_RANK"))
	end

	if self.view.textNameUBaseText then
		ClientTextUtils.setText(self.view.textNameUBaseText, pg.getGameString("OPEN_WORLD_RACING_END_NAME"))
	end

	if self.view.textTimeUBaseText then
		ClientTextUtils.setText(self.view.textTimeUBaseText, pg.getGameString("OPEN_WORLD_RACING_END_TIME"))
	end

	if self.view.textInteractiveUBaseText then
		ClientTextUtils.setText(self.view.textInteractiveUBaseText, pg.getGameString("OPEN_WORLD_RACING_END_INTERACT"))
	end

	if self.view.leaveTxtNameUText then
		ClientTextUtils.setText(self.view.leaveTxtNameUText, pg.getGameString("CONSOLE_BAR_LEAVE"))
	end
end

function WorldRaceMultiSettlementCtrl:addListener()
	if self.view.leaveUButton then
		function self.view.leaveUButton.luaClick()
			ClientUtils.exitDungeon()
			self:dismiss()
		end
	end
end

function WorldRaceMultiSettlementCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:onSettlementChanged(self.model.info or info)
end

function WorldRaceMultiSettlementCtrl:onShow()
	UICtrl.onShow(self)
	self:killTimer(self._renderTextureRefreshTimer)

	self._renderTextureRefreshTimer = nil

	if not self.uiScene or not self.view.renRawImagePro then
		return
	end

	self._renderTextureRefreshTimer = self:startTimer(function()
		if self.view.widget:IsPlayingAnimation(true) then
			return
		end

		self:killTimer(self._renderTextureRefreshTimer)

		self._renderTextureRefreshTimer = nil

		self.uiScene:refreshAllRenderTextures()
	end, 0.1, true)
end

function WorldRaceMultiSettlementCtrl:onHide()
	self:killTimer(self._renderTextureRefreshTimer)

	self._renderTextureRefreshTimer = nil

	UICtrl.onHide(self)
end

function WorldRaceMultiSettlementCtrl:onSettlementChanged(info)
	self.model:setInfo(info)

	if self.view then
		self:refreshView()
	end
end

function WorldRaceMultiSettlementCtrl:onPlayerInfoChanged()
	local space = pg.space

	if not space or not space.getWorldRaceMultiRanking then
		return
	end

	local oldFinishedCount = self.model:getFinishedCount()

	self.model:updateRanking(space:getWorldRaceMultiRanking())

	if self.view then
		self:refreshView()
	end

	if oldFinishedCount < self.model:getFinishedCount() and pg.me and pg.me.requestWorldRaceMultiSettlement then
		pg.me:requestWorldRaceMultiSettlement()
	end
end

function WorldRaceMultiSettlementCtrl:onFriendListChanged()
	self:_refreshFriendButtons()
end

function WorldRaceMultiSettlementCtrl:refreshView()
	local winner = self.model.winnerInfo
	local winnerPlayerInfo = self:_renderPlayerHead(self.view.playerHeadUWidget, winner)

	if self.view.lvTxt then
		ClientTextUtils.setText(self.view.lvTxt, winnerPlayerInfo and winnerPlayerInfo.level or "")
	end

	if self.view.playerNameUSDFText then
		ClientTextUtils.setText(self.view.playerNameUSDFText, winner and winner.name or "")
	end

	if self.view.playerRankingUSDFText then
		ClientTextUtils.setText(self.view.playerRankingUSDFText, winner and pg.getGameString("OPEN_WORLD_RACING_END_FIRST") or "")
	end

	if self.view.playerTimeUSDFText then
		ClientTextUtils.setText(self.view.playerTimeUSDFText, self.model:getTimeText(winner))
	end

	if self.view.playerSubUSDFText then
		ClientTextUtils.setText(self.view.playerSubUSDFText, winner and pg.getGameString("OPEN_WORLD_RACING_END_KING") or "")
	end

	self:_refreshWinnerSocial(winner)
	self:_refreshLikeButton(self.view.likeUButton, self.view.likeCountUSDFText, winner)
	self:_refreshRankingList()

	local currentPlayerInfo = self.model.currentPlayerInfo

	if self.view.curPlayerUWidget and currentPlayerInfo then
		self:_renderRankingItem(self.view.curPlayerUWidget, currentPlayerInfo.rank, currentPlayerInfo)
	end

	self:_refreshCurrentPlayerItem()
	self:_refreshWinnerModel(winner)
end

function WorldRaceMultiSettlementCtrl:_refreshRankingList()
	local list = self.view.rankingListUList

	if not list then
		return
	end

	local rows = self.model.rankingList

	if not self._rankingListInitialized then
		self._rankingListInitialized = #rows > 0

		list:SetList(rows)
	elseif list.itemCount == #rows then
		for index, data in ipairs(rows) do
			list:SetElement(index - 1, data)
		end
	else
		list.itemData = rows

		list:RefreshList(true)
	end
end

function WorldRaceMultiSettlementCtrl:_refreshRaceTimes()
	if not self.view then
		return
	end

	if self.view.playerTimeUSDFText then
		ClientTextUtils.setText(self.view.playerTimeUSDFText, self.model:getTimeText(self.model.winnerInfo))
	end

	local list = self.view.rankingListUList

	if list then
		for index, data in ipairs(self.model.rankingList) do
			local exists, item = list:TryGetChildAt(index - 1)

			if exists then
				self:_refreshRankingTime(item, data)
			end
		end
	end

	self:_refreshRankingTime(self.view.curPlayerUWidget, self.model.currentPlayerInfo)
end

function WorldRaceMultiSettlementCtrl:_refreshRankingTime(item, data)
	local objectReference = item and item:GetComponent("ObjectReference")
	local timeText = objectReference and objectReference:GetRefValue("timeUSDFText")

	if timeText then
		ClientTextUtils.setText(timeText, self.model:getTimeText(data))
	end
end

function WorldRaceMultiSettlementCtrl:_renderPlayerHead(widget, data)
	local player = data and data.playerId and (pg.me and data.playerId == pg.me.id and pg.me or pg.getEntity(data.playerId))
	local uid = data and data.uid
	local playerInfo = player

	playerInfo = (not playerInfo or playerInfo.headIcon == nil or playerInfo.headFrame == nil or playerInfo.level == nil) and uid and uid ~= "" and pg.game.chat:getPlayerInfo(uid) or playerInfo

	if widget then
		LuaUIUtils.renderPlayerAvatarImages(widget, {
			playerInfo = playerInfo,
			showAvatar = data ~= nil,
			showAvatarFrame = data ~= nil
		}, true)
	end

	self._playerHeadQueryUids = self._playerHeadQueryUids or {}

	if (not playerInfo or playerInfo.headIcon == nil or playerInfo.headFrame == nil or playerInfo.level == nil) and uid and uid ~= "" and pg.me and not self._playerHeadQueryUids[uid] then
		self._playerHeadQueryUids[uid] = true

		pg.me:queryPlayerInfo(uid, nil, true, CallbackHandler(self, "_onPlayerHeadInfo"))
	end

	return playerInfo
end

function WorldRaceMultiSettlementCtrl:_getLikeInfo(playerId)
	if playerId == nil then
		return 0, false, false
	end

	local space = pg.space
	local state = space and space._worldRaceLikeStates and space._worldRaceLikeStates[playerId]
	local count = space and space.playerLinks and space.playerLinks[playerId] or 0

	return math.max(0, math.floor(tonumber(count) or 0)), state and state.liked == true or false, state and state.pending == true or false
end

function WorldRaceMultiSettlementCtrl:_refreshLikeButton(button, countText, data)
	if not button then
		return
	end

	local playerId = data and data.playerId
	local hasPlayer = type(playerId) == "string" and playerId ~= ""
	local count, liked, pending = self:_getLikeInfo(playerId)
	local canLike = hasPlayer and pg.me ~= nil and playerId ~= pg.me.id and not liked and not pending

	button:SetActive(hasPlayer)

	button.isSelected = liked
	button.interactable = canLike

	button:TryChangePage("State", 1)

	button.luaClick = nil

	if canLike then
		function button.luaClick()
			self:_requestLike(data)
		end
	end

	if countText then
		countText:SetActive(hasPlayer)
		ClientTextUtils.setText(countText, hasPlayer and "×" .. tostring(count) or "")
	end
end

function WorldRaceMultiSettlementCtrl:_requestLike(data)
	local playerId = data and data.playerId
	local player = pg.me
	local space = pg.space

	if not player or not space or not space.isMultiRacingDungeon or not space:isMultiRacingDungeon() or type(playerId) ~= "string" or playerId == "" or playerId == player.id then
		return
	end

	space._worldRaceLikeStates = space._worldRaceLikeStates or {}

	local state = space._worldRaceLikeStates[playerId] or {}

	if state.liked or state.pending then
		return
	end

	space._worldRaceLikeStates[playerId] = state
	state.pending = true

	self:_refreshLikeButtons()
	player:serverMsg("RPC_CS_WorldRaceMultiLike", playerId, function(errno)
		state.pending = false

		if errno == NoticeDef.SUCCESS then
			state.liked = true
		end

		if pg.space ~= space or pg.me ~= player then
			return
		end

		if errno ~= NoticeDef.SUCCESS then
			pg.global.showBubbleMessage(errno)
		end

		if self.view and self:checkUIOpen() then
			self:_refreshLikeButtons()
		end
	end)
end

function WorldRaceMultiSettlementCtrl:_refreshLikeButtons()
	if not self.view then
		return
	end

	self:_refreshLikeButton(self.view.likeUButton, self.view.likeCountUSDFText, self.model.winnerInfo)

	if self.view.rankingListUList then
		for index, data in ipairs(self.model.rankingList) do
			local exists, item = self.view.rankingListUList:TryGetChildAt(index - 1)

			if exists then
				self:_refreshRankingLikeButton(item, data)
			end
		end
	end

	self:_refreshRankingLikeButton(self.view.curPlayerUWidget, self.model.currentPlayerInfo)
end

function WorldRaceMultiSettlementCtrl:_refreshRankingLikeButton(item, data)
	if not item then
		return
	end

	local objectReference = item:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local likeUButton = objectReference:GetRefValue("likeUButton")
	local likeCountUSDFText = objectReference:GetRefValue("likeCountUSDFText")

	self:_refreshLikeButton(likeUButton, likeCountUSDFText, data)
end

function WorldRaceMultiSettlementCtrl:_onPlayerHeadInfo(playerInfo, succeeded)
	if succeeded and self.view and self:checkUIOpen() then
		self:refreshView()
	end
end

function WorldRaceMultiSettlementCtrl:_refreshWinnerSocial(winner)
	if self.view.avatarUWidget then
		self.view.avatarUWidget.luaClick = nil

		if winner and winner.uid and winner.uid ~= "" then
			function self.view.avatarUWidget.luaClick()
				self:_openPlayerInfo(winner)
			end
		end
	end

	self:_refreshFriendButton(self.view.addFriendUButton, winner)
end

function WorldRaceMultiSettlementCtrl:_openPlayerInfo(playerInfo)
	if not playerInfo or not playerInfo.uid or playerInfo.uid == "" then
		return
	end

	LuaUIUtils.openInfoPlayerCard({
		openType = ClientConst.PlayerInfoOpenType.Rank,
		playerId = playerInfo.uid,
		playerInfo = pg.game.chat:getPlayerInfo(playerInfo.uid),
		openSource = pg.game.chat.AddFriendSource.PlayerCard
	})
end

function WorldRaceMultiSettlementCtrl:_canAddFriend(playerInfo)
	local uid = playerInfo and playerInfo.uid

	return uid ~= nil and uid ~= "" and pg.me and uid ~= pg.me.uid and not pg.game.chat:checkFriendList(uid)
end

function WorldRaceMultiSettlementCtrl:_applyFriend(playerInfo)
	if not self:_canAddFriend(playerInfo) then
		return
	end

	local uid = playerInfo.uid

	self._friendApplyPendingUids = self._friendApplyPendingUids or {}

	if self._friendApplyPendingUids[uid] then
		return
	end

	self._friendApplyPendingUids[uid] = true

	self:_refreshFriendButtons()

	local player = pg.me
	local space = pg.space

	player:queryPlayerInfo(uid, nil, true, CallbackHandler(self, "_onFriendPlayerInfo", playerInfo, player, space))
end

function WorldRaceMultiSettlementCtrl:_onFriendPlayerInfo(playerInfo, player, space, socialInfo, succeeded)
	if pg.me ~= player or pg.space ~= space or not self.view or not self:checkUIOpen() then
		self:_restoreFriendButton(playerInfo.uid, player, space)

		return
	end

	if not self:_canAddFriend(playerInfo) then
		self:_restoreFriendButton(playerInfo.uid, player, space)

		return
	end

	if not succeeded or not socialInfo then
		self:_restoreFriendButton(playerInfo.uid, player, space)

		local notice = SysNoticeData[NoticeDef.TID_SERVICE_ERROR]

		if notice then
			pg.global.ui.tips:showWorldRaceTextTip(pg.getLocalizationText(notice.text))
		end

		return
	end

	pg.game.chat:applyFriend(playerInfo.uid, pg.game.chat.AddFriendSource.PlayerCard)
	pg.global.ui.tips:showWorldRaceTextTip(pg.getGameString("CHAT_APPLY_FRIEND_SUCCESS"))
	self:startTimer(function()
		self:_restoreFriendButton(playerInfo.uid, player, space)
	end, 3)
end

function WorldRaceMultiSettlementCtrl:_restoreFriendButton(uid, player, space)
	if self._friendApplyPendingUids then
		self._friendApplyPendingUids[uid] = nil
	end

	if pg.me ~= player or pg.space ~= space or not self.view or not self:checkUIOpen() then
		return
	end

	self:_refreshFriendButtons()
end

function WorldRaceMultiSettlementCtrl:_refreshFriendButton(button, playerInfo)
	if not button then
		return
	end

	local canAddFriend = self:_canAddFriend(playerInfo)
	local uid = playerInfo and playerInfo.uid
	local pending = uid and self._friendApplyPendingUids and self._friendApplyPendingUids[uid]

	button:SetActive(canAddFriend)

	button.interactable = canAddFriend and not pending
	button.luaClick = nil

	if canAddFriend and not pending then
		function button.luaClick()
			self:_applyFriend(playerInfo)
		end
	end
end

function WorldRaceMultiSettlementCtrl:_refreshFriendButtons()
	if not self.view then
		return
	end

	self:_refreshWinnerSocial(self.model.winnerInfo)

	if self.view.rankingListUList then
		for index, data in ipairs(self.model.rankingList) do
			local exists, item = self.view.rankingListUList:TryGetChildAt(index - 1)

			if exists then
				self:_refreshRankingFriendButton(item, data)
			end
		end
	end

	if self.view.curPlayerUWidget then
		self:_refreshRankingFriendButton(self.view.curPlayerUWidget, self.model.currentPlayerInfo)
	end
end

function WorldRaceMultiSettlementCtrl:_refreshRankingFriendButton(item, data)
	if not item then
		return
	end

	local objectReference = item:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local addFriend = objectReference:GetRefValue("addFriendUButton")

	self:_refreshFriendButton(addFriend, data)
end

function WorldRaceMultiSettlementCtrl:_refreshCurrentPlayerItem()
	if not self.view then
		return
	end

	local currentPlayerInfo = self.model.currentPlayerInfo
	local list = self.view.rankingListUList
	local currentPlayerIndex = currentPlayerInfo and currentPlayerInfo.rank and currentPlayerInfo.rank - 1
	local showCurrentPlayer = false

	if list and currentPlayerIndex and currentPlayerIndex >= 0 then
		local success, minIndex, maxIndex = list:TryGetVisualRange()

		showCurrentPlayer = success and (currentPlayerIndex < minIndex or maxIndex < currentPlayerIndex)
	end

	if self.view.rootUComponent then
		self.view.rootUComponent:TryChangePage("ListContent", showCurrentPlayer and 1 or 0)
	end

	if self.view.curPlayerUWidget then
		self.view.curPlayerUWidget:SetActive(showCurrentPlayer)
	end
end

function WorldRaceMultiSettlementCtrl:_refreshWinnerModel(winner)
	if not self.uiScene then
		return
	end

	if not winner then
		self.uiScene:setWinner(nil)

		self._winnerModelPlayerId = nil
		self._queryingWinnerUid = nil

		return
	end

	if self._winnerModelPlayerId == winner.playerId then
		return
	end

	if self._winnerModelPlayerId ~= nil then
		self.uiScene:setWinner(nil)

		self._winnerModelPlayerId = nil
	end

	local player = pg.getEntity(winner.playerId)

	if player and self:_showWinnerModel(winner, player) then
		return
	end

	if winner.uid == nil or winner.uid == "" or not pg.me or not pg.me.queryPlayerInfo or self._queryingWinnerUid == winner.uid then
		return
	end

	self._queryingWinnerUid = winner.uid

	pg.me:queryPlayerInfo(winner.uid, nil, true, CallbackHandler(self, "_onWinnerPlayerInfo", winner.uid))
end

function WorldRaceMultiSettlementCtrl:_showWinnerModel(winner, playerInfo)
	if not winner or not playerInfo or not playerInfo.avatarPresetKey then
		return false
	end

	local success = self.uiScene:setWinner({
		playerId = winner.playerId,
		avatarConfig = playerInfo.avatarConfig,
		curShow = playerInfo.curShow,
		avatarPresetKey = playerInfo.avatarPresetKey,
		animationKey = winner.animationKey
	})

	if success then
		self._winnerModelPlayerId = winner.playerId
	end

	return success
end

function WorldRaceMultiSettlementCtrl:_onWinnerPlayerInfo(winnerUid, playerInfo)
	if self._queryingWinnerUid == winnerUid then
		self._queryingWinnerUid = nil
	end

	local winner = self.model.winnerInfo

	if not self.view or not self.uiScene or not winner or winner.uid ~= winnerUid then
		return
	end

	self:_showWinnerModel(winner, playerInfo)
end

function WorldRaceMultiSettlementCtrl:_renderRankingItem(item, index, data)
	if not item then
		return
	end

	data = data or {}

	local objectReference = item:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local root = objectReference:GetRefValue("rootUButton")

	if root then
		root:TryChangePage("Ranking", data.rank and math.min(math.max(data.rank - 1, 0), 3) or 3)
		root:TryChangePage("State", pg.me and data.playerId == pg.me.id and 1 or 0)

		root.luaClick = nil
	end

	local avatarButton = objectReference:GetRefValue("avatarUButton")

	if avatarButton then
		avatarButton.luaClick = nil

		if data.uid and data.uid ~= "" then
			function avatarButton.luaClick()
				self:_openPlayerInfo(data)
			end
		end
	end

	local rankingText = objectReference:GetRefValue("rankingUSDFText")
	local rankingWhiteText = objectReference:GetRefValue("rankingWhiteUSDFText")
	local rankingTextMine = objectReference:GetRefValue("rankingUSDFTextMine")
	local nameText = objectReference:GetRefValue("playerNameUSDFText")
	local timeText = objectReference:GetRefValue("timeUSDFText")
	local playerHead = objectReference:GetRefValue("playerHeadUWidget")

	self:_renderPlayerHead(playerHead, data)

	local rank = data.rank and tostring(data.rank) or "--"

	if rankingText then
		ClientTextUtils.setText(rankingText, rank)
	end

	if rankingWhiteText then
		ClientTextUtils.setText(rankingWhiteText, rank)
	end

	if rankingTextMine then
		ClientTextUtils.setText(rankingTextMine, rank)
	end

	if nameText then
		ClientTextUtils.setText(nameText, data.name or "")
	end

	if timeText then
		ClientTextUtils.setText(timeText, self.model:getTimeText(data))
	end

	local teamNumber = objectReference:GetRefValue("teamNumberUContainer")

	if teamNumber then
		teamNumber:SetActive(false)
	end

	self:_refreshRankingFriendButton(item, data)
	self:_refreshRankingLikeButton(item, data)
end

function WorldRaceMultiSettlementCtrl:onDestroy()
	if self.view then
		if self.view.rankingListUList then
			if self._rankingListScrollCallback then
				self.view.rankingListUList:UnRegisterToScrollEvent(self._rankingListScrollCallback)
			end

			self.view.rankingListUList.luaRenderItem = nil
			self.view.rankingListUList.luaFinishLayout = nil
		end

		if self.view.leaveUButton then
			self.view.leaveUButton.luaClick = nil
		end

		if self.view.avatarUWidget then
			self.view.avatarUWidget.luaClick = nil
		end

		if self.view.addFriendUButton then
			self.view.addFriendUButton.luaClick = nil
		end

		if self.view.likeUButton then
			self.view.likeUButton.luaClick = nil
		end
	end

	self._rankingListScrollCallback = nil
	self._rankingListInitialized = nil
	self._winnerModelPlayerId = nil
	self._queryingWinnerUid = nil
	self._playerHeadQueryUids = nil
	self._friendApplyPendingUids = nil

	self.model:setInfo(nil)
	UICtrl.onDestroy(self)
end

return WorldRaceMultiSettlementCtrl
