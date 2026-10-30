-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\ClientConst.lua

local AddressDataConst = require("Const.AddressDataConst")
local TagMask = CS.FunPlus.WorldX.Animations.TagMask
local ClientConst = {}

ClientConst.ENABLE_BILLBOARD_ENTITY = IS_MOBILE or UNITY_EDITOR
ClientConst.SERVER_LIST = {
	URL_TEST = "/server_list/server_list_test.json",
	GLOBAL_HOST = "worldx-global-cdn.kingsgroupgames.com",
	URL_PUBLISH = "/server_list/server_list_publish.json",
	CN_HOST_BACKUP = "worldx-cn-cdn-backup.kingsgroup.cn",
	CN_HOST = "worldx-cn-cdn.kingsgroup.cn",
	GLOBAL_HOST_BACKUP = "worldx-global-cdn-backup.kingsgroupgames.com"
}
ClientConst.ENTITY_CONFIG = {
	PLAYER = "Player",
	MOUNT = "Mount",
	SPRITE = "Sprite",
	PUPPET = "Puppet",
	ENTITY = "Entity",
	MAIN_PLAYER = "MainPlayer"
}
ClientConst.ENTITY_CS_TYPE = {
	PLAYER = 8,
	PET = 9,
	ENTITY = 0,
	HOME = 10,
	MAIN_PLAYER = 1,
	MAIN_PET = 6,
	MAIN_CATCH_BALL = 5,
	CATCH_BALL = 4,
	ENV_OBJ = 3,
	VIRTUAL = 2,
	PUPPET = 7
}
ClientConst.LUA_FUNCTION_CACHE_CLASS_TYPE = {
	ClientMmoItem = 20,
	ClientLeylineTree = 19,
	ClientLeylineFlower = 18,
	ClientChest = 17,
	ClientCollectItem = 16,
	ClientDandelion = 15,
	ClientVirtualPuppet = 14,
	ClientEnvObject = 13,
	ClientCarryPet = 12,
	ClientHomePet = 11,
	ClientDungeonBotPlayer = 10,
	ClientPvpBotPlayer = 9,
	ClientTempPlayer = 8,
	ClientMainPlayer = 7,
	ClientTempVirtualNpc = 6,
	ClientStaticNpc = 5,
	ClientSimpleMoveNpc = 4,
	ClientPet = 3,
	ClientPlayer = 2,
	ClientPuppet = 1,
	ClientBench = 22,
	ClientArkChest = 21
}
ClientConst.AI_HELPER = {
	Special_Item = {
		EnvObj = 1080004,
		Amber2 = 19068,
		Amber = 11042
	},
	Special_Id = {
		Entity_Tag = 35,
		Special_Env = 34,
		Lumin_Level_Item = 33,
		Rainbow = 128,
		Dark = 129,
		Shiny = 2,
		Lumin_Amber = 1
	},
	TYPE = {
		Pop = 2,
		Lit = 1
	}
}
ClientConst.HOME_CAR_TRACEID = "HomeCar"
ClientConst.CLIENT_LOG_NAME = "client"
ClientConst.GS_NONE = 0
ClientConst.GS_START = 1
ClientConst.GS_CONNECT = 3
ClientConst.GS_LOGON = 5
ClientConst.GS_LOGIN = 7
ClientConst.GS_PLAYGAME = 10
ClientConst.GS_DISCONNECT = 11
ClientConst.SCENE_INIT_ID = 1
ClientConst.SCENE_LOGIN_ID = 2
ClientConst.SCENE_PLAYER_ID = 3
ClientConst.SCENE_LOADING_ID = 4
ClientConst.SCENE_FREEWALK_ID = 5
ClientConst.SCENE_LOGIN_RENDER_ID = 6
ClientConst.SCENE_ELEMENT_DEMO = 251
ClientConst.SCENE_PVP_Combat = 267
ClientConst.SCENE_MAIN_SINGLE_WORLD = 3000
ClientConst.SCENE_ARK = 501
ClientConst.SCENE_ROOKIE = 3002
ClientConst.LOADING_INSTANTIATE_QUEUE_TOTAL_PER_FRAME = {
	MOBILE = 30,
	CONSOLE = 80,
	DEFAULT = 100
}
ClientConst.InstantiatePriority = {
	Normal = 2,
	High = 1,
	Urgent = 0,
	Low = 3
}
ClientConst.AsyncLoadPriority = {
	Normal = 2,
	High = 1,
	Low = 3
}
ClientConst.IGNORE_LOD_WHITE_LIST_BY_STATIC_ID = {
	[90997540] = true,
	[89098820] = true,
	[90997542] = true
}
ClientConst.LayerDefine = {
	LAYER_NO_CLIMBING_SCENE = 13,
	LAYER_NO_COLLISION = 12,
	LAYER_PET = 11,
	LAYER_ENTITY = 10,
	LAYER_WALL = 7,
	LAYER_AIR_WALL = 6,
	LAYER_UI = 5,
	LAYER_WATER = 4,
	LAYER_GROUND = 3,
	LAYER_IGNORE_RAYCAST = 2,
	LAYER_TRANSPARENT_FX = 1,
	LAYER_DEFAULT = 0,
	LAYER_CUTSCENE = 30,
	LAYER_UI_SCENE = 29,
	LAYER_NOACROSS = 26,
	LAYER_NOCLIMB = 25,
	LAYER_ULTIMATE_UI = 24,
	LAYER_PLAYER = 22,
	LAYER_IGNORE_SNEAK = 16
}
ClientConst.ModuleKey = {
	PetList = "PetList",
	Map = "Map",
	Quest = "Quest",
	OperationHint = "OperationHint",
	BallAndItem = "BallAndItem",
	NormalAttack = "NormalAttack",
	Skill = "Skill",
	Chat = "Chat",
	Esc = "Esc",
	Dash = "Dash",
	CallFriend = "CallFriend",
	PetLink = "PetLink"
}
ClientConst.TIMER_TYPE_NORMAL = 1
ClientConst.TIMER_TYPE_BEAT = 2
ClientConst.TIMER_OWNER_ACTOR = 1
ClientConst.TIMER_OWNER_SYSTEM = 2
ClientConst.TIMER_OWNER_REFERENCE = 3
ClientConst.TIMER_KEY_DAMAGE_END = -100
ClientConst.TIMER_KEY_DAMAGE_START = -139
ClientConst.TIMER_KEY_GORUMET_END = -200
ClientConst.TIMER_KEY_GORUMET_START = -204
ClientConst.CURSOR_MODE_NORMAL = 0
ClientConst.CURSOR_MODE_ACT = 1
ClientConst.LockCursorKey = {
	UI = 2,
	Camera = 1,
	Base = 0,
	DebugConsole = 6,
	Photo = 5,
	DialogueGraph = 4,
	AbilityIndicator = 7,
	Dialogue = 3
}
ClientConst.BlockNoneUIEventKey = {
	GroupSingPuzzle = 5,
	Ultimate = 8,
	DialogueGraph = 4,
	Guide = 7,
	CombatControl = 6
}
ClientConst.DISABLE_SPACE_FOLLOW_KEY = {
	DIALOGUE_GRAPH = 1
}
ClientConst.ViewControl = {
	CREATE_PLAYER = 1,
	Default = 0,
	PHOTO = 6,
	HomelandEditor = 5,
	SHARE_SNAPSHOT = 4,
	APPEARANCE = 3,
	PRESET_SNAPSHOT = 2
}
ClientConst.CAMERA_HITCHECK_DEFAULT = 0
ClientConst.CAMERA_HITCHECK_NOCHECK = 1
ClientConst.CAMERA_HITCHECK_COLLIDE = 2
ClientConst.ImpluseMode = {
	Actor = 2,
	Camera = 0,
	World = 1
}
ClientConst.NPC_INTERACT = {
	PROB_TYPE_1 = 1,
	PROB_TYPE_0 = 0,
	BOTTOM_DIALOGUE = 2,
	TOP_DIALOGUE = 1,
	LEAVE_EVENT = 8,
	CUSTOM_EVENT = 7,
	PLOT_DIALOGUE = 6,
	TOP_EMOJI_BUBBLE = 5,
	BUBBLE_GROUP = 4,
	AUDIO = 3,
	ACTION = 2,
	DIALOGUE = 1
}
ClientConst.CUTSCENE_STATE_NONE = 0
ClientConst.CUTSCENE_STATE_READY = 1
ClientConst.CUTSCENE_STATE_PLAY = 2
ClientConst.CUTSCENE_STATE_STOP = 3
ClientConst.CUTSCENE_STATE_DESTROY = 4
ClientConst.MODEL_VISIBLE_KEY = {
	DEFAULT = 1,
	PHOTO = 42,
	DIALOGUE_GRAPH = 47,
	GM = 100,
	VEHICLE_NO_PET_SEAT = 91,
	MAPPING_GHOST = 90,
	HOME_GASHAPON = 89,
	HOME_MUSIC_PLAYER = 88,
	NPC_HIDE_SHOW_TIME = 87,
	SYNC_ENTITY_ROLE = 86,
	HOMELAND_HEIGHT_HIDE = 85,
	GM_OBSERVER_MODE = 84,
	BALL_HIT_PENDING = 83,
	SPACE_FOLLOW = 82,
	AUTHOR_AWAY = 81,
	NPC_DUEL_DIE = 80,
	ROBEGG_SPRITE = 79,
	FISHING_CAPTURE_SUCCESS = 78,
	SWIMMING = 77,
	ROGUE = 76,
	BORN_EFFECT = 75,
	SEAMLESS_STATE = 74,
	HUG_ENT = 73,
	WAITING_ATTACH = 72,
	EGG_MODE = 71,
	VEHICLE_PARENT = 70,
	BOSS_RUSH_SCENE = 69,
	IN_HIGH_GRASS = 68,
	COLLECT_ITEM_CREATE = 67,
	COLLECT_ITEM_OPENED = 66,
	BIG_WHITE_BALL = 65,
	CAMOUFLAGE = 64,
	TEAM_ROOM_SCENE = 63,
	CONFIG = 62,
	SEVER_VISIBLE = 61,
	SHADOW = 60,
	UIScene = 59,
	BASE_PET = 58,
	SPACE_HIDE_PET = 57,
	SUMMON = 56,
	DESTROYED = 55,
	FOLLOW_PHANTOM = 54,
	CHEST_VALID = 53,
	CLIENT_SET = 52,
	GHOST_EYE = 51,
	BASE_VISIBLE = 50,
	PUZZLE = 49,
	HOMELAND_EDIT = 48,
	DESTROYING = 46,
	PEEP = 45,
	BOSS_CATCH = 44,
	ARK_CHEST_ACTIVE = 43,
	COUNT_LIMIT = 41,
	CUTSCENE_SELF = 40,
	CUTSCENE = 38,
	TOTEM_PUZZLE = 37,
	CHEST_OPENED = 36,
	CHEST_LIMIT = 35,
	MATER_EXPLORE_STATE = 34,
	BALL_LIFETIME = 33,
	DIALOGUE_TIMELINE = 32,
	TELEPORT = 31,
	PLAYER_DEAD = 30,
	DITTO = 29,
	APPEAR_DASH = 28,
	SAND_UNDERGROUND = 27,
	MINIGame = 26,
	AI = 25,
	MAGNESIS = 24,
	VISIBLE_BY_SERVER = 23,
	VISIBLE_BY_ABILITY = 22,
	SPAWNER_FOV = 21,
	SWITCHING = 20,
	CLIENT_PETS_COMP = 19,
	REPLAY = 18,
	LIFT = 17,
	QUICK_CATCH = 16,
	PET_EVOLVE = 15,
	CROUCHING = 14,
	AUTO_SWITCH = 12,
	CAPTURE = 11,
	SKILL = 10,
	LEVEL_BLUEPRINT = 2
}
ClientConst.NPC_HIDE_SHOW_TIME_CHECK_INTERVAL = 30
ClientConst.FORCE_VISIBLE_KEY = {
	QUEST_DELIVER_NPC = 1
}
ClientConst.MODEL_SCALE_KEY = {
	SKILL = 10,
	HELD = 15,
	AVATAR = 14,
	DITTO_ENTRY = 13,
	LEVEL_FRUIT = 12,
	SWITCH = 11,
	DEFAULT = 1
}
ClientConst.PUPPET_VISIBLE_FLAG = {}
ClientConst.PUPPET_COMBAT_VISIBLE_FLAG = {}
ClientConst.PET_VISIBLE_FLAG = {}
ClientConst.PLAYER_VISIBLE_FLAG = {}
ClientConst.CAPSULE_SCALE_KEYS = {
	ClientConst.MODEL_SCALE_KEY.DEFAULT
}
ClientConst.DISABLE_MOTION_KEY = {
	SKILL_MOVE = 3,
	PUSHING = 2,
	LIFTING = 1,
	VIRTUAL_ENT_SWAP_POS = 4,
	ABILITY_INDICATOR = 7,
	SKILL_CONTROL = 6,
	CHAIN_ATTACK = 5,
	SWITCHING = 1
}
ClientConst.ANIM_FREEZE_KEY_NORMAL = "normal"
ClientConst.ANIM_FREEZE_KEY_TIMELINE = "timeline"
ClientConst.ANIM_IGNORE_GLOBAL_TIME_SCALE_REASON = {
	ULTIMATE_CUTSCENE = "ultimateCutscene"
}
ClientConst.HUD_BREAK_STAGE = {
	CHAIN_BURST = 3,
	QTE = 2,
	CHOOSE_START = 1,
	NONE = 0
}
ClientConst.ModelSwitchTagGroup = {
	Special3 = 2,
	Special2 = 1,
	Special1 = 0
}
ClientConst.MOBILE_CAMERA_DRAG_FRAME_SCALE = 0.4
ClientConst.MobileJoystickMode = {
	Dynamic = 1,
	Fixed = 0
}
ClientConst.PhotoStorageMode = {
	LocalAndCloud = 2,
	Cloud = 1,
	Local = 0
}
ClientConst.AutoAcceptSpaceFollowType = {
	All = 2,
	FriendOnly = 1,
	Close = 0
}
ClientConst.InteractionInviteAcceptRange = {
	FRIENDS = "FRIENDS",
	ALL = "ALL",
	NONE = "NONE"
}
ClientConst.SpaceFollowKeepAwayReason = {
	Moving = "Moving",
	Catch = "Catch",
	Vehicle = "Vehicle"
}
ClientConst.PrefKey = {
	GmDisablePlayerFirstInit = "gmDisablePlayerFirstInit",
	GamepadRightStickDeadzone = "gamepadRightStickDeadzone",
	MobileJoystickMode = "mobileJoystickMode",
	InvertVerticalLookMouse = "invertVerticalLookMouse",
	CatchAbsorbSpeed_mobile = "catchAbsorbSpeed_mobile",
	CatchDampingRate_mouseKeyBoard = "catchDampingRate_mouseKeyBoard",
	CatchAbsorbSpeed_mouseKeyBoard = "catchAbsorbSpeed_mouseKeyBoard",
	FocusTargetLineOpen = "focusTargetLine",
	CatchCameraPitchRotateRate = "catchCameraPitchRotateRate",
	AudioLanguage = "AudioLanguage",
	DirectPurchaseRebateGuideSuppressTs = "DirectPurchaseRebateGuideSuppressTs",
	GmTollFullSearch = "gmToolFullSearch",
	GmClosePopupInfoTip = "gmClosePopupInfoTip",
	GmSkipNew = "gmSkipNew",
	GmDisableShellActivityInvite = "gmDisableShellActivityInvite",
	GmGamepadNavDebug = "gmGamepadNavDebug",
	HideTownPet = "HideTownPet",
	DirectPurchaseFirstGuideShown = "DirectPurchaseFirstGuideShown",
	GamepadLeftStickDeadzone = "gamepadLeftStickDeadzone",
	SeasonLobbyCalendarOpenedStage = "SeasonLobbyCalendarOpenedStage",
	EventFormResearchGender = "EventFormResearchGender",
	EventIconUpNew = "EventIconUpNew",
	EventPetSaveVideoPlayed = "EventPetSaveVideoPlayed",
	TargetFramerate = "targetFramerate",
	PhotoStudioPrefab = "PhotoStudioPrefab",
	ChatAutoPlayAudio = "ChatAutoPlayAudio",
	ChatAudioAlreadyPlayed = "ChatAudioAlreadyPlayed",
	ChatPrivateTopChannel = "ChatPrivateTopChannel",
	FriendshipValue = "FriendshipValue",
	FriendGroupListExpand = "FriendGroupListExpand",
	ChatGroupName = "ChatGroupName",
	ChatGroupBasicInfo = "ChatGroupBasicInfo",
	InfoStampSystemVisible = "InfoStampSystemVisible",
	InfoStampStrangerCount = "InfoStampStrangerCount",
	BadgeCollectionPeriod = "BadgeCollectionPeriod",
	BadgeCollectionState = "BadgeCollectionState",
	DisableIntel13or14GenCPUWarning = "DisableIntel13or14GenCPUWarning",
	DittoState = "DittoState",
	LastShowCancelChallengeTipTime = "LastShowCancelChallengeTipTime",
	CatchBossCancelTipTs = "catchBossCancelTipTs",
	IsShowResist = "IsShowResist",
	SavePowerMode = "savePowerMode",
	PetTransmogRollGoldenTipTs = "petTransmogRollGoldenTipTs",
	PetTransmogUseSpecialItemTipTs = "petTransmogUseSpecialItemTipTs",
	PetTransmogFirstGuide = "petTransmogFirstGuide",
	HomeSpeedUpConfirmTipTs = "homeSpeedUpConfirmTipTs",
	InventoryPetShinyChangeTipTs = "inventoryPetShinyChangeTipTs",
	InventoryPetShinyRefreshTipTs = "inventoryPetShinyRefreshTipTs",
	InventoryPetShinySwitchTipTs = "inventoryPetShinySwitchTipTs",
	AppearanceOutfitMakeupOverrideTipTs = "appearanceOutfitMakeupOverrideTipTs",
	RogueBattleCountDown = "RogueBattleCountDown",
	ArkCafeGatheringMapTip = "ArkCafeGatheringMapTip",
	BossRushCycleFirstInKey = "BossRushCycleFirstInKey",
	CashShopFirstTopup = "CashShop_FirstTopup_",
	DialogueGraphMobileOpenDof = "openShowDof",
	AvatarIconNewCount = "avatarIconNewCount",
	AvatarIcon = "avatarIcon",
	PhotoTopVideoQuality = "PhotoTopVideoQuality",
	EventPhotoTypeIndex = "eventPhotoTypeIndex",
	PhotoTypeIndex = "photoTypeIndex",
	FriendChannelType = "friendChannelType",
	ChatMessageReadMark = "chatMessageReadMark",
	TowerLevelDetailLastDifficulty = "towerLevelDetailLastDifficulty",
	TowerLevelDetailOpenWeek = "towerLevelDetailOpenWeek",
	TowerDifficultyNew = "towerDifficultyNew",
	EventTypeShowGuide = "EventTypeShowGuide",
	TowerCurSelectedDifficulty = "towerCurSelectedDifficulty",
	EventFormResearchClueUnlock = "EventFormResearchClueUnlock",
	SpecialTrainSelectedChapter = "specialTrainSelectedChapter_%s",
	EventFormResearch = "EventFormResearch",
	SpecialTrainSelectedBlock = "specialTrainSelectedBlock",
	SeasonLobbyFirstOpenPhase = "SeasonLobbyFirstOpenPhase",
	BPFirstOpenPhase = "BPFirstOpenPhase",
	BPCorePop = "BPCorePop",
	EventPop = "EventPop",
	HomelandPetActInfo = "homelandPetActInfo",
	CatchSelectItemId = "catchSelectItemId",
	GmCatchDebugInfo = "gmCatchDebugInfo",
	GmCaptureProbability = "gmCaptureProbability",
	HideAllHudArrowType = "HideAllHudArrowType",
	HideSkillType = "HideSkillType",
	FuncMenuVipEnterClicked = "FuncMenuVipEnterClicked",
	InvertHorizontalLookMouse = "invertHorizontalLookMouse",
	UseTopLogoCache = "UseTopLogoCache",
	InvertVerticalLook = "invertVerticalLook",
	InvertHorizontalLook = "invertHorizontalLook",
	RechargePenaltyTipTs = "RechargePenaltyTipTs",
	HoldToEnterCatchMode = "holdToEnterCatchMode",
	DirectPurchaseTipsTs = "DirectPurchaseTipsTs",
	GamepadCursorSpeed = "gamepadCursorSpeed",
	LotterySkipEntranceTimeline = "lotterySkipEntranceTimeline",
	MobileGamepadLayout = "mobileGamepadLayout",
	CashShopGiftPackTab = "cashShopGiftPackTab",
	CatchDampingRate_mobile = "catchDampingRate_mobile",
	AIHELPERStrength = "aiHelperStrength",
	ProtagonistVoice = "ProtagonistVoice",
	LoseFocusAudio = "LoseFocusAudio",
	CatchDampingRate_gamePad = "catchDampingRate_gamePad",
	LanguageSelectionConfirmed = "LanguageSelectionConfirmed",
	CatchAbsorbSpeed_gamePad = "catchAbsorbSpeed_gamePad",
	Language = "language",
	ShowPlatformOnlineID = "ShowPlatformOnlineID",
	CrossPlatformEnabled = "CrossPlatformEnabled",
	TeammateEffectDisplayMode = "TeammateEffectDisplayMode",
	TeamSpeechTeamVol = "TeamSpeechTeamVol",
	TeamSpeechMicVol = "TeamSpeechMicVol",
	TeamSpeechSpeakType = "TeamSpeechSpeakType",
	WorldCameraContrast = "worldCameraContrast",
	AutoEnterTeamSpeech = "autoenterteamspeech",
	WorldCameraBrightness = "worldCameraBrightness",
	InfoStampFriendCount = "InfoStampFriendCount",
	WorldCameraSaturation = "worldCameraSaturation",
	MapAreaFilterFlagKey = "MapAreaFilterFlagKey",
	NPC = "ClientNpcCountLimit",
	ChatGroupMember = "ChatGroupMember",
	CatchCameraYawRotateRate = "catchCameraYawRotateRate",
	ChatChannelSetting = "ChatChannelSetting",
	CameraRotateRate = "cameraRotateRate",
	FriendshipLevel = "FriendshipLevel",
	ChatBubble = "chatBubble",
	LastSelectMapPetTab = "LastSelectMapPetTab",
	ClientEnvObject = "ClientEnvObjectCountLimit",
	PlayerShowTitles = "playerShowTitles",
	ChatChannelRecord = "ChatChannelRecord",
	PlayerCardBackground = "playerCardBackground",
	PhotoPetPutGuide = "PhotoPetPutGuide",
	AvatarFrameNewCount = "avatarFrameNewCount",
	IsEnableManualClickForceLockEnemy = "isEnableManualClickForceLockEnemy",
	AvatarFrame = "avatarFrame",
	ResourceQuality = "resourceQuality",
	LockCatchBallTips = "LockCatchBallTips",
	ClientPet = "ClientPetCountLimit",
	ClientPlayer = "ClientPlayerCountLimit",
	ClientPuppet = "ClientPuppetCountLimit",
	EventPopCooldownTypePhase = "EventPop_Phase_%d_%d",
	EventPopCooldownTypeDaily = "EventPop_Daily_%d",
	EventPopCooldownTypeOnce = "EventPop_Once_%d",
	EventAreaActivityFinish = "EventAreaActivityFinish",
	EventAreaActivityAppear = "EventAreaActivityAppear",
	EventFishingCaptureIrisHintPlayed = "EventFishingCaptureIrisHintPlayed",
	DlssState = "dlssState",
	GuideLabel = "guideLabel",
	Compass = "compass",
	Preset = "preset",
	VSync = "vSync",
	GIState = "GIState",
	NeuralRendering = "NeuralRendering",
	FrameGeneration = "FrameGeneration",
	Antialiasing = "Antialiasing",
	PcScreenMode = "pcScreenMode",
	OverheadPartDeal = "OverheadPartDeal",
	AnimationQuality = "animationQuality",
	PcResolution = "pcResolution",
	LargeScreenModeUserModified = "largeScreenModeUserModified",
	ResolutionScale = "resolutionScale",
	DisableVideoQualityTip = "DisableVideoQualityTip",
	VideoQualityTipTime = "VideoQualityTipTime",
	VideoQualityScore = "VideoQualityScore",
	CloudGameFramePacingUserModified = "CloudGameFramePacingUserModified",
	VideoQualityRecommend = "VideoQualityRecommend",
	VideoQualityChangeKeys = "VideoQualityChangeKeys",
	VideoQuality = "VideoQuality",
	Debug_ShowTopLogoPerception = "Debug_ShowTopLogoPerception",
	ShowPlayableLog = "ShowPlayableLog",
	GamepadLockMode = "GamepadLockMode1",
	KeyboardLockMode = "KeyboardLockMode1",
	GamepadDebugCapture = "GamepadDebugCapture",
	HideGuide = "hideGuide",
	ShowDebugId = "showDebugId",
	ShowDebugInfoSimple = "showDebugInfoSimple",
	ShowDebugInfo = "showDebugInfo",
	SkillAimSwitchMode = "SkillAimSwitchMode",
	IsForceLockTarget = "isForceLockTarget",
	UseExtendLockCamera = "useExtendLockCamera",
	AutoCameraWhenNoLock = "autoCameraWhenNoLock",
	AutoAcceptSpaceFollowInvite = "AutoAcceptSpaceFollowInvite",
	AutoAcceptSpaceFollowRequire = "AutoAcceptSpaceFollowRequire",
	AutoCast = "AutoCast",
	AttackForceLock = "AttackForceLock",
	SkillAutoLock = "SkillAutoLock",
	WorldRacingSelectedTrack = "WorldRacingSelectedTrack_%s_%s",
	LastTeamMatchType = "LastTeamMatchType",
	UseKcpConnection = "use_kcp_connection",
	SettingKey = "SettingKey",
	PhotoStorageMode = "PhotoStorageMode"
}
ClientConst.SettingDefaultValue = {
	ScreenModeDefaultValue = "FullScreenWindow"
}
ClientConst.GAMEPAD_CURSOR_SPEED_LEVEL = {
	200,
	400,
	800,
	1200,
	1600
}
ClientConst.GAMEPAD_CURSOR_DEFAULT_LEVEL = 3
ClientConst.SettingFuncType = {
	ProtagonistVoice = "closeProtagonistVoice",
	CatchCameraYawRotateRate = "catchCameraYawRotateRate",
	MobileJoystickMode = "mobileJoystickMode",
	CameraRotateRate = "cameraRotateRate",
	HoldToEnterCatchMode = "holdToEnterCatchMode",
	GamepadCursorSpeed = "gamepadCursorSpeed",
	ClientPlayer = "playerCountLimit",
	ClientEnvObject = "envObjCountLimit",
	CatchAbsorbSpeed_mouseKeyBoard = "catchAbsorbSpeed_mouseKeyBoard",
	focusTargetLineOpen = "focusTargetLineOpen",
	WorldCameraBrightness = "worldCameraBrightness",
	CatchCameraPitchRotateRate = "catchCameraPitchRotateRate",
	CrossPlatform = "crossPlatform",
	IsEnableManualClickForceLockEnemy = "isEnableManualClickForceLockEnemy",
	InvertHorizontalLook = "invertHorizontalLook",
	ResourceQuality = "resourceQuality",
	InvertVerticalLook = "invertVerticalLook",
	ClientPet = "petCountLimit",
	TargetFramerate = "targetFramerate",
	ClientPuppet = "puppetCountLimit",
	InfoStampSystemVisible = "infoStampSystemVisible",
	GIState = "giState",
	CatchDampingRate_mouseKeyBoard = "catchDampingRate_mouseKeyBoard",
	IsShowResist = "isShowResist",
	IsVietnamRealName = "isVietnamRealName",
	MobileAccountBind = "mobileAccountBind",
	PhotoStorageMode = "photoStorageMode",
	UUNetwork = "uuNetwork",
	Language = "language",
	DlssState = "dlssState",
	GuideLabel = "showUI",
	Compass = "showUI",
	Preset = "preset",
	InfoStampOwnVisibility = "infoStampOwnVisibility",
	VSync = "vSync",
	AIHelperStrength = "aiHelperStrength",
	NeuralRendering = "neuralRendering",
	FrameGeneration = "frameGeneration",
	Antialiasing = "antialiasing",
	AnimationQuality = "animationQuality",
	ResolutionScale = "resolutionScale",
	LanguageLogin = "languageLogin",
	UploadPlayerLog = "uploadPlayerLog",
	VideoQuality = "setVideoQuality",
	SetResolution = "setResolution",
	SetScreenMode = "setScreenMode",
	BloodType = "bloodType",
	SocialAccountBind = "socialAccountBind",
	EmailAccountBind = "emailAccountBind",
	GamepadRightStickDeadzone = "gamepadRightStickDeadzone",
	GamepadLeftStickDeadzone = "gamepadLeftStickDeadzone",
	InvertVerticalLookMouse = "invertVerticalLookMouse",
	InvertHorizontalLookMouse = "invertHorizontalLookMouse",
	IsForceLockTarget = "isForceLockTarget",
	UseExtendLockCamera = "useExtendLockCamera",
	AutoCameraWhenNoLock = "autoCameraWhenNoLock",
	AutoAcceptSpaceFollowInvite = "autoAcceptSpaceFollowInvite",
	AutoAcceptSpaceFollowRequire = "autoAcceptSpaceFollowRequire",
	AutoCast = "autoCast",
	AttackForceLock = "attackForceLock",
	MobileGamepadLayout = "mobileGamepadLayout",
	CatchDampingRate_mobile = "catchDampingRate_mobile",
	CatchAbsorbSpeed_mobile = "catchAbsorbSpeed_mobile",
	CatchDampingRate_gamePad = "catchDampingRate_gamePad",
	CatchAbsorbSpeed_gamePad = "catchAbsorbSpeed_gamePad",
	SavePowerMode = "savePowerMode",
	ShowPlatformOnlineID = "showPlatformOnlineID",
	TeammateEffectDisplayMode = "teammateEffectDisplayMode",
	TeamSpeechTeamVol = "teamVol",
	TeamSpeechMicVol = "micVol",
	TeamSpeechSpeakType = "teamSpeechSpeakType",
	WorldCameraContrast = "worldCameraContrast",
	AutoEnterTeamSpeech = "autoenterteamspeech",
	InfoStampStrangerCount = "infoStampStrangerCount",
	InfoStampFriendCount = "infoStampFriendCount",
	WorldCameraSaturation = "worldCameraSaturation",
	NPC = "npcCountLimit"
}
ClientConst.TeammateEffectDisplayMode = {
	Standard = 1,
	Weak = 0
}
ClientConst.ResolutionMinValue = {
	width = 1280,
	height = 960
}
ClientConst.SettingFuncParam = {
	Compass = {
		"compass"
	},
	GuideLabel = {
		"help"
	}
}
ClientConst.LANGUAGE_TYPE_MAP = {
	zh_TW = 1,
	zh_CN = 0,
	th_TH = 12,
	id_ID = 11,
	pt_PT = 10,
	es_ES = 9,
	fr_FR = 8,
	de_DE = 7,
	ru_RU = 6,
	vi_VN = 5,
	ja_JP = 4,
	ko_KR = 3,
	en = 2
}
ClientConst.STAR_TITLE_NOUN_FIRST_LANGUAGES = {
	[ClientConst.LANGUAGE_TYPE_MAP.fr_FR] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.pt_PT] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.es_ES] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.id_ID] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.vi_VN] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.th_TH] = true
}
ClientConst.HALF_WIDTH_SPACE = " "
ClientConst.ZERO_WIDTH_SPACE = "​"
ClientConst.CONCAT_SEPARATOR_BY_LANGUAGE = {
	[ClientConst.LANGUAGE_TYPE_MAP.en] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.ko_KR] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.vi_VN] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.ru_RU] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.de_DE] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.fr_FR] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.es_ES] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.pt_PT] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.id_ID] = ClientConst.HALF_WIDTH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.th_TH] = ClientConst.ZERO_WIDTH_SPACE
}
ClientConst.COLON_SPACE_BEFORE_LANGUAGES = {
	[ClientConst.LANGUAGE_TYPE_MAP.fr_FR] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.th_TH] = true
}
ClientConst.COLON_NO_SPACE_AFTER_LANGUAGES = {
	[ClientConst.LANGUAGE_TYPE_MAP.zh_CN] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.zh_TW] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.ja_JP] = true
}
ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE = "{0}" .. ClientConst.HALF_WIDTH_SPACE .. "{1}"
ClientConst.SHORT_LEVEL_FORMAT_BY_LANGUAGE = {
	[ClientConst.LANGUAGE_TYPE_MAP.en] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.ko_KR] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.vi_VN] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.ru_RU] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.de_DE] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.fr_FR] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.es_ES] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.pt_PT] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.id_ID] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE,
	[ClientConst.LANGUAGE_TYPE_MAP.th_TH] = ClientConst.SHORT_LEVEL_FORMAT_WITH_SPACE
}
ClientConst.DEFAULT_SHORT_LEVEL_FORMAT = "{0}{1}"
ClientConst.COUNT_DOWN_WITHOUT_UNIT_GROUP_SPACE_LANGUAGES = {
	[ClientConst.LANGUAGE_TYPE_MAP.zh_CN] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.zh_TW] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.ja_JP] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.th_TH] = true
}
ClientConst.LANGUAGE_TYPE_DESC_MAP = {
	[0] = "zh_CN",
	"zh_TW",
	"en",
	"ko_KR",
	"ja_JP",
	"vi_VN",
	"ru_RU",
	"de_DE",
	"fr_FR",
	"es_ES",
	"pt_PT",
	"id_ID",
	"th_TH"
}
ClientConst.SDK_ANNOUNCEMENT_LANGUAGE_TYPE_DESC_MAP = {
	[0] = "zh-cn",
	"zh-tw",
	"en",
	"ko",
	"ja",
	"vi",
	"ru",
	"de",
	"fr",
	"es",
	"pt",
	"id",
	"th"
}
ClientConst.AudioLanguageType = {
	None = "None",
	zh_CN = "zh_CN",
	ja_JP = "ja",
	ko_KR = "ko",
	en = "en"
}
ClientConst.DefaultLangToAudioLangMap = {
	zh_CN = ClientConst.AudioLanguageType.zh_CN,
	zh_TW = ClientConst.AudioLanguageType.en,
	en = ClientConst.AudioLanguageType.en,
	ko_KR = ClientConst.AudioLanguageType.ko_KR,
	ja_JP = ClientConst.AudioLanguageType.ja_JP,
	ru_RU = ClientConst.AudioLanguageType.en,
	vi_VN = ClientConst.AudioLanguageType.en,
	de_DE = ClientConst.AudioLanguageType.en,
	fr_FR = ClientConst.AudioLanguageType.en,
	es_ES = ClientConst.AudioLanguageType.en,
	pt_PT = ClientConst.AudioLanguageType.en,
	id_ID = ClientConst.AudioLanguageType.en,
	th_TH = ClientConst.AudioLanguageType.en
}
ClientConst.PANDORA2GAME_MESSAGE_TYPE = {
	PandoraAppRefresh = "pandoraAppRefresh",
	PandoraSwitchGameBgSound = "pandoraSwitchGameBgSound",
	PandoraPlaySound = "pandoraPlaySound",
	PandoraGoPandora = "pandoraGoPandora",
	PandoraGoSystem = "pandoraGoSystem",
	PandoraOpenUrl = "pandoraOpenUrl",
	PandoraShowLoading = "pandoraShowLoading",
	PandoraShowReceivedItem = "pandoraShowReceivedItem",
	PandoraShowTextTip = "pandoraShowTextTip",
	PandoraShowRedpoint = "pandoraShowRedpoint",
	PandoraShowEntrance = "pandoraShowEntrance",
	PandoraTriggerEvent = "pandoraTriggerEvent",
	PandoraShowEntry = "pandoraShowEntry",
	PandoraShowCommonItemTip = "pandoraShowCommonItemTip",
	PandoraShowPopup = "pandoraShowPopup",
	PandoraGetTime = "pandoraGetTime",
	PandoraActCenterReady = "pandoraActCenterReady"
}
ClientConst.Platforms = {
	Android = 2,
	OpenHarmony = 6,
	Windows = 1,
	PS5 = 5,
	XBOX = 4,
	IOS = 3
}
ClientConst.RealPlatform = {
	Console = 3,
	PC = 2,
	Mobile = 1
}
ClientConst.CACHE_TYPE_FLAG = {
	PUBLIC = 0,
	USER = 1
}
ClientConst.RumbleLayer = {
	CATCH_AIM = 4,
	QTE_CLIP = 3,
	QTE_TIMELINE = 2,
	BREAK_RECOVER = 1,
	SKILL4 = 14,
	MAX = 32,
	TIMELINE_4 = 24,
	TIMELINE_3 = 23,
	TIMELINE_2 = 22,
	TIMELINE_1 = 21,
	DEFAULT = 0,
	SKILL3 = 13,
	SKILL2 = 12,
	SKILL1 = 11,
	VITALITY_SETTLEMENT = 10,
	PET_EXCHANGE_WAIT = 9,
	PET_INCUBATE = 8,
	PLAYER_HIT = 7,
	PLAYER_DANGER = 6,
	CATCH = 5
}
ClientConst.OperationHintVisibleKey = {
	BallMenu = 3,
	GamepadBallMenu = 2,
	GamepadItemMenu = 1
}
ClientConst.InteractVisibleKey = {
	GamepadSkillModifier = 2,
	Qte = 1
}
ClientConst.LockMode = {
	ModeA = 1,
	ModeB = 2
}
ClientConst.TriggerType = {
	SIMPLE_MOVE_PROXIMITY = 6,
	NPC_LOOK_AT = 5,
	PHOTO_IDENTIFY = 4,
	TOP_LOGO = 3,
	TRAP_EVENT = 2,
	FKey = 1
}
ClientConst.BaseMotionType = {
	Sprint = 2,
	Running = 1,
	Unknown = 0
}
ClientConst.GravityMask = {
	BeStick = 3,
	SKill = 2,
	FSM = 1,
	DialogueGraph = 6,
	GMMove = 5,
	RaiseUp = 4
}
ClientConst.AntialiasingMode = {
	UI = 1
}
ClientConst.ShareDataType = {
	Boolean = 3,
	Vector3 = 2,
	String = 1,
	Number = 0
}
ClientConst.IsKinematicKey = {
	SandboxLoading = bit.lshift(1, 0),
	Dandelion = bit.lshift(1, 1),
	PetBall = bit.lshift(1, 2),
	Visible = bit.lshift(1, 3),
	FlowCanvas = bit.lshift(1, 4),
	Auth = bit.lshift(1, 5),
	Attach = bit.lshift(1, 6),
	WaitingAttach = bit.lshift(1, 7),
	SceneLoading = bit.lshift(1, 8),
	Faraway = bit.lshift(1, 9),
	FishingCapture = bit.lshift(1, 10),
	SimpleMoveEntity = bit.lshift(1, 11),
	SpecialVehicleRide = bit.lshift(1, 12)
}
ClientConst.MaterialProperty = {
	DecalLayer = "_DecalLayer",
	SupportDecal = "_SupportDecal"
}
ClientConst.DecalLayer = {
	Layer3 = 5,
	Layer1 = 7,
	Layer2 = 6
}
ClientConst.TopLogoType = {
	RobSpaceEgg = 14,
	PetFertility = 12,
	InteractableObject = 11,
	HomeCarBoard = 10,
	HomeFacility = 9,
	DialogueGraph = 6,
	EggTransmitter = 7,
	Player = 3,
	Pet = 1,
	EnvObj = 2,
	HomeObject = 5,
	HomeFacilityHatchBox = 8,
	PetBall = 4,
	HomeWishingStar = 15,
	NPC = 13
}
ClientConst.HATCH_BOX_ID = 880207
ClientConst.TopLogoSpecial = {
	Pvp = 1,
	Pvp_2 = 2
}
ClientConst.TopLogoFollowStrategy = {
	FxRoot = 2,
	Root = 1,
	Head = 3
}
ClientConst.LookAtTypeName = {
	OwnPetStr = "OwnPet",
	OwnPlayerStr = "OwnPlayer",
	OtherPetStr = "OtherPet",
	NpcStr = "Npc",
	EnvObjStr = "EnvObj",
	MonsterStr = "Monster",
	OtherPlayerStr = "OtherPlayer"
}
ClientConst.LuaEventPostFix = {
	EntityInteract = "_Entity_Interact"
}
ClientConst.DialogueCameraPreset = {
	FocusToTarget = "FocusToTarget",
	PlayCameraAnim = "PlayCameraAnim"
}
ClientConst.PetBodySizeType = {
	MEDIUM = 2,
	SMALL = 1,
	LARGE = 3
}
ClientConst.TimelineConfigType = {
	HideNPC = "HideNPC",
	ApplyStateConflict = "ApplyStateConflict",
	DisableWorldAudio = "DisableWorldAudio",
	DisableAuxEnvBus = "DisableAuxEnvBus",
	DisableAmb = "DisableAmb",
	DisableBgm = "DisableBgm",
	HideAllPlayer_IncludeMainPlayer = "HideAllPlayer_IncludeMainPlayer",
	HideAllPlayer = "HideAllPlayer",
	HideUI = "HideUI"
}
ClientConst.CutsceneOtherPlayerKey = {
	Player2 = "Player2",
	Player1 = "Player1",
	Player4 = "Player4",
	Player3 = "Player3"
}
ClientConst.ShadowPriority = {
	MainPetPlayer = 1,
	Default = 0,
	PetResearchDetail = 3,
	Appearance = 2
}
ClientConst.HomelandTopLogoIconType = {
	Output = 2,
	Default = 1,
	OutputSpecial = 3
}
ClientConst.HomelandEnvTopLogoType = {
	ElectricInvalid = 2,
	Electric = 1,
	HTemp2 = 4,
	Light = 7,
	LTemp2 = 6,
	LTemp = 5,
	None = 0,
	HTemp = 3
}
ClientConst.EntityEditorBoundType = {
	Outline = 3,
	Preview = 2,
	Default = 1,
	OverlapHint = 5,
	Interact = 4
}
ClientConst.OrnamentFilterType = {
	Heat = 0,
	Electric = 2,
	Light = 3,
	Cool = 1
}
ClientConst.HomelandEditorSetting = {
	AutoAttach = 10,
	QuickPlacement = 9,
	ContinuousPurchase = 8,
	ThreeAxisScaling = 7,
	ThreeAxisRotation = 6,
	RotationAngle = 5,
	Overlook = 4,
	GridAdsorption = 3,
	GridDisplay = 2,
	MultipleChoice = 1
}
ClientConst.HomelandEnvTopLogoUrl = {
	[ClientConst.HomelandEnvTopLogoType.Electric] = AddressDataConst.HOME_TOPLOGO_ELEC,
	[ClientConst.HomelandEnvTopLogoType.ElectricInvalid] = AddressDataConst.HOME_TOPLOGO_ELEC_INVALID
}
ClientConst.HomelandFacilityOpType = {
	Water = 100211
}
ClientConst.HomeCarGroupCreateType = {
	Camp = 2,
	Virtual = 1
}
ClientConst.HomeEnvRequireState = {
	None = 0,
	RequireHighTemp = 2,
	RequireLowTemp = 1
}
ClientConst.HOME_BUFF_TYPE = {
	Stop = 2,
	Buff = 1,
	Debuff = 0
}
ClientConst.HomeGroupPlaceType = {
	XYZ = 7,
	YZ = 6,
	XY = 5,
	Y = 4,
	Z = 3,
	X = 2,
	XZ = 1
}
ClientConst.HandleAxis = {
	XYZ = 6,
	YZ = 5,
	XY = 3,
	Y = 1,
	Z = 2,
	X = 0,
	XZ = 4
}
ClientConst.HandleSpaceType = {
	World = 0,
	Self = 1
}
ClientConst.TemperatureBuffIcon = {
	[-2] = AddressDataConst.HOME_TOPLOGO_ICON_COOL2,
	[-1] = AddressDataConst.HOME_TOPLOGO_ICON_COOL,
	[0] = AddressDataConst.HOME_TOPLOGO_ICON_TEMPERATURE,
	AddressDataConst.HOME_TOPLOGO_ICON_HEAT,
	AddressDataConst.HOME_TOPLOGO_ICON_HEAT2
}
ClientConst.LightBuffIcon = {
	[0] = AddressDataConst.HOME_TOPLOGO_ICON_LIGHT,
	AddressDataConst.HOME_TOPLOGO_ICON_LIGHT
}
ClientConst.HomelandTopLogoBuff = {
	[ClientConst.HomelandFacilityOpType.Water] = {
		IconUrl = AddressDataConst.HOME_TOPLOGO_ICON_WATER,
		BuffType = ClientConst.HOME_BUFF_TYPE.Debuff
	}
}
ClientConst.HOMELAND_EXTRA_STATES = {
	NO_WORKLOAD = 4,
	OUTPUT_LIMIT = 3,
	UNDER_CONSUME = 2,
	ENV_INVALID = 5
}
ClientConst.HOMELAND_ENV_REQUIRE_TYPE = {
	Temperature = 2,
	Electric = 1,
	None = 0,
	Light = 4
}
ClientConst.HomelandWarnIcon = {
	[ClientConst.HOMELAND_EXTRA_STATES.UNDER_CONSUME] = "$UI_Icon_HomeItemInfo_Trouble_01.png",
	[ClientConst.HOMELAND_EXTRA_STATES.NO_WORKLOAD] = "$UI_Icon_HomeItemInfo_Trouble_04.png",
	[ClientConst.HOMELAND_EXTRA_STATES.ENV_INVALID] = "$UI_Icon_HomeItemInfo_Trouble_05.png"
}
ClientConst.HomelandDebugType = {
	Base = 1,
	Env = 2
}
ClientConst.HomelandDebugDefault = {
	[ClientConst.HomelandDebugType.Base] = true,
	[ClientConst.HomelandDebugType.Env] = false
}
ClientConst.HomeEditType = {
	PlaceOrnament = 1,
	UpdatePet = 4,
	UpdateOrnament = 3,
	PlacePet = 2
}
ClientConst.HomeSelectType = {
	All = 0,
	Pet = 2,
	Ornament = 1
}
ClientConst.HomeModelType = {
	None = 0,
	Plant = 1
}
ClientConst.HomeEntEffectType = {
	None = 0,
	Edit = 1
}
ClientConst.EntityEditType = {
	Update = 2,
	Create = 1,
	None = 0
}
ClientConst.DisableBatchReason = {
	SPECIAL_VEHICLE_RIDE = 3,
	UGC_HOME_CAR_DECORATION = 2,
	EDITOR_OUTLINE = 1,
	Default = 0,
	WALL_PART_HIDDEN = 4
}
ClientConst.DefaultHomeEnvRangeSize = 9
ClientConst.ModelTextType = {
	Default = 0
}
ClientConst.ShaderViewShadowType = {
	Dynamic = 2,
	Default = 0,
	Static = 1
}
ClientConst.VoxelLoadType = {
	MAP_LOAD_NORMAL_AROUND = 1,
	MAP_LOAD_INVALID = 0,
	MAP_LOAD_ALL = 3,
	MAP_LOAD_SINGLE = 2
}
ClientConst.DynamicBubbleEvent = "DynamicBubble"
ClientConst.EntityBubbleEvent = "EntityBubble"
ClientConst.TeleportTransitionAfterEffectTime = 3
ClientConst.NORMAL_ATTACK_BTN_SHOW_MODE = {
	NORMAL = 2,
	EMPTY = 1,
	HIDE = 0
}
ClientConst.ModelSceneType = {
	ContinuousFrame = 2,
	SnapShot = 1
}
ClientConst.RewardState = {
	NotAchieved = 0,
	ReadyToClaim = 2,
	Claimed = 1
}
ClientConst.PlayerInfoOpenType = {
	Rank = 6,
	Chat = 2,
	PlayerGhost = 5,
	MobFaceToFace = 4,
	FaceToFace = 3,
	Edit = 1
}
ClientConst.PlayerTyping = {
	None = 1,
	Typing = 0
}
ClientConst.FriendInteractType = {
	Require = 1,
	Invite = 0,
	FriendAction = 2
}
ClientConst.FRIEND_CUSTOMIZE_SUCCESS_TIP = {
	CREATE_FRIEND_GROUP_SUCCESS = "CREATE_FRIEND_GROUP_SUCCESS",
	SET_FRIEND_REMARK_SUCCESS = "SET_FRIEND_REMARK_SUCCESS",
	MOVE_FRIEND_TO_GROUP_SUCCESS = "MOVE_FRIEND_TO_GROUP_SUCCESS",
	DELETE_FRIEND_GROUP_SUCCESS = "DELETE_FRIEND_GROUP_SUCCESS",
	EDIT_FRIEND_GROUP_NAME_SUCCESS = "EDIT_FRIEND_GROUP_NAME_SUCCESS"
}
ClientConst.CameraDisableReason = {
	AbilityCutScene = 7,
	PetTraining = 6,
	Evolution = 5,
	SoulEgg = 4,
	UI = 2,
	Default = 1,
	UIScene = 3,
	Cutscene = 9,
	UISceneTransition = 8
}
ClientConst.SELF_RESCUE_SP_TOAST_ID = 2035
ClientConst.CALL_FOR_HELP_ITEM_ID = 6000
ClientConst.MAP_AREA_WARNING_LEVEL = 5
ClientConst.MAP_AREA_DANGER_LEVEL = 10
ClientConst.NETWORK_DISCONNECT_CODE = {
	HeartbeatExpired = 109,
	SoulDisconnectNoReconnect_2 = 108,
	SoulDisconnectNoReconnect_1 = 107,
	NoReconnect = 106,
	BindSoulFail = 105,
	ReconnectRefused = 104,
	MsNoReconnect = 103,
	MsGateDisconnect = 102,
	PlayerException = 101,
	MsGateConnectExtra = 110
}
ClientConst.PlayFluteStandActionId = 801104
ClientConst.PlayFluteSitActionId = 801106
ClientConst.PlayHugEntActionId = 801107
ClientConst.FluteBenchVehicleId = 35
ClientConst.BackSkillId = 10010006
ClientConst.EnableRendererBatch = true
ClientConst.HomelandEffectBaseOffset = 0.03
ClientConst.HOME_PET_EVENT_RETURN_COLLISION_DURATION = 6
ClientConst.EntityEditorOutlinePriority = {
	MaxPriority = 6,
	Default = 1,
	Env = 2,
	PreMultiSelect = 5,
	MutiSelect = 4,
	Edit = 3
}
ClientConst.EditorEffectVisibleReason = {
	GroupEdit = 3,
	Default = 1,
	EditMode = 2
}
ClientConst.EntityCount = {
	CREATED = 2,
	CREATING = 1,
	NOT_CREATED = 0,
	BILLBOARD = 3
}
ClientConst.CustomVariable = {
	TWIN_PET_SELECTION = 1137
}
ClientConst.SetTimePeriod = 1
ClientConst.SetTime = 2
ClientConst.SHORT_NUMBER_UNIT_WITHOUT_SEPARATOR_BY_LANGUAGE = {
	[ClientConst.LANGUAGE_TYPE_MAP.ko_KR] = true
}
ClientConst.WEATHER_REASON_KEY = {
	DIALOGUE = "dialogue",
	PHOTO = "photo"
}
ClientConst.TodScene = {
	["$RuntimeLevel_BW_CountryOfTime.unity"] = ClientConst.SetTimePeriod,
	["$Level_FB_Ark_Voxelmission.unity"] = ClientConst.SetTimePeriod,
	["$RuntimeLevel_BW_GrabEggs.unity"] = ClientConst.SetTimePeriod,
	["$Level_BW_GrabEggs_Clip.unity"] = ClientConst.SetTimePeriod,
	["$RuntimeLevel_FB_Home.unity"] = ClientConst.SetTimePeriod,
	["$RuntimeLevel_BW_CountryOfTime_Water.unity"] = ClientConst.SetTimePeriod,
	["$Level_Test_CombatAnd3C.unity"] = ClientConst.SetTimePeriod,
	["$RuntimeLevel_FB_Roguelike.unity"] = ClientConst.SetTime,
	["$RuntimeLevel_FB_PhotoStudio.unity"] = ClientConst.SetTime
}
ClientConst.TodSceneSceneId = {
	[5010002] = ClientConst.SetTime,
	[515] = ClientConst.SetTimePeriod,
	[550] = ClientConst.SetTimePeriod
}
ClientConst.InputButtonType = {
	Middle = 2,
	Right = 1,
	Left = 0
}
ClientConst.DEBUG_PAY_URL = {
	feature = "http://10.8.45.98:19011/pcpay",
	["Aniimo-TW"] = "http://47.84.119.86:19011/pcpay",
	ver001 = "http://10.8.45.77:19011/pcpay",
	["PS-Review"] = "http://8.219.229.123:19011/pcpay",
	["Review-CN2"] = "http://101.35.93.213:19011/pcpay",
	release = "http://10.8.45.64:19011/pcpay"
}
ClientConst.DIALOGUE_GRAPH_PLAY_APPROXIMATELY_EPS = 5
ClientConst.UI_CALL_UNLOAD_UNUSED_FUNC_MIN_SECONDS_CD = 120
ClientConst.AnimationTagMask = {
	None = TagMask.None,
	Movement = TagMask.Movement,
	Air = TagMask.Air,
	AIRootMotion = TagMask.AIRootMotion,
	Skill = TagMask.Skill,
	Hit = TagMask.Hit,
	Loco = TagMask.Loco,
	Idle = TagMask.Idle,
	Walk = TagMask.Walk,
	Run = TagMask.Run,
	Dash = TagMask.Dash,
	Sprint = TagMask.Sprint,
	Jump = TagMask.Jump,
	Fall = TagMask.Fall,
	Land = TagMask.Land,
	Crouch = TagMask.Crouch,
	Climb = TagMask.Climb,
	Glide = TagMask.Glide,
	Swim = TagMask.Swim,
	Fly = TagMask.Fly,
	HoldBall = TagMask.HoldBall,
	Magnesis = TagMask.Magnesis,
	ThrowBall = TagMask.ThrowBall,
	EdgeBlock = TagMask.EdgeBlock,
	SpeedBurst = TagMask.SpeedBurst,
	SkillRoll = TagMask.SkillRoll,
	LookAt = TagMask.LookAt,
	Sneak = TagMask.Sneak,
	Drumming = TagMask.Drumming,
	ActionStartNoTransition = TagMask.ActionStartNoTransition,
	ClimbSwitching = TagMask.ClimbSwitching,
	CameraModeBone = TagMask.CameraModeBone,
	FootIK = TagMask.FootIK,
	Behav = TagMask.Behav,
	GravityLow = TagMask.GravityLow,
	NoAutoExit = TagMask.NoAutoExit,
	NeedArmOpen = TagMask.NeedArmOpen,
	NoCloth = TagMask.NoCloth,
	DBNO = TagMask.DBNO,
	Sleep = TagMask.Sleep,
	Max = TagMask.Max
}
ClientConst.TimeUnitMap = {
	{
		"毫秒",
		""
	},
	{
		"天",
		"DAY"
	},
	{
		"时",
		"HOUR"
	},
	{
		"分",
		"MINUTE"
	},
	{
		"秒",
		"SECOND"
	}
}

return ClientConst
