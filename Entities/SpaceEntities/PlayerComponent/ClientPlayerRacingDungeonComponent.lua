-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\PlayerComponent\\ClientPlayerRacingDungeonComponent.lua

local NoticeDef = require("Common.NoticeDef")
local CallbackHandler = require("Core.Common.CallbackHandler")
local Class = require("Core.Framework.Class")
local CallbackHandler = require("Core.Common.CallbackHandler")
local MessageName = require("Const.MessageName")
local UIConst = require("Const.UIConst")
local ClientConst = require("Const.ClientConst")
local NoticeDef = require("Common.NoticeDef")
local WorldRacingTrackData = require("Data.world_racing_track_data")
local WorldRacingPropData = require("Data.world_racing_prop_data")
local RacingBuffToPropData = require("Data.racing_buff_to_prop_data")
local Const = require("Common.Const.Const")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local DungeonConst = require("Common.Const.DungeonConst")
local SysNoticeData = require("Data.sys_notice_data")
local ClientPlayerRacingDungeonComponent = Class.Component("ClientPlayerRacingDungeonComponent")

function ClientPlayerRacingDungeonComponent:EVENT_EnterScene()
	local space = self.space

	if space and space.isRacingDungeon and space:isRacingDungeon() then
		pg.game:setModuleEnable("WorldRaceDungeon", ClientConst.ModuleKey.NormalAttack, false)

		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:setWorldRaceTipsMode(true)
		end

		if space._refreshWorldRaceFinishCountdownTips then
			space:_refreshWorldRaceFinishCountdownTips()
		end

		if self == pg.me and space.racingDungeonRestoreTrackShowcaseFinished then
			space:racingDungeonRestoreTrackShowcaseFinished()
			space:refreshWorldRaceFinishMark()
		end
	end

	local mode = space and space.racingDungeonGetMode and space:racingDungeonGetMode()

	if self == pg.me and mode == WorldRaceDungeonConst.MODE.MULTI and (space.status == DungeonConst.STATUS.REWARD or space.status == DungeonConst.STATUS.CLOSE) then
		self:requestWorldRaceMultiSettlement()
	end
end

function ClientPlayerRacingDungeonComponent:restoreWorldRacePresentation()
	local space = self.space

	if self ~= pg.me or space ~= pg.space or not space or not space.isRacingDungeon or not space:isRacingDungeon() then
		return
	end

	pg.game:setModuleEnable("WorldRaceDungeon", ClientConst.ModuleKey.NormalAttack, false)

	local ui = pg.global.ui

	if ui.tips then
		ui.tips:setWorldRaceTipsMode(true)
		ui.tips:hideGrabEggWaitingInfo()
		ui.tips:hideCountDownBeat()
	end

	space:racingDungeonRestoreTrackShowcaseFinished()
	space:refreshWorldRaceFinishMark()

	local mode = space:racingDungeonGetMode()
	local isSettled = space.status == DungeonConst.STATUS.REWARD or space.status == DungeonConst.STATUS.CLOSE
	local isFinished = mode == WorldRaceDungeonConst.MODE.MULTI and space:isWorldRacePlayerFinished(self.id)

	if mode == WorldRaceDungeonConst.MODE.SINGLE then
		space:racingDungeonRefreshSinglePresentation()
	elseif mode == WorldRaceDungeonConst.MODE.MULTI then
		if isFinished then
			space._worldRaceLocalFinishFeedbackShown = true
		end

		if space.status == DungeonConst.STATUS.COUNT_DONW then
			space:_showWorldRaceCountDown()
		end

		space:refreshWorldRacePlayerVisualEffects()
		space:_refreshWorldRaceFinishCountdownTips()
	end

	local hud = ui:tryGetCtrlByUid(UIConst.UI_ID_HUD_V2)

	if hud then
		hud:setUIHide(UIConst.UI_HIDE_KEY.WORLD_RACE_FINISH, isFinished or isSettled)
	end

	facade:sendMsgToUI(MessageName.DUNGEON_STATE_CHANGE, space.status)
	facade:sendMsgToUI(MessageName.WORLD_RACE_GOLD_COINS_CHANGED, self.racingGoldCoins)
	facade:sendMsgToUI(MessageName.WORLD_RACE_ITEM_CHANGED, self.racingItemId)

	if mode == WorldRaceDungeonConst.MODE.MULTI and isSettled then
		self:requestWorldRaceMultiSettlement()
	end
