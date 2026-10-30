-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\AudioConst.lua

local bit = bit
local AudioConst = {
	EVENT_AMB_STEALTH_LOOP = "SFX_Stealth_Loop",
	RTPC_FOOTSTEP_QIANGDAN = "RTPC_Footsteb_QiangDan",
	EVENT_PLAYER_BOW_AIM = "Player_Bow_Aim",
	RTPC_VOLUME_EX = "RTPC_Volume_EX",
	EVENT_PLAYER_COMMON_JUMP = "Player_Common_Jump",
	RTPC_VOLUME_3P = "RTPC_Volume_1P_3P",
	EVENT_PLAYER_COMMON_SPRINTSTOP = "Player_Common_SprintStop",
	RTPC_TIME = "RTPC_Time",
	EVENT_PLAYER_COMMON_SPRINT_BS = "Player_Common_SprintBs",
	RTPC_WEATHER_TYPE = "RTPC_Weather_Type",
	AUDIO_WEAPON_TYPE_BLUNT = "blunt",
	RTPC_BOSS_SKILL = "RTPC_Boss_Skill",
	EVENT_PLAYER_COMMON_FOOT_STEP_STOP = "Player_Common_FootStepStop",
	RTPC_PAMON_MOVEMENT = "RTPC_Parmon_Movement",
	EVENT_PLAYER_COMMON_FOOT_STEP = "Player_Common_FootStep",
	SFX_UI_SHOP_BUY = "SFX_UI_Shop_Buy",
	Sound_Type_BowAim = "BowAim",
	AUDIO_SEX_SWITCH_MALE = 1,
	BNK_SFX_HIT = "SFX_Hit",
	AUDIO_FOOT_MATERAIL_SWITCH_WATER = 2,
	Sound_Type_SprintBs = "SprintBs",
	AUDIO_FOOT_MATERAIL_SWITCH_GRASS = 3,
	Sound_Type_FallToGround = "FallToGround",
	AUDIO_FOOT_MATERAIL_SWITCH_SNOW = 4,
	Sound_Type_FootStepStop = "FootStepStop",
	AUDIO_FOOT_MATERAIL_SWITCH_TILE = 5,
	Sound_Type_FootStep = "FootStep",
	AUDIO_FOOT_MATERAIL_SWITCH_WOOD = 6,
	AUDIO_FOOT_MATERAIL_SWITCH_ICE = 10,
	AUDIO_FOOT_MATERAIL_SWITCH_COIN = 9,
	AUDIO_FOOT_MATERAIL_SWITCH_ROPE = 8,
	AUDIO_FOOT_MATERAIL_SWITCH_METAL = 7,
	AUDIO_ELEMENT_SWITCH_ELETRIC = 5,
	AUDIO_ELEMENT_SWITCH_COLD = 4,
	AUDIO_ELEMENT_SWITCH_WATER = 3,
	AUDIO_ELEMENT_SWITCH_FIRE = 2,
	AUDIO_ELEMENT_SWITCH_EMPTY = 1,
	AUDIO_FOOT_MATERAIL_SWITCH_DIRT = 1,
	AUDIO_MATERIAL_TYPE_GRASS = "grass",
	ATTENUATION_STATE_ID_ATTENUATION = "attenuation",
	AUDIO_MATERIAL_TYPE_METAL = "metal",
	SFX_UI_PLAYER_LEARN_SKILL = "SFX_UI_Player_Learn_Skill",
	AUDIO_MATERIAL_TYPE_STONE = "stone",
	SFX_ROGUE_SWEEP_FINISH = "SFX_ROGUE_SWEEP_FINISH",
	AUDIO_MATERIAL_TYPE_FLESH = "flesh",
	AUDIO_HIT_TYPE_HEAVY = "h",
	BGM_ROGUE_ENTER_UI = "BGM_Rogue_EnterUI",
	BGM_ROB_EGG_LIMIT_TIME_CHALLENGE = "BGM_HitAndRun_Temple_Jizhiguai_Danger",
	EVENT_PET_STARUP_BGM = "BGM_UI_GrowthInterface",
	SFX_ROGUE_SWEEP = "SFX_ROGUE_SWEEP",
	EVENT_PET_STARUP_3 = "SFX_UI_GrowthInterface_Breakthrough",
	AUDIO_WEAPON_TYPE_SLASH = "slash",
	EVENT_PET_STARUP_2 = "SFX_UI_GrowthInterface_UpgradeStar_Full",
	EVENT_PLAYER_COMMON_FALL_TO_GROUND = "Player_Common_FallToGround",
	EVENT_PET_STARUP_1 = "SFX_UI_GrowthInterface_UpgradeStar",
	Sound_Type_Jump = "Jump",
	EVENT_ROGUE_SHOW_DUNGEON_PANEL = "SFX_UI_Rouge_LevelIntroduce",
	Sound_Type_SprintStop = "SprintStop",
	EVENT_ROGUE_GO_NEXT_DUNGEON = "SFX_UI_Rouge_Portal",
	AUDIO_HIT_TYPE_LIGHT = "s",
	EVENT_SHOW_RARE_BUFF = "SFX_UI_Rouge_RareBuffAppear",
	ATTENUATION_STATE_ID_ATTENUATION_ARK = "attenuation_ARK",
	EVENT_PET_EXCHANGE_SUCCESS = "SFX_UI_Exchangepet_effect",
	STATE_GROUP_ATTENUATION = "menu_attenuation",
	EVENT_TEAM_SPEECH_CREATE = "SFX_UI_VoiceChannel_Creat",
	ATTENUATION_STATE_ID_NORMAL = "normal",
	EVENT_CATCH_RATE_FAIL = "SFX_UI_CatchRate_Fail",
	AUDIO_SEX_SWITCH_FEMALE = 2,
	EVENT_CATCH_RATE_LOW = "SFX_UI_CatchRate_Low",
	STATE_GROUP_BGM_SCENE_MUSIC = "BGM_Scene_Music",
	EVENT_CATCH_RATE_HIGH = "SFX_UI_CatchRate_High",
	GAME_MUSIC_EVENT = "Play_Game_Music",
	EVENT_CATCH_RATE_GRANTEED = "SFX_UI_CatchRate_Granteed",
	GAME_WEATHER_EVENT = "SFX_AMB_Weather",
	EVENT_FUNC_MENU_LOCK_ICON = "SFX_UI_LockIcon",
	STATE_GROUP_GAME_MUSIC_STATE = "Game_Music_State",
	EVENT_FUNC_MENU_FUNC_UNLOCK = "SFX_UI_UnlockIcon",
	WATER_IN_OUT = "Water_In_Out",
	EVENT_TEAM_ENTER_MEMBER_CONFIRM = "SFX_UI_ImoSurvey_GetClue",
	WATER_IN_OUT_Inside = "Inside",
	EVENT_TEAM_ENTER_CANCEL = "SFX_UI_QTE_Click_03",
	WATER_IN_OUT_Outside = "Outside",
	EVENT_TEAM_ENTER_CONFIRM = "SFX_UI_QTE_Click_01",
	MAP_ClEAR_FOG = "SFX_UI_Map_ClearFog",
	EVENT_TEAM_INVITE = "SFX_UI_Invitations",
	MAP_SYSTEM_START = "SFX_UI_Personal_SystemStart",
	EVENT_UI_PET_REPORTER = "SFX_UI_Report",
	EVENT_HOME_AREA_UNLOCK = "SFX_UI_Home_Area_unlock",
	EVENT_HOME_ARCHITECTURE_PLACE = "SFX_UI_Home_Architecture_Place",
	EVENT_HOME_ARCHITECTURE_SELECT = "SFX_UI_Home_Architecture_Select",
	EVENT_HOME_ARCHITECTURE_CLICK = "SFX_UI_Home_Architecture_Click",
	EVENT_HOME_ARCHITECTURE_TAB = "SFX_UI_Home_Architecture_Tab",
	BGM_VOLUME_STATE_ID_NORMAL = "normal",
	EVENT_HOME_ARCHITECTURE_MODEL = "SFX_UI_Home_Architecture_Model",
	BGM_VOLUME_STATE_ID_ATTENUATION = "attenuation",
	EVENT_HOME_STOREHOUSE_CLOSE = "SFX_UI_Home_Storehouse_Close",
	STATE_GROUP_BGM_VOLUME = "bgm_volume",
	EVENT_HOME_STOREHOUSE_TRANSFER = "SFX_UI_Home_Storehouse_Transfer",
	SWITCH_STATE_SURFACE_MATERIAL_DEFAULT = "concret",
	EVENT_HOME_STOREHOUSE_CONFIRM = "SFX_UI_Home_Storehouse_Confirm",
	SWITCH_GROUP_SURFACE_MATERIAL = "surface_material",
	EVENT_HOME_STOREHOUSE_CLICK = "SFX_UI_Home_Storehouse_Click",
	SWITCH_STATE_ID_BOY = "Boy",
	EVENT_HOME_STOREHOUSE_OPEN = "SFX_UI_Home_Storehouse_Open",
	SWITCH_STATE_ID_GIRL = "Girl",
	EVENT_DAILY_ACTIVE_CLAIM_REWARD = "SFX_UI_DailyActive_ClaimReward",
	SWITCH_GROUP_SEX = "VOX_Emotion_Sex",
	EVENT_CHARACTER_DEBUT = "SFX_UI_CharacterDebut",
	STEALTH_STATE_ID_STEALTH = "stealth",
	EVENT_GAMEPAD_MENU_OPEN = "SFX_UI_HUD_OptionMenu_Open",
	STEALTH_STATE_ID_NORMAL = "normal",
	EVENT_GAMEPAD_MENU_SELECTED_CHANGED = "SFX_UI_HUD_OptionMenu_Hover",
	STATE_GROUP_STEALTH = "Stealth_state",
	EVENT_AVATAR_MERGE_APPEAR = "Avartar_Merge_Appear",
	EVENT_AVATAR_MERGE_RECIEVE = "Avartar_Merge_Recive",
	EVENT_STOP_AMB_STEALTH_LOOP = "stop_SFX_Stealth_Loop",
	INIT_LOADED_BANKS = {
		"SFX_Hit",
		"Player_Action",
		"Player_Skill",
		"FantasyBeast_Skill",
		"Monster_Boss",
		"UI_Common",
		"UI_FantasyBeast",
		"MUS_LingShou_TEST"
	},
	AUDIO_ELEMENT_SWITCH_MAP = {
		"Empty",
		"Fire",
		"Water",
		"Cold",
		"Electric",
		name = "Element"
	},
	AUDIO_FOOT_MATERAIL_SWITCH_MAP = {
		"Dirt",
		"Water",
		"Grass",
		"Snow",
		"Tile",
		"Wood",
		"Metal",
		"Rope",
		"Coin",
		"Ice",
		name = "Foot_Material"
	},
	AUDIO_SEX_SWICH_MAP = {
		"Male",
		"Female",
		name = "Sex"
	},
	COMBAT_RTPC_TYPE = {
		VOLUME_HIT_1P_3P_LEVEL_2 = 8,
		VOLUME_HIT_1P_3P_LEVEL_1 = 4,
		VOLUME_EX = 2,
		VOLUME_3P = 1,
		NONE = 0
	}
}

