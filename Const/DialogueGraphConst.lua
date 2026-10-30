-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\DialogueGraphConst.lua

local UIConst = require("Const.UIConst")
local DialogueGraphConst = {
	ENTITY_PLAYER_SET_POSITION_DISTANCE_MAX = 25,
	ENTITY_PUPPET_SET_POSITION_DISTANCE_MAX = 40,
	DIALOGUE_GRAPH_ID_NAMING = 52753679,
	DIALOGUE_GRAPH_PLAY_APPROXIMATELY_EPS = 0.1,
	SKIPPING_DURATION = 1,
	SKIP_FLOW_TRIGGER_DELAY = 0.5,
	SKIPPING_WAIT_REPEAT_TIME = 0.1,
	SKIP_PLAY_SPEED = 100,
	ENTITY_CUSTOM_STATIC_ID_MAX = 10,
	MONSTER_PAUSE_AI_RANGE = 20,
	RET_FLAG_FAILED = -1,
	RET_FLAG_SUCCESS = 0,
	RES_ID = "$DialogueGraph_%d.asset",
	NODE_FUNC_TYPE = {
		DIALOGUE_SET_MODEL = "setDialogueGraphModel",
		CAMERA_PLAYER_SET_ZOOM_AND_ROTATION = "setPlayerCameraZoomAndRotation",
		DIALOGUE_GET_DIALOGSET_POSITION_BY_ID = "getDialogsetPositionByID",
		CAMERA_APPLY_BLEND_TO_FIXED = "applyCameraBlendToFixed",
		DIALOGUE_GET_DIALOGSET_POSITION_BY_INDEX = "getDialogsetPositionByIndex",
		CAMERA_CANCEL_BLEND_TO_FIXED = "cancelBlendToFixed",
		DIALOGUE_SHOW_DIALOG = "showDialog",
		CAMERA_BLEND_TO_FIXED = "cameraBlendToFixed",
		CONDITION_CHECK_TRIGGER = "isCompleteCondition",
		CAMERA_ENABLE_NPC_DIALOGUE_CAMERA = "enableNpcDialogueCamera",
		CONDITION_CHECK_STATUS = "conditionCheckStatus",
		UI_WAIT_CLOSE = "waitUIClose",
		SCENE_SET_CHARACTER_FILL_LIGHT = "setCharacterFillLight",
		UI_CLOSE_UI = "closeUI",
		SCENE_ATTACH_TO_GRAPH_ROOT = "attachToGraphRoot",
		UI_SHOW_UI = "showUI",
		SCENE_RESET_VOLUME = "resetVolume",
		UI_CLOSE_WHITE_SCREEN = "closeWhiteScreen",
		SCENE_STOP_VOLUME_ANIMATION = "stopVolumeAnimation",
		UI_SHOW_WHITE_SCREEN = "showWhiteScreen",
		SCENE_DISABLE_VOLUME = "disableVolume",
		UI_CLOSE_BLACK_SCREEN = "closeBlackScreen",
		SCENE_APPLY_VOLUME = "applyVolume",
		UI_SHOW_BLACK_SCREEN = "showBlackScreen",
		SCENE_STOP_LOCAL_ENVIRONMENT = "stopLocalEnvironment",
		DIALOGUE_GET_DIALOGSET_ENTITY_ID_BY_INDEX = "getDialogsetEntityIdByIndex",
		SCENE_START_LOCAL_ENVIRONMENT = "startLocalEnvironment",
		DIALOGUE_GET_DIALOGSET_ENTITY_ID_BY_ID = "getDialogsetEntityIdByID",
		SCENE_DISABLE_LOCAL_WIND = "disableLocalWind",
		ENTITY_STOP_FACIAL_ANIMATION = "stopEntityFacialAnimation",
		SCENE_START_LOCAL_WIND = "startLocalWind",
		ENTITY_PLAY_FACIAL_ANIMATION = "playEntityFacialAnimation",
		SCENE_STOP_ENTITY_LIGHT = "stopEntityLight",
		ENTITY_STOP_ANIMATION = "stopEntityAnimation",
		SCENE_DISABLE_ENTITY_LIGHT = "disableEntityLight",
		ENTITY_PLAY_ANIMATION = "playEntityAnimation",
		DIALOGUE_ENTER_DIALOGUE_PRESET = "enterDialoguePreset",
		ENTITY_CHANGE_STATE = "changeEntityState",
		DIALOGUE_STOP_SIMPLE_NPC_CALL_ANIM = "stopSimpleNpcCallAnim",
		ENTITY_STEER = "steerEntity",
		DIALOGUE_PLAY_SIMPLE_NPC_CALL_ANIM = "playSimpleNpcCallAnim",
		ENTITY_START_MOVE = "startEntityMove",
		DIALOGUE_CLOSE_DIALOG = "closeDialog",
		ENTITY_CANCEL_MULTI_LOOK_AT = "cancelMultiLookAt",
		DIALOGUE_GET_DIALOGSET_ROTATION_BY_INDEX = "getDialogsetRotationByIndex",
		ENTITY_MULTI_LOOK_AT = "multiLookAt",
		DIALOGUE_GET_DIALOGSET_ROTATION_BY_ID = "getDialogsetRotationByID",
		ENTITY_FORBID_POSITION_CHECK = "forbidPositionCheck",
		SET_FUN_TYPE_STATE_CHECK_SET_MODE = "setFuncTypeStateCheckSetMode",
		ENTITY_TRY_DETACH_FROM_VEHICLE = "tryDetachFromVehicle",
		INIT_ON_NODE_START = "initOnNodeStart",
		ENTITY_ENTITY_CANCEL_CAST_ABILITY = "entityCancelAbility",
		DIALOGUE_START_GUIDE = "startGuide",
		ENTITY_ENTITY_CAST_ABILITY = "entityCastAbility",
		DIALOGUE_TRIGGER_CUSTOM_CALLBACK = "triggerCustomCallback",
		ENTITY_SHOW_BUBBLE_EMOJI = "entityShowBubbleEmoji",
		DIALOGUE_CLEAR_NPC_OBSERVE = "clearNpcObserve",
		ENTITY_CANCEL_LOOK_AT_ROLE = "cancelLookAtRole",
		DIALOGUE_OPEN_NPC_OBSERVE = "openNpcObserve",
		ENTITY_LOOK_AT_ROLE = "lookAtRole",
		DIALOGUE_IS_AUTO_PLAYING = "isAutoPlaying",
		ENTITY_CAN_PLAY_SPECIAL_IDLE = "canPlaySpecialIdleInDialogueGraph",
		DIALOGUE_DISABLE_SKIP = "disableSkip",
		ENTITY_SET_ANIM_SPEED = "setEntityAnimSpeed",
		DIALOGUE_ENABLE_SKIP = "enableSkip",
		ENTITY_RESUME_BT = "resumeBt",
		DIALOGUE_DO_EVENT = "doEventByData",
		ENTITY_PAUSE_BT = "pauseBt",
		DIALOGUE_APPLY_DIALOGSET_CAMERA = "applyDialogsetCamera",
		ENTITY_STOP_AUTO_PATH_FINDING = "stopEntityAutoPathFinding",
		DIALOGUE_CANCEL_PENDING_DIALOGSET = "cancelPendingDialogset",
		ENTITY_AUTO_PATH_FINDING = "entAutoPathFinding",
		DIALOGUE_ENTER_DIALOGSET = "enterDialogset",
		ENTITY_TRY_ATTACH_ON_VEHICLE = "tryAttachOnVehicle",
		DIALOGUE_STOP_PLOT_PHONE_CALL_ANIM = "stopPlotPhoneCallAnim",
		ENTITY_SET_ENTITY_TAKE_OVER = "setEntityTakeOver",
		DIALOGUE_PLAY_PLOT_PHONE_CALL_ANIM = "playPlotPhoneCallAnim",
		ENTITY_CHECK_ENTITY_TAKE_OVER = "checkEntityTakeOver",
		DIALOGUE_EXIT_PRESET = "exitDialoguePreset",
		PLAYER_SWITCH_CROUCH = "switchCrouch",
		DYNAMIC_VALUE_CREATE_COLOR_GRADIENT = "getOrCreateColorGradientValue",
		PLAYER_SWITCH_PET = "switchPet",
		DYNAMIC_VALUE_CREATE_DISTANCE = "getOrCreateDynamicDistanceValue",
		PLAYER_STATE_ON_DISMOUNT = "onDismount",
		DYNAMIC_VALUE_BIND = "bindDynamicValue",
		PLAYER_STATE_ON_MOUNT = "onMount",
		SCENE_START_LIGHT = "startLight",
		SCENE_RESET_VEGETATION_CULLING = "resetVegetationCulling",
		SCENE_DISABLE_LIGHT = "disableLight",
		SCENE_SET_VEGETATION_CULLING_DISABLED = "setVegetationCullingDisabled",
		SCENE_STOP_LIGHT = "stopLight",
		TOD_RESET_WEATHER = "resetWeather",
		SCENE_START_ENTITY_LIGHT = "startEntityLight",
		TOD_CHANGE_WEATHER = "changeWeather",
		DYNAMIC_VALUE_CREATE_ANIMATION_CURVE = "getOrCreateAnimationCurveValue",
		EFFECT_STOP = "stopPlayEffect",
		ENTITY_AI_CHECK_RUNNING = "checkEntityAIRunning",
		EFFECT_PLAY = "playEffect",
		ENTITY_PLAY_SWITCH_TO_PLAYER = "playSwitchToPlayer",
		EFFECT_GET_GENERATOR_ID = "getEffectGeneratorId",
		ENTITY_PLAY_SWITCH_TO_PET = "playSwitchToPet",
		STOP_SOUND = "stopSound",
		ENTITY_CREATE_REF_VIRTUAL = "createRefVirtualEntity",
		PLAY_SOUND = "playSound",
		ENTITY_GET_OR_CREATE_HOME_FACILITY_PROXY = "getOrCreateHomeFacilityProxy",
		UNPRELOAD_CUTSCENE = "unPreloadCutScene",
		ENTITY_GET_SANDBOX_LEVEL_ITEM_TRANSFORM = "getSandboxLevelItemTransform",
		PRELOAD_CUTSCENE = "preloadCutscene",
		ENTITY_IS_PLAYER_IDLE = "isPlayerIdle",
		PLAY_CUTSCENE = "playCutscene",
		ENTITY_RESET_PLAYER_ACTIONS = "resetPlayerActions",
		CAMERA_RESET_DIALOGSET = "resetDialogsetCamera",
		ENTITY_IS_IDLE = "isEntityIdle",
		CAMERA_STOP_SHAKE = "stopCameraShake",
		ENTITY_PLAY_VISIBILITY_EFFECTS = "playEntitiesVisibilityEffect",
		CAMERA_START_SHAKE = "startCameraShake",
		ENTITY_PLAY_VISIBILITY_EFFECT = "playEntityVisibilityEffect",
		CAMERA_APPLY_DOF = "applyCameraDof",
		ENTITY_DISABLE_DIALOGUE_CONTROLLER = "disableEntityDialogueController",
		CAMERA_SET_DOF_ACTIVE = "setCameraDofActive",
		ENTITY_PLAY_ANIMATOR_STATE = "playAnimatorState",
		CAMERA_CANCEL_GRAPH_BLEND = "cancelGraphCameraBlend",
		CAMERA_START_GRAPH_BLEND = "startGraphCameraBlend",
		CAMERA_PLAYER_CANCEL_MODIFY_INFO = "cancelModifyPlayerCameraInfo",
		CAMERA_PLAYER_MODIFY_INFO = "modifyPlayerCameraInfo"
	},
	NODE_PRIORTTY = {
		RESTRICTED = 5,
		CRITICAL = 4,
		HIGH = 3,
		MED = 2,
		LOW = 1
	},
	PRIORITY = {
		MED = 500,
		LOW = 0,
		HIGH = 1000,
		EXTREME_LOW = -1
	},
	PLAYBACK_DECISION = {
		QUEUE = 2,
		PARALLEL = 1,
		DISCARD = 4,
		INTERRUPT = 3
	},
	DIALOGUE_GRAPH_STATE = {
		NONE = 0,
		DESTROY = 4,
		STOP = 3,
		PLAYING = 2,
		READY = 1
	},
	PLAYBACK_PERMISSION = {
		SKIP = 4,
		AUTO_PLAY = 2,
		TURN_ON = 1,
		NONE = 0,
		SKIP_DISABLED_FORCE = 8
	},
	PLAYBACK_STATE = {
		NONE = 0,
		NORMAL = 1,
		AUTO_PLAYING = 2,
		SKIPPING = 3
	},
	FINISHED_REASON = {
		INTERRUPTED_LOADING_FAILED = "INTERRUPTED_LOADING_FAILED",
		INTERRUPTED_FORCE_CLOSE_SERVER = "INTERRUPTED_FORCE_CLOSE_SERVER",
		INTERRUPTED_FORCE_CLOSE_EDITOR = "INTERRUPTED_FORCE_CLOSE_EDITOR",
		INTERRUPTED_LEAVE_SCENE = "INTERRUPTED_LEAVE_SCENE",
		INTERRUPTED_DISCONNECTED = "INTERRUPTED_DISCONNECTED",
		INTERRUPTED_CLEAR = "INTERRUPTED_CLEAR",
		INTERRUPTED_PLAYING = "INTERRUPTED_PLAYING",
		INTERRUPTED_PRIORITY = "INTERRUPTED_PRIORITY",
		INTERRUPTED_CRITICAL = "INTERRUPTED_CRITICAL",
		FINISHED = "FINISHED"
	},
	MODEL_TYPE = {
		CUSTOM = 3,
		NORMAL = 1,
		FREEDOM = 2
	},
	MODE_TYPE = {
		Control = 2,
		Freedom = 1,
		None = 0
	},
	HideAllUIWhiteList = {
		[UIConst.UI_ID_TOPLOGO] = true,
		[UIConst.UI_ID_NPC_CALL] = true,
		[UIConst.UI_ID_SKIP_PANEL] = true,
		[UIConst.UI_ID_DIALOGUE_ID] = true,
		[UIConst.UI_ID_GUIDE_PANEL] = true,
		[UIConst.UI_ID_NET_LOADING] = true,
		[UIConst.UI_ID_AI_ASSISTANT] = true,
		[UIConst.UI_ID_QTE_TIMELINE] = true,
		[UIConst.UI_ID_FISHING_CAPTURE_CONTRACT] = true,
		[UIConst.UI_ID_BLACK_SCREEN] = true,
		[UIConst.UI_ID_WHITE_SCREEN] = true,
		[UIConst.UI_PHOTO_SHOW_TIP] = true,
		[UIConst.UI_ID_DIALOG_REVIEW] = true,
		[UIConst.UI_ID_SUBTITLES_PANEL] = true,
		[UIConst.UI_ID_PLOT_PHONE_CALL] = true,
		[UIConst.UI_ID_BOTTOM_DIALOGUE] = true,
		[UIConst.UI_ID_CONFIG_TOPPING] = true,
		[UIConst.UI_ID_COMMON_CONFIRM] = true,
		[UIConst.UI_ID_DIALOGUE_SKIP] = true,
		[UIConst.UI_ID_GUIDE_POPUP_PANEL] = true,
		[UIConst.UI_ID_PET_SELECTION_PANEL] = true,
		[UIConst.UI_ID_COMMON_SKIP_PANEL] = true,
		[UIConst.UI_ID_BLACK_SCREEN_SKIP_PANEL] = true,
		[UIConst.UI_ID_SCENE_SELECTION_PANEL] = true,
		[UIConst.UI_ID_NATURAL_SELECTION_PANEL] = true,
		[UIConst.UI_ID_BLACK_CHANGE] = true
	},
	MobilePlatformWhiteList = {
		[UIConst.UI_ID_HUD_MOBILE_OPERATE] = true
	},
	CloseAllPanelWhiteList = {
		[UIConst.UI_ID_DEAD_PANEL] = true
	},
	GraphType = {
		SinglePlayer = 1,
		MultiPlayer = 2
	},
	EntityType = {
		HomeFacility = 5,
		VirtualEntity = 4,
		Pawn = 3,
		Puppet = 2,
		PlayerPet = 1,
		Player = 0
	},
	VIRTUAL_ENTITY_TYPE = {
		PLAYER_MATE_4 = 7,
		PLAYER_MATE_3 = 6,
		PLAYER_MATE_2 = 5,
		PLAYER_MATE_1 = 4,
		PLAYER_PET = 3,
		NPC = 2,
		PLAYER = 1
	},
	SETTING_KEY = {
		DIALOGUE_GRAPH_PLAY_SPEED = "playSpeed",
		DIALOGUE_GRAPH_AUTO_PLAY = "autoPlay"
	},
	DialogsetEnterType = {
		Move = 2,
		Teleport = 1
	},
	DialogsetSlotType = {
		Npc = 3,
		MainPlayerPet = 2,
		MainPlayer = 1,
		VirtualNpc = 4
	},
	PositionSyncType = {
		KeepSync = 1,
		PauseSync = 0,
		Dynamic = 2
	},
	SideEffectCategory = {
		Commit = 1,
		Rollbackable = 1,
		IdempotentCommit = 2
	},
	EventBlockWhiteList = {
		"Camera/ShowCursor"
	}
}
local FUNC_TYPE = DialogueGraphConst.NODE_FUNC_TYPE
local NODE_PRIORTTY = DialogueGraphConst.NODE_PRIORTTY