end

function ClientPlayerRacingDungeonComponent:on_racingReadyed_changed(oldValue, newValue)
	if self ~= pg.me or newValue ~= 1 then
		return
	end

	local space = self.space

	if space and space.racingDungeonRestoreTrackShowcaseFinished then
		space:racingDungeonRestoreTrackShowcaseFinished()
	end
end

function ClientPlayerRacingDungeonComponent:onLeaveSpace()
	local space = self.space

	if space then
		space._worldRaceEndTipPending = nil
	end

	self._worldRaceRetrySpace = nil

	if self._worldRaceRetryTimer then
		self:removeTimer(self._worldRaceRetryTimer)

		self._worldRaceRetryTimer = nil
	end

	local isRacing = space and space.isRacingDungeon and space:isRacingDungeon()

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:setWorldRaceTipsMode(false)
	end

	if pg.game and pg.game.audio then
		pg.game.audio:stopBgmByLevel(WorldRaceDungeonConst.BGM_REASON_KEY)
	end

	if not isRacing then
		return
	end

	space:refreshWorldRaceFinishMark(true)
	pg.game:setModuleEnable("WorldRaceDungeon", ClientConst.ModuleKey.NormalAttack, true)

	local hud = pg.global.ui:tryGetCtrlByUid(UIConst.UI_ID_HUD_V2)

	if hud then
		hud:setUIHide(UIConst.UI_HIDE_KEY.WORLD_RACE_FINISH, false)
	end

	if space._stopWorldRaceSingleUIRefresh then
		space:_stopWorldRaceSingleUIRefresh(true)
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACE_SETTLEMENT) then
		pg.global.ui:close(UIConst.UI_ID_WORLD_RACE_SETTLEMENT)
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACE_MULTI_SETTLEMENT) then
		pg.global.ui:close(UIConst.UI_ID_WORLD_RACE_MULTI_SETTLEMENT)
	end

	if pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
		pg.global.ui.tips:hideWorldRaceFinish()
		pg.global.ui.tips:hideWorldRaceFinishMore()
		pg.global.ui.tips:hideWorldRaceEnd()
		pg.global.ui.tips:hideCountDownBeat()
		pg.global.ui.tips:hideWorldRaceCountdown()
		pg.global.ui.tips:hideWorldRaceExit()
		pg.global.ui.tips:hideWorldRankingTips()
	end
end

function ClientPlayerRacingDungeonComponent:requestWorldRaceMultiSettlement()
	local space = self.space

	if pg.space ~= space or not space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.MULTI then
		return
	end

	local isSettled = space.status == DungeonConst.STATUS.REWARD or space.status == DungeonConst.STATUS.CLOSE

	if not isSettled and (not space.isWorldRacePlayerFinished or not space:isWorldRacePlayerFinished(self.id)) then
		return
	end

	self:serverMsg("RPC_CS_WorldRaceMultiGetSettleData", function(errno, settlementData)
		if self.space ~= space or pg.space ~= space then
			return
		end

		self:onWorldRaceMultiSettlementResult(errno, settlementData)
	end)
end

function ClientPlayerRacingDungeonComponent:onWorldRaceMultiSettlementResult(errno, settlementData)
	if errno ~= NoticeDef.SUCCESS then
		pg.global.showBubbleMessage(errno)

		return
	end

	if settlementData == nil then
		return
	end

	self:_openWorldRaceMultiSettlement({
		results = settlementData
	})
end

function ClientPlayerRacingDungeonComponent:reportWorldRaceClientReady()
	return self:serverMsg("RPC_CS_WorldRaceClientReady")
end

function ClientPlayerRacingDungeonComponent:on_racingGoldCoins_changed(oldVal, newVal)
	facade:sendMsgToUI(MessageName.WORLD_RACE_GOLD_COINS_CHANGED, newVal)
end

