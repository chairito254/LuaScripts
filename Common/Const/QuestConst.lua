-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\QuestConst.lua

local TriggerConst = require("Common.Const.TriggerConst")
local QuestConst = {
	QUEST_TEMP_TRACE = 3,
	QUEST_SECOND_TRACE = 2,
	QUEST_MAIN_TRACE = 1,
	QUEST_ACTION_REPEAT = 3,
	QUEST_ACTION_DELAY_POS = 2,
	QUEST_ACTION_ID_POS = 1,
	QUEST_DELETE_USELESS_BATCH_SIZE = 100,
	QUEST_COMPLETE_EVENT_TIME_INTERVAL = 5,
	QUEST_TRIGGER_RE_CHECK_BATCH_SIZE = 50,
	QUEST_INIT_BATCH_SIZE = 20,
	QUEST_LIST_BATCH_SIZE = 50,
	QUEST_MAP_MAKR_INDEX = 107,
	QUEST_STORY_TRACE = 4
}

QuestConst.QUEST_TYPE = {
	MAX = 10,
	CLUE = 7,
	HOMELAND = 6,
	SIDE = 5,
	COURSE = 4,
	SPECIAL_TRAIN = 3,
	DELEGATION = 2,
	MAIN = 1,
	NULL = 0
}
QuestConst.QUEST_CATEGORY = {
	MULTI = 3,
	SYSTEM = 2,
	SINGLE = 1,
	TEAM = 4
}
QuestConst.QUEST_TYPE_DICT = {
	[0] = "NULL",
	"MAIN",
	"DELEGATION",
	"SPECIAL_TRAIN",
	"COURSE",
	"SIDE"
}
QuestConst.QUEST_CONDTYPE = {
	CLOSECOND = 5,
	COM_ACTION_OBJECTIVE = 4,
	RUNCOND = 3,
	CLAIMCOND = 2,
	OBJECTIVE = 1
}
QuestConst.QUEST_STATE = {
	CLOSE = 5,
	SUBMITED = 4,
	COMPLETED = 3,
	RECEIVED = 2,
	UNRECEIVE = 1,
	INIT = 0,
	INVALID = -1,
	FAILED = 6
}
QuestConst.QUEST_RESET_TYPE = {
	DAILY = 1,
	NO = 0,
	MONTHLY = 3,
	WEEKLY = 2
}
QuestConst.SPECIAL_OPERATE = {
	CLOSE_QUEST = 1,
	RESET_QUEST = 2
}
QuestConst.QUEST_CLOSE_MODE = {
	INCLUDE_UNINITED = 2,
	ACTIVE_ONLY = 1
}
QuestConst.QUEST_PROGRESS = {
	COMPLETED = 4,
	SUBMITED = 2,
	ACCEPTED = 1,
	MODIFIED = 5,
	FAILED = 3
}
QuestConst.QUEST_CLAIM_TYPE = {
	NULL = 0,
	OTHER = 3,
	NPC = 2,
	AUTO = 1
}
QuestConst.QUEST_DELIVER_TYPE = {
	NULL = 0,
	OTHER = 3,
	NPC = 2,
	AUTO = 1
}
QuestConst.QUEST_SUB_CLAIM_TYPE = {
	NULL = 0,
	RANDOM = 2,
	ALL = 1
}
QuestConst.QUEST_SUBMIT_TYPE = {
	NULL = 0,
	OTHER = 3,
	NPC = 2,
	AUTO = 1
}
QuestConst.QUEST_GUIDE_FLAG = {
	NULL = 0,
	CHAT = 3,
	QUESTION = 3,
	EXCLAMATION = 2,
	DEFAULT = 1
}
QuestConst.QUESTLIST_TYPE = {
	POST_QUESTS = 2,
	SUB_QUESTS = 1
}
QuestConst.TRAIN_TYPE_STATE = {
	PLAYERED_VX = 2,
	UNLOCKED = 1,
	LOCK = 0
}
QuestConst.TRAIN_QUEST_TEMPLATE_TYPE = {
	MORE = 2,
	TITLE = 1,
	QUEST = 0,
	CHAPTER = 3
}
QuestConst.NUMBER_COLOR = {
	YELLOW = 2,
	BLUE = 1,
	GREEN = 3
}
QuestConst.SPECIAL_TRAIN_BLOCK_ID = {
	WATER = 201,
	GRASS = 101
}
QuestConst.TRAIN_PHASE = {
	NEWBIE = 1,
	CHAPTER = 1
}
QuestConst.TRAIN_CHAPTER_COURSE_TYPE = {
	COMPULSORY = 1,
	COMPULSORY_MUST = 3,
	ELECTIVE = 2
}
QuestConst.QUEST_TRAIN_SUB_TYPE = {
	CATCH = 3,
	COURSE = 2,
	COMPULSORY = 1,
	FIGHT = 5,
	EXPLORE = 4
}
QuestConst.TRAIN_DETAIL_INFO_TYPE = {
	FINAL_REWARD = 0,
	CHAPTER_INFO = 1,
	QUEST_INFO = 2
}
QuestConst.TRAIN_DETAIL_INFO_COMPULSORY_TYPE = {
	GOTO_TITLE = 0,
	FINAL_ASSESSMENT = 4,
	VERSION_CAPPED = 3,
	FINISH = 2,
	UP_TITLE = 1
}
QuestConst.TRAIN_CHAPTER_CAPPED_TYPE = {
	BLOCK_VERSION_DONE = 2,
	BLOCK_ALL_DONE = 1,
	NONE = 0
}
QuestConst.TRAIN_DETAIL_INFO_ELECTIVE_TYPE = {
	NO_FINISH = 0,
	FINISH = 1
}
QuestConst.TRAIN_COMPULSORY_SUB_TYPE = {
	COMPULSORY = 1,
	OTHER = 0,
	CHALLENGE = 2
}
QuestConst.SPECIAL_QUEST_HUD_STATE = {
	CHAPTER_MAIN_FINISH = 10,
	CHAPTER_ASSESSMENT = 9,
	CHAPTER_WAIT = 8,
	CHAPTER_ADVANCE = 7,
	QUEST_TRACE = 6,
	ALL_FINISH = 5,
	CHAPTER_LOCKED = 4,
	CHAPTER_INTERRUPT = 3,
	CHAPTER_UNLOCK = 2,
	CHAPTER_REWARD = 1
}
QuestConst.QUEST_TRACE_TYPE = {
	SEC = 3,
	STORY = 4,
	QUEST = 1,
	TEMP = 2
}
QuestConst.QUEST_OBJCV_DISPLAY_TYPE = {
	SHOW_PROGRESS = 3,
	SHOW_COUNTING = 2,
	NORMAL = 1
}
QuestConst.QUEST_OBJCV_STATE = {
	FINISHED = 2,
	TEMP_FINISHED = 1,
	UNFINISHED = 0
}
QuestConst.GM_SKIP_EVENT_TYPE = {
	"setCurPetVisible",
	"forceTmpPetTeam",
	"resetTmpPetTeam",
	"forceChangeCombatPet ",
	"autoEquipExplorerPet ",
	"forceControlMode ",
	"releaseControlMode ",
	"forceEvolveTeamPet ",
	"startCourse",
	"dialogueGraphTeleportRepeat",
	"playDialogueGraphRepeat"
}
QuestConst.GM_TELEPORT_EVENT_TYPE = {
	"teleportScene",
	"teleportScenePosition",
	"dialogueGraphTeleportRepeat",
	"teleportScenePositionRepeat"
}
QuestConst.LEVEL = {
	MID = 2,
	ROOT = 1
}
QuestConst.QUEST_HUD_PAGE_TYPE = {
	EMPTY = 0,
	STORY = 1,
	QUEST = 3,
	GROW = 2
}
QuestConst.QUEST_PAGE_STYLE = {
	YELLOW = 0,
	WHITE = 2,
	PURPLE = 2,
	BLUE = 4
}
QuestConst.QUEST_CALL_TYPE = {
	NULL = 0,
	CALL_BACK = 3,
	CALL = 1
}
QuestConst.SPECIAL_TRAIN_REWARD_SRC_TYPE = {
	HANDBOOK = 2,
	HUD = 1
}
QuestConst.DELETE_USELESS_QUEST_SRC = {
	COMPLETE_ACTIONS = "questCompleteActions",
	ACCEPTED = "acceptedQuestMap",
	CALL_IDS = "questCallIds",
	INIT = "initialQuestMap",
	PENDING = "pendingQuestMap"
}
QuestConst.MainType = {
	Clue = 4,
	Adventure = 3,
	Quest = 2,
	Story = 1
}
QuestConst.QUEST_SHOW_TYPE = {
	MANUAL_STYLE = 1,
	OTHER_STYLE = 2
}
QuestConst.HOTFIX_FORBIDDEN_ACCEPT_QUEST = {}
QuestConst.HOTFIX_FORCE_COMPLETE_QUEST = {}
QuestConst.QUEST_MANUAL_JUMP_TYPE = {
	QUEST = 1,
	CLUE = 2
}
QuestConst.QUEST_TRACK_POS_STATE = {
	NO_CAN = 1,
	NULL = 0,
	CAN = 2
}
QuestConst.QUEST_DEFAULT_OBJ_ID = 101
QuestConst.SWITCH_DAY_NIGHT_SOURCE_ID = {
	DAY = 844,
	ARK = 846,
	NIGHT = 845
}
QuestConst.RUNCOND_SERVER_TIME_TRIGGERS = {
	[TriggerConst.TRIGGER_TARGET_TIME_TOKEN] = true,
	[TriggerConst.TRIGGER_QUEST_ACCEPTED_DAY] = true
}

return QuestConst
