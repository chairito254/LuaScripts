-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\MatchConst.lua

local RoomConst = require("Common.Const.RoomConst")
local MatchConst = {}

MatchConst = {
	MATCH_STATUS_IN_AGAIN = 3,
	MATCH_STATUS_IN_MARKSUCC = 2,
	MATCH_STATUS_INIT = 1,
	MatchTypeDungeon = 203,
	MatchTypeTeam = 202,
	MatchTypeSingle = 201,
	MatchTypeRobEgg = 102,
	MatchTypeUnFairPVP1V1Debug = 101,
	MatchTypeFairPVP1V1Debug = 100,
	MatchTypeInvitePVP1V1_Fair = 4,
	MatchTypePVP1V1_UnFair = 2,
	MatchTypePVP1V1_Fair = 1,
	MatchTypeNone = 0,
	PVP1V1_2V2_POOLID = 3,
	PVP1V1_1V3_POOLID = 2,
	TEAM_DEFAULT_POOLID = 1,
	PVP1V1_DEFAULT_POOLID = 0,
	MATCH_STATUS_IN_MARKAGAIN = 10,
	MATCH_STATUS_IN_DUNGEON = 9,
	MATCH_STATUS_IN_ROOM = 8,
	MATCH_STATUS_IN_MATCH = 7,
	MATCH_STATUS_IN_MODIFYTEAM = 6,
	MATCH_STATUS_IN_REPLY = 5,
	MATCH_STATUS_IN_INVITE = 4,
	INVITEPVP1V1 = {
		ST_AGAIN = 5,
		ST_MARK = 4,
		ST_MATCH = 3,
		ST_PREPARE = 2,
		ST_INVITE = 1,
		ST_INIT = 0
	},
	INVITE_RESULT = {
		SUCCESS = 0,
		TIME_OUT = 2,
		CHECK_FAILED = 1
	},
	CONTRACT_BATTLE = {
		ST_PVP_UNLOCK = 7,
		ST_PLAYER_OFFLINE = 9,
		ST_PLAYER_DEAD = 8,
		ST_INIT = 1,
		ST_OTHER_INTERFACE = 6,
		ST_IN_BATTLE = 5,
		ST_IN_DIALOGUEPRO = 4,
		ST_IN_DUNGEON = 3,
		ST_IN_TEAM = 2
	},
	PvpCheckType = {
		Matching = 2,
		Formation = 1
	},
	ErrorCode = {
		SWITCH_CLOSE = 1,
		NO_ALL_READY = 6,
		PLAYER_NUM = 5,
		NO_LEADER = 4,
		INNER_ERR = 3,
		MATCHING = 2
	},
	SuitType = {
		FirstTeam = 2,
		Regular = 1
	},
	SuitCondition = {
		Level = 1,
		Power = 2
	},
	MatchLogType = {
		Reject = 3,
		Cancel = 2,
		Success = 1
	}
}
MatchConst.DEFAULT_POOL_CAPACITY = 1000
MatchConst.DEFAULT_CAMP_COUNT = 10
MatchConst.DEFAULT_CAMP_MEMBER_COUNT = 4
MatchConst.MATCH_TIMEOUT_SEC = 300
MatchConst.MAX_FIND_TIMES = 50
MatchConst.ONCE_TICK_COUNT = 200
MatchConst.TICK_OUT_TIME = 20
MatchConst.MATCH_FILTER_CONDITION = {
	MATCH_FILTER_SCORE = 0,
	MATCH_FILTER_CLASS_INFO = 100,
	MATCH_FILTER_ROB_EGG_RANK = 3,
	MATCH_FILTER_POWER = 2,
	MATCH_FILTER_LEVEL = 1
}
MatchConst.CLASS_MATCH_TYPE = {
	REGION = 3,
	COUNTRY = 2,
	CLASS = 1
}
MatchConst.CLASS_MATCH_SCOPE = {
	[MatchConst.CLASS_MATCH_TYPE.CLASS] = 1,
	[MatchConst.CLASS_MATCH_TYPE.COUNTRY] = 10000,
	[MatchConst.CLASS_MATCH_TYPE.REGION] = 1000000
}
MatchConst.MATCH_SUIT_VALUE_PROJECTION = {
	[MatchConst.MATCH_FILTER_CONDITION.MATCH_FILTER_LEVEL] = "level",
	[MatchConst.MATCH_FILTER_CONDITION.MATCH_FILTER_POWER] = "playerCp",
	[MatchConst.MATCH_FILTER_CONDITION.MATCH_FILTER_ROB_EGG_RANK] = "robEggRank"
}
MatchConst.SUIT_METHOD_TYPE = {
	SUIT_METHOD_WEIGHT = 2,
	SUIT_METHOD_FIXED = 1
}
MatchConst.MATCH_UNIT_TYPE = {
	MERGE = 3,
	TEAM = 2,
	PLAYER = 1
}
MatchConst.MATCH_PLAN_TYPE = {
	CAMP_COUNT = 1,
	PLAYER_COUNT = 2
}
MatchConst.MATCH_ADD_MEM_TYPE = {
	FORCE_AUTO_ADD = 2,
	AUTO_ADD = 1,
	BAN_AUTO_ADD = 0
}
MatchConst.MATCH_PHASE_STAGE = {
	ENTER_GAME = 4,
	CONFIRMING = 3,
	MATCH_CAMP = 2,
	MERGE_TEAM = 1
}
MatchConst.MATCH_TEAM_MEMBER_TYPE = {
	MATCH_BOT_ENTER = 2,
	MATCH_MEMBER_ENTER = 1,
	DIRECTLY_ENTER = 0
}
MatchConst.TEAM_REASON_ID_TYPE = {
	DIRECTLY_ENTER = 2,
	MATCH_MEMBER_ENTER = 1
}
MatchConst.MatchWeightTile = "weightValue"
MatchConst.MatchSuitValueTile = "suitValue"
MatchConst.MatchSuitWeightTile = "suitWeight"

return MatchConst