function ClientPlayerRacingDungeonComponent:on_racingItemId_changed(oldVal, newVal)
	facade:sendMsgToUI(MessageName.WORLD_RACE_ITEM_CHANGED, newVal)
end

function ClientPlayerRacingDungeonComponent:requestWorldRaceSingleTryAgain()
	local space = self.space

	if not space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.SINGLE or self._worldRaceRetrySpace then
		return
	end

	self._worldRaceRetrySpace = space
	self._worldRaceRetryTimer = self:addTimer(10, function()
		self._worldRaceRetrySpace = nil
		self._worldRaceRetryTimer = nil
	end)

	self:serverMsg("RPC_CS_WorldRaceSingleChallengeAgain", CallbackHandler(self, "onWorldRaceSingleTryAgainResult", space))
end

function ClientPlayerRacingDungeonComponent:onWorldRaceSingleTryAgainResult(space, errno)
	if self.space ~= space or self._worldRaceRetrySpace ~= space or errno == NoticeDef.SUCCESS then
		return
	end

	self._worldRaceRetrySpace = nil

	if self._worldRaceRetryTimer then
		self:removeTimer(self._worldRaceRetryTimer)

		self._worldRaceRetryTimer = nil
	end

	local notice = SysNoticeData[errno]

	if notice and pg.global.ui.tips then
		pg.global.ui.tips:showWorldRaceTextTip(pg.getLocalizationText(notice.text), notice.stay)
	else
		self.logger:warn("world race single retry failed, errno=%s", tostring(errno))
	end
end

function ClientPlayerRacingDungeonComponent:selectWorldRaceBuff(buffId)
	self:serverMsg("RPC_CS_RacingSelectBuffId", buffId, CallbackHandler(self, "onWorldRaceSelectBuffResult", buffId))
end

function ClientPlayerRacingDungeonComponent:onWorldRaceSelectBuffResult(buffId, errno)
	if errno ~= NoticeDef.SUCCESS then
		pg.global.showBubbleMessage(errno)
	end

	facade:sendMsgToUI(MessageName.WORLD_RACE_SELECT_BUFF_RESULT, buffId, errno)
end

function ClientPlayerRacingDungeonComponent:onWorldRaceSelectedBuffChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.WORLD_RACE_SELECTED_BUFF_CHANGED)
end

function ClientPlayerRacingDungeonComponent:getWorldRaceTrackPetLists(trackId)
	if not trackId then
		return nil, nil, false
	end

	local prepareList = self.racingPetPrepareList and self.racingPetPrepareList[trackId]
	local exploreList = self.racingPetExploreList and self.racingPetExploreList[trackId]

	return prepareList, exploreList, prepareList ~= nil and exploreList ~= nil
end

function ClientPlayerRacingDungeonComponent:initWorldRaceTrackPetLists(trackId)
	if not WorldRacingTrackData[trackId] then
		self.logger:error("initWorldRaceTrackPetLists: track config not found, trackId=%s", tostring(trackId))

		return
	end

	if not self.racingPetPrepareList or not self.racingPetExploreList then
		self.logger:error("initWorldRaceTrackPetLists: racing pet list maps are unavailable, trackId=%s", tostring(trackId))

		return
	end

	local prepareList, exploreList = self:getWorldRaceTrackPetLists(trackId)

	if prepareList ~= nil and exploreList ~= nil then
		return
	end

	if prepareList ~= nil or exploreList ~= nil then
		self.logger:error("initWorldRaceTrackPetLists: racing pet lists are incomplete, trackId=%s", tostring(trackId))

		return
	end

	local formation = self.prepareFormationList and self.prepareFormationList[self.curPetFormationIndex]
	local exploreFormation = self.prepareFormationList and self.prepareFormationList[1]

	if not formation or not formation.formation or not exploreFormation or not exploreFormation.exploreFormation then
		self.logger:error("initWorldRaceTrackPetLists: world formation is unavailable, trackId=%s, formationIndex=%s", tostring(trackId), tostring(self.curPetFormationIndex))

		return
	end

	self:setWorldRaceTrackPetLists(trackId, formation.formation:getRawTable(), exploreFormation.exploreFormation:getRawTable())
end

