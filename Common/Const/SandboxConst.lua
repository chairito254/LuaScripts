-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\SandboxConst.lua

local SandboxConst = {}

SandboxConst.PUPPET_SPECIAL_LOOP_EXITED = "PUPPET_SPECIAL_LOOP_EXITED"
SandboxConst.SANDBOX_TYPE = {
	SIMPLE = 1,
	NORMAL = 0,
	ARK = 3,
	DUNGEON = 2
}
SandboxConst.AUTO_LOAD = {
	[SandboxConst.SANDBOX_TYPE.NORMAL] = true,
	[SandboxConst.SANDBOX_TYPE.DUNGEON] = true
}
SandboxConst.STREAM_LOAD_BUDGET_US = 5000
SandboxConst.STREAM_LOAD_MIN_ITEMS_PER_FRAME = 1
SandboxConst.STATE = {
	HANGING = 1,
	LOADING = 0,
	FINISHED = 3,
	RUNNING = 2
}
SandboxConst.PROCESS = {
	CREATE = 0,
	PHASE = 4,
	RESET = 3,
	COMPLETE = 2,
	DESTROY = 1
}
SandboxConst.CLOSE_LOG_MIN_DURATION_SECONDS = 30
SandboxConst.PHASE_CHANGE_REASON = {
	EXTERNAL = 2,
	INTERNAL = 1
}
SandboxConst.DESTROY_REASON = {
	TIME_ACTIVE = 10,
	RELOAD = 11,
	COMPLETE = 4,
	METEOROLOGY = 9,
	BLOCK = 8,
	METEOR_OVER = 7,
	PLAYER_NOT_EXIST = 6,
	PLAYER_LEAVE = 5,
	LOAD = 3,
	MANUAL = 2,
	CHUNK = 1
}
SandboxConst.ACTIVATION_BLOCK_REASON = {
	BANNED = 4,
	OWNER_NOT_EXIST = 3,
	OWNER_NOT_IN_RANGE = 2,
	CONFIG_MISSING = 1,
	FINISHED = 5,
	EXTRA_CONDITION_MISMATCH = 9,
	ACTIVE_CONDITION_MISMATCH = 8,
	HARD_LEVEL_MISMATCH = 7,
	COOLDOWN = 6
}
SandboxConst.RESET_TYPE = {
	OTHER = 3,
	WEEK = 2,
	DAY = 1,
	NEW_WEEK = 6,
	NEW_DAY = 5,
	SECOND = 4
}
SandboxConst.SIGHT_LEVEL = {
	FARAWAY = 512,
	FAR = 256,
	NEAR = 64,
	GLOBAL = -1,
	NORMAL = 128,
	FARFARAWAY = 1024
}
SandboxConst.ACTIVE_TYPE = {
	MANUAL = 4,
	BLOCK = 10,
	METEOROLOGY = 11,
	TIME_ACTIVE = 12,
	CONDITIONID = 13,
	WEATHER = 9,
	METEOR = 8,
	SANDBOX_DESTROY = 7,
	SANDBOX_FINISHED = 6,
	DUNGEON_FINISHED = 5,
	ACTIVITY = 3,
	QUEST = 2,
	INIT = 1
}
SandboxConst.ACTIVE_QUEST_TYPE = {
	QUEST_IN_COMPLETE = 3,
	QUEST_IN_ACCEPT = 2,
	QUEST_COMPLETED = 1,
	QUEST_ACCEPTED = 0,
	QUEST_IN_SUBMIT = 4
}
SandboxConst.ON_FINISH = {
	REPLAYABLE = 5,
	RETAIN_ONCE = 4,
	RETRAIN = 3,
	CLEAR = 2,
	FADE_OUT = 1
}
SandboxConst.LEVEL_ITEM_TYPE = {
	QUICK_CONTROL = "QuickControl",
	OILFIELD = "OilField",
	RACING_DUNGEON_THUNDER_CLOUD = "RacingDungeonThunderCloud",
	STATE_INTERACTOR = "StateInteractor",
	RACING_DUNGEON_FINISH_LINE = "RacingDungeonFinishLine",
	RACING_DUNGEON_GOLD_COIN = "RacingDungeonGoldCoin",
	RACING_DUNGEON_ITEM_BOX = "RacingDungeonItemBox",
	PAINT_FRUIT_FIELD_COUNTER = "PaintFruitFieldCounter",
	HONEYBREW_POOL = "HoneybrewPool",
	BEE_FLOWER = "BeeFlower",
	RETROSPECT_CHEST = "RetrospectChest",
	FOSSIL_BABY = "FossilBaby",
	CONDENSE_WATER_BOUND_ITEM = "CondenseWaterBoundItem",
	CONDENSE_WATER_STONE = "CondenseWaterStone",
	SLUDGE_PILE = "SludgePile",
	TimelineExchange = "TimelineExchange",
	SLUDGE_FIELD = "SludgeField",
	ROTATING_PLATFORM = "RotatingPlatform",
	SLUDGE = "Sludge",
	GRID_GAME = "GridGame",
	GRID_CELL = "GridCell",
	HitCounter = "HitCounter",
	ChallengeDoor = "ChallengeDoor",
	GRAB_EGG_DOOR = "GrabEggDoor",
	ADD_INTERACT = "AddInteract",
	DITTO_ENTRY = "DittoEntry",
	DialoguePlayer = "DialoguePlayer",
	MeetingPlace = "MeetingPlace",
	Rope = "Rope",
	PAINT_AREA = "PaintArea",
	DUNGEON_SAVE_POINT = "DungeonSavePoint",
	TWINKLE_PLATFORM_CONTROLLER = "TwinklePlatformController",
	BILATERATOTEM = "BilateralTotem",
	AUDIO_TRIGGER = "AudioTrigger",
	PIANO = "Piano",
	POSITION_BLENDER = "PositionBlender",
	MICROPHONE = "Microphone",
	MECHANISM_BALL_HOLE = "MechanismBallHole",
	ECHO_STONE = "EchoStone",
	PUPPET_SPECIAL_PAIR = "PuppetSpecialPair",
	ECHO_LINK = "EchoLink",
	LEVEL_MULTI_INTERACT = "LevelItemMultiInteractor",
	COLLECT_ITEM_PUZZLE = "CollectItemPuzzle",
	RACE_PUZZLE = "RacePuzzle",
	TRAMPOLINE = "Trampoline",
	GROUP_SING_PUZZLE = "GroupSingPuzzle",
	LEVEL_BUTTON = "LevelButton",
	CHEST_SHIELD = "ChestShield",
	PRESS_PLATFORM = "PressPlatform",
	BUFF_TRIGGER = "BuffTrigger",
	TRICK_TRIGGER = "TrickTrigger",
	EVENT_TRIGGER = "EventTrigger",
	LEVEL_ITEM_MULTI = "LevelItemMulti",
	SPURT_ITEM = "SpurtItem",
	TOTEM_PUZZLE = "TotemPuzzle",
	STUN_MUSHROOM = "StunMushroom",
	PET_EXCHANGE = "PetExchangeItem",
	PLANT_NURSERY = "PlantNursery",
	PLANT_TREE = "PlantTree",
	TimelineContainer = "TimelineContainer",
	CHEST_CONTAINER = "ChestContainer",
	TRIGGER = "Trigger",
	PLATFORM_PRO = "PlatformPro",
	MOVING_PLATFORM = "MovingPlatform",
	SWITCH = "Switch",
	LEVEL_ITEM = "LevelItem"
}
SandboxConst.SUB_COMPONENT_TYPE = {
	BuffTriggerSubComp = "BuffTriggerSubComp",
	Retrospectable = "Retrospectable",
	DynamicVoxelSB = "DynamicVoxelSB",
	SpawnerControl = "SpawnerControl",
	FollowState = "FollowState",
	Interactable = "Interactable",
	EcsPartSB = "EcsPartSB"
}
SandboxConst.LEVEL_ITEM_STATE = {
	ACTIVE = 1,
	INIT = 0
}
SandboxConst.LEVEL_ITEM_MILTI_STATE = {
	WAIT = 1,
	INIT = 0,
	TRIGGER = 2
}
SandboxConst.LEVEL_MULTI_INTERACT_STATE = {
	WAIT = 1,
	INIT = 0,
	FINISH = 3,
	TRIGGER = 2
}
SandboxConst.LEVEL_DITTO_ENTRY_STATE = {
	FINISH = 1,
	CD = 2,
	ACTIVE = 0
}
SandboxConst.NPC_SP_STATE_2_DITTO_STATE = {
	[1000] = SandboxConst.LEVEL_DITTO_ENTRY_STATE.ACTIVE,
	[1001] = SandboxConst.LEVEL_DITTO_ENTRY_STATE.FINISH
}
SandboxConst.MECHANISM_BALL_HOLE_STATE = {
	TRIGGER = 1,
	INIT = 0
}
SandboxConst.OPERATORS = {
	floor = 6,
	["-"] = 2,
	["<="] = 12,
	["<"] = 11,
	["=="] = 10,
	[">="] = 9,
	[">"] = 8,
	["%"] = 5,
	["/"] = 4,
	["*"] = 3,
	["+"] = 1,
	ceil = 7
}
SandboxConst.LOGICAL = {
	NOT = 3,
	OR = 2,
	AND = 1
}
SandboxConst.FIELDS_HANDLER = {
	state = "onStateChange"
}
SandboxConst.EVENT_TYPE = {
	BUBBLE_BARRIER_LEAVE = 14,
	BUBBLE_BARRIER_ENTER = 13,
	SLUDGE_CELL_REFRESHED = 12,
	SLUDGE_CELL_CLEARED = 11,
	SLUDGE_RESET = 10,
	SLUDGE_PROGRESS_CHANGED = 9,
	BUBBLE_BARRIER_HIT = 5,
	OVERLAP_COUNTER_FREE = 4,
	OVERLAP_COUNTER_BUSY = 3,
	TRIGGER_LEAVE = 2,
	TRIGGER_ENTER = 1
}
SandboxConst.EVENT_TYPE_TRIGGER = {
	TRIGGER_ENTER = 1,
	TRIGGER_LEAVE = 2
}
SandboxConst.EVENT_TYPE_OVERLAP = {
	OVERLAP_COUNTER_BUSY = 3,
	OVERLAP_COUNTER_FREE = 4
}
SandboxConst.EVENT_TYPE_BUBBLE_BARRIER = {
	BUBBLE_BARRIER_HIT = 5,
	BUBBLE_BARRIER_LEAVE = 14,
	BUBBLE_BARRIER_ENTER = 13
}
SandboxConst.COMMON_EVENT = {
	TIME_PUZZLE_RESET = "OnTimePuzzleReset",
	TIME_PUZZLE_SUCC = "OnTimePuzzleSuccess",
	TIME_PUZZLE_FAIL = "OnTimePuzzleFail",
	TIME_PUZZLE_WARN = "OnTimePuzzleWarning",
	TIME_PUZZLE_START = "OnTimePuzzleStart",
	PLAYER_TOGGLE_PET = "PLAYER_TOGGLE_PET",
	TIME_TRAVEL_TO_NOW = "TIME_TRAVEL_TO_NOW",
	TIME_TRAVEL_TO_LAST = "TIME_TRAVEL_TO_LAST",
	PET_EVOLUTION_COMPLETED = "PET_EVOLUTION_COMPLETED",
	TEAMATE_VIEW_CHANGE = "TeammateViewChange",
	BEE_FLOWER_HARVESTED = "BeeFlowerHarvested",
	PLAYER_HURT = "OnPlayerHurt",
	ARK_VIDEO_REFRESH = "OnArkVideoRefresh",
	ITEM_INTERACT_TRIGGER = "ITEM_INTERACT_TRIGGER",
	DEAD = "OnDead",
	CURRENT_AREA_WEATHER_REFRESH = "OnCurrentAreaWeatherRefresh",
	LEVELITEM_ENTER_MAGNESIS = "OnEnterMagnesis",
	PET_GHOST_EYE_STATE_CHANGED = "OnPetGhostEyeStateChanged"
}
SandboxConst.DITTO_STATE = {
	OUT_OF_RANGE = 5,
	REPEAT_ACTIVE = 4,
	FAIL = 3,
	SUCCESS = 2,
	FIRST_ACTIVE = 1,
	INACTIVE = 0
}
SandboxConst.DITTO_STATE_HANDLER = {
	[SandboxConst.DITTO_STATE.INACTIVE] = "onStatusInactive",
	[SandboxConst.DITTO_STATE.FIRST_ACTIVE] = "onStatusFirstActive",
	[SandboxConst.DITTO_STATE.SUCCESS] = "onStatusSuccess",
	[SandboxConst.DITTO_STATE.FAIL] = "onStatusFail",
	[SandboxConst.DITTO_STATE.REPEAT_ACTIVE] = "onStatusRepeatActive",
	[SandboxConst.DITTO_STATE.OUT_OF_RANGE] = "onOutOfRange"
}
SandboxConst.DITTO_DUNGEON_STATE = {
	SUCCESS = 2,
	FAIL = 1,
	START = 0
}
SandboxConst.DITTO_DUNGEON_RESULT = {
	DEAD = 5,
	FAIL = 3,
	SUCCESS = 2,
	EXIT = 4,
	DEFAULT = 0,
	ACTIVE = 1
}
SandboxConst.PET_CHALLENGE_RESULT = {
	OUT_OF_RANGE = 2,
	MANUALFAIL = 8,
	TIMEOUT = 6,
	CATCH_SHEEP = 5,
	DAMAGE_SHEEP = 4,
	CANCEL_CONTROL = 3,
	PLAYER_DEAD = 1,
	SUCCESS = 7,
	INIT = 0
}
SandboxConst.MONITOR_ATTRIBUTE = {
	SP = "getSpPercent",
	EP = "getEpPercent",
	BREAK = "getBreakPercent",
	HP = "getHpPercent"
}
SandboxConst.COMPARE_OP = {
	[">="] = 2,
	[">"] = 1,
	["!="] = 6,
	["<="] = 5,
	["<"] = 4,
	["=="] = 3
}
SandboxConst.GroupPuzzleState = {
	PlayingCutscene = 4,
	Failed = 3,
	Success = 2,
	Playing = 1,
	Disable = 0,
	Finish = 5
}
SandboxConst.RacingDungeonState = {
	COUNT_DONW = 1,
	NONE = 0,
	END = 3,
	RACING = 2
}
SandboxConst.RacePuzzleState = {
	Default = 0,
	Playing = 2,
	CountDown = 1
}
SandboxConst.RacePuzzleResultState = {
	Success = 1,
	Fail = 2
}
SandboxConst.ResetPuzzleReason = {
	Break = 2,
	Fail = 1,
	None = 0
}
SandboxConst.RaceScore = {
	B = 2,
	A = 1,
	S = 0
}
SandboxConst.CollectPuzzleState = {
	Default = 0,
	Playing = 2,
	CountDown = 1
}
SandboxConst.CollectPuzzleResultState = {
	Success = 1,
	Fail = 2
}
SandboxConst.PaintAreaState = {
	Ready = 0,
	Finish = 2,
	WaitOpenChest = 1
}
SandboxConst.GridCellState = {
	GRASS = 1,
	EMPTY = 0,
	FAIL = 3,
	FLOWER = 2
}
SandboxConst.GridGameState = {
	PLAYING = 1,
	WAITING = 0,
	SUCCESS = 3,
	FAILED = 2
}
SandboxConst.BEE_FLOWER_STATE = {
	OPEN = 1,
	CLOSED = 0,
	COOLDOWN = 2
}
SandboxConst.FOSSIL_BABY_STATE = {
	CLEARED = 2,
	HATCHED = 1,
	FOSSIL = 0
}
SandboxConst.RETROSPECT_CHEST_STATE = {
	OPENED = 2,
	CREATED = 1,
	HIDDEN = 0
}
SandboxConst.HONEYBREW_POOL_STATE = {
	FULL = 1,
	EMPTY = 0
}
SandboxConst.OILFIELD_STATE = {
	DESTROYED = 0,
	EXPLOSION = 2,
	EXIST = 1
}
SandboxConst.Permission = {
	OnlyOwner = 0,
	OwnerInScene = 1
}
SandboxConst.FINISH_TYPE = {
	Chest = 1,
	Graph = 0
}
SandboxConst.NODE_TARGET_TYPE = {
	SpecifiedPlayer = 2,
	SpaceOwner = 1,
	AllPlayersInSandbox = 0
}
SandboxConst.Role = {
	All = 0,
	Owner = 1
}
SandboxConst.SYNC_MODE = {
	OWNER_FULL = 3,
	OWNER_SAVE_ONLY = 2,
	OWNER_SAVE_ITEM = 1,
	ALL_SYNC = 0
}
SandboxConst.DEBUG_LOAD_RANGE = {
	ALL = -114514
}
SandboxConst.COMMON_RESULT = {
	FAILED = 2,
	DEFAULT = 0,
	SUCCESS = 1
}

return SandboxConst
