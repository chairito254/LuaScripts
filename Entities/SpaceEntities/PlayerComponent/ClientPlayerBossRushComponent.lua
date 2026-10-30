-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\PlayerComponent\\ClientPlayerBossRushComponent.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local Class = require("Core.Framework.Class")
local BossRushLevelData = require("Data.bossrush_guanka_data")
local UIConst = require("Const.UIConst")
local BossRushUtils = require("Utils.BossRushUtils")
local TimerManager = require("Core.Timer.TimerManager")
local BossRushLevelMappingData = require("Data.bossrush_level_mapping_data")
local Const = require("Common.Const.Const")
local MessageName = require("Const.MessageName")
local ClientPlayerBossRushComponent = Class.Component("ClientPlayerBossRushComponent")

function ClientPlayerBossRushComponent:ctor()
	self.curBossRushPlace = "prepare"
	self.curDungeonId = nil
end

function ClientPlayerBossRushComponent:init(dict)
	return true
end

function ClientPlayerBossRushComponent:goBossRushDungeon(dungeonId)
	self:serverMsg("RPC_CS_BossRushGotoGuanka", dungeonId)
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushPlayerReconnect(args)
	self:playBossRushSceneScan(false, args.dungeonId)
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushGotoGuanka(code)
	self:bossRushGoToLevel()
end

function ClientPlayerBossRushComponent:bossRushGoToLevel()
	BossRushUtils.recordPlayerInfo(self.space.dungeonId)
	self:playBossRushSceneScan(true)

	BossRushUtils.needResetBattleTime = true

	pg.global.ui.hudV2:refreshBossRushInfo()
	pg.global.ui.tips:clearAllBossMechanismTips()
	pg.global.ui:closeAllNormalPanel({
		[UIConst.UI_ID_BOSS_RUSH_BATTLE_RESULT] = true,
		[UIConst.UI_ID_BOSS_RUSH_BATTLE_DETAIL_RESULT] = true
	})

	if BossRushUtils.getCurBossRushPlace() == Const.BossRushTeleportTarget.Prepare then
		BossRushUtils.requestTeamRoom()
		pg.global.ui.tips:setBossTitleItemInvisibleReason("inBossRushPrepare", false)
	else
		pg.global.ui.tips:setBossTitleItemInvisibleReason("inBossRushPrepare", true)
	end
end

function ClientPlayerBossRushComponent:playBossRushSceneScan(playEffect, dungeonId)
	if not pg.me.space:isBossRushEnv() then
		return
	end

	local ins = CS.FunPlus.WorldX.RenderingScripts.Effect.SceneSwitchManager.Ins

	if ins then
		local curDungeonId = dungeonId or self.space.dungeonId

		if curDungeonId == self.curDungeonId then
			return
		end

		local sceneLevelName = (BossRushLevelData[curDungeonId] or EMPTY_TABLE).levelId or ""

		sceneLevelName = sceneLevelName == "Level_Prepare" and (BossRushLevelData[BossRushUtils.getRoomLevelId()] or EMPTY_TABLE).levelId or sceneLevelName

		local sceneLevelId = BossRushLevelMappingData[sceneLevelName] and BossRushLevelMappingData[sceneLevelName].mappingId or 0

		self.space:resetGroundReady()
		ins:ChangeSceneLevelId(sceneLevelId, self:getPosition(), playEffect, sceneLevelName)

		self.curDungeonId = curDungeonId

		if playEffect then
			pg.game.audio:playEvent("SFX_UI_Rouge_LoadScene")
		end
	end
end

function ClientPlayerBossRushComponent:bossRushSelectPet(levelId, petIds)
	self:serverMsg("RPC_CS_BossRushSetBatPetList", levelId, petIds)
end

function ClientPlayerBossRushComponent:resetBossRushLevel()
	self:serverMsg("RPC_CS_BossRushGuankaBatAgain")
end

function ClientPlayerBossRushComponent:endBossRushLevel()
	self:serverMsg("RPC_CS_BossRushGuankaEndBat")
end

function ClientPlayerBossRushComponent:selectTankEntId(entId)
	self:serverMsg("RPC_CS_BossRushSelectTankEntId", entId)
end

function ClientPlayerBossRushComponent:bossRushSelectBattleBuffs(buffSelected)
	self:serverMsg("RPC_CS_BossRushSelectBattleBuff", buffSelected[1])
end

function ClientPlayerBossRushComponent:openChallengeBoss(levelId)
	if not self:isInTeam() or self:isTeamLeader() then
		self:serverMsg("RPC_CS_BossRushOpenChangeBoss", levelId)
	end
end

function ClientPlayerBossRushComponent:bossRushCancelOpen()
	if not self:isInTeam() or self:isTeamLeader() then
		self:serverMsg("RPC_CS_BossRushCancelOpen")
	end
end

function ClientPlayerBossRushComponent:bossRushRecommendBattleBuff(buffId)
	if self:isInTeam() and not self:isTeamLeader() then
		self:serverMsg("RPC_CS_BossRushRecommendBattleBuff", buffId)
	end
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushNtfOpenChangeBoss(levelId)
	return
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushNtfCancelOpen()
	if not self:isInTeam() or pg.me:isTeamLeader() then
		return
	end

	local tipKey = "BOSS_RUSH_CANCEL_OPEN_TIP"
	local tipText = pg.getGameString(tipKey)

	pg.global.ui.tips:showTextTip(tipText)
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushAssistInfo(args)
	return
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushQuitAndSettle(args)
	return
end

function ClientPlayerBossRushComponent:RPC_SC_BossRushSetBatPetList(args)
	print("RPC_SC_BossRushSetBatPetList received", args)
end

function ClientPlayerBossRushComponent:RPC_SC_OnResult(result)
	if result and pg.global.platform:isConsole() then
		pg.global.resMgr:UnloadUnusedAssetDetail(0, 100, 1, 1)
	end

	if result and result.result then
		self.space.bossRushResultPending = true

		local battleResultInfo = {
			result = result,
			levelId = pg.space.dungeonId
		}

		battleResultInfo.playerSnapshots = BossRushUtils.buildBattleResultPlayerSnapshots(battleResultInfo.levelId)

		if pg.global.ui:checkUIOpen(UIConst.UI_ID_FUNC_MENU_EXIT) then
			pg.global.ui:close(UIConst.UI_ID_FUNC_MENU_EXIT)
		end

		local delayTime = result.bossKilled == 1 and 2 or 0.8

		BossRushUtils.clearPersonRankCD()
		TimerManager.addTimer(delayTime, function()
			pg.global.ui:open(UIConst.UI_ID_BOSS_RUSH_BATTLE_RESULT, battleResultInfo)
		end)
	else
		pg.global.ui.tips:showTextTip(pg.getGameString("FAILED"))
	end
end

local function notifyBossRushRedDotChanged()
	facade:sendMsgToUI(MessageName.BOSS_RUSH_RED_DOT_CHANGED)
end

function ClientPlayerBossRushComponent:onCurBossRushSeasonIdChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushSeasonRewardMapChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushSeasonBestGradeMapChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushRewardCycleChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushRewardGradeChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushGradeRewardReceivedChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushAssistRewardAvailableChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

function ClientPlayerBossRushComponent:onBossRushAssistRewardReceivedChanged(oldV, newV)
	notifyBossRushRedDotChanged()
end

return ClientPlayerBossRushComponent