function ClientPlayerRacingDungeonComponent:setWorldRaceTrackPetLists(trackId, prepareList, exploreList)
	assert(WorldRacingTrackData[trackId], "setWorldRaceTrackPetLists: invalid trackId=" .. tostring(trackId))
	assert(#prepareList <= Const.PET_PREPARE_NUM_LIMIT, "setWorldRaceTrackPetLists: too many battle pets")
	assert(#exploreList <= Const.PET_EXPLORE_PREPARE_NUM_LIMIT, "setWorldRaceTrackPetLists: too many explore pets")

	local prepareSlots, exploreSlots = {}, {}

	for index = 1, Const.PET_PREPARE_NUM_LIMIT do
		prepareSlots[index] = prepareList[index] or ""
	end

	for index = 1, Const.PET_EXPLORE_PREPARE_NUM_LIMIT do
		exploreSlots[index] = exploreList[index] or ""
	end

	self:serverMsg("RPC_CS_WorldRaceSetTrackPetList", trackId, prepareSlots, exploreSlots, CallbackHandler(self, "onWorldRaceTrackPetListsInitialized", trackId))
end

function ClientPlayerRacingDungeonComponent:onWorldRaceTrackPetListsInitialized(trackId, errno)
	if errno ~= NoticeDef.SUCCESS then
		pg.global.showBubbleMessage(errno)
	end

	facade:sendMsgToUI(MessageName.WORLD_RACE_TRACK_PET_LIST_CHANGED, trackId)
end

function ClientPlayerRacingDungeonComponent:onWorldRacePrepareListChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.WORLD_RACE_TRACK_PET_LIST_CHANGED)
end

function ClientPlayerRacingDungeonComponent:onWorldRaceExploreListChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.WORLD_RACE_TRACK_PET_LIST_CHANGED)
end

function ClientPlayerRacingDungeonComponent:RPC_SC_ShowRaceBattleTip(tipData)
	local tipType = tipData.tipType
	local tipTypes = WorldRaceDungeonConst.BATTLE_TIP_TYPE

	if tipType == tipTypes.THUNDER_HIT then
		local text, colorPage

		if self.id == tipData.targetId then
			local tip = pg.getGameString("OPEN_WORLD_RACING_ThunderTips_Hit")

			text = string.gsub(tip, "<player>", {
				["<player>"] = tipData.attackerName
			})
			colorPage = 1
		else
			local tip = pg.getGameString("OPEN_WORLD_RACING_ThunderTips_Attack")

			text = string.gsub(tip, "<player>", {
				["<player>"] = tipData.targetName
			})
			colorPage = 2
		end

		return pg.global.ui.tips:showWorldRankingTips(text, colorPage, 2)
	end

	if tipType ~= tipTypes.ATTACK_SUCCESS and tipType ~= tipTypes.ATTACK_DEFENDED and tipType ~= tipTypes.ATTACK_ALL then
		return false
	end

	local propId = RacingBuffToPropData[tipData.buffId]

	if not propId then
		self.logger:error("showRaceBattleTip propId not found for buffId", tipData.buffId)

		return false
	end

	local propData = WorldRacingPropData[propId]

	if not propData then
		self.logger:error("showRaceBattleTip propData not found for propId", propId)

		return false
	end

	local propName = pg.getLocalizationText(propData.propName)
	local text, colorPage

	if tipType == tipTypes.ATTACK_SUCCESS then
		if self.id == tipData.targetId then
			local tip = pg.getGameString("OPEN_WORLD_RACING_ItemTips_Hit")

			text = string.gsub(tip, "<player>", {
				["<player>"] = tipData.attackerName
			})
			text = string.gsub(text, "<item>", propName)
			colorPage = 1
		else
			local tip = pg.getGameString("OPEN_WORLD_RACING_ItemTips_Attack")

			text = string.gsub(tip, "<player>", {
				["<player>"] = tipData.targetName
			})
			text = string.gsub(text, "<item>", propName)
			colorPage = 2
		end
	elseif tipType == tipTypes.ATTACK_DEFENDED then
		local tip = pg.getGameString("OPEN_WORLD_RACING_ItemTips_Defend")

		text = string.gsub(tip, "<player>", {
			["<player>"] = tipData.attackerName
		})
		colorPage = 3
	else
		local tip = pg.getGameString("OPEN_WORLD_RACING_ItemTips_AttackAll")

		text = string.gsub(tip, "<item>", propName)
		colorPage = 2
	end

	return pg.global.ui.tips:showWorldRankingTips(text, colorPage, 2)
