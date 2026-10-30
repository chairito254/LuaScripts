-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientRacingDungeonMulti.lua

local Class = require("Core.Framework.Class")
local ClientRacingDungeonBase = require("Entities.SpaceEntities.ClientRacingDungeonBase")
local WorldRaceDungeonConst = require("Common.Const.WorldRaceDungeonConst")
local WorldRaceDungeonUtils = require("Common.Utils.WorldRaceDungeonUtils")
local DungeonConst = require("Common.Const.DungeonConst")
local MessageName = require("Const.MessageName")
local Time = require("Core.Common.Time")
local WorldRacingPropData = require("Data.world_racing_prop_data")
local AttributeConst = require("Common.Const.AttributeConst")
local Const = require("Common.Const.Const")
local NoticeDef = require("Common.NoticeDef")
local ClientRacingDungeonMulti = Class.Class("ClientRacingDungeonMulti", ClientRacingDungeonBase)

function ClientRacingDungeonMulti:onBeforeSceneLoad(createInfo)
	ClientRacingDungeonMulti.super.onBeforeSceneLoad(self, createInfo)

	self.dungeonTeamMap = createInfo and createInfo.dungeonTeamMap or {}
end

function ClientRacingDungeonMulti:racingDungeonGetMode()
	return WorldRaceDungeonConst.MODE.MULTI
end

function ClientRacingDungeonMulti:checkWorldRaceFunctionItemSpace(propId)
	local propData = WorldRacingPropData[propId]
	local buffId = propData and tonumber(propData.buffId)

	if not buffId or buffId <= 0 then
		return true
	end

	local buffTemplate = pg.global.abilityMgr:getBuffTemplate(buffId)

	if not buffTemplate or not buffTemplate.needSpaceCheck then
		return true
	end

	local maxBornScaleRate = buffTemplate.maxBornScaleRate

	if type(maxBornScaleRate) ~= "number" then
		self.logger:error("world race buff space check missing maxBornScaleRate, buffId=%s", buffId)

		return false, NoticeDef.FAIL
	end

	if maxBornScaleRate <= 0 then
		return true
	end

	if pg.me.actorBuff and pg.me.actorBuff:findOneBuffByTemplateId(buffId) ~= nil then
		return true
	end

	local target = pg.pawn
	local currentScaleRate = target.actorCombatAttribute:getAttribValue(AttributeConst.born_scale_rate_v) or 0
	local scaleMultiplier = (1 + currentScaleRate + maxBornScaleRate) / (1 + currentScaleRate)
	local capsule = target.eModel.bodyCollider

	if target.eModel:MoveOverlapByCapsuleParam(Const.COMPONENT_MOTION, capsule.radius, capsule.height, capsule.center.y, scaleMultiplier, true) then
		return false, NoticeDef.CANNOT_SWITCH_BY_INSUFFICIENT_SPACE
	end

	return true
end

function ClientRacingDungeonMulti:getWorldRaceMultiRanking()
	local finishedPlayers = {}

	for _, playerId in ipairs(self.finishedPlayerIds or {}) do
		finishedPlayers[playerId] = true
	end

	local rankingList = {}

	for rank, playerId in ipairs(self.playersRank or {}) do
		local passerByInfo = self.passerByMap and self.passerByMap[playerId]
		local displayInfo = passerByInfo and passerByInfo:getDisplayInfo()

		rankingList[rank] = {
			rank = rank,
			playerId = playerId,
			uid = displayInfo and displayInfo.uid or "",
			name = displayInfo and displayInfo.name or "",
			isFinished = finishedPlayers[playerId] == true
		}
	end

	return rankingList
end

function ClientRacingDungeonMulti:isWorldRacePlayerFinished(playerId)
	if playerId == nil then
		return false
	end

	for _, finishedPlayerId in ipairs(self.finishedPlayerIds or {}) do
		if finishedPlayerId == playerId then
			return true
		end
	end

	return false