AudioConst.StateIdPriority = {
	[AudioConst.STATE_GROUP_BGM_VOLUME] = {
		[AudioConst.ATTENUATION_STATE_ID_ATTENUATION_ARK] = 2,
		[AudioConst.BGM_VOLUME_STATE_ID_ATTENUATION] = 1,
		[AudioConst.BGM_VOLUME_STATE_ID_NORMAL] = 0
	},
	[AudioConst.STATE_GROUP_ATTENUATION] = {
		[AudioConst.ATTENUATION_STATE_ID_ATTENUATION] = 1,
		[AudioConst.ATTENUATION_STATE_ID_NORMAL] = 0
	}
}
AudioConst.DEFAULT_SOUND_DATA = {
	[AudioConst.Sound_Type_FootStep] = AudioConst.EVENT_PLAYER_COMMON_FOOT_STEP,
	[AudioConst.Sound_Type_FootStepStop] = AudioConst.EVENT_PLAYER_COMMON_FOOT_STEP_STOP,
	[AudioConst.Sound_Type_FallToGround] = AudioConst.EVENT_PLAYER_COMMON_FALL_TO_GROUND,
	[AudioConst.Sound_Type_SprintBs] = AudioConst.EVENT_PLAYER_COMMON_SPRINT_BS,
	[AudioConst.Sound_Type_SprintStop] = AudioConst.EVENT_PLAYER_COMMON_SPRINTSTOP,
	[AudioConst.Sound_Type_Jump] = AudioConst.EVENT_PLAYER_COMMON_JUMP,
	[AudioConst.Sound_Type_BowAim] = AudioConst.EVENT_PLAYER_BOW_AIM
}
AudioConst.VolumeType = {
	Sfx = "sfx_bus_volume",
	All = "master_audio_bus_volume",
	Vox = "vox_bus_volume",
	BGM = "bgm_bus_volume"
}
AudioConst.SetVolumeReason = {
	Default = 1,
	MAX = 3,
	Focus = 3,
	Loading = 2
}
AudioConst.VolumeType2SetFunc = {
	master_audio_bus_volume = "mainVol",
	sfx_bus_volume = "soundVol",
	bgm_bus_volume = "musicVol",
	vox_bus_volume = "voiceVol"
}
AudioConst.AkCallbackType = {
	AK_Marker = 4,
	AK_EndOfDynamicSequenceItem = 2,
	AK_EndOfEvent = 1,
	AK_MIDIEvent = 65536,
	AK_MusicSyncAll = 32512,
	AK_MusicSyncPoint = 16384,
	AK_MusicSyncUserCue = 8192,
	AK_MusicSyncGrid = 4096,
	AK_MusicSyncExit = 2048,
	AK_MusicSyncEntry = 1024,
	AK_MusicSyncBar = 512,
	AK_MusicSyncBeat = 256,
	AK_MusicPlayStarted = 128,
	AK_MusicPlaylistSelect = 64,
	AK_Starvation = 32,
	AK_SpeakerVolumeMatrix = 16,
	AK_Duration = 8
}

