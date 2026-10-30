-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientBossRushDungeon.lua

local Class = require("Core.Framework.Class")
local ClientPveDungeon = require("Entities.SpaceEntities.ClientPveDungeon")
local UIConst = require("Const.UIConst")
local MessageName = require("Const.MessageName")
local BossRushUtils = require("Utils.BossRushUtils")
local AbilityConst = require("Common.Const.AbilityConst")
local BossRushLevelData = require("Data.bossrush_guanka_data")
local CallbackHandler = require("Core.Common.CallbackHandler")
local EntityManager = require("Core.Common.EntityManager")
local EventBus = require("Common.Ability.Buff.EventBus")
local EventConst = require("Const.EventConst")
local SceneUtils = require("Common.Utils.SceneUtils")
local ENABLE_FIRST_BOSS_DEATH_TIP = false
local BOSS_SPAWNER_ORDER_BY_GRAPH = {
	[78824533] = {
		78797760,
		91530847
	}
}
local ClientBossRushDungeon = Class.Class("ClientBossRushDungeon", ClientPveDungeon)

function ClientBossRushDungeon:ctor(entityId)
	ClientBossRushDungeon.super.ctor(self, entityId)

	self.rogueGroundReady = false
	self.waitGroundReadySet = {}
	self.firstBossDeathObserver = EventBus.EventObserver()
	self.secondBossEnterCombatObserver = EventBus.EventObserver()
	self._bossEntityEnterCallback = nil
	self.bossLinkTipShown = false
	self.secondBossActivated = false
end

function ClientBossRushDungeon:registerWaitGroundReady(entity)
	self.waitGroundReadySet[entity] = true
end

function ClientBossRushDungeon:unregisterWaitGroundReady(entity)
	self.waitGroundReadySet[entity] = nil
end

function ClientBossRushDungeon:resetGroundReady()
	self.rogueGroundReady = false
end

function ClientBossRushDungeon:onRogueGroundReady()
	self.rogueGroundReady = true

	local waiting = self.waitGroundReadySet

	self.waitGroundReadySet = {}

	for entity in pairs(waiting) do
		if entity and not entity.isDestroyed and entity.onRogueGroundReady then
			entity:onRogueGroundReady()
		end
	end
end

function ClientBossRushDungeon:init(dict)
	ClientBossRushDungeon.super.init(self, dict)

	self.bossRushResultPending = false

	return true
end

function ClientBossRushDungeon:start()
	ClientBossRushDungeon.super.start(self)

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_BOSS_RUSH_MAIN) then
		pg.global.ui:close(UIConst.UI_ID_BOSS_RUSH_MAIN)
	end

	if not self._bossEntityEnterCallback then
		self._bossEntityEnterCallback = CallbackHandler(self, "onBossEntityEnterSpace")

		EntityManager.eventEmitter:addEventListener(EventConst.ENTITY_ENTER_SPACE, self._bossEntityEnterCallback)
	end

	for _, entity in pairs(pg.getEntities()) do
		self:tryListenFirstBossDeath(entity)
		self:tryListenSecondBossEnterCombat(entity)
	end
end

function ClientBossRushDungeon:onSceneLoaded()
	BossRushUtils.requestTeamRoom()
end

function ClientBossRushDungeon:onSelectedTankEntIdChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_TEAM_TANK_CHANGED, true)
end

function ClientBossRushDungeon:onBattleStartTimeChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_BATTLE_START_TIME_CHANGED)
end

function ClientBossRushDungeon:onLevelScoreChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_LEVEL_SCORE_CHANGED)
end

function ClientBossRushDungeon:onLevelGradeChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_LEVEL_GRADE_CHANGED)
end

function ClientBossRushDungeon:onTeamerInfosChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_TEAM_INFO_CHANGED)
end

function ClientBossRushDungeon:onSelectBatBuffsChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_TEAM_BUFF_CHANGED)
end

function ClientBossRushDungeon:onRecommendBatBuffsChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_TEAM_RECOMMEND_BUFF_CHANGED)
end

function ClientBossRushDungeon:onOpenLevelIdChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_TEAM_LEVEL_ID_CHANGED)
end

function ClientBossRushDungeon:onResult(result)
	return
end

function ClientBossRushDungeon:RPC_SC_ChallengeResult(result, failReason)
	return
end

function ClientBossRushDungeon:onCurLevelTeamReviveCountChanged(oldVal, newVal)
	facade:sendMsgToUI(MessageName.BOSS_RUSH_CUR_LEVEL_TEAM_REVIVE_COUNT_CHANGED)
end

function ClientBossRushDungeon:onBossEntityEnterSpace(entity)
	if self:getBossSpawnIndex(entity) == 1 then
		self.bossLinkTipShown = false
		self.secondBossActivated = false
	end

	self:tryListenFirstBossDeath(entity)
	self:tryListenSecondBossEnterCombat(entity)