DialogueGraphConst.NODE_FUNC_MAP = {
	[FUNC_TYPE.DIALOGUE_SET_MODEL] = {
		priority = NODE_PRIORTTY.HIGH,
		stateCheckFunc = FUNC_TYPE.SET_FUN_TYPE_STATE_CHECK_SET_MODE
	},
	[FUNC_TYPE.DIALOGUE_SHOW_DIALOG] = {
		cancelFunc = FUNC_TYPE.DIALOGUE_CLOSE_DIALOG,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_CLOSE_DIALOG] = {
		relatedFunc = FUNC_TYPE.DIALOGUE_SHOW_DIALOG,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_PLAY_SIMPLE_NPC_CALL_ANIM] = {
		cancelFunc = FUNC_TYPE.DIALOGUE_STOP_SIMPLE_NPC_CALL_ANIM,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_STOP_SIMPLE_NPC_CALL_ANIM] = {
		relatedFunc = FUNC_TYPE.DIALOGUE_PLAY_SIMPLE_NPC_CALL_ANIM,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_ENTER_DIALOGUE_PRESET] = {
		cancelFunc = FUNC_TYPE.DIALOGUE_EXIT_PRESET,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_EXIT_PRESET] = {
		relatedFunc = FUNC_TYPE.DIALOGUE_ENTER_DIALOGUE_PRESET,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_PLAY_PLOT_PHONE_CALL_ANIM] = {
		cancelFunc = FUNC_TYPE.DIALOGUE_STOP_PLOT_PHONE_CALL_ANIM,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.DIALOGUE_STOP_PLOT_PHONE_CALL_ANIM] = {
		relatedFunc = FUNC_TYPE.DIALOGUE_PLAY_PLOT_PHONE_CALL_ANIM,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.UI_SHOW_BLACK_SCREEN] = {
		cancelFunc = FUNC_TYPE.UI_CLOSE_BLACK_SCREEN,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.UI_CLOSE_BLACK_SCREEN] = {
		relatedFunc = FUNC_TYPE.UI_SHOW_BLACK_SCREEN,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.UI_SHOW_WHITE_SCREEN] = {
		cancelFunc = FUNC_TYPE.UI_CLOSE_WHITE_SCREEN,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.UI_CLOSE_WHITE_SCREEN] = {
		relatedFunc = FUNC_TYPE.UI_SHOW_WHITE_SCREEN,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.UI_SHOW_UI] = {
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.CAMERA_ENABLE_NPC_DIALOGUE_CAMERA] = {
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.CAMERA_BLEND_TO_FIXED] = {
		cancelFunc = FUNC_TYPE.CAMERA_CANCEL_BLEND_TO_FIXED,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.CAMERA_APPLY_BLEND_TO_FIXED] = {
		cancelFunc = FUNC_TYPE.CAMERA_CANCEL_BLEND_TO_FIXED,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.CAMERA_PLAYER_SET_ZOOM_AND_ROTATION] = {
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.CAMERA_CANCEL_BLEND_TO_FIXED] = {
		relatedFunc = FUNC_TYPE.CAMERA_BLEND_TO_FIXED
	},
	[FUNC_TYPE.CAMERA_PLAYER_MODIFY_INFO] = {
		cancelFunc = FUNC_TYPE.CAMERA_PLAYER_CANCEL_MODIFY_INFO,
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.CAMERA_PLAYER_CANCEL_MODIFY_INFO] = {},
	[FUNC_TYPE.PLAY_CUTSCENE] = {
		priority = NODE_PRIORTTY.CRITICAL
	},
	[FUNC_TYPE.TOD_CHANGE_WEATHER] = {
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.TOD_RESET_WEATHER] = {
		priority = NODE_PRIORTTY.HIGH
	},
	[FUNC_TYPE.PLAYER_STATE_ON_MOUNT] = {
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.PLAYER_STATE_ON_DISMOUNT] = {
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.PLAYER_SWITCH_PET] = {
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.PLAYER_SWITCH_CROUCH] = {
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.ENTITY_SET_ENTITY_TAKE_OVER] = {
		priority = NODE_PRIORTTY.HIGH,
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.ENTITY_TRY_ATTACH_ON_VEHICLE] = {
		priority = NODE_PRIORTTY.HIGH,
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.ENTITY_AUTO_PATH_FINDING] = {
		priority = NODE_PRIORTTY.HIGH,
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	},
	[FUNC_TYPE.ENTITY_PAUSE_BT] = {
		cancelFunc = FUNC_TYPE.ENTITY_RESUME_BT
	},
	[FUNC_TYPE.ENTITY_RESUME_BT] = {
		relatedFunc = FUNC_TYPE.ENTITY_PAUSE_BT
	},
	[FUNC_TYPE.ENTITY_LOOK_AT_ROLE] = {
		cancelFunc = FUNC_TYPE.ENTITY_CANCEL_LOOK_AT_ROLE
	},
	[FUNC_TYPE.ENTITY_CANCEL_LOOK_AT_ROLE] = {
		relatedFunc = FUNC_TYPE.ENTITY_LOOK_AT_ROLE
	},
	[FUNC_TYPE.ENTITY_ENTITY_CAST_ABILITY] = {
		relatedFunc = FUNC_TYPE.ENTITY_ENTITY_CANCEL_CAST_ABILITY
	},
	[FUNC_TYPE.ENTITY_ENTITY_CANCEL_CAST_ABILITY] = {
		relatedFunc = FUNC_TYPE.ENTITY_ENTITY_CAST_ABILITY,
		checkFunc = FUNC_TYPE.ENTITY_CHECK_ENTITY_TAKE_OVER
	}
}
DialogueGraphConst.PRIORITY_MAP = {
	[DialogueGraphConst.PRIORITY.EXTREME_LOW] = {
		[DialogueGraphConst.PRIORITY.EXTREME_LOW] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT,
		[DialogueGraphConst.PRIORITY.LOW] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT,
		[DialogueGraphConst.PRIORITY.MED] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT,
		[DialogueGraphConst.PRIORITY.HIGH] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT
	},
	[DialogueGraphConst.PRIORITY.LOW] = {
		[DialogueGraphConst.PRIORITY.EXTREME_LOW] = DialogueGraphConst.PLAYBACK_DECISION.DISCARD,
		[DialogueGraphConst.PRIORITY.LOW] = DialogueGraphConst.PLAYBACK_DECISION.PARALLEL,
		[DialogueGraphConst.PRIORITY.MED] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT,
		[DialogueGraphConst.PRIORITY.HIGH] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT
	},
	[DialogueGraphConst.PRIORITY.MED] = {
		[DialogueGraphConst.PRIORITY.EXTREME_LOW] = DialogueGraphConst.PLAYBACK_DECISION.DISCARD,
		[DialogueGraphConst.PRIORITY.LOW] = DialogueGraphConst.PLAYBACK_DECISION.PARALLEL,
		[DialogueGraphConst.PRIORITY.MED] = DialogueGraphConst.PLAYBACK_DECISION.QUEUE,
		[DialogueGraphConst.PRIORITY.HIGH] = DialogueGraphConst.PLAYBACK_DECISION.INTERRUPT
	},
	[DialogueGraphConst.PRIORITY.HIGH] = {
		[DialogueGraphConst.PRIORITY.EXTREME_LOW] = DialogueGraphConst.PLAYBACK_DECISION.DISCARD,
		[DialogueGraphConst.PRIORITY.LOW] = DialogueGraphConst.PLAYBACK_DECISION.PARALLEL,
		[DialogueGraphConst.PRIORITY.MED] = DialogueGraphConst.PLAYBACK_DECISION.QUEUE,
		[DialogueGraphConst.PRIORITY.HIGH] = DialogueGraphConst.PLAYBACK_DECISION.QUEUE
	}
}
DialogueGraphConst.ModelTypeMap = {
	[DialogueGraphConst.MODEL_TYPE.NORMAL] = {
		resetAllActions = true,
		blockEvent = true,
		exitCatchMode = true,
		hideTopLogo = true,
		hideAllUI = true
	},
	[DialogueGraphConst.MODEL_TYPE.FREEDOM] = {
		hideTopLogo = true,
		hideAllUI = true
	},
	[DialogueGraphConst.MODEL_TYPE.CUSTOM] = {}
}
DialogueGraphConst.BlendFunction = {
	EaseInOut = 3,
	EaseOut = 2,
	EaseIn = 1,
	Linear = 0,
	Cubic = 4
}
DialogueGraphConst.MovementType = {
	OrbitalMovement = 2,
	LocalMovement = 1,
	SelfRotation = 3,
	None = 0
}
DialogueGraphConst.MovementMode = {
	Loop = 1,
	Once = 0,
	PingPong = 2
}