end

function ClientPlayerRacingDungeonComponent:RPC_SC_RacingSingleSettlement(settlementInfo)
	local space = self.space

	if pg.space ~= space or not space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.SINGLE then
		return
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACE_SETTLEMENT) then
		facade:sendMsgToUI(MessageName.WORLD_RACE_SINGLE_SETTLEMENT_CHANGED, settlementInfo)

		return
	end

	if pg.global.ui.tips and settlementInfo and settlementInfo.result == 1 then
		pg.global.ui.tips:showWorldRaceFinish(nil, nil, nil, CallbackHandler(self, "_openWorldRaceSingleSettlement", space, settlementInfo))

		return
	end

	self:_openWorldRaceSingleSettlement(space, settlementInfo)
end

function ClientPlayerRacingDungeonComponent:_openWorldRaceSingleSettlement(space, settlementInfo)
	if not space or self.space ~= space or pg.space ~= space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.SINGLE then
		return
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACE_SETTLEMENT) then
		facade:sendMsgToUI(MessageName.WORLD_RACE_SINGLE_SETTLEMENT_CHANGED, settlementInfo)

		return
	end

	pg.global.ui:open(UIConst.UI_ID_WORLD_RACE_SETTLEMENT, settlementInfo)
end

function ClientPlayerRacingDungeonComponent:RPC_SC_RacingMultiSettlement(settlementInfo)
	local space = self.space

	if pg.space ~= space or not space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.MULTI then
		return
	end

	local localResult

	for _, result in ipairs(settlementInfo and settlementInfo.results or {}) do
		if result.playerId == self.id then
			localResult = result

			break
		end
	end

	local tips = pg.global.ui.tips
	local hasFinishCountdown = (space.fbEndTime or 0) > 0

	if hasFinishCountdown and localResult and not localResult.isFinished and not space._worldRaceEndFeedbackShown and tips then
		space._worldRaceEndFeedbackShown = true
		space._worldRaceEndTipPending = true

		tips:hideWorldRaceCountdown()
		tips:hideWorldRaceExit()
		tips:showWorldRaceEnd(nil, CallbackHandler(self, "_onWorldRaceEndTipFinished", space, settlementInfo))

		return
	end

	self:_openWorldRaceMultiSettlement(settlementInfo)
end

function ClientPlayerRacingDungeonComponent:_onWorldRaceEndTipFinished(space, settlementInfo)
	if self.space ~= space or pg.space ~= space or not space._worldRaceEndTipPending then
		return
	end

	space._worldRaceEndTipPending = nil

	self:_openWorldRaceMultiSettlement(settlementInfo)
end

function ClientPlayerRacingDungeonComponent:_openWorldRaceMultiSettlement(settlementInfo)
	local space = self.space

	if pg.space ~= space or not space or not space.racingDungeonGetMode or space:racingDungeonGetMode() ~= WorldRaceDungeonConst.MODE.MULTI then
		return
	end

	if space._worldRaceEndTipPending then
		return
	end

	if pg.global.ui.tips then
		pg.global.ui.tips:hideWorldRaceCountdown()
		pg.global.ui.tips:hideWorldRaceExit()
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACE_SETTLEMENT) then
		pg.global.ui:close(UIConst.UI_ID_WORLD_RACE_SETTLEMENT)
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_WORLD_RACE_MULTI_SETTLEMENT) then
		pg.global.ui:tryGetCtrlByUid(UIConst.UI_ID_WORLD_RACE_MULTI_SETTLEMENT):onSettlementChanged(settlementInfo)
	else
		pg.global.ui:open(UIConst.UI_ID_WORLD_RACE_MULTI_SETTLEMENT, settlementInfo)
	end
end

return ClientPlayerRacingDungeonComponent
