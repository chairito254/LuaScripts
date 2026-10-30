-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientPlayerDuelDungeon.lua

local Class = require("Core.Framework.Class")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = require("Core.Log.LoggerManager").getLogger("ClientPlayerDuelDungeon")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local ClientDungeon = require("Entities.SpaceEntities.ClientDungeon")
local HotkeyConst = require("Const.HotkeyConst")
local Const = require("Common.Const.Const")
local DungeonConst = require("Common.Const.DungeonConst")
local LuaTimeline = require("GameApp.Timeline.LuaTimeline")
local AbilityConst = require("Common.Const.AbilityConst")
local EventBus = require("Common.Ability.Buff.EventBus")
local MessageName = require("Const.MessageName")
local Utils = require("Common.Utils.Utils")
local SceneData = require("Data.scene_data")
local ClientPlayerDuelDungeon = Class.Class("ClientPlayerDuelDungeon", ClientDungeon)

function ClientPlayerDuelDungeon:ctor(entityId)
	ClientPlayerDuelDungeon.super.ctor(self, entityId)

	self.forceReloadOnSwitch = true
	self.petDeathObserver = EventBus.EventObserver()
	self.deadPetIds = {}

	logger:info("ClientPlayerDuelDungeon ctor ok")
end

function ClientPlayerDuelDungeon:start()
	ClientPlayerDuelDungeon.super.start(self)

	self.dungeonReadyTimer = self:addRepeatTimer(0.1, function()
		if not pg.me or pg.me.space ~= self or not pg.global.scene.isSceneReady or not pg.global.scene:isSceneValid() then
			return
		end

		self:removeTimer(self.dungeonReadyTimer)

		self.dungeonReadyTimer = nil

		if self:IsBeforeStatus(DungeonConst.STATUS.PLAYING) then
			self:beforeStartAnim()
		end

		self:playerDuelCreateAreaEffect()
	end)
end

function ClientPlayerDuelDungeon:onStatusChange(old, new)
	if not self:IsBeforeStatus(DungeonConst.STATUS.PLAYER_READY) and pg.global.scene:tryHideLoadingPanel() then
		pg.me:tryTriggerPendingTeleportAppear()
	end

	if new == DungeonConst.STATUS.PLAYER_READY then
		self:playStartAnim()
	elseif new == DungeonConst.STATUS.PLAYING then
		self:afterStartAnim()
	end

	ClientPlayerDuelDungeon.super.onStatusChange(self, old, new)
end

function ClientPlayerDuelDungeon:onEntityJoin(entity)
	ClientPlayerDuelDungeon.super.onEntityJoin(self, entity)
	self:listenPetDeath(entity)
end

function ClientPlayerDuelDungeon:listenPetDeath(petEntity)
	if not Utils.isPet(petEntity) or not petEntity.subject then
		return
	end

	self.petDeathObserver:listen(petEntity.subject, AbilityConst.COMBAT_EVENT_DEAD, function()
		self:onPetDead(petEntity)
	end)

	if petEntity:isDead() then
		self:onPetDead(petEntity)
	end
end

function ClientPlayerDuelDungeon:onPetDead(petEntity)
	if self.deadPetIds[petEntity.id] then
		return
	end

	self.deadPetIds[petEntity.id] = true

	facade:SendMessageCommand(MessageName.PLAYER_DUEL_PET_DEATH, {
		petId = petEntity.id,
		masterId = petEntity.masterId
	})
end

function ClientPlayerDuelDungeon:destroy()
	if self.dungeonReadyTimer then
		self:removeTimer(self.dungeonReadyTimer)

		self.dungeonReadyTimer = nil
	end

	self:playerDuelRemoveAreaEffect()
	self.petDeathObserver:unlistenAll()

	self.petDeathObserver = nil

	pg.global.ui.tips:setBossTitleItemInvisibleReason("playerDuel", true)
	ClientPlayerDuelDungeon.super.destroy(self)
end

function ClientPlayerDuelDungeon:getPlayerEntities()
	local selfEntity = pg.me
	local opponentEntity

	for playerId, _ in self.passerByMap:items() do
		if playerId ~= selfEntity.id then
			opponentEntity = pg.getEntity(playerId)

			break
		end
	end

	return selfEntity, opponentEntity
end

function ClientPlayerDuelDungeon:playStartAnim()
	local timeline = LuaTimeline.new()

	self.npcDuelCameraTimeline = timeline

	local COUNT_DOWN_START_TIME = 0
	local COUNT_DOWN_DURATION = 3
	local START_TIPS_TIME = COUNT_DOWN_START_TIME + COUNT_DOWN_DURATION
	local START_TIPS_DURATION = 3

	timeline:setDuration(START_TIPS_TIME)
	timeline:createAndAddTrigger(COUNT_DOWN_START_TIME, function()
		pg.global.ui.tips:showCountDownBeat(Time.secondCache + COUNT_DOWN_DURATION)
	end)
	timeline:createAndAddTrigger(START_TIPS_TIME, function()
		self:playerDuelStartTips(START_TIPS_DURATION)
	end)
	timeline:start()
end

function ClientPlayerDuelDungeon:playerDuelSetJoyStickActive(active)
	if active then
		pg.global.ui:show(UIConst.UI_ID_HUD_MOBILE_OPERATE)
	else
		pg.global.ui:hide(UIConst.UI_ID_HUD_MOBILE_OPERATE)
	end