local VirCamBlendFunction = CS.FunPlus.WorldX.VirtualCamera.VirtualCameraBlendFunction

DialogueGraphConst.CameraBlendFunction = {
	Linear = VirCamBlendFunction.Linear,
	EaseIn = VirCamBlendFunction.EaseIn,
	EaseOut = VirCamBlendFunction.EaseOut,
	EaseInOut = VirCamBlendFunction.EaseInOut,
	Cubic = VirCamBlendFunction.Cubic
}
DialogueGraphConst.DIALOGUE_GRAPH_LEGACY_TOPLOGO_COMPONENTS = {
	"multiPlayer"
}
DialogueGraphConst.DIALOGUE_STATE_KEY = {
	DISABLE_SPACE_FOLLOW = "disableSpaceFollow",
	STATE_CONFLICT = "stateConflict",
	HIDE_MARK_SHARE = "hideMarkShare",
	HIDE_INTERACTION_SIGN = "hideInteractionSign",
	HIDE_COMBAT_PUPPET = "hideCombatPuppet",
	HIDE_ENTITIES = "hideEntities",
	HIDE_TOP_LOGO = "hideTopLogo",
	HIDE_ALL_UI = "hideAllUI",
	AMBIENT_INTENSITY = "ambientIntensity"
}

return DialogueGraphConst