function AudioConst.checkCallbackType(eventType, callbackType)
	return bit.band(eventType, callbackType) ~= 0
end

AudioConst.BgmPriority = {
	MAX = 41,
	Loading = 40,
	Vitality_UI = 41,
	Cutscene = 39,
	DeadPanel = 38,
	TimelineClip = 37,
	FishingCaptureCubeUI = 36,
	RogueUI = 35,
	PET_BALL_UI = 34,
	PetDetailScene = 33,
	PetResearchDetail = 32,
	PetResearch = 31,
	UI = 30,
	DialogueGraph = 24,
	PuzzleGame = 23,
	Level = 22,
	ExtraTempPet = 21,
	Avatar = 20,
	BossDeath = 19,
	Boss = 18,
	Elite = 17,
	Combat = 16,
	GrabEggDanger = 15,
	Login = 14,
	ClientEvent = 13,
	DefaultUI = 10,
	HomelandCelebration = 8,
	HomelandMusicPlayer = 7,
	SceneEmitter = 6,
	Room = 5,
	SeamlessScene = 4,
	SoundArea = 3,
	BgmArea = 2,
	Scene = 1
}
AudioConst.BGMCombatState = {
	Playing = 1,
	Stop = 3,
	Fading = 2
}
AudioConst.DisableAuxEnvReason = {
	Default = 1,
	Cutscene = 2
}
AudioConst.AttenGroupStateReason = {
	Default = "Default",
	UI = "UI",
	PVP = "PVP",
	Cutscene = "Cutscene"
}

return AudioConst