end

function ClientRacingDungeonMulti:getWorldRaceMultiRouteDistance(playerId)
	local state = self.racingPlayerCommStates and self.racingPlayerCommStates[playerId]

	if not state then
		return nil
	end

	if self._worldRaceMultiRouteCache == nil then
		if not self.sceneId or self.sceneId <= 0 or not self.trackId or self.trackId <= 0 then
			return nil
		end

		local routeCache, routeError = WorldRaceDungeonUtils.buildRoute(self.sceneId, self.trackId)

		self._worldRaceMultiRouteCache = routeCache or false

		if not routeCache then
			self.logger:error("world race multi UI route invalid sceneId=%s trackId=%s error=%s", self.sceneId, self.trackId, routeError)
		end
	end

	local routeCache = self._worldRaceMultiRouteCache

	if not routeCache then
		return nil
	end

	if state.crossedIndex and state.crossedIndex[#routeCache.gates] then
		return routeCache.totalLength
	end

	local passerByInfo = self.passerByMap and self.passerByMap[playerId]

	if passerByInfo and passerByInfo:isExited() then
		return nil
	end

	local player = pg.me and pg.me.id == playerId and pg.me or pg.getEntity(playerId)

	if not player or player.space ~= self then
		return nil
	end

	local position = player:getPosition()

	if not position then
		return nil
	end

	local progress = WorldRaceDungeonUtils.calculateProgress(routeCache, position, state.lastCheckpointIndex)

	return progress and progress.routeDistance or nil
end

function ClientRacingDungeonMulti:destroy()
	self:_clearWorldRacePlayerVisualEffects()

	if pg.space == self then
		self:_hideWorldRaceFinishCountdownTips()
	end

	self._worldRaceMultiRouteCache = nil

	ClientRacingDungeonMulti.super.destroy(self)
end

function ClientRacingDungeonMulti:on_playersRank_changed(oldValue, newValue)
	self:refreshWorldRacePlayerVisualEffects()
	self:_notifyWorldRaceMultiRankChanged()
	self:_tryShowWorldRaceLocalFinishFeedback()
end

function ClientRacingDungeonMulti:on_bestFashionPlayerId_changed(oldValue, newValue)
	self:refreshWorldRacePlayerVisualEffects()
end

function ClientRacingDungeonMulti:on_playerLinks_changed(oldValue, newValue)
	if self == pg.space then
		facade:sendMsgToUI(MessageName.WORLD_RACE_MULTI_LIKE_CHANGED)
	end
end

function ClientRacingDungeonMulti:on_finishedPlayerIds_changed(oldValue, newValue)
	self:refreshWorldRaceFinishMark()
	self:_notifyWorldRaceMultiRankChanged()
	self:_tryShowWorldRaceLocalFinishFeedback()
	self:_refreshWorldRaceFinishCountdownTips()
end

function ClientRacingDungeonMulti:on_fbEndTime_changed(oldValue, newValue)
	self:_refreshWorldRaceFinishCountdownTips()
end

function ClientRacingDungeonMulti:on_worldRacePasserByMap_entryAdded(playerId, value)
	self:refreshWorldRacePlayerVisualEffects(playerId)
	self:_notifyWorldRaceMultiRankChanged()
end

function ClientRacingDungeonMulti:onDisplayInfoChange(oldValue, newValue, playerId)
	ClientRacingDungeonMulti.super.onDisplayInfoChange(self, oldValue, newValue, playerId)
	self:_notifyWorldRaceMultiRankChanged()
end

function ClientRacingDungeonMulti:_notifyWorldRaceMultiRankChanged()
	if self == pg.space then
		facade:sendMsgToUI(MessageName.WORLD_RACE_MULTI_RANK_CHANGED)
	end
end

function ClientRacingDungeonMulti:_tryShowWorldRaceLocalFinishFeedback()
	if self._worldRaceLocalFinishFeedbackShown or pg.space ~= self or self.status ~= DungeonConst.STATUS.PLAYING or not pg.me or not self:isWorldRacePlayerFinished(pg.me.id) then
		return
	end

	local rank
	local playersRank = self.playersRank or {}

	for index, playerId in ipairs(playersRank) do
		if playerId == pg.me.id then
			rank = index

			break
		end
	end

	local tips = pg.global and pg.global.ui and pg.global.ui.tips

	if rank == nil or not tips then
		return
	end

	self._worldRaceLocalFinishFeedbackShown = true

	tips:showWorldRaceFinishMore(rank)
end

function ClientRacingDungeonMulti:onStatusClosed(params)
	self:_clearWorldRacePlayerVisualEffects()
	ClientRacingDungeonMulti.super.onStatusClosed(self, params)
	self:_hideWorldRaceFinishCountdownTips()
end

function ClientRacingDungeonMulti:onWorldRaceTrackShowcaseFinished()
	local reported = ClientRacingDungeonMulti.super.onWorldRaceTrackShowcaseFinished(self)

	if reported then
		self:_refreshWorldRaceReadyTips()
	end

	return reported
end

function ClientRacingDungeonMulti:onStatusInit(params)
	ClientRacingDungeonMulti.super.onStatusInit(self, params)
	self:refreshWorldRacePlayerVisualEffects()
end

function ClientRacingDungeonMulti:onStatusPlayerReady(params)
	ClientRacingDungeonMulti.super.onStatusPlayerReady(self, params)
	self:refreshWorldRacePlayerVisualEffects()
	self:_refreshWorldRaceReadyTips()
end

function ClientRacingDungeonMulti:on_readyEndTm_changed(oldValue, newValue)
	self:_refreshWorldRaceReadyTips()
end

function ClientRacingDungeonMulti:_refreshWorldRaceReadyTips()
	local tips = pg.global and pg.global.ui and pg.global.ui.tips

	if not tips then
		return
	end

	tips:hideGrabEggWaitingInfo()

	if pg.space ~= self or not self:hasTrackShowcaseFinished() then
		return
	end

	if self.status == DungeonConst.STATUS.INIT then
		tips:showGrabEggWaitingInfo({
			tipsTextKey = "RACING_WAITING_ENTER"
		})

		return
	end

	if self.status ~= DungeonConst.STATUS.PLAYER_READY then
		return
	end

	local endTime = tonumber(self.readyEndTm) or 0

	if endTime > 0 then
		tips:showGrabEggWaitingInfo({
			tipsTextKey = "RACING_WAITING_START",
			endTime = endTime
		})
	end
end

function ClientRacingDungeonMulti:onStatusCountDown(params)
	ClientRacingDungeonMulti.super.onStatusCountDown(self, params)
	self:refreshWorldRacePlayerVisualEffects()
	self:_hideWorldRaceFinishCountdownTips()
	self:_showWorldRaceCountDown()
end

function ClientRacingDungeonMulti:on_countDownEndTm_changed(oldValue, newValue)
	if self.status == DungeonConst.STATUS.COUNT_DONW then
		self:_showWorldRaceCountDown()
	end
end

function ClientRacingDungeonMulti:_showWorldRaceCountDown()
	if not pg.global or not pg.global.ui or not pg.global.ui.tips then
		return
	end

	local endTime = tonumber(self.countDownEndTm) or 0

	pg.global.ui.tips:hideGrabEggWaitingInfo()
	pg.global.ui.tips:hideCountDownBeat()

	if endTime <= Time.secondCache then
		return
	end

	pg.global.ui.tips:showCountDownBeat(endTime)
end

function ClientRacingDungeonMulti:onStatusPlaying(params)
	ClientRacingDungeonMulti.super.onStatusPlaying(self, params)
	self:refreshWorldRacePlayerVisualEffects()

	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:hideGrabEggWaitingInfo()
	end

	self:_refreshWorldRaceFinishCountdownTips()
end

function ClientRacingDungeonMulti:onStatusReward(params)
	ClientRacingDungeonMulti.super.onStatusReward(self, params)
	self:_clearWorldRacePlayerVisualEffects()
	self:_hideWorldRaceFinishCountdownTips()
end

function ClientRacingDungeonMulti:refreshWorldRacePlayerVisualEffects(playerId, visualEntityChanged)
	local entity = playerId and pg.getEntity(playerId)
	local master = entity and entity.getMasterEntity and entity:getMasterEntity()

	playerId = master and master.id or playerId

	self:_refreshWorldRaceCrownEffect(playerId, visualEntityChanged)
	self:_refreshWorldRaceSpotlightEffect(playerId, visualEntityChanged)
end

function ClientRacingDungeonMulti._normalizeWorldRacePlayerId(playerId)
	if playerId == nil or playerId == "" or playerId == 0 or playerId == "0" then
		return nil
	end

	return playerId
end

function ClientRacingDungeonMulti:_getWorldRacePlayerEntity(playerId)
	if playerId == nil then
		return nil
	end

	local player = pg.me and pg.me.id == playerId and pg.me or pg.getEntity(playerId)

	if not player or player.space ~= self then
		return nil
	end

	return player
end

function ClientRacingDungeonMulti:_getWorldRacePlayerVisualEntity(playerId)
	local player = self:_getWorldRacePlayerEntity(playerId)

	if not player then
		return nil
	end

	if player == pg.me then
		local pawn = pg.pawn
		local pawnMaster = pawn and pawn.getMasterEntity and pawn:getMasterEntity()

		if pawn and pawn.space == self and pawn.eModel and (pawn == player or pawnMaster == player) then
			return pawn
		end
	end

	local controllingPet = player.getControllingPet and player:getControllingPet()

	if controllingPet and controllingPet.space == self and controllingPet.eModel then
		return controllingPet
	end

	return player.eModel and player or nil
end

function ClientRacingDungeonMulti:_playWorldRacePlayerEffect(playerId, effectKey)
	local visualEntity = self:_getWorldRacePlayerVisualEntity(playerId)

	if not visualEntity or not visualEntity.playEffect then
		return nil
	end

	local effectId = visualEntity:playEffect(effectKey)

	if not effectId or effectId == 0 then
		return nil
	end

	return effectId, visualEntity.id
end

function ClientRacingDungeonMulti:_isWorldRacePlayerEffectPlaying(playerId, effectEntityId, effectId)
	local visualEntity = self:_getWorldRacePlayerVisualEntity(playerId)

	if not visualEntity or visualEntity.id ~= effectEntityId or not effectId or not visualEntity.getEffectTransform then
		return false
	end

	local effectTransform = visualEntity:getEffectTransform(effectId)

	return effectTransform ~= nil and not IsNil(effectTransform)
end

function ClientRacingDungeonMulti:_stopWorldRaceCrownEffect()
	local effectEntity = self._worldRaceCrownEffectEntityId and pg.getEntity(self._worldRaceCrownEffectEntityId)

	if effectEntity and self._worldRaceCrownEffectId then
		effectEntity:stopEffectById(self._worldRaceCrownEffectId)
	end

	self._worldRaceCrownPlayerId = nil
	self._worldRaceCrownEffectId = nil
	self._worldRaceCrownEffectEntityId = nil
end

function ClientRacingDungeonMulti:_stopWorldRaceSpotlightEffect()
	local effectEntity = self._worldRaceSpotlightEffectEntityId and pg.getEntity(self._worldRaceSpotlightEffectEntityId)

	if effectEntity and self._worldRaceSpotlightEffectId then
		effectEntity:stopEffectById(self._worldRaceSpotlightEffectId)
	end

	self._worldRaceSpotlightPlayerId = nil
	self._worldRaceSpotlightEffectId = nil
	self._worldRaceSpotlightEffectEntityId = nil
end

function ClientRacingDungeonMulti:_refreshWorldRaceCrownEffect(playerId, visualEntityChanged)
	local desiredPlayerId = self.status == DungeonConst.STATUS.PLAYING and ClientRacingDungeonMulti._normalizeWorldRacePlayerId(self.playersRank and self.playersRank[1]) or nil

	if self._worldRaceCrownPlayerId ~= desiredPlayerId then
		self:_stopWorldRaceCrownEffect()

		self._worldRaceCrownPlayerId = desiredPlayerId
	elseif visualEntityChanged and playerId == desiredPlayerId and not self:_isWorldRacePlayerEffectPlaying(desiredPlayerId, self._worldRaceCrownEffectEntityId, self._worldRaceCrownEffectId) then
		self:_stopWorldRaceCrownEffect()

		self._worldRaceCrownPlayerId = desiredPlayerId
	end

	if desiredPlayerId and not self._worldRaceCrownEffectId and (playerId == nil or playerId == desiredPlayerId) then
		self._worldRaceCrownEffectId, self._worldRaceCrownEffectEntityId = self:_playWorldRacePlayerEffect(desiredPlayerId, WorldRaceDungeonConst.PLAYER_EFFECT_KEY.CROWN)
	end
end

function ClientRacingDungeonMulti:_refreshWorldRaceSpotlightEffect(playerId, visualEntityChanged)
	local showSpotlight = self.status == DungeonConst.STATUS.INIT or self.status == DungeonConst.STATUS.PLAYER_READY
	local desiredPlayerId = showSpotlight and ClientRacingDungeonMulti._normalizeWorldRacePlayerId(self.bestFashionPlayerId) or nil

	if self._worldRaceSpotlightPlayerId ~= desiredPlayerId then
		self:_stopWorldRaceSpotlightEffect()

		self._worldRaceSpotlightPlayerId = desiredPlayerId
	elseif visualEntityChanged and playerId == desiredPlayerId and not self:_isWorldRacePlayerEffectPlaying(desiredPlayerId, self._worldRaceSpotlightEffectEntityId, self._worldRaceSpotlightEffectId) then
		self:_stopWorldRaceSpotlightEffect()

		self._worldRaceSpotlightPlayerId = desiredPlayerId
	end

	if desiredPlayerId and not self._worldRaceSpotlightEffectId and (playerId == nil or playerId == desiredPlayerId) then
		self._worldRaceSpotlightEffectId, self._worldRaceSpotlightEffectEntityId = self:_playWorldRacePlayerEffect(desiredPlayerId, WorldRaceDungeonConst.PLAYER_EFFECT_KEY.SPOTLIGHT)
	end
end

function ClientRacingDungeonMulti:_clearWorldRacePlayerVisualEffects()
	self:_stopWorldRaceCrownEffect()
	self:_stopWorldRaceSpotlightEffect()
end

function ClientRacingDungeonMulti:_refreshWorldRaceFinishCountdownTips()
	local tips = pg.global and pg.global.ui and pg.global.ui.tips

	if not tips then
		return
	end

	local endTime = tonumber(self.fbEndTime) or 0

	if pg.space ~= self or self.status ~= DungeonConst.STATUS.PLAYING or endTime <= Time.secondCache then
		self:_hideWorldRaceFinishCountdownTips()

		return
	end

	if self:isWorldRacePlayerFinished(pg.me and pg.me.id) then
		tips:hideWorldRaceCountdown()
		tips:showWorldRaceExit(endTime)

		return
	end

	tips:hideWorldRaceExit()
	tips:showWorldRaceCountdown(endTime)
end

function ClientRacingDungeonMulti:_hideWorldRaceFinishCountdownTips()
	local tips = pg.global and pg.global.ui and pg.global.ui.tips

	if not tips then
		return
	end

	tips:hideWorldRaceCountdown()
	tips:hideWorldRaceExit()
end

return ClientRacingDungeonMulti