end

function ClientBossRushDungeon:tryListenFirstBossDeath(entity)
	if not ENABLE_FIRST_BOSS_DEATH_TIP or not entity or entity.space ~= self or not entity.subject then
		return
	end

	if self:getBossSpawnIndex(entity) ~= 1 then
		return
	end

	local dungeonId = self.dungeonId

	self.firstBossDeathObserver:listen(entity.subject, AbilityConst.COMBAT_EVENT_DEAD, function()
		if not self.isDestroyed and self.dungeonId == dungeonId then
			self:onFirstBossDead(entity)
		end
	end)
end

function ClientBossRushDungeon:onFirstBossDead(entity)
	if not ENABLE_FIRST_BOSS_DEATH_TIP or self.bossLinkTipShown or not entity then
		return
	end

	if self:getBossSpawnIndex(entity) ~= 1 then
		return
	end

	local tips = pg.global.ui and pg.global.ui.tips

	if not tips then
		return
	end

	self.bossLinkTipShown = true

	tips:showBattleRoomMechanismTips(pg.getGameString("BOSS_RUSH_SECOND_BOSS_TIPS"), 3)
end

function ClientBossRushDungeon:tryListenSecondBossEnterCombat(entity)
	if not entity or entity.space ~= self or not entity.subject then
		return
	end

	if self:getBossSpawnIndex(entity) ~= 2 then
		return
	end

	if entity:isInCombat() then
		self:onSecondBossActivated(entity)

		return
	end

	local dungeonId = self.dungeonId

	self.secondBossEnterCombatObserver:listen(entity.subject, AbilityConst.COMBAT_EVENT_ENTER_COMBAT, function()
		if not self.isDestroyed and self.dungeonId == dungeonId then
			self:onSecondBossActivated(entity)
		end
	end)
end

function ClientBossRushDungeon:onSecondBossActivated(entity)
	if self.secondBossActivated or not entity or entity.isDestroyed or entity:isDead() then
		return
	end

	if self:getBossSpawnIndex(entity) ~= 2 then
		return
	end

	local tips = pg.global.ui and pg.global.ui.tips
	local switched = tips and tips:switchBossRushBossTitle(entity)

	self.secondBossActivated = switched == true
end

function ClientBossRushDungeon:destroy()
	if self._bossEntityEnterCallback then
		EntityManager.eventEmitter:removeEventListener(EventConst.ENTITY_ENTER_SPACE, self._bossEntityEnterCallback)

		self._bossEntityEnterCallback = nil
	end

	if self.firstBossDeathObserver then
		self.firstBossDeathObserver:unlistenAll()

		self.firstBossDeathObserver = nil
	end

	if self.secondBossEnterCombatObserver then
		self.secondBossEnterCombatObserver:unlistenAll()

		self.secondBossEnterCombatObserver = nil
	end

	ClientBossRushDungeon.super.destroy(self)
end

function ClientBossRushDungeon:getBossSpawnIndex(entity)
	if not entity or entity.isDestroyed or entity.space ~= self or not entity.staticId or entity.staticId == 0 then
		return nil
	end

	local levelConfig = BossRushLevelData[self.dungeonId]
	local overrideContent = levelConfig and levelConfig.spawnerOverrideContent

	if not overrideContent then
		return nil
	end

	local sandboxData = SceneUtils.getSceneSandboxData(self.sceneId, self.id)
	local sandboxConfig = sandboxData[levelConfig.sandboxId]
	local spawnerOrder = sandboxConfig and BOSS_SPAWNER_ORDER_BY_GRAPH[sandboxConfig.graphId]

	if not spawnerOrder then
		return nil
	end

	local spawnerData = SceneUtils.getSceneSpawnerData(self.sceneId, self.id)

	for _, spawnerId in ipairs(spawnerOrder) do
		local contents = overrideContent[spawnerId]
		local firstContent = contents and contents[1]
		local spawnerConfig = spawnerData[spawnerId]

		if not firstContent or not firstContent[1] or firstContent[1] == 0 or not spawnerConfig or not spawnerConfig.spawnGroups or not spawnerConfig.spawnGroups[1] then
			return nil
		end
	end

	for bossIndex, spawnerId in ipairs(spawnerOrder) do
		for _, group in ipairs(spawnerData[spawnerId].spawnGroups) do
			for spawnIndex, staticId in ipairs(group.spawnIds or {}) do
				local content = overrideContent[spawnerId][spawnIndex]

				if entity.staticId == staticId and content and content[1] == entity.templateId then
					return bossIndex
				end
			end
		end
	end

	return nil
end

return ClientBossRushDungeon
