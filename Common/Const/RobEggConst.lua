-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\RobEggConst.lua

local NoticeDef = require("Common.NoticeDef")
local Const = require("Common.Const.Const")
local RobEggConst = {
	EGG_SHIP_TRANSFER_NO_EGG_TEXT_COLOR = "#F67574",
	EGG_SHIP_TRANSFER_HAS_EGG_TEXT_COLOR = "#FFFFFF",
	CALCINATION_ENTRY_ENABLED = false,
	PVP_MODE_ENTRY_ENABLED = true,
	GM_SKIP_ENTER_CHECK = false,
	ROBEGG_BILOG_EXPENSIVE_ITEM_SELL_PRICE_LOG = 5000000
}

RobEggConst.RobEggTalentEffectType = {
	ROBEGG_DUNGEON = 1,
	ROBEGG_AND_OUTSIDE = 2
}
RobEggConst.RobEggTalentEventType = {
	UNLOCK_TALENT = 4,
	ROBEGG_AND_OUTSIDE = 3,
	ROBEGG_DUNGEON = 1,
	OUTSIDE = 2
}
RobEggConst.ROB_EGG_TALENT_EVENT_EFFECT = {
	DUMMY = 0,
	LOOT_SPEED_UP = 1
}
RobEggConst.LIMITTIME_STATE = {
	BEGIN = 2,
	READY = 1,
	REWARD = 4,
	FINISH = 3
}
RobEggConst.LIMIT_DURING_TIME = {
	CLIENTREADYWAITTIME = 1.5,
	REWARDTELPORTTIME = 50,
	REWARDDURINGTIME = 0.5,
	BEGINDURINGTIME = 60,
	CLIENTBEGINWAITTIME = 1.5,
	READYDURINGTIME = 10
}
RobEggConst.PROXIMITY_MAP_MARK_ACTIVE_DISTANCE = {
	[1997] = 30,
	[1996] = 30,
	[1998] = 30,
	[1999] = 30
}
RobEggConst.SYNC_MARK_TYPE = {
	LUCKY_MOUSE = 1
}
RobEggConst.SYNC_MARK_CONFIG_ID = {
	[RobEggConst.SYNC_MARK_TYPE.LUCKY_MOUSE] = 1021
}
RobEggConst.SCENE_CHECK = {
	[3004] = {
		checkFunc = "prepareEnterFairMode",
		noticeId = NoticeDef.ROB_EGG_MATES_BRING_FORBID_ITEM
	}
}
RobEggConst.ROBEGG_TICKET = {
	[Const.DungeonDifficultLevel.CHAOS] = {
		ticketId = 5200002,
		noticeId = NoticeDef.ROB_EGG_LACK_TICKET
	},
	[Const.DungeonDifficultLevel.PVP] = {
		ticketId = 5200001,
		noticeId = NoticeDef.ROB_EGG_LACK_PVP_TICKET
	}
}
RobEggConst.ROBEGG_NEWER_GUIDE = {
	GooutDG = 2,
	GoToDG = 1,
	GoToSubmitEgg = 3
}
RobEggConst.ROBEGG_LEVEL_SCORE_PROTECT_REASON = {
	Newer = 1,
	Dummy = 0
}
RobEggConst.ROBEGG_TARGET = {
	Retreat = 0,
	FightForEgg = 1
}
RobEggConst.ROBEGG_EVENT = {
	FightEggFinish = 3,
	Retreat = 2,
	DeathOver = 1
}
RobEggConst.CHEAT_LEVEL = {
	Good = 0,
	ForbidRobEgg2 = 3,
	ForbidRobEgg1 = 2,
	Warning = 1
}
RobEggConst.CHEAT_REASON = {
	SubmitEggTooFast = 3,
	RetreatTooFast = 2,
	RunTooFast = 1
}
RobEggConst.ROBEGG_SECRET_KEY_DOOR = {
	Exit = 2,
	Enterance = 1
}
RobEggConst.SEASON_CHALLENGE_REWARD_STATE = {
	NotFinished = 1,
	Rewarded = 3,
	CanGetReward = 2
}

return RobEggConst