end

function ClientPlayerDuelDungeon:playerDuelStartTips(duration)
	pg.global.ui.tips:showA1Tips({
		id = "TowerResultStart",
		showText = pg.getGameString("NPCDUEL_BATTLE_START"),
		duration = duration or 3
	})
	pg.game.audio:playEvent("SFX_UI_Rouge_ChallengeBegins")
end

function ClientPlayerDuelDungeon:beforeStartAnim()
	pg.global.ui:close(UIConst.UI_ID_PLAYER_DUEL_SETTLEMENT)
	pg.game.input:enablePlayerInput(false, HotkeyConst.INPUT_BLOCK_FLAG.Move)
	self:playerDuelSetJoyStickActive(false)
	pg.global.ui:hide(UIConst.UI_ID_HUD_V2)
	pg.global.ui.tips:setBossTitleItemInvisibleReason("playerDuel", false)
end

function ClientPlayerDuelDungeon:afterStartAnim()
	pg.game.input:enablePlayerInput(true, HotkeyConst.INPUT_BLOCK_FLAG.Move)
	self:playerDuelSetJoyStickActive(true)
	pg.global.ui:show(UIConst.UI_ID_HUD_V2)
	pg.global.ui.hudV2:showPlayerDuelInCombat(true)
	pg.global.ui.tips:setBossTitleItemInvisibleReason("playerDuel", true)
	pg.global.ui.tips:refreshBossTitle()
end

function ClientPlayerDuelDungeon:getPetDieState()
	local function collectDieState(entity)
		local dieState = {}

		if not entity then
			return dieState
		end

		local pets = entity:getPets() or {}
		local prepareList = entity.petPrepareList or {}

		for index, petId in ipairs(prepareList) do
			local petInfo = pets[petId]
			local petEntity = pg.getEntity(petId)
			local isDie = self.deadPetIds[petId] or false

			if petEntity then
				isDie = petEntity:isDead()
			elseif not isDie and petInfo then
				isDie = (petInfo.hpRatio or 0) <= 0
			end

			dieState[index] = {
				isDie = isDie
			}
		end

		return dieState
	end

	local selfEntity, opponentEntity = self:getPlayerEntities()
	local playerDieState = collectDieState(selfEntity)
	local botDieState = collectDieState(opponentEntity)

	return playerDieState, botDieState
end

function ClientPlayerDuelDungeon:onResult(result)
	pg.global.ui.tips:setBossTitleItemInvisibleReason("playerDuel", false)
	pg.global.ui:open(UIConst.UI_ID_PLAYER_DUEL_SETTLEMENT, result)
end

function ClientPlayerDuelDungeon:onPlayerDuelEndChoicesChanged(oldChoices, newChoices)
	facade:sendMsgToUI(MessageName.PLAYER_DUEL_END_CHOICES_CHANGED)
end

function ClientPlayerDuelDungeon:playerDuelCreateAreaEffect()
	self:playerDuelRemoveAreaEffect()

	local sceneData = SceneData[self.sceneId]
	local pointA = sceneData and sceneData.PointAPositon
	local pointB = sceneData and sceneData.PointBPosition

	if not pointA or not pointB then
		return
	end

	local playerPosition = pg.me:getPosition()
	local centerPosition = Vector3((pointA[1] + pointB[1]) / 2, playerPosition.y, (pointA[2] + pointB[2]) / 2)
	local scale = 0.6666666666666666
	local effectInfo = {}

	self.playerDuelAreaEffectInfo = effectInfo

	local loadFinished = false
	local taskId = pg.global.resMgr:GetInstanceFromCacheByLua("$Eff_BossArea_Common_30X30_Collider.prefab", function(obj)
		loadFinished = true
		effectInfo.taskId = nil

		if IsNil(obj) then
			if self.playerDuelAreaEffectInfo == effectInfo then
				self.playerDuelAreaEffectInfo = nil
			end

			return
		end

		if self.playerDuelAreaEffectInfo ~= effectInfo or effectInfo.removing then
			pg.global.resMgr:RemoveInstanceToCache(obj, true)

			if self.playerDuelAreaEffectInfo == effectInfo then
				self.playerDuelAreaEffectInfo = nil
			end

			return
		end

		effectInfo.obj = obj
		obj.transform.position = centerPosition

		local rawScale = obj.transform.localScale

		obj.transform.localScale = Vector3(rawScale.x * scale, rawScale.y, rawScale.z * scale)
	end)

	if not loadFinished then
		effectInfo.taskId = taskId
	end
end

function ClientPlayerDuelDungeon:playerDuelRemoveAreaEffect()
	local effectInfo = self.playerDuelAreaEffectInfo

	if not effectInfo then
		return
	end

	effectInfo.removing = true

	if effectInfo.taskId then
		pg.global.resMgr:TryCancelGOLoadAsyncTask(effectInfo.taskId)

		effectInfo.taskId = nil
	end

	if NotNil(effectInfo.obj) then
		pg.global.resMgr:RemoveInstanceToCache(effectInfo.obj, true)

		effectInfo.obj = nil
	end

	self.playerDuelAreaEffectInfo = nil
end

return ClientPlayerDuelDungeon
