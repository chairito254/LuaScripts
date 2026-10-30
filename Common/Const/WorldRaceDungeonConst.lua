-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\WorldRaceDungeonConst.lua

local WorldRaceDungeonConst = {
	BGM_REASON_KEY = "WorldRaceBGM",
	ITEM_BOX_PICKUP_DISTANCE = 3,
	GOLD_COIN_PICKUP_DISTANCE = 3,
	EMPTY_ITEM_ID = 0,
	MODE = {
		UNKNOWN = 0,
		MULTI = 2,
		SINGLE = 1
	},
	BATTLE_TIP_TYPE = {
		ATTACK_SUCCESS = 1,
		THUNDER_HIT = 4,
		ATTACK_ALL = 3,
		ATTACK_DEFENDED = 2
	},
	SINGLE_RATING = {
		B = 3,
		A = 2,
		S = 1
	},
	READY_FLAG = {
		COLLISION = 8,
		START_SANDBOX = 4,
		PAWN = 2,
		SCENE = 1
	},
	ROUTE_POINT_ROLE = {
		CHECKPOINT = 2,
		START = 1,
		CONTROL = 0,
		FINISH = 3
	},
	BOX_STATE = {
		CONSUMED = 1,
		READY = 0
	},
	GOLD_COIN_STATE = {
		CONSUMED = 1,
		READY = 0
	},
	RESULT = {
		GOLD_COIN_CONFIG_INVALID = 11,
		GOLD_COIN_NOT_READY = 10,
		FINISH_INVALID = 9,
		ALREADY_FINISHED = 8,
		DUPLICATE_REQUEST = 7,
		ITEM_SLOT_MISMATCH = 6,
		DISTANCE_INVALID = 5,
		PLAYER_SLOT_OCCUPIED = 4,
		BOX_NOT_READY = 3,
		PLAYER_NOT_PARTICIPANT = 2,
		RACE_NOT_PLAYING = 1,
		SUCCESS = 0,
		PROP_NOT_AVAILABLE = 12
	},
	SingleRating = {
		B = 3,
		A = 2,
		S = 1
	},
	Rank = {
		rankId = 20001
	},
	THUNDER_CLOUD_GROUP_STATE = {
		COOLDOWN = 2,
		READY = 0,
		OCCUPIED = 1
	},
	THUNDER_CLOUD_END_REASON = {
		ACTIVE_EXIT = 1
	},
	PLAYER_EFFECT_KEY = {
		CROWN = "Eff_Env_Level_IOT_SpeedRacing_RacingCrown_01",
		SPOTLIGHT = "Eff_Env_Level_IOT_SpeedRacing_RacingSpotLight"
	},
	SETTLEMENT_CAMERA = {
		GLOBAL_CONFIG_KEY = "WORLD_RACE_SETTLEMENT_CAMERA_PARAM",
		DEFAULT_PARAM = {
			0.5,
			0.25,
			20,
			3.2,
			0,
			15
		}
	}
}

return WorldRaceDungeonConst
