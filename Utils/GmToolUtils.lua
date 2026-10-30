-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\GmToolUtils.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local DialogueGraphPerformance = require("GameApp.DialogueGraph.DialogueGraphRuntime.Core.Performance")
local PrefsCacheUtils = require("Utils.PrefsCacheUtils")
local logger = LoggerManager.getLogger("GmToolUtils")
local ClientUtils = require("Utils.ClientUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local SandboxConst = require("Common.Const.SandboxConst")
local ClientSwitch = require("Common.ClientSwitch")
local Switch = require("Core.Common.Switch")
local CallbackHandler = require("Core.Common.CallbackHandler")
local EventConst = require("Const.EventConst")
local EffectConst = require("Const.EffectConst")
local UIConst = require("Const.UIConst")
local MessageName = require("Const.MessageName")
local ResPointConst = require("Common.Const.ResPointConst")
local HomeSeasonCelebrationTestConst = require("Common.Const.HomeSeasonCelebrationTestConst")
local GroupBehaviourConst = require("Common.Const.GroupBehaviourConst")
local AiConst = require("Common.Const.AiConst")
local GhostEyeConst = require("Common.Const.GhostEyeConst")
local json = require("json")
local HotkeyConst = require("Const.HotkeyConst")
local GlobalData = require("Core.Client.GlobalData")
local GMCMDList = require("Common.Data.gm_ist_list")
local DyeConfigData = require("Common.Data.ParmonDyeData.dye_config_data")
local ModelPrefabResId2AvatarName = require("Common.Data.model_prefab_res_id_2_avatar_name")
local RankBaseData = require("Data.rank_base_data")
local TimerManager = require("Core.Timer.TimerManager")
local PetFirstShowData = require("Data.pet_first_show_data")
local PetResearchContentData = require("Data.pet_research_content_data")
local GuidenceItemData = require("Data.guidence_item_data")
local HomelandDemoCmdImplement = require("GameApp.CmdSocket.HomelandDemoCmdImplement")
local PuppetData = require("Data.puppet_data")
local PetData = require("Data.pet_data")
local PetBasePrototypeData = require("Data.pet_base_prototype_data")
local SceneData = require("Data.scene_data")
local ItemData = require("Data.item_data")
local HomeObjectData = require("Data.home_object_data")
local NavMeshServiceUtils = require("Common.Utils.NavMeshServiceUtils")
local EnvObjData = require("Data.envobj_data")
local PlatformAchievementRuleConfig = require("SDK.Platform.PlatformAchievementRuleConfig")
local PlatformAchievementService = require("SDK.Platform.PlatformAchievementService")
local AIDebugger = require("Common.AI.Behaviac.Debugger")
local ClientTextUtils = require("Utils.ClientTextUtils")
local GameStringConfig = require("Data.gamestring_config_data")
local GameStringHash = require("Data.gamestring_hash_data")
local GmAnnotationI18nMap = require("Utils.GmAnnotationI18nMap")
local Utils = require("Common.Utils.Utils")
local AbilityUtils = require("Common.Utils.AbilityUtils")
local PetSkillData = require("Data.pet_skill_data")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local ItemUtils = require("Common.Utils.ItemUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local SysConfigData = require("Data.sys_config_data")
local scene_data = require("Data.scene_data")
local ContinuousButtonQteClip = require("GameApp.Qte.ContinuousButtonQteClip")
local RobEggConst = require("Common.Const.RobEggConst")
local AbilityConst = require("Common.Const.AbilityConst")
local CaptureConst = require("Common.Const.CaptureConst")
local AttributeConstHelper = require("GameApp.Ability.AttributeConstHelper")
local AsrHttpClient = require("Utils.AsrHttpClient")
local HomelandReportUtils = require("Utils.HomelandReportUtils")
local WorldRaceDebugView = require("Utils.WorldRaceDebugView")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")
local AbilityDataInspect = CS.FunPlus.WorldX.Ability.AbilityDataInspect
local AbilityAutoTest = CS.FunPlus.WorldX.Ability.AbilityAutoTest
local GmToolUtils = {
	bugReportType = "bug",
	fullSearch = true,
	openGI = true,
	openMask = false,
	quickMoveEnabled = false,
	hasInitGmList = false,
	closePhotoMark = false,
	GmDofState = false,
	CMDListPrefix = "Common.Data.GmIstData.",
	bugReportImageList = {},
	GmRenderSetting = {},
	GmRenderScope = {
		AllCameras = "all",
		WorldCamera = "world"
	},
	gmRenderGlobalOverrideKeys = {},
	GmRenderAllCameraIgnoredFlags = {
		m_VrrMaskValue = true,
		m_UseCustomCameraShowFlags = true,
		m_EnableParticlesBatching = true
	},
	GmDofValueCache = {},
	FuncStyle = {
		ImageList = 4
	},
	FuncTabLabel = {
		Performance = "GM_TAB_PERFORMANCE",
		AddPet = "GM_ADD_PET",
		Ark = "ARK",
		Debug = "Debug",
		ChooseScene = "DEBUG_FUNC_CHOOSE_SCENE",
		Common = "GM_COMMON",
		Ability = "Ability",
		Favorite = "GM_FAVORITE",
		RecentlyUse = "GM_RECENTLY_USE",
		XboxAchievement = "GM_TAB_XBOX_ACHIEVEMENT",
		Achievement = "GM_TAB_ACHIEVEMENT",
		Temporary = "GM_TAB_TEMPORARY",
		PVHelper = "PV",
		Avatar = "Avatar",
		Pandora = "GM_TAB_OPERATION_PLATFORM",
		TeleportToSandbox = "GM_TAB_TELEPORT_SANDBOX",
		DialogueGraph = "GM_DIALOGUE_GRAPH",
		AIClient = "AI_Client",
		BugReport = "BugReport",
		Profile = "Profile",
		Language = "GM_TAB_LOCALIZATION",
		Photo = "GM_TAB_PHOTO",
		AddEnvObj = "GM_TAB_ADD_ENV_OBJ",
		MultiCMD = "GM_TAB_MULTI_COMMAND",
		AddPuppet = "GM_ADD_PUPPET",
		Render = "RENDER",
		AddItem = "GM_ADD_ITEM"
	},
	obsoleteData = {
		name = "obsolete",
		id = 0,
		label = "obsolete",
		iconName = "10011"
	},
	StyleType = {
		MutilParam = 3,
		Cell2List = 2,
		Cell3List = 1,
		IconList = 4
	},
	Cell3ListSubStyleType = {
		Switch = 0,
		ChoiceList = 1,
		Button = 2
	},
	Cell2ListSubStyleType = {
		Confirm = 0
	},
	obCameraSettingSubItems = {
		MoveItem = {
			label = "GM_LABEL_L120",
			saveKey = "obCameraSettingSubItemsMoveItem",
			defaultValue = "1",
			style = 0,
			paramType = "number"
		},
		RotationItem = {
			label = "GM_LABEL_L121",
			saveKey = "obCameraSettingSubItemsRotationItem",
			defaultValue = "1",
			style = 0,
			paramType = "number"
		},
		FOVScollItem = {
			label = "GM_LABEL_L122",
			saveKey = "obCameraSettingSubItemsFOVScollItem",
			defaultValue = "1",
			style = 0,
			paramType = "number"
		}
	}
}
local GM_LANGUAGE_ZH_CN = ClientConst.LANGUAGE_TYPE_MAP.zh_CN
local GM_LANGUAGE_EN = ClientConst.LANGUAGE_TYPE_MAP.en
local GM_CHINESE_GAME_LANGUAGES = {
	[ClientConst.LANGUAGE_TYPE_MAP.zh_CN] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.zh_TW] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.ko_KR] = true,
	[ClientConst.LANGUAGE_TYPE_MAP.ja_JP] = true
}

function GmToolUtils.getGmLanguage()
	local gameLanguage = pg.languageType or 0

	return GM_CHINESE_GAME_LANGUAGES[gameLanguage] and GM_LANGUAGE_ZH_CN or GM_LANGUAGE_EN
end

function GmToolUtils.getGmLocalizationText(id)
	if id == nil then
		return ""
	end

	local textId = tostring(id)
	local gmLanguage = GmToolUtils.getGmLanguage()
	local text = pgI18N.LocalizationText.GetLocalizationTextByLanguage(textId, gmLanguage)

	if (text == nil or text == "") and gmLanguage == GM_LANGUAGE_EN then
		text = pgI18N.LocalizationText.GetLocalizationTextByLanguage(textId, GM_LANGUAGE_ZH_CN)
	end

	return text ~= nil and text ~= "" and text or tostring(id)
end

function GmToolUtils.getGmGameString(key)
	local config = GameStringConfig[key]
	local textId = config and config.desc or GameStringHash[key]

	if textId then
		local text = GmToolUtils.getGmLocalizationText(textId)

		if text ~= tostring(textId) then
			return text
		end
	end

	return key
end

local function getGmAnnotationGameStringKey(text)
	return GmAnnotationI18nMap[text] or text
end

GmToolUtils.gmFuncMap = {
	{
		type = 0,
		initFuncListCount = 4,
		label = GmToolUtils.FuncTabLabel.RecentlyUse,
		funcList = {
			{
				subSearch = true,
				func = "addPet",
				dataFunc = "getPetRecentlyList",
				subStyle = 0,
				label = "GM_ADD_PET",
				style = 4,
				subItems = {
					{
						label = "LEVEL",
						style = 0,
						paramType = "number",
						defaultValue = "1"
					},
					{
						label = "LABEL",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_ADD_PET_TIPS_L176")
					},
					{
						label = "ALLSKILL",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_ADD_PET_TIPS_L177")
					},
					{
						label = "isRareFeature",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_ADD_PET_TIPS_L178")
					},
					{
						label = "skipReport",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_ADD_PET_TIPS_L179")
					},
					{
						label = "shinyStyle",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_ADD_PET_TIPS_L180")
					},
					{
						label = "COUNT",
						defaultValue = "1",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_ADD_PET_TIPS_L181")
					}
				}
			},
			{
				subSearch = true,
				func = "createPuppet",
				dataFunc = "getPuppetRecentlyList",
				subStyle = 0,
				label = "GM_ADD_PUPPET",
				style = 4,
				subItems = {
					{
						label = "level",
						defaultValue = "1",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_CREATE_PUPPET_TIPS_L187")
					},
					{
						label = "range",
						defaultValue = "3",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_CREATE_PUPPET_TIPS_L188")
					},
					{
						label = "scale",
						defaultValue = "1",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_CREATE_PUPPET_TIPS_L189")
					},
					{
						label = "isStopAi",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_CREATE_PUPPET_TIPS_L190")
					},
					{
						label = "label",
						defaultValue = "0",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_CREATE_PUPPET_TIPS_L191")
					},
					{
						label = "isRareFeature",
						defaultValue = "0",
						tips = "是否强制激活稀有特性（0不是，1是）",
						style = 0,
						paramType = "number"
					},
					{
						label = "shinyStyle",
						defaultValue = "0",
						tips = "闪光样式",
						style = 0,
						paramType = "number"
					}
				}
			},
			{
				subSearch = true,
				func = "addItem",
				dataFunc = "getItemRecentlyList",
				subStyle = 0,
				label = "GM_ADD_ITEM",
				style = 4,
				subItems = {
					{
						label = "COUNT",
						style = 0,
						paramType = "number"
					}
				}
			},
			{
				subSearch = true,
				func = "chooseScene",
				dataFunc = "sceneRecently",
				subStyle = 0,
				label = "DEBUG_FUNC_CHOOSE_SCENE",
				style = 4,
				subItems = {}
			},
			{
				subSearch = true,
				func = "createEnvObj",
				dataFunc = "envObjRecently",
				subStyle = 0,
				label = "创建EnvObj",
				style = 4,
				subItems = {}
			}
		}
	},
	{
		type = 1,
		label = GmToolUtils.FuncTabLabel.Favorite,
		funcList = {}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Common,
		funcList = {
			{
				onBtnRelease = true,
				func = "refreshScript",
				subStyle = 2,
				label = "DEBUG_FUNC_REFRESH_SCRIPT",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "runNetworkDiagnosis",
				subStyle = 2,
				label = "网络检测",
				style = 1,
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CONFIRM")
			},
			{
				onBtnRelease = true,
				func = "copyPlayerInfo",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_COPY_PLAYER_INFO"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_COPY")
			},
			{
				onBtnRelease = true,
				func = "showGrabEggMasterName",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_GRAB_EGG_MASTER_NAME"),
				buttonText = GmToolUtils.getGmGameString("GM_SHOW_GRAB_EGG_MASTER_NAME_BUTTON")
			},
			{
				onBtnRelease = true,
				func = "openDebugConsole",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_DEBUG_CONSOLE"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_OPEN")
			},
			{
				onBtnRelease = true,
				func = "openXboxPermissionDebugOverlay",
				buttonText = "打开",
				subStyle = 2,
				style = 1,
				showFunc = "isXboxPlatform",
				label = GmToolUtils.getGmGameString("GM_OPEN_XBOX_PERMISSION_DEBUG_OVERLAY")
			},
			{
				func = "setShellActivityInviteDisabled",
				checkFunc = "getShellActivityInviteDisabled",
				subStyle = 0,
				style = 1,
				showFunc = "isXboxPlatform",
				label = GmToolUtils.getGmGameString("GM_SET_SHELL_ACTIVITY_INVITE_DISABLED")
			},
			{
				onBtnRelease = true,
				func = "triggerCrash",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_TRIGGER_CRASH"),
				buttonText = GmToolUtils.getGmGameString("GM_TRIGGER_CRASH_BUTTON")
			},
			{
				onBtnRelease = true,
				func = "reportCrashSightException",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_REPORT_CRASH_SIGHT_EXCEPTION"),
				buttonText = GmToolUtils.getGmGameString("GM_REPORT_CRASH_SIGHT_EXCEPTION_BUTTON")
			},
			{
				onBtnRelease = true,
				func = "getSceneEntityInfos",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_GET_SCENE_ENTITY_INFOS"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_QUERY")
			},
			{
				onBtnRelease = true,
				func = "openPhotoIdentify",
				buttonText = "拍照",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_PHOTO_IDENTIFY")
			},
			{
				func = "setVitalityEnable",
				checkFunc = "getEnableVitality",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_VITALITY_ENABLE")
			},
			{
				func = "setClosePhotoMark",
				checkFunc = "getClosePhotoMark",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_CLOSE_PHOTO_MARK")
			},
			{
				func = "debugShowId",
				checkFunc = "getEnableShowId",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DEBUG_SHOW_ID")
			},
			{
				func = "setGuideEnable",
				checkFunc = "getEnableGuide",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_GUIDE_ENABLE")
			},
			{
				onBtnRelease = true,
				func = "unlockAllHelp",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_UNLOCK_ALL_HELP"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CONFIRM")
			},
			{
				func = "debugEntityInfo",
				checkFunc = "getEnableDebug",
				subStyle = 0,
				label = "DEBUG_FUNC_ENTITY_INFO",
				style = 1
			},
			{
				func = "setWorldRaceDebugEnabled",
				checkFunc = "getWorldRaceDebugEnabled",
				subStyle = 0,
				label = "大世界竞速：赛道门与状态调试",
				style = 1
			},
			{
				func = "debugEntityInfoSimple",
				checkFunc = "getEnableDebugSimple",
				subStyle = 0,
				label = "DEBUG_FUNC_ENTITY_INFO_SIMPLE",
				style = 1
			},
			{
				func = "enablePlayableLog",
				checkFunc = "getEnablePlayableLog",
				subStyle = 0,
				label = "DEBUG_FUNC_PLAYABLE_INFO",
				style = 1
			},
			{
				func = "enableGamepadDebugCapture",
				checkFunc = "getEnableGamepadDebugCapture",
				subStyle = 0,
				label = "DEBUG_ENABLE_GAMEPAD_CAPTURE",
				style = 1
			},
			{
				func = "setTouchPointDebugEnabled",
				checkFunc = "getTouchPointDebugEnabled",
				subStyle = 0,
				label = "显示触摸点",
				style = 1,
				showFunc = "canShowTouchPointDebug"
			},
			{
				func = "debugDrawSpeedLine",
				checkFunc = "getEnableDrawSpeedLine",
				subStyle = 0,
				label = "DEBUG_FUNC_ENABLE_DRAW_SPEED_LINE",
				style = 1
			},
			{
				func = "cursorActInfo",
				checkFunc = "getIsCursorAct",
				subStyle = 0,
				label = "DEBUG_FUNC_USE_CURSOR_ACT",
				style = 1
			},
			{
				func = "debugDrawHitBox",
				checkFunc = "getEnableDrawHitBox",
				subStyle = 0,
				label = "DEBUG_FUNC_ENABLE_DRAW_HIT_BOX",
				style = 1
			},
			{
				func = "onBtDebugChange",
				checkFunc = "getBtDebug",
				subStyle = 0,
				label = "DEBUG_FUNC_BT_DEBUG",
				style = 1
			},
			{
				func = "onUseLockOnExtendCameraChange",
				checkFunc = "getIsUseLockOnExtendCamera",
				subStyle = 0,
				label = "DEBUG_FUNC_SWITCH_LOCK_ON_EXTEND",
				style = 1
			},
			{
				func = "onUseLockOnCameraChange",
				checkFunc = "getIsUseLockOnCamera",
				subStyle = 0,
				label = "DEBUG_FUNC_SWITCH_LOCK_ON",
				style = 1
			},
			{
				func = "onKeyboardLockModeChange",
				dataFunc = "getModeList",
				subStyle = 1,
				label = "DEBUG_FUNC_KEYBOARD_LOCK_MODE",
				style = 1,
				selectedFun = "getKeyboardLockModeSelected"
			},
			{
				func = "onGamepadLockModeChange",
				dataFunc = "getGamePadModeList",
				subStyle = 1,
				label = "DEBUG_FUNC_GAMEPAD_LOCK_MODE",
				style = 1,
				selectedFun = "getGamepadLockModeSelected"
			},
			{
				func = "showLockEntDist",
				checkFunc = "getIsShowLockEntDist",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_LOCK_ENT_DIST")
			},
			{
				func = "showLockEntHates",
				checkFunc = "getIsShowLockEntHates",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_LOCK_ENT_HATES")
			},
			{
				func = "showEntityWindow",
				checkFunc = "getIsShowEntityWindow",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_ENTITY_WINDOW")
			},
			{
				func = "emptyFunc",
				subStyle = 0,
				label = "相机距离整体缩放",
				style = 3,
				subItems = {
					{
						label = "开启缩放",
						style = 2,
						func = "setGmCameraDistanceScaleEnabled",
						checkFunc = "getGmCameraDistanceScaleEnabled"
					},
					{
						style = 1,
						dataFunc = "getGmCameraDistanceScaleList",
						label = "距离倍率",
						func = "setGmCameraDistanceScale",
						selectedFun = "getGmCameraDistanceScaleSelected"
					}
				}
			},
			{
				func = "emptyFunc",
				subStyle = 0,
				label = "相机最远档位",
				style = 3,
				subItems = {
					{
						label = "开启限制",
						style = 2,
						func = "setGmCameraMaxZoomIndexEnabled",
						checkFunc = "getGmCameraMaxZoomIndexEnabled"
					},
					{
						style = 1,
						dataFunc = "getGmCameraMaxZoomIndexList",
						label = "最大档位",
						func = "setGmCameraMaxZoomIndex",
						selectedFun = "getGmCameraMaxZoomIndexSelected"
					}
				}
			},
			{
				func = "showCameraDebugInfo",
				checkFunc = "getShowCameraDebugInfo",
				subStyle = 0,
				label = "显示相机信息",
				style = 1,
				showFunc = "canShowCameraDebugInfo"
			},
			{
				func = "chooseScene",
				dataFunc = "getSceneList",
				subStyle = 1,
				label = "DEBUG_FUNC_CHOOSE_SCENE",
				style = 1
			},
			{
				func = "setFrame",
				dataFunc = "getFrameList",
				subStyle = 1,
				label = "DEBUG_FUNC_SET_FRAME",
				style = 1
			},
			{
				func = "setPhysicsFrame",
				dataFunc = "getPhysicsFrameList",
				subStyle = 1,
				label = "设置物理帧率",
				style = 1
			},
			{
				func = "deleteAllPrefs",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DELETE_ALL_PREFS"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CLEAN")
			},
			{
				func = "deleteGhostEyePrefs",
				buttonText = "清理",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DELETE_GHOST_EYE_PREFS")
			},
			{
				func = "copyCameraPos",
				buttonText = "复制",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_COPY_CAMERA_POS")
			},
			{
				onBtnRelease = true,
				func = "teleportCopyPos",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_TELEPORT_COPY_POS"),
				subItems = {
					{
						style = 0,
						defaultValue = "",
						label = GmToolUtils.getGmGameString("GM_TELEPORT_COPY_POS_L264")
					}
				},
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_TELEPORT")
			},
			{
				func = "setUCurvedPanelForceEnabled",
				checkFunc = "getUCurvedPanelForceEnabled",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_UCURVED_PANEL_FORCE_ENABLED")
			},
			{
				func = "hiddenUI",
				checkFunc = "checkUIStatus",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDDEN_UI")
			},
			{
				func = "hideUISpecial",
				checkFunc = "getHideUISpecial",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_UISPECIAL")
			},
			{
				func = "setMarqueeGMHide",
				checkFunc = "getHideMarqueeStatus",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_MARQUEE_GMHIDE")
			},
			{
				func = "setHideTownPet",
				checkFunc = "checkHideTownPet",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HIDE_TOWN_PET")
			},
			{
				func = "setHideVideo",
				checkFunc = "checkHideVideo",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HIDE_VIDEO")
			},
			{
				func = "onGamepadInputModeChange",
				dataFunc = "getGamepadInputModeList",
				subStyle = 1,
				style = 1,
				selectedFun = "getGamepadInputModeChange",
				label = GmToolUtils.getGmGameString("GM_ON_GAMEPAD_INPUT_MODE_CHANGE")
			},
			{
				func = "setTriggerBoardPhase",
				checkFunc = "checkTriggerBoardPhase",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_TRIGGER_BOARD_PHASE")
			},
			{
				onBtnRelease = true,
				func = "openTeamRoom",
				buttonText = "打开",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_TEAM_ROOM")
			},
			{
				onBtnRelease = true,
				func = "forceEntityCastShadow",
				buttonText = "关闭",
				subStyle = 2,
				label = "EntityCastShadow",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "playBossReward",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_PLAY_BOSS_REWARD"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_PLAY")
			},
			{
				onBtnRelease = true,
				func = "showPetFirstMeeting",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SHOW_PET_FIRST_MEETING"),
				subItems = {
					{
						label = "templateId",
						style = 0,
						saveKey = "petFirstMeetingTemplateId"
					},
					{
						label = "label",
						style = 0,
						saveKey = "petFirstMeetingLabel"
					},
					{
						label = "keepShow",
						style = 0,
						saveKey = "petFirstMeetingKeepShow"
					}
				},
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_SHOW")
			},
			{
				onBtnRelease = true,
				func = "mountVehicle",
				buttonText = "显示",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_MOUNT_VEHICLE"),
				subItems = {
					{
						label = "petId",
						style = 0,
						saveKey = "mountVehiclepetId"
					},
					{
						label = "fuId",
						style = 0,
						saveKey = "mountVehiclefuId"
					},
					{
						label = "seatId",
						style = 0,
						saveKey = "mountVehicleseatId"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "dismountVehicle",
				buttonText = "显示",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_DISMOUNT_VEHICLE"),
				subItems = {
					{
						label = "petId",
						style = 0,
						saveKey = "dismountVehiclepetId"
					},
					{
						label = "fuId",
						style = 0,
						saveKey = "dismountVehiclefuId"
					},
					{
						label = "seatId",
						style = 0,
						saveKey = "dismountVehicleseatId"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "createBubbleVehicle",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_CREATE_TEST_BUBBLE_VEHICLE"),
				subItems = {
					{
						label = "vehicleId",
						style = 0,
						saveKey = "createBubbleVehicleId",
						defaultValue = "81"
					},
					{
						label = "distance",
						style = 0,
						saveKey = "createBubbleVehicleDistance",
						defaultValue = "3"
					}
				},
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CONFIRM")
			},
			{
				onBtnRelease = true,
				func = "showAllOnlinePetFirstMeeting",
				buttonText = "播放",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SHOW_ALL_ONLINE_PET_FIRST_MEETING"),
				subItems = {
					{
						label = "startNumber",
						style = 0,
						saveKey = "petFirstMeetingStartNumber"
					},
					{
						label = "endNumber",
						style = 0,
						saveKey = "petFirstMeetingEndNumber"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "openResourceDownload",
				buttonText = "打开",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_OPEN_RESOURCE_DOWNLOAD"),
				subItems = {
					{
						style = 0,
						saveKey = "packSize",
						defaultValue = 1024,
						label = GmToolUtils.getGmGameString("GM_OPEN_RESOURCE_DOWNLOAD_L298")
					},
					{
						style = 0,
						saveKey = "curPackSize",
						defaultValue = 0,
						label = GmToolUtils.getGmGameString("GM_OPEN_RESOURCE_DOWNLOAD_L299")
					}
				}
			},
			{
				func = "setSettingPackDownload",
				checkFunc = "checkSettingPackDownload",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_SETTING_PACK_DOWNLOAD")
			},
			{
				func = "setAimSkillSwitchMode",
				checkFunc = "getIsAimSkillSwitchMode",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_AIM_SKILL_SWITCH_MODE")
			},
			{
				func = "setTopLogoUseCache",
				checkFunc = "getTopLogoUseCache",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_TOP_LOGO_USE_CACHE")
			},
			{
				func = "setGmMoveMode",
				checkFunc = "getGmMoveMode",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_GM_MOVE_MODE")
			},
			{
				func = "setSpecialAfk",
				checkFunc = "getSpecialAfk",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_SPECIAL_AFK")
			},
			{
				func = "setStunnedCheck",
				checkFunc = "getStunnedCheck",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_STUNNED_CHECK")
			},
			{
				func = "toggleEnableEffectMpeLodDown",
				checkFunc = "getEnableEffectMpeLodDown",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_TOGGLE_ENABLE_EFFECT_MPE_LOD_DOWN")
			},
			{
				func = "debugDrawRbCollider",
				checkFunc = "getEnableDrawRbCollider",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DEBUG_DRAW_RB_COLLIDER")
			},
			{
				func = "debugDrawRbCatchCollider",
				checkFunc = "getEnableDrawRbCatchCollider",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DEBUG_DRAW_RB_CATCH_COLLIDER")
			},
			{
				func = "showTopLogoEmojiBubble",
				subStyle = 0,
				label = "GM_TOPLOGO_EMOJI_BUBBLE",
				style = 3,
				subItems = {
					{
						label = "actorId",
						style = 0,
						saveKey = "emojiBubbleActorId"
					},
					{
						label = "emojiName",
						style = 0,
						saveKey = "emojiBubbleEmojiName"
					},
					{
						label = "duration",
						style = 0,
						saveKey = "emojiBubbleDuration"
					}
				}
			},
			{
				func = "dumpEntityVisibleInfo",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_DUMP_ENTITY_VISIBLE_INFO"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_PRINT"),
				subItems = {
					{
						label = "id",
						style = 0,
						saveKey = "dumpVisibleEntityId"
					}
				}
			},
			{
				func = "showPetListEmoji",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SHOW_PET_LIST_EMOJI"),
				subItems = {
					{
						label = "emojiName",
						style = 0,
						saveKey = "petListEmojiName"
					}
				}
			},
			{
				func = "adjustNavAreaCost",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_ADJUST_NAV_AREA_COST"),
				subItems = {
					{
						label = "areaCost",
						style = 0,
						saveKey = "navAreaCost"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "gcAndCount",
				buttonText = "打印",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_GC_AND_COUNT")
			},
			{
				onBtnRelease = true,
				func = "luaProfileTrigger",
				subStyle = 2,
				label = "lua profile",
				style = 1,
				buttonText = GmToolUtils.getGmGameString("GM_LUA_PROFILE_TRIGGER_BUTTON")
			},
			{
				func = "toggleSample",
				checkFunc = "checkSample",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_TOGGLE_SAMPLE")
			},
			{
				func = "toggleSampleLuaMemory",
				checkFunc = "checkSampleLuaMemory",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_TOGGLE_SAMPLE_LUA_MEMORY")
			},
			{
				onBtnRelease = true,
				func = "luaProfileTrigger",
				subStyle = 2,
				label = "lua profile",
				style = 1,
				buttonText = GmToolUtils.getGmGameString("GM_LUA_PROFILE_TRIGGER_BUTTON_L343")
			},
			{
				onBtnRelease = true,
				func = "luaProfileClear",
				buttonText = "打印",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_LUA_PROFILE_CLEAR")
			},
			{
				onBtnRelease = true,
				func = "luaMemTrigger",
				buttonText = "开始或保存",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_LUA_MEM_TRIGGER")
			},
			{
				onBtnRelease = true,
				func = "luaMemClear",
				subStyle = 2,
				label = "lua内存统计",
				style = 1,
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CLEAR")
			},
			{
				onBtnRelease = true,
				func = "luaMemSnap",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_LUA_MEM_SNAP"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_SNAPSHOT")
			},
			{
				func = "setLuaTickFrameInterval",
				subStyle = 0,
				label = "luaManager tick frame interval",
				style = 3,
				buttonText = GmToolUtils.getGmGameString("GM_SET_LUA_TICK_INTERVAL_BUTTON"),
				subItems = {
					{
						defaultValue = "1",
						tips = "Lua Tick frame interval (1-10), default 1",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_SET_LUA_TICK_INTERVAL")
					}
				}
			},
			{
				func = "csharpLeakSample",
				checkFunc = "csharpLeakCheckSample",
				subStyle = 0,
				label = "c# leak sample",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "csharpLeakSave",
				subStyle = 2,
				label = "c# leak save",
				style = 1,
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_SAVE")
			},
			{
				func = "openRpcDebug",
				checkFunc = "checkRpcDebug",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_RPC_DEBUG")
			},
			{
				func = "openCreateUserDebug",
				checkFunc = "checkCreateUserDebug",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_CREATE_USER_DEBUG")
			},
			{
				func = "closePopupInfoDebug",
				checkFunc = "checkPopupInfoDebug",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_CLOSE_POPUP_INFO_DEBUG")
			},
			{
				func = "setSkillTypeHide",
				checkFunc = "getSkillTypeHide",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_SKILL_TYPE_HIDE")
			},
			{
				onBtnRelease = true,
				func = "setResolution",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SET_RESOLUTION"),
				subItems = {
					{
						style = 0,
						saveKey = "tempResolutionWidth",
						label = GmToolUtils.getGmGameString("GM_SET_RESOLUTION_L367")
					},
					{
						style = 0,
						saveKey = "tempResolutionHeight",
						label = GmToolUtils.getGmGameString("GM_SET_RESOLUTION_L368")
					}
				},
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CONFIRM")
			},
			{
				func = "forceAvatarLOD",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_FORCE_AVATAR_LOD"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_APPLY"),
				subItems = {
					{
						defaultValue = "-1",
						saveKey = "forceAvatarLODLevel",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_FORCE_AVATAR_LOD_L373"),
						tips = GmToolUtils.getGmGameString("GM_FORCE_AVATAR_LOD_TIPS_L373")
					}
				}
			},
			{
				func = "printVideoResFullPath",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_PRINT_VIDEO_RES_FULL_PATH"),
				subItems = {
					{
						label = "resID",
						style = 0,
						saveKey = "tempVideoResID"
					}
				}
			},
			{
				func = "openRpcSizeDebug",
				checkFunc = "checkRpcSizeDebug",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_RPC_SIZE_DEBUG")
			},
			{
				func = "setAllHudArrowHide",
				checkFunc = "getAllHudArrowHide",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_ALL_HUD_ARROW_HIDE")
			},
			{
				func = "setCatchRogueShopShow",
				checkFunc = "getCatchRogueShopShow",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_CATCH_ROGUE_SHOP_SHOW")
			},
			{
				func = "resetFriendshipRecord",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_RESET_FRIENDSHIP_RECORD"),
				subItems = {
					{
						label = "player UId",
						style = 0,
						saveKey = "friendshipRecordUID"
					},
					{
						label = "level",
						style = 0,
						saveKey = "friendshipRecordLevel"
					},
					{
						style = 0,
						saveKey = "friendshipRecordSelfPos",
						label = GmToolUtils.getGmGameString("GM_RESET_FRIENDSHIP_RECORD_L390")
					},
					{
						style = 0,
						saveKey = "friendshipRecordFriendPos",
						label = GmToolUtils.getGmGameString("GM_RESET_FRIENDSHIP_RECORD_L391")
					}
				}
			},
			{
				func = "setVegetationShow",
				subStyle = 0,
				label = "SetVegetationShow",
				style = 3,
				subItems = {
					{
						label = "type Index",
						style = 0,
						saveKey = "setVegetationShowTypeIndex"
					},
					{
						label = "show(1:true,0:false)",
						style = 0,
						saveKey = "setVegetationShowShowFlag"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "setMeListenRange",
				buttonText = "确定",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SET_ME_LISTEN_RANGE"),
				subItems = {
					{
						style = 0,
						saveKey = "listenRange",
						label = GmToolUtils.getGmGameString("GM_SET_ME_LISTEN_RANGE_L402")
					}
				}
			},
			{
				func = "setGamepadNavDebug",
				checkFunc = "getGamepadNavDebug",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_GAMEPAD_NAV_DEBUG")
			},
			{
				func = "showChainAttackByCurPetList",
				buttonText = "打开",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_CHAIN_ATTACK_BY_CUR_PET_LIST")
			},
			{
				func = "showChainAttackRespond",
				buttonText = "打开",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_CHAIN_ATTACK_RESPOND")
			},
			{
				func = "setSkipRobEggEnterCheck",
				checkFunc = "getSkipRobEggEnterCheck",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_SKIP_ROB_EGG_ENTER_CHECK")
			},
			{
				style = 3,
				func = "setGrabEggScore",
				label = GmToolUtils.getGmGameString("GM_SET_SKIP_ROB_EGG_ENTER_CHECK_L409"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_REFRESH"),
				subItems = {
					{
						style = 2,
						func = "toggleEggScore",
						checkFunc = "getEggScoreEnabled",
						label = GmToolUtils.getGmGameString("GM_BUTTON_ENABLE")
					},
					{
						style = 1,
						dataFunc = "getGrabEggScore",
						selectedFun = "getGrabEggScoreSelected",
						label = GmToolUtils.getGmGameString("GM_GET_GRAB_EGG_SCORE")
					}
				}
			},
			{
				func = "refreshWaterRecovery",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_REFRESH_WATER_RECOVERY"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_ADJUST")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Ability,
		funcList = {
			{
				onBtnRelease = true,
				func = "playTemplateSkillEffectsByLod",
				buttonText = "开始",
				subStyle = 0,
				label = "模板技能特效LOD轮询",
				style = 3,
				subItems = {
					{
						label = "宠物/怪物templateId",
						style = 0,
						paramType = "number",
						saveKey = "gmSkillEffectTemplateId"
					},
					{
						defaultValue = "5",
						saveKey = "gmSkillEffectLodDuration",
						label = "每组播放时长(秒)",
						style = 0,
						paramType = "number"
					},
					{
						defaultValue = "1",
						saveKey = "gmSkillEffectLodSpeed",
						label = "播放速率",
						style = 0,
						paramType = "number"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "playSpecifiedEffectByLod",
				buttonText = "播放",
				subStyle = 0,
				label = "指定特效四档LOD对比",
				style = 3,
				subItems = {
					{
						label = "特效名",
						style = 0,
						saveKey = "gmSpecifiedEffectLodName"
					},
					{
						defaultValue = "5",
						saveKey = "gmSpecifiedEffectLodSpacing",
						label = "相邻间隔距离(米)",
						style = 0,
						paramType = "number"
					},
					{
						defaultValue = "1",
						saveKey = "gmSpecifiedEffectLodScale",
						label = "特效缩放倍率",
						style = 0,
						paramType = "number"
					},
					{
						defaultValue = "1",
						saveKey = "gmSpecifiedEffectLodSpeed",
						label = "播放速率",
						style = 0,
						paramType = "number"
					},
					{
						defaultValue = "5",
						saveKey = "gmSpecifiedEffectLodDuration",
						label = "持续时间(秒)",
						style = 0,
						paramType = "number"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "rotateUltimatePetsAndCastUlt",
				buttonText = "开始/停止",
				subStyle = 2,
				label = "自动轮换宠物大招 (rotateUltimatePetsAndCastUlt)",
				style = 1
			},
			{
				func = "onDrawAbilityMeshChange",
				checkFunc = "getIsDrawAbilityMesh",
				subStyle = 0,
				label = "DEBUG_FUNC_DRAW_ABILITY_MESH",
				style = 1
			},
			{
				func = "onlyDrawLatestAttackBox",
				checkFunc = "getOnlyDrawLatestAttackBox",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ONLY_DRAW_LATEST_ATTACK_BOX")
			},
			{
				func = "onAbilityDataInspectChange",
				checkFunc = "getAbilityDataInspect",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ABILITY_DATA_INSPECT_CHANGE")
			},
			{
				func = "onAbilityAutoTestChange",
				checkFunc = "getAbilityAutoTestEnable",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ABILITY_AUTO_TEST_CHANGE")
			},
			{
				func = "onEnableHitCameraShakeChange",
				checkFunc = "getEnableHitCameraShake",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ENABLE_HIT_CAMERA_SHAKE_CHANGE")
			},
			{
				func = "onEnableHitRippleAllChange",
				checkFunc = "getEnableHitRippleAll",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ENABLE_HIT_RIPPLE_ALL_CHANGE")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.ChooseScene,
		funcList = {
			{
				subSearch = true,
				func = "chooseScene",
				dataFunc = "sceneRecentlyLine",
				subStyle = 0,
				label = "DEBUG_FUNC_CHOOSE_SCENE",
				style = 4,
				subItems = {}
			},
			{
				subSearch = true,
				func = "chooseScene",
				dataFunc = "getSceneList",
				subStyle = 0,
				label = "DEBUG_FUNC_CHOOSE_SCENE",
				style = 4,
				subItems = {}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.AddPet,
		funcList = {
			{
				onBtnRelease = true,
				func = "resetAndGetAllPet",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_AND_GET_ALL_PET")
			},
			{
				onBtnRelease = true,
				func = "resetAndGetAllReleasePet",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_AND_GET_ALL_RELEASE_PET")
			},
			{
				onBtnRelease = true,
				func = "resetAndGetAllSuperPet",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_AND_GET_ALL_SUPER_PET")
			},
			{
				onBtnRelease = true,
				func = "resetAndGetAllFormPet",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_AND_GET_ALL_FORM_PET")
			},
			{
				onBtnRelease = true,
				func = "resetAndGetAllReleaseBasePet",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_AND_GET_ALL_RELEASE_BASE_PET")
			},
			{
				onBtnRelease = true,
				func = "resetAllPetAndBook",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_ALL_PET_AND_BOOK")
			},
			{
				onBtnRelease = true,
				func = "removePetsByTemplateId",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_REMOVE_PETS_BY_TEMPLATE_ID"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_DELETE"),
				subItems = {
					{
						label = "templateId",
						style = 0,
						paramType = "number",
						saveKey = "removePetsByTemplateIdTemplateId"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "spreadPetTransmogRainbow",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_SPREAD"),
				subItems = {
					{
						label = "templateId",
						defaultValue = "1021300",
						saveKey = "petTransmogRainbowTemplateId",
						style = 0,
						paramType = "number",
						tips = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_TIPS_L467")
					},
					{
						defaultValue = "3",
						saveKey = "petTransmogRainbowColSpacing",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_L468"),
						tips = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_TIPS_L468")
					},
					{
						defaultValue = "4",
						saveKey = "petTransmogRainbowRowSpacing",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_L469"),
						tips = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_TIPS_L469")
					},
					{
						defaultValue = "1",
						saveKey = "petTransmogRainbowScale",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_L470"),
						tips = GmToolUtils.getGmGameString("GM_SPREAD_PET_TRANSMOG_RAINBOW_TIPS_L470")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "spreadPetShinyStyles",
				buttonText = "铺开",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SPREAD_PET_SHINY_STYLES"),
				subItems = {
					{
						label = "petId",
						defaultValue = "1021300",
						saveKey = "petShinyStylesTemplateId",
						tips = "宠物templateId",
						style = 0,
						paramType = "number"
					},
					{
						label = "列间距",
						defaultValue = "3",
						saveKey = "petShinyStylesColSpacing",
						tips = "同一行内相邻宠物间距，默认2.5",
						style = 0,
						paramType = "number"
					},
					{
						label = "行间距",
						defaultValue = "4",
						saveKey = "petShinyStylesRowSpacing",
						tips = "相邻行（沿玩家前方）间距，默认3.0",
						style = 0,
						paramType = "number"
					},
					{
						label = "缩放",
						defaultValue = "1",
						saveKey = "petShinyStylesScale",
						tips = "宠物模型缩放，默认1",
						style = 0,
						paramType = "number"
					},
					{
						defaultValue = "4",
						saveKey = "petShinyStylesMaxCols",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_SPREAD_PET_SHINY_STYLES_L479"),
						tips = GmToolUtils.getGmGameString("GM_SPREAD_PET_SHINY_STYLES_TIPS_L479")
					}
				}
			},
			{
				subSearch = true,
				func = "addPet",
				dataFunc = "getPetList",
				subStyle = 0,
				label = "DEBUG_FUNC_ADD_PET",
				style = 4,
				subItems = {
					{
						label = "LEVEL",
						style = 0,
						paramType = "number",
						defaultValue = "1"
					},
					{
						label = "LABEL",
						defaultValue = "0",
						tips = "标签：(0普通，1闪光，2Boss，4精英)",
						style = 0,
						paramType = "number"
					},
					{
						label = "ALLSKILL",
						defaultValue = "0",
						tips = "是否学习所有技能：(1/0)",
						style = 0,
						paramType = "number"
					},
					{
						label = "isRareFeature",
						defaultValue = "0",
						tips = "是否强制激活稀有特性（0不是，1是）",
						style = 0,
						paramType = "number"
					},
					{
						label = "skipReport",
						defaultValue = "0",
						tips = "是否跳过汇报（0否，1是)",
						style = 0,
						paramType = "number"
					},
					{
						label = "shinyStyle",
						defaultValue = "0",
						tips = "闪光样式",
						style = 0,
						paramType = "number"
					},
					{
						label = "COUNT",
						defaultValue = "1",
						tips = "添加数量",
						style = 0,
						paramType = "number"
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Ark,
		funcList = {
			{
				onBtnRelease = true,
				func = "enableArkScreen",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ENABLE_ARK_SCREEN")
			},
			{
				onBtnRelease = true,
				func = "disableArkScreen",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DISABLE_ARK_SCREEN")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.AddItem,
		funcList = {
			{
				subSearch = true,
				func = "addItem",
				dataFunc = "getItemList",
				subStyle = 0,
				label = "DEBUG_FUNC_ADD_ITEM",
				style = 4,
				subItems = {
					{
						label = "COUNT",
						style = 0,
						paramType = "number"
					}
				}
			},
			{
				subSearch = true,
				func = "clearItemById",
				dataFunc = "getItemList",
				subStyle = 0,
				style = 4,
				label = GmToolUtils.getGmGameString("GM_CLEAR_ITEM_BY_ID"),
				subItems = {}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.AddPuppet,
		funcList = {
			{
				subSearch = true,
				func = "createPuppet",
				dataFunc = "getPuppetList",
				subStyle = 0,
				label = "DEBUG_FUNC_CREATE_PUPPET",
				style = 4,
				subItems = {
					{
						label = "level",
						defaultValue = "1",
						tips = "怪物等级",
						style = 0,
						paramType = "number"
					},
					{
						label = "range",
						defaultValue = "3",
						tips = "默认值 3",
						style = 0,
						paramType = "number"
					},
					{
						label = "scale",
						defaultValue = "1",
						tips = "召唤出怪物的缩放尺寸",
						style = 0,
						paramType = "number"
					},
					{
						label = "isStopAi",
						defaultValue = "0",
						tips = "召唤出来后是否立刻停止怪物的AI(0不停止，1停止)",
						style = 0,
						paramType = "number"
					},
					{
						label = "label",
						defaultValue = "0",
						tips = "召唤的label(0普通，1闪光，2Boss，4精英)",
						style = 0,
						paramType = "number"
					},
					{
						label = "isRareFeature",
						defaultValue = "0",
						tips = "是否强制激活稀有特性（0不是，1是）",
						style = 0,
						paramType = "number"
					},
					{
						label = "shinyStyle",
						defaultValue = "0",
						tips = "闪光样式",
						style = 0,
						paramType = "number"
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.AddEnvObj,
		funcList = {
			{
				subSearch = true,
				func = "createEnvObj",
				dataFunc = "getEnvObjList",
				subStyle = 0,
				label = "DEBUG_FUNC_CREATE_ENV_OBJ",
				style = 4,
				subItems = {}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.MultiCMD,
		funcList = {
			{
				subSearch = true,
				func = "execCmdList",
				dataFunc = "getCmdListFileName",
				subStyle = 0,
				label = "批处理指令",
				style = 4,
				subItems = {}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.BugReport,
		funcList = {
			{
				func = "bugReport",
				subStyle = 0,
				label = "BugReport",
				style = 3,
				subItems = {
					{
						func = "setBugReportType",
						dataFunc = "getBugReportTypeList",
						subStyle = 1,
						style = 1,
						selectedFun = "getCurBugReportType",
						label = GmToolUtils.getGmGameString("GM_SET_BUG_REPORT_TYPE")
					},
					{
						style = 0,
						saveKey = "BugReportUserName",
						label = GmToolUtils.getGmGameString("GM_SET_BUG_REPORT_TYPE_L568"),
						tips = GmToolUtils.getGmGameString("GM_SET_BUG_REPORT_TYPE_TIPS_L568")
					},
					{
						label = "content",
						style = 4,
						saveKey = "BugReportContent",
						tips = GmToolUtils.getGmGameString("GM_SET_BUG_REPORT_TYPE_TIPS_L569")
					},
					{
						style = 5,
						label = GmToolUtils.getGmGameString("GM_SET_BUG_REPORT_TYPE_L570")
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Language,
		funcList = {
			{
				func = "setLocalizationTagEnable",
				checkFunc = "getLocalizationTagEnable",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_LOCALIZATION_TAG_ENABLE")
			},
			{
				func = "changeLanguage",
				subStyle = 0,
				label = "GM_LANGUAGE_REPLACE",
				style = 3,
				subItems = {
					{
						style = 7,
						label = GmToolUtils.getGmGameString("GM_CHANGE_LANGUAGE")
					},
					{
						style = 7,
						label = GmToolUtils.getGmGameString("GM_CHANGE_LANGUAGE_L584")
					},
					{
						style = 3,
						label = GmToolUtils.getGmGameString("GM_CHANGE_LANGUAGE_L585")
					},
					{
						style = 2,
						checkFunc = "checkMaskState",
						func = "setMaskState",
						actionPath = "Temp/FlipLanguageReplaceMask",
						label = GmToolUtils.getGmGameString("GM_CHECK_MASK_STATE")
					}
				}
			},
			{
				func = "setAllTextArkFontEnable",
				checkFunc = "getAllTextArkFontEnable",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_ALL_TEXT_ARK_FONT_ENABLE")
			},
			{
				func = "setMachineTranslationHighlight",
				checkFunc = "getMachineTranslationHighlight",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_MACHINE_TRANSLATION_HIGHLIGHT")
			},
			{
				func = "switchPlatform",
				dataFunc = "getPlatformList",
				subStyle = 1,
				style = 1,
				selectedFun = "getCurPlatformSelected",
				label = GmToolUtils.getGmGameString("GM_SWITCH_PLATFORM")
			},
			{
				func = "switchLanguage",
				dataFunc = "getLanguageList",
				subStyle = 1,
				style = 1,
				selectedFun = "getCurLanguageSelected",
				label = GmToolUtils.getGmGameString("GM_SWITCH_LANGUAGE")
			},
			{
				func = "switchAudioLanguage",
				dataFunc = "getAudioLanguageList",
				subStyle = 1,
				style = 1,
				selectedFun = "getCurAudioLanguageSelected",
				label = GmToolUtils.getGmGameString("GM_SWITCH_AUDIO_LANGUAGE")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.AIClient,
		funcList = {
			{
				func = "showUnitPhysicsTuningWindow",
				checkFunc = "getIsShowUnitPhysicsTuningWindow",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_UNIT_PHYSICS_TUNING_WINDOW")
			},
			{
				onBtnRelease = true,
				func = "setResPointLogActorId",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_RES_POINT_LOG_ACTOR_ID")
			},
			{
				onBtnRelease = true,
				func = "setResPointDrawActorId",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_RES_POINT_DRAW_ACTOR_ID")
			},
			{
				func = "openResPointLog",
				checkFunc = "checkResPointLogState",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_RES_POINT_LOG")
			},
			{
				func = "openAIGlobalTick",
				checkFunc = "checkAIGlobalTick",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_AIGLOBAL_TICK")
			},
			{
				func = "openResPointDraw",
				checkFunc = "checkResPointDrawState",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_RES_POINT_DRAW")
			},
			{
				func = "openGroupBehaviourLog",
				checkFunc = "checkGroupBehaviourLogState",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_GROUP_BEHAVIOUR_LOG")
			},
			{
				func = "openConditionTriggerLog",
				checkFunc = "checkConditionTriggerLogState",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_CONDITION_TRIGGER_LOG")
			},
			{
				onBtnRelease = true,
				func = "printCurrentAllStaticResPoint",
				buttonText = "打印",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_PRINT_CURRENT_ALL_STATIC_RES_POINT")
			},
			{
				onBtnRelease = true,
				func = "setDebugPerceptibility",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_DEBUG_PERCEPTIBILITY")
			},
			{
				onBtnRelease = true,
				func = "setNoImpDebugPerceptibility",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_NO_IMP_DEBUG_PERCEPTIBILITY")
			},
			{
				onBtnRelease = true,
				func = "setDebugPerceptibilityOff",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_DEBUG_PERCEPTIBILITY_OFF")
			},
			{
				func = "setPlayerPerceptibility",
				checkFunc = "checkPlayerPerceptibility",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_PLAYER_PERCEPTIBILITY")
			},
			{
				func = "setPlayerNoImpPerceptibility",
				checkFunc = "checkPlayerNoImpPerceptibility",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_PLAYER_NO_IMP_PERCEPTIBILITY")
			},
			{
				onBtnRelease = true,
				func = "setDebugCalcQualifiedPos",
				buttonText = "确定",
				subStyle = 0,
				label = "Debug CalcQualifiedPos",
				style = 2
			},
			{
				onBtnRelease = true,
				func = "setDebugCalcQualifiedPosOff",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_DEBUG_CALC_QUALIFIED_POS_OFF")
			},
			{
				onBtnRelease = true,
				func = "openAIDebug",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_AIDEBUG")
			},
			{
				onBtnRelease = true,
				func = "startAIDebug",
				buttonText = "确定",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_START_AIDEBUG")
			},
			{
				func = "openAISelfieDraw",
				checkFunc = "checkAISelfieDrawState",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_AISELFIE_DRAW")
			},
			{
				func = "setCaptureProbabilityHide",
				checkFunc = "checkCaptureProbabilityHide",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_CAPTURE_PROBABILITY_HIDE")
			},
			{
				func = "setCatchDebugInfo",
				checkFunc = "checkCatchDebugInfo",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_CATCH_DEBUG_INFO")
			},
			{
				func = "setDebugAlertLog",
				checkFunc = "checkDebugAlertLog",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_DEBUG_ALERT_LOG")
			},
			{
				func = "setBotPlayerTopLogo",
				checkFunc = "checkBotPlayerTopLogo",
				subStyle = 0,
				label = "BotPlayer 抬头显示",
				style = 1
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.TeleportToSandbox,
		funcList = {
			{
				subSearch = true,
				func = "chooseSandbox",
				dataFunc = "getSandboxList",
				subStyle = 0,
				label = "传送到sandbox",
				style = 4,
				subItems = {}
			},
			{
				func = "setOceanHeight",
				checkFunc = "getOceanHeight",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_OCEAN_HEIGHT")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.PVHelper,
		sourceLabel = GmToolUtils.FuncTabLabel.PVHelper,
		funcList = {
			{
				func = "enableOBCamera",
				checkFunc = "checkOBCamera",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ENABLE_OBCAMERA")
			},
			{
				func = "hiddenUI",
				checkFunc = "checkUIStatus",
				subStyle = 0,
				label = "隐藏UI",
				style = 1
			},
			{
				func = "enableMainPlayer",
				checkFunc = "checkMainPlayerEnable",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ENABLE_MAIN_PLAYER")
			},
			{
				func = "enableQuickMove",
				checkFunc = "checkQuickMove",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ENABLE_QUICK_MOVE")
			},
			{
				func = "hideFps",
				checkFunc = "checkFps",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_FPS")
			},
			{
				func = "hidePreAlpha",
				checkFunc = "checkPreAlpha",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_PRE_ALPHA")
			},
			{
				func = "hidePhoto",
				checkFunc = "checkPhoto",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_PHOTO")
			},
			{
				func = "hideRightPanel",
				checkFunc = "checkRightPanel",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_RIGHT_PANEL")
			},
			{
				func = "hideCatchKey",
				checkFunc = "checkCatchKey",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_CATCH_KEY")
			},
			{
				func = "hideUID",
				checkFunc = "checkUID",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_UID")
			},
			{
				func = "hideFuseKey",
				checkFunc = "checkFuseKey",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_FUSE_KEY")
			},
			{
				func = "hideBossName",
				checkFunc = "checkBossName",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_BOSS_NAME")
			},
			{
				func = "hideTopLogo",
				checkFunc = "checkTopLogo",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_TOP_LOGO")
			},
			{
				func = "hideAIHelper",
				checkFunc = "checkAIHelper",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_AIHELPER")
			},
			{
				func = "hideMiniMapPlenty",
				checkFunc = "checkMiniMapPlenty",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_HIDE_MINI_MAP_PLENTY")
			},
			{
				func = "changeOBCameraSetting",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_CHANGE_OBCAMERA_SETTING"),
				subItems = {
					GmToolUtils.obCameraSettingSubItems.MoveItem,
					GmToolUtils.obCameraSettingSubItems.RotationItem,
					GmToolUtils.obCameraSettingSubItems.FOVScollItem
				}
			},
			{
				func = "setSlowRatio",
				dataFunc = "getSlowRatio",
				subStyle = 1,
				style = 1,
				selectedFun = "getSlowRatioSelected",
				label = GmToolUtils.getGmGameString("GM_SET_SLOW_RATIO")
			},
			{
				onBtnRelease = true,
				func = "obCameraFollowEntity",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_OB_CAMERA_FOLLOW_ENTITY")
			},
			{
				func = "emptyFunc",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_EMPTY_FUNC"),
				subItems = {
					{
						style = 2,
						checkFunc = "checkGmDofState",
						func = "setGmDofState",
						actionPath = "Temp/FlipLanguageReplaceMask",
						label = GmToolUtils.getGmGameString("GM_CHECK_GM_DOF_STATE")
					},
					{
						maxValue = 32,
						minValue = 0,
						style = 6,
						funcParam = "m_FStop",
						label = "Aperture (F-stop)",
						func = "setDofParam",
						getValueFunc = "getDofParam",
						step = 0.1
					},
					{
						maxValue = 1000,
						minValue = 0,
						style = 6,
						funcParam = "m_SensorWidth",
						label = "Sensor Width",
						func = "setDofParam",
						getValueFunc = "getDofParam",
						step = 1
					},
					{
						maxValue = 1000,
						minValue = 0,
						style = 6,
						funcParam = "m_FocalDistance",
						label = "Focal Distance",
						func = "setDofParam",
						getValueFunc = "getDofParam",
						step = 1
					},
					{
						maxValue = 2,
						minValue = 0,
						style = 6,
						funcParam = "m_RecombineQuality",
						label = "Recombine Quality",
						func = "setDofParam",
						getValueFunc = "getDofParam",
						step = 1
					}
				}
			},
			{
				func = "emptyFunc",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_EMPTY_FUNC_L679"),
				subItems = {
					{
						maxValue = 1,
						minValue = 0.2,
						style = 6,
						funcParam = "y",
						func = "setPosAmplitudes",
						getValueFunc = "getPosAmplitudes",
						step = 0.1,
						label = GmToolUtils.getGmGameString("GM_GET_POS_AMPLITUDES")
					},
					{
						maxValue = 1,
						minValue = 0,
						style = 6,
						funcParam = "x",
						func = "setPosAmplitudes",
						getValueFunc = "getPosAmplitudes",
						step = 0.1,
						label = GmToolUtils.getGmGameString("GM_GET_POS_AMPLITUDES_L682")
					}
				}
			},
			{
				fun = "emptyFunc",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_GET_POS_AMPLITUDES_L686"),
				subItems = {
					{
						maxValue = 1000,
						minValue = 100,
						style = 6,
						funcParam = "m_GrassCullDistance",
						func = "setGrassLoadDistance",
						getValueFunc = "getGrassLoadDistance",
						step = 100,
						label = GmToolUtils.getGmGameString("GM_GET_GRASS_LOAD_DISTANCE")
					},
					{
						maxValue = 1000,
						minValue = 100,
						style = 6,
						funcParam = "m_TreeCullDistance",
						func = "setGrassLoadDistance",
						getValueFunc = "getGrassLoadDistance",
						step = 100,
						label = GmToolUtils.getGmGameString("GM_GET_GRASS_LOAD_DISTANCE_L689")
					},
					{
						maxValue = 10,
						minValue = 0.1,
						style = 6,
						funcParam = "load bias",
						label = "LOD Bias",
						func = "setLodBias",
						getValueFunc = "getLodBias",
						step = 0.1
					}
				}
			},
			{
				func = "onEnableHideChestChange",
				checkFunc = "getEnableHideChest",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ENABLE_HIDE_CHEST_CHANGE")
			},
			{
				func = "onEnableHidePuppetChange",
				checkFunc = "getEnableHidePuppet",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ENABLE_HIDE_PUPPET_CHANGE")
			},
			{
				func = "onEnableHideECSTopLogoChange",
				checkFunc = "getEnableHideECSTopLogo",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ON_ENABLE_HIDE_ECSTOP_LOGO_CHANGE")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Render,
		sourceLabel = GmToolUtils.FuncTabLabel.Render,
		funcList = {
			{
				func = "setRenderShowFlagScope",
				dataFunc = "getRenderShowFlagScopeList",
				consoleFunc = "execGmCmd",
				subStyle = 1,
				label = "Camera ShowFlag 作用域",
				style = 1,
				selectedFun = "getRenderShowFlagScopeSelected"
			},
			{
				onBtnRelease = true,
				func = "connectShaderPush",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_CONNECT_SHADER_PUSH"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CONNECT")
			},
			{
				func = "disconnectShaderPush",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DISCONNECT_SHADER_PUSH"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_DISCONNECT")
			},
			{
				func = "shaderPushStatus",
				buttonText = "查询",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHADER_PUSH_STATUS")
			},
			{
				onBtnRelease = true,
				func = "setCameraFov",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_CAMERA_FOV")
			},
			{
				onBtnRelease = true,
				func = "setTreeCullDistance",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_TREE_CULL_DISTANCE")
			},
			{
				onBtnRelease = true,
				func = "setGrassCullDistance",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_GRASS_CULL_DISTANCE")
			},
			{
				onBtnRelease = true,
				func = "setImposterCullDistance",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_IMPOSTER_CULL_DISTANCE")
			},
			{
				func = "setWeatherProfile",
				dataFunc = "getWeatherProfileList",
				subStyle = 1,
				style = 1,
				selectedFun = "getWeatherProfileSelected",
				label = GmToolUtils.getGmGameString("GM_SET_WEATHER_PROFILE")
			},
			{
				onBtnRelease = true,
				func = "setForce32Layer",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_SET_FORCE32_LAYER")
			},
			{
				onBtnRelease = true,
				func = "showEffectFieldsInfo",
				buttonText = "查询",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SHOW_EFFECT_FIELDS_INFO"),
				subItems = {
					{
						label = "vectorFields",
						style = 0,
						saveKey = "showEffectFieldsInfo_vectorFields"
					},
					{
						label = "waterShader",
						style = 0,
						saveKey = "showEffectFieldsInfo_waterShader"
					},
					{
						label = "oceanFields",
						style = 0,
						saveKey = "showEffectFieldsInfo_oceanFields"
					},
					{
						label = "riverFields",
						style = 0,
						saveKey = "showEffectFieldsInfo_riverFields"
					}
				}
			},
			{
				func = "setUIVirtualTextureEnabled",
				checkFunc = "checkUIVirtualTextureEnabled",
				subStyle = 0,
				label = "UI Virtual Texture",
				style = 1
			},
			{
				func = "setTextureStreamingGlobalHudEnabled",
				checkFunc = "checkTextureStreamingGlobalHudEnabled",
				subStyle = 0,
				label = "Texture Streaming Global HUD",
				style = 1
			},
			{
				func = "setDisableUIScale",
				checkFunc = "checkDisableUIScale",
				subStyle = 0,
				label = "Disable UI Scale",
				style = 1
			},
			{
				func = "set_m_EnableParticleSystem",
				checkFunc = "get_m_EnableParticleSystem",
				cvarNamespace = "gm.render",
				subStyle = 0,
				label = "ParticleSystem（全局 CPU 更新和渲染）",
				style = 1,
				showFunc = "isParticleSystemRuntimeSupported"
			},
			{
				func = "setDynamicBatchEnabled",
				checkFunc = "checkDynamicBatchEnabled",
				subStyle = 0,
				label = "Dynamic Batch",
				style = 1
			},
			{
				func = "setPostTaa5TapSharpenEnabled",
				checkFunc = "getPostTaa5TapSharpenEnabled",
				subStyle = 0,
				label = "Post-TAA 5-Tap Sharpen",
				style = 1
			},
			{
				func = "setStaticBlurEnabled",
				checkFunc = "getStaticBlurEnabled",
				subStyle = 0,
				label = "StaticBlur",
				style = 1
			},
			{
				func = "setEffectParticleRenderingEnabled",
				checkFunc = "getEffectParticleRenderingEnabled",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_EFFECT_PARTICLE_RENDERING_ENABLED")
			},
			{
				func = "setEffectParticleVisibleEnabled",
				checkFunc = "getEffectParticleVisibleEnabled",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_EFFECT_PARTICLE_VISIBLE_ENABLED")
			},
			{
				func = "setEffectActive",
				checkFunc = "getEffectActive",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_EFFECT_ACTIVE")
			},
			{
				func = "setVSyncEnabled",
				checkFunc = "getVSyncEnabled",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_VSYNC_ENABLED")
			},
			{
				func = "setLowResolutionEnabled",
				checkFunc = "getLowResolutionEnabled",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_LOW_RESOLUTION_ENABLED")
			},
			{
				func = "setTransparentInOnePassEnabled",
				checkFunc = "getTransparentInOnePassEnabled",
				subStyle = 0,
				label = "Transparent OnePass",
				style = 1
			},
			{
				func = "setTransparentInIndependentPassEnabled",
				checkFunc = "getTransparentInIndependentPassEnabled",
				subStyle = 0,
				label = "Transparent Independent Pass",
				style = 1
			},
			{
				func = "setGUIEnabled",
				checkFunc = "getGUIEnabled",
				subStyle = 0,
				label = "IMGUI",
				style = 1
			},
			{
				func = "setDlssNrParameters",
				buttonText = "Apply",
				subStyle = 0,
				label = "DLSS NR",
				style = 3,
				subItems = {
					{
						label = "Override DLSS NR",
						style = 2,
						func = "setDlssNrOverride",
						checkFunc = "getDlssNrOverride"
					},
					{
						label = "Mode (0=Off, 1=On)",
						saveKey = "dlssNrMode",
						defaultValue = "1",
						style = 0,
						paramType = "number"
					},
					{
						maxValue = 1,
						minValue = 0,
						style = 6,
						funcParam = "intensity",
						label = "Intensity",
						func = "setDlssNrParam",
						getValueFunc = "getDlssNrParam",
						step = 0.1
					},
					{
						maxValue = 1,
						minValue = 0,
						style = 6,
						funcParam = "localToneStrength",
						label = "Local Tone",
						func = "setDlssNrParam",
						getValueFunc = "getDlssNrParam",
						step = 0.1
					},
					{
						maxValue = 2,
						minValue = 0,
						style = 6,
						funcParam = "globalToneStrength",
						label = "Global Tone",
						func = "setDlssNrParam",
						getValueFunc = "getDlssNrParam",
						step = 0.1
					},
					{
						maxValue = 1,
						minValue = 0,
						style = 6,
						funcParam = "localStructureStrength",
						label = "Local Structure",
						func = "setDlssNrParam",
						getValueFunc = "getDlssNrParam",
						step = 0.1
					},
					{
						label = "Style (0-20)",
						saveKey = "dlssNrStyle",
						defaultValue = "0",
						style = 0,
						paramType = "number"
					},
					{
						label = "Auto Mask",
						style = 2,
						func = "setDlssNrAutoMask",
						checkFunc = "getDlssNrAutoMask"
					},
					{
						maxValue = 1,
						minValue = 0,
						style = 6,
						funcParam = "skinStructureStrength",
						label = "Skin Structure",
						func = "setDlssNrParam",
						getValueFunc = "getDlssNrParam",
						step = 0.1
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Photo,
		funcList = {
			{
				func = "savePhotoPreset",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SAVE_PHOTO_PRESET"),
				subItems = {
					{
						style = 0,
						saveKey = "photoPresetSaveKey",
						label = GmToolUtils.getGmGameString("GM_SAVE_PHOTO_PRESET_L736")
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Profile,
		funcList = {
			{
				func = "startProfile",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_START_PROFILE"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_START"),
				subItems = {
					{
						defaultValue = "3000",
						tips = "",
						style = 0,
						paramType = "string",
						label = GmToolUtils.getGmGameString("GM_START_PROFILE_L747")
					},
					{
						defaultValue = 96,
						tips = "",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_START_PROFILE_L748")
					},
					{
						defaultValue = "(0,0,0,0)",
						style = 0,
						paramType = "string",
						label = GmToolUtils.getGmGameString("GM_START_PROFILE_L749"),
						tips = GmToolUtils.getGmGameString("GM_START_PROFILE_TIPS_L749")
					},
					{
						defaultValue = 0,
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_START_PROFILE_L750"),
						tips = GmToolUtils.getGmGameString("GM_START_PROFILE_TIPS_L750")
					},
					{
						defaultValue = 0,
						tips = "",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_START_PROFILE_L751")
					}
				}
			},
			{
				func = "continueProfile",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_CONTINUE_PROFILE"),
				buttonText = GmToolUtils.getGmGameString("GM_CONTINUE_PROFILE_BUTTON")
			},
			{
				func = "endProfile",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_END_PROFILE"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_END")
			},
			{
				func = "startProfileTimeline",
				buttonText = "开始",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_START_PROFILE_TIMELINE")
			},
			{
				func = "launchProfileRecord",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_LAUNCH_PROFILE_RECORD"),
				buttonText = GmToolUtils.getGmGameString("GM_LAUNCH_PROFILE_RECORD_BUTTON"),
				subItems = {
					{
						defaultValue = "20",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_LAUNCH_PROFILE_RECORD_L760"),
						tips = GmToolUtils.getGmGameString("GM_LAUNCH_PROFILE_RECORD_TIPS_L760")
					}
				}
			},
			{
				func = "finishProfileRecord",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_FINISH_PROFILE_RECORD"),
				buttonText = GmToolUtils.getGmGameString("GM_FINISH_PROFILE_RECORD_BUTTON"),
				subItems = {
					{
						defaultValue = "1",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_FINISH_PROFILE_RECORD_L766"),
						tips = GmToolUtils.getGmGameString("GM_FINISH_PROFILE_RECORD_TIPS_L766")
					}
				}
			},
			{
				func = "getProfileInfo",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_GET_PROFILE_INFO"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_COLLECT")
			},
			{
				func = "teleportAndCollectProfileByPosList",
				buttonText = "开始",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_TELEPORT_AND_COLLECT_PROFILE_BY_POS_LIST")
			},
			{
				func = "startTopLogoProfile",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_START_TOP_LOGO_PROFILE"),
				buttonText = GmToolUtils.getGmGameString("GM_START_TOP_LOGO_PROFILE_BUTTON"),
				subItems = {
					{
						defaultValue = "10",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_START_TOP_LOGO_PROFILE_L774"),
						tips = GmToolUtils.getGmGameString("GM_START_TOP_LOGO_PROFILE_TIPS_L774")
					},
					{
						defaultValue = "toplogo_profile.log",
						style = 0,
						paramType = "string",
						label = GmToolUtils.getGmGameString("GM_START_TOP_LOGO_PROFILE_L775"),
						tips = GmToolUtils.getGmGameString("GM_START_TOP_LOGO_PROFILE_TIPS_L775")
					}
				}
			},
			{
				func = "stopTopLogoProfile",
				buttonText = "结束",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_STOP_TOP_LOGO_PROFILE")
			},
			{
				func = "runTopLogoBridgeBench",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_RUN_TOP_LOGO_BRIDGE_BENCH"),
				buttonText = GmToolUtils.getGmGameString("GM_RUN_TOP_LOGO_BRIDGE_BENCH_BUTTON"),
				subItems = {
					{
						defaultValue = "1000",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_RUN_TOP_LOGO_BRIDGE_BENCH_L782"),
						tips = GmToolUtils.getGmGameString("GM_RUN_TOP_LOGO_BRIDGE_BENCH_TIPS_L782")
					},
					{
						label = "输出文件名",
						defaultValue = "toplogo_bridge_bench.log",
						style = 0,
						paramType = "string",
						tips = GmToolUtils.getGmGameString("GM_RUN_TOP_LOGO_BRIDGE_BENCH_TIPS_L783")
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Debug,
		funcList = {
			{
				onBtnRelease = true,
				func = "setBatchRecycleFault",
				buttonText = "设置（一次）",
				subStyle = 0,
				label = "下一轮回收异常测试（Editor）",
				style = 3,
				subItems = {
					{
						label = "模式：0关闭 1失败 2超时 3断线",
						style = 0,
						paramType = "number",
						defaultValue = "0"
					},
					{
						label = "批次：0随机，或指定序号",
						style = 0,
						paramType = "number",
						defaultValue = "0"
					},
					{
						label = "重试：-1不指定；0首次发送；N第N次重试（回收默认最多3）",
						style = 0,
						paramType = "number",
						defaultValue = "-1"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "useServerBatchItem",
				buttonText = "发送",
				subStyle = 0,
				label = "并行使用道具测试（Editor）",
				style = 3,
				subItems = {
					{
						label = "道具 ID",
						style = 0,
						paramType = "number",
						defaultValue = "560401"
					},
					{
						label = "使用数量",
						style = 0,
						paramType = "number",
						defaultValue = "1000"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "setServerBatchItemFault",
				buttonText = "执行",
				subStyle = 0,
				label = "并行使用道具弱网模拟 (Editor)",
				style = 3,
				subItems = {
					{
						label = "模式：0清空，1断线（保留等待），2超时，3关闭等待窗",
						style = 0,
						paramType = "number",
						defaultValue = "1"
					},
					{
						label = "断线恢复秒数",
						style = 0,
						paramType = "number",
						defaultValue = "3"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "serverBatchItemStats",
				buttonText = "查询",
				subStyle = 2,
				label = "查询并行道具请求状态（Editor）",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "loadIFix",
				buttonText = "加载",
				subStyle = 2,
				label = "加载本地 InjectFix 补丁",
				style = 1,
				showFunc = "canLoadIFix"
			},
			{
				onBtnRelease = true,
				func = "queryCoreCarryCertifyInfo",
				buttonText = "查询",
				subStyle = 0,
				label = "查询核心携带物认证数据",
				style = 3,
				subItems = {
					{
						label = "invId",
						style = 0,
						paramType = "number",
						saveKey = "gmQueryCoreCarryCertifyInvId"
					},
					{
						label = "genId",
						style = 0,
						paramType = "number",
						saveKey = "gmQueryCoreCarryCertifyGenId"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "setPetHatchReproMode",
				buttonText = "设置（一次）",
				subStyle = 0,
				label = "孵化异常复现（Editor）",
				style = 3,
				subItems = {
					{
						label = "模式：0关闭 1盒子满 2宠物数据未同步",
						style = 0,
						paramType = "number",
						defaultValue = "0"
					}
				}
			},
			{
				func = "debugEntityInfo",
				checkFunc = "getEnableDebug",
				subStyle = 0,
				label = "DEBUG_FUNC_ENTITY_INFO",
				style = 1
			},
			{
				func = "debugHomelandBaseInfo",
				checkFunc = "getEnableDebugHomelandBaseInfo",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DEBUG_HOMELAND_BASE_INFO")
			},
			{
				func = "debugHomelandEnvInfo",
				checkFunc = "getEnableDebugHomelandEnvInfo",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DEBUG_HOMELAND_ENV_INFO")
			},
			{
				func = "debugHomeLinkInfo",
				checkFunc = "getEnableHomeLinkDebug",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DEBUG_HOME_LINK_INFO")
			},
			{
				func = "setHomeDemoMode",
				checkFunc = "getHomeDemoMode",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HOME_DEMO_MODE")
			},
			{
				func = "resetHomeDemoProgress",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RESET_HOME_DEMO_PROGRESS"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_RESET")
			},
			{
				func = "setHomePetCollisionMode",
				checkFunc = "getHomePetCollisionMode",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HOME_PET_COLLISION_MODE")
			},
			{
				func = "setHomePetLargeAvoidance",
				checkFunc = "getHomePetLargeAvoidance",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HOME_PET_LARGE_AVOIDANCE")
			},
			{
				func = "printAllHomeVehiclePetSeatWorldPositions",
				buttonText = "打印",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_PRINT_ALL_HOME_VEHICLE_PET_SEAT_WORLD_POSITIONS")
			},
			{
				func = "setHomeLinkPresetFilter",
				dataFunc = "getHomeLinkPresetFilterList",
				subStyle = 1,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HOME_LINK_PRESET_FILTER")
			},
			{
				func = "setHomeLinkDirFilter",
				dataFunc = "getHomeLinkDirFilterList",
				subStyle = 1,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_HOME_LINK_DIR_FILTER")
			},
			{
				func = "setUWAGPMDebugMode",
				checkFunc = "getDebugMode",
				subStyle = 0,
				label = "UWAGPM DebugMode",
				style = 1
			},
			{
				func = "hideHudAreaTip",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_HIDE_HUD_AREA_TIP"),
				buttonText = GmToolUtils.getGmGameString("GM_HIDE_HUD_AREA_TIP_BUTTON"),
				subItems = {
					{
						func = "parseHudAreaTip",
						style = 7,
						label = GmToolUtils.getGmGameString("GM_PARSE_HUD_AREA_TIP")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "addCommonSystemNotice",
				buttonText = "Send",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_ADD_COMMON_SYSTEM_NOTICE"),
				subItems = {
					{
						style = 0,
						label = GmToolUtils.getGmGameString("GM_ADD_COMMON_SYSTEM_NOTICE_L811")
					},
					{
						style = 0,
						label = GmToolUtils.getGmGameString("GM_ADD_COMMON_SYSTEM_NOTICE_L812")
					}
				}
			},
			{
				func = "showCreateCarWnd",
				buttonText = "打开",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SHOW_CREATE_CAR_WND")
			},
			{
				func = "trySkipNew",
				checkFunc = "getEnableDebugTrySkipNew",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_TRY_SKIP_NEW")
			},
			{
				onBtnRelease = true,
				func = "openAnimationRecord",
				buttonText = "开始",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_ANIMATION_RECORD")
			},
			{
				func = "enableNogoParmon",
				checkFunc = "isNogoParmonEnabled",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ENABLE_NOGO_PARMON")
			},
			{
				func = "setLogLevel",
				dataFunc = "getLogLevelList",
				subStyle = 1,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_LOG_LEVEL")
			},
			{
				func = "enableLog",
				checkFunc = "getLogEnable",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ENABLE_LOG")
			},
			{
				func = "enableConsoleLogSave",
				checkFunc = "getConsoleLogSaveEnable",
				subStyle = 0,
				style = 1,
				showFunc = "isMobilePlatformOrEditor",
				label = GmToolUtils.getGmGameString("GM_ENABLE_CONSOLE_LOG_SAVE")
			},
			{
				func = "setCaptureCloseupEnable",
				checkFunc = "getCaptureCloseupEnable",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_CAPTURE_CLOSEUP_ENABLE")
			},
			{
				onBtnRelease = true,
				func = "saveCaptureCloseupParams",
				buttonText = "保存",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SAVE_CAPTURE_CLOSEUP_PARAMS"),
				subItems = {
					{
						defaultValue = "4",
						label = "distance",
						style = 0,
						paramType = "number",
						saveKey = CaptureConst.CLOSEUP_CAMERA.PREF_KEY_DISTANCE
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Pandora,
		funcList = {
			{
				func = "setGameTimeScaleParam",
				subStyle = 2,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_SET_GAME_TIME_SCALE_PARAM"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_CONFIRM_ALT"),
				subItems = {
					{
						style = 0,
						label = GmToolUtils.getGmGameString("GM_SET_GAME_TIME_SCALE_PARAM_L835")
					},
					{
						maxValue = 2,
						minValue = 0.1,
						style = 6,
						label = "缩放值",
						func = "modifyGameTimeScaleParam",
						getValueFunc = "getGameTimeScaleParam",
						step = 0.1
					}
				}
			},
			{
				onBtnRelease = true,
				func = "dumpGameTimeStopInfo",
				buttonText = "Dump",
				subStyle = 2,
				label = "打印时停源(卡时停排查)",
				style = 1
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.DialogueGraph,
		funcList = {
			{
				func = "setDialogueGraphPerformanceEnabled",
				checkFunc = "getDialogueGraphPerformanceEnabled",
				subStyle = 0,
				label = "性能统计",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "playDialogueGraph",
				buttonText = "Play",
				subStyle = 0,
				label = "Play Dialogue Graph",
				style = 3,
				subItems = {
					{
						defaultValue = "80372966",
						saveKey = "worldXGraphDialogueGraphId",
						label = "dialogueGraphId",
						style = 0,
						paramType = "number"
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Performance,
		funcList = {
			{
				func = "setPowerSaveEnterBlocked",
				checkFunc = "getPowerSaveEnterBlocked",
				subStyle = 0,
				label = "禁止进入省电待机",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "applyLowestDeviceCountLimit",
				buttonText = "切换",
				subStyle = 2,
				label = "切换为最低端移动端数量限制",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "playGmEffectByInput",
				buttonText = "播放",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_PLAY_GM_EFFECT_BY_INPUT"),
				subItems = {
					{
						style = 0,
						saveKey = "gmEffectName",
						label = GmToolUtils.getGmGameString("GM_PLAY_GM_EFFECT_BY_INPUT_L872")
					},
					{
						style = 0,
						saveKey = "gmEffectDuration",
						defaultValue = "5",
						label = GmToolUtils.getGmGameString("GM_PLAY_GM_EFFECT_BY_INPUT_L873")
					},
					{
						style = 0,
						saveKey = "gmEffectLoopCount",
						defaultValue = "0",
						label = GmToolUtils.getGmGameString("GM_PLAY_GM_EFFECT_BY_INPUT_L874")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "stopAllGmEffects",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_STOP_ALL_GM_EFFECTS"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_STOP")
			},
			{
				onBtnRelease = true,
				func = "perfSnapshot",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_PERF_SNAPSHOT"),
				buttonText = GmToolUtils.getGmGameString("GM_PERF_SNAPSHOT_BUTTON")
			},
			{
				onBtnRelease = true,
				func = "destroyOneFarthestEntity",
				subStyle = 2,
				label = "DESTROY_FARTHEST_ENTITY",
				style = 1,
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_START")
			},
			{
				onBtnRelease = true,
				func = "beginXChunkProfiler",
				buttonText = "Begin",
				subStyle = 2,
				label = "BeginXChunkProfiler",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "endXChunkProfiler",
				buttonText = "End",
				subStyle = 2,
				label = "EndXChunkProfiler",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "dumpXChunkProfiler",
				buttonText = "Dump",
				subStyle = 2,
				label = "DumpXChunkProfiler",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "startPerfRecording",
				buttonText = "开始",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_START_PERF_RECORDING"),
				subItems = {
					{
						style = 0,
						saveKey = "gmPerfInterval",
						defaultValue = "5",
						label = GmToolUtils.getGmGameString("GM_START_PERF_RECORDING_L886")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "stopPerfRecording",
				buttonText = "停止",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_STOP_PERF_RECORDING")
			},
			{
				onBtnRelease = true,
				func = "runEffectBatchPerfTestFromFeishu",
				buttonText = "开始",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU"),
				subItems = {
					{
						style = 0,
						saveKey = "gmBatchFeishuSheet",
						defaultValue = "0",
						label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU_L894")
					},
					{
						style = 0,
						saveKey = "gmBatchFeishuTime",
						defaultValue = "10",
						label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU_L895")
					},
					{
						label = "采样间隔(帧,默认5)",
						style = 0,
						saveKey = "gmBatchFeishuInterval",
						defaultValue = "5"
					},
					{
						style = 0,
						saveKey = "gmBatchFeishuStack",
						defaultValue = "1",
						label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU_L897")
					},
					{
						style = 0,
						saveKey = "gmBatchFeishuUploadEveryN",
						defaultValue = "500",
						label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU_L898")
					},
					{
						style = 0,
						saveKey = "gmBatchFeishuAutoParent",
						defaultValue = "Vvcmw2aMNiTYnlkFn2RctTfhnOc",
						label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU_L899")
					},
					{
						style = 0,
						saveKey = "gmBatchFeishuAutoTitle",
						label = GmToolUtils.getGmGameString("GM_RUN_EFFECT_BATCH_PERF_TEST_FROM_FEISHU_L900")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "stopEffectBatchPerfTest",
				buttonText = "停止",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_STOP_EFFECT_BATCH_PERF_TEST")
			},
			{
				onBtnRelease = true,
				func = "runParmonBatchGpuPerfTest",
				buttonText = "开始",
				subStyle = 0,
				label = "批量 Parmon GPU 采集（真机）",
				style = 3,
				subItems = {
					{
						label = "指定 Parmon ID（逗号分隔，留空按范围）",
						style = 0,
						saveKey = "gmParmonPerfIds"
					},
					{
						label = "起始序号（从1开始）",
						style = 0,
						saveKey = "gmParmonPerfStartIndex",
						defaultValue = "1"
					},
					{
						label = "测试数量（0=全部）",
						style = 0,
						saveKey = "gmParmonPerfCount",
						defaultValue = "20"
					},
					{
						label = "单只预热时长（秒）",
						style = 0,
						saveKey = "gmParmonPerfWarmup",
						defaultValue = "2"
					},
					{
						label = "单只采样时长（秒）",
						style = 0,
						saveKey = "gmParmonPerfDuration",
						defaultValue = "10"
					},
					{
						label = "采样间隔（帧）",
						style = 0,
						saveKey = "gmParmonPerfInterval",
						defaultValue = "5"
					},
					{
						label = "固定镜头 FOV",
						style = 0,
						saveKey = "gmParmonPerfFov",
						defaultValue = "35"
					},
					{
						label = "固定镜头距离（米，默认4.2）",
						style = 0,
						saveKey = "gmParmonPerfDistanceV4",
						defaultValue = "4.2"
					},
					{
						label = "结束后上传飞书（1=是，0=仅本地CSV）",
						style = 0,
						saveKey = "gmParmonPerfAutoUpload",
						defaultValue = "1"
					},
					{
						label = "飞书标题前缀（留空自动生成）",
						style = 0,
						saveKey = "gmParmonPerfTitle"
					},
					{
						label = "XRobot 通知邮箱（留空不通知）",
						style = 0,
						saveKey = "gmParmonPerfNotifyEmail",
						defaultValue = "bincong.wu@funplus.com"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "runParmonCompositeBatchGpuPerfTest",
				buttonText = "开始",
				subStyle = 0,
				label = "批量动态幻化 Parmon GPU 采集（真机）",
				style = 3,
				subItems = {
					{
						label = "幻化模板 ID",
						style = 0,
						saveKey = "gmParmonCompositeTemplateId",
						defaultValue = "1021300"
					},
					{
						label = "单只预热时长（秒）",
						style = 0,
						saveKey = "gmParmonCompositeWarmup",
						defaultValue = "2"
					},
					{
						label = "单只采样时长（秒）",
						style = 0,
						saveKey = "gmParmonCompositeDuration",
						defaultValue = "10"
					},
					{
						label = "采样间隔（帧）",
						style = 0,
						saveKey = "gmParmonCompositeInterval",
						defaultValue = "5"
					},
					{
						label = "固定镜头 FOV",
						style = 0,
						saveKey = "gmParmonCompositeFov",
						defaultValue = "35"
					},
					{
						label = "固定镜头距离（米，默认4.2）",
						style = 0,
						saveKey = "gmParmonCompositeDistanceV4",
						defaultValue = "4.2"
					},
					{
						label = "模型画面上移（米，默认0.5）",
						style = 0,
						saveKey = "gmParmonCompositeVerticalOffsetV3",
						defaultValue = "0.5"
					},
					{
						label = "结束后上传飞书（1=是，0=仅本地CSV）",
						style = 0,
						saveKey = "gmParmonCompositeAutoUpload",
						defaultValue = "1"
					},
					{
						label = "飞书标题前缀（留空自动生成）",
						style = 0,
						saveKey = "gmParmonCompositeTitle"
					},
					{
						label = "XRobot 通知邮箱（留空不通知）",
						style = 0,
						saveKey = "gmParmonCompositeNotifyEmail",
						defaultValue = "bincong.wu@funplus.com"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "stopParmonBatchGpuPerfTest",
				buttonText = "停止",
				subStyle = 2,
				label = "停止 Parmon GPU 采集",
				style = 1
			},
			{
				func = "openHierarchy",
				buttonText = "开启",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_HIERARCHY")
			},
			{
				func = "openInspector",
				buttonText = "开启",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_INSPECTOR")
			},
			{
				func = "openSrDebugger",
				buttonText = "开启",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_OPEN_SR_DEBUGGER")
			},
			{
				func = "debugTimeline",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_DEBUG_TIMELINE"),
				subItems = {
					{
						label = "resId",
						style = 0,
						saveKey = "debugTimelineResId"
					},
					{
						label = "time",
						style = 0,
						saveKey = "debugTimelineTime"
					},
					{
						label = "stopTime",
						style = 0,
						saveKey = "debugTimelineDuration"
					}
				}
			},
			{
				onBtnRelease = true,
				func = "playTimelineInfoDataSequential",
				buttonText = "开始",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_PLAY_TIMELINE_INFO_DATA_SEQUENTIAL")
			},
			{
				onBtnRelease = true,
				func = "teleportRandomInactiveNTimes",
				buttonText = "确定",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_TELEPORT_RANDOM_INACTIVE_NTIMES")
			},
			{
				func = "openUIListNTimes",
				buttonText = "开始",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_OPEN_UILIST_NTIMES"),
				subItems = {
					{
						style = 0,
						label = GmToolUtils.getGmGameString("GM_OPEN_UILIST_NTIMES_L920")
					},
					{
						style = 0,
						paramType = "number",
						defaultValue = "1",
						label = GmToolUtils.getGmGameString("GM_OPEN_UILIST_NTIMES_L921")
					}
				}
			},
			{
				func = "randomCastPetSkillsNTimes",
				buttonText = "开始",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_RANDOM_CAST_PET_SKILLS_NTIMES"),
				subItems = {
					{
						style = 0,
						label = GmToolUtils.getGmGameString("GM_RANDOM_CAST_PET_SKILLS_NTIMES_L926")
					},
					{
						style = 0,
						paramType = "number",
						defaultValue = "1",
						label = GmToolUtils.getGmGameString("GM_RANDOM_CAST_PET_SKILLS_NTIMES_L927")
					},
					{
						style = 0,
						paramType = "number",
						defaultValue = "1",
						label = GmToolUtils.getGmGameString("GM_RANDOM_CAST_PET_SKILLS_NTIMES_L928")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "rotatePetsAndCastUlt",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_ROTATE_PETS_AND_CAST_ULT"),
				buttonText = GmToolUtils.getGmGameString("GM_ROTATE_PETS_AND_CAST_ULT_BUTTON")
			},
			{
				func = "addAllItems",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_ADD_ALL_ITEMS"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_EXECUTE"),
				subItems = {
					{
						style = 0,
						defaultValue = "1,2,3,4,5,8,11",
						label = GmToolUtils.getGmGameString("GM_ADD_ALL_ITEMS_L934")
					}
				}
			},
			{
				func = "recordCameraPosEveryT",
				buttonText = "开始",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_RECORD_CAMERA_POS_EVERY_T")
			},
			{
				func = "randomCreatePuppetsAndFight",
				buttonText = "执行",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_RANDOM_CREATE_PUPPETS_AND_FIGHT"),
				subItems = {
					{
						style = 0,
						paramType = "number",
						defaultValue = "1",
						label = GmToolUtils.getGmGameString("GM_RANDOM_CREATE_PUPPETS_AND_FIGHT_L940")
					}
				}
			},
			{
				onBtnRelease = true,
				func = "autoPathFindByFeiShuPoints",
				buttonText = "开始",
				subStyle = 0,
				style = 3,
				label = GmToolUtils.getGmGameString("GM_AUTO_PATH_FIND_BY_FEI_SHU_POINTS"),
				subItems = {
					{
						style = 0,
						paramType = "number",
						defaultValue = "101",
						label = GmToolUtils.getGmGameString("GM_AUTO_PATH_FIND_BY_FEI_SHU_POINTS_L945")
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Avatar,
		funcList = {
			{
				onBtnRelease = true,
				func = "exportShopAvatarStainPart",
				buttonText = "导出",
				subStyle = 0,
				label = "商城染色：导出当前服装部件",
				style = 3,
				subItems = {
					{
						label = "搭配名称",
						tips = "同一搭配的各部件填写相同名称；修改名称可导出另一搭配",
						saveKey = "shopAvatarStainExportName",
						defaultValue = "",
						style = 0,
						paramType = "string"
					}
				}
			},
			{
				func = "disablePlayerFirstInit",
				checkFunc = "checkDisablePlayerFirstInit",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_DISABLE_PLAYER_FIRST_INIT")
			},
			{
				onBtnRelease = true,
				func = "changePlayerAppearance",
				subStyle = 0,
				style = 2,
				label = GmToolUtils.getGmGameString("GM_CHANGE_PLAYER_APPEARANCE"),
				buttonText = GmToolUtils.getGmGameString("GM_BUTTON_SWITCH")
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Temporary,
		funcList = {
			{
				onBtnRelease = true,
				func = "openHomeCampReportPreview",
				buttonText = "打开",
				subStyle = 2,
				label = "打开驿站举报界面（预览）",
				style = 1
			},
			{
				func = "openRankBase",
				buttonText = "打开",
				subStyle = 0,
				label = "打开排行榜",
				style = 3,
				subItems = {
					{
						label = "rankId",
						style = 0,
						paramType = "number",
						defaultValue = "1"
					}
				}
			},
			{
				func = "debugSimulateCafePetIvUp",
				buttonText = "Run",
				subStyle = 0,
				label = "Cafe pet IV up sim",
				style = 3,
				subItems = {
					{
						label = "propIndex",
						style = 0,
						saveKey = "cafePetIvUpPropIndex",
						defaultValue = "1"
					},
					{
						label = "addValue",
						style = 0,
						saveKey = "cafePetIvUpAddValue",
						defaultValue = "1"
					},
					{
						label = "openNow(1/0)",
						style = 0,
						saveKey = "cafePetIvUpOpenNow",
						defaultValue = "0"
					}
				}
			},
			{
				func = "setNvidiaVoiceTest",
				checkFunc = "getNvidiaVoiceTest",
				subStyle = 0,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_SET_NVIDIA_VOICE_TEST")
			},
			{
				func = "connectLocalASRServer",
				buttonText = "Ping",
				subStyle = 0,
				label = "ASR local server",
				style = 3,
				subItems = {
					{
						label = "IP",
						style = 0,
						saveKey = "nvidiaASRIP",
						defaultValue = "127.0.0.1"
					},
					{
						label = "Port",
						style = 0,
						saveKey = "nvidiaASRPort",
						defaultValue = "8000"
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.Achievement,
		funcList = {
			{
				onBtnRelease = true,
				func = "showAchievements",
				buttonText = "打开",
				subStyle = 2,
				label = "打开 Google 成就页",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "clearPlatformAchievement",
				buttonText = "清除",
				subStyle = 0,
				label = "Steam Clear Achievement",
				style = 3,
				subItems = {
					{
						label = "Achievement ID",
						saveKey = "platformClearAchievementId",
						defaultValue = "1",
						style = 0,
						paramType = "number"
					}
				}
			}
		}
	},
	{
		type = 2,
		label = GmToolUtils.FuncTabLabel.XboxAchievement,
		funcList = {
			{
				onBtnRelease = true,
				func = "unlockAllAchievements",
				subStyle = 2,
				style = 1,
				label = GmToolUtils.getGmGameString("GM_UNLOCK_ALL_ACHIEVEMENTS"),
				buttonText = GmToolUtils.getGmGameString("GM_UNLOCK_ALL_ACHIEVEMENTS_BUTTON")
			},
			{
				subSearch = true,
				func = "unlockAchievement",
				dataFunc = "getAchievementList",
				subStyle = 0,
				style = 4,
				label = GmToolUtils.getGmGameString("GM_UNLOCK_ACHIEVEMENT"),
				subItems = {
					{
						defaultValue = "1",
						style = 0,
						paramType = "number",
						label = GmToolUtils.getGmGameString("GM_UNLOCK_ACHIEVEMENT_L1000"),
						tips = GmToolUtils.getGmGameString("GM_UNLOCK_ACHIEVEMENT_TIPS_L1000")
					}
				}
			}
		}
	},
	{
		label = "宠物仓库",
		type = 2,
		funcList = {
			{
				onBtnRelease = true,
				func = "petWarehouseDump",
				buttonText = "查询",
				subStyle = 2,
				label = "仓库查询快照",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "petWarehouseSyncDetails",
				buttonText = "同步",
				subStyle = 0,
				label = "仓库同步详情",
				style = 3,
				subItems = {
					{
						label = "宠物ID列表（逗号/空格分隔）",
						style = 0,
						paramType = "string",
						defaultValue = ""
					}
				}
			},
			{
				onBtnRelease = true,
				func = "petWarehouseMoveIn",
				buttonText = "移入",
				subStyle = 0,
				label = "仓库批量移入",
				style = 3,
				subItems = {
					{
						label = "宠物ID列表（逗号/空格分隔）",
						style = 0,
						paramType = "string",
						defaultValue = ""
					}
				}
			},
			{
				onBtnRelease = true,
				func = "petWarehouseMoveOut",
				buttonText = "移出",
				subStyle = 0,
				label = "仓库批量移出",
				style = 3,
				subItems = {
					{
						label = "宠物ID列表（逗号/空格分隔）",
						style = 0,
						paramType = "string",
						defaultValue = ""
					}
				}
			},
			{
				onBtnRelease = true,
				func = "petWarehouseMoveInAll",
				buttonText = "移入全部",
				subStyle = 2,
				label = "全部背包宠移入仓库",
				style = 1
			},
			{
				onBtnRelease = true,
				func = "petWarehouseMoveOutAll",
				buttonText = "移出全部",
				subStyle = 2,
				label = "全部仓库宠移出背包",
				style = 1
			}
		}
	}
}

function GmToolUtils.exportShopAvatarStainPart(buttons)
	local name = GmToolUtils.getInputValue(buttons, 0)
	local success, result = require("Utils.ShopAvatarStainExport").exportCurrentPart(name)

	pg.global.showBubbleMessageRaw(success and "商城服装染色已导出：" .. result or result)
end

function GmToolUtils.emptyFunc()
	return
end

function GmToolUtils.openHomeCampReportPreview()
	local ui = pg.global.ui

	if not HomelandReportUtils.isHomeCampReportAvailable() then
		ui.tips:showTextTip("Please enter Home Camp first")

		return
	end

	if ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
		ui:close(UIConst.UI_ID_CONFIG)
	end

	HomelandReportUtils.openHomeCampReport(true)
end

function GmToolUtils.getInputValue(inputs, index)
	if inputs == nil then
		return nil
	end

	local input = inputs[index]

	if input == nil then
		return nil
	end

	local inputType = type(input)

	if inputType == "string" or inputType == "number" or inputType == "boolean" then
		return input
	end

	if Utils.isTable(input) then
		if input.value ~= nil then
			return input.value
		end

		if input.text ~= nil then
			return input.text
		end
	end

	local ok, value = pcall(function()
		local inputTransform = input:GetChild("InputField")

		if inputTransform == nil then
			return nil
		end

		local inputField = inputTransform:GetComponent("UTMPInputField")

		return inputField and inputField.text or nil
	end)

	if ok then
		return value
	end

	logger:error("Failed to read GM input at index %s: %s", tostring(index), tostring(value))

	return nil
end

local function getPetWarehouseManagerForGm()
	if pg.me == nil or not Utils.enableClientUseGm(pg.me) then
		return nil, "当前角色未开启客户端 GM"
	end

	local game = pg.game
	local petManage = game and game.petManage
	local manager = petManage and petManage.petWarehouseManager

	if manager == nil then
		return nil, "PetManageSystem 或 PetWarehouseManager 未就绪"
	end

	return manager
end

local function parsePetWarehouseIds(rawValue)
	local raw = tostring(rawValue or "")
	local result = {}

	for petId in string.gmatch(raw, "[^,%s;]+") do
		result[#result + 1] = petId
	end

	if #result == 0 then
		return nil
	end

	return result
end

local function showPetWarehouseGmTip(message)
	if pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:showTextTip(message)
	end
end

local function isPetBlockedFromWarehouseMoveIn(player, petId)
	if player == nil or petId == nil or petId == "" then
		return true
	end

	local lists = {
		player.petPrepareList,
		player.petExploreList
	}

	for i = 1, #lists do
		local list = lists[i]

		if list then
			for j = 1, #list do
				if list[j] == petId then
					return true
				end
			end
		end
	end

	return false
end

local function collectPetIdsFromBoxMap(boxMap)
	local ids = {}

	if boxMap == nil or type(boxMap.items) ~= "function" then
		return ids
	end

	for _, box in boxMap:items() do
		if box and type(box.items) == "function" then
			for _, petId in box:items() do
				if petId ~= nil and petId ~= "" then
					ids[#ids + 1] = petId
				end
			end
		end
	end

	return ids
end

local function filterWarehouseMoveInPetIds(player, petIds)
	local accepted = {}
	local skipped = 0

	for i = 1, #(petIds or {}) do
		local petId = petIds[i]

		if isPetBlockedFromWarehouseMoveIn(player, petId) then
			skipped = skipped + 1
		else
			accepted[#accepted + 1] = petId
		end
	end

	return accepted, skipped
end

local function getFirstWarehouseBoxId(player)
	local map = player and player.warehousePetBoxMap

	if map and map.sequence and map.sequence[1] then
		return map.sequence[1]
	end

	return 1
end

local function runPetWarehouseTransferGm(params, action, actionName, extraOptions)
	local manager, managerError = getPetWarehouseManagerForGm()

	if manager == nil then
		showPetWarehouseGmTip(managerError)

		return
	end

	local petIds = parsePetWarehouseIds(GmToolUtils.getInputValue(params, 0))

	if petIds == nil then
		showPetWarehouseGmTip("请输入至少一个宠物实例 ID")

		return
	end

	local skipped = 0

	if action == PetWarehouseConst.ACTION.MOVE_IN then
		petIds, skipped = filterWarehouseMoveInPetIds(pg.me, petIds)

		if #petIds == 0 then
			showPetWarehouseGmTip(string.format("%s失败：没有可移入仓库的宠物（已跳过编队 %s 只）", actionName, tostring(skipped)))

			return
		end
	end

	local options = extraOptions or {}
	local operation, reason = manager:startTransfer(action, petIds, options)

	if operation == nil then
		showPetWarehouseGmTip(string.format("%s失败：%s", actionName, tostring(reason)))

		return
	end

	logger:info("[PetWarehouseGM] %s requestId=%s petCount=%s skipped=%s status=%s", actionName, tostring(operation.operationId), tostring(#petIds), tostring(skipped), tostring(operation.status))

	local extra = ""

	if skipped > 0 then
		extra = string.format("，跳过编队 %s 只", tostring(skipped))
	end

	showPetWarehouseGmTip(string.format("%s已发送：%s 只%s，状态=%s", actionName, tostring(#petIds), extra, tostring(operation.status)))
end

function GmToolUtils.petWarehouseDump()
	local manager, managerError = getPetWarehouseManagerForGm()

	if manager == nil then
		showPetWarehouseGmTip(managerError)

		return
	end

	local snapshot = manager:getSnapshot()

	logger:info("[PetWarehouseGM] snapshot=%s", inspect(snapshot))
	showPetWarehouseGmTip(string.format("仓库快照已输出日志，revision=%s", tostring(manager:getRevision())))
end

function GmToolUtils.petWarehouseSyncDetails(params)
	local manager, managerError = getPetWarehouseManagerForGm()

	if manager == nil then
		showPetWarehouseGmTip(managerError)

		return
	end

	local petIds = parsePetWarehouseIds(GmToolUtils.getInputValue(params, 0))

	if petIds == nil then
		showPetWarehouseGmTip("请输入至少一个仓库宠物实例 ID")

		return
	end

	local operation, reason = manager:ensurePetDetails(petIds)

	if operation == nil then
		showPetWarehouseGmTip(string.format("详情同步未发送：%s", tostring(reason)))

		return
	end

	logger:info("[PetWarehouseGM] syncDetails requestId=%s petIds=%s status=%s", tostring(operation.requestId), table.concat(petIds, ","), tostring(operation.status))
	showPetWarehouseGmTip(string.format("详情同步已发送：%s，状态=%s", tostring(operation.requestId), tostring(operation.status)))
end

function GmToolUtils.petWarehouseMoveIn(params)
	runPetWarehouseTransferGm(params, PetWarehouseConst.ACTION.MOVE_IN, "批量移入", {
		allowOverflow = true,
		targetBoxId = getFirstWarehouseBoxId(pg.me)
	})
end

function GmToolUtils.petWarehouseMoveOut(params)
	runPetWarehouseTransferGm(params, PetWarehouseConst.ACTION.MOVE_OUT, "批量移出")
end

function GmToolUtils.setPetHatchReproMode(params)
	if not UNITY_EDITOR then
		pg.global.ui.tips:showTextTip("孵化复现仅支持 Unity Editor")

		return
	end

	local PetHatchReproTest = require("GameApp.Evolution.PetHatchReproTest")
	local mode = tonumber(GmToolUtils.getInputValue(params, 0))
	local ok, message = PetHatchReproTest.arm(mode)

	pg.global.ui.tips:showTextTip(message or ok and "已设置" or "设置失败")
end

function GmToolUtils.petWarehouseMoveInAll()
	local manager, managerError = getPetWarehouseManagerForGm()

	if manager == nil then
		showPetWarehouseGmTip(managerError)

		return
	end

	local player = pg.me
	local allIds = collectPetIdsFromBoxMap(player and player.petBoxMap)
	local petIds, skipped = filterWarehouseMoveInPetIds(player, allIds)

	if #petIds == 0 then
		showPetWarehouseGmTip(string.format("没有可移入仓库的背包宠物（跳过编队 %s 只）", tostring(skipped)))

		return
	end

	local operation, reason = manager:startTransfer(PetWarehouseConst.ACTION.MOVE_IN, petIds, {
		ignoreTransferCountLimit = true,
		allowOverflow = true,
		targetBoxId = getFirstWarehouseBoxId(player)
	})

	if operation == nil then
		showPetWarehouseGmTip(string.format("全部移入失败：%s", tostring(reason)))

		return
	end

	logger:info("[PetWarehouseGM] moveInAll requestId=%s petCount=%s skipped=%s status=%s", tostring(operation.operationId), tostring(#petIds), tostring(skipped), tostring(operation.status))

	local extra = ""

	if skipped > 0 then
		extra = string.format("，跳过编队 %s 只", tostring(skipped))
	end

	showPetWarehouseGmTip(string.format("全部移入已发送：%s 只%s，状态=%s", tostring(#petIds), extra, tostring(operation.status)))
end

function GmToolUtils.petWarehouseMoveOutAll()
	local manager, managerError = getPetWarehouseManagerForGm()

	if manager == nil then
		showPetWarehouseGmTip(managerError)

		return
	end

	local player = pg.me
	local petIds = collectPetIdsFromBoxMap(player and player.warehousePetBoxMap)

	if #petIds == 0 then
		showPetWarehouseGmTip("仓库中没有可移出的宠物")

		return
	end

	local operation, reason = manager:startTransfer(PetWarehouseConst.ACTION.MOVE_OUT, petIds, {
		ignoreTransferCountLimit = true
	})

	if operation == nil then
		showPetWarehouseGmTip(string.format("全部移出失败：%s", tostring(reason)))

		return
	end

	logger:info("[PetWarehouseGM] moveOutAll requestId=%s petCount=%s status=%s", tostring(operation.operationId), tostring(#petIds), tostring(operation.status))
	showPetWarehouseGmTip(string.format("全部移出已发送：%s 只，状态=%s", tostring(#petIds), tostring(operation.status)))
end

function GmToolUtils.setBatchRecycleFault(params)
	if not UNITY_EDITOR then
		pg.global.ui.tips:showTextTip("异常测试仅支持 Unity Editor")

		return
	end

	local BatchRequestTest = require("GameApp.BatchRequest.BatchRequestTest")

	if not Const.OpenBatchRequestDebug then
		BatchRequestTest.clear()
		pg.global.ui.tips:showTextTip("批量请求 Debug 测试已关闭")

		return
	end

	local mode = tonumber(GmToolUtils.getInputValue(params, 0))

	if mode == 0 then
		BatchRequestTest.clear()
		pg.global.ui.tips:showTextTip("已关闭下一轮异常测试；正在执行的用例不受影响")

		return
	end

	local modes = {
		"failure",
		"timeout",
		"disconnect"
	}
	local batchIndex = tonumber(GmToolUtils.getInputValue(params, 1))
	local retryInput = GmToolUtils.getInputValue(params, 2)
	local retryValue = tonumber(retryInput)
	local retryCount = retryValue

	if retryValue == -1 then
		retryCount = nil
	end

	if not modes[mode] or not batchIndex or retryValue == nil or retryValue < -1 or retryValue > Const.BATCH_REQUEST_MAX_RETRY_COUNT or retryValue ~= retryValue or retryValue ~= math.floor(retryValue) then
		pg.global.ui.tips:showTextTip("模式填 0/1/2/3；批次填 0（随机）或正整数；重试填 -1 或非负整数")

		return
	end

	local _, message = BatchRequestTest.arm(modes[mode], batchIndex, retryCount)

	pg.global.ui.tips:showTextTip(message)
end

function GmToolUtils.useServerBatchItem(params)
	if not UNITY_EDITOR then
		pg.global.ui.tips:showTextTip("并行道具测试仅支持 Unity Editor")

		return
	end

	local BatchRequestTest = require("GameApp.BatchRequest.BatchRequestTest")
	local itemId = tonumber(GmToolUtils.getInputValue(params, 0))
	local itemNum = tonumber(GmToolUtils.getInputValue(params, 1))
	local ok, reason = BatchRequestTest.useServerBatchItem(itemId, itemNum)

	if ok then
		pg.global.ui.tips:showTextTip("已发送并行道具使用请求")

		return
	end

	pg.global.ui.tips:showTextTip("并行道具请求未发送：" .. tostring(reason))
end

function GmToolUtils.setServerBatchItemFault(params)
	if not UNITY_EDITOR then
		pg.global.ui.tips:showTextTip("并行道具异常测试仅支持 Unity Editor")

		return
	end

	local BatchRequestTest = require("GameApp.BatchRequest.BatchRequestTest")
	local mode = tonumber(GmToolUtils.getInputValue(params, 0))
	local reconnectSeconds = tonumber(GmToolUtils.getInputValue(params, 1))
	local ok, message = BatchRequestTest.serverBatchFault(mode, reconnectSeconds)

	pg.global.ui.tips:showTextTip(message or ok and "已执行" or "执行失败")
end

function GmToolUtils.serverBatchItemStats()
	if not UNITY_EDITOR then
		pg.global.ui.tips:showTextTip("并行道具状态查询仅支持 Unity Editor")

		return
	end

	local BatchRequestTest = require("GameApp.BatchRequest.BatchRequestTest")
	local ok, statsOrReason = BatchRequestTest.serverBatchStats()

	if not ok then
		pg.global.ui.tips:showTextTip("状态查询失败：" .. tostring(statsOrReason))

		return
	end

	pg.global.ui.tips:showTextTip("并行道具请求状态已查询，pending=" .. tostring(statsOrReason.pending))
end

local function getCoreCarryCertifySnapshotLogValue(value)
	return value == nil and "nil" or value
end

function GmToolUtils.queryCoreCarryCertifyInfo(params)
	local invId = tonumber(GmToolUtils.getInputValue(params, 0))
	local genId = tonumber(GmToolUtils.getInputValue(params, 1))

	if pg.me == nil then
		pg.global.ui.tips:showTextTip("当前角色未就绪，无法查询")

		return
	end

	if invId == nil or genId == nil or invId <= 0 or genId <= 0 or invId >= math.huge or genId >= math.huge or invId ~= math.floor(invId) or genId ~= math.floor(genId) then
		pg.global.ui.tips:showTextTip("invId 和 genId 必须为正整数")

		return
	end

	local item, noticeId = ItemUtils.getItem(pg.me, invId, genId)

	if item == nil then
		if noticeId and pg.global.showBubbleMessageById then
			pg.global.showBubbleMessageById(noticeId)
		else
			pg.global.ui.tips:showTextTip("未找到物品")
		end

		return
	end

	if not ItemUtils.isCoreCarryItem(item.id) then
		pg.global.ui.tips:showTextTip("该物品不是核心携带物")

		return
	end

	local coreCarryInfo = ItemUtils.getPropertyWithType(item)

	if coreCarryInfo == nil or coreCarryInfo.isValid == nil or not coreCarryInfo:isValid() then
		pg.global.ui.tips:showTextTip("核心携带物数据无效")

		return
	end

	if not LoggerManager.checkLogger(LoggerConst.INFO) then
		pg.global.ui.tips:showTextTip("请先开启 INFO 日志后再查询")

		return
	end

	local displayState, requiredLevel, displayLevel = PetManagementDataHelper.getCoreCarryCertifyDisplayState(coreCarryInfo)
	local isCertified = PetManagementDataHelper.isCoreCarryCertified(coreCarryInfo)
	local ownerPetId = coreCarryInfo.ownerPetId
	local ownerPetInfo = ownerPetId and ownerPetId ~= "" and pg.me.pets and pg.me.pets[ownerPetId] or nil
	local ownerBaseFormPet, ownerPetData = PetManagementDataHelper.getPetBaseFormPet(ownerPetInfo)
	local activationState = PetManagementDataHelper.getCoreCarryCertifyActivationState(coreCarryInfo, ownerPetInfo)
	local matchingBaseFormPetInfo = PetManagementDataHelper.getCoreCarryCertifiedPetInfo(coreCarryInfo, ownerPetInfo)
	local skillPairResolved, beforeSkillInfo, afterSkillInfo = pcall(PetManagementDataHelper.getCoreCarryCertifySkillPair, coreCarryInfo)
	local skillPairError

	if not skillPairResolved then
		skillPairError = tostring(beforeSkillInfo)
		beforeSkillInfo, afterSkillInfo = nil
	end

	local level, exp = coreCarryInfo:getLevelAndExp()
	local certifiedBaseFormPet = coreCarryInfo.certifiedBaseFormPet
	local displayStateName = {
		[PetManagementDataHelper.CoreCarryContactState.Unlocked] = "Unlocked",
		[PetManagementDataHelper.CoreCarryContactState.NotContact] = "NotContact",
		[PetManagementDataHelper.CoreCarryContactState.Contacted] = "Contacted"
	}
	local itemData = ItemData[item.id]

	logger:info("[CoreCarryCertifySnapshot][ClientSync] %s", inspect({
		source = "客户端同步快照（只读查询）",
		invId = invId,
		genId = genId,
		itemId = item.id,
		quality = getCoreCarryCertifySnapshotLogValue(itemData and itemData.quality or nil),
		level = getCoreCarryCertifySnapshotLogValue(level or displayLevel),
		exp = getCoreCarryCertifySnapshotLogValue(exp),
		totalExp = coreCarryInfo.totalExp,
		requiredLevel = getCoreCarryCertifySnapshotLogValue(requiredLevel),
		displayState = displayStateName[displayState] or tostring(displayState),
		isCertified = isCertified,
		certifiedBaseFormPet = certifiedBaseFormPet,
		ownerPetId = getCoreCarryCertifySnapshotLogValue(ownerPetId),
		ownerPetInfoFound = ownerPetInfo ~= nil,
		ownerTemplateId = getCoreCarryCertifySnapshotLogValue(ownerPetInfo and ownerPetInfo.templateId or nil),
		ownerBaseFormPet = getCoreCarryCertifySnapshotLogValue(ownerBaseFormPet),
		ownerPetDataFound = ownerPetData ~= nil,
		baseFormMatched = ownerBaseFormPet ~= nil and isCertified and ownerBaseFormPet == certifiedBaseFormPet,
		activationState = activationState,
		active = activationState == PetManagementDataHelper.CoreCarryCertifyActivationState.Active,
		matchingBaseFormPetId = getCoreCarryCertifySnapshotLogValue(matchingBaseFormPetInfo and matchingBaseFormPetInfo.id or nil),
		matchingBaseFormPetFound = matchingBaseFormPetInfo ~= nil,
		skillPairError = skillPairError,
		beforeSkillAbilityId = getCoreCarryCertifySnapshotLogValue(beforeSkillInfo and beforeSkillInfo.abilityId or nil),
		afterSkillAbilityId = getCoreCarryCertifySnapshotLogValue(afterSkillInfo and afterSkillInfo.abilityId or nil)
	}))
	pg.global.ui.tips:showTextTip("已输出到日志")
end

local function getGmInputText(params, index)
	if params == nil or params[index] == nil then
		return nil
	end

	local input = params[index]:GetChild("InputField")

	if input == nil then
		return nil
	end

	local inputField = input:GetComponent("UTMPInputField")

	return inputField and inputField.text or nil
end

function GmToolUtils.openRankBase(params)
	local rankId = tonumber(getGmInputText(params, 0))

	if rankId == nil or RankBaseData[rankId] == nil then
		logger:error("openRankBase failed, rankId is invalid:", rankId)

		return
	end

	pg.global.ui:open(UIConst.UI_ID_RANK_BASE, {
		rankId = rankId
	})
end

local function playDialogueGraph(dialogueGraphId)
	dialogueGraphId = tonumber(dialogueGraphId)

	if dialogueGraphId == nil or dialogueGraphId <= 0 then
		pg.global.ui.tips:showTextTip("Invalid dialogue graph id")

		return
	end

	local dialogueSystem = pg and pg.game and pg.game.dialogue or nil

	if dialogueSystem == nil then
		pg.global.ui.tips:showTextTip("DialogueSystem is not ready")

		return
	end

	if not dialogueSystem:isDialogueGraphIdValid(dialogueGraphId) then
		pg.global.ui.tips:showTextTip("Invalid dialogue graph id")

		return
	end

	if dialogueSystem:isLoadingScene() then
		pg.global.ui.tips:showTextTip("Scene is loading")

		return
	end

	local dialogueInfo = dialogueSystem:initDialogueGraphInfo(dialogueGraphId, nil, nil, nil, nil)

	if not dialogueSystem:canPlayTargetDialogueGraph(dialogueInfo) then
		pg.global.ui.tips:showTextTip("Dialogue priority blocked")

		return
	end

	pg.__dialogueGraphCompiledRunnerDiagnostics = nil
	pg.__dialogueGraphCompiledRunnerRuntimeError = nil

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[DialogueGraphGM] play dialogueGraphId=%s", tostring(dialogueGraphId))
	end

	pg.global.ui:close(62)

	local ok, err = xpcall(function()
		dialogueSystem:playDialogueGraph(dialogueGraphId, function(retFlag)
			if LoggerManager.checkLogger(LoggerConst.INFO) then
				logger:info("[DialogueGraphGM] graph=%s ret=%s", tostring(dialogueGraphId), tostring(retFlag))
			end

			pg.global.ui.tips:showTextTip(string.format("DialogueGraph %s done", tostring(dialogueGraphId)))
		end)
	end, debug.traceback)

	if not ok then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[DialogueGraphGM] graph=%s error=%s", tostring(dialogueGraphId), tostring(err))
		end

		pg.global.ui.tips:showTextTip("DialogueGraph play failed")
	end
end

local DIALOGUE_GRAPH_PERFORMANCE_ENABLED_KEY = "DialogueGraphPerformanceEnabled"
local dialogueGraphPerformancePrefs = PrefsCacheUtils.GetInstance()

DialogueGraphPerformance.setEnabled(dialogueGraphPerformancePrefs:getBool(DIALOGUE_GRAPH_PERFORMANCE_ENABLED_KEY, false))

function GmToolUtils.setDialogueGraphPerformanceEnabled(enabled)
	DialogueGraphPerformance.setEnabled(enabled)
	dialogueGraphPerformancePrefs:setBoolImmediately(DIALOGUE_GRAPH_PERFORMANCE_ENABLED_KEY, enabled == true)
end

function GmToolUtils.getDialogueGraphPerformanceEnabled()
	return DialogueGraphPerformance.isRequestedEnabled()
end

function GmToolUtils.playDialogueGraph(params)
	playDialogueGraph(getGmInputText(params, 0))
end

function GmToolUtils.execCmdList(selectData)
	local clientXPartGMHook = require("Utils.ClientXPartGMHook")
	local isHook = clientXPartGMHook.hookGMExecCmdList(selectData, GmToolUtils._privateExecCmdList)

	if isHook == true then
		print(string.format("@fjs TrackHookGM execCmdList, hook[%s]", tostring(isHook), table.val_to_str(selectData)))

		return
	end

	GmToolUtils._privateExecCmdList(selectData)
end

function GmToolUtils._privateExecCmdList(selectData)
	local data = require(GmToolUtils.CMDListPrefix .. selectData.value)
	local delay = 0

	for _, cmd in ipairs(data.steps) do
		TimerManager.addTimer(delay, function()
			pg.me:serverMsg("RPC_CS_DoPlayerGmCmd", cmd.mid, cmd.params)
		end)

		delay = delay + cmd.delay
	end
end

function GmToolUtils.getCmdListFileName()
	local data = {}

	for _, file in ipairs(GMCMDList) do
		local fileData
		local filePath = GmToolUtils.CMDListPrefix .. file

		pcall(function()
			fileData = require(filePath)
		end)

		if fileData ~= nil then
			local istName = fileData.name or "UNKNOWN"

			table.insert(data, {
				tIndex = 0,
				label = istName,
				id = file,
				value = file,
				iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
			})
		end
	end

	return data
end

function GmToolUtils.enableQuickMove(enable)
	GmToolUtils.quickMoveEnabled = enable
end

function GmToolUtils.checkQuickMove()
	return GmToolUtils.quickMoveEnabled
end

function GmToolUtils.setSkipRobEggEnterCheck(enable)
	RobEggConst.GM_SKIP_ENTER_CHECK = enable
end

function GmToolUtils.getSkipRobEggEnterCheck()
	return RobEggConst.GM_SKIP_ENTER_CHECK
end

local cacheOceanHeight = true

function GmToolUtils.setOceanHeight(rising)
	cacheOceanHeight = rising

	CS.FunPlus.WorldX.GameApp.Sandbox.SandboxUtils.SetOceanHeight(rising, 3)
end

function GmToolUtils.getOceanHeight()
	return cacheOceanHeight
end

function GmToolUtils.enableMainPlayer(enable)
	if pg.pawn and pg.pawn.eModel then
		pg.pawn:setVisible(ClientConst.MODEL_VISIBLE_KEY.GM, not enable)
	end
end

function GmToolUtils.checkMainPlayerEnable()
	if pg.pawn and pg.pawn.eModel then
		local visible = pg.pawn.visible

		return not visible
	end

	return false
end

function GmToolUtils.enableOBCamera(enable)
	local moveSpeed = GmToolUtils.obCameraSettingSubItems.MoveItem.defaultValue
	local rotationSpeed = GmToolUtils.obCameraSettingSubItems.RotationItem.defaultValue
	local fovScollSpeed = GmToolUtils.obCameraSettingSubItems.FOVScollItem.defaultValue

	if enable then
		pg.game.input:enableControlInput(false)
		pg.game.input:enableHudInput(false)
		CS.FunPlus.WorldX.Utils.GmToolUtils.OpenOBCamera(tonumber(moveSpeed), tonumber(rotationSpeed), tonumber(fovScollSpeed))
	else
		pg.game.input:enableControlInput(true)
		pg.game.input:enableHudInput(true)
		CS.FunPlus.WorldX.Utils.GmToolUtils.CloseOBCamera()
	end
end

function GmToolUtils.checkGmDofState()
	return GmToolUtils.GmDofState
end

function GmToolUtils.setGmDofState(state)
	GmToolUtils.GmDofState = state
	GmToolUtils.GmDofObj = pg.game.camera:setDofEnable("GM", state)

	if GmToolUtils.GmDofState and GmToolUtils.GmDofObj then
		pgUtils.SetDofPriority(GmToolUtils.GmDofObj, 10)
		TimerManager.addTimer(0.1, function()
			if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
				pg.global.ui.config:refreshFuncList()
			end

			if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG_TOPPING) then
				pg.global.ui.configTopping:refreshDofParam()
			end
		end)
	end
end

function GmToolUtils.setCaptureCloseupEnable(enable)
	pg.global.prefsCacheUtils:setBool(CaptureConst.CLOSEUP_CAMERA.PREF_KEY_ENABLE, enable)
end

function GmToolUtils.getCaptureCloseupEnable()
	return pg.global.prefsCacheUtils:getBool(CaptureConst.CLOSEUP_CAMERA.PREF_KEY_ENABLE, false)
end

function GmToolUtils.getCaptureCloseupDistance()
	local cfg = CaptureConst.CLOSEUP_CAMERA
	local s = pg.global.prefsCacheUtils:getString(cfg.PREF_KEY_DISTANCE, "")

	if s == nil or s == "" then
		return cfg.DEFAULT_DISTANCE
	end

	return tonumber(s) or cfg.DEFAULT_DISTANCE
end

function GmToolUtils.saveCaptureCloseupParams(params)
	logger:info("@CaptureCloseup distance saved: %s", tostring(GmToolUtils.getCaptureCloseupDistance()))
end

function GmToolUtils.getDofParam(funcParam)
	if not GmToolUtils.GmDofState or not GmToolUtils.GmDofObj then
		return GmToolUtils.GmDofValueCache[funcParam] or 1
	end

	local value = pgUtils.GetDofVolumeValue(GmToolUtils.GmDofObj, funcParam)

	return value >= 0 and value or 1
end

function GmToolUtils.setDofParam(value, funcParam)
	if GmToolUtils.GmDofObj == nil then
		return
	end

	GmToolUtils.GmDofValueCache[funcParam] = value

	pgUtils.SetDofVolumeValue(GmToolUtils.GmDofObj, funcParam, value)
end

function GmToolUtils.checkOBCamera()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.OBCameraEnable()
end

function GmToolUtils.changeOBCameraSetting(buttons)
	local moveSpeed = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local rotationSpeed = buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local fovScollSpeed = buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text

	GmToolUtils.obCameraSettingSubItems.MoveItem.defaultValue = moveSpeed
	GmToolUtils.obCameraSettingSubItems.RotationItem.defaultValue = rotationSpeed
	GmToolUtils.obCameraSettingSubItems.FOVScollItem.defaultValue = fovScollSpeed

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetOBCameraSetting(tonumber(moveSpeed), tonumber(rotationSpeed), tonumber(fovScollSpeed))

	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		logger:debug(moveSpeed, rotationSpeed, fovScollSpeed)
	end
end

function GmToolUtils.getPosAmplitudes(funcParam)
	local enable = CS.FunPlus.WorldX.Utils.GmToolUtils.OBCameraEnable()
	local defaultAmplitudes

	defaultAmplitudes = funcParam == "x" and 0 or 0.2

	if not enable then
		return defaultAmplitudes
	end

	local value = CS.FunPlus.WorldX.Utils.GmToolUtils.GetPosAmplitudes(funcParam)

	return value > 0 and value or defaultAmplitudes
end

function GmToolUtils.setPosAmplitudes(value, funcParam)
	local isEnable = CS.FunPlus.WorldX.Utils.GmToolUtils.OBCameraEnable()

	if isEnable ~= true then
		return
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetPosAmplitudes(funcParam, value)
end

function GmToolUtils.obCameraFollowEntity(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetOBCameraFollowEntity(actorId)
end

function GmToolUtils.getSlowRatio()
	local frameList = {
		{
			label = "正常",
			value = 1
		},
		{
			label = "1档(2)",
			value = 0.5
		},
		{
			label = "2档(4)",
			value = 0.25
		},
		{
			label = "3档(10)",
			value = 0.1
		}
	}

	return frameList
end

function GmToolUtils.getSlowRatioSelected()
	local v = pg.game.baseTimeScale

	if v > 0.99 then
		return 0
	elseif v > 0.49 then
		return 1
	elseif v > 0.24 then
		return 2
	else
		return 3
	end
end

function GmToolUtils.setSlowRatio(selectData)
	pg.game.baseTimeScale = selectData.value or 1
end

function GmToolUtils.execFunc(data, ...)
	GmToolUtils[data.func](...)
	GmToolUtils.addRecentlyUse(data)
end

local function cmpByValue(a, b)
	if a.value == b.value then
		return false
	end

	return a.value < b.value
end

function GmToolUtils.setVegetationShow(buttons)
	local typeIndexStr = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local showFlagStr = buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local typeIndex = tonumber(typeIndexStr)
	local showFlag = tonumber(showFlagStr)

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetVegetationShow(typeIndex, showFlag == 1)
end

function GmToolUtils.setMeListenRange(buttons)
	local listenRangeStr = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local listenRange = tonumber(listenRangeStr)

	pg.me.listenRange = listenRange
end

function GmToolUtils.getDefaultValue(item)
	if item.saveKey then
		return pg.global.prefsCacheUtils:getString(item.saveKey, "")
	end

	return ""
end

function GmToolUtils.getSceneList()
	local sceneList = {}

	for k, v in pairs(SceneData) do
		if v.canEnterByAltX and v.canEnterByAltX ~= 0 then
			sceneList[#sceneList + 1] = {
				tIndex = 0,
				label = k .. " " .. GmToolUtils.getGmLocalizationText(v.name),
				id = k,
				value = k,
				iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
			}
		end
	end

	table.sort(sceneList, cmpByValue)

	return sceneList
end

function GmToolUtils.getSandboxList()
	local SceneUtils = require("Common.Utils.SceneUtils")
	local sandboxList = {}

	if pg.me == nil or pg.me.space == nil then
		return
	end

	local sceneId = pg.me.space.sceneId
	local sandboxData = SceneUtils.getSceneSandboxData(sceneId)

	for k, v in pairs(sandboxData) do
		sandboxList[#sandboxList + 1] = {
			tIndex = 0,
			label = v.name or "",
			id = k,
			value = k,
			iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
		}
	end

	table.sort(sandboxList, cmpByValue)

	return sandboxList
end

function GmToolUtils.getSceneInactiveTitleIdList()
	local SceneUtils = require("Common.Utils.SceneUtils")

	if pg.me == nil or pg.me.space == nil then
		return
	end

	local sceneId = pg.me.space.sceneId
	local sandboxData = SceneUtils.getSceneSandboxData(sceneId)

	if not sandboxData then
		return {}
	end

	local list = {}

	for k, v in pairs(sandboxData) do
		local title = v.markConfig and v.markConfig.inactiveTitle or ""

		if title ~= "" and (string.find(title, "地脉", 1, true) or string.find(title, "地宫", 1, true)) then
			list[#list + 1] = {
				label = v.markConfig.title,
				id = k,
				value = k
			}
		end
	end

	table.sort(list, cmpByValue)

	return list
end

function GmToolUtils.teleportRandomInactiveNTimes(params)
	local nStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local n = tonumber(nStr) or 0

	if n <= 0 then
		pg.global.ui.tips:showTextTip("请输入有效次数")

		return
	end

	local list = GmToolUtils.getSceneInactiveTitleIdList()

	if not list or #list == 0 then
		pg.global.ui.tips:showTextTip("无可传送的目标ID")

		return
	end

	pg.global.ui:close(62)

	local uiId = 21
	local uiPauseSeconds = 5
	local postTeleportWaitSeconds = 20
	local cycleSeconds = uiPauseSeconds + postTeleportWaitSeconds
	local gap = 2

	for i = 1, n do
		local baseDelay = (i - 1) * cycleSeconds + gap

		TimerManager.addTimer(baseDelay, function()
			pg.global.ui:open(uiId)
		end)
		TimerManager.addTimer(baseDelay + uiPauseSeconds, function()
			local idx = math.random(1, #list)
			local target = list[idx]

			if LoggerManager.checkLogger(LoggerConst.INFO) then
				logger:info("[teleportRandomInactiveNTimes] idx=%d, target=%s, target.id=%s", idx, target.label, tostring(target.value))
			end

			if target and target.value then
				pg.global.ui:close(uiId)
				pg.me:doGmCmd("teleportToSandbox", target.value)
			end
		end)
	end

	pg.global.ui.tips:showTextTip("开始随机传送")
end

function GmToolUtils.openUIListNTimes(params)
	local listStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text or ""
	local nStr = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text or "1"
	local n = tonumber(nStr) or 0

	if n <= 0 then
		pg.global.ui.tips:showTextTip("请输入有效次数")

		return
	end

	local entries = {}

	for token in string.gmatch(listStr, "[^,;]+") do
		local t = string.gsub(token, "^%s*(.-)%s*$", "%1")

		if t ~= "" then
			local uiId = tonumber(t)

			if uiId then
				entries[#entries + 1] = {
					id = uiId
				}
			end
		end
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[openUIListNTimes] entries=%s", inspect(entries))
	end

	if #entries == 0 then
		pg.global.ui.tips:showTextTip("请输入有效UI列表")

		return
	end

	pg.global.ui:close(62)

	local openDuration = 5
	local delay = 2
	local openedUIStack = {}

	for i = 1, n do
		for _, e in ipairs(entries) do
			TimerManager.addTimer(delay, function()
				if e.id == 0 then
					local topUid = table.remove(openedUIStack)

					if LoggerManager.checkLogger(LoggerConst.INFO) then
						logger:info("[openUIListNTimes] close top uiId=%s", tostring(topUid))
					end

					if topUid then
						pg.global.ui:close(topUid)
					end
				elseif e.id == UIConst.UI_ID_APPEARANCE_V2 then
					if LoggerManager.checkLogger(LoggerConst.INFO) then
						logger:info("[openUIListNTimes] open uiId=%s with params", tostring(e.id))
					end

					pg.global.ui:open(UIConst.UI_ID_APPEARANCE_V2, {
						paramsTable = {
							needShowAvatar = true
						}
					})

					openedUIStack[#openedUIStack + 1] = e.id
				else
					if LoggerManager.checkLogger(LoggerConst.INFO) then
						logger:info("[openUIListNTimes] open uiId=%s", tostring(e.id))
					end

					pg.global.ui:open(e.id)

					openedUIStack[#openedUIStack + 1] = e.id
				end
			end)

			delay = delay + openDuration
		end
	end

	pg.global.ui.tips:showTextTip("开始批量打开UI")
end

function GmToolUtils.randomCastPetSkillsNTimes(params)
	local listStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text or ""
	local nStr = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text or "1"
	local petNumberStr = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text or "1"
	local n = tonumber(nStr) or 0
	local petNumber = tonumber(petNumberStr) or 1

	if petNumber <= 0 then
		petNumber = 1
	end

	if n <= 0 then
		pg.global.ui.tips:showTextTip("请输入有效次数")

		return
	end

	local map = {
		Q = "Hud/SkillQ",
		R = "Hud/SkillR",
		E = "Hud/SkillE"
	}
	local paths = {}

	for token in string.gmatch(listStr, "[^,;]+") do
		local t = string.gsub(token, "^%s*(.-)%s*$", "%1")

		t = string.upper(t or "")

		if map[t] then
			paths[#paths + 1] = map[t]
		end
	end

	if #paths == 0 then
		paths = {
			"Hud/SkillQ",
			"Hud/SkillE",
			"Hud/SkillR"
		}
	end

	local delay = 0
	local gap = 10

	pg.me:doGmCmd("setGmMode", 1)
	pg.global.ui:close(62)

	for p = 1, petNumber do
		local petIndex = (p - 1) % 4 + 1
		local switchPath = "Hud/Pet" .. tostring(petIndex)

		TimerManager.addTimer(delay, function()
			local ok = pg.game.input:manuallyTriggerAction(switchPath)

			if LoggerManager.checkLogger(LoggerConst.INFO) then
				logger:info("[randomCastPetSkillsNTimes] switch path=%s, ok=%s", switchPath, tostring(ok))
			end
		end)

		delay = delay + 1

		for i = 1, n do
			TimerManager.addTimer(delay, function()
				local path = paths[math.random(1, #paths)]
				local ok = pg.game.input:manuallyTriggerAction(path)

				if LoggerManager.checkLogger(LoggerConst.INFO) then
					logger:info("[randomCastPetSkillsNTimes] cast path=%s, ok=%s", path, tostring(ok))
				end
			end)

			delay = delay + gap
		end
	end

	pg.global.ui.tips:showTextTip("开始随机释放技能")
end

function GmToolUtils.autoPathFindByFeiShuPoints(parms)
	local id = tonumber(parms[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 101
	local sheetIndex1 = tonumber(2)
	local res = CS.FunPlus.WorldX.Utils.GmToolUtils.GetPerformanceParameters(sheetIndex1)

	if res ~= nil and LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[autoPathFindByFeiShuPoints] %s", tostring(res))
	end

	local pointList = {}
	local resStr = tostring(res or "")

	for line in string.gmatch(resStr, "[^\r\n]+") do
		local s = string.gsub(line or "", "^%s*(.-)%s*$", "%1")

		if s ~= "" then
			local parts = string.split(s, "\t")
			local pointID = tonumber(parts[1])
			local sceneID = tonumber(parts[2])
			local points = parts[3]

			if pointID and points ~= "" then
				pointList[pointID] = {
					sceneID = sceneID,
					points = points
				}
			end
		end
	end

	local pointInfo = pointList[id]
	local points = {}

	if pointInfo and pointInfo.points then
		local jsonStr = ""

		for row in string.gmatch(tostring(pointInfo.points), "UnityEditor%.TransformWorldPlacementJSON:%b{}") do
			if row:find("UnityEditor.TransformWorldPlacementJSON:") then
				jsonStr = row:sub(#"UnityEditor.TransformWorldPlacementJSON:" + 1)
			end

			local success, info = pcall(function()
				return json.decode(jsonStr)
			end)

			if success and info and info.playerPosition then
				local pos = info.playerPosition
				local x = pos.x or pos[1]
				local y = pos.y or pos[2]
				local z = pos.z or pos[3]
				local camRotation = info.rotation
				local cx = camRotation.x or camRotation[1]
				local cy = camRotation.y or camRotation[2]
				local cz = camRotation.z or camRotation[3]
				local cw = camRotation.w or camRotation[4]

				points[#points + 1] = {
					x,
					y,
					z,
					cx,
					cy,
					cz,
					cw
				}
			end
		end
	end

	if #points == 0 then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("未配置坐标点")
		end

		return
	end

	GmToolUtils.__autoPathTxtRunId = (GmToolUtils.__autoPathTxtRunId or 0) + 1

	local runId = GmToolUtils.__autoPathTxtRunId

	if GmToolUtils.__autoPathTxtTimeoutTimerId then
		TimerManager.removeTimer(GmToolUtils.__autoPathTxtTimeoutTimerId)

		GmToolUtils.__autoPathTxtTimeoutTimerId = nil
	end

	GmToolUtils.__autoPathTxtRunning = true
	GmToolUtils.__autoPathTxtPoints = points
	GmToolUtils.__autoPathTxtIndex = 1

	local AutoPathFindUtils = require("Common.Utils.AutoPathFindUtils")
	local Vector3 = CS.UnityEngine.Vector3

	local function _stop()
		if GmToolUtils.__autoPathTxtRunId ~= runId then
			return
		end

		GmToolUtils.__autoPathTxtRunning = false
		GmToolUtils.__autoPathTxtPoints = nil
		GmToolUtils.__autoPathTxtIndex = nil

		if GmToolUtils.__autoPathTxtTimeoutTimerId then
			TimerManager.removeTimer(GmToolUtils.__autoPathTxtTimeoutTimerId)

			GmToolUtils.__autoPathTxtTimeoutTimerId = nil
		end
	end

	local function _moveNext()
		if GmToolUtils.__autoPathTxtRunId ~= runId then
			return
		end

		if not GmToolUtils.__autoPathTxtRunning then
			return
		end

		local idx = GmToolUtils.__autoPathTxtIndex or 1

		if not GmToolUtils.__autoPathTxtPoints or idx > #GmToolUtils.__autoPathTxtPoints then
			_stop()

			if pg.global and pg.global.ui and pg.global.ui.tips then
				pg.global.ui.tips:showTextTip("自动寻路完成")
			end

			return
		end

		local p = GmToolUtils.__autoPathTxtPoints[idx]
		local x, y, z = tonumber(p[1]), tonumber(p[2]), tonumber(p[3])

		if not x or not y or not z or not pg.me or not pg.me.pawnAutoPathFinding then
			GmToolUtils.__autoPathTxtIndex = idx + 1

			TimerManager.addTimer(0.1, _moveNext)

			return
		end

		if GmToolUtils.__autoPathTxtTimeoutTimerId then
			TimerManager.removeTimer(GmToolUtils.__autoPathTxtTimeoutTimerId)

			GmToolUtils.__autoPathTxtTimeoutTimerId = nil
		end

		local ok = pg.me:pawnAutoPathFinding(Vector3(x, y, z), function()
			if GmToolUtils.__autoPathTxtRunId ~= runId then
				return
			end

			if not GmToolUtils.__autoPathTxtRunning then
				return
			end

			if GmToolUtils.__autoPathTxtTimeoutTimerId then
				TimerManager.removeTimer(GmToolUtils.__autoPathTxtTimeoutTimerId)

				GmToolUtils.__autoPathTxtTimeoutTimerId = nil
			end

			local cx, cy, cz, cw = tonumber(p[4]), tonumber(p[5]), tonumber(p[6]), tonumber(p[7])

			if cx and cy and cz and cw and pg.game and pg.game.camera and pg.game.camera.playerCameraMode then
				pg.game.camera.playerCameraMode:setRotation(Quaternion.New(cx, cy, cz, cw))
			end

			GmToolUtils.__autoPathTxtIndex = idx + 1

			TimerManager.addTimer(0.1, _moveNext)
		end, AutoPathFindUtils.PathFindType.Voxel)

		if not ok then
			GmToolUtils.__autoPathTxtIndex = idx + 1

			TimerManager.addTimer(0.1, _moveNext)

			return
		end

		GmToolUtils.__autoPathTxtTimeoutTimerId = TimerManager.addTimer(60, function()
			if GmToolUtils.__autoPathTxtRunId ~= runId then
				return
			end

			if not GmToolUtils.__autoPathTxtRunning then
				return
			end

			GmToolUtils.__autoPathTxtTimeoutTimerId = nil
			GmToolUtils.__autoPathTxtIndex = idx + 1

			_moveNext()
		end)
	end

	local targetSceneId = tonumber(pointInfo and pointInfo.sceneID)

	local function _gotoFirstPoint()
		local p0 = points and points[1]

		if type(p0) ~= "table" then
			return
		end

		local x = tonumber(p0[1])
		local y = tonumber(p0[2])
		local z = tonumber(p0[3])

		if x and y and z and pg.me then
			pg.me:doGmCmd("gotoByPos", x, y, z)
		end
	end

	local function _delayStart(seconds)
		TimerManager.addTimer(seconds, function()
			if GmToolUtils.__autoPathTxtRunId ~= runId or not GmToolUtils.__autoPathTxtRunning then
				return
			end

			_moveNext()
		end)
	end

	if targetSceneId and pg.me and pg.me.space and pg.me.space.sceneId ~= targetSceneId then
		pg.me:doGmCmd("teleportToScene", targetSceneId, 0)
		TimerManager.addTimer(30, function()
			if GmToolUtils.__autoPathTxtRunId ~= runId or not GmToolUtils.__autoPathTxtRunning then
				return
			end

			_gotoFirstPoint()
			_delayStart(30)
		end)
	else
		_gotoFirstPoint()
		_delayStart(30)
	end
end

function GmToolUtils.rotatePetsAndCastUlt()
	if GmToolUtils.__rotatePetsUltActive then
		GmToolUtils.__rotatePetsUltActive = false

		if GmToolUtils.__rotatePetsUltTimerIds then
			for _, tid in ipairs(GmToolUtils.__rotatePetsUltTimerIds) do
				TimerManager.removeTimer(tid)
			end
		end

		GmToolUtils.__rotatePetsUltTimerIds = {}

		pg.global.ui.tips:showTextTip("已停止轮换宠物技能")

		return
	end

	local petIdList = {}
	local groupId = 1

	if not pg.me or not pg.me.pets then
		pg.global.ui.tips:showTextTip("玩家宠物数据未就绪")

		return
	end

	for petId, _ in pairs(pg.me.pets) do
		if petId ~= nil and petId ~= "" then
			petIdList[#petIdList + 1] = tostring(petId)
		end
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[rotatePetsAndCastUlt] count=%d, petIdList=%s", #petIdList, table.tostring(petIdList))
	end

	if #petIdList == 0 then
		pg.global.ui.tips:showTextTip("未获取到宠物实例ID列表")

		return
	end

	GmToolUtils.__rotatePetsUltActive = true
	GmToolUtils.__rotatePetsUltTimerIds = {}
	GmToolUtils.__rotatePetsUltIndex = 1
	GmToolUtils.__rotatePetsUltList = petIdList

	pg.me:doGmCmd("setGmMode", 1)
	pg.global.ui:close(62)
	pg.global.ui.tips:showTextTip("开始轮换宠物技能(再次点击可停止)")

	local function _addTimer(delay, fn)
		local tid = TimerManager.addTimer(delay, fn)

		GmToolUtils.__rotatePetsUltTimerIds[#GmToolUtils.__rotatePetsUltTimerIds + 1] = tid

		return tid
	end

	local function runNextBatch()
		if not GmToolUtils.__rotatePetsUltActive then
			return
		end

		local startIdx = GmToolUtils.__rotatePetsUltIndex

		if not startIdx or startIdx > #petIdList then
			GmToolUtils.__rotatePetsUltActive = false

			pg.global.ui.tips:showTextTip("轮换宠物技能完成")

			return
		end

		local petIds = {
			"",
			"",
			"",
			""
		}

		for i = 1, 4 do
			petIds[i] = petIdList[startIdx + i - 1] or petIdList[startIdx - 5 + i]
		end

		if pg.me then
			pg.me:serverMsg("RPC_CS_ModifyPrepareFormation", groupId, petIds, true)
			_addTimer(0.3, function()
				if pg.me then
					pg.me:serverMsg("RPC_CS_SelectPrepareFormation", groupId)
					_addTimer(0.5, function()
						local ui = pg.global and pg.global.ui
						local hpFuse = ui and ui.hudV2 and ui.hudV2.MD and ui.hudV2.MD.hpFuse

						if hpFuse and hpFuse.performSwitchPet then
							hpFuse:performSwitchPet()
						end

						_addTimer(1.5, function()
							pg.game.input:manuallyTriggerAction("Hud/Pet1")
						end)
					end)
				end
			end)
		end

		local baseDelay = 2
		local switchDelay = 0.5
		local betweenPetsDelay = 20

		for slot = 1, 4 do
			local petId = petIds[slot]

			if petId ~= "" then
				local t = baseDelay + (slot - 1) * betweenPetsDelay

				_addTimer(t, function()
					pg.game.input:manuallyTriggerAction("Hud/Pet" .. tostring(slot))
				end)
				_addTimer(t + switchDelay, function()
					pg.game.input:manuallyTriggerAction("Hud/SkillR")
				end)
				_addTimer(t + switchDelay + 8, function()
					pg.game.input:manuallyTriggerAction("Hud/SkillQ")
				end)
				_addTimer(t + switchDelay + 12, function()
					pg.game.input:manuallyTriggerAction("Hud/SkillE")
				end)
				_addTimer(t + switchDelay + 15, function()
					pg.game.input:manuallyTriggerAction("Hud/NormalAttack")
				end)
			end
		end

		local batchTotal = baseDelay + 4 * betweenPetsDelay + 1

		GmToolUtils.__rotatePetsUltIndex = startIdx + 4

		_addTimer(batchTotal, runNextBatch)
	end

	runNextBatch()
end

function GmToolUtils.rotateUltimatePetsAndCastUlt()
	if GmToolUtils.__rotateUltimatePetsUltActive then
		GmToolUtils.__rotateUltimatePetsUltRunId = (GmToolUtils.__rotateUltimatePetsUltRunId or 0) + 1
		GmToolUtils.__rotateUltimatePetsUltActive = false

		if GmToolUtils.__rotateUltimatePetsUltTimerIds then
			for _, tid in ipairs(GmToolUtils.__rotateUltimatePetsUltTimerIds) do
				TimerManager.removeTimer(tid)
			end
		end

		GmToolUtils.__rotateUltimatePetsUltTimerIds = {}

		pg.global.ui.tips:showTextTip("已停止轮换宠物大招")

		return
	end

	if not pg.me then
		pg.global.ui.tips:showTextTip("玩家数据未就绪")

		return
	end

	local runId = (GmToolUtils.__rotateUltimatePetsUltRunId or 0) + 1

	GmToolUtils.__rotateUltimatePetsUltRunId = runId
	GmToolUtils.__rotateUltimatePetsUltActive = true
	GmToolUtils.__rotateUltimatePetsUltTimerIds = {}

	pg.me:doGmCmd("setGmMode", 1)
	pg.global.ui:close(62)
	pg.global.ui.tips:showTextTip("正在获取并补齐全部大招宠物……")

	local function _isActive()
		return GmToolUtils.__rotateUltimatePetsUltActive and GmToolUtils.__rotateUltimatePetsUltRunId == runId
	end

	local function _finish(tipText)
		if GmToolUtils.__rotateUltimatePetsUltRunId ~= runId then
			return
		end

		GmToolUtils.__rotateUltimatePetsUltActive = false
		GmToolUtils.__rotateUltimatePetsUltTimerIds = {}
		GmToolUtils.__rotateUltimatePetsUltIndex = nil
		GmToolUtils.__rotateUltimatePetsUltList = nil

		if tipText then
			pg.global.ui.tips:showTextTip(tipText)
		end
	end

	local function _addTimer(delay, fn)
		if not _isActive() then
			return
		end

		local tid = TimerManager.addTimer(delay, function()
			if _isActive() then
				fn()
			end
		end)

		GmToolUtils.__rotateUltimatePetsUltTimerIds[#GmToolUtils.__rotateUltimatePetsUltTimerIds + 1] = tid

		return tid
	end

	local petIdList

	local function runNextBatch()
		if not _isActive() then
			return
		end

		local startIdx = GmToolUtils.__rotateUltimatePetsUltIndex

		if not startIdx or startIdx > #petIdList then
			_finish(string.format("大招宠物轮换完成，共释放 %d 只", #petIdList))

			return
		end

		local petIds = {}

		for i = 1, 4 do
			local petId = petIdList[startIdx + i - 1]

			if petId then
				petIds[#petIds + 1] = petId
			end
		end

		pg.me:doGmCmd2("setUltimatePetRotationFormation", {
			petIds
		}, function(result, info)
			if not _isActive() then
				return
			end

			if type(result) ~= "string" or not string.find(result, "success", 1, true) then
				if LoggerManager.checkLogger(LoggerConst.ERROR) then
					logger:error("[rotateUltimatePetsAndCastUlt] set formation failed, result=%s, info=%s", tostring(result), table.tostring(info or {}))
				end

				_finish("替换大招宠物编队失败，请查看日志")

				return
			end

			local formationSettleDelay = 2
			local switchDelay = 1
			local skipSkillCutScene = pg.space and pg.space:checkSkipSkillCutScene() or false
			local betweenPetsDelay = skipSkillCutScene and 5 or 20

			_addTimer(0.5, function()
				local ui = pg.global and pg.global.ui
				local hpFuse = ui and ui.hudV2 and ui.hudV2.MD and ui.hudV2.MD.hpFuse

				if hpFuse and hpFuse.performSwitchPet then
					hpFuse:performSwitchPet()
				end
			end)

			for slot = 1, #petIds do
				local slotIndex = slot
				local petId = petIds[slotIndex]
				local t = formationSettleDelay + (slotIndex - 1) * betweenPetsDelay

				_addTimer(t, function()
					local ok = pg.game.input:manuallyTriggerAction("Hud/Pet" .. tostring(slotIndex))

					if LoggerManager.checkLogger(LoggerConst.INFO) then
						logger:info("[rotateUltimatePetsAndCastUlt] switch pet, index=%d/%d, slot=%d, petId=%s, ok=%s", startIdx + slotIndex - 1, #petIdList, slotIndex, tostring(petId), tostring(ok))
					end
				end)
				_addTimer(t + switchDelay, function()
					local ok = pg.game.input:manuallyTriggerAction("Hud/SkillR")

					if LoggerManager.checkLogger(LoggerConst.INFO) then
						logger:info("[rotateUltimatePetsAndCastUlt] cast ultimate, index=%d/%d, slot=%d, petId=%s, ok=%s", startIdx + slotIndex - 1, #petIdList, slotIndex, tostring(petId), tostring(ok))
					end
				end)
			end

			GmToolUtils.__rotateUltimatePetsUltIndex = startIdx + #petIds

			_addTimer(formationSettleDelay + #petIds * betweenPetsDelay, runNextBatch)
		end)
	end

	pg.me:doGmCmd2("prepareUltimatePetRotation", {}, function(result, info)
		if not _isActive() then
			return
		end

		if type(result) ~= "string" or not string.find(result, "success", 1, true) then
			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("[rotateUltimatePetsAndCastUlt] prepare failed, result=%s, info=%s", tostring(result), table.tostring(info or {}))
			end

			_finish("获取大招宠物失败，请检查背包容量或日志")

			return
		end

		local visitedPetIds = {}

		petIdList = {}

		for _, petId in ipairs(info and info.petIds or EMPTY_TABLE) do
			petId = tostring(petId)

			if petId ~= "" and not visitedPetIds[petId] then
				visitedPetIds[petId] = true
				petIdList[#petIdList + 1] = petId
			end
		end

		if #petIdList == 0 then
			_finish("没有找到配置了大招的宠物")

			return
		end

		GmToolUtils.__rotateUltimatePetsUltIndex = 1
		GmToolUtils.__rotateUltimatePetsUltList = petIdList

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("[rotateUltimatePetsAndCastUlt] ready, count=%d, added=%s, reused=%s, petIdList=%s", #petIdList, tostring(info.addedCount), tostring(info.reusedCount), table.tostring(petIdList))
		end

		pg.global.ui.tips:showTextTip(string.format("开始轮换 %d 只大招宠物，再次点击可停止", #petIdList))
		runNextBatch()
	end)
end

function GmToolUtils.addAllItems(params)
	local listStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text or "1,2,3,4,5,8,11"
	local invIdSet = {}

	for token in string.gmatch(listStr, "[^,;]+") do
		local t = string.gsub(token, "^%s*(.-)%s*$", "%1")

		if t ~= "" then
			local invId = tonumber(t)

			if invId then
				invIdSet[invId] = true
			end
		end
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[addAllItems] invIdSet=%s", table.tostring(invIdSet))
	end

	pg.global.ui:close(62)
	pg.global.ui.tips:showTextTip(string.format("开始添加道具"))

	for id, cfg in pairs(ItemData) do
		local invId = cfg and cfg.invId

		if invId ~= nil and invIdSet[invId] then
			pg.me:doGmCmd("addItem", id, 1)
		end
	end

	pg.global.ui.tips:showTextTip("添加道具完成")
end

function GmToolUtils.randomCreatePuppetsAndFight(params)
	local aStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text or "1"
	local a = tonumber(aStr) or 0

	if a <= 0 then
		pg.global.ui.tips:showTextTip("请输入有效数量")

		return
	end

	local candidates = {}

	for k, v in pairs(PuppetData) do
		if k >= 10000000 and k <= 29999999 then
			local canNotCombat = v and v.canNotCombat
			local autoCombat = v and v.Param_ST_Monster_AutoCombat
			local skillList = v and v.skillList
			local isEmptySkillList = skillList == nil or type(skillList) == "table" and next(skillList) == nil

			if canNotCombat == nil and autoCombat ~= nil and autoCombat ~= "" and not isEmptySkillList then
				candidates[#candidates + 1] = k
			end
		end
	end

	if #candidates == 0 then
		pg.global.ui.tips:showTextTip("无可用怪物数据")

		return
	end

	local level = 50
	local range = 3
	local scale = 1
	local isStopAi = 0
	local label = 0
	local isRareFeature = 0

	for i = 1, a do
		local id = candidates[math.random(1, #candidates)]

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("[randomCreatePuppetsAndFight] petId=%s", id)
		end

		pg.me:doGmCmd("createPuppet", id, level, range, scale, isStopAi, label, 0, isRareFeature)
	end

	GlobalData.Player:doGmCmd("modifyStateSelf", 1, 0)
	pg.me:doGmCmd("setGmMode", 1)
	pg.global.ui:close(62)
	pg.global.ui.tips:showTextTip("创建怪物完成")
end

function GmToolUtils.getModeList()
	return {
		{
			label = "model A",
			tIndex = 0,
			value = ClientConst.LockMode.ModeA
		},
		{
			label = "model B",
			tIndex = 0,
			value = ClientConst.LockMode.ModeB
		}
	}
end

function GmToolUtils.getGamePadModeList()
	return {
		{
			label = "model B",
			tIndex = 0,
			value = ClientConst.LockMode.ModeB
		}
	}
end

function GmToolUtils.getEnvObjList()
	local envObjList = {}

	for k, v in pairs(EnvObjData) do
		if k > 1 then
			envObjList[#envObjList + 1] = {
				tIndex = 0,
				label = GmToolUtils.getGmLocalizationText(v.name),
				id = k,
				iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png"),
				prefabResId = v.prefabResID,
				value = k
			}
		end
	end

	table.sort(envObjList, cmpByValue)

	return envObjList
end

function GmToolUtils.getPuppetList()
	local puppetList = {}
	local npcList = {}

	for k, v in pairs(PuppetData) do
		if k >= 10000000 and k <= 29999999 or k == 9999 or k == 10000 or k == 10001 then
			puppetList[#puppetList + 1] = {
				tIndex = 0,
				label = GmToolUtils.getGmLocalizationText(v.name),
				id = k,
				iconUrl = LuaUIUtils.getPetIcon(v.iconName, LuaUIUtils.PET_ICON, Const.PET_LABEL_MASK.NORMAL),
				value = k
			}
		else
			npcList[#npcList + 1] = {
				tIndex = 0,
				label = GmToolUtils.getGmLocalizationText(v.name),
				id = k,
				iconUrl = LuaUIUtils.getPetIcon(v.iconName, LuaUIUtils.PET_ICON, Const.PET_LABEL_MASK.NORMAL),
				value = k
			}
		end
	end

	table.sort(puppetList, cmpByValue)
	table.sort(npcList, cmpByValue)

	for _, v in ipairs(npcList) do
		puppetList[#puppetList + 1] = v
	end

	return puppetList
end

function GmToolUtils.getPetList()
	local petList = {}

	for k, v in pairs(PetData) do
		petList[#petList + 1] = {
			tIndex = 0,
			label = GmToolUtils.getGmLocalizationText(v.name),
			value = k,
			id = k,
			iconName = v.iconName,
			iconUrl = LuaUIUtils.getPetIcon(v.iconName, LuaUIUtils.PET_ICON, Const.PET_LABEL_MASK.NORMAL)
		}
	end

	table.sort(petList, cmpByValue)

	return petList
end

function GmToolUtils.getItemList()
	local itemList = {}

	for key, value in pairs(ItemData) do
		itemList[#itemList + 1] = {
			tIndex = 0,
			label = GmToolUtils.getGmLocalizationText(value.itemName),
			id = key,
			iconUrl = LuaUIUtils.getIconByIconId(value.icon),
			value = key
		}
	end

	table.sort(itemList, cmpByValue)

	return itemList
end

function GmToolUtils.getFrameList()
	local frameList = {
		{
			label = "5",
			value = 5
		},
		{
			label = "10",
			value = 10
		},
		{
			label = "15",
			value = 15
		},
		{
			label = "20",
			value = 20
		},
		{
			label = "25",
			value = 25
		},
		{
			label = "30",
			value = 30
		},
		{
			label = "60",
			value = 60
		},
		{
			label = "90",
			value = 90
		},
		{
			label = "120",
			value = 120
		}
	}

	return frameList
end

function GmToolUtils.getPhysicsFrameList()
	return {
		{
			label = "50 Hz (0.02s)",
			value = 0.02
		},
		{
			label = "25 Hz (0.04s)",
			value = 0.04
		},
		{
			label = "16.67 Hz (0.06s)",
			value = 0.06
		},
		{
			label = "12.5 Hz (0.08s)",
			value = 0.08
		}
	}
end

function GmToolUtils.getItemRecentlyList()
	local data = GmToolUtils.getRecentlyData("itemRecentlyAddList")

	for _, value in ipairs(data) do
		local cfgData = ItemData[value.id]

		if cfgData then
			value.label = GmToolUtils.getGmLocalizationText(cfgData.itemName)
			value.iconUrl = LuaUIUtils.getIconByIconId(cfgData.icon)
			value.tIndex = 0
		end
	end

	return data
end

function GmToolUtils.envObjRecently()
	local data = GmToolUtils.getRecentlyData("envObjRecently")

	for _, value in ipairs(data) do
		local cfgData = EnvObjData[value.id] or GmToolUtils.obsoleteData

		value.label = GmToolUtils.getGmLocalizationText(cfgData.name)
		value.iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
	end

	return data
end

function GmToolUtils.sceneRecently()
	local data = GmToolUtils.getRecentlyData("sceneRecently")

	for _, value in ipairs(data) do
		local sceneData = SceneData[value.id] or GmToolUtils.obsoleteData

		value.label = GmToolUtils.getGmLocalizationText(sceneData.name)
		value.iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
	end

	return data
end

function GmToolUtils.sceneRecentlyLine()
	local data = GmToolUtils.getRecentlyData("sceneRecently")
	local result = {}

	for index, value in ipairs(data) do
		local sceneData = SceneData[value.id] or GmToolUtils.obsoleteData

		value.label = GmToolUtils.getGmLocalizationText(sceneData.name)
		value.iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
		result[#result + 1] = value

		if index >= 5 then
			break
		end
	end

	return result
end

function GmToolUtils.getPuppetRecentlyList()
	local data = GmToolUtils.getRecentlyData("puppetRecentlyAddList")

	for _, value in ipairs(data) do
		local cfgData = PuppetData[value.id] or GmToolUtils.obsoleteData

		value.label = GmToolUtils.getGmLocalizationText(cfgData.name)
		value.iconName = cfgData.iconName
		value.iconUrl = LuaUIUtils.getPetIcon(cfgData.iconName, LuaUIUtils.PET_ICON, Const.PET_LABEL_MASK.NORMAL)
		value.tIndex = 0
	end

	return data
end

function GmToolUtils.getPetRecentlyList()
	local data = GmToolUtils.getRecentlyData("petRecentlyAddList")

	for _, value in ipairs(data) do
		local cfgData = PetData[value.id] or GmToolUtils.obsoleteData

		value.label = GmToolUtils.getGmLocalizationText(cfgData.name)
		value.iconName = cfgData.iconName
		value.iconUrl = LuaUIUtils.getPetIcon(cfgData.iconName, LuaUIUtils.PET_ICON, Const.PET_LABEL_MASK.NORMAL)
		value.tIndex = 0
	end

	return data
end

function GmToolUtils.getRecentlyData(key)
	local res = {}
	local dataStr = pg.global.prefsCacheUtils:getString(key, "")

	if dataStr == "" then
		return res
	end

	local data = string.split(dataStr, "|")

	for _, item in ipairs(data) do
		local id = tonumber(item)

		res[#res + 1] = {
			id = id,
			value = id
		}
	end

	return res
end

function GmToolUtils.addRecentlyData(key, newId)
	local dataStr = pg.global.prefsCacheUtils:getString(key, "")
	local newIdStr = tostring(newId)

	if dataStr == "" or dataStr == newIdStr then
		pg.global.prefsCacheUtils:setString(key, newIdStr)

		return
	end

	local data = string.split(dataStr, "|")
	local removeIndex = -1

	for index, value in ipairs(data) do
		if value == newIdStr then
			removeIndex = index

			break
		end
	end

	if removeIndex ~= -1 then
		table.remove(data, removeIndex)
	end

	table.insert(data, 1, newIdStr)

	if #data > 10 then
		table.remove(data)
	end

	pg.global.prefsCacheUtils:setString(key, table.concat(data, "|"))
end

function GmToolUtils.copyPlayerInfo()
	local ip = LOCAL_IP_STR
	local gamePlatform = GlobalData.GamePlatform
	local serverId = GlobalData.ServerId
	local serverGroup = ClientUtils.getServerListGroup()
	local serverName = GlobalData.ServerName
	local me = pg.me
	local uid = me:isFromCopy() and me:getCopyPlayerUid() or me.uid
	local playerId = pg.me.id
	local username = GlobalData.UserName
	local playerName = pg.me.playerName
	local scenePosition = string.format("(sceneId:%d, position:%s)", pg.me.space.sceneId, pg.me:getPosition())
	local createdTime = LuaUIUtils.timeStampToUtcString(me.createdTime)
	local loginTime = LuaUIUtils.timeStampToUtcString(me.loginTime)

	CS.UnityEngine.GUIUtility.systemCopyBuffer = string.format("\n客户端信息：\n        IP地址\t= %s\n        platform\t= %s\n服务器信息：\n        serverId\t\t= %d\n        serverGroup\t= %s\n        serverName\t= %s\n角色信息：\n        uid\t\t= %s\n        scenePos\t= %s\n        playerId\t= %s\n        username\t= %s\n        角色名 \t= %s\n        创角时间\t= %s\n        登录时间\t= %s\n        ", ip, gamePlatform, serverId, serverGroup, serverName, uid, scenePosition, playerId, username, playerName, createdTime, loginTime)

	pg.global.ui.tips:showTextTip("复制成功")
end

function GmToolUtils.showGrabEggMasterName()
	local masterName = ""
	local content = string.format("当前主机玩家名称：%s", masterName)

	pg.global.showBubbleMessageRaw(content, 3)
end

local LOG_LEVEL_NONE = 0

function GmToolUtils.openDebugConsole()
	if LoggerConst.CURRENT_LEVEL == nil or LoggerConst.CURRENT_LEVEL == LOG_LEVEL_NONE or LoggerConst.CURRENT_LEVEL < LoggerConst.DEBUG or LoggerConst.CURRENT_LEVEL > LoggerConst.ERROR then
		GmToolUtils.setLogLevel({
			value = LoggerConst.ERROR
		})
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.OpenDebugConsole()
end

function GmToolUtils.openXboxPermissionDebugOverlay()
	CS.FunPlus.WorldX.SDK.Platform.PlatformBridgeLuaFacade.ShowPermissionDebugOverlay()
end

function GmToolUtils.isXboxPlatform()
	local platform = pg and pg.global and pg.global.platform

	return platform ~= nil and (platform.isXbox ~= nil and platform:isXbox() or platform.isXbox ~= nil and platform:isXboxPC())
end

function GmToolUtils.triggerCrash()
	pg.global.showConfirmMsgRaw("CrashSight 主动崩溃测试", "确认要强制崩溃进程？\n用于验证 CrashSight 上报链路，进程会立即退出。", function()
		CS.FunPlus.WorldX.SDK.SDKManager.CrashTest()
	end)
end

function GmToolUtils.reportCrashSightException()
	pg.global.showConfirmMsgRaw("CrashSight 主动上报测试", "确认要主动上报一条 CrashSight 非致命异常？\n进程不会退出。", function()
		CS.FunPlus.WorldX.SDK.SDKManager.ReportCrashSightTestException()
		pg.global.ui.tips:showTextTip("已触发 CrashSight 主动上报")
	end)
end

function GmToolUtils.getSceneEntityInfos()
	local allEntitys = pg.getEntities()
	local infos = {}

	for entityId, entity in pairs(allEntitys) do
		table.insert(infos, string.format("entityId: %s, actorId: %s, sandboxId: %s, aoiRange: %s, position: %s", entityId, entity.actorId, entity.sandboxId, tostring(entity.aoiRange), tostring(entity.getPosition and entity:getPosition() or "nil")))
	end

	CS.UnityEngine.GUIUtility.systemCopyBuffer = table.concat(infos, "\n")

	pg.global.ui.tips:showTextTip("已复制到剪切板")
end

function GmToolUtils.applyLowestDeviceCountLimit()
	local entityCount = pg.game and pg.game.entityCount

	if not entityCount then
		pg.global.ui.tips:showTextTip("请先进入游戏")

		return
	end

	local ClientSettingUtils = require("Utils.ClientSettingUtils")
	local SettingConst = require("Const.SettingConst")

	for _, entityType in pairs(SettingConst.EntityCountLimitType) do
		local count = ClientSettingUtils.getSettingRelationValue("setVideoQuality", Const.VIDEO_QUALITY.LOW, ClientConst.SettingFuncType[entityType], "Android")

		entityCount:setCountLimit(entityType, count)
	end

	pg.global.ui.tips:showTextTip("已切换为最低端移动端数量限制（仅本次运行生效）")
end

function GmToolUtils.destroyOneFarthestEntity()
	local entityCount = pg.game and pg.game.entityCount
	local entityId = entityCount and entityCount:destroyOneFarthestEntity()

	pg.global.ui.tips:showTextTip(entityId and "Destroyed entity: " .. tostring(entityId) or "No entity can be destroyed")
end

function GmToolUtils.openPhotoIdentify()
	pg.global.ui.config:close()

	local photo = pg.global.ui.photo

	photo:open({
		photoMode = photo.ModeType.PHOTO_IDENTIFY
	})
end

function GmToolUtils.setTestTeamInfo()
	pg.me.teamId = "test"
	pg.me.teamInfo = {
		rtcRoomId = 1.75513902000005e+18,
		isMatchTeam = false,
		createTime = 1755139019.005,
		teamId = "aJ1LxQ97grTY0DGd",
		status = 1,
		prepareInfos = {},
		dungeonConfirms = {},
		leaderUid = pg.me.uid,
		membersInfo = {
			[pg.me.uid] = {
				teamMembers = 1,
				playerName = "cdsvfbgrt",
				online = true,
				headIcon = 1,
				headFrame = 1,
				enterTeamTime = 1755139019.005,
				curShow = "eJwskc1ugzAQhF+lytmJdv0D9sGXqJf00EtUKWmUA6JOQCUYAVFUId69u5jTfDOyh108lc9hjI/P4hH8ZiMuCHj1UzGORVntY0vhvu4A8O3Y1W3AjejjePIyNztprEGtQSvOzt66nXPOKolGKcnZt9/CDgByyJ3TlKMDjaKMTew/wis0/d/hxwMF7a2+E1rMADLRxeHk6WYmMyp0SGqV4fi8NJIHhKXY5JLzby9pHmmMtZChtjpswYmhLJpARWYWactjFV9+upgrffSCtGiO1GOJJbNMrJhVYs2sExtms7CEq+erKJEMrkazkUu5VGuGnOnVKCUuCpYDCpOk40ol0UnSgCpLc/KLrH+GDF+YRT3wLvvi7sf+GUTZxLEKw3sY6ns7+GkWj+I3fHWH9hbZVUXdJ14m44fmqReFVeWqmnWe/wEAAP//",
				clientMsSessionId = "h*JFR**h]7**",
				level = 50,
				clientMsGateId = "h**'R**h]7**",
				avatarPresetKey = 110001,
				avatarConfig = "eJzsU8tu2zAQ/Bee1YDLXZJL34qmBYL21NwaBIUi0SkRyRJEuYhr+N9LvdwkTgp/QHighCU5O5wZ7kXv67bKe39VihVmou189P1XvxMrACklZOKuKXeftrFv6su8z8VqL37WTRnWwZffQuzF6ub2kIl1Xvg3dn3sujzh3XyAC5m9T9M0aFbnD37bPldtHR59eemLvIpJsr0IyRdAIzNRNFXTDVvSJBOKuJ+/d/M3nU/AA67v86oKxVzvmu39r42PcV6fQbU9ATXGMQBKRkZHYJcezjoikAicqCjQc09Aks6QRdKalJM8ckgwCGhVwncONBg4m5I5paSNkWitJcnaOdZHSkjkjFLolNFEapHhtD5SIk1OgjNIVqExiP/lJC9QjgPAKekUO3O4zUS52JL+e//Yb9NjOZqk0nM536TlykriuS4QICcqqNGyIcOLC6/UlyaJZ3wImyckJbxoBzNJmEnCm0kyTKMkWmm27OCli5nwdYgx/PZXm95vYuh3450HFn73RCmAdDZ0If4zecyLBgcsVQrbfOPhVtakeCltLBG9QjAWle/yIxCjBGbjUuiM1IwzkFVEKY6c+ijt2M3KnZaPuAO96/DHjzFncMMwKEmDkilT7bYN1Y+mqYf9MGVFIROw5unwl6bYTkmyalxmVkBsaVr+3vTXrfflpNCSf1DvwjwTZnh0u01eh+LzlKDbw+EvAAAA//8=",
				teamId = "aJ1LxQ97grTY0DGd",
				teamHintId = "aJ1LxQ97grTY0DGd",
				starTitle = 6,
				entityId = "aGyI39ptMvwZSvjc",
				exploreAbilityIds = {
					9200021
				},
				petInfoList = {
					{
						petAppearance = "eJyqTi4tLsnP9UvMTbVVUtKB8AJSS2yra2GcotTi1JJihEBwRn45kFcLAAAA//8=",
						cp = 161,
						label = 0,
						level = 1,
						templateId = 1001100
					},
					{
						petAppearance = "",
						cp = 622,
						label = 0,
						level = 15,
						templateId = 1032300
					},
					{
						petAppearance = "",
						cp = 182,
						label = 0,
						level = 1,
						templateId = 1001201
					},
					{
						petAppearance = "",
						cp = 169,
						label = 0,
						level = 1,
						templateId = 1002200
					}
				},
				uid = pg.me.uid
			},
			["51205"] = {
				teamMembers = 1,
				playerName = "vdfvdcdg",
				online = true,
				headIcon = 1,
				headFrame = 1,
				uid = "51205",
				enterTeamTime = 1755139019.074,
				curShow = "eJwsjjEOwyAMRe/CzIBxaCeWqkuXLlWnKAOKaEBtQhUSdYi4e2Oc6T/sh+2tX/OSxrsbvRVCxvwI6Xdxg13m1UtuUsluremski1AZ88alIKdNbFmRmJkbogbZkNsKmtVR2jg0Bz7R9hnGCCjqTVkEVlEFhE5DoXPwRNfpeBIcovsP2kJPl99jsOU7Vbk6N7++b1Nr0Sv4OLMXPcLUcofAAD//w==",
				clientMsSessionId = "h*JgR**h]7**",
				level = 1,
				clientMsGateId = "h**'R**h]7**",
				avatarPresetKey = 210001,
				avatarConfig = "eJzsU0tPhDAQ/i8946ZPoNyMj8ToSW8aYyrMro1ACS1G3PDfbaHZoFET79vD9PV9M9NvpnvkoOlq5eCqQgVPUNeDBXcNIyoowRiTBD2bajwbrDPNuXIKFXv01JhKbzVUN9o6VDw8TgnaqhJ+QZ32vfL+Hk7IBidHs5igWaNeYei+qrbV71CdQ6lqG5RNULVaO3h3g6+Q3+2R9hUjjOIElaY2fSB7g71/tIvzc5y9Zx9ympKFlX8nkUgikUTWJB/Xvup2FfQfbP9IcKqudRlT6c2we2nB2oiDRlur3+CqddBa7cYZF4LCuHoo942oe21jSL6heRoaNMWEyJTKOQG2oVIIKlkqBPMrMqfzw+khOVvW0KuDdAJLzpjMeSZSnsosKskpFpQxLniGOfW3Udkfzg+eQ7J3+gMCjmKKw8gw8+gc5/6fDZ2u741pAp7gVIbBGOU0k/nCvjTlYAOdSDnTsRQszTijy/2tcXcdQLUIFkvL6VGnP3UKP2psVaPLi6W/HqfpEwAA//8=",
				teamId = "aJ1LxQ97grTY0DGd",
				teamHintId = "aJ1LxQ97grTY0DGd",
				starTitle = 0,
				entityId = "aJr1zTuM7RZm2Alc",
				exploreAbilityIds = {
					9200021
				},
				petInfoList = {}
			}
		},
		playerInDungeon = {},
		sortList = {
			pg.me.uid,
			"51205"
		}
	}

	if pg.me.space then
		pg.me.space.dungeonTeamInfo = nil
	end

	pg.me:refreshCurTeamInfo()
end

function GmToolUtils.checkPlayerPerceptibility()
	if pg.me then
		return not pg.me.isPerceptibilityResponse
	end
end

function GmToolUtils.setPlayerPerceptibility(isSelected)
	pg.me.isPerceptibilityResponse = not isSelected
end

function GmToolUtils.checkPlayerNoImpPerceptibility()
	if pg.me then
		return not pg.me.isNoImpPerceptibilityResponse
	end
end

function GmToolUtils.setPlayerNoImpPerceptibility(isSelected)
	pg.me.isNoImpPerceptibilityResponse = not isSelected
end

function GmToolUtils.openAIDebug()
	pg.openAIDebug()
end

function GmToolUtils.startAIDebug()
	pg.startAIDebug()
end

function GmToolUtils.openAISelfieDraw(isSelected)
	AiConst.AI_DEBUG.SELFIE = isSelected
end

function GmToolUtils.checkAISelfieDrawState()
	return AiConst.AI_DEBUG.SELFIE
end

function GmToolUtils.openTeamRoom()
	GmToolUtils.setTestTeamInfo()
	pg.global.ui:open(UIConst.UI_ID_TEAM_ROOM)
end

function GmToolUtils.forceEntityCastShadow()
	appFacade.entityManager:TestCloseEntityShadow(true)
end

function GmToolUtils.openResourceDownload(params)
	local packSize = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local curPackSize = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text

	packSize = tonumber(packSize)
	curPackSize = tonumber(curPackSize)
	packSize = packSize or 1024
	curPackSize = curPackSize or 0

	pg.global.ui:open(UIConst.UI_ID_RESOURCE_DOWNLOAD, {
		packSize = packSize,
		curSize = curPackSize
	})
end

function GmToolUtils.setSettingPackDownload(isSelected)
	pg.game.setting.showSettingPackDownload = isSelected
end

function GmToolUtils.checkSettingPackDownload()
	return pg.game.setting.showSettingPackDownload
end

function GmToolUtils.playBossReward()
	pg.me:playEffect("rewardNormalFly", {
		position = {
			-1469.52,
			83.34,
			1428.04
		},
		loadCallback = function(effectItem)
			effectItem.forceNoReuse = true

			local track = effectItem.effectTrans.gameObject:GetComponent(typeof(CS.FunPlus.WorldX.ParabolaFollowTrack))

			track = track or effectItem.effectTrans.gameObject:AddComponent(typeof(CS.FunPlus.WorldX.ParabolaFollowTrack))

			if track then
				track.addHeight = pg.me:getHeight() * 0.5

				track:StartTrackByActorId(pg.me.actorId)
				track:SetEffectItem(effectItem)
			end
		end
	})

	local delayTime = SysConfigData.Multiple_Battle_Reward_Eff_Delay

	TimerManager.addTimer(delayTime, function()
		pg.me:playEffect("rewardGainNormal")
	end)
end

function GmToolUtils.setUCurvedPanelForceEnabled(isSelected)
	CS.FunPlus.WorldX.Utils.GmToolUtils.SetUCurvedPanelForceEnabled(isSelected)
end

function GmToolUtils.getUCurvedPanelForceEnabled()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetUCurvedPanelForceEnabled()
end

function GmToolUtils.checkUIStatus()
	return not CS.XGUI.UWidget.uiCamera.enabled
end

function GmToolUtils.hiddenUI()
	CS.XGUI.UWidget.uiCamera.enabled = false

	facade:SendMessageCommand(MessageName.HIDDEN_UI)
end

function GmToolUtils.hideUISpecial(isSelected)
	pg.game.setting.hideUISpecial = isSelected

	local whiteList = {}

	whiteList[UIConst.UI_ID_QTE] = true
	whiteList[UIConst.UI_ID_CONFIG] = true
	whiteList[UIConst.UI_ID_CONFIG_TOPPING] = true

	if isSelected then
		pg.global.ui:gmSetAllUIOpacity(whiteList, -10)
	else
		pg.global.ui:gmSetAllUIOpacity(whiteList, 1)
	end
end

function GmToolUtils.getHideUISpecial()
	return pg.game.setting.hideUISpecial
end

function GmToolUtils.checkHideTownPet()
	return pg.game.setting:getHideTownPet()
end

function GmToolUtils.setHideTownPet(isSelected)
	return pg.game.setting:setHideTownPet(isSelected)
end

function GmToolUtils.checkHideVideo()
	return CS.com.vasd.pandora.PVideoController.debugBlockSwitch
end

function GmToolUtils.setHideVideo(isSelected)
	CS.com.vasd.pandora.PVideoController.debugBlockSwitch = isSelected
end

function GmToolUtils.setMarqueeGMHide(isSelected)
	pg.game.setting.isMarqueeHide = isSelected

	if pg.global.ui.tips then
		pg.global.ui.tips:setMarqueeGMVisible(not isSelected)
	end
end

function GmToolUtils.getHideMarqueeStatus()
	return pg.game.setting.isMarqueeHide or false
end

function GmToolUtils.openChat()
	pg.global.ui:open(UIConst.UI_ID_CHAT, nil, nil, nil, {
		ignoreDisableMainCamera = true
	})
end

function GmToolUtils.checkGIState()
	return appFacade.areaManager.enableBoardPhaseTest
end

function GmToolUtils.setTriggerBoardPhase(enable)
	appFacade.areaManager.enableBoardPhaseTest = enable
end

function GmToolUtils.checkTriggerBoardPhase()
	return GmToolUtils.openGI
end

function GmToolUtils.copyCameraPos()
	local pos = pg.game.camera:getCameraPosition()
	local rot = pg.game.camera:getCameraRotation()
	local playerPos = pg.playerPos
	local info = {
		position = {
			x = pos.x,
			y = pos.y,
			z = pos.z
		},
		rotation = {
			x = rot.x,
			y = rot.y,
			z = rot.z,
			w = rot.w
		},
		scale = {
			y = 1,
			z = 1,
			x = 1
		},
		playerPosition = {
			x = playerPos.x,
			y = playerPos.y,
			z = playerPos.z
		}
	}
	local info = json.encode(info)

	CS.UnityEngine.GUIUtility.systemCopyBuffer = "UnityEditor.TransformWorldPlacementJSON:" .. info

	pg.global.ui.tips:showTextTip("复制成功")
end

function GmToolUtils.recordCameraPosEveryT()
	if GmToolUtils.__cameraPosRecorderTimerId then
		TimerManager.removeTimer(GmToolUtils.__cameraPosRecorderTimerId)

		GmToolUtils.__cameraPosRecorderTimerId = nil

		pg.global.ui.tips:showTextTip("结束记录相机位置")

		return
	end

	local interval = 3
	local filePath = CS.UnityEngine.Application.persistentDataPath .. "/camera_pos_log.txt"

	do
		local rf = io.open(filePath, "r")

		if rf then
			local content = rf:read("*a") or ""

			rf:close()

			if #content > 0 then
				local wf = io.open(filePath, "w")

				if wf then
					wf:close()
				end
			end
		end
	end

	local timerId = TimerManager.addRepeatTimer(interval, function()
		GmToolUtils.copyCameraPos()

		local buf = CS.UnityEngine.GUIUtility.systemCopyBuffer

		if buf and buf ~= "" then
			local f = io.open(filePath, "a")

			if f then
				f:write(buf .. "\n")
				f:close()
			end
		end
	end)

	GmToolUtils.__cameraPosRecorderTimerId = timerId

	pg.global.ui.tips:showTextTip(string.format("开始记录相机位置，每隔%s秒", tostring(interval)))
end

function GmToolUtils.deleteAllPrefs()
	pg.global.prefsCacheUtils:deleteAll()
	pg.global.ui.tips:showTextTip("清理完成")
end

function GmToolUtils.teleportCopyPos(params)
	local copyPosStr = ""

	if params then
		if params[0] then
			copyPosStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
		else
			copyPosStr = params
		end
	end

	if copyPosStr == "" then
		copyPosStr = CS.UnityEngine.GUIUtility.systemCopyBuffer
	end

	if not copyPosStr or copyPosStr == "" then
		pg.global.ui.tips:showTextTip("无效坐标")

		return
	end

	local posStr = copyPosStr
	local jsonStr = copyPosStr

	if copyPosStr:find("UnityEditor.TransformWorldPlacementJSON:") then
		jsonStr = copyPosStr:sub(#"UnityEditor.TransformWorldPlacementJSON:" + 1)
	end

	local success, info = pcall(function()
		return json.decode(jsonStr)
	end)

	if success and info and (info.playerPosition or info.position) then
		local pos = info.playerPosition or info.position
		local x = pos.x or pos[1]
		local y = pos.y or pos[2]
		local z = pos.z or pos[3]
		local rx = info.rotation.x
		local ry = info.rotation.y
		local rz = info.rotation.z
		local rw = info.rotation.w

		if x and y and z and rx and ry and rz and rw then
			pg.me:doGmCmd("gotoByPos", x, y, z)
			TimerManager.addTimer(10, function()
				pg.game.camera.playerCameraMode:setRotation(Quaternion.New(rx, ry, rz, rw))
			end)

			return
		end
	end

	if copyPosStr:find("Vector3%(") then
		posStr = copyPosStr:sub(#"Vector3(" + 1, #copyPosStr - 1)
	end

	local posArr = string.split(posStr, ",")
	local offsetY = 1

	if #posArr == 3 then
		local x = tonumber(posArr[1])
		local y = tonumber(posArr[2])

		y = y and y + offsetY

		local z = tonumber(posArr[3])

		if x and y and z then
			pg.me:doGmCmd("gotoByPos", x, y, z)

			return
		end
	end

	posArr = string.split(posStr, "|")

	if #posArr == 3 then
		local x = tonumber(posArr[1])
		local y = tonumber(posArr[2])

		y = y and y + offsetY

		local z = tonumber(posArr[3])

		if x and y and z then
			pg.me:doGmCmd("gotoByPos", x, y, z)

			return
		end
	end

	jsonStr = "{" .. copyPosStr .. "}"
	success, info = pcall(function()
		return json.decode(jsonStr)
	end)

	if success and info and info.posX and info.posY and info.posZ then
		local y = info.posY + offsetY

		pg.me:doGmCmd("gotoByPos", info.posX, y, info.posZ)

		return
	end
end

function GmToolUtils.teleportWithPosDir(px, py, pz, rx, ry, rz, rw)
	if pg.me then
		pg.me:doGmCmd("gotoByPos", px, py, pz)
		pg.game.camera.playerCameraMode:setRotation(Quaternion.New(rx, ry, rz, rw))
	end
end

function GmToolUtils.startProfile(params)
	GmToolUtils.enableMainPlayer(true)
	GmToolUtils.setGmMoveMode(true)
	GmToolUtils.enableOBCamera(true)

	local sceneIdListStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local chunckSize = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local testVecor4Str = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local isEightDirectionFlag = params[3]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local isLocalTestS = params[4]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local useGmArea = false
	local testVecor4 = {}
	local profileAreaBoundsDic

	if testVecor4Str ~= "(0,0,0,0)" then
		useGmArea = true
		testVecor4Str = string.gsub(testVecor4Str, "[%(%) ]", "")
		testVecor4Str = string.gsub(testVecor4Str, "[%(%) ]", "")

		local testVecor4Items = string.split(testVecor4Str, ",")

		for idx, testVector4ItemStr in ipairs(testVecor4Items) do
			testVecor4[idx] = tonumber(testVector4ItemStr)
		end
	else
		local profileAreaBoundsStr = pg.global.worldXProfileMgr:GetRealProfileAreaBounds()

		if profileAreaBoundsStr and profileAreaBoundsStr ~= "" then
			profileAreaBoundsDic = {}

			local lines = string.split(profileAreaBoundsStr, "\n")

			for _, line_ in ipairs(lines) do
				line_ = string.gsub(line_, "%s", "")

				if line_ ~= "" then
					local items = string.split(line_, ",")
					local sceneId = tonumber(items[1])

					if sceneId then
						profileAreaBoundsDic[sceneId] = {
							tonumber(items[2]),
							tonumber(items[3]),
							tonumber(items[4]),
							tonumber(items[5])
						}
					end
				end
			end
		end
	end

	chunckSize = chunckSize or 96

	local isEightDirection = isEightDirectionFlag == 1 or isEightDirectionFlag == "1"
	local isLocalTest = isLocalTestS == 1 or isLocalTestS == "1"
	local sceneIdList = string.split(sceneIdListStr, ",")
	local sceneDataList = {}

	for sceneIdx, sceneId in ipairs(sceneIdList) do
		local sceneIdNum = tonumber(sceneId)
		local sceneData = scene_data[sceneIdNum]

		if sceneData ~= nil then
			local editorPointAPosition = sceneData.editorPointAPositon
			local editorPointBPosition = sceneData.editorPointBPosition
			local mapPointAPosition = sceneData.PointAPositon
			local mapPointBPosition = sceneData.PointBPosition
			local mapAPosition = sceneData.MapAPosition
			local mapBPosition = sceneData.MapBPosition
			local pointAPosition = editorPointAPosition
			local pointBPosition = editorPointBPosition

			if useGmArea then
				pointAPosition = {
					testVecor4[1],
					testVecor4[2]
				}
				pointBPosition = {
					testVecor4[3],
					testVecor4[4]
				}
			elseif profileAreaBoundsDic and profileAreaBoundsDic[sceneIdNum] then
				pointAPosition = {
					profileAreaBoundsDic[sceneIdNum][1],
					profileAreaBoundsDic[sceneIdNum][2]
				}
				pointBPosition = {
					profileAreaBoundsDic[sceneIdNum][3],
					profileAreaBoundsDic[sceneIdNum][4]
				}
			end

			local sceneName = sceneData.name

			sceneDataList[sceneIdNum] = {}
			sceneDataList[sceneIdNum].isEightDirection = isEightDirection
			sceneDataList[sceneIdNum].pointAPosition = pointAPosition
			sceneDataList[sceneIdNum].pointBPosition = pointBPosition
			sceneDataList[sceneIdNum].editorPointAPosition = editorPointAPosition
			sceneDataList[sceneIdNum].editorPointBPosition = editorPointBPosition
			sceneDataList[sceneIdNum].mapPointAPosition = mapPointAPosition
			sceneDataList[sceneIdNum].mapPointBPosition = mapPointBPosition
			sceneDataList[sceneIdNum].mapAPosition = mapAPosition
			sceneDataList[sceneIdNum].mapBPosition = mapBPosition
			sceneDataList[sceneIdNum].name = sceneName
			sceneDataList[sceneIdNum].chunckSize = chunckSize
			sceneDataList[sceneIdNum].sceneId = sceneIdNum
			sceneDataList[sceneIdNum].isLocalTest = isLocalTest
		end
	end

	pg.global.worldXProfileMgr:ResetSceneList(sceneDataList)
	pg.global.worldXProfileMgr:RecordStream(0)
	pg.global.worldXProfileMgr:StartProfile()
end

function GmToolUtils.continueProfile()
	GmToolUtils.enableMainPlayer(true)
	GmToolUtils.setGmMoveMode(true)
	GmToolUtils.enableOBCamera(true)
	pg.global.worldXProfileMgr:RecordStream(1)
	pg.global.worldXProfileMgr:StartProfile()
end

function GmToolUtils.endProfile()
	pg.global.worldXProfileMgr:EndProfile()
end

function GmToolUtils.startProfileTimeline()
	local curSceneId = pg.me.space.sceneId

	if curSceneId ~= 5015 then
		pg.me:doGmCmd("teleportToScene", 5015, 0)
	end

	CS.FunPlus.WorldX.Utils.WorldXProfiler.RuntimeResChecks.RuntimeResCheckLauncher.StartCheckTimeline()

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
		pg.global.ui:close(UIConst.UI_ID_CONFIG)
	end
end

function GmToolUtils.openHierarchy()
	pg.global.uiMgr:CallRuntimeEditorFunc("OpenHierarchy")
end

function GmToolUtils.openInspector()
	pg.global.uiMgr:CallRuntimeEditorFunc("OpenInspector")
end

function GmToolUtils.openSrDebugger()
	pg.global.uiMgr:CallRuntimeEditorFunc("OpenSrDebugger")
end

function GmToolUtils.launchProfileRecord(params)
	local delayStopSecond = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	delayStopSecond = delayStopSecond or 20

	local ret = SampleUtils.launchProfileRecord(delayStopSecond)

	pg.global.ui.tips:showTextTip(ret)
end

function GmToolUtils.startTopLogoProfile(params)
	local durStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local outPath = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local dur = tonumber(durStr) or 10

	if outPath == nil or outPath == "" then
		outPath = "toplogo_profile.log"
	end

	local TopLogoProfiler = require("Guis.Panels.TopLogo.TopLogoProfiler")
	local ret = TopLogoProfiler.start(outPath, dur)

	pg.global.ui.tips:showTextTip(string.format("TopLogo 采样已开始，%ds 后自动 flush → %s", dur, outPath))

	return ret
end

function GmToolUtils.stopTopLogoProfile(params)
	local TopLogoProfiler = require("Guis.Panels.TopLogo.TopLogoProfiler")

	TopLogoProfiler.stop()
	pg.global.ui.tips:showTextTip("TopLogo 采样已结束并 flush")
end

function GmToolUtils.runTopLogoBridgeBench(params)
	local nStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local outPath = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local n = tonumber(nStr) or 1000

	if outPath == nil or outPath == "" then
		outPath = "toplogo_bridge_bench.log"
	end

	local TopLogoBridgeBench = require("Guis.Panels.TopLogo.TopLogoBridgeBench")

	TopLogoBridgeBench.run(n, outPath)
	pg.global.ui.tips:showTextTip(string.format("跨桥基准已跑完，详见 %s", outPath))
end

function GmToolUtils.finishProfileRecord(params)
	local isJumpTo = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	isJumpTo = isJumpTo or 1

	local ret = SampleUtils.finishProfileRecord(isJumpTo)

	if ret == 0 then
		ret = "目前不录制中, 请先开启录制!"

		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error(ret)
		end
	else
		ret = "Profile录制结束, 搜索Log面板查看导出数据"

		if tonumber(isJumpTo) == 1 then
			TimerManager.addTimer(0.1, function()
				SampleUtils.jumpToProfileRecord()
			end)
		end
	end

	pg.global.ui.tips:showTextTip(ret)
end

function GmToolUtils.debugTimeline(params)
	local name = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local resId = "$" .. name .. ".prefab"
	local c = clientUtils.playCutscene(resId)
	local time = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text

	if time ~= "" and time ~= "0" and c then
		time = tonumber(time)

		c:stepTo(time)
		TimerManager.addTimer(1, function()
			c:pause()
		end)

		local stopTime = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text

		if stopTime ~= "" then
			stopTime = tonumber(stopTime)
		else
			stopTime = 10
		end

		stopTime = stopTime + 1

		TimerManager.addTimer(stopTime, function()
			c:resume()
		end)
	end
end

function GmToolUtils.playTimelineInfoDataSequential()
	if GmToolUtils.__timelineInfoPlayActive then
		GmToolUtils.__timelineInfoPlayActive = false

		pg.global.ui.tips:showTextTip("已停止依次播放timeline")

		return
	end

	local sheetIndex = tonumber(0)
	local res = CS.FunPlus.WorldX.Utils.GmToolUtils.GetPerformanceParameters(sheetIndex)

	if res ~= nil and LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[playTimelineInfoDataSequential] %s", tostring(res))
	end

	local keys = {}
	local resStr = tostring(res or "")

	if resStr ~= "" then
		for line in string.gmatch(resStr, "[^\r\n]+") do
			local s = string.gsub(line or "", "^%s*(.-)%s*$", "%1")

			if s ~= "" then
				keys[#keys + 1] = s
			end
		end
	end

	if #keys == 0 then
		pg.global.ui.tips:showTextTip("播放列表为空")

		return
	end

	GmToolUtils.__timelineInfoPlayActive = true
	GmToolUtils.__timelineInfoPlayKeys = keys
	GmToolUtils.__timelineInfoPlayIndex = 1

	local function playNext()
		if not GmToolUtils.__timelineInfoPlayActive then
			return
		end

		local idx = GmToolUtils.__timelineInfoPlayIndex
		local list = GmToolUtils.__timelineInfoPlayKeys

		if not idx or not list or idx > #list then
			GmToolUtils.__timelineInfoPlayActive = false

			pg.global.ui.tips:showTextTip("依次播放timeline结束")
			pg.global.ui:open(2)

			return
		end

		local key = list[idx]

		GmToolUtils.__timelineInfoPlayIndex = idx + 1

		local prefab = "$" .. tostring(key) .. ".prefab"

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("[playTimelineInfoDataSequential] play %s/%s %s", tostring(idx), tostring(#list), prefab)
		end

		pg.game.cutscene:playCutscene(prefab, prefab, nil, nil, nil, nil, {
			endCallback = playNext
		})
	end

	pg.global.ui.tips:showTextTip("开始依次播放timeline，共" .. tostring(#keys) .. "个(再次点击可停止)")
	pg.global.ui:close(62)
	pg.global.ui:close(2)
	playNext()
end

function GmToolUtils.deleteGhostEyePrefs()
	pg.global.prefsCacheUtils:setBool(GhostEyeConst.DETECT_TAG_KEY, false)
	pg.global.prefsCacheUtils:setBool(GhostEyeConst.DETECT_CAMOUFLAGE_KEY, false)
	pg.global.prefsCacheUtils:setBool(GhostEyeConst.BOTH_SIDE_KEY, false)
	pg.global.prefsCacheUtils:setBool(GhostEyeConst.NIGHT_VISION_KEY, false)
	pg.global.ui.tips:showTextTip("清理完成")
end

function GmToolUtils.setFullSearch(isSelected)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmTollFullSearch, isSelected)
	pg.global.prefsCacheUtils:save()

	GmToolUtils.fullSearch = isSelected
end

function GmToolUtils.checkSearchState()
	local fullSearch = pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmTollFullSearch, true)

	GmToolUtils.fullSearch = fullSearch

	return fullSearch
end

function GmToolUtils.setGamepadNavDebug(isSelected)
	pg.game.setting:setGamepadNavDebug(isSelected)
end

function GmToolUtils.getGamepadNavDebug()
	return pg.game.setting:getGamepadNavDebug()
end

function GmToolUtils.setShellActivityInviteDisabled(isSelected)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmDisableShellActivityInvite, isSelected)
	pg.global.prefsCacheUtils:save()
end

function GmToolUtils.getShellActivityInviteDisabled()
	return pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmDisableShellActivityInvite, false)
end

function GmToolUtils.showChainAttackByCurPetList()
	local player = pg.me

	if not player then
		return
	end

	local playerPetList = player.petPrepareList

	if not playerPetList or #playerPetList < 3 then
		return
	end

	local petList = {}

	for _, petId in ipairs(playerPetList) do
		table.insert(petList, petId)
	end

	pg.global.ui:open(UIConst.UI_ID_CHAIN_ATTACK, nil, function()
		pg.global.ui.chainAttack:triggerExtremeChainV2(petList)
	end)
end

function GmToolUtils.showChainAttackRespond()
	pg.global.ui:open(UIConst.UI_ID_CHAIN_ATTACK_RESPOND, nil, function()
		pg.global.ui.chainAttackRespond:showChainAttackRespondBtn(true, uid)
	end)
end

function GmToolUtils.setCaptureProbabilityHide(isHide)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmCaptureProbability, isHide)
	pg.global.prefsCacheUtils:save()

	GmToolUtils.captureProbabilityHide = isHide
end

function GmToolUtils.checkCaptureProbabilityHide()
	local isHide = pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmCaptureProbability, false)

	GmToolUtils.captureProbabilityHide = isHide

	return isHide
end

function GmToolUtils.setCatchDebugInfo(isShow)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmCatchDebugInfo, isShow)
	pg.global.prefsCacheUtils:save()

	GmToolUtils.gmCatchDebugInfo = isShow
end

function GmToolUtils.checkCatchDebugInfo()
	local isShow = pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmCatchDebugInfo, false)

	GmToolUtils.gmCatchDebugInfo = isShow

	return isShow
end

function GmToolUtils.setDebugAlertLog(enable)
	local TopLogoConst = require("Const.TopLogoConst")

	TopLogoConst.IsDebugAlertLog = enable
end

function GmToolUtils.checkDebugAlertLog()
	local TopLogoConst = require("Const.TopLogoConst")

	return TopLogoConst.IsDebugAlertLog
end

function GmToolUtils.setBotPlayerTopLogo(enable)
	local TopLogoConst = require("Const.TopLogoConst")

	if TopLogoConst.EnableBotPlayerTopLogo == enable then
		return
	end

	TopLogoConst.EnableBotPlayerTopLogo = enable

	for _, ent in pairs(pg.getEntities()) do
		if ent.refreshBotPlayerTopLogoSwitch then
			ent:refreshBotPlayerTopLogoSwitch()
		end
	end
end

function GmToolUtils.checkBotPlayerTopLogo()
	local TopLogoConst = require("Const.TopLogoConst")

	return TopLogoConst.EnableBotPlayerTopLogo
end

function GmToolUtils.gcAndCount()
	local oldMem = collectgarbage("count")

	collectgarbage("collect")
	collectgarbage("collect")

	local newMem = collectgarbage("count")

	if LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:info(string.format("lua memory:%s before gc:%s", newMem, oldMem))
	end
end

function GmToolUtils.luaProfileTrigger()
	local AppProfiler = require("Core.Profiler.AppProfiler")

	AppProfiler.trigger()
end

function GmToolUtils.luaProfileClear()
	local AppProfiler = require("Core.Profiler.AppProfiler")

	AppProfiler.clear()
end

function GmToolUtils.luaMemTrigger()
	require("Core.Profiler.AppMemAllocStats").trigger()
end

function GmToolUtils.luaMemClear()
	require("Core.Profiler.AppMemAllocStats").clear()
end

function GmToolUtils.luaMemSnap()
	require("Core.Profiler.MemoryReferenceInfo").DumpFileFormat("lua_memory_snap_%s.log")
end

function GmToolUtils.luaDelegateUnityRefSnap(onlyNull, includeEnv, options)
	require("Core.Profiler.UnityObjectRef").DumpDelegateUnityRefsFormat("lua_delegate_unity_ref_%s.log", onlyNull, includeEnv, options)
end

function GmToolUtils.luaDelegateUnityRefSnapFull(onlyNull)
	require("Core.Profiler.UnityObjectRef").DumpDelegateUnityRefsFormat("lua_delegate_unity_ref_full_%s.log", {
		includeRegistryPools = false,
		maxDepth = 64,
		includeGlobalObjects = true,
		includeEnv = true,
		includeWeak = false,
		includeMetatable = true,
		onlyNull = onlyNull and true or false
	})
end

function GmToolUtils.toggleSample()
	local ret = SampleUtils.sampleOn()

	SampleUtils.enableSample(not ret)
end

function GmToolUtils.checkSample()
	return SampleUtils.sampleOn()
end

function GmToolUtils.toggleSampleLuaMemory()
	local ret = SampleUtils.sampleLuaMemoryOn()

	SampleUtils.enableSampleLuaMemory(not ret)
end

function GmToolUtils.checkSampleLuaMemory()
	return SampleUtils.sampleLuaMemoryOn()
end

local _csharpLeakSample = false

function GmToolUtils.csharpLeakSetEnable(enable)
	_csharpLeakSample = enable and true or false

	CS.GMObjectStackTraceTracker.SetEnable(_csharpLeakSample)
end

function GmToolUtils.csharpLeakSample()
	GmToolUtils.csharpLeakSetEnable(not _csharpLeakSample)
end

function GmToolUtils.csharpLeakCheckSample()
	return _csharpLeakSample
end

function GmToolUtils.csharpLeakTrackWithLua(obj, tag)
	CS.GMObjectStackTraceTracker.TrackWithLua(obj, tag)
end

function GmToolUtils.csharpLeakPrintAll()
	CS.GMObjectStackTraceTracker.PrintAll()
end

function GmToolUtils.csharpLeakSave()
	GmToolUtils.csharpLeakPrintAll()
end

function GmToolUtils.runNetworkDiagnosis()
	local Switch = require("Core.Common.Switch")

	Switch.BI_LOG = true

	local NetworkDiagHelper = require("Utils.NetworkDiagHelper")

	NetworkDiagHelper.runDiagnosis(true)
end

function GmToolUtils.openRpcDebug()
	local RpcDebugHelper = require("Utils.RpcDebugHelper")

	RpcDebugHelper.setRpcDebug()
end

function GmToolUtils.checkRpcDebug()
	local RpcDebugHelper = require("Utils.RpcDebugHelper")

	return RpcDebugHelper.RpcDebug
end

function GmToolUtils.openCreateUserDebug()
	ClientSwitch.OpenCreateUserProcess = not ClientSwitch.OpenCreateUserProcess
end

function GmToolUtils.checkCreateUserDebug()
	return ClientSwitch.OpenCreateUserProcess
end

function GmToolUtils.closePopupInfoDebug(isSelected)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmClosePopupInfoTip, isSelected)
	pg.global.prefsCacheUtils:save()

	ClientSwitch.ClosePopupInfoTip = isSelected
end

function GmToolUtils.checkPopupInfoDebug()
	local select = pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmClosePopupInfoTip, false)

	return select
end

function GmToolUtils.setMaskState(isSelected)
	GmToolUtils.openMask = isSelected

	facade:SendMessageCommand(MessageName.SET_GM_TOPPING_MASK, isSelected)
end

function GmToolUtils.checkMaskState(isSelected)
	return GmToolUtils.openMask
end

function GmToolUtils.refreshScript()
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("refreshAllScripts executed000!!!")
	end

	ClientUtils.refreshCodeAndData()

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("refreshAllScripts executed!!!")
	end
end

function GmToolUtils.refreshBt()
	pg.me:refreshBt()
end

function GmToolUtils.setClosePhotoMark(enable)
	GmToolUtils.closePhotoMark = enable
end

function GmToolUtils.getClosePhotoMark()
	return GmToolUtils.closePhotoMark
end

function GmToolUtils.setVitalityEnable(enable)
	pg.game.setting:setVitalityEnable(enable)

	if enable then
		pg.global.ui:open(UIConst.UI_ID_VITALITY)
	else
		pg.global.ui:close(UIConst.UI_ID_VITALITY)
	end
end

function GmToolUtils.getEnableVitality()
	return pg.game.setting:getEnableVitality()
end

function GmToolUtils.debugShowId(isSelected)
	pg.game.setting:setShowDebugId(isSelected)
end

function GmToolUtils.debugEntityInfo(isSelected)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("debugEntityInfo", isSelected)
	end

	pg.game.setting:setShowDebugText(isSelected)
	CS.FunPlus.WorldX.Utils.GmToolUtils.SetEntityDebugGUI(isSelected)
end

function GmToolUtils.debugHomelandBaseInfo(isSelected)
	pg.game.home:setEnableDebugInfo(ClientConst.HomelandDebugType.Base, isSelected)
end

function GmToolUtils.getEnableDebugHomelandBaseInfo()
	return pg.game.home:getEnableDebugInfo(ClientConst.HomelandDebugType.Base)
end

function GmToolUtils.debugHomelandEnvInfo(isSelected)
	pg.game.home:setEnableDebugInfo(ClientConst.HomelandDebugType.Env, isSelected)
end

function GmToolUtils.getEnableDebugHomelandEnvInfo()
	return pg.game.home:getEnableDebugInfo(ClientConst.HomelandDebugType.Env)
end

GmToolUtils.homeDemoModeOn = false
GmToolUtils.homePetCollisionModeOn = false
GmToolUtils.homePetLargeAvoidanceOn = false

function GmToolUtils.refreshHomePetCollisionClientState()
	local space = pg.space or pg.me and pg.me.space

	if not space or not space.pets then
		return
	end

	for petId in pairs(space.pets) do
		local ent = pg.getEntity(petId)

		if ent then
			ent:postComponentMethod("onHomeEventChanged")
		end
	end
end

function GmToolUtils.setHomePetCollisionMode(isSelected)
	GmToolUtils.homePetCollisionModeOn = isSelected and true or false

	GmToolUtils.refreshHomePetCollisionClientState()
end

function GmToolUtils.getHomePetCollisionMode()
	return GmToolUtils.homePetCollisionModeOn
end

function GmToolUtils.syncHomeDemoModeSwitches(isSelected)
	local enabled = isSelected and true or false

	GmToolUtils.homePetCollisionModeOn = enabled
	ClientSwitch.NvidiaVoiceTest = enabled
end

function GmToolUtils.refreshHomePetRVOClientState()
	local space = pg.space or pg.me and pg.me.space

	if not space or not space.pets then
		return
	end

	for petId in pairs(space.pets) do
		local ent = pg.getEntity(petId)

		if ent and ent.setHomePetRVOSetting then
			ent:setHomePetRVOSetting()
		end
	end
end

function GmToolUtils.setHomePetLargeAvoidance(isSelected)
	GmToolUtils.homePetLargeAvoidanceOn = isSelected and true or false

	GmToolUtils.refreshHomePetRVOClientState()
end

function GmToolUtils.getHomePetLargeAvoidance()
	return GmToolUtils.homePetLargeAvoidanceOn
end

function GmToolUtils.refreshHomeDemoModeClientState()
	local space = pg.space or pg.me and pg.me.space

	if not space then
		return
	end

	space.demoMode = GmToolUtils.homeDemoModeOn

	if pg.me and pg.me.space and pg.me.space ~= space then
		pg.me.space.demoMode = GmToolUtils.homeDemoModeOn
	end

	if space.refreshHasFoodState then
		space:refreshHasFoodState()
	end

	if not space.pets then
		return
	end

	for petId in pairs(space.pets) do
		local ent = pg.getEntity(petId)

		if ent then
			ent:postComponentMethod("onHomelandAIPlanChanged")
			ent:postComponentMethod("onHomeEventChanged")
			ent.eventEmitter:emit(EventConst.HOMELAND_WORK_STATE_CHANGED, {})
			ent.eventEmitter:emit(EventConst.HOMELAND_ACTION_STATE_CHANGED, {})
		end
	end
end

function GmToolUtils.setHomeDemoMode(isSelected)
	GmToolUtils.homeDemoModeOn = isSelected and true or false

	GmToolUtils.syncHomeDemoModeSwitches(GmToolUtils.homeDemoModeOn)
	GmToolUtils.refreshHomeDemoModeClientState()
	HomelandDemoCmdImplement.setEnabled(pg.game and pg.game.cmdSocket or nil, nil, {
		enabled = GmToolUtils.homeDemoModeOn
	})
	pg.me:doGmCmd("setHomeDemoMode", GmToolUtils.homeDemoModeOn)
end

function GmToolUtils.getHomeDemoMode()
	local space = pg.space or pg.me and pg.me.space

	if space and space.demoMode ~= nil then
		GmToolUtils.homeDemoModeOn = space.demoMode and true or false

		return GmToolUtils.homeDemoModeOn
	end

	return GmToolUtils.homeDemoModeOn
end

function GmToolUtils.resetHomeDemoProgress()
	pg.me:doGmCmd("resetHomeDemoProgress")
end

function GmToolUtils.forceStartHomeSeasonCelebrationPreparation(festivalId)
	if not HomeSeasonCelebrationTestConst.ENABLED then
		return
	end

	pg.me:doGmCmd("forceStartHomeSeasonCelebrationPreparation", tonumber(festivalId) or HomeSeasonCelebrationTestConst.FESTIVAL_ID)
end

function GmToolUtils.getHomelandDecorationDataFilePath()
	return CS.UnityEngine.Application.persistentDataPath .. "/" .. GmToolUtils.HOMELAND_DECORATION_JSON_FILE_NAME
end

function GmToolUtils.getHomePlanFurnitureConfigFilePath(code)
	local logFilePath = CS.UnityEngine.Application.consoleLogPath
	local logDirectory = string.match(logFilePath or "", "^(.+)[/\\][^/\\]+$")

	if string.isNilOrEmpty(logDirectory) then
		return nil
	end

	return string.format("%s/HomePlanFurnitureConfig_%s_%s.txt", logDirectory, tostring(code):gsub("[<>:\"/\\|?*%c]", "_"), os.date("%Y%m%d_%H%M%S"))
end

function GmToolUtils.normalizeHomelandDecorationDataFilePath(filePath)
	filePath = string.trim(filePath or "")

	if string.sub(filePath, 1, 1) == "\"" and string.sub(filePath, -1) == "\"" then
		filePath = string.sub(filePath, 2, -2)
	end

	if string.isNilOrEmpty(filePath) then
		return GmToolUtils.getHomelandDecorationDataFilePath()
	end

	local lastCharacter = string.sub(filePath, -1)

	if lastCharacter == "/" or lastCharacter == "\\" then
		filePath = filePath .. GmToolUtils.HOMELAND_DECORATION_JSON_FILE_NAME
	end

	return filePath
end

function GmToolUtils.exportHomelandDecorationDataFile(buttons)
	local inputButton = buttons and buttons[0]
	local input = inputButton and inputButton:GetChild("InputField"):GetComponent("UTMPInputField")

	GmToolUtils.pendingHomelandDecorationExportFilePath = GmToolUtils.normalizeHomelandDecorationDataFilePath(input and input.text or "")

	pg.me:doGmCmd("exportHomelandDecorationDataFile")
end

function GmToolUtils.saveHomelandDecorationDataFile(jsonText, filePath)
	filePath = GmToolUtils.normalizeHomelandDecorationDataFilePath(filePath)

	local file, openError = io.open(filePath, "wb")

	if not file then
		return false, string.format("无法创建文件 %s：%s", filePath, tostring(openError))
	end

	local writeResult, writeError = file:write(jsonText)
	local closeResult, closeError = file:close()

	if not writeResult then
		return false, string.format("写入文件失败：%s", tostring(writeError))
	end

	if not closeResult then
		return false, string.format("关闭文件失败：%s", tostring(closeError))
	end

	return true, filePath
end

function GmToolUtils.cancelImportHomelandDecorationData()
	GmToolUtils.pendingHomelandDecorationJson = nil
end

function GmToolUtils.confirmImportHomelandDecorationData()
	local jsonText = GmToolUtils.pendingHomelandDecorationJson

	GmToolUtils.pendingHomelandDecorationJson = nil

	if string.isNilOrEmpty(jsonText) then
		return
	end

	pg.me:doGmCmd("importHomelandDecorationData", jsonText)
end

function GmToolUtils.prepareImportHomelandDecorationData(jsonText)
	jsonText = string.trim(jsonText or "")

	if string.isNilOrEmpty(jsonText) then
		pg.global.ui.tips:showTextTip("家园装饰 JSON 文件为空")

		return
	end

	if #jsonText > GmToolUtils.HOMELAND_DECORATION_JSON_MAX_LENGTH then
		pg.global.ui.tips:showTextTip("家园装饰 JSON 超过 2 MB，无法导入")

		return
	end

	GmToolUtils.pendingHomelandDecorationJson = jsonText

	pg.global.showConfirmMsgRaw("导入家园装饰数据", "将覆盖当前家园的装饰家具、生产设施、垃圾杂物及地块/区域解锁数据；生产配方进度、设施产物和宠物派遣不会跨账号复制。此操作不可撤销，是否继续？", GmToolUtils.confirmImportHomelandDecorationData, false, GmToolUtils.cancelImportHomelandDecorationData)
end

function GmToolUtils.importHomelandDecorationDataFromFile(buttons)
	local inputButton = buttons and buttons[0]
	local input = inputButton and inputButton:GetChild("InputField"):GetComponent("UTMPInputField")
	local filePath = GmToolUtils.normalizeHomelandDecorationDataFilePath(input and input.text or "")
	local file, openError = io.open(filePath, "rb")

	if not file then
		pg.global.ui.tips:showTextTip(string.format("无法打开家园装饰 JSON 文件：%s", tostring(openError)))

		return
	end

	local fileLength, seekError = file:seek("end")

	if not fileLength then
		file:close()
		pg.global.ui.tips:showTextTip(string.format("读取家园装饰 JSON 文件大小失败：%s", tostring(seekError)))

		return
	end

	if fileLength > GmToolUtils.HOMELAND_DECORATION_JSON_MAX_LENGTH then
		file:close()
		pg.global.ui.tips:showTextTip("家园装饰 JSON 文件超过 2 MB，无法导入")

		return
	end

	file:seek("set", 0)

	local jsonText = file:read("*a")

	file:close()
	GmToolUtils.prepareImportHomelandDecorationData(jsonText)
end

function GmToolUtils.refreshHomelandDecorationZonePresentation()
	if not pg.game or not pg.game.home or not pg.space then
		return
	end

	pg.game.home:destroyZones()
	pg.game.home:createLockZones(pg.space.unlockZone)
	pg.game.home:onAreaUnlockedChanged()
end

function GmToolUtils.mountVehicle(params)
	local pet = ""

	for petId, _ in pairs(pg.space.pets) do
		pet = pg.getEntity(petId)
	end

	local petId = pet.id
	local fuId = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local seatId = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text

	GmToolUtils.forceHomePetMountFurniture(petId, fuId, seatId)
end

function GmToolUtils.dismountVehicle(params)
	local pet = ""

	for petId, _ in pairs(pg.space.pets) do
		pet = pg.getEntity(petId)
	end

	local petId = pet.id
	local fuId = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local seatId = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local pet = petId and pg.getEntity(petId)

	return pet:dismountSelf()
end

function GmToolUtils.createBubbleVehicle(params)
	if pg.me == nil then
		return
	end

	local vehicleId = tonumber(params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 81
	local distance = tonumber(params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 3

	pg.me:serverMsg("RPC_CS_GmCreateBubbleVehicle", vehicleId, distance)
end

function GmToolUtils.forceHomePetMountFurniture(petId, ornamentId, seatIndex)
	ornamentId = tonumber(ornamentId)
	seatIndex = tonumber(seatIndex) or 1

	local pet = petId and pg.getEntity(petId)

	if not Utils.isHomePet(pet) then
		return false, "ClientHomePet not found"
	end

	local furniture = pg.game.home and pg.game.home:getHomeEntity(ornamentId)

	if not furniture then
		return false, "home furniture not found"
	end

	return furniture:tryPetMount(pet, seatIndex)
end

function GmToolUtils.printHomeVehicleSeatWorldPositions(vehicleId, attachType)
	attachType = attachType == "player" and "player" or "pet"

	local positionMap, errorMessage = HomeLandUtils.getHomeVehicleSeatWorldPositionMap(vehicleId, attachType)

	if errorMessage then
		print(string.format("[HomeVehicleSeat] %s", errorMessage))
	end

	local seatIds = {}

	for seatId in pairs(positionMap) do
		seatIds[#seatIds + 1] = seatId
	end

	table.sort(seatIds)
	print(string.format("[HomeVehicleSeat] vehicleId=%s attachType=%s seatCount=%d", tostring(vehicleId), attachType, #seatIds))

	for _, seatId in ipairs(seatIds) do
		local position = positionMap[seatId]

		print(string.format("[HomeVehicleSeat] seatId=%s worldPosition=(%.3f, %.3f, %.3f)", tostring(seatId), position.x, position.y, position.z))
	end

	return positionMap
end

function GmToolUtils.printAllHomeVehiclePetSeatWorldPositions()
	local homeSystem = pg.game and pg.game.home
	local homeEntities = homeSystem and homeSystem.homeEntities

	if not homeEntities then
		print("[HomeVehicleSeat] current homeland is unavailable")

		return 0
	end

	local vehicles = {}

	for ornamentId, entity in pairs(homeEntities) do
		if entity and type(entity.getSeatWorldPositionMap) == "function" then
			vehicles[#vehicles + 1] = {
				ornamentId = ornamentId,
				entity = entity
			}
		end
	end

	table.sort(vehicles, function(left, right)
		return tostring(left.ornamentId) < tostring(right.ornamentId)
	end)
	print(string.format("[HomeVehicleSeat] homelandVehicleCount=%d attachType=pet", #vehicles))

	for _, vehicleInfo in ipairs(vehicles) do
		local entity = vehicleInfo.entity
		local config = entity.getConfigData and entity:getConfigData() or HomeObjectData[entity.homeTemplateId] or {}
		local vehicleName = config.name and GmToolUtils.getGmLocalizationText(config.name) or string.format("Vehicle_%s", tostring(entity.homeTemplateId))
		local positionMap, errorMessage = HomeLandUtils.getHomeVehicleSeatWorldPositionMap(entity.id, "pet")
		local seatIds = {}

		for seatId in pairs(positionMap) do
			seatIds[#seatIds + 1] = seatId
		end

		table.sort(seatIds)
		print(string.format("[HomeVehicleSeat] vehicleName=%s ornamentId=%s entityId=%s templateId=%s petSeatCount=%d", vehicleName, tostring(vehicleInfo.ornamentId), tostring(entity.id), tostring(entity.homeTemplateId), #seatIds))

		if errorMessage then
			print(string.format("[HomeVehicleSeat] vehicleName=%s error=%s", vehicleName, errorMessage))
		end

		for _, seatId in ipairs(seatIds) do
			local position = positionMap[seatId]

			print(string.format("[HomeVehicleSeat] vehicleName=%s seatId=%s worldPosition=(%.3f, %.3f, %.3f)", vehicleName, tostring(seatId), position.x, position.y, position.z))
		end
	end

	return #vehicles
end

function GmToolUtils.debugHomeLinkInfo(isSelected)
	pg.game.home.showLinkDebugInfo = isSelected
end

function GmToolUtils.getEnableHomeLinkDebug()
	return pg.game.home.showLinkDebugInfo
end

function GmToolUtils.getHomeLinkPresetFilterList()
	local BuildConst = require("Common.Homeland.OrnamentBuild.BuildConst")

	return BuildConst.getLinkSocketPresetOptionList()
end

function GmToolUtils.setHomeLinkPresetFilter(selectData)
	pg.game.home:setSrcEntityLinkPresetFilter(selectData and selectData.value)
end

function GmToolUtils.getHomeLinkDirFilterList()
	local BuildConst = require("Common.Homeland.OrnamentBuild.BuildConst")

	return BuildConst.getLinkSocketDirOptionList()
end

function GmToolUtils.setHomeLinkDirFilter(selectData)
	pg.game.home:setSrcEntityLinkDirFilter(selectData and selectData.value)
end

function GmToolUtils.setUWAGPMDebugMode(isDebugMode)
	if pg.global.UWAGPMManager then
		pg.global.UWAGPMManager:setDebugMode(isDebugMode)
	end
end

function GmToolUtils.onEnableHitCameraShakeChange(isSelected)
	pg.game.setting:setEnableHitCameraShake(isSelected)
end

function GmToolUtils.getEnableHitCameraShake()
	return pg.game.setting:getEnableHitCameraShake()
end

function GmToolUtils.onEnableHitRippleAllChange(isSelected)
	if pg.me then
		pg.me.enableHitRippleAll = isSelected
	end
end

function GmToolUtils.getEnableHitRippleAll()
	return pg.me ~= nil and pg.me.enableHitRippleAll == true
end

function GmToolUtils.showCreateCarWnd()
	pg.global.ui.homeCarName:open()
end

function GmToolUtils.debugEntityInfoSimple(isSelected)
	pg.game.setting:setShowDebugTextSimple(isSelected)
end

function GmToolUtils.enableGamepadDebugCapture(isSelected)
	pg.game.setting:setEnableGamepadDebugCapture(isSelected)
end

function GmToolUtils.debugDrawHitBox(isSelected)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("debugDrawHitBox", isSelected)
	end

	local player = pg.me

	if player then
		player:globalDrawHitBox(isSelected)
	end

	local entities = pg.getEntities()

	if entities then
		for id, entity in pairs(entities) do
			if entity.enableDrawActorHitBox then
				entity:enableDrawActorHitBox(isSelected)
			end
		end
	end
end

function GmToolUtils.debugDrawRbCollider(isSelected)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("debugDrawRbCollider", isSelected)
	end

	local player = pg.me

	if player then
		player:globalDrawRbCollider(isSelected)
	end

	local entities = pg.getEntities()

	if entities then
		for id, entity in pairs(entities) do
			if entity.enableDrawRbCollider then
				entity:enableDrawRbCollider(isSelected)
			end
		end
	end
end

function GmToolUtils.debugDrawRbCatchCollider(isSelected)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("debugDrawRbCatchCollider", isSelected)
	end

	local player = pg.me

	if player then
		player:globalDrawRbCatchCollider(isSelected)
	end

	local entities = pg.getEntities()

	if entities then
		for id, entity in pairs(entities) do
			if entity.enableDrawRbCatchCollider then
				entity:enableDrawRbCatchCollider(isSelected)
			end
		end
	end
end

function GmToolUtils.toggleEnableEffectMpeLodDown(isSelected)
	ClientSwitch.EnableEffectMpeLodDown = not ClientSwitch.EnableEffectMpeLodDown
end

function GmToolUtils.debugDrawSpeedLine(isSelected)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("debugDrawSpeedLine", isSelected)
	end

	local player = pg.me

	if player then
		player:globalDrawSpeedLine(isSelected)
	end
end

function GmToolUtils.setWorldRaceDebugEnabled(isSelected)
	WorldRaceDebugView.setEnabled(isSelected)
end

function GmToolUtils.getWorldRaceDebugEnabled()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetWorldRaceDebugEnabled()
end

function GmToolUtils.getEnableShowId()
	return pg.game.setting:getShowDebugId()
end

function GmToolUtils.setGuideEnable(enable)
	pg.game.setting:setHideGuide(enable)
end

function GmToolUtils.getEnableGuide()
	return pg.game.setting:getHideGuide()
end

function GmToolUtils.unlockAllHelp()
	if not pg.me then
		return
	end

	local lockedHelpIds = {}

	for helpId in pairs(GuidenceItemData) do
		if Utils.getHelpIsUnlock(pg.me, helpId) ~= Const.HELP_UNLOCK_LEVEL.UNLOCK then
			lockedHelpIds[#lockedHelpIds + 1] = helpId
		end
	end

	table.sort(lockedHelpIds)

	for _, helpId in ipairs(lockedHelpIds) do
		pg.me:serverMsg("RPC_CS_UnlockHelpItem", helpId)
	end
end

function GmToolUtils.getEnableDebug()
	return pg.game.setting:getShowDebugText()
end

function GmToolUtils.getEnableDebugSimple()
	return pg.game.setting:getShowDebugTextSimple()
end

function GmToolUtils.showEffectFieldsInfo(params)
	local vf = params[0]:GetChild("InputField"):GetComponent("UTMPInputField")
	local ws = params[1]:GetChild("InputField"):GetComponent("UTMPInputField")
	local of = params[2]:GetChild("InputField"):GetComponent("UTMPInputField")
	local rf = params[3]:GetChild("InputField"):GetComponent("UTMPInputField")

	pg.global.effectMgr:ShowFieldsDebugInfo(vf, ws, of, rf)
end

function GmToolUtils.setUIVirtualTextureEnabled(isSelected)
	CS.FunPlus.WorldX.Setting.VideoSetting.SetUIVirtualTextureEnabled(isSelected)
	GmToolUtils.refreshAllUI()
end

function GmToolUtils.checkUIVirtualTextureEnabled()
	return CS.FunPlus.WorldX.Setting.VideoSetting.GetUIVirtualTextureEnabled()
end

function GmToolUtils.setTextureStreamingGlobalHudEnabled(isSelected)
	CS.FunPlus.WorldX.Setting.VideoSetting.SetTextureStreamingGlobalHudEnabled(isSelected)
end

function GmToolUtils.checkTextureStreamingGlobalHudEnabled()
	return CS.FunPlus.WorldX.Setting.VideoSetting.GetTextureStreamingGlobalHudEnabled()
end

function GmToolUtils.setDisableUIScale(isSelected)
	CS.FunPlus.WorldX.Setting.VideoSetting.DisableUIScale(isSelected)
end

function GmToolUtils.checkDisableUIScale()
	return CS.FunPlus.WorldX.Setting.VideoSetting.GetDisableUIScale()
end

local function getDlssNrValues()
	if not GmToolUtils._dlssNrValues or GmToolUtils._dlssNrValues.mode == nil then
		GmToolUtils._dlssNrValues = {
			skinStructureStrength = 1,
			globalToneStrength = 1,
			mode = 1,
			localToneStrength = 1,
			useAutoMask = false,
			intensity = 1,
			style = 0,
			localStructureStrength = 1
		}
	end

	return GmToolUtils._dlssNrValues
end

function GmToolUtils.setDlssNrOverride(isSelected)
	GmToolUtils.applyDlssNrOverride(isSelected == true)
end

function GmToolUtils.getDlssNrOverride()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetDlssNrOverride()
end

function GmToolUtils.getDlssNrParam(param)
	return getDlssNrValues()[param]
end

function GmToolUtils.setDlssNrParam(value, param)
	getDlssNrValues()[param] = value
end

function GmToolUtils.setDlssNrAutoMask(isSelected)
	getDlssNrValues().useAutoMask = isSelected == true
end

function GmToolUtils.getDlssNrAutoMask()
	return getDlssNrValues().useAutoMask
end

function GmToolUtils.setDlssNrParameters(buttons)
	local function sliderValue(index)
		local button = buttons and buttons[index]
		local slider = button and button:GetChild("Slider")

		slider = slider and slider:GetComponent("USlider")

		return slider and slider.value or nil
	end

	local v = {
		mode = tonumber(GmToolUtils.getInputValue(buttons, 1)),
		intensity = sliderValue(2),
		localToneStrength = sliderValue(3),
		globalToneStrength = sliderValue(4),
		localStructureStrength = sliderValue(5),
		style = tonumber(GmToolUtils.getInputValue(buttons, 6)),
		useAutoMask = GmToolUtils.getDlssNrAutoMask(),
		skinStructureStrength = sliderValue(8)
	}

	local function inRange(value, minValue, maxValue)
		return type(value) == "number" and minValue <= value and value <= maxValue
	end

	if not inRange(v.mode, 0, 1) or v.mode ~= math.floor(v.mode) or not inRange(v.style, 0, 20) or v.style ~= math.floor(v.style) then
		pg.global.ui.tips:showTextTip("NR Mode 请填整数 0/1，Style 请填整数 0-20")

		return
	end

	if not inRange(v.intensity, 0, 1) or not inRange(v.localToneStrength, 0, 1) or not inRange(v.globalToneStrength, 0, 2) or not inRange(v.localStructureStrength, 0, 1) or not inRange(v.skinStructureStrength, 0, 1) then
		pg.global.ui.tips:showTextTip("NR 参数读取失败或超出范围，请重新打开 Render 面板")

		return
	end

	GmToolUtils._dlssNrValues = v

	GmToolUtils.applyDlssNrOverride()
	pg.global.ui.tips:showTextTip(GmToolUtils.getDlssNrOverride() and string.format("NR 参数已应用：Mode=%d，Style=%d", v.mode, v.style) or "NR 参数已保存，请打开 Override DLSS NR 生效")
end

function GmToolUtils.applyDlssNrOverride(enabled)
	if enabled == nil then
		enabled = GmToolUtils.getDlssNrOverride()
	end

	local v = getDlssNrValues()

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetDlssNrOverride(enabled, v.mode, v.intensity, v.localToneStrength, v.globalToneStrength, v.localStructureStrength, v.style, v.useAutoMask, v.skinStructureStrength)
end

function GmToolUtils.setStaticBlurEnabled(isSelected)
	CS.FunPlus.WorldX.Utils.GmToolUtils.SetStaticBlurEnabled(isSelected)
end

function GmToolUtils.getStaticBlurEnabled()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetStaticBlurEnabled()
end

function GmToolUtils.setEffectParticleRenderingEnabled(isSelected)
	pg.global.effectMgr:SetParticleRenderingEnabled(isSelected)
end

function GmToolUtils.getEffectParticleRenderingEnabled()
	return pg.global.effectMgr.ParticleRenderingEnabled
end

function GmToolUtils.setEffectParticleVisibleEnabled(isSelected)
	pg.global.effectMgr:SetParticleVisibleEnabled(isSelected)
end

function GmToolUtils.getEffectParticleVisibleEnabled()
	return pg.global.effectMgr.ParticleVisibleEnabled
end

function GmToolUtils.setEffectActive(isSelected)
	pg.global.effectMgr:SetEffectActive(isSelected)
end

function GmToolUtils.getEffectActive()
	return pg.global.effectMgr.EffectActive
end

function GmToolUtils.setLuaTickFrameInterval(params)
	local frameIntervalStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local frameInterval = math.floor(tonumber(frameIntervalStr) or 1)
	local GmToolUtils = CS.FunPlus.WorldX.Utils.GmToolUtils

	GmToolUtils.SetLuaTickFrameInterval(frameInterval)
	pg.game.setting:queryLuaTickFrameInterval()
end

function GmToolUtils.getLuaTickFrameInterval()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetLuaTickFrameInterval()
end

function GmToolUtils.setDynamicBatchEnabled(isSelected)
	CS.FunPlus.WorldX.Setting.VideoSetting.SetDynamicBatchEnabled(isSelected)
end

function GmToolUtils.checkDynamicBatchEnabled()
	return CS.FunPlus.WorldX.Setting.VideoSetting.GetDynamicBatchEnabled()
end

function GmToolUtils.setPostTaa5TapSharpenEnabled(isSelected)
	pg.game.setting:setGmPostTaa5TapSharpenEnabled(isSelected)
end

function GmToolUtils.getPostTaa5TapSharpenEnabled()
	return pg.game.setting:getGmPostTaa5TapSharpenEnabled()
end

function GmToolUtils.setVSyncEnabled(isSelected)
	pg.game.setting:setGmVSync(isSelected and 1 or 0)
end

function GmToolUtils.getVSyncEnabled()
	return pg.game.setting:getGmVSync() ~= 0
end

function GmToolUtils.setLowResolutionEnabled(isSelected)
	pg.game.setting:setGmLowResolutionEnabled(isSelected)
end

function GmToolUtils.getLowResolutionEnabled()
	return pg.game.setting:getGmLowResolutionEnabled()
end

function GmToolUtils.setTransparentInOnePassEnabled(isSelected)
	pg.game.setting:setGmTransparentInOnePassEnabled(isSelected)
end

function GmToolUtils.getTransparentInOnePassEnabled()
	return pg.game.setting:getGmTransparentInOnePassEnabled()
end

function GmToolUtils.setTransparentInIndependentPassEnabled(isSelected)
	pg.game.setting:setGmTransparentInIndependentPassEnabled(isSelected)
end

function GmToolUtils.getTransparentInIndependentPassEnabled()
	return pg.game.setting:getGmTransparentInIndependentPassEnabled()
end

function GmToolUtils.refreshAllUI()
	pg.global.ui:closeAllUIPanel({
		[UIConst.UI_ID_TOPLOGO] = true
	}, true, true)
	pg.global.ui.loadProgress:open()

	if pg.me then
		LuaUIUtils.onPlayerCreate()
	else
		ClientUtils.innerBackToHome()
	end

	pg.global.ui.topLogo:open()
end

function GmToolUtils.getProfileInfo()
	CS.FunPlus.WorldX.Utils.GmToolUtils.GetProfileInfo(GmToolUtils.getProfileInfoDo)
end

function GmToolUtils.getProfileInfoDo(profileInfoJson)
	logger:info("teleportAndCollectProfileByPosList: %s", profileInfoJson)
end

function GmToolUtils.teleportAndCollectProfileByPosList()
	if GmToolUtils.__profilePosCollectPreTimerId then
		TimerManager.removeTimer(GmToolUtils.__profilePosCollectPreTimerId)

		GmToolUtils.__profilePosCollectPreTimerId = nil
	end

	if GmToolUtils.__profilePosCollectTimerId then
		TimerManager.removeTimer(GmToolUtils.__profilePosCollectTimerId)

		GmToolUtils.__profilePosCollectTimerId = nil
	end

	local sheetIndex1 = tonumber(1)
	local res = CS.FunPlus.WorldX.Utils.GmToolUtils.GetPerformanceParameters(sheetIndex1)

	if res ~= nil and LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[teleportAndCollectProfileByPosList] %s", tostring(res))
	end

	local points = {}
	local resStr = tostring(res or "")

	for line in string.gmatch(resStr, "[^\r\n]+") do
		local s = string.gsub(line or "", "^%s*(.-)%s*$", "%1")

		if s ~= "" then
			local parts = string.split(s, "\t")
			local sceneId = tonumber(parts[1])
			local name = parts[2] or ""
			local posStr = ""

			if #parts >= 3 then
				posStr = table.concat(parts, "\t", 3)
			end

			if sceneId and posStr ~= "" then
				local key = #points + 1

				points[#points + 1] = {
					key = key,
					value = {
						sceneId = sceneId,
						name = name,
						posStr = posStr
					}
				}
			end
		end
	end

	GmToolUtils.__profilePosCollectIndex = 1
	GmToolUtils.__profilePosCollectPoints = points

	pg.global.ui:close(62)
	pg.global.ui.tips:showTextTip("开始批量采样Profile: ")

	local function step()
		local idx = GmToolUtils.__profilePosCollectIndex
		local pts = GmToolUtils.__profilePosCollectPoints

		if not idx or not pts or idx > #pts then
			if GmToolUtils.__profilePosCollectPreTimerId then
				TimerManager.removeTimer(GmToolUtils.__profilePosCollectPreTimerId)

				GmToolUtils.__profilePosCollectPreTimerId = nil
			end

			if GmToolUtils.__profilePosCollectTimerId then
				TimerManager.removeTimer(GmToolUtils.__profilePosCollectTimerId)

				GmToolUtils.__profilePosCollectTimerId = nil
			end

			pg.global.ui.tips:showTextTip("批量采样Profile结束: ")

			return
		end

		local kv = pts[idx]
		local v = kv and kv.value or {}
		local sceneId = v.sceneId
		local pointStr = v.posStr
		local name = v.name

		local function doTeleportAndSample()
			CS.UnityEngine.GUIUtility.systemCopyBuffer = pointStr

			GmToolUtils.teleportCopyPos()

			GmToolUtils.__profilePosCollectTimerId = TimerManager.addTimer(15, function()
				if LoggerManager.checkLogger(LoggerConst.INFO) then
					logger:info("[teleportAndCollectProfileByPosList] name=%s", tostring(name))
				end

				GmToolUtils.getProfileInfo()

				GmToolUtils.__profilePosCollectTimerId = TimerManager.addTimer(3, function()
					GmToolUtils.__profilePosCollectIndex = idx + 1

					step()
				end)
			end)
		end

		local curSceneId = pg.me and pg.me.space and pg.me.space.sceneId
		local needSwitchScene = sceneId and curSceneId and tonumber(sceneId) and tonumber(curSceneId) and tonumber(sceneId) ~= tonumber(curSceneId)

		if needSwitchScene then
			pg.me:doGmCmd("teleportToScene", tonumber(sceneId), 0)

			GmToolUtils.__profilePosCollectPreTimerId = TimerManager.addTimer(60, doTeleportAndSample)
		else
			doTeleportAndSample()
		end
	end

	step()
end

function GmToolUtils.showPetFirstMeeting(params)
	local templateId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local label = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local keepShow = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text

	templateId = tonumber(templateId)

	if not templateId then
		return
	end

	label = tonumber(label)
	keepShow = tonumber(keepShow)

	GmToolUtils.showPetFirstMeetingByTemplateId(templateId, label, keepShow)
end

function GmToolUtils.showPetFirstMeetingByTemplateId(templateId, label, keepShow)
	local item = {}
	local res = {}

	res.templateId = templateId

	local petData = PetData[templateId]

	if not petData then
		return
	end

	local firstInfo = PetFirstShowData[templateId]

	if not firstInfo then
		pg.global.showBubbleMessageRaw("没配初见信息")

		return
	end

	res.headIconName = petData.iconName
	res.name = petData.name
	res.iconName = petData.iconName
	res.elementTypes = petData.elementType
	res.label = label
	item[#item + 1] = res

	pg.global.ui.tips:showPetFirstGot({
		newPets = item
	})
	pg.global.ui.config:close()
end

function GmToolUtils.showAllOnlinePetFirstMeeting(params)
	local startNumber, endNumber

	if params then
		local startNumberText = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local endNumberText = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text

		startNumber = tonumber(startNumberText)
		endNumber = tonumber(endNumberText)

		if startNumber and endNumber and endNumber < startNumber then
			startNumber, endNumber = endNumber, startNumber
		end
	end

	local newPets = {}

	for templateId, _ in pairs(PetFirstShowData) do
		local petData = PetData[templateId]
		local researchData = PetResearchContentData[templateId]
		local baseTemplateId = petData and petData.baseFormPet or templateId
		local baseResearchData = PetResearchContentData[baseTemplateId]
		local number = researchData and baseResearchData and (researchData.number or baseResearchData.number or 999999)

		if petData and researchData and baseResearchData and researchData.isShow ~= 0 and baseResearchData.isShow ~= 0 and (not startNumber or startNumber <= number) and (not endNumber or number <= endNumber) then
			newPets[#newPets + 1] = {
				label = 0,
				templateId = templateId,
				headIconName = petData.iconName,
				name = petData.name,
				iconName = petData.iconName,
				elementTypes = petData.elementType,
				number = number
			}
		end
	end

	table.sort(newPets, function(a, b)
		if a.number == b.number then
			return a.templateId < b.templateId
		end

		return a.number < b.number
	end)

	if #newPets == 0 then
		pg.global.showBubbleMessageRaw("没有可播放的宠物初见")

		return
	end

	local reversedPets = {}

	for i = #newPets, 1, -1 do
		reversedPets[#reversedPets + 1] = newPets[i]
	end

	pg.global.ui.tips:showPetFirstGot({
		newPets = reversedPets
	})
	pg.global.showBubbleMessageRaw("开始播放宠物初见，数量：" .. #newPets)
	pg.global.ui.config:close()
end

function GmToolUtils.enablePlayableLog(isSelected)
	pg.game.setting:setEnablePlayableLog(isSelected)
end

function GmToolUtils.getEnablePlayableLog()
	return pg.game.setting:getEnablePlayableLog()
end

function GmToolUtils.getEnableGamepadDebugCapture()
	return pg.game.setting:getEnableGamepadDebugCapture()
end

function GmToolUtils.getEnableDrawHitBox()
	return Switch.EnableDrawHitBox
end

function GmToolUtils.getEnableDrawRbCollider()
	return Switch.EnableDrawRbCollider
end

function GmToolUtils.getEnableDrawRbCatchCollider()
	return Switch.EnableDrawRbCatchCollider
end

function GmToolUtils.getEnableEffectMpeLodDown()
	return ClientSwitch.EnableEffectMpeLodDown
end

function GmToolUtils.getEnableDrawSpeedLine()
	return Switch.EnableDrawSpeedCurve
end

function GmToolUtils.cursorActInfo(isSelected)
	if isSelected then
		pg.game.input:setCursorMode(ClientConst.CURSOR_MODE_ACT)
	else
		pg.game.input:setCursorMode(ClientConst.CURSOR_MODE_NORMAL)
	end
end

function GmToolUtils.getIsCursorAct()
	return pg.game.input.cursorMode == ClientConst.CURSOR_MODE_ACT
end

function GmToolUtils.onBtDebugChange(isSelected)
	return
end

function GmToolUtils.OnSceneLoadedDo()
	CS.FunPlus.WorldX.Utils.GmToolUtils.OnSceneLoadedSet()

	if not GmToolUtils._attributeConstChecked and pg.me and Utils.enableClientUseGm(pg.me) then
		GmToolUtils._attributeConstChecked = true

		AttributeConstHelper.tipAttributeLuaDiffByRpc()
	end
end

function GmToolUtils.getBtDebug()
	if pg.me then
		return pg.me.btDebugging
	end
end

function GmToolUtils.onUseLockOnExtendCameraChange(isSelected)
	pg.game.controller.lockHelper:setIsUseLockOnExtendCamera(not pg.game.controller.lockHelper.isUseLockOnExtendCamera)
end

function GmToolUtils.getIsUseLockOnExtendCamera()
	return pg.game.controller.lockHelper.isUseLockOnExtendCamera
end

function GmToolUtils.onUseLockOnCameraChange(isSelected)
	pg.game.controller.lockHelper:setIsUseLockOnCamera(not pg.game.controller.lockHelper.isUseLockOnCamera)
end

function GmToolUtils.getIsUseLockOnCamera()
	return pg.game.controller.lockHelper.isUseLockOnCamera
end

function GmToolUtils.onKeyboardLockModeChange(selectData)
	pg.global.prefsCacheUtils:setInt(ClientConst.PrefKey.KeyboardLockMode, selectData.value)
	pg.game.controller.lockHelper:onInputDeviceChange()
end

function GmToolUtils.onGamepadLockModeChange(selectData)
	return
end

function GmToolUtils.onDrawAbilityMeshChange(isSelected)
	ClientSwitch.EnableDrawAbilityGizmo = not ClientSwitch.EnableDrawAbilityGizmo
end

function GmToolUtils.onlyDrawLatestAttackBox(isSelected)
	ClientSwitch.OnlyDrawLatestAttackBox = not ClientSwitch.OnlyDrawLatestAttackBox
end

function GmToolUtils.showLockEntDist(isSelected)
	pg.game.setting.showLockEntDist = isSelected

	if pg.global.csAbilityMgr then
		pg.global.csAbilityMgr:SetDebugLockEntDistEnable(isSelected)
	end
end

function GmToolUtils.showLockEntHates(isSelected)
	pg.game.setting.showLockEntHates = isSelected

	if pg.global.csAbilityMgr then
		pg.global.csAbilityMgr:SetDebugLockEntHatredEnable(isSelected)
	end
end

function GmToolUtils.showEntityWindow(isSelected)
	pg.game.setting.showEntityWindow = isSelected

	if pg.global.csAbilityMgr then
		pg.global.csAbilityMgr:SetDebugEntityWindowEnable(isSelected)
	end
end

GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MIN = 0.5
GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MAX = 1.5
GmToolUtils.GM_CAMERA_DISTANCE_SCALE_STEP = 0.1
GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MIN = 12
GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MAX = 20

function GmToolUtils.getGmCameraDistanceScaleEnabled()
	return ClientSwitch.EnableGmCameraDistanceScale == true
end

function GmToolUtils.setGmCameraDistanceScaleEnabled(isSelected)
	ClientSwitch.EnableGmCameraDistanceScale = isSelected == true

	GmToolUtils.refreshGmCameraDistanceScale()
end

function GmToolUtils.getGmCameraDistanceScale()
	return ClientSwitch.GmCameraDistanceScale or 1
end

function GmToolUtils.getGmCameraDistanceScaleList()
	local list = {}
	local step = GmToolUtils.GM_CAMERA_DISTANCE_SCALE_STEP
	local count = math.round((GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MAX - GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MIN) / step)

	for i = 0, count do
		local value = tonumber(string.format("%.1f", GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MIN + i * step))

		list[#list + 1] = {
			tIndex = 0,
			label = string.format("%.1f", value),
			value = value
		}
	end

	return list
end

function GmToolUtils.getGmCameraDistanceScaleSelected()
	local value = GmToolUtils.getGmCameraDistanceScale()
	local index = math.round((value - GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MIN) / GmToolUtils.GM_CAMERA_DISTANCE_SCALE_STEP)
	local count = math.round((GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MAX - GmToolUtils.GM_CAMERA_DISTANCE_SCALE_MIN) / GmToolUtils.GM_CAMERA_DISTANCE_SCALE_STEP)

	return math.clamp(index, 0, count)
end

function GmToolUtils.setGmCameraDistanceScale(optionData)
	local value = tonumber(type(optionData) == "table" and optionData.value or optionData)

	if not value or value <= 0 then
		return
	end

	ClientSwitch.GmCameraDistanceScale = value

	GmToolUtils.refreshGmCameraDistanceScale()
end

function GmToolUtils.refreshGmCameraDistanceScale()
	if pg.game.camera then
		pg.game.camera:refreshCameraDistanceScale()
	end
end

function GmToolUtils.getGmCameraMaxZoomIndexEnabled()
	return ClientSwitch.EnableGmCameraMaxZoomIndex == true
end

function GmToolUtils.setGmCameraMaxZoomIndexEnabled(isSelected)
	ClientSwitch.EnableGmCameraMaxZoomIndex = isSelected == true

	GmToolUtils.refreshGmCameraMaxZoomIndex()
end

function GmToolUtils.getGmCameraMaxZoomIndex()
	return ClientSwitch.GmCameraMaxZoomIndex or GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MAX
end

function GmToolUtils.getGmCameraMaxZoomIndexList()
	local list = {}

	for idx = GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MIN, GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MAX do
		list[#list + 1] = {
			tIndex = 0,
			label = tostring(idx),
			value = idx
		}
	end

	return list
end

function GmToolUtils.getGmCameraMaxZoomIndexSelected()
	local value = math.clamp(math.round(GmToolUtils.getGmCameraMaxZoomIndex()), GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MIN, GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MAX)

	return value - GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MIN
end

function GmToolUtils.setGmCameraMaxZoomIndex(optionData)
	local value = tonumber(type(optionData) == "table" and optionData.value or optionData)

	if not value then
		return
	end

	ClientSwitch.GmCameraMaxZoomIndex = math.clamp(math.round(value), GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MIN, GmToolUtils.GM_CAMERA_MAX_ZOOM_INDEX_MAX)

	GmToolUtils.refreshGmCameraMaxZoomIndex()
end

function GmToolUtils.refreshGmCameraMaxZoomIndex()
	if pg.game.camera then
		pg.game.camera:refreshCameraZoomLimit()
	end
end

function GmToolUtils.canShowCameraDebugInfo()
	if UNITY_EDITOR then
		return true
	end

	return _G_IsDebugMode == true
end

function GmToolUtils.showCameraDebugInfo(isSelected)
	local enable = isSelected == true

	if enable and not GmToolUtils.canShowCameraDebugInfo() then
		return
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetCameraDebugInfoEnabled(enable)
end

function GmToolUtils.getShowCameraDebugInfo()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetCameraDebugInfoEnabled()
end

function GmToolUtils.onEnableHideChestChange()
	ClientSwitch.EnableHideChest = not ClientSwitch.EnableHideChest

	local ActorManager = require("Core.Common.ActorManager")

	for actorId, ent in pairs(ActorManager.entities) do
		if Utils.isChest(ent) then
			ent:setModelVisible(ClientConst.MODEL_VISIBLE_KEY.GM, not ClientSwitch.EnableHideChest)
		end
	end
end

function GmToolUtils.onEnableHidePuppetChange()
	ClientSwitch.EnableHidePuppet = not ClientSwitch.EnableHidePuppet

	local ActorManager = require("Core.Common.ActorManager")

	for actorId, ent in pairs(ActorManager.entities) do
		if Utils.isPuppet(ent) and not Utils.isNpc(ent) then
			ent:setModelVisible(ClientConst.MODEL_VISIBLE_KEY.GM, not ClientSwitch.EnableHidePuppet)
			ent:setCollideEnable(ClientConst.MODEL_VISIBLE_KEY.GM, not ClientSwitch.EnableHidePuppet)

			if ClientSwitch.EnableHidePuppet and ent.pauseBt then
				if ClientSwitch.EnableHidePuppet then
					ent:pauseBt(AiConst.PauseBtReason.GM)
				end
			else
				ent:resumeBt(AiConst.PauseBtReason.GM)
			end
		end
	end
end

function GmToolUtils.onEnableHideECSTopLogoChange()
	ClientSwitch.EnableHideECSTopLogo = not ClientSwitch.EnableHideECSTopLogo

	pg.game.ecs:setAllEcsTopLogoVisible(not ClientSwitch.EnableHideECSTopLogo)
end

function GmToolUtils.getIsDrawAbilityMesh()
	return ClientSwitch.EnableDrawAbilityGizmo
end

function GmToolUtils.getOnlyDrawLatestAttackBox()
	return ClientSwitch.OnlyDrawLatestAttackBox
end

function GmToolUtils.getIsShowLockEntDist()
	return pg.game.setting.showLockEntDist or false
end

function GmToolUtils.getIsShowLockEntHates()
	return pg.game.setting.showLockEntHates or false
end

function GmToolUtils.getIsShowEntityWindow()
	return pg.game.setting.showEntityWindow or false
end

function GmToolUtils.getEnableHideChest()
	return ClientSwitch.EnableHideChest
end

function GmToolUtils.getEnableHidePuppet()
	return ClientSwitch.EnableHidePuppet
end

function GmToolUtils.getEnableHideECSTopLogo()
	return ClientSwitch.EnableHideECSTopLogo
end

function GmToolUtils.setArrowTip3DSpaceMode(isSelected)
	ClientSwitch.EnableArrowTip3DSpaceMode = isSelected
end

function GmToolUtils.getIsArrowTip3DSpaceMode()
	return ClientSwitch.EnableArrowTip3DSpaceMode
end

function GmToolUtils.setAimSkillSwitchMode(isSelected)
	Switch.EnableAimSkillSwitchMode = isSelected
end

function GmToolUtils.getIsAimSkillSwitchMode()
	return Switch.EnableAimSkillSwitchMode
end

function GmToolUtils.getTopLogoUseCache()
	return pg.game.setting.useTopLogoCache
end

function GmToolUtils.setTopLogoUseCache(isSelected)
	pg.game.setting:setUseTopLogoCache(isSelected)
end

function GmToolUtils.getGmMoveMode()
	if pg.me then
		return pg.me.eModel.GmMoveSpeed > 0
	end
end

function GmToolUtils.setGmMoveMode(isSelected)
	pg.me.eModel.GmMoveSpeed = isSelected and 2 or -1
end

function GmToolUtils.getSpecialAfk()
	return CS.FunPlus.WorldX.ControllerData.EnterAfkTime < 10
end

function GmToolUtils.setSpecialAfk(isSelected)
	CS.FunPlus.WorldX.ControllerData.EnterAfkTime = isSelected and 3 or 259200
end

function GmToolUtils.getStunnedCheck()
	if pg.me then
		return pg.me.eModel.openStunnedCheck
	end
end

function GmToolUtils.setStunnedCheck(isSelected)
	pg.me.eModel.openStunnedCheck = isSelected
end

function GmToolUtils.getSkillTypeHide()
	return pg.game.setting:getHideSkillType()
end

function GmToolUtils.setSkillTypeHide(isSelected)
	return pg.game.setting:setHideSkillType(isSelected)
end

function GmToolUtils.getAllHudArrowHide()
	return pg.game.setting:getHideAllHudArrowType()
end

function GmToolUtils.setAllHudArrowHide(isSelected)
	return pg.game.setting:setHideAllHudArrowType(isSelected)
end

function GmToolUtils.getCatchRogueShopShow()
	if LuaUIUtils.checkFuncTemporaryDisable(UIConst.UI_ID_SHOP_MAIN) then
		return
	end

	return pg.global.ui:checkUIShow(UIConst.UI_ID_SHOP_MAIN)
end

function GmToolUtils.setCatchRogueShopShow(isSelected)
	if isSelected then
		if LuaUIUtils.checkFuncTemporaryDisable(UIConst.UI_ID_SHOP_MAIN) then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_SHOP_MAIN, {
			shopTags = {
				36
			}
		})
	else
		pg.global.ui:close(UIConst.UI_ID_SHOP_MAIN, true)
	end
end

function GmToolUtils.getLocalizationTagEnable()
	return pg.global.localizationMgr:GetLocalizationTagEnable()
end

function GmToolUtils.setLocalizationTagEnable(enable)
	pg.global.localizationMgr:SetLocalizationTagEnable(enable)
	GmToolUtils.refreshLocalizationUI()
end

function GmToolUtils.setAllTextArkFontEnable(enable)
	pg.global.localizationMgr:SetArkFontAllEnable(enable)
	GmToolUtils.refreshLocalizationUI()
end

function GmToolUtils.getAllTextArkFontEnable()
	return pg.global.localizationMgr:GetArkFontAllEnable()
end

function GmToolUtils.getMachineTranslationHighlight()
	return pg.global.localizationMgr:GetAITranslationHighlightEnable()
end

function GmToolUtils.setMachineTranslationHighlight(enable)
	pg.global.localizationMgr:SetAITranslationHighlightEnable(enable)
	GmToolUtils.refreshLocalizationUI()
end

function GmToolUtils.refreshLocalizationUI()
	pg.global.ui:closeAllUIPanel({
		[UIConst.UI_ID_TOPLOGO] = true
	}, true, true)
	pg.global.ui.loadProgress:open()

	if pg.me then
		LuaUIUtils.onPlayerCreate()
	else
		ClientUtils.innerBackToHome()
	end

	pg.global.ui.topLogo:open()
end

function GmToolUtils.getPlatformList()
	return {
		{
			value = "mobile_narrow",
			label = GmToolUtils.getGmGameString("GM_MOBILE_NARROW_SCREEN")
		},
		{
			value = "mobile_wide",
			label = GmToolUtils.getGmGameString("GM_MOBILE_WIDE_SCREEN")
		},
		{
			label = "Standalone",
			value = "standalone"
		},
		{
			label = "Console",
			value = "console"
		}
	}
end

function GmToolUtils.getCurPlatformSelected()
	if pg.global.ui:runPlatformByConsole() then
		return 3
	elseif pg.global.ui:runPlatformByPC() then
		return 2
	elseif pg.global.ui.uiMgr:GetSafeAreaAdjustEnabled() then
		return 1
	else
		return 0
	end
end

GmToolUtils._savedResolution = nil

function GmToolUtils.restoreResolution()
	if GmToolUtils._savedResolution then
		local saved = GmToolUtils._savedResolution

		pg.global.gameMgr:SetResolution(saved.width, saved.height, saved.screenMode)

		GmToolUtils._savedResolution = nil
	end
end

function GmToolUtils.switchPlatform(selectData)
	local PlatformSwitchUtils = require("Utils.PlatformSwitchUtils")
	local EPlatform = CS.XGUI.EPlatform
	local value = selectData.value

	if not ClientUtils.canHotSwitchPlatform() then
		pg.global.ui.tips:showTextTip("The current state does not support touchscreen/controller switching. Please exit and try again.")

		return
	end

	if value ~= "standalone" and not GmToolUtils._savedResolution then
		local width, height, screenMode = pg.game.setting:getResolutionNumber()

		GmToolUtils._savedResolution = {
			width = width,
			height = height,
			screenMode = screenMode
		}
	end

	if value == "mobile_narrow" then
		CS.XGUI.UIConfig.instance:SetAdaptationPlatform(EPlatform.Mobile)
		pg.global.ui.uiMgr:SetSafeAreaAdjustEnable(false)
		pg.global.gameMgr:SetResolution(1920, 1080, "Windowed")
	elseif value == "mobile_wide" then
		CS.XGUI.UIConfig.instance:SetAdaptationPlatform(EPlatform.Mobile)
		pg.global.ui.uiMgr:SetSafeAreaAdjustEnable(true)
		pg.global.gameMgr:SetResolution(2340, 1080, "Windowed")
	elseif value == "standalone" then
		CS.XGUI.UIConfig.instance:SetAdaptationPlatform(EPlatform.Standalone)
		pg.global.ui.uiMgr:SetSafeAreaAdjustEnable(false)

		if GmToolUtils._savedResolution then
			local saved = GmToolUtils._savedResolution

			pg.global.gameMgr:SetResolution(saved.width, saved.height, saved.screenMode)

			GmToolUtils._savedResolution = nil
		end
	elseif value == "console" then
		CS.XGUI.UIConfig.instance:SetAdaptationPlatform(EPlatform.Console)
		pg.global.ui.uiMgr:SetSafeAreaAdjustEnable(false)
	end

	CS.XGUI.Utils.SyncCanvasScalerSetting(CS.XGUI.UWidget.canvasScaler)

	ClientConfigInputPlatform = ""

	pg.global.ui:onInitAdapterPlatform()
	PlatformSwitchUtils.onPlatformSwitched()
end

function GmToolUtils.getLanguageList()
	return {
		{
			label = "zh_CN",
			value = "zh_CN"
		},
		{
			label = "zh_TW",
			value = "zh_TW"
		},
		{
			label = "en",
			value = "en"
		},
		{
			label = "ko_KR",
			value = "ko_KR"
		},
		{
			label = "ja_JP",
			value = "ja_JP"
		},
		{
			label = "vi_VN",
			value = "vi_VN"
		},
		{
			label = "ru_RU",
			value = "ru_RU"
		},
		{
			label = "de_DE",
			value = "de_DE"
		},
		{
			label = "fr_FR",
			value = "fr_FR"
		},
		{
			label = "es_ES",
			value = "es_ES"
		},
		{
			label = "pt_PT",
			value = "pt_PT"
		},
		{
			label = "id_ID",
			value = "id_ID"
		},
		{
			label = "th_TH",
			value = "th_TH"
		}
	}
end

function GmToolUtils.getCurLanguageSelected()
	local curValue = pg.languageType or 0
	local descMap = ClientConst.LANGUAGE_TYPE_DESC_MAP
	local langList = GmToolUtils.getLanguageList()
	local curLang = descMap[curValue]

	for idx, item in ipairs(langList) do
		if item.value == curLang then
			return idx - 1
		end
	end

	return 0
end

function GmToolUtils.switchLanguage(selectData)
	local ClientSettingUtils = require("Utils.ClientSettingUtils")

	ClientSettingUtils.set_language(selectData.value, true)
end

function GmToolUtils.getAudioLanguageList()
	return {
		{
			label = "zh_CN",
			value = "zh_CN"
		},
		{
			label = "en",
			value = "en"
		},
		{
			label = "ja",
			value = "ja"
		},
		{
			label = "ko",
			value = "ko"
		}
	}
end

function GmToolUtils.getCurAudioLanguageSelected()
	local curAudioLanguage = pg.game.audio:getLanguage()
	local audioLangList = GmToolUtils.getAudioLanguageList()

	for idx, item in ipairs(audioLangList) do
		if item.value == curAudioLanguage then
			return idx - 1
		end
	end

	return 0
end

function GmToolUtils.switchAudioLanguage(selectData)
	local ClientSettingUtils = require("Utils.ClientSettingUtils")

	ClientSettingUtils.set_audioLanguage(selectData.value)
end

function GmToolUtils.getEnableLoseFocusAudio()
	local ClientSettingUtils = require("Utils.ClientSettingUtils")

	return ClientSettingUtils.get_autoMute()
end

function GmToolUtils.setEnableLoseFocusAudio(enable)
	local ClientSettingUtils = require("Utils.ClientSettingUtils")

	ClientSettingUtils.set_autoMute(enable)
end

function GmToolUtils.setFrame(selectData)
	CS.UnityEngine.QualitySettings.vSyncCount = 0
	CS.UnityEngine.Application.targetFrameRate = selectData.value

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("vSyncCount=%d, targetFrameRate=%d", CS.UnityEngine.QualitySettings.vSyncCount, CS.UnityEngine.Application.targetFrameRate)
	end
end

function GmToolUtils.setPhysicsFrame(selectData)
	pg.global.gameMgr:SetFixedDeltaTime(selectData.value)

	local fixedDeltaTime = CS.UnityEngine.Time.fixedDeltaTime

	pg.global.ui.tips:showTextTip(string.format("物理帧率已设为 %.2f Hz（步长 %.3f 秒），进入场景后重置", 1 / fixedDeltaTime, fixedDeltaTime))
end

function GmToolUtils.chooseScene(selectData)
	if pg.me ~= nil then
		local curSceneId = pg.me.space.sceneId

		if selectData.value ~= curSceneId and SceneData[selectData.value] then
			pg.me:doGmCmd("teleportToScene", selectData.value, 0)
			GmToolUtils.addRecentlyData("sceneRecently", selectData.value)
		else
			pg.global.ui.tips:showTextTip("场景不存在或已在此场景")
		end
	end
end

function GmToolUtils.chooseSandbox(selectData)
	if pg.me ~= nil then
		local curSceneId = pg.me.space.sceneId

		if selectData.value ~= curSceneId then
			pg.me:doGmCmd("teleportToSandbox", selectData.value)
		end
	end
end

function GmToolUtils.createEnvObj(selectData)
	if pg.me ~= nil then
		pg.me:doGmCmd("createEnvobj", selectData.value)
		pg.global.ui.tips:showTextTip("创建成功")
		GmToolUtils.addRecentlyData("envObjRecently", selectData.value)
	end
end

function GmToolUtils.createPuppet(selectData, params)
	if pg.me ~= nil then
		local level = tonumber(params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 1
		local range = tonumber(params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 5
		local scale = tonumber(params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 1
		local isStopAi = tonumber(params[3]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0
		local label = tonumber(params[4]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0
		local isRareFeature = tonumber(params[5]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0
		local shinyStyle = tonumber(params[6]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0

		pg.me:doGmCmd("createPuppet", selectData.value, level, range, scale, isStopAi, label, 0, isRareFeature, nil, shinyStyle)
		pg.global.ui.tips:showTextTip("创建成功")
		GmToolUtils.addRecentlyData("puppetRecentlyAddList", selectData.value)
	end
end

function GmToolUtils.enableArkScreen()
	CS.FunPlus.WorldX.GameApp.Sandbox.SandboxUtils.SetScreenEnable(true)
end

function GmToolUtils.disableArkScreen()
	CS.FunPlus.WorldX.GameApp.Sandbox.SandboxUtils.SetScreenEnable(false)
end

function GmToolUtils.resetAndGetAllPet()
	pg.me:doGmCmd("resetAllPets", 0)
end

function GmToolUtils.resetAndGetAllReleasePet()
	pg.me:doGmCmd("resetAllPets", 1)
end

function GmToolUtils.resetAndGetAllSuperPet()
	pg.me:doGmCmd("superPlayer", 1)
end

function GmToolUtils.resetAndGetAllFormPet()
	pg.me:doGmCmd("resetAllPets", 4)
end

function GmToolUtils.resetAndGetAllReleaseBasePet()
	pg.me:doGmCmd("resetAllPets", 5)
end

function GmToolUtils.resetAllPetAndBook()
	pg.me:doGmCmd("resetAllPets", 3)
	pg.me:doGmCmd("resetPetHandbookMap")
end

function GmToolUtils.removePetsByTemplateId(params)
	if pg.me == nil then
		return
	end

	local templateId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	templateId = tonumber(templateId)

	if not templateId then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("templateId无效")
		end

		return
	end

	pg.me:doGmCmd("removePetsByTemplateId", templateId)
end

local petRainbowEnts = {}
local petShinyStyleEnts = {}

local function clearPetPreviewEnts(entList)
	for _, ent in ipairs(entList) do
		if ent and ent.destroy then
			ClientUtils.safeDestroy(ent)
		end
	end

	table.clear(entList)
end

function GmToolUtils.clearPetTransmogRainbow()
	clearPetPreviewEnts(petRainbowEnts)
end

function GmToolUtils.clearPetShinyStyles()
	clearPetPreviewEnts(petShinyStyleEnts)
end

local function clearAllPetPreviewEnts()
	GmToolUtils.clearPetTransmogRainbow()
	GmToolUtils.clearPetShinyStyles()
end

function GmToolUtils.getParmonDyeDataId(prefabResId)
	if not prefabResId then
		return
	end

	return string.match(prefabResId, "%$([%w_]+)%.prefab")
end

function GmToolUtils.loadParmonDyeConfig(dataId, shinyStyle)
	if not dataId or shinyStyle == nil then
		return nil, false
	end

	local dyeData = DyeConfigData[string.format("%s.prefab", dataId)]
	local dyeConfig = dyeData and dyeData[shinyStyle]

	return dyeConfig, Utils.isTable(dyeConfig)
end

local function getPlayerSpreadBasis()
	local px, py, pz = pg.me.eModel:GetPositionAgentPosEx()
	local fx, fy, fz = pg.me.eModel:GetPositionAgentAxisEx(2)
	local rx, ry, rz = pg.me.eModel:GetPositionAgentAxisEx(0)

	return px, py, pz, fx, fy, fz, rx, ry, rz
end

function GmToolUtils.spreadPetTransmogRainbow(params)
	if pg.me == nil or not pg.me.eModel then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("主角未就绪")
		end

		return
	end

	local templateId = tonumber(params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text)
	local colSpacing = tonumber(params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 2.5
	local rowSpacing = tonumber(params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 3
	local scale = tonumber(params[3]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 1

	clearAllPetPreviewEnts()

	if not templateId then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("templateId无效")
		end

		return
	end

	local PetTransmogUtils = require("GameApp.PetTransmog.PetTransmogUtils")
	local ClientSimpleVirtualPet = require("Entities.ClientSimpleVirtualPet")
	local PetTransmogSuitsData = require("Data.pet_transmog_suits_data")
	local PetTransmogSoltData = require("Data.pet_transmog_solt_data")
	local suits = PetTransmogSuitsData[templateId]

	if not suits then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("该templateId没有幻化套装配置")
		end

		return
	end

	local Color = Const.PetTransmogSlotType.Color
	local Wing = Const.PetTransmogSlotType.Wing
	local Body = Const.PetTransmogSlotType.Body
	local Hair = Const.PetTransmogSlotType.Hair
	local Flash = Const.PetTransmogSlotType.Flash
	local colorSlotIds = {}

	for slotId, slot in pairs(PetTransmogSoltData) do
		if slot.type == Color and tostring(slot.petId) == tostring(templateId) then
			colorSlotIds[#colorSlotIds + 1] = slotId
		end
	end

	table.sort(colorSlotIds)

	if #colorSlotIds == 0 then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("该templateId没有颜色槽配置")
		end

		return
	end

	local flashSlotId

	for slotId, slot in pairs(PetTransmogSoltData) do
		if slot.type == Flash and slot.effectSwitch == 1 and tostring(slot.petId) == tostring(templateId) then
			flashSlotId = slotId

			break
		end
	end

	local suitIds = {}

	for suitId, _ in pairs(suits) do
		suitIds[#suitIds + 1] = suitId
	end

	table.sort(suitIds)

	local px, py, pz, fx, fy, fz, rx, ry, rz = getPlayerSpreadBasis()
	local startDist = rowSpacing
	local cols = #colorSlotIds
	local halfCols = (cols - 1) / 2

	local function buildOne(holeIds, row, col)
		local transmogData, shinyEffectId = PetTransmogUtils.getSchemeTransmogData(templateId, {
			holeIds = holeIds
		})
		local ent = ClientSimpleVirtualPet.new()
		local initInfo = {
			templateId = templateId
		}

		ent:init(initInfo)
		ent:postInit(initInfo)
		ent:start()
		ent:setModelLayer(ClientConst.LayerDefine.LAYER_ENTITY)

		if scale and scale ~= 1 and ent.setScaleNumber then
			ent:setScaleNumber(scale)
		end

		if transmogData then
			ent:setTransmogData(transmogData, shinyEffectId)
		end

		local dist = startDist + row * rowSpacing
		local side = (col - halfCols) * colSpacing
		local posX = px + fx * dist + rx * side
		local posY = py + fy * dist + ry * side
		local posZ = pz + fz * dist + rz * side

		if ent.eModel then
			ent.eModel:SetTransformPosition(posX, posY, posZ)

			local targetRot = Quaternion.LookRotation(Vector3.New(-fx, -fy, -fz), Vector3.up)

			ent.eModel:SetTransformRotation(targetRot.x, targetRot.y, targetRot.z, targetRot.w)
		end

		function ent.modelLoadedCallback()
			if not ent.eModel then
				return
			end

			if ent.playRawAnimation then
				ent:playRawAnimation("Idle")
			end

			ent:setLodTickEnable(Const.LOD_TICK_KEY.BOSS_COMBAT, false)
		end

		petRainbowEnts[#petRainbowEnts + 1] = ent
	end

	local function slotRes(slotId)
		local s = slotId and PetTransmogSoltData[slotId]

		return s and s.resources or ""
	end

	local row = 0

	for _, suitId in ipairs(suitIds) do
		local parts = suits[suitId]
		local wingId, bodyId, hatId = parts[2], parts[3], parts[4]

		for _, light in ipairs({
			false,
			true
		}) do
			if not light or not not flashSlotId then
				local seen = {}
				local rowTasks = {}
				local rowColorSlots = {}

				for col, colorSlotId in ipairs(colorSlotIds) do
					local signature = table.concat({
						slotRes(colorSlotId),
						slotRes(wingId),
						slotRes(bodyId),
						slotRes(hatId),
						light and "1" or "0"
					}, "|")

					if not seen[signature] then
						seen[signature] = true

						local holeIds = {
							[Color] = colorSlotId,
							[Wing] = wingId,
							[Body] = bodyId,
							[Hair] = hatId
						}

						if light then
							holeIds[Flash] = flashSlotId
						end

						rowTasks[#rowTasks + 1] = {
							holeIds = holeIds,
							col = #rowTasks
						}
						rowColorSlots[#rowColorSlots + 1] = colorSlotId
					end
				end

				if #rowTasks > 0 then
					if LoggerManager.checkLogger(LoggerConst.INFO) then
						local colorDescs = {}

						for _, csId in ipairs(rowColorSlots) do
							colorDescs[#colorDescs + 1] = string.format("%s(%s)", tostring(csId), slotRes(csId))
						end

						logger:info("[spreadPetTransmogRainbow] row=%d suitId=%d light=%s wing=%s body=%s hat=%s flash=%s colors[%d]={%s}", row, suitId, tostring(light), slotRes(wingId), slotRes(bodyId), slotRes(hatId), light and tostring(flashSlotId) or "-", #rowColorSlots, table.concat(colorDescs, ", "))
					end

					for _, task in ipairs(rowTasks) do
						local ok, err = xpcall(buildOne, debug.traceback, task.holeIds, row, task.col)

						if not ok and LoggerManager.checkLogger(LoggerConst.ERROR) then
							logger:error("[spreadPetTransmogRainbow] build failed: %s", tostring(err))
						end
					end

					row = row + 1
				end
			end
		end
	end

	pg.global.ui:close(62)

	if pg.global.ui.tips then
		pg.global.ui.tips:showTextTip(string.format("铺开完成，共%d只", #petRainbowEnts))
	end
end

function GmToolUtils.spreadPetShinyStyles(params)
	if pg.me == nil or not pg.me.eModel then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("主角未就绪")
		end

		return
	end

	local templateId = tonumber(params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text)
	local colSpacing = tonumber(params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 2.5
	local rowSpacing = tonumber(params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 3
	local scale = tonumber(params[3]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 1
	local maxCols = math.max(1, tonumber(params[4]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 4)

	clearAllPetPreviewEnts()

	if not templateId then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("petId无效")
		end

		return
	end

	local petCfg = PetData[templateId]

	if not petCfg then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("petId无效")
		end

		return
	end

	local ClientVirtualEntityUtils = require("Utils.ClientVirtualEntityUtils")
	local configKeys = {}

	for shinyStyle = 1, 12 do
		local _, isLoaded = GmToolUtils.loadParmonDyeConfig(petCfg.shinyStyleColorId, shinyStyle)

		if isLoaded then
			configKeys[#configKeys + 1] = shinyStyle
		end
	end

	table.sort(configKeys)

	local bodyDyeDataId = GmToolUtils.getParmonDyeDataId(petCfg.prefabResID)

	for _, configKey in ipairs({
		"shiny",
		"dark2"
	}) do
		local _, isLoaded = GmToolUtils.loadParmonDyeConfig(bodyDyeDataId, configKey)

		if isLoaded then
			configKeys[#configKeys + 1] = configKey
		end
	end

	local px, py, pz, fx, fy, fz, rx, ry, rz = getPlayerSpreadBasis()
	local cols = math.min(maxCols, #configKeys)
	local halfCols = (cols - 1) / 2
	local startDist = rowSpacing

	for index, configKey in ipairs(configKeys) do
		local isShiny = configKey == "shiny"
		local isDark = configKey == "dark2"
		local label = isDark and Const.PET_LABEL_MASK.MAGIC + Const.PET_LABEL_MASK.SHINY or isShiny and Const.PET_LABEL_MASK.NORMAL or Const.PET_LABEL_MASK.SHINY
		local shinyStyle = isDark and 1 or configKey
		local row = math.floor((index - 1) / cols)
		local col = (index - 1) % cols
		local petInfo = {
			templateId = templateId,
			petPrototypeId = petCfg.petPrototypeId,
			label = label,
			shinyStyle = shinyStyle
		}
		local ent = ClientVirtualEntityUtils.createPetVirtualEntityWithDic(templateId, nil, label, shinyStyle, nil, nil, petInfo)

		if ent then
			ent:setModelLayer(ClientConst.LayerDefine.LAYER_ENTITY)

			if scale ~= 1 and ent.setScaleNumber then
				ent:setScaleNumber(scale)
			end

			local dist = startDist + row * rowSpacing
			local side = (col - halfCols) * colSpacing
			local posX = px + fx * dist + rx * side
			local posY = py + fy * dist + ry * side
			local posZ = pz + fz * dist + rz * side

			if ent.eModel then
				ent.eModel:SetTransformPosition(posX, posY, posZ)

				local targetRot = Quaternion.LookRotation(Vector3.New(-fx, -fy, -fz), Vector3.up)

				ent.eModel:SetTransformRotation(targetRot.x, targetRot.y, targetRot.z, targetRot.w)
				ent.eModel:SetGameObjectName(ent.eModel.GameObjectName .. "_shiny_" .. tostring(configKey))
			end

			function ent.modelLoadedCallback()
				if not ent.eModel then
					return
				end

				if ent.playRawAnimation then
					ent:playRawAnimation("Idle")
				end

				ent:setLodTickEnable(Const.LOD_TICK_KEY.BOSS_COMBAT, false)
			end

			petShinyStyleEnts[#petShinyStyleEnts + 1] = ent
		end
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[spreadPetShinyStyles] templateId=%s styles={%s}", tostring(templateId), table.concat(configKeys, ","))
	end

	pg.global.ui:close(62)

	if pg.global.ui.tips then
		pg.global.ui.tips:showTextTip(string.format("铺开完成，共%d只", #petShinyStyleEnts))
	end
end

function GmToolUtils.addPet(selectData, params)
	if pg.me ~= nil then
		local level = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local label = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local allSkill = params[2]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local isRareFeature = params[3]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local skipReport = params[4]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local shinyStyle = params[5]:GetChild("InputField"):GetComponent("UTMPInputField").text
		local count = params[6] and params[6]:GetChild("InputField"):GetComponent("UTMPInputField").text or "1"

		pg.me:doGmCmd("addPet", selectData.value, tonumber(level), tonumber(label), tonumber(allSkill), tonumber(isRareFeature), tonumber(skipReport), tonumber(shinyStyle), tonumber(count) or 1)
		GmToolUtils.addRecentlyData("petRecentlyAddList", selectData.value)
	end
end

function GmToolUtils.addItem(selectData, params)
	if pg.me ~= nil then
		local count = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

		pg.me:doGmCmd("addItem", selectData.value, tonumber(count))
		GmToolUtils.addRecentlyData("itemRecentlyAddList", selectData.value)
	end
end

function GmToolUtils.clearItemById(selectData, params)
	if pg.me == nil then
		return
	end

	local itemId = selectData.value
	local count = ItemUtils.getItemCountById(pg.me, itemId, true) or 0

	if count <= 0 then
		if pg.global and pg.global.ui and pg.global.ui.tips then
			pg.global.ui.tips:showTextTip("背包中没有该道具")
		end

		return
	end

	pg.me:doGmCmd("delItem", itemId, count)
	GmToolUtils.addRecentlyData("itemRecentlyAddList", itemId)
end

function GmToolUtils.changeLanguage(buttons)
	if GmToolUtils.curSelectedText then
		local text = buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text

		if text ~= "" then
			ClientTextUtils.setText(GmToolUtils.curSelectedText, text)
		end
	end
end

function GmToolUtils.setBugReportType(selectData)
	GmToolUtils.bugReportType = selectData.value
end

function GmToolUtils.getBugReportTypeList()
	local reportTypeList = {
		{
			label = "Bug",
			value = "bug"
		},
		{
			label = "建议",
			value = "suggestion"
		}
	}

	return reportTypeList
end

function GmToolUtils.getCurBugReportType()
	if GmToolUtils.bugReportType == "bug" then
		return 0
	else
		return 1
	end
end

function GmToolUtils.bugReport(buttons)
	local userName = buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local bugContent = buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local branch = ClientUtils.getServerListGroup()
	local editor = UNITY_EDITOR and "Editor" or "Exe"
	local version = ClientScmVersion == "1" and "" or ClientScmVersion
	local attachments = {}
	local logUrl = ""
	local category = GmToolUtils.bugReportType
	local hasLogUpload = false
	local hasGetName = true

	local function tryReportBugToServer()
		if #attachments == #GmToolUtils.bugReportImageList and hasLogUpload and hasGetName then
			if logUrl ~= "" then
				table.insert(attachments, logUrl)
			end

			bugContent = bugContent == "" and "无" or bugContent

			pg.me:doGmCmd("bugReport", userName, branch, bugContent, table.concat(attachments, ","), editor, version, category)

			for _, sprite in ipairs(GmToolUtils.bugReportImageList) do
				pg.global.mobileCameraMgr:DestroySpriteTexture(sprite)
			end

			GmToolUtils.bugReportImageList = {}
			hasLogUpload = false

			pg.global.prefsCacheUtils:setString("BugReportContent", "")
			pg.global.ui.tips:showTextTip("上报成功")
			pg.global.ui.config:refreshFuncList()
		end
	end

	if userName == "" then
		hasGetName = false

		CS.FunPlus.WorldX.Utils.GmToolUtils.BugReportGetPlayerInfo(function(res)
			if res ~= "" then
				local resp = json.decode(res)

				userName = resp.data.list[1].user_name
			end

			hasGetName = true

			tryReportBugToServer()
		end)
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.BugReportUploadLog(function(res)
		if res ~= "" then
			local resp = json.decode(res)

			logUrl = resp.data[1].file_show_url
		end

		hasLogUpload = true

		tryReportBugToServer()
	end)

	if #GmToolUtils.bugReportImageList > 0 then
		for _, sprite in ipairs(GmToolUtils.bugReportImageList) do
			CS.FunPlus.WorldX.Utils.GmToolUtils.BugReportUploadFile(sprite.texture, function(res)
				if res ~= "" then
					local resp = json.decode(res)

					table.insert(attachments, resp.data[1].file_show_url)
					tryReportBugToServer()
				end
			end)
		end
	elseif bugContent ~= "" then
		tryReportBugToServer()
	end
end

function GmToolUtils.savePhotoPreset(buttons)
	if not pg.global.ui:checkUIOpen(UIConst.UI_ID_PHOTO) then
		pg.global.ui.tips:showTextTip("请在拍照模式下使用此指令")

		return
	end

	local key = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	pg.global.ui.photo:savePhotoPreset(key)
end

function GmToolUtils.setResPointLogActorId(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	ResPointConst.DebugLogEntActorId = actorId
end

function GmToolUtils.setResPointDrawActorId(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	ResPointConst.DebugDrawEntActorId = actorId
end

function GmToolUtils.openAIGlobalTick(isSelected)
	AiConst.GLOBAL_OPEN_TICK = isSelected
end

function GmToolUtils.checkAIGlobalTick()
	return AiConst.GLOBAL_OPEN_TICK
end

function GmToolUtils.openResPointLog(isSelected)
	ResPointConst.OpenLog = isSelected
end

function GmToolUtils.checkResPointLogState()
	return ResPointConst.OpenLog
end

function GmToolUtils.openResPointDraw(isSelected)
	ResPointConst.OpenDebugDraw = isSelected
end

function GmToolUtils.checkResPointDrawState()
	return ResPointConst.OpenDebugDraw
end

function GmToolUtils.openGroupBehaviourLog(isSelected)
	GroupBehaviourConst.OpenLog = isSelected
end

function GmToolUtils.checkGroupBehaviourLogState()
	return GroupBehaviourConst.OpenLog
end

function GmToolUtils.openConditionTriggerLog(isSelected)
	AiConst.AI_DEBUG.EVENT_LOG = isSelected
end

function GmToolUtils.checkConditionTriggerLogState()
	return AiConst.AI_DEBUG.EVENT_LOG
end

function GmToolUtils.showUnitPhysicsTuningWindow(isSelected)
	CS.FunPlus.WorldX.Utils.GmToolUtils.SetUnitPhysicsTuningWindowEnable(isSelected)
end

function GmToolUtils.getIsShowUnitPhysicsTuningWindow()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.IsUnitPhysicsTuningWindowEnabled()
end

function GmToolUtils.printCurrentAllStaticResPoint()
	local rpEnts = pg.space.aiMgr.resPointModule.staticRpEnts

	for staticId, entity in pairs(rpEnts) do
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("[StaticResPoint] staticId: %s, actorId: %d, position: %s", staticId, entity.actorId, inspect(entity:getPosition()))
		end
	end
end

function GmToolUtils.setDebugPerceptibility(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	AiConst.AI_DEBUG.PERCEPTIBILITY = true
	AiConst.AI_DEBUG.PERCEPTIBILITY_ID = actorId
	AiConst.AI_DEBUG.PERCEPTIBILITY_NO_IMP = false
end

function GmToolUtils.setNoImpDebugPerceptibility(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	AiConst.AI_DEBUG.PERCEPTIBILITY = true
	AiConst.AI_DEBUG.PERCEPTIBILITY_ID = actorId
	AiConst.AI_DEBUG.PERCEPTIBILITY_NO_IMP = true
end

function GmToolUtils.setDebugPerceptibilityOff()
	AiConst.AI_DEBUG.PERCEPTIBILITY = false
end

function GmToolUtils.setDebugCalcQualifiedPos(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	local targetEnt = pg.getEntityByActorId(actorId)

	if targetEnt and targetEnt.agent and targetEnt.agent.envQueryAbility then
		local envQueryAbility = targetEnt.agent.envQueryAbility

		envQueryAbility.debugMode = true
	end
end

function GmToolUtils.setDebugCalcQualifiedPosOff(params)
	local actorId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	actorId = tonumber(actorId)

	if not actorId then
		return
	end

	local targetEnt = pg.getEntityByActorId(actorId)

	if targetEnt and targetEnt.agent and targetEnt.agent.envQueryAbility then
		local envQueryAbility = targetEnt.agent.envQueryAbility

		envQueryAbility.debugMode = false
	end
end

function GmToolUtils.clearGmList()
	GmToolUtils.serverGmLists = nil
	GmToolUtils.serverCmd2Params = nil
	GmToolUtils.hasInitGmList = false
end

function GmToolUtils.getGmList()
	if pg.me then
		pg.me:getGmCmdList(CallbackHandler(GmToolUtils, "recvGmList"))
	else
		GmToolUtils.hasInitGmList = true
	end
end

function GmToolUtils.recvGmList(res)
	GmToolUtils.serverGmLists = res
	GmToolUtils.serverCmd2Params = {}

	for key, gmList in pairs(GmToolUtils.serverGmLists) do
		for i = 1, #gmList do
			GmToolUtils.serverCmd2Params[gmList[i].cmdName] = gmList[i].params
		end
	end

	local serverFuncMaps = {}
	local tempFuncMaps = {}

	for key, gmList in pairs(GmToolUtils.serverGmLists) do
		local keySplit = string.split(key, "/")
		local label = getGmAnnotationGameStringKey(keySplit[#keySplit])
		local funcMap
		local needAdd = false

		if tempFuncMaps[label] then
			funcMap = tempFuncMaps[label]
		else
			needAdd = true
			funcMap = {
				label = label
			}
			funcMap.type = 2
			funcMap.isServerGm = true
			funcMap.funcList = {}
			tempFuncMaps[label] = funcMap
		end

		for i = 1, #gmList do
			local curGmCmd = gmList[i]
			local item = {}

			item.label = getGmAnnotationGameStringKey(curGmCmd.help)
			item.func = "execGmCmd"
			item.cmdName = curGmCmd.cmdName

			local paramCount = #curGmCmd.params

			if paramCount == 1 then
				item.style = 2
				item.subStyle = 0
				item.tips = getGmAnnotationGameStringKey(curGmCmd.params[1][1])
				item.paramType = curGmCmd.params[1][3]
				item.defaultValue = curGmCmd.params[1][4]
				item.saveKey = "gmTool" .. item.cmdName

				if item.paramType == "boolean" then
					item.style = 1
					item.subStyle = 1
					item.func = "execGmCmd2"
					item.dataFunc = "getBoolChoice"
				end
			elseif paramCount > 0 then
				item.style = 3
				item.subStyle = 0
				item.subItems = {}

				for j = 1, #curGmCmd.params do
					item.subItems[j] = {
						style = 0,
						label = curGmCmd.params[j][2],
						tips = getGmAnnotationGameStringKey(curGmCmd.params[j][1]),
						paramType = curGmCmd.params[j][3],
						defaultValue = curGmCmd.params[j][4],
						saveKey = "gmTool" .. item.cmdName .. curGmCmd.params[j][2]
					}
				end
			else
				item.style = 1
				item.subStyle = 2
			end

			funcMap.funcList[#funcMap.funcList + 1] = item
		end

		if needAdd then
			serverFuncMaps[#serverFuncMaps + 1] = funcMap
		end
	end

	table.sort(serverFuncMaps, function(a, b)
		return a.label < b.label
	end)

	for i = 1, #serverFuncMaps do
		GmToolUtils.gmFuncMap[#GmToolUtils.gmFuncMap + 1] = serverFuncMaps[i]
	end

	GmToolUtils.handleRecently()
	GmToolUtils.handleFavorite()
	GmToolUtils.handleRenderSetting()

	GmToolUtils.hasInitGmList = true

	pg.global.ui.config:refreshGmList()
end

function GmToolUtils.addRecentlyUse(data)
	if data.tIndex == GmToolUtils.FuncStyle.ImageList then
		return
	end

	if data.originInfo == nil then
		return
	end

	if data.func == "deleteAllPrefs" then
		return
	end

	local dataIndex = -1

	for index, info in ipairs(GmToolUtils.gmFuncMap[1].funcList) do
		if info.label == data.originInfo.label and info.style == data.originInfo.style then
			dataIndex = index

			break
		end
	end

	if dataIndex ~= -1 then
		table.remove(GmToolUtils.gmFuncMap[1].funcList, dataIndex)
	end

	table.insert(GmToolUtils.gmFuncMap[1].funcList, GmToolUtils.gmFuncMap[1].initFuncListCount + 1, data.originInfo)

	while #GmToolUtils.gmFuncMap[1].funcList > 10 do
		table.remove(GmToolUtils.gmFuncMap[1].funcList)
	end

	local recentlyUseStrs = {}

	for i = GmToolUtils.gmFuncMap[1].initFuncListCount + 1, #GmToolUtils.gmFuncMap[1].funcList do
		local info = GmToolUtils.gmFuncMap[1].funcList[i]
		local key = info.cmdName or GmToolUtils.getGmLocalizationText(info.label)

		recentlyUseStrs[#recentlyUseStrs + 1] = key
	end

	local gmRecentlyUseStr = table.concat(recentlyUseStrs, "|")

	pg.global.prefsCacheUtils:setString("gmRecentlyUse", gmRecentlyUseStr)
end

function GmToolUtils.handleRecently()
	local recentlyFuncList = GmToolUtils.gmFuncMap[1].funcList
	local gmRecentlyUseStr = pg.global.prefsCacheUtils:getString("gmRecentlyUse", "")
	local gmRecentlyUseNames = string.split(gmRecentlyUseStr, "|")
	local hasFind = false

	for _, recentlyUseName in ipairs(gmRecentlyUseNames) do
		hasFind = false

		for idx, infoSet in pairs(GmToolUtils.gmFuncMap) do
			for idx2, info in pairs(infoSet.funcList) do
				local key = info.cmdName or GmToolUtils.getGmLocalizationText(info.label)

				if key == recentlyUseName and info.style ~= GmToolUtils.FuncStyle.ImageList then
					recentlyFuncList[#recentlyFuncList + 1] = info
					hasFind = true

					break
				end
			end

			if hasFind then
				break
			end
		end
	end
end

function GmToolUtils.handleFavorite()
	local favoriteFuncList = GmToolUtils.gmFuncMap[2].funcList
	local gmFavoriteStr = pg.global.prefsCacheUtils:getString("gmFavorite", "")
	local gmFavoriteNames = string.split(gmFavoriteStr, "|")
	local hasFind = false

	for _, favoriteName in ipairs(gmFavoriteNames) do
		hasFind = false

		for idx, infoSet in pairs(GmToolUtils.gmFuncMap) do
			for idx2, info in pairs(infoSet.funcList) do
				local key = info.cmdName or GmToolUtils.getGmLocalizationText(info.label)

				if key == favoriteName then
					favoriteFuncList[#favoriteFuncList + 1] = info
					hasFind = true

					break
				end
			end

			if hasFind then
				break
			end
		end
	end
end

function GmToolUtils.execGmCmd(cmdName, paramsInput)
	local paramsInfo = GmToolUtils.serverCmd2Params[cmdName]
	local reqParams = {}

	for i = 1, #paramsInfo do
		local paramtext = paramsInput[i - 1]:GetChild("InputField"):GetComponent("UTMPInputField").text

		if paramtext == "" then
			paramtext = paramsInfo[i][4]
		end

		if paramsInfo[i][3] == "string" then
			reqParams[#reqParams + 1] = tostring(paramtext)
		elseif paramsInfo[i][3] == "number" then
			reqParams[#reqParams + 1] = tonumber(paramtext)
		elseif paramsInfo[i][3] == "boolean" then
			if paramtext == "true" then
				reqParams[#reqParams + 1] = true
			else
				reqParams[#reqParams + 1] = false
			end
		end
	end

	pg.me:doGmCmd(cmdName, unpack(reqParams))
end

function GmToolUtils.execGmCmd2(cmdName, optionData)
	local paramsInfo = GmToolUtils.serverCmd2Params[cmdName]
	local reqParams = {}

	for i = 1, #paramsInfo do
		local paramtext = optionData.value

		if paramtext == "" then
			paramtext = paramsInfo[i][4]
		end

		if paramsInfo[i][3] == "string" then
			reqParams[#reqParams + 1] = tostring(paramtext)
		elseif paramsInfo[i][3] == "number" then
			reqParams[#reqParams + 1] = tonumber(paramtext)
		elseif paramsInfo[i][3] == "boolean" then
			if paramtext == "true" then
				reqParams[#reqParams + 1] = true
			else
				reqParams[#reqParams + 1] = false
			end
		end
	end

	pg.me:doGmCmd(cmdName, unpack(reqParams))
	pg.global.ui.tips:showTextTip("执行成功: " .. cmdName)
end

function GmToolUtils.getBoolChoice()
	return {
		{
			label = "true",
			value = "true"
		},
		{
			label = "false",
			value = "false"
		}
	}
end

function GmToolUtils.recvGmCmdExecRes(result, info)
	if type(info) == "table" and type(info.homePlanFurnitureConfigFileText) == "string" then
		local exportFilePath = GmToolUtils.getHomePlanFurnitureConfigFilePath(info.homePlanFurnitureConfigCode)

		if not exportFilePath then
			pg.global.ui.tips:showTextTip("方案家具配置文件导出失败：无法获取游戏日志目录")

			return
		end

		local success, filePathOrError = GmToolUtils.saveHomelandDecorationDataFile(info.homePlanFurnitureConfigFileText, exportFilePath)

		if not success then
			pg.global.ui.tips:showTextTip("方案家具配置文件导出失败：" .. filePathOrError)

			return
		end

		pg.global.ui.tips:showTextTip((info.tipText or "方案家具配置文件导出完成") .. "\n文件路径：" .. filePathOrError)

		return
	end

	if type(info) == "table" and type(info.clipboardText) == "string" then
		CS.FunPlus.WorldX.Utils.UIUtils.ClipboardWriter(info.clipboardText)
		pg.global.ui.tips:showTextTip(result .. " 报告已复制到剪贴板")

		return
	end

	if info then
		info = json.encode(info)

		if UNITY_EDITOR then
			pg.me.logger:info(result)
			pg.global.ui.tips:showTextTip(result .. " 结果已输出到控制台")
		else
			CS.UnityEngine.GUIUtility.systemCopyBuffer = info

			pg.global.ui.tips:showTextTip(result .. " 结果已复制到剪贴板")
		end
	end
end

function GmToolUtils.getKeyboardLockModeSelected()
	local gameMode = pg.global.prefsCacheUtils:getInt(ClientConst.PrefKey.KeyboardLockMode, ClientConst.LockMode.ModeA)

	if gameMode == ClientConst.LockMode.ModeA then
		return 0
	else
		return 1
	end
end

function GmToolUtils.getGamepadLockModeSelected()
	return 0
end

function GmToolUtils.getGamepadInputModeChange()
	return pg.game.input.gamepadInputMode
end

function GmToolUtils.getGamepadInputModeList()
	return {
		{
			label = "Plan1(Default)",
			tIndex = 0,
			value = HotkeyConst.GAMEPAD_INPUT_CONTROL_MODE.CombineMode
		},
		{
			tIndex = 0,
			label = GmToolUtils.getGmGameString("GM_GAMEPAD_MODIFY_MODE"),
			value = HotkeyConst.GAMEPAD_INPUT_CONTROL_MODE.ModifyMode
		}
	}
end

function GmToolUtils.onGamepadInputModeChange(selectData)
	pg.game.input:setGamepadInputMode(selectData.value)
end

function GmToolUtils.showTopLogoEmojiBubble(buttons)
	local actorId = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local emojiName = buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local duration = buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local entity = pg.getEntityByActorId(tonumber(actorId))

	if entity then
		entity.eventEmitter:emit(EventConst.TOPLOGO_BUBBLE, true, emojiName, duration)
	end
end

local function collectEntityVisibleInfo(entity)
	local function safe(fn, default)
		local ok, ret = pcall(fn)

		if ok then
			return ret
		end

		return default
	end

	local lines = {}

	local function add(fmt, ...)
		lines[#lines + 1] = string.format(fmt, ...)
	end

	add("==================== Entity Visible Info ====================")
	add("entityId=%s actorId=%s className=%s isPawn=%s", tostring(entity.id), tostring(entity.actorId), tostring(safe(function()
		return entity:getClassType()
	end, "?")), tostring(entity == pg.pawn))

	local eModel = entity.eModel

	add("eModel=%s", tostring(NotNil(eModel)))

	if not eModel then
		add("eModel 为空,后续 C# 信息无法读取(实体可能未创建模型)")
		add("============================================================")

		return table.concat(lines, "\n")
	end

	add("---- Ⅰ. activeKeys(有值=整个entity被disable) ----")
	add("  modelActiveKeys=[%s]", safe(function()
		return entity:dumpActiveKeys()
	end, "read fail"))
	add("---- Ⅱ. visibleKeys(有值=所有meshRender被disable) ----")
	add("  modelVisibleKeys=[%s]", safe(function()
		return entity:dumpVisibleKeys()
	end, "read fail"))
	add("  modelCollideKeys=[%s]  modelTriggerKeys=[%s]", safe(function()
		return entity:dumpCollideKeys()
	end, "-"), safe(function()
		return entity:dumpTriggerKeys()
	end, "-"))
	add("---- Ⅲ. 动画初始化(isClientReady为false→隐藏) ----")

	local playable = entity.getEModelComponent and entity:getEModelComponent(Const.COMPONENT_IDX_PLAYABLE)

	if NotNil(playable) then
		local initialized = safe(function()
			return playable.initialized
		end, nil)
		local clientReady = safe(function()
			return eModel.isClientReady
		end, nil)
		local isAnimatorRead = safe(function()
			return eModel.modelView:IsAnimatorRead()
		end, nil)

		add("  isClientReady=%s playableComponent.initialized=%s  animatorReady(firstAnimatorReady)=%s", tostring(clientReady), tostring(initialized), tostring(isAnimatorRead))
	else
		add("  playableComponent 不存在(该实体可能无动画组件)")
	end

	add("---- Ⅳ. petHideKeys(玩家维护,对应 BASE_PET) ----")

	local master = safe(function()
		return entity.getMasterEntity and entity:getMasterEntity()
	end, nil)

	if master and master.dumpPetHideKeys then
		add("  master(%s).petHideKeys=[%s]", tostring(master.id), safe(function()
			return master:dumpPetHideKeys()
		end, "read fail"))
	elseif entity.dumpPetHideKeys then
		add("  self.petHideKeys=[%s]", safe(function()
			return entity:dumpPetHideKeys()
		end, "read fail"))
	else
		add("  (非宠物或无 master,跳过)")
	end

	add("---- Ⅷ. 服务器隐藏 clientVisible(对应 VISIBLE_BY_SERVER) ----")
	add("  entity.clientVisible=%s", tostring(entity.clientVisible))
	add("---- 综合 ----")
	add("  modelView:GetModelVisible()=%s", tostring(safe(function()
		return eModel.modelView:GetModelVisible()
	end, "?")))
	add("  entity.visible=%s  entity.active=%s", tostring(entity.visible), tostring(entity.active))

	local scale = safe(function()
		local mr = eModel.modelRoot

		if mr then
			local s = mr.localScale

			return string.format("(%.3f,%.3f,%.3f)", s.x, s.y, s.z)
		end

		return nil
	end, nil)

	add("  modelRoot.localScale=%s (Ⅶ:为0也会隐藏)", tostring(scale))
	add("============================================================")

	return table.concat(lines, "\n")
end

local function dumpAllEntitiesVisibleToFile()
	local entities = pg.getEntities()
	local sections = {}
	local count = 0

	for _, ent in pairs(entities) do
		count = count + 1

		local ok, info = pcall(collectEntityVisibleInfo, ent)

		if ok then
			sections[#sections + 1] = info
		else
			sections[#sections + 1] = string.format("==================== Entity Visible Info ====================\nentityId=%s 采集异常: %s\n============================================================", tostring(ent and ent.id), tostring(info))
		end
	end

	local header = string.format("场景全部实体 Visible 信息  实体数=%d  时间=%s", count, os.date("%Y-%m-%d %H:%M:%S"))
	local content = header .. "\n\n" .. table.concat(sections, "\n\n")
	local LOG_DIR = CS.UnityEngine.Application.persistentDataPath
	local path = LOG_DIR .. "\\" .. os.date("EntityVisible_%Y%m%d_%H%M%S.txt")
	local ok, err = pcall(function()
		os.execute("if not exist \"" .. LOG_DIR .. "\" mkdir \"" .. LOG_DIR .. "\"")

		local file = io.open(path, "w")

		if not file then
			logger:error("[VisibleInfo] 无法写入文件: %s", path)

			return false
		end

		file:write(content)
		file:close()

		return true
	end)

	if ok and err ~= false then
		logger:info("[VisibleInfo] 全场景 %d 个实体信息已写入: %s", count, path)
		pg.global.ui.tips:showTextTip(string.format("全场景 %d 个实体信息已写入 %s", count, path))
	else
		logger:error("[VisibleInfo] 写文件异常: %s", tostring(err))
		pg.global.ui.tips:showTextTip("写文件失败,详见日志")
	end
end

function GmToolUtils.dumpEntityVisibleInfo(buttons)
	local input = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	input = input and input:gsub("%s", "") or ""

	if input == "-1" then
		dumpAllEntitiesVisibleToFile()

		return
	end

	local entity

	if input == "" or input == "0" then
		entity = pg.pawn
	else
		entity = pg.getEntity(input)

		if not entity then
			local actorId = tonumber(input)

			if actorId then
				entity = pg.getEntityByActorId(actorId)
			end
		end
	end

	if not entity then
		pg.global.ui.tips:showTextTip(string.format("未找到实体: %s", tostring(input)))
		logger:error("[VisibleInfo] entity not found, input=%s", tostring(input))

		return
	end

	logger:error(collectEntityVisibleInfo(entity))
	pg.global.ui.tips:showTextTip("visible 信息已输出到日志,搜 [Entity Visible Info]")
end

function GmToolUtils.showPetListEmoji(buttons)
	local emojiName = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local player = pg.me

	if player then
		local entity = player:getCurPetEntity()

		if entity then
			local tmpTable = TablePool.getTable()

			tmpTable.petId = entity.id
			tmpTable.emojiName = emojiName

			facade:SendMessageCommand(MessageName.PET_SHOW_EMOJI, tmpTable)
			TablePool.returnTable(tmpTable)
		end
	end
end

function GmToolUtils.adjustNavAreaCost(buttons)
	local str = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	str = str:sub(2, -2)

	local result = {}

	for num in str:gmatch("[^,]+") do
		table.insert(result, tonumber(num))
	end

	local singleton = NavMeshServiceUtils.GetInstance()

	singleton.areaCosts = result

	pg.global.showBubbleMessageRaw("调整成功")
end

function GmToolUtils.resetFriendshipRecord(buttons)
	local playerId = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local level = tonumber(buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text)
	local selfPos = string.toTable(buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text)
	local friendPos = string.toTable(buttons[3]:GetChild("InputField"):GetComponent("UTMPInputField").text)

	pg.game.chat.friendships[playerId] = level

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
		pg.global.ui:close(UIConst.UI_ID_CONFIG)
	end

	pg.global.ui.friendshipUp:open({
		playerId = playerId,
		selfPos = selfPos,
		friendPos = friendPos
	}, nil, nil, {
		cameraPresetKey = 2
	})
end

function GmToolUtils.handleRenderSetting()
	local flags = appFacade.pipelineManager:GetCameraShowFlags()
	local settingsTable, pvTable

	for i, v in ipairs(GmToolUtils.gmFuncMap) do
		if v.sourceLabel == GmToolUtils.FuncTabLabel.Render then
			settingsTable = v
		end

		if v.sourceLabel == GmToolUtils.FuncTabLabel.PVHelper then
			pvTable = v
		end
	end

	local name, value

	for k, v in ipairs(flags) do
		name = v[1]
		value = v[2]

		local flagName = name

		GmToolUtils.GmRenderSetting[flagName] = value

		local data = {
			style = 1,
			cvarNamespace = "gm.render",
			subStyle = 0,
			label = flagName,
			func = "set_" .. flagName,
			checkFunc = "get_" .. flagName
		}

		if flagName == "m_EnableParticles" then
			data.label = "XParticles"
		elseif flagName == "m_EnableParticlesBatching" then
			data.label = "XParticles Batching"
		elseif flagName == "m_UseCustomCameraShowFlags" then
			data.label = flagName .. "（仅当前世界 Camera）"
		elseif flagName == "m_VrrMaskValue" then
			data.showFunc = "isWorldCameraShowFlagScope"
		end

		table.insert(settingsTable.funcList, data)

		GmToolUtils["set_" .. flagName] = function(isSelected)
			GmToolUtils.setCameraShowFlag(flagName, isSelected)
		end
		GmToolUtils["get_" .. flagName] = function()
			return GmToolUtils.getCameraShowFlag(flagName)
		end
	end

	for k, _ in pairs(ClientConst.ModuleKey) do
		local moduleName = k
		local data = {
			style = 1,
			subStyle = 0,
			label = GmToolUtils.getGmGameString("GM_DYNAMIC_HIDE_PREFIX") .. moduleName,
			func = "hide_" .. moduleName,
			checkFunc = "check_" .. moduleName
		}

		table.insert(pvTable.funcList, data)

		GmToolUtils["hide_" .. moduleName] = function(isSelected)
			pg.game:setModuleEnable("gmtool", ClientConst.ModuleKey[moduleName], not isSelected)
		end
		GmToolUtils["check_" .. moduleName] = function()
			return not pg.game:checkModuleEnable(ClientConst.ModuleKey[moduleName])
		end
	end
end

function GmToolUtils.isParticleSystemRuntimeSupported()
	return CS.FunPlus.WorldX.Setting.VideoSetting.IsParticleSystemRuntimeSupported()
end

function GmToolUtils.set_m_EnableParticleSystem(value)
	CS.FunPlus.WorldX.Setting.VideoSetting.SetParticleSystemRuntimeEnabled(value)
end

function GmToolUtils.get_m_EnableParticleSystem()
	return CS.FunPlus.WorldX.Setting.VideoSetting.GetParticleSystemRuntimeEnabled()
end

function GmToolUtils.getRenderShowFlagScope()
	if GmToolUtils.gmRenderScope == nil then
		GmToolUtils.gmRenderScope = GmToolUtils.GmRenderScope.WorldCamera
	end

	return GmToolUtils.gmRenderScope
end

function GmToolUtils.getRenderShowFlagScopeList()
	return {
		{
			label = "当前世界 Camera",
			value = GmToolUtils.GmRenderScope.WorldCamera
		},
		{
			label = "所有 Camera",
			value = GmToolUtils.GmRenderScope.AllCameras
		}
	}
end

function GmToolUtils.getRenderShowFlagScopeSelected()
	if GmToolUtils.getRenderShowFlagScope() == GmToolUtils.GmRenderScope.AllCameras then
		return 1
	end

	return 0
end

function GmToolUtils.isWorldCameraShowFlagScope()
	return GmToolUtils.getRenderShowFlagScope() == GmToolUtils.GmRenderScope.WorldCamera
end

function GmToolUtils.syncGmRenderSettingCache()
	local ok, flags = pcall(function()
		return appFacade.pipelineManager:GetCameraShowFlags()
	end)

	if not ok or flags == nil then
		return false
	end

	for _, flag in ipairs(flags) do
		GmToolUtils.GmRenderSetting[flag[1]] = flag[2]
	end

	return true
end

function GmToolUtils.applyAllCameraShowFlag(flagName, value)
	if GmToolUtils.GmRenderAllCameraIgnoredFlags[flagName] then
		return
	end

	CS.FunPlus.WorldX.Setting.VideoSetting.SetCameraShowFlagBool(flagName, value, true)

	GmToolUtils.gmRenderGlobalOverrideKeys[flagName] = true
end

function GmToolUtils.clearAllCameraShowFlagOverrides()
	for flagName, _ in pairs(GmToolUtils.gmRenderGlobalOverrideKeys) do
		CS.FunPlus.WorldX.Setting.VideoSetting.SetCameraShowFlagBool(flagName, false, false)
	end

	GmToolUtils.gmRenderGlobalOverrideKeys = {}
end

function GmToolUtils.applyAllCameraShowFlagsFromCache()
	for flagName, value in pairs(GmToolUtils.GmRenderSetting) do
		GmToolUtils.applyAllCameraShowFlag(flagName, value)
	end
end

function GmToolUtils.setRenderShowFlagScope(optionData)
	local nextScope = optionData

	if type(optionData) == "table" then
		nextScope = optionData.value
	end

	if nextScope ~= GmToolUtils.GmRenderScope.WorldCamera and nextScope ~= GmToolUtils.GmRenderScope.AllCameras then
		return false
	end

	local currentScope = GmToolUtils.getRenderShowFlagScope()

	if nextScope == currentScope then
		return true
	end

	if nextScope == GmToolUtils.GmRenderScope.AllCameras and not GmToolUtils.syncGmRenderSettingCache() then
		if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
			pg.global.ui.config:refreshFuncList()
		end

		pg.global.showBubbleMessageRaw("世界相机尚未就绪，请稍后重试")

		return false
	end

	if currentScope == GmToolUtils.GmRenderScope.AllCameras then
		GmToolUtils.clearAllCameraShowFlagOverrides()
	end

	GmToolUtils.gmRenderScope = nextScope

	if nextScope == GmToolUtils.GmRenderScope.AllCameras then
		GmToolUtils.applyAllCameraShowFlagsFromCache()
	else
		GmToolUtils.syncGmRenderSettingCache()
	end

	if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
		pg.global.ui.config:refreshFuncList()
	end

	return true
end

function GmToolUtils.setCameraShowFlag(flagName, value)
	GmToolUtils.GmRenderSetting[flagName] = value

	if GmToolUtils.GmRenderAllCameraIgnoredFlags[flagName] then
		appFacade.pipelineManager:SetCameraShowFlag(flagName, value)
	elseif GmToolUtils.getRenderShowFlagScope() == GmToolUtils.GmRenderScope.AllCameras then
		GmToolUtils.applyAllCameraShowFlag(flagName, value)
	else
		appFacade.pipelineManager:SetCameraShowFlag(flagName, value)
	end
end

function GmToolUtils.getCameraShowFlag(flagName)
	return GmToolUtils.GmRenderSetting[flagName]
end

function GmToolUtils.setCameraFov(params)
	local fov = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	pg.game.camera.playerCameraMode.defaultCamera:setCameraFov(tonumber(fov), 0)
end

function GmToolUtils.connectShaderPush(params)
	local pcIp = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	if pcIp == nil or pcIp == "" then
		pg.global.ui.tips:showTextTip("请填 PC 的 IP，如 192.168.1.5")

		return
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.ConnectShaderPush(pcIp)
	pg.global.ui.tips:showTextTip("ShaderPush 已连接 " .. pcIp)
end

function GmToolUtils.disconnectShaderPush()
	CS.FunPlus.WorldX.Utils.GmToolUtils.DisconnectShaderPush()
	pg.global.ui.tips:showTextTip("ShaderPush 已断开")
end

function GmToolUtils.shaderPushStatus()
	local status = CS.FunPlus.WorldX.Utils.GmToolUtils.GetShaderPushStatus()

	pg.global.ui.tips:showTextTip(status)
	logger:info("%s", status)
end

function GmToolUtils.setTreeCullDistance(params)
	local treeCullDistance = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	pg.global.resMgr:ChangeTreeCullDistance(treeCullDistance)
end

function GmToolUtils.setGrassCullDistance(params)
	local grassCullDistance = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	pg.global.resMgr:ChangeGrassCullDistance(grassCullDistance)
end

function GmToolUtils.setImposterCullDistance(params)
	local imposterCullDistance = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	pg.global.resMgr:ChangeImpostorCullDistance(imposterCullDistance)
end

function GmToolUtils.setForce32Layer(params)
	local layer = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local allEntities = pg.getEntities()

	for _, entity in pairs(allEntities) do
		local eModel = entity.eModel

		if eModel ~= nil then
			local shaderView = eModel.modelShaderView

			if shaderView then
				shaderView:SetMultiPassForce32Layer(true, layer)
			end
		end
	end
end

function GmToolUtils.hideFps(isSelected)
	pg.global.ui.hudV2:switchStatistics(not isSelected)
end

function GmToolUtils.checkFps()
	return not pg.global.ui.hudV2:getStatisticsVisible()
end

function GmToolUtils.hidePreAlpha(isSelected)
	if pg.global.ui.developHint.view ~= nil then
		pg.global.ui.developHint.view.txtHintUText:SetActiveQuickly(not isSelected)
	end
end

function GmToolUtils.checkPreAlpha()
	if pg.global.ui.developHint.view == nil then
		return true
	end

	return pg.global.ui.developHint.view.txtHintUText.renderOpacity < 1
end

function GmToolUtils.hidePhoto(isSelected)
	pg.global.ui.hudV2.LD.btnEnterPhotoUButton:SetActiveQuickly(not isSelected)
	pg.global.ui.hudV2.LD.btnEmoticonUButton:SetActiveQuickly(not isSelected)
end

function GmToolUtils.checkPhoto()
	return pg.global.ui.hudV2.LD.btnEnterPhotoUButton.renderOpacity < 1
end

function GmToolUtils.hideRightPanel(isSelected)
	pg.global.ui.hudV2.RU.funcList.rootPanel:SetActiveQuickly(not isSelected)
end

function GmToolUtils.checkRightPanel()
	return pg.global.ui.hudV2.RU.funcList.rootPanel.renderOpacity < 1
end

function GmToolUtils.hideCatchKey(isSelected)
	pg.global.ui.hudV2.LD.ballBarUWidget.renderOpacity:SetActiveQuickly(not isSelected)
end

function GmToolUtils.checkCatchKey(isSelected)
	return pg.global.ui.hudV2.LD.ballBarUWidget.renderOpacity < 1
end

function GmToolUtils.hideUID(isSelected)
	pg.global.ui.hudV2.view.uIDUSDFText:SetActiveQuickly(not isSelected)
end

function GmToolUtils.checkUID()
	return pg.global.ui.hudV2.view.uIDUSDFText.renderOpacity < 1
end

function GmToolUtils.hideFuseKey(isSelected)
	local hpFuse = pg.global.ui.hudV2 and pg.global.ui.hudV2.MD and pg.global.ui.hudV2.MD.hpFuse

	if hpFuse then
		if hpFuse.fuseKey then
			hpFuse.fuseKey:SetActiveQuickly(not isSelected)
		end

		if hpFuse.fuseKeyText then
			hpFuse.fuseKeyText:SetActiveQuickly(not isSelected)
		end
	end
end

function GmToolUtils.checkFuseKey()
	local hpFuse = pg.global.ui.hudV2 and pg.global.ui.hudV2.MD and pg.global.ui.hudV2.MD.hpFuse

	return hpFuse and hpFuse.fuseKey and hpFuse.fuseKey.renderOpacity < 1 and hpFuse.fuseKeyText and hpFuse.fuseKeyText.renderOpacity < 1
end

function GmToolUtils.hideBossName(isSelected)
	local component = pg.global.ui.tips:getBossTitleItem()

	if component and component.setBossNameVisible then
		component:setBossNameVisible(not isSelected)
	end
end

function GmToolUtils.checkBossName()
	local component = pg.global.ui.tips:getBossTitleItem()

	if component and component.isBossNameHidden then
		return component:isBossNameHidden()
	end

	return false
end

function GmToolUtils.hideTopLogo(isSelected)
	pg.global.ui.topLogo.view.widget:SetActiveQuickly(not isSelected)
end

function GmToolUtils.checkTopLogo()
	return pg.global.ui.topLogo.view.widget.renderOpacity < 1
end

function GmToolUtils.hideAIHelper(isSelected)
	local aiHelper = pg.global.ui.hudV2 and pg.global.ui.hudV2.LU and pg.global.ui.hudV2.LU.aiHelperLit

	if aiHelper and aiHelper.uWidget then
		aiHelper.uWidget:SetActiveQuickly(not isSelected)
	end
end

function GmToolUtils.checkAIHelper()
	local aiHelper = pg.global.ui.hudV2 and pg.global.ui.hudV2.LU and pg.global.ui.hudV2.LU.aiHelperLit

	return aiHelper and aiHelper.uWidget and aiHelper.uWidget.renderOpacity < 1
end

function GmToolUtils.hideMiniMapPlenty(isSelected)
	local minimap = pg.global.ui.hudV2 and pg.global.ui.hudV2.LU and pg.global.ui.hudV2.LU.minimapV2

	if minimap then
		minimap.hideLeylineTree = isSelected

		minimap:destroyAllInstances()
		minimap:initViewInner()
		minimap:onShowInner()
	end
end

function GmToolUtils.checkMiniMapPlenty()
	local minimap = pg.global.ui.hudV2 and pg.global.ui.hudV2.LU and pg.global.ui.hudV2.LU.minimapV2

	return minimap and minimap.hideLeylineTree
end

function GmToolUtils.setResolution(params)
	local width = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local height = params[1]:GetChild("InputField"):GetComponent("UTMPInputField").text

	width = tonumber(width)
	height = tonumber(height)

	pg.global.gameMgr:SetResolution(width, height, "Windowed")
end

function GmToolUtils.forceAvatarLOD(params)
	local lodStr = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local lod = tonumber(lodStr) or -1

	if lod > 3 then
		lod = 3
	end

	pg.pawn.eModel.modelView:SetRendererLod(lod)
end

function GmToolUtils.enableNogoParmon(isSelected)
	appFacade.entityManager.loadNoGoEntity = isSelected
end

function GmToolUtils.isNogoParmonEnabled()
	return appFacade.entityManager.loadNoGoEntity
end

function GmToolUtils.printVideoResFullPath(params)
	local resID = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	logger:info(pg.global.resMgr:RawFileGetFullPath("video", resID))
end

function GmToolUtils.openRpcSizeDebug(isSelected)
	pg.world.setConfig("OPEN_RPC_CALL_DEBUG", tostring(isSelected))
end

function GmToolUtils.checkRpcSizeDebug()
	return pg.world.getConfig("OPEN_RPC_CALL_DEBUG") == "true"
end

function GmToolUtils.setWeatherProfile(selectData)
	GmToolUtils.weatherProfileIndex = selectData.tIndex

	appFacade.pipelineManager:TrySetWeatherProfile(selectData.value)
end

function GmToolUtils.getWeatherProfileList()
	local weatherProfileList = appFacade.pipelineManager:GetWeatherProfileList()
	local ret = {
		{
			label = "None",
			tIndex = 0,
			value = ""
		}
	}

	for k, v in pairs(weatherProfileList) do
		table.insert(ret, {
			tIndex = 0,
			label = v,
			value = v
		})
	end

	return ret
end

function GmToolUtils.getWeatherProfileSelected()
	return 0
end

function GmToolUtils.getGrassLoadDistance(funcParam)
	local value = pgUtils.GetVegetationStorageLodDistance(funcParam)

	return value >= 0 and value or 100
end

function GmToolUtils.setGrassLoadDistance(value, funcParam)
	pgUtils.SetVegetationStorageLodDistance(funcParam, value)
end

function GmToolUtils.getLodBias()
	local lodBias = pgUtils.GetProjectSettingsLodBias()

	return lodBias >= 0 and lodBias or 1
end

function GmToolUtils.setLodBias(value, funcParam)
	pgUtils.SetProjectSettingsLodBias(value)
end

function GmToolUtils.disablePlayerFirstInit(enable)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmDisablePlayerFirstInit, enable)
end

function GmToolUtils.checkDisablePlayerFirstInit()
	return pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmDisablePlayerFirstInit, false)
end

function GmToolUtils.changePlayerAppearance(params)
	local templateId = params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text

	templateId = tonumber(templateId)

	if not templateId then
		return
	end

	if templateId == 0 then
		pg.me:refreshAppearance(true)
	else
		local configData = PuppetData[templateId]

		pg.me:refreshAppearanceToPuppet(configData, true)
	end
end

function GmToolUtils.parseHudAreaTip(input)
	if string.isNilOrEmpty(input) then
		return
	end

	local taskList = string.split(input, ";")
	local dataList = {}

	for _, v in ipairs(taskList) do
		local res = string.split(v, ",")

		if #res >= 3 then
			local key = res[1] or ""
			local keyMap = string.split(key, "_")

			if #keyMap >= 2 then
				local areaType = keyMap[1]
				local itemType = keyMap[2]
				local duration = tonumber(res[2])
				local delay = tonumber(res[3]) or 0
				local param = tonumber(res[4]) or 0

				dataList[#dataList + 1] = {
					areaType = areaType,
					itemKey = itemType,
					duration = duration,
					delay = delay,
					param = param
				}
			end
		end
	end

	pg.global.ui.tips:pushGMTasks(dataList)
end

function GmToolUtils.hideHudAreaTip()
	pg.global.ui.tips:hideGMTestInfo()
end

function GmToolUtils.addCommonSystemNotice(buttons)
	local bulletId = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local input = buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local args = string.split(input, ",")

	pg.game.chat:addCommonSystemNotice(tonumber(bulletId), table.unpack(args))
end

function GmToolUtils.trySkipNew(isSelected)
	pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.GmSkipNew, isSelected)
end

function GmToolUtils.openAnimationRecord()
	CS.FunPlus.WorldX.Animations.AnalysisRecorder.StartRecord()
end

function GmToolUtils.getEnableDebugTrySkipNew()
	return pg.global.prefsCacheUtils:getBool(ClientConst.PrefKey.GmSkipNew, false)
end

function GmToolUtils.cmdSkipNew()
	local cmdList = GmToolUtils.getCmdListFileName()
	local cmd

	for _, command in ipairs(cmdList) do
		if command.value == "skipNew" then
			cmd = command
		end
	end

	if cmd then
		GmToolUtils.execCmdList(cmd)
	else
		pg.global.showBubbleMessageRaw("执行失败，未获取到skipNew指令", 3)
	end
end

function GmToolUtils.getLogLevelList()
	return {
		{
			label = "Log",
			value = LoggerConst.DEBUG
		},
		{
			label = "Warning",
			value = LoggerConst.WARN
		},
		{
			label = "Error",
			value = LoggerConst.ERROR
		}
	}
end

function GmToolUtils.setLogLevel(selectData)
	LoggerManager.setLevel(selectData.value)
	CS.FunPlus.WorldX.Utils.LuaUtils.SetLogLevel(selectData.value)
end

function GmToolUtils.enableLog(enable)
	LoggerManager.setEnable(enable)
	CS.FunPlus.WorldX.Utils.LuaUtils.EnableLog(enable)
end

function GmToolUtils.getLogEnable()
	return LoggerConst.ENABLE and CS.FunPlus.WorldX.Utils.LuaUtils.GetLogEnable()
end

function GmToolUtils.enableConsoleLogSave(enable)
	CS.FunPlus.WorldX.Utils.LuaUtils.EnableSaveLog(enable)
end

function GmToolUtils.getConsoleLogSaveEnable()
	return CS.FunPlus.WorldX.Utils.LuaUtils.GetSaveLogEnable()
end

function GmToolUtils.isMobilePlatformOrEditor()
	if CS.UnityEngine.Application.isEditor then
		return true
	end

	local curPlatform = ClientUtils.getAdaptionPlatform()

	return curPlatform == UIConst.PLATFORM.Mobile
end

function GmToolUtils.getGameTimeScaleParam()
	return pg.space.timeScaleMgr:getGlobalFreeze()
end

function GmToolUtils.modifyGameTimeScaleParam(value, params)
	pg.space.timeScaleMgr:startGlobalFreeze(value, 0, 0, 10000)
end

function GmToolUtils.setGameTimeScaleParam(params)
	local value = tonumber(params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text)

	value = math.clamp(value, 0.1, 2)

	pg.space.timeScaleMgr:startGlobalFreeze(value, 0, 0, 10000)
end

function GmToolUtils.dumpGameTimeStopInfo()
	if not pg.space then
		pg.global.showBubbleMessageRaw("当前没有 space，无法输出时停信息")

		return
	end

	local info = pg.space:dumpGameTimeStopInfo()

	pg.global.showBubbleMessageRaw(string.format("时停信息已输出到日志：scale=%s 判定=%s UI源=%d 类型暂停=%d", tostring(info.gameTimeScale), tostring(info.verdictShouldStop), #info.uiSources, #info.pauseSources))
end

function GmToolUtils.onAbilityDataInspectChange()
	AbilityDataInspect.EnableAbilityDataInspect(not AbilityDataInspect.GetAbilityDataInspectEnable())
end

function GmToolUtils.getAbilityDataInspect()
	return AbilityDataInspect.GetAbilityDataInspectEnable()
end

function GmToolUtils.onAbilityAutoTestChange()
	AbilityAutoTest.Enable(not AbilityAutoTest.GetEnable())
end

function GmToolUtils.getAbilityAutoTestEnable()
	return AbilityAutoTest.GetEnable()
end

GmToolUtils._autoCastTimerId = nil
GmToolUtils._autoCastPuppetActorId = nil

local function _collectEntitySkills(entity, normalAtkId)
	local skills = {}

	if not entity or not entity.abilityMap then
		return skills
	end

	local skillSet = {}

	for abilityId, _ in pairs(entity.abilityMap) do
		if abilityId ~= normalAtkId and not skillSet[abilityId] then
			local ability = entity:getAbility(abilityId)

			if ability then
				local templ = ability:getAbilityTemplate()

				if templ then
					local abilityType = templ.abilityType

					if abilityType == AbilityConst.EnumAbilityType.Attack or abilityType == AbilityConst.EnumAbilityType.Skill or abilityType == AbilityConst.EnumAbilityType.Ultimate then
						skills[#skills + 1] = abilityId
						skillSet[abilityId] = true
					end
				end
			end
		end
	end

	return skills
end

local function _tryCastAbility(entity, abilityId, targetActorId)
	if not entity then
		return false
	end

	local curCasting = entity:getCastingAbilityId()

	if curCasting ~= 0 and not entity:BACKSWING_ST() then
		return false
	end

	local targetEntity = pg.getEntityByActorId(targetActorId)

	if targetEntity then
		entity:clientCastAbilityOnTarget(abilityId, targetActorId)
	else
		entity:clientCastAbilityNoTarget(abilityId)
	end

	return true
end

function GmToolUtils._startAutoCastLoop(puppetActorId, interval, skillEveryNCombo, petControlDuration)
	local normalAttackCombo = {
		910000101,
		910000102,
		910000103,
		910000104,
		910000105
	}
	local normalAttackSet = {}

	for _, id in ipairs(normalAttackCombo) do
		normalAttackSet[id] = true
	end

	local playerSkills = _collectEntitySkills(pg.me, nil)
	local filteredSkills = {}

	for _, skillId in ipairs(playerSkills) do
		if not normalAttackSet[skillId] then
			filteredSkills[#filteredSkills + 1] = skillId
		end
	end

	playerSkills = filteredSkills

	local comboIdx = 1
	local comboFinishCount = 0
	local playerSkillIdx = 1

	skillEveryNCombo = skillEveryNCombo or 2

	local petSkillTypes = {
		AbilityConst.WEAPON_NORMAL_ATK_ABILITY,
		AbilityConst.WEAPON_SKILL_ABILITY,
		AbilityConst.WEAPON_SKILL_ABILITY2
	}
	local petSkillIdx = 1

	petControlDuration = petControlDuration or 10

	local curPetIndex = 1
	local PLAYER_PHASE = 1
	local PET_CONTROL_PHASE = 2
	local phase = PLAYER_PHASE
	local phaseStartTime = os.clock()
	local playerPhaseDuration = 10

	local function _collectPetSkills()
		local skills = {}
		local petEntity = pg.me and pg.me:getCurPetEntity()

		if not petEntity then
			return skills
		end

		local petInfo = petEntity.petInfo or petEntity.getBattlePetInfo and petEntity:getBattlePetInfo()

		if not petInfo or not petInfo.curAbilityMap then
			return skills
		end

		for _, skillType in ipairs(petSkillTypes) do
			local skillData = petInfo.curAbilityMap[skillType]

			if skillData and skillData.abilityId and skillData.abilityId ~= 0 then
				skills[#skills + 1] = skillData.abilityId
			end
		end

		return skills
	end

	GmToolUtils._autoCastTimerId = TimerManager.addRepeatTimer(interval, function()
		if not pg.me then
			return
		end

		local now = os.clock()
		local elapsed = now - phaseStartTime

		if phase == PLAYER_PHASE and elapsed >= playerPhaseDuration then
			local petEntity = pg.me:getCurPetEntity()

			if petEntity and not pg.me:isControllingPet() then
				pg.me:requestSwitchToPet(Const.CLIENT_SWITCH_REASON.Default)
			end

			pg.game.camera.playerCameraMode:resetCameraDir()
			pg.game.camera.playerCameraMode:resetCameraZoom()

			phase = PET_CONTROL_PHASE
			phaseStartTime = now
			petSkillIdx = 1

			return
		elseif phase == PET_CONTROL_PHASE and elapsed >= petControlDuration then
			if pg.me:isControllingPet() then
				pg.me:requestSwitchToPlayer(Const.CLIENT_SWITCH_REASON.Default)
			end

			pg.game.camera.playerCameraMode:resetCameraDir()
			pg.game.camera.playerCameraMode:resetCameraZoom()

			if pg.me.petPrepareList and #pg.me.petPrepareList > 1 then
				curPetIndex = curPetIndex % #pg.me.petPrepareList + 1

				TimerManager.addTimer(0.5, function()
					if pg.me then
						pg.me:switchToPetByIndex(curPetIndex)
					end
				end)
			end

			phase = PLAYER_PHASE
			phaseStartTime = now + 0.5
			comboIdx = 1
			comboFinishCount = 0
			petSkillIdx = 1

			return
		end

		if phase == PLAYER_PHASE then
			local abilityId

			if comboIdx > #normalAttackCombo then
				comboIdx = 1
				comboFinishCount = comboFinishCount + 1

				if skillEveryNCombo > 0 and comboFinishCount >= skillEveryNCombo and #playerSkills > 0 then
					comboFinishCount = 0
					abilityId = playerSkills[playerSkillIdx]
					playerSkillIdx = playerSkillIdx % #playerSkills + 1
				end
			end

			if not abilityId then
				abilityId = normalAttackCombo[comboIdx]
				comboIdx = comboIdx + 1
			end

			_tryCastAbility(pg.me, abilityId, puppetActorId)

			local petEntity = pg.me:getCurPetEntity()

			if petEntity and not pg.me:isControllingPet() then
				local petSkills = _collectPetSkills()

				if #petSkills > 0 then
					local idx = (petSkillIdx - 1) % #petSkills + 1

					_tryCastAbility(petEntity, petSkills[idx], puppetActorId)

					petSkillIdx = petSkillIdx + 1
				end
			end
		elseif phase == PET_CONTROL_PHASE then
			local caster = pg.pawn

			if caster then
				local petSkills = _collectPetSkills()

				if #petSkills > 0 then
					local randIdx = math.random(1, #petSkills)

					_tryCastAbility(caster, petSkills[randIdx], puppetActorId)
				end
			end
		end
	end)
end

function GmToolUtils.startClientAutoCast(buttons)
	local puppetTemplateId = tonumber(buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 9999
	local puppetPropId = tonumber(buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 10
	local normalAtkInterval = tonumber(buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0.5
	local skillEveryNCombo = tonumber(buttons[3]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 2
	local petControlDuration = tonumber(buttons[4]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 10

	GmToolUtils.stopClientAutoCast()
	pg.me:doGmCmd2("setupClientAutoCastEnv", {
		puppetTemplateId,
		puppetPropId,
		1
	}, function(result, info)
		if not info or not info.puppetActorId then
			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("startClientAutoCast failed: setupClientAutoCastEnv returned no puppetActorId", result, info)
			end

			return
		end

		local puppetActorId = info.puppetActorId

		GmToolUtils._autoCastPuppetActorId = puppetActorId

		pg.me:doGmCmd("setEntityGmMode", pg.me.actorId, 1)

		local petEntity = pg.me:getCurPetEntity()

		if petEntity then
			pg.me:doGmCmd("setEntityGmMode", petEntity.actorId, 1)
		end

		GmToolUtils._startAutoCastLoop(puppetActorId, normalAtkInterval, skillEveryNCombo, petControlDuration)

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("startClientAutoCast succeed, puppetActorId=%s, interval=%s, skillEvery=%s, petSwitch=%ss", puppetActorId, normalAtkInterval, skillEveryNCombo, petControlDuration)
		end
	end)
end

function GmToolUtils.stopClientAutoCast()
	if GmToolUtils._autoCastTimerId then
		TimerManager.removeTimer(GmToolUtils._autoCastTimerId)

		GmToolUtils._autoCastTimerId = nil
	end

	if GmToolUtils._autoCastPuppetActorId then
		pg.me:doGmCmd("stopClientAutoCastEnv")

		GmToolUtils._autoCastPuppetActorId = nil
	end
end

local _gmEffectIds = {}
local _gmEffectLoopTimerId, _gmTemplateSkillEffectLodState
local _gmSpecifiedEffectLodIds = {}
local GM_EFFECT_LOD_LEVELS = {
	{
		name = "High",
		level = 0
	},
	{
		name = "Mid",
		level = 1
	},
	{
		name = "Low",
		level = 2
	},
	{
		name = "VeryLow",
		level = 3
	}
}
local GM_SKILL_EFFECT_LOD_SPACING = 5
local GM_SKILL_EFFECT_LOD_FORWARD_DISTANCE = 10
local GM_EFFECT_TYPE_VEG_LINK = 3

local function stopCurrentGmSkillEffectLods(state)
	if not state or not state.currentEffectIds then
		return 0
	end

	local stoppedCount = 0

	for _, effectId in ipairs(state.currentEffectIds) do
		if effectId and effectId ~= 0 then
			pcall(function()
				pg.game.effect:stopEffect(0, effectId)
			end)

			stoppedCount = stoppedCount + 1
		end
	end

	state.currentEffectIds = nil

	return stoppedCount
end

local function stopGmTemplateSkillEffectLod()
	local state = _gmTemplateSkillEffectLodState

	if not state then
		return 0
	end

	if state.timerId then
		TimerManager.removeTimer(state.timerId)

		state.timerId = nil
	end

	local stoppedCount = stopCurrentGmSkillEffectLods(state)

	_gmTemplateSkillEffectLodState = nil

	return math.max(stoppedCount, 1)
end

local function stopGmSpecifiedEffectLods()
	local stoppedCount = 0

	for _, effectId in ipairs(_gmSpecifiedEffectLodIds) do
		if effectId and effectId ~= 0 then
			pcall(function()
				pg.game.effect:stopEffect(0, effectId)
			end)

			stoppedCount = stoppedCount + 1
		end
	end

	_gmSpecifiedEffectLodIds = {}

	return stoppedCount
end

local function addAbilityId(abilityIds, abilityIdSet, abilityId)
	abilityId = tonumber(abilityId)

	if abilityId and abilityId ~= 0 and not abilityIdSet[abilityId] then
		abilityIdSet[abilityId] = true
		abilityIds[#abilityIds + 1] = abilityId
	end
end

local function collectTemplateAbilityIds(templateId)
	local abilityIds = {}
	local abilityIdSet = {}
	local templateTypes = {}
	local puppetConfig = PuppetData[templateId]

	if puppetConfig then
		templateTypes[#templateTypes + 1] = "怪物"

		addAbilityId(abilityIds, abilityIdSet, puppetConfig.normalAtkAbilityId)

		for _, abilityId in pairs(puppetConfig.skillList or EMPTY_TABLE) do
			addAbilityId(abilityIds, abilityIdSet, abilityId)
		end
	end

	local petConfig = PetData[templateId]

	if petConfig then
		templateTypes[#templateTypes + 1] = "宠物"

		local petPrototypeId = Utils.getPetPetPrototypeId(templateId)
		local basePetPrototypeId = Utils.getBasePetPrototypeId(petPrototypeId)

		for abilityParamId, skillData in pairs(PetSkillData[basePetPrototypeId] or EMPTY_TABLE) do
			addAbilityId(abilityIds, abilityIdSet, AbilityUtils.getAbilityIdByParamId(templateId, abilityParamId))

			if skillData.enhancedSkillId then
				addAbilityId(abilityIds, abilityIdSet, AbilityUtils.getAbilityIdByParamId(templateId, skillData.enhancedSkillId))
			end
		end
	end

	table.sort(abilityIds)

	return abilityIds, table.concat(templateTypes, "+")
end

local function collectAbilityEffectNames(abilityIds, effectData)
	local effectNameSet = {}
	local visitedAbilityIds = {}
	local loadedAbilityCount = 0

	local function collectAbility(abilityId)
		if visitedAbilityIds[abilityId] then
			return
		end

		visitedAbilityIds[abilityId] = true

		local abilityData = pg.global.abilityMgr:getAbilityTemplate(abilityId)

		if type(abilityData) ~= "table" or next(abilityData) == nil then
			print(string.format("[TemplateSkillEffectLod] Ability配置不存在: %s", tostring(abilityId)))

			return
		end

		loadedAbilityCount = loadedAbilityCount + 1

		for _, effectName in pairs(abilityData.preloadEffs or EMPTY_TABLE) do
			if effectData[effectName] then
				effectNameSet[effectName] = true
			else
				print(string.format("[TemplateSkillEffectLod] effect_data中不存在: Ability=%s, Effect=%s", tostring(abilityId), tostring(effectName)))
			end
		end

		for _, subAbilityId in pairs(abilityData.subAbilityIds or EMPTY_TABLE) do
			subAbilityId = tonumber(subAbilityId)

			if subAbilityId and subAbilityId ~= 0 then
				collectAbility(subAbilityId)
			end
		end
	end

	for _, abilityId in ipairs(abilityIds) do
		collectAbility(abilityId)
	end

	local effectNames = {}

	for effectName in pairs(effectNameSet) do
		effectNames[#effectNames + 1] = effectName
	end

	table.sort(effectNames)

	return effectNames, loadedAbilityCount
end

local function isLinkEffect(effectConfigs)
	if type(effectConfigs) ~= "table" then
		return false
	end

	for _, config in pairs(effectConfigs) do
		if type(config) == "table" and (config.mountType == EffectConst.MountType.Link or config.effectType == GM_EFFECT_TYPE_VEG_LINK) then
			return true
		end
	end

	return false
end

local playNextTemplateSkillEffectLod

local function scheduleNextTemplateSkillEffectLod(state, delay)
	state.timerId = TimerManager.addTimer(delay, function()
		if _gmTemplateSkillEffectLodState ~= state then
			return
		end

		state.timerId = nil

		stopCurrentGmSkillEffectLods(state)

		state.effectIndex = state.effectIndex + 1

		playNextTemplateSkillEffectLod()
	end)
end

function playNextTemplateSkillEffectLod()
	local state = _gmTemplateSkillEffectLodState

	if not state then
		return
	end

	local controller = pg.pawn or pg.me

	if controller == nil then
		stopGmTemplateSkillEffectLod()
		print("[TemplateSkillEffectLod] 当前主控不存在，轮询已停止")

		return
	end

	if state.effectIndex > #state.effectNames then
		local total = #state.effectNames
		local linkSkipCount = state.linkSkipCount

		_gmTemplateSkillEffectLodState = nil

		print(string.format("[TemplateSkillEffectLod] templateId=%d 轮询完成，共检查 %d 个特效，跳过 Link %d 个", state.templateId, total, linkSkipCount))
		pg.global.ui.tips:showTextTip(string.format("技能特效LOD轮询完成：%d个，跳过Link %d个", total, linkSkipCount))

		return
	end

	local effectName = state.effectNames[state.effectIndex]
	local effectConfigs = state.effectData[effectName]

	if isLinkEffect(effectConfigs) then
		state.linkSkipCount = state.linkSkipCount + 1

		local message = string.format("[%d/%d] %s（Link特效，已跳过）", state.effectIndex, #state.effectNames, effectName)

		print("[TemplateSkillEffectLod] " .. message)
		pg.global.ui.tips:showTextTip(message, state.duration)
		scheduleNextTemplateSkillEffectLod(state, state.duration)

		return
	end

	local rotation = controller:getRotation()
	local forward = Quaternion.MulVec3(rotation, Vector3.forward)
	local right = Quaternion.MulVec3(rotation, Vector3.right)

	forward.y = 0
	right.y = 0

	Vector3.SetNormalize(forward)
	Vector3.SetNormalize(right)

	local centerPosition = controller:getPosition() + forward * GM_SKILL_EFFECT_LOD_FORWARD_DISTANCE

	state.currentEffectIds = {}

	for lodIndex, lodInfo in ipairs(GM_EFFECT_LOD_LEVELS) do
		local horizontalOffset = (lodIndex - (#GM_EFFECT_LOD_LEVELS + 1) * 0.5) * GM_SKILL_EFFECT_LOD_SPACING
		local effectPosition = centerPosition + right * horizontalOffset
		local success, effectId = pcall(function()
			return pg.game.effect:playEffectAt(0, effectName, effectPosition, nil, nil, {
				duration = state.duration,
				speed = state.playSpeed,
				forceLodLevel = lodInfo.level
			})
		end)

		if success and effectId and effectId ~= 0 then
			state.currentEffectIds[#state.currentEffectIds + 1] = effectId
		else
			print(string.format("[TemplateSkillEffectLod] 播放失败: %s, LOD=%s(%d), error=%s", effectName, lodInfo.name, lodInfo.level, tostring(effectId)))
		end
	end

	local message = string.format("[%d/%d] %s\n左→右：High / Mid / Low / VeryLow，速率=%.2f", state.effectIndex, #state.effectNames, effectName, state.playSpeed)

	print("[TemplateSkillEffectLod] " .. message)
	pg.global.ui.tips:showTextTip(message, state.duration)
	scheduleNextTemplateSkillEffectLod(state, state.duration)
end

function GmToolUtils.playTemplateSkillEffectsByLod(buttons)
	if pg.pawn == nil and pg.me == nil then
		pg.global.ui.tips:showTextTip("当前主控不存在，无法播放技能特效")

		return
	end

	local templateId = tonumber(GmToolUtils.getInputValue(buttons, 0))

	if not templateId or templateId == 0 then
		pg.global.ui.tips:showTextTip("请输入有效的宠物/怪物templateId")

		return
	end

	local duration = tonumber(GmToolUtils.getInputValue(buttons, 1)) or 5

	duration = math.max(duration, 0.1)

	local playSpeed = tonumber(GmToolUtils.getInputValue(buttons, 2)) or 1

	if playSpeed <= 0 then
		pg.global.ui.tips:showTextTip("播放速率必须大于0")

		return
	end

	local EffectData = require("Data.effect_data")
	local abilityIds, templateType = collectTemplateAbilityIds(templateId)

	if templateType == "" then
		pg.global.ui.tips:showTextTip(string.format("templateId=%d 不是有效的宠物或怪物模板", templateId))

		return
	end

	if #abilityIds == 0 then
		pg.global.ui.tips:showTextTip(string.format("templateId=%d 未配置技能", templateId))

		return
	end

	local effectNames, loadedAbilityCount = collectAbilityEffectNames(abilityIds, EffectData)

	if #effectNames == 0 then
		pg.global.ui.tips:showTextTip(string.format("templateId=%d 的技能未配置有效特效", templateId))

		return
	end

	stopGmTemplateSkillEffectLod()
	stopGmSpecifiedEffectLods()

	_gmTemplateSkillEffectLodState = {
		linkSkipCount = 0,
		effectIndex = 1,
		templateId = templateId,
		effectNames = effectNames,
		effectData = EffectData,
		duration = duration,
		playSpeed = playSpeed
	}

	print(string.format("[TemplateSkillEffectLod] 开始轮询，templateId=%d，类型=%s，直属技能=%d，含子技能=%d，特效=%d，每组=%.2f秒，速率=%.2f", templateId, templateType, #abilityIds, loadedAbilityCount, #effectNames, duration, playSpeed))
	pg.global.ui.tips:showTextTip(string.format("%s%d：%d个技能特效，每组同时对比4档LOD，速率=%.2f", templateType, templateId, #effectNames, playSpeed))
	playNextTemplateSkillEffectLod()
end

function GmToolUtils.playSpecifiedEffectByLod(buttons)
	local controller = pg.pawn or pg.me

	if controller == nil then
		pg.global.ui.tips:showTextTip("当前主控不存在，无法播放技能特效")

		return
	end

	local effectName = GmToolUtils.getInputValue(buttons, 0)

	effectName = effectName and tostring(effectName) or ""

	local spacing = tonumber(GmToolUtils.getInputValue(buttons, 1)) or 5
	local effectScale = tonumber(GmToolUtils.getInputValue(buttons, 2)) or 1
	local playSpeed = tonumber(GmToolUtils.getInputValue(buttons, 3)) or 1
	local duration = tonumber(GmToolUtils.getInputValue(buttons, 4)) or 5

	if effectName == "" then
		pg.global.ui.tips:showTextTip("请输入特效名")

		return
	end

	if spacing < 0 then
		pg.global.ui.tips:showTextTip("相邻间隔距离不能小于0")

		return
	end

	if effectScale <= 0 then
		pg.global.ui.tips:showTextTip("特效缩放倍率必须大于0")

		return
	end

	if playSpeed <= 0 then
		pg.global.ui.tips:showTextTip("播放速率必须大于0")

		return
	end

	if duration <= 0 then
		pg.global.ui.tips:showTextTip("持续时间必须大于0")

		return
	end

	local EffectData = require("Data.effect_data")
	local effectConfigs = EffectData[effectName]

	if not effectConfigs then
		pg.global.ui.tips:showTextTip(string.format("effect_data中不存在特效：%s", effectName))

		return
	end

	stopGmTemplateSkillEffectLod()
	stopGmSpecifiedEffectLods()

	if isLinkEffect(effectConfigs) then
		local message = string.format("%s（Link特效，已跳过）", effectName)

		print("[SpecifiedEffectLod] " .. message)
		pg.global.ui.tips:showTextTip(message, duration)

		return
	end

	local rotation = controller:getRotation()
	local forward = Quaternion.MulVec3(rotation, Vector3.forward)
	local right = Quaternion.MulVec3(rotation, Vector3.right)

	forward.y = 0
	right.y = 0

	Vector3.SetNormalize(forward)
	Vector3.SetNormalize(right)

	local centerPosition = controller:getPosition() + forward * GM_SKILL_EFFECT_LOD_FORWARD_DISTANCE

	for lodIndex, lodInfo in ipairs(GM_EFFECT_LOD_LEVELS) do
		local horizontalOffset = (lodIndex - (#GM_EFFECT_LOD_LEVELS + 1) * 0.5) * spacing
		local effectPosition = centerPosition + right * horizontalOffset
		local success, effectId = pcall(function()
			return pg.game.effect:playEffectAt(0, effectName, effectPosition, nil, nil, {
				duration = duration,
				extraScale = effectScale,
				speed = playSpeed,
				forceLodLevel = lodInfo.level
			})
		end)

		if success and effectId and effectId ~= 0 then
			_gmSpecifiedEffectLodIds[#_gmSpecifiedEffectLodIds + 1] = effectId
		else
			print(string.format("[SpecifiedEffectLod] 播放失败: %s, LOD=%s(%d), error=%s", effectName, lodInfo.name, lodInfo.level, tostring(effectId)))
		end
	end

	local message = string.format("%s\n左→右：High / Mid / Low / VeryLow\n间隔=%.2fm，缩放=%.2f，速率=%.2f", effectName, spacing, effectScale, playSpeed)

	print("[SpecifiedEffectLod] " .. message)
	pg.global.ui.tips:showTextTip(message, duration)
end

function GmToolUtils.playGmEffectByInput(buttons)
	if pg.me == nil then
		return
	end

	local effectName = buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text
	local duration = tonumber(buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 5
	local loopCount = tonumber(buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0

	if not effectName or effectName == "" then
		pg.global.ui.tips:showTextTip("请输入特效名或resID")

		return
	end

	local function doPlay()
		local EffectData = require("Data.effect_data")
		local effId

		if EffectData[effectName] then
			effId = pg.game.effect:playEffectAt(0, effectName, pg.me:getPosition(), nil, nil, {
				duration = duration
			})
		else
			local resID = effectName

			if not string.find(resID, "^%$") then
				resID = "$" .. resID
			end

			if not string.find(resID, "%.prefab$") then
				resID = resID .. ".prefab"
			end

			effId = pg.game.effect:playRawEffectAt(0, resID, pg.me:getPosition(), {
				duration = duration
			})
		end

		if effId and effId ~= 0 then
			_gmEffectIds[#_gmEffectIds + 1] = effId
		end

		return effId
	end

	local effId = doPlay()

	if not effId or effId == 0 then
		pg.global.ui.tips:showTextTip("播放特效失败: " .. effectName)

		return
	end

	if loopCount > 0 then
		local played = 1

		_gmEffectLoopTimerId = TimerManager.addRepeatTimer(duration, function()
			if played >= loopCount then
				if _gmEffectLoopTimerId then
					TimerManager.removeTimer(_gmEffectLoopTimerId)

					_gmEffectLoopTimerId = nil
				end

				return
			end

			played = played + 1

			doPlay()
		end)

		pg.global.ui.tips:showTextTip("播放特效: " .. effectName .. " 循环" .. loopCount .. "次, 间隔" .. duration .. "秒")
	else
		pg.global.ui.tips:showTextTip("播放特效: " .. effectName .. " 时长" .. duration .. "秒")
	end
end

function GmToolUtils.stopAllGmEffects()
	local skillEffectCount = stopGmTemplateSkillEffectLod()
	local specifiedEffectCount = stopGmSpecifiedEffectLods()

	if _gmEffectLoopTimerId then
		TimerManager.removeTimer(_gmEffectLoopTimerId)

		_gmEffectLoopTimerId = nil
	end

	for _, effId in ipairs(_gmEffectIds) do
		pg.game.effect:stopEffect(0, effId)
	end

	local count = #_gmEffectIds + skillEffectCount + specifiedEffectCount

	_gmEffectIds = {}

	pg.global.ui.tips:showTextTip("已停止 " .. count .. " 个GM特效")
end

local function showCafePetIvUpSimTip(msg)
	if msg == nil then
		return
	end

	pg.global.ui.tips:showTextTip(msg)
end

local function getCafePetIvUpSimNumber(buttons, index, defaultValue)
	local text = getGmInputText(buttons, index)
	local value = tonumber(text)

	if value == nil then
		return defaultValue
	end

	return value
end

function GmToolUtils.debugSimulateCafePetIvUp(buttons)
	local social = pg.game.social

	if social == nil or social.petSocialBehaviorComponent == nil then
		showCafePetIvUpSimTip("Cafe pet social component not ready")

		return
	end

	local component = social.petSocialBehaviorComponent
	local propIndex = getCafePetIvUpSimNumber(buttons, 0, 1)
	local addValue = getCafePetIvUpSimNumber(buttons, 1, 1)
	local openNowValue = getCafePetIvUpSimNumber(buttons, 2, 0)
	local success, result = component:debugSimulateCafePetIvUp({
		propIndex = propIndex,
		addValue = addValue,
		openNow = openNowValue == 1
	})

	if success == true then
		showCafePetIvUpSimTip("Cafe pet IV up sim ok")

		return
	end

	showCafePetIvUpSimTip(tostring(result or "Cafe pet IV up sim failed"))
end

function GmToolUtils.getAchievementList()
	local list = {}

	for _, rule in ipairs(PlatformAchievementRuleConfig.getRules()) do
		local achievementId = rule.achievementId
		local name = rule.achievementName or "成就" .. achievementId
		local progressLabel = ""
		local achievement = PlatformAchievementService:getAchievementById(achievementId)

		if achievement then
			if achievement.progressState == "Achieved" or achievement.progressState == "Unlocked" then
				progressLabel = " [已解锁]"
			else
				local current = tonumber(achievement.currentProgressValue) or 0
				local target = tonumber(achievement.targetProgressValue) or 1

				if target > 0 then
					local pct = math.floor(current / target * 100)

					progressLabel = string.format(" [%d%%]", pct)
				end
			end
		end

		list[#list + 1] = {
			tIndex = 0,
			label = achievementId .. " " .. name .. progressLabel,
			id = achievementId,
			value = achievementId,
			iconUrl = LuaUIUtils.getIconByIconId("$ui_item_0.png")
		}
	end

	table.sort(list, function(a, b)
		return tonumber(a.value) < tonumber(b.value)
	end)

	return list
end

function GmToolUtils.clearPlatformAchievement(params)
	local achievementId = tostring(getGmInputText(params, 0) or "")

	if achievementId == "" then
		pg.global.ui.tips:showTextTip("请输入成就 ID")

		return
	end

	local platformAchievementId = PlatformAchievementService:getPlatformAchievementId(achievementId)
	local PlatformBridgeLuaFacade = CS.FunPlus.WorldX.SDK.Platform.PlatformBridgeLuaFacade

	if platformAchievementId == "" or PlatformBridgeLuaFacade == nil or PlatformBridgeLuaFacade.ClearAchievement == nil then
		pg.global.ui.tips:showTextTip("清除成就接口不可用")

		return
	end

	PlatformBridgeLuaFacade.ClearAchievement(platformAchievementId, 10000, function(success, result, message)
		if success then
			pg.global.ui.tips:showTextTip(string.format("成就[%s]清除成功", platformAchievementId))
		else
			pg.global.ui.tips:showTextTip(string.format("成就[%s]清除失败: %s (%s)", platformAchievementId, tostring(message or ""), tostring(result)))
		end
	end)
end

function GmToolUtils.showAchievements()
	local PlatformBridgeLuaFacade = CS.FunPlus.WorldX.SDK.Platform.PlatformBridgeLuaFacade

	if PlatformBridgeLuaFacade == nil or PlatformBridgeLuaFacade.ShowAchievement == nil then
		pg.global.ui.tips:showTextTip("Google 成就页面接口不可用")

		return
	end

	if not pg.global.platform:isGoogle() then
		pg.global.ui.tips:showTextTip("当前不是google渠道 ClientConfigPublishPlatform：" .. ClientConfigPublishPlatform)

		return
	end

	PlatformBridgeLuaFacade.ShowAchievement(0, function(success, result, message)
		if success then
			pg.global.ui.tips:showTextTip("Google 成就页面已打开")
		else
			pg.global.ui.tips:showTextTip(string.format("打开 Google 成就页面失败: %s (%s)", tostring(message or ""), tostring(result)))
		end
	end)
end

function GmToolUtils.unlockAchievement(selectData, params)
	local achievementId = tostring(selectData.value)
	local inputValue = tonumber(params[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 1
	local achievement = PlatformAchievementService:getAchievementById(achievementId)
	local targetValue = 1
	local existingCurrent = 0

	if achievement then
		targetValue = tonumber(achievement.targetProgressValue) or 1
		existingCurrent = tonumber(achievement.currentProgressValue) or 0

		if achievement.progressState == "Achieved" or achievement.progressState == "Unlocked" then
			pg.global.ui.tips:showTextTip(string.format("成就[%s] 已解锁，无需操作", achievementId))

			return
		end
	end

	local currentValue = math.max(0, math.min(targetValue, math.floor(inputValue)))

	if currentValue <= existingCurrent then
		pg.global.ui.tips:showTextTip(string.format("成就[%s] 无变化 (当前:%d, 输入:%d)", achievementId, existingCurrent, currentValue))

		return
	end

	PlatformAchievementService:updateAchievement(achievementId, currentValue, targetValue, function(success, result, message)
		if success then
			if currentValue >= targetValue then
				pg.global.ui.tips:showTextTip(string.format("成就[%s] 解锁成功", achievementId))
			else
				pg.global.ui.tips:showTextTip(string.format("成就[%s] 进度已设置为 %d/%d", achievementId, currentValue, targetValue))
			end
		else
			pg.global.ui.tips:showTextTip(string.format("成就[%s] 操作失败: %s", achievementId, tostring(message or "")))
		end
	end)
end

function GmToolUtils.unlockAllAchievements()
	local rules = PlatformAchievementRuleConfig.getRules()

	if not rules or #rules == 0 then
		pg.global.ui.tips:showTextTip("未找到成就配置数据")

		return
	end

	local totalCount = #rules
	local successCount = 0
	local skipCount = 0
	local failCount = 0
	local doneCount = 0

	for _, rule in ipairs(rules) do
		local achievementId = rule.achievementId
		local achievement = PlatformAchievementService:getAchievementById(achievementId)

		if achievement and (achievement.progressState == "Achieved" or achievement.progressState == "Unlocked") then
			skipCount = skipCount + 1
			doneCount = doneCount + 1

			if totalCount <= doneCount then
				if skipCount == totalCount then
					pg.global.ui.tips:showTextTip(string.format("所有 %d 个成就均已解锁，无变化", totalCount))
				else
					pg.global.ui.tips:showTextTip(string.format("解锁完成: 成功%d, 跳过%d, 失败%d (共%d)", successCount, skipCount, failCount, totalCount))
				end
			end
		else
			local targetValue = tonumber(achievement and achievement.targetProgressValue) or 1

			PlatformAchievementService:updateAchievement(achievementId, targetValue, targetValue, function(success, result, message)
				if success then
					successCount = successCount + 1
				else
					failCount = failCount + 1
				end

				doneCount = doneCount + 1

				if doneCount >= totalCount then
					pg.global.ui.tips:showTextTip(string.format("解锁完成: 成功%d, 跳过%d, 失败%d (共%d)", successCount, skipCount, failCount, totalCount))
				end
			end)
		end
	end
end

local CSGmPerfSampler = CS.FunPlus.WorldX.Utils.GmPerfSampler

function GmToolUtils.perfSnapshot()
	local snapshot = CSGmPerfSampler.GetSnapshot()

	print("[GmPerfSampler] Snapshot:\n" .. snapshot)
	pg.global.ui.tips:showTextTip("性能快照已输出到控制台")
end

function GmToolUtils.beginXChunkProfiler()
	CS.FunPlus.WorldX.Setting.VideoSetting.BeginXChunkProfiler()
	pg.global.ui.tips:showTextTip("XChunk Profiler begin")
end

function GmToolUtils.endXChunkProfiler()
	CS.FunPlus.WorldX.Setting.VideoSetting.EndXChunkProfiler()
	pg.global.ui.tips:showTextTip("XChunk Profiler end")
end

function GmToolUtils.dumpXChunkProfiler()
	CS.FunPlus.WorldX.Setting.VideoSetting.DumpXChunkProfiler("gm-dump")
	pg.global.ui.tips:showTextTip("XChunk Profiler dumped to console")
end

function GmToolUtils.startPerfRecording(buttons)
	local interval = tonumber(buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 5

	CSGmPerfSampler.StartRecording(interval)
	pg.global.ui.tips:showTextTip("性能录制已开始, 采样间隔=" .. interval .. "帧")
end

function GmToolUtils.stopPerfRecording()
	local path = CSGmPerfSampler.StopRecording()

	if path and path ~= "" then
		print("[GmPerfSampler] CSV saved: " .. path)
		pg.global.ui.tips:showTextTip("性能录制已保存: " .. path)
	else
		pg.global.ui.tips:showTextTip("没有正在进行的录制")
	end
end

local SampleUtils = require("Utils.SampleUtils")
local _batchState

local function _batchPushUwaTag(tag)
	if _batchState and _batchState.uwaSampleActive then
		SampleUtils.endSample()

		_batchState.uwaSampleActive = false
	end

	SampleUtils.beginSample(tag)

	if _batchState then
		_batchState.uwaSampleActive = true
	end
end

local function _batchPopUwaTag()
	if _batchState and _batchState.uwaSampleActive then
		SampleUtils.endSample()

		_batchState.uwaSampleActive = false
	end
end

local function _batchCleanupTimers()
	if not _batchState then
		return
	end

	if _batchState.warmupTimerId then
		TimerManager.removeTimer(_batchState.warmupTimerId)

		_batchState.warmupTimerId = nil
	end

	if _batchState.measureTimerId then
		TimerManager.removeTimer(_batchState.measureTimerId)

		_batchState.measureTimerId = nil
	end

	if _batchState.replayTimerId then
		TimerManager.removeTimer(_batchState.replayTimerId)

		_batchState.replayTimerId = nil
	end
end

local function _batchStopCurrentEffect()
	if not _batchState then
		return
	end

	if _batchState.currentEffIds then
		for _, eid in ipairs(_batchState.currentEffIds) do
			if eid and eid ~= 0 then
				pcall(function()
					pg.game.effect:stopEffect(0, eid)
				end)
			end
		end

		_batchState.currentEffIds = nil
	end

	if _batchState.currentEffId and _batchState.currentEffId ~= 0 then
		pcall(function()
			pg.game.effect:stopEffect(0, _batchState.currentEffId)
		end)

		_batchState.currentEffId = nil
	end

	CSGmPerfSampler.ClearTrackedParticles()
end

local function _uploadFailReason(err)
	local text = tostring(err or ""):gsub("[\r\n]+", " ")

	text = text:gsub("^%s+", ""):gsub("%s+$", "")

	if #text > 300 then
		text = text:sub(1, 300) .. "..."
	end

	return text ~= "" and text or "未知原因"
end

local function _batchUploadIncremental(isFinalFlush)
	if not _batchState then
		return
	end

	if not _batchState.uploadEveryN or _batchState.uploadEveryN <= 0 then
		return
	end

	local totalRows = CSGmPerfSampler.GetLastBatchRowCount()
	local lastUploaded = _batchState.lastUploadedRow or 0
	local newRows = totalRows - lastUploaded

	if newRows <= 0 then
		return
	end

	_batchState.uploadPartIdx = (_batchState.uploadPartIdx or 0) + 1

	local partIdx = _batchState.uploadPartIdx
	local partTitle = string.format("%s_part%d", _batchState.titleBase, partIdx)
	local prefix = isFinalFlush and "[GmPerfBatch][AutoUpload-Final]" or "[GmPerfBatch][AutoUpload]"

	print(string.format("%s 上传 %s rows=%d (累计%d/%d)", prefix, partTitle, newRows, totalRows, #_batchState.list))
	pg.global.ui.tips:showTextTip(string.format("自动上传分片%d (%d行)...", partIdx, newRows))

	local callOk, uploadOk = pcall(function()
		return CSGmPerfSampler.UploadBatchSliceToFeishu(_batchState.parentToken, partTitle, lastUploaded, newRows)
	end)

	if callOk and uploadOk then
		_batchState.lastUploadedRow = totalRows

		print(string.format("%s ✓ %s 上传完成", prefix, partTitle))
	else
		_batchState.uploadFailedCount = (_batchState.uploadFailedCount or 0) + 1

		local reason = callOk and "飞书服务返回失败" or _uploadFailReason(uploadOk)

		print(string.format("%s ✗ %s 上传失败(%s), 下次重试整段", prefix, partTitle, reason))
	end
end

local function _batchFinish(reason)
	if not _batchState then
		return
	end

	_batchCleanupTimers()
	_batchStopCurrentEffect()
	_batchPopUwaTag()
	SampleUtils.enableSample(false)

	if CSGmPerfSampler.IsRecording() then
		CSGmPerfSampler.StopRecording()
	end

	if _batchState.uploadEveryN and _batchState.uploadEveryN > 0 then
		_batchUploadIncremental(true)
	end

	local summaryPath = CSGmPerfSampler.CloseBatchSummary()
	local msg = string.format("批量采集%s, 汇总: %s", reason or "完成", summaryPath or "")

	print("[GmPerfBatch] " .. msg)
	pg.global.ui.tips:showTextTip(msg)

	_batchState = nil

	pcall(function()
		pg.global.ui:open(2)
	end)
end

local _batchRunNext

local function _batchMeasureCurrent()
	if _batchState then
		_batchState.measureTimerId = nil
	end

	if not _batchState or _batchState.cancelled then
		return
	end

	local item = _batchState.list[_batchState.idx]

	if not item then
		_batchFinish("完成")

		return
	end

	_batchPopUwaTag()
	CSGmPerfSampler.AppendBatchSummaryRow(item.name, item.testTime, item.testTime, item.isLoop, item.playCount, "")

	local rawPath = CSGmPerfSampler.StopRecording()

	print(string.format("[GmPerfBatch] %s 完成, 原始CSV: %s", item.name, rawPath or ""))

	if _batchState.replayTimerId then
		TimerManager.removeTimer(_batchState.replayTimerId)

		_batchState.replayTimerId = nil
	end

	_batchStopCurrentEffect()

	if _batchState.uploadEveryN and _batchState.uploadEveryN > 0 then
		local totalRows = CSGmPerfSampler.GetLastBatchRowCount()
		local lastUploaded = _batchState.lastUploadedRow or 0

		if totalRows - lastUploaded >= _batchState.uploadEveryN then
			_batchUploadIncremental(false)
		end
	end

	_batchState.idx = _batchState.idx + 1

	_batchRunNext()
end

function _batchRunNext()
	if not _batchState or _batchState.cancelled then
		return
	end

	if _batchState.idx > #_batchState.list then
		_batchFinish("完成")

		return
	end

	local item = _batchState.list[_batchState.idx]

	if not pg.me then
		_batchFinish("主角不存在")

		return
	end

	local EffectData = require("Data.effect_data")
	local pos = pg.me:getPosition()

	print(string.format("[GmPerfBatch] [%d/%d] 开始测试: %s (时长=%s isLoop=%s)", _batchState.idx, #_batchState.list, item.name, item.testTime, tostring(item.isLoop)))
	CSGmPerfSampler.ResetPeaks()
	CSGmPerfSampler.ClearTrackedParticles()
	_batchPushUwaTag("Eff_" .. item.name)

	local myIdx = _batchState.idx

	local function onLoaded(effectItem)
		if not _batchState or _batchState.idx ~= myIdx then
			return
		end

		if effectItem and effectItem.effectObj then
			CSGmPerfSampler.AddParticleRoot(effectItem.effectObj)
		end
	end

	local function playSingleInstance()
		local id

		if EffectData[item.name] then
			id = pg.game.effect:playEffectAt(0, item.name, pos, nil, nil, {
				duration = item.testTime,
				loadCallback = onLoaded
			})
		else
			local resID = item.name

			if not string.find(resID, "^%$") then
				resID = "$" .. resID
			end

			if not string.find(resID, "%.prefab$") then
				resID = resID .. ".prefab"
			end

			id = pg.game.effect:playRawEffectAt(0, resID, pos, {
				duration = item.testTime,
				loadCallback = onLoaded
			})
		end

		if id and id ~= 0 then
			_batchState.currentEffIds = _batchState.currentEffIds or {}
			_batchState.currentEffIds[#_batchState.currentEffIds + 1] = id
		end

		return id
	end

	local function playOne()
		local stackCount = _batchState.stackCount or 1
		local lastId

		for i = 1, stackCount do
			local id = playSingleInstance()

			if id and id ~= 0 then
				lastId = id
			end
		end

		return lastId
	end

	local firstId = playOne()

	if not firstId or firstId == 0 then
		print(string.format("[GmPerfBatch] [%d/%d] 播放失败: %s, 跳过", _batchState.idx, #_batchState.list, item.name))

		_batchState.idx = _batchState.idx + 1

		_batchRunNext()

		return
	end

	local stackCount = _batchState.stackCount or 1

	if stackCount > 1 then
		print(string.format("[GmPerfBatch]   叠播 stackCount=%d (并发%d个实例)", stackCount, stackCount))
	end

	local playCount = tonumber(item.playCount) or 1

	if not item.isLoop and playCount > 1 then
		local replayInterval = item.testTime / playCount
		local remaining = playCount - 1

		print(string.format("[GmPerfBatch]   非循环+playCount=%d, 每 %.2fs 重播一次 (每次%d个并发实例, 共%d个)", playCount, replayInterval, stackCount, playCount * stackCount))

		_batchState.replayTimerId = TimerManager.addRepeatTimer(replayInterval, function()
			if not _batchState or _batchState.cancelled then
				return
			end

			if remaining <= 0 then
				if _batchState.replayTimerId then
					TimerManager.removeTimer(_batchState.replayTimerId)

					_batchState.replayTimerId = nil
				end

				return
			end

			remaining = remaining - 1

			playOne()
		end)
	end

	CSGmPerfSampler.StartRecording(_batchState.interval)

	_batchState.measureTimerId = TimerManager.addTimer(item.testTime, _batchMeasureCurrent)
end

function GmToolUtils.stopEffectBatchPerfTest()
	if not _batchState then
		pg.global.ui.tips:showTextTip("没有正在进行的批量采集")

		return
	end

	_batchState.cancelled = true

	_batchFinish("已停止")
end

function GmToolUtils.runEffectBatchPerfTestFromFeishu(buttons)
	if _batchState then
		pg.global.ui.tips:showTextTip("批量采集已在进行中, 请先停止")

		return
	end

	if pg.me == nil then
		pg.global.ui.tips:showTextTip("主角未就绪")

		return
	end

	local sheetIndex = tonumber(buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 0
	local testTime = tonumber(buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 10
	local interval = tonumber(buttons[2]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 5
	local stackCount = tonumber(buttons[3]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 1

	if stackCount < 1 then
		stackCount = 1
	end

	local uploadEveryN = tonumber(buttons[4]:GetChild("InputField"):GetComponent("UTMPInputField").text) or 500

	if uploadEveryN < 0 then
		uploadEveryN = 0
	end

	if uploadEveryN > 4500 then
		uploadEveryN = 4500
	end

	local autoParentToken = buttons[5]:GetChild("InputField"):GetComponent("UTMPInputField").text

	if not autoParentToken or autoParentToken == "" then
		autoParentToken = "Vvcmw2aMNiTYnlkFn2RctTfhnOc"
	end

	local autoTitleBase = buttons[6]:GetChild("InputField"):GetComponent("UTMPInputField").text or ""

	if autoTitleBase == "" then
		autoTitleBase = "特效性能_" .. os.date("%Y%m%d_%H%M%S")
	end

	print(string.format("[GmPerfBatch] 从飞书表读取, sheetIndex=%d, testTime=%ds, stack=%d, 自动上传每%d个(0=不传)", sheetIndex, testTime, stackCount, uploadEveryN))

	if uploadEveryN > 0 then
		print(string.format("[GmPerfBatch]   autoParent=%s, autoTitle=%s", autoParentToken, autoTitleBase))
	end

	local res = CS.FunPlus.WorldX.Utils.GmToolUtils.GetPerformanceParameters(sheetIndex)

	if not res or res == "" then
		local msg = "飞书表读取失败或为空, sheetIndex=" .. sheetIndex .. " (注意: 仅编辑器可用)"

		print("[GmPerfBatch] " .. msg)
		pg.global.ui.tips:showTextTip(msg)

		return
	end

	local list = {}

	for line in string.gmatch(res, "[^\r\n]+") do
		local trimmed = line:gsub("^%s*(.-)%s*$", "%1")

		if trimmed ~= "" and not string.match(trimmed, "^#") then
			local cols = {}

			for col in string.gmatch(trimmed, "([^\t]*)\t?") do
				cols[#cols + 1] = col:gsub("^%s*(.-)%s*$", "%1")

				if #cols >= 4 then
					break
				end
			end

			local effectName = cols[1] or ""

			if effectName ~= "" and not string.find(effectName, "特效名") and not string.find(effectName, "effectName") and not string.find(effectName:lower(), "^name$") then
				local rowTestTime = tonumber(cols[2]) or testTime
				local rowIsLoopStr = (cols[3] or "FALSE"):upper()
				local rowIsLoop = rowIsLoopStr == "TRUE" or rowIsLoopStr == "1"
				local rowPlayCount = tonumber(cols[4]) or 1

				list[#list + 1] = {
					name = effectName,
					testTime = rowTestTime,
					isLoop = rowIsLoop,
					playCount = rowPlayCount
				}
			end
		end
	end

	if #list == 0 then
		pg.global.ui.tips:showTextTip("飞书表中没解析出有效特效名")

		return
	end

	print(string.format("[GmPerfBatch] 飞书表解析出%d个特效:", #list))

	for i, item in ipairs(list) do
		print(string.format("  [%d] %s", i, item.name))
	end

	local summaryPath = CSGmPerfSampler.OpenBatchSummary()

	_batchState = {
		uploadPartIdx = 0,
		cancelled = false,
		lastUploadedRow = 0,
		uwaSampleActive = false,
		uploadFailedCount = 0,
		idx = 1,
		list = list,
		interval = interval,
		stackCount = stackCount,
		summaryPath = summaryPath,
		uploadEveryN = uploadEveryN,
		parentToken = autoParentToken,
		titleBase = autoTitleBase
	}

	print(string.format("[GmPerfBatch] 开始, 共%d个特效, 采样间隔=%d帧, 叠播并发=%d, 汇总CSV: %s", #list, interval, stackCount, summaryPath))
	SampleUtils.enableSample(true)
	pcall(function()
		pg.global.ui:close(2)
	end)

	local baselineTime = 3

	pg.global.ui.tips:showTextTip(string.format("采集基线中(%ds)...共%d个特效待测", baselineTime, #list))
	_batchPushUwaTag("Baseline")
	CSGmPerfSampler.StartBaseline()

	_batchState.warmupTimerId = TimerManager.addTimer(baselineTime, function()
		_batchState.warmupTimerId = nil

		if not _batchState or _batchState.cancelled then
			return
		end

		_batchPopUwaTag()
		CSGmPerfSampler.FinishBaseline()

		local blInfo = CSGmPerfSampler.GetBaselineInfo()

		print("[GmPerfBatch] 基线: " .. blInfo)
		pg.global.ui.tips:showTextTip("基线采集完成, 开始测试特效")
		_batchRunNext()
	end)
end

local _parmonPerfState, _parmonRunNext, _parmonPrimeFirstTarget, _parmonFinish
local PARMON_BENCHMARK_AFK_TIMEOUT = 259200

local function _parmonBeginNoAfk(state)
	local previous = CS.FunPlus.WorldX.ControllerData.EnterAfkTime

	state.afkTimeBeforeBenchmark = previous
	state.afkRestorePending = true
	CS.FunPlus.WorldX.ControllerData.EnterAfkTime = PARMON_BENCHMARK_AFK_TIMEOUT

	pcall(function()
		ClientUtils.exitAfkMode()
	end)
	pcall(function()
		ClientUtils.exitAfkActionState()
	end)
	print(string.format("[ParmonGpuPerf] 采集期间已屏蔽挂机模式：EnterAfkTime=%.0fs", PARMON_BENCHMARK_AFK_TIMEOUT))

	return previous
end

local function _parmonRestoreAfk()
	if not _parmonPerfState or not _parmonPerfState.afkRestorePending then
		return
	end

	local previous = _parmonPerfState.afkTimeBeforeBenchmark

	CS.FunPlus.WorldX.ControllerData.EnterAfkTime = previous
	_parmonPerfState.afkRestorePending = false

	print(string.format("[ParmonGpuPerf] 已恢复挂机超时：EnterAfkTime=%.1fs", previous))
end

local PARMON_PERF_FEISHU_TARGETS = {
	PC = {
		label = "PC",
		token = "LQPFwFpXJiU9Pdko6jPcCdxqn5b"
	},
	Android = {
		label = "Android",
		token = "L0kTwY6BjioJ7fkq5NscXTylngf"
	},
	iOS = {
		label = "iOS",
		token = "JVP1wukLCiDFr7kyGy0cvnYInTe"
	}
}

local function _parmonResolveFeishuTarget()
	local applicationPlatform = tostring(CS.UnityEngine.Application.platform)
	local renderPlatform

	pcall(function()
		renderPlatform = tostring(CS.XRender.Pipeline.Config.XRenderPlatforms.GetCurrentWithPreview())
	end)

	local platform = renderPlatform or applicationPlatform

	local function containsPlatform(value, name)
		return type(value) == "string" and string.find(value, name, 1, true) ~= nil
	end

	if containsPlatform(platform, "Android") or containsPlatform(applicationPlatform, "Android") then
		return PARMON_PERF_FEISHU_TARGETS.Android
	end

	if containsPlatform(platform, "IOS") or containsPlatform(platform, "IPhonePlayer") or containsPlatform(applicationPlatform, "IPhonePlayer") then
		return PARMON_PERF_FEISHU_TARGETS.iOS
	end

	return PARMON_PERF_FEISHU_TARGETS.PC
end

local function _parmonTrim(value)
	return (tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", ""))
end

local function _parmonCollectRuntimeResources(resourceText)
	local list = {}
	local seen = {}
	local nativeCount = 0
	local dataCount = 0
	local rowTypes = {
		table = 0,
		userdata = 0
	}
	local otherRowCount = 0
	local candidateCount = 0
	local missingModelCount = 0

	local function add(resourceId, source)
		if type(resourceId) ~= "string" or resourceId == "" or seen[resourceId] then
			return
		end

		seen[resourceId] = true
		list[#list + 1] = resourceId

		if source == "native" then
			nativeCount = nativeCount + 1
		else
			dataCount = dataCount + 1
		end
	end

	for resourceId in string.gmatch(resourceText or "", "[^\r\n]+") do
		add(resourceId, "native")
	end

	for _, petConfig in pairs(PetBasePrototypeData) do
		local configType = type(petConfig)
		local readable = configType == "table" or configType == "userdata"

		if readable then
			rowTypes[configType] = rowTypes[configType] + 1
		else
			otherRowCount = otherRowCount + 1
		end

		local sourceId = readable and petConfig.prefabResID or nil

		if type(sourceId) == "string" and string.match(sourceId, "^%$P_Parmon_.+%.prefab$") then
			candidateCount = candidateCount + 1

			local exportedId = string.gsub(sourceId, "^%$P_Parmon_", "$E_P_Parmon_", 1)

			if ModelPrefabResId2AvatarName[exportedId] then
				add(exportedId, "data")
			else
				missingModelCount = missingModelCount + 1
			end
		end
	end

	table.sort(list)
	print(string.format("[ParmonGpuPerf] 运行时 Common 列表：%d（资源表=%d，PetBasePrototypeData回退=%d）", #list, nativeCount, dataCount))
	print(string.format("[ParmonGpuPerf] 回退诊断：table行=%d，userdata行=%d，其他行=%d，候选行=%d，模型映射未匹配行=%d", rowTypes.table, rowTypes.userdata, otherRowCount, candidateCount, missingModelCount))

	return list
end

local function _parmonBuildResourceSelection(allResources, requestedIds, startIndex, requestedCount)
	requestedIds = _parmonTrim((requestedIds or ""):gsub("，", ","))

	if requestedIds ~= "" then
		local byKey = {}

		for _, resourceId in ipairs(allResources) do
			local modelId = string.match(resourceId, "[Pp]_Parmon_(.+)%.prefab$")
			local aliases = {
				resourceId
			}

			if modelId and modelId ~= "" then
				aliases[#aliases + 1] = modelId
				aliases[#aliases + 1] = "P_Parmon_" .. modelId
				aliases[#aliases + 1] = "P_Parmon_" .. modelId .. ".prefab"
				aliases[#aliases + 1] = "E_P_Parmon_" .. modelId .. ".prefab"
				aliases[#aliases + 1] = "$E_P_Parmon_" .. modelId .. ".prefab"
			end

			for _, alias in ipairs(aliases) do
				byKey[string.lower(alias)] = resourceId
			end
		end

		local list = {}
		local selected = {}
		local missing = {}
		local seen = {}

		for token in string.gmatch(requestedIds, "[^,;%s]+") do
			local normalized = _parmonTrim(token)
			local resourceId = byKey[string.lower(normalized)]

			if resourceId then
				if not seen[resourceId] then
					list[#list + 1] = resourceId
					selected[#selected + 1] = normalized
					seen[resourceId] = true
				end
			else
				missing[#missing + 1] = normalized
			end
		end

		if #missing > 0 then
			print("[ParmonGpuPerf] 未找到指定 Parmon: " .. table.concat(missing, ", "))
		end

		if #list == 0 then
			return nil, nil, "指定的 Parmon ID 均未找到"
		end

		return list, "指定ID=" .. table.concat(selected, ","), nil
	end

	if startIndex > #allResources then
		return nil, nil, string.format("起始序号%d超过资源总数%d", startIndex, #allResources)
	end

	local endIndex = #allResources

	if requestedCount > 0 then
		endIndex = math.min(endIndex, startIndex + requestedCount - 1)
	end

	local list = {}

	for i = startIndex, endIndex do
		list[#list + 1] = allResources[i]
	end

	return list, string.format("序号=%d..%d", startIndex, endIndex), nil
end

local function _parmonBuildCompositeSelection(templateId)
	local suitsData = require("Data.pet_transmog_suits_data")
	local slotsData = require("Data.pet_transmog_solt_data")

	if not PetData[templateId] then
		return nil, nil, string.format("宠物模板%d不存在", templateId)
	end

	local suits = suitsData[templateId]

	if not suits then
		return nil, nil, string.format("模板%d不存在幻化套装配置", templateId)
	end

	local suitIds = {}

	for key, _ in pairs(suits) do
		local id = tonumber(key)

		if not id then
			return nil, nil, string.format("模板%d包含无效套装ID %s", templateId, tostring(key))
		end

		suitIds[#suitIds + 1] = {
			key = key,
			id = id
		}
	end

	table.sort(suitIds, function(a, b)
		return a.id < b.id
	end)

	if #suitIds ~= 5 then
		return nil, nil, string.format("模板%d套装数量为%d，要求正好5套", templateId, #suitIds)
	end

	local colorType = Const.PetTransmogSlotType.Color
	local colors, seen = {}, {}

	for slotId, slot in pairs(slotsData) do
		local resource = _parmonTrim(slot.resources)
		local numericSlotId = tonumber(slotId)

		if slot.type == colorType and tostring(slot.petId) == tostring(templateId) and numericSlotId and resource ~= "" and not seen[resource] then
			seen[resource] = true
			colors[#colors + 1] = {
				slotId = numericSlotId,
				resource = resource
			}
		end
	end

	table.sort(colors, function(a, b)
		return a.slotId < b.slotId
	end)

	if #colors < 2 then
		return nil, nil, string.format("模板%d去重后颜色资源不足2个", templateId)
	end

	local selected = {
		colors[1],
		colors[#colors]
	}
	local labels, entries, desc = {}, {}, {}
	local templateLabel = tostring(PetData[templateId].resId or templateId)
	local partTypes = {
		Const.PetTransmogSlotType.Wing,
		Const.PetTransmogSlotType.Body,
		Const.PetTransmogSlotType.Hair
	}

	for _, suitInfo in ipairs(suitIds) do
		local parts = suits[suitInfo.key] or suits[suitInfo.id]

		if not parts then
			return nil, nil, string.format("模板%d套装%d配置为空", templateId, suitInfo.id)
		end

		local holeIds = {}

		for _, slotType in ipairs(partTypes) do
			local slotId = parts[slotType]
			local slot = slotsData[slotId]

			if not slot or slot.type ~= slotType or tostring(slot.petId) ~= tostring(templateId) or _parmonTrim(slot.resources) == "" then
				return nil, nil, string.format("模板%d套装%d的部位%d配置无效", templateId, suitInfo.id, slotType)
			end

			holeIds[slotType] = slotId
		end

		for _, color in ipairs(selected) do
			holeIds[colorType] = color.slotId

			local label = string.format("Parmon_%s_Composite_Suit%d_Color%d_%s", templateLabel, suitInfo.id, color.slotId, color.resource)

			labels[#labels + 1] = label
			entries[#entries + 1] = {
				label = label,
				templateId = templateId,
				suitId = suitInfo.id,
				colorSlotId = color.slotId,
				colorResource = color.resource,
				holeIds = {
					[colorType] = color.slotId,
					[partTypes[1]] = holeIds[partTypes[1]],
					[partTypes[2]] = holeIds[partTypes[2]],
					[partTypes[3]] = holeIds[partTypes[3]]
				}
			}
			desc[#desc + 1] = string.format("suit%d/%d(%s)", suitInfo.id, color.slotId, color.resource)
		end
	end

	return labels, entries, table.concat(desc, ", ")
end

local function _parmonInputText(buttons, index)
	return buttons[index]:GetChild("InputField"):GetComponent("UTMPInputField").text or ""
end

local function _parmonSafeCall(label, callback)
	local ok, result = xpcall(callback, debug.traceback)

	if not ok then
		print("[ParmonGpuPerf] " .. tostring(label) .. "异常：" .. tostring(result))
	end

	return ok, result
end

local function _parmonRunCallback(label, callback)
	local ok, result = xpcall(callback, debug.traceback)

	if not ok then
		print("[ParmonGpuPerf] 回调异常：" .. tostring(label) .. "，" .. tostring(result))

		if _parmonPerfState and not _parmonPerfState.finishing and _parmonFinish then
			_parmonFinish("异常终止：" .. tostring(label))
		end
	end

	return ok, result
end

local function _parmonGuardCallback(label, callback)
	local unpackArgs = table.unpack or unpack

	return function(...)
		local args = {
			...
		}
		local ok, err = _parmonRunCallback(label, function()
			callback(unpackArgs(args))
		end)
	end
end

local function _parmonAddTimer(fieldName, delay, label, callback)
	if not _parmonPerfState then
		return nil
	end

	local timerId = TimerManager.addTimer(delay, _parmonGuardCallback(label, callback))

	_parmonPerfState[fieldName] = timerId

	return timerId
end

local function _parmonRemoveTimer(fieldName)
	if not _parmonPerfState then
		return
	end

	local timerId = _parmonPerfState[fieldName]

	if timerId then
		_parmonSafeCall("移除计时器 " .. tostring(fieldName), function()
			TimerManager.removeTimer(timerId)
		end)

		_parmonPerfState[fieldName] = nil
	end
end

local function _parmonCleanupTimers()
	_parmonRemoveTimer("baselineTimerId")
	_parmonRemoveTimer("loadTimeoutTimerId")
	_parmonRemoveTimer("modelReadyTimerId")
	_parmonRemoveTimer("warmupTimerId")
	_parmonRemoveTimer("measureTimerId")
	_parmonRemoveTimer("nextTimerId")
end

local function _parmonReleaseCurrent()
	if not _parmonPerfState then
		return
	end

	_parmonSafeCall("清理相机目标", function()
		CSGmPerfSampler.ClearParmonBenchmarkTarget()
	end)
	_parmonSafeCall("清理粒子跟踪", function()
		CSGmPerfSampler.ClearTrackedParticles()
	end)

	if _parmonPerfState.mode == "composite" then
		_parmonRemoveTimer("modelReadyTimerId")
		_parmonRemoveTimer("loadTimeoutTimerId")

		local entity = _parmonPerfState.currentEntity

		_parmonPerfState.currentEntity = nil

		if entity then
			_parmonSafeCall("解除动态模型回调", function()
				entity.modelLoadedCallback = nil
			end)
			pcall(function()
				ClientUtils.safeDestroy(entity, true)
			end)
		end

		_parmonPerfState.currentGo = nil

		return
	end

	if _parmonPerfState.loadTaskId then
		pcall(function()
			pg.global.resMgr:TryCancelGOLoadAsyncTask(_parmonPerfState.loadTaskId)
		end)

		_parmonPerfState.loadTaskId = nil
	end

	if _parmonPerfState.currentGo and not IsNil(_parmonPerfState.currentGo) then
		pcall(function()
			pg.global.resMgr:RemoveInstanceToCache(_parmonPerfState.currentGo, true)
		end)
	end

	_parmonPerfState.currentGo = nil
end

local function _parmonUploadPending(isFinal)
	if not isFinal or not _parmonPerfState or not _parmonPerfState.uploadEnabled then
		return
	end

	if not _parmonPerfState.parentToken or _parmonPerfState.parentToken == "" then
		return
	end

	local rowCount = CSGmPerfSampler.GetLastBatchRowCount()

	if rowCount <= 0 then
		print("[ParmonGpuPerf] 没有有效数据行，跳过飞书表创建")

		return
	end

	local title = _parmonPerfState.titleBase

	_parmonPerfState.uploadAttempted = true

	print(string.format("[ParmonGpuPerf] 结束后合并上传飞书: %s, rows=%d", title, rowCount))

	local callOk, uploadOk = pcall(function()
		return CSGmPerfSampler.UploadBatchSliceToFeishu(_parmonPerfState.parentToken, title, 0, rowCount)
	end)

	if callOk and uploadOk then
		_parmonPerfState.uploadSucceeded = true

		print(string.format("[ParmonGpuPerf] 飞书单表上传成功: %s", title))
	else
		_parmonPerfState.uploadFailureCount = (_parmonPerfState.uploadFailureCount or 0) + 1
		_parmonPerfState.uploadError = callOk and "飞书服务返回失败" or _uploadFailReason(uploadOk)

		print(string.format("[ParmonGpuPerf] 飞书单表上传失败: %s，原因: %s，数据仍保留在本地 CSV", title, _parmonPerfState.uploadError))
	end
end

function _parmonFinish(reason)
	local state = _parmonPerfState

	if not state or state.finishing then
		return
	end

	state.finishing = true

	_parmonSafeCall("恢复挂机阈值", _parmonRestoreAfk)
	_parmonSafeCall("清理采集计时器", _parmonCleanupTimers)
	_parmonSafeCall("停止 GPU 录制", function()
		CSGmPerfSampler.StopRecording()
	end)
	_parmonSafeCall("释放当前目标", _parmonReleaseCurrent)
	_parmonSafeCall("上传批量结果", function()
		_parmonUploadPending(true)
	end)

	local summaryPath = state.summaryPath or ""
	local gpuSource = "unknown"
	local closeOk, closePath = _parmonSafeCall("关闭批量汇总", function()
		return CSGmPerfSampler.CloseBatchSummary()
	end)

	summaryPath = closeOk and closePath or summaryPath

	local sourceOk, sourceValue = _parmonSafeCall("读取 GPU 计时来源", function()
		return CSGmPerfSampler.GetGpuTimingStatus()
	end)

	gpuSource = sourceOk and sourceValue or gpuSource

	_parmonSafeCall("结束采集相机", function()
		CSGmPerfSampler.EndParmonBenchmarkCamera()
	end)

	local completed = state.completed or 0
	local total = state.list and #state.list or 0
	local uploadFailures = state.uploadFailureCount or 0
	local notifyEmail = state.notifyEmail or ""
	local parentToken = state.parentToken or ""
	local platformLabel = state.platformLabel or "PC"
	local titleBase = state.titleBase or ""
	local uploadEnabled = state.uploadEnabled and parentToken ~= ""
	local uploadAttempted = state.uploadAttempted or false
	local uploadSucceeded = state.uploadSucceeded or false
	local uploadError = state.uploadError or ""

	_parmonPerfState = nil

	local msg = string.format("Parmon GPU 采集%s：%d/%d，平台=%s，GPU=%s，上传失败=%d，CSV=%s", reason or "完成", completed, total, platformLabel, gpuSource, uploadFailures, summaryPath or "")

	if notifyEmail ~= "" then
		local uploadText = "未上传飞书表"

		if uploadEnabled then
			uploadText = uploadSucceeded and "飞书单表上传成功" or uploadAttempted and "飞书单表上传失败，数据已保留在本地 CSV" or "无有效数据行，未创建飞书表"
		end

		local notifyMessage = string.format("Parmon GPU 批量采集%s\n平台：%s\n完成：%d/%d\nGPU来源：%s\n%s", reason or "完成", platformLabel, completed, total, gpuSource, uploadText)

		if uploadEnabled and uploadSucceeded then
			notifyMessage = notifyMessage .. string.format("\n表格标题：%s\n飞书文档：https://funplus.feishu.cn/wiki/%s", titleBase, parentToken)
		elseif uploadEnabled and uploadAttempted then
			notifyMessage = notifyMessage .. "\n结果未上传飞书，请使用本地 CSV；不要使用旧的飞书链接。"
			notifyMessage = notifyMessage .. "\n失败原因：" .. _uploadFailReason(uploadError)
		end

		local callOk, queued = pcall(function()
			return CSGmPerfSampler.SendXRobotNotification(notifyEmail, notifyMessage)
		end)

		if not callOk or not queued then
			print("[ParmonGpuPerf] XRobot 通知未入队，不影响采集结果")
		end
	end

	print("[ParmonGpuPerf] " .. msg)
	pcall(function()
		pg.global.ui.tips:showTextTip(msg)
	end)
	pcall(function()
		pg.global.ui:open(2)
	end)
end

local function _parmonAdvance(reason)
	if not _parmonPerfState then
		return
	end

	if reason then
		print(string.format("[ParmonGpuPerf] [%d/%d] 跳过：%s", _parmonPerfState.index, #_parmonPerfState.list, reason))
	end

	_parmonRemoveTimer("loadTimeoutTimerId")
	_parmonRemoveTimer("modelReadyTimerId")
	_parmonRemoveTimer("warmupTimerId")
	_parmonRemoveTimer("measureTimerId")
	_parmonReleaseCurrent()

	_parmonPerfState.preBaselineRetryCount = 0
	_parmonPerfState.postBaselineRetryCount = 0
	_parmonPerfState.index = _parmonPerfState.index + 1

	_parmonAddTimer("nextTimerId", 0.2, "进入下一个 Parmon", function()
		if not _parmonPerfState then
			return
		end

		_parmonPerfState.nextTimerId = nil

		_parmonRunNext()
	end)
end

local function _parmonCommitCurrentResult(measuredIndex, resourceId, rawPath, baselineNote)
	if not _parmonPerfState or _parmonPerfState.index ~= measuredIndex then
		return
	end

	CSGmPerfSampler.AppendBatchSummaryRow(resourceId, _parmonPerfState.duration, _parmonPerfState.duration, true, 1, rawPath or "")

	_parmonPerfState.completed = (_parmonPerfState.completed or 0) + 1

	print(string.format("[ParmonGpuPerf] [%d/%d] 完成 %s，原始CSV=%s，配对基线=%s%s", _parmonPerfState.index, #_parmonPerfState.list, resourceId, rawPath or "", CSGmPerfSampler.GetBaselineInfo(), baselineNote or ""))
	_parmonAdvance()
end

local function _parmonStartPostBaseline(measuredIndex, resourceId, rawPath)
	if not _parmonPerfState or _parmonPerfState.index ~= measuredIndex then
		return
	end

	_parmonAddTimer("warmupTimerId", 1, "后置基线预热", function()
		if not _parmonPerfState or _parmonPerfState.index ~= measuredIndex then
			return
		end

		_parmonPerfState.warmupTimerId = nil

		CSGmPerfSampler.StartBaseline()
		_parmonAddTimer("baselineTimerId", 3, "后置基线采样", function()
			if not _parmonPerfState or _parmonPerfState.index ~= measuredIndex then
				return
			end

			_parmonPerfState.baselineTimerId = nil

			CSGmPerfSampler.FinishBaseline()

			if not CSGmPerfSampler.IsBaselineReady() then
				local retryCount = (_parmonPerfState.postBaselineRetryCount or 0) + 1

				_parmonPerfState.postBaselineRetryCount = retryCount

				if retryCount <= 1 then
					print(string.format("[ParmonGpuPerf] [%d/%d] 后置基线无效，自动重试 %s", measuredIndex, #_parmonPerfState.list, resourceId))
					_parmonStartPostBaseline(measuredIndex, resourceId, rawPath)
				else
					print(string.format("[ParmonGpuPerf] [%d/%d] 后置基线连续无效，保留诊断行 %s", measuredIndex, #_parmonPerfState.list, resourceId))
					_parmonCommitCurrentResult(measuredIndex, resourceId, rawPath, "（后置基线无效，数据标记为无效）")
				end

				return
			end

			_parmonPerfState.postBaselineRetryCount = 0

			if not CSGmPerfSampler.IsLastRecordingRenderValid() then
				print(string.format("[ParmonGpuPerf] [%d/%d] GPU样本或配对基线无效，保留诊断行 %s", measuredIndex, #_parmonPerfState.list, resourceId))
			end

			_parmonCommitCurrentResult(measuredIndex, resourceId, rawPath)
		end)
	end)
end

local function _parmonMeasureCurrent()
	if not _parmonPerfState or _parmonPerfState.cancelled then
		return
	end

	_parmonPerfState.measureTimerId = nil

	local resourceId = _parmonPerfState.list[_parmonPerfState.index]

	if not resourceId then
		_parmonFinish("完成")

		return
	end

	local rawPath = CSGmPerfSampler.StopRecording()
	local measuredIndex = _parmonPerfState.index

	_parmonReleaseCurrent()
	_parmonStartPostBaseline(measuredIndex, resourceId, rawPath)
end

local function _parmonCreateCompositeTarget(currentIndex, entry, onReady)
	if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
		return
	end

	local state = _parmonPerfState
	local ent, finished, refreshed, transmogApplied = nil, false, false, false
	local targetPrepared, transmogPosePrepared, validationAttempts = false, false, 0

	local function isCurrent()
		return _parmonPerfState == state and not state.cancelled and state.index == currentIndex and state.currentEntity == ent
	end

	local function finish(ok, reason)
		if finished or not isCurrent() then
			return
		end

		finished = true

		if ent then
			_parmonSafeCall("解除动态模型加载回调", function()
				ent.modelLoadedCallback = nil
			end)
		end

		_parmonRemoveTimer("modelReadyTimerId")
		_parmonRemoveTimer("loadTimeoutTimerId")
		onReady(ok, reason)
	end

	local function tryReady()
		if finished or not isCurrent() then
			return true
		end

		if not refreshed or not ent.isModelLoaded or ent.isWaitTransmogCallback then
			return false
		end

		local modelRoot = ent.eModel and ent.eModel.modelRoot and ent.eModel.modelRoot.gameObject

		if not modelRoot or IsNil(modelRoot) then
			return false
		end

		if not targetPrepared then
			if not transmogPosePrepared then
				if ent.onTransmogAnimatorReady then
					pcall(function()
						ent:onTransmogAnimatorReady()
					end)
				end

				if ent.playRawAnimation then
					ent:playRawAnimation("Idle")
				end

				ent:setLodTickEnable(Const.LOD_TICK_KEY.BOSS_COMBAT, false)

				transmogPosePrepared = true

				return false
			end

			if not CSGmPerfSampler.SetParmonBenchmarkTargetStableRootAnchor(modelRoot) then
				return false
			end

			CSGmPerfSampler.SetParmonBenchmarkTargetVerticalOffset(state.verticalOffset or 0)

			targetPrepared = true
		end

		if not CSGmPerfSampler.ValidateParmonBenchmarkTarget() then
			validationAttempts = validationAttempts + 1

			if validationAttempts <= 20 then
				if validationAttempts == 1 or validationAttempts == 10 then
					print(string.format("[ParmonGpuPerf] 动态目标校验重试 %d/20 %s", validationAttempts, entry.label))
				end

				return false
			end

			finish(false, "动态幻化目标校验失败（3份复制不可见或 Bounds 无效） " .. tostring(entry.label))

			return true
		end

		CSGmPerfSampler.AddParticleRoot(modelRoot)
		print(string.format("[ParmonGpuPerf] 动态模型已加载，StableRootAnchorV1，3份复制目标校验通过 %s", entry.label))
		finish(true)

		return true
	end

	local ok, err = xpcall(function()
		local PetTransmogUtils = require("GameApp.PetTransmog.PetTransmogUtils")
		local ClientSimpleVirtualPet = require("Entities.ClientSimpleVirtualPet")
		local transmogData, shinyEffectId = PetTransmogUtils.getSchemeTransmogData(entry.templateId, {
			holeIds = entry.holeIds
		})

		if not transmogData then
			error("getSchemeTransmogData返回空数据")
		end

		ent = ClientSimpleVirtualPet.new()
		state.currentEntity = ent
		ent.modelLoadedCallback = _parmonGuardCallback("动态模型加载", function()
			if not finished and isCurrent() and transmogApplied then
				refreshed = true
			end
		end)

		local initInfo = {
			templateId = entry.templateId
		}

		ent:init(initInfo)
		ent:postInit(initInfo)
		ent:start()
		ent:setModelLayer(ClientConst.LayerDefine.LAYER_ENTITY)

		ent.isModelLoaded = false
		transmogApplied = true

		ent:setTransmogData(transmogData, shinyEffectId)
	end, debug.traceback)

	if not ok then
		finish(false, "动态幻化实体创建失败 " .. tostring(err))

		return
	end

	local pollReady

	function pollReady()
		if finished or not isCurrent() then
			return
		end

		state.modelReadyTimerId = nil

		local callOk, ready = xpcall(tryReady, debug.traceback)

		if not callOk then
			finish(false, "动态幻化目标准备失败 " .. tostring(ready))
		elseif not ready and not finished and isCurrent() then
			_parmonAddTimer("modelReadyTimerId", 0.1, "动态模型准备轮询", pollReady)
		end
	end

	_parmonAddTimer("modelReadyTimerId", 0.1, "动态模型准备轮询", pollReady)
	_parmonAddTimer("loadTimeoutTimerId", 30, "动态模型加载超时", function()
		if not isCurrent() or finished then
			return
		end

		finish(false, "模型加载超时 " .. tostring(entry.label))
	end)
end

local function _parmonStartCompositeCurrent(currentIndex)
	local entry = _parmonPerfState and _parmonPerfState.entries and _parmonPerfState.entries[currentIndex]

	if not entry then
		_parmonAdvance("动态幻化组合描述缺失")

		return
	end

	CSGmPerfSampler.ResetPeaks()
	CSGmPerfSampler.ClearTrackedParticles()
	print(string.format("[ParmonGpuPerf] [%d/%d] 加载动态幻化 %s", currentIndex, #_parmonPerfState.list, entry.label))
	_parmonCreateCompositeTarget(currentIndex, entry, function(ok, reason)
		if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
			return
		end

		if not ok then
			_parmonAdvance(reason)

			return
		end

		_parmonAddTimer("warmupTimerId", _parmonPerfState.warmup, "动态模型预热", function()
			if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
				return
			end

			_parmonPerfState.warmupTimerId = nil

			CSGmPerfSampler.StartRecording(_parmonPerfState.interval)
			_parmonAddTimer("measureTimerId", _parmonPerfState.duration, "动态模型采样结束", _parmonMeasureCurrent)
		end)
	end)
end

function _parmonRunNext()
	if not _parmonPerfState or _parmonPerfState.cancelled then
		return
	end

	if _parmonPerfState.index > #_parmonPerfState.list then
		_parmonFinish("完成")

		return
	end

	local currentIndex = _parmonPerfState.index
	local resourceId = _parmonPerfState.list[currentIndex]

	if _parmonPerfState.preBaselineIndex ~= currentIndex then
		print(string.format("[ParmonGpuPerf] [%d/%d] 采集前置空场基线 %s", currentIndex, #_parmonPerfState.list, resourceId))

		local settleTime = currentIndex == 1 and 3 or 1

		_parmonAddTimer("warmupTimerId", settleTime, "前置基线预热", function()
			if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
				return
			end

			_parmonPerfState.warmupTimerId = nil

			CSGmPerfSampler.StartBaseline()
			_parmonAddTimer("baselineTimerId", 3, "前置基线采样", function()
				if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
					return
				end

				_parmonPerfState.baselineTimerId = nil

				CSGmPerfSampler.FinishBaseline()

				if not CSGmPerfSampler.IsBaselineReady() then
					local retryCount = (_parmonPerfState.preBaselineRetryCount or 0) + 1

					_parmonPerfState.preBaselineRetryCount = retryCount

					if retryCount <= 1 then
						print(string.format("[ParmonGpuPerf] [%d/%d] 前置基线无效，自动重试 %s", currentIndex, #_parmonPerfState.list, resourceId))
						_parmonAddTimer("nextTimerId", 0.25, "前置基线重试", function()
							if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
								return
							end

							_parmonPerfState.nextTimerId = nil

							_parmonRunNext()
						end)
					else
						print(string.format("[ParmonGpuPerf] [%d/%d] 前置基线连续无效，继续采集并在结果中标记无效 %s", currentIndex, #_parmonPerfState.list, resourceId))

						_parmonPerfState.preBaselineRetryCount = 0
						_parmonPerfState.preBaselineIndex = currentIndex

						_parmonRunNext()
					end

					return
				end

				_parmonPerfState.preBaselineRetryCount = 0
				_parmonPerfState.preBaselineIndex = currentIndex

				print("[ParmonGpuPerf] 前置基线完成：" .. CSGmPerfSampler.GetBaselineInfo())
				_parmonRunNext()
			end)
		end)

		return
	end

	if _parmonPerfState.mode == "composite" then
		_parmonStartCompositeCurrent(currentIndex)

		return
	end

	CSGmPerfSampler.ResetPeaks()
	CSGmPerfSampler.ClearTrackedParticles()
	print(string.format("[ParmonGpuPerf] [%d/%d] 加载 %s", currentIndex, #_parmonPerfState.list, resourceId))
	_parmonAddTimer("loadTimeoutTimerId", 30, "Prefab 加载超时", function()
		if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
			return
		end

		_parmonPerfState.loadTimeoutTimerId = nil

		_parmonAdvance("加载超时 " .. resourceId)
	end)

	local loadCompletedSynchronously = false
	local loadTaskId = pg.global.resMgr:GetInstanceFromCacheByLua(resourceId, _parmonGuardCallback("Prefab 异步加载", function(gameObj, _)
		loadCompletedSynchronously = true

		if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
			if gameObj and not IsNil(gameObj) then
				pcall(function()
					pg.global.resMgr:RemoveInstanceToCache(gameObj, true)
				end)
			end

			return
		end

		_parmonPerfState.loadTaskId = nil

		_parmonRemoveTimer("loadTimeoutTimerId")

		if not gameObj or IsNil(gameObj) then
			_parmonAdvance("加载失败 " .. resourceId)

			return
		end

		_parmonPerfState.currentGo = gameObj

		gameObj:SetActiveEx(true)

		if not CSGmPerfSampler.SetParmonBenchmarkTargetStableRootAnchor(gameObj) then
			_parmonAdvance("无法准备稳定根节点 " .. resourceId)

			return
		end

		CSGmPerfSampler.AddParticleRoot(gameObj)
		_parmonAddTimer("warmupTimerId", _parmonPerfState.warmup, "Prefab 预热", function()
			if not _parmonPerfState or _parmonPerfState.index ~= currentIndex then
				return
			end

			_parmonPerfState.warmupTimerId = nil

			CSGmPerfSampler.StartRecording(_parmonPerfState.interval)
			_parmonAddTimer("measureTimerId", _parmonPerfState.duration, "Prefab 采样结束", _parmonMeasureCurrent)
		end)
	end))

	if _parmonPerfState and _parmonPerfState.index == currentIndex and not loadCompletedSynchronously then
		_parmonPerfState.loadTaskId = loadTaskId
	end
end

local function _parmonPrimeFirstCompositeTarget()
	if not _parmonPerfState or _parmonPerfState.cancelled then
		return
	end

	local entry = _parmonPerfState.entries and _parmonPerfState.entries[1]

	if not entry then
		_parmonRunNext()

		return
	end

	print("[ParmonGpuPerf] 正式采集前预热首个动态幻化（不记录结果） " .. entry.label)
	_parmonCreateCompositeTarget(1, entry, function(ok, reason)
		if not _parmonPerfState or _parmonPerfState.primingDone then
			return
		end

		if not ok then
			_parmonPerfState.primingDone = true

			print("[ParmonGpuPerf] 首个动态幻化预热失败，继续正式采集：" .. tostring(reason))
			_parmonReleaseCurrent()
			_parmonRunNext()

			return
		end

		local primeTime = math.max(3, _parmonPerfState.warmup)

		_parmonAddTimer("warmupTimerId", primeTime, "动态首模型预热", function()
			if not _parmonPerfState or _parmonPerfState.primingDone then
				return
			end

			_parmonPerfState.warmupTimerId = nil
			_parmonPerfState.primingDone = true

			_parmonReleaseCurrent()
			print(string.format("[ParmonGpuPerf] 首个动态幻化预热完成（%.1fs），开始正式采集", primeTime))
			_parmonAddTimer("nextTimerId", 1, "动态首模型进入采集", function()
				if not _parmonPerfState then
					return
				end

				_parmonPerfState.nextTimerId = nil

				_parmonRunNext()
			end)
		end)
	end)
end

function _parmonPrimeFirstTarget()
	if not _parmonPerfState or _parmonPerfState.cancelled then
		return
	end

	if _parmonPerfState.mode == "composite" then
		_parmonPrimeFirstCompositeTarget()

		return
	end

	local resourceId = _parmonPerfState.list[1]

	if not resourceId then
		_parmonRunNext()

		return
	end

	print(string.format("[ParmonGpuPerf] 正式采集前预热首个模型（不记录结果） %s", resourceId))
	_parmonAddTimer("loadTimeoutTimerId", 30, "首个 Prefab 预热超时", function()
		if not _parmonPerfState or _parmonPerfState.primingDone then
			return
		end

		_parmonPerfState.loadTimeoutTimerId = nil
		_parmonPerfState.primingDone = true

		print(string.format("[ParmonGpuPerf] 首模型预热加载超时，继续正式采集 %s", resourceId))
		_parmonReleaseCurrent()
		_parmonRunNext()
	end)

	local loadCompletedSynchronously = false
	local loadTaskId = pg.global.resMgr:GetInstanceFromCacheByLua(resourceId, _parmonGuardCallback("首个 Prefab 异步加载", function(gameObj, _)
		loadCompletedSynchronously = true

		if not _parmonPerfState or _parmonPerfState.primingDone then
			if gameObj and not IsNil(gameObj) then
				pcall(function()
					pg.global.resMgr:RemoveInstanceToCache(gameObj, true)
				end)
			end

			return
		end

		_parmonPerfState.loadTaskId = nil

		_parmonRemoveTimer("loadTimeoutTimerId")

		if not gameObj or IsNil(gameObj) then
			_parmonPerfState.primingDone = true

			print(string.format("[ParmonGpuPerf] 首模型预热加载失败，继续正式采集 %s", resourceId))
			_parmonRunNext()

			return
		end

		_parmonPerfState.currentGo = gameObj

		gameObj:SetActiveEx(true)
		CSGmPerfSampler.SetParmonBenchmarkTargetStableRootAnchor(gameObj)
		CSGmPerfSampler.AddParticleRoot(gameObj)

		local primeTime = math.max(3, _parmonPerfState.warmup)

		_parmonAddTimer("warmupTimerId", primeTime, "首个 Prefab 预热", function()
			if not _parmonPerfState or _parmonPerfState.primingDone then
				return
			end

			_parmonPerfState.warmupTimerId = nil
			_parmonPerfState.primingDone = true

			_parmonReleaseCurrent()
			print(string.format("[ParmonGpuPerf] 首模型预热完成（%.1fs），开始正式采集 %s", primeTime, resourceId))
			_parmonAddTimer("nextTimerId", 1, "首个 Prefab 进入采集", function()
				if not _parmonPerfState then
					return
				end

				_parmonPerfState.nextTimerId = nil

				_parmonRunNext()
			end)
		end)
	end))

	if _parmonPerfState and not _parmonPerfState.primingDone and not loadCompletedSynchronously then
		_parmonPerfState.loadTaskId = loadTaskId
	end
end

function GmToolUtils.runParmonBatchGpuPerfTest(buttons)
	if _parmonPerfState or _batchState then
		pg.global.ui.tips:showTextTip("已有批量性能采集正在运行，请先停止")

		return
	end

	if not pg.global.resMgr then
		pg.global.ui.tips:showTextTip("资源管理器未初始化")

		return
	end

	local requestedIds = _parmonInputText(buttons, 0)
	local startIndex = math.max(1, math.floor(tonumber(_parmonInputText(buttons, 1)) or 1))
	local requestedCount = math.max(0, math.floor(tonumber(_parmonInputText(buttons, 2)) or 20))
	local warmup = math.max(0.1, tonumber(_parmonInputText(buttons, 3)) or 2)
	local duration = math.max(1, tonumber(_parmonInputText(buttons, 4)) or 10)
	local interval = math.max(1, math.floor(tonumber(_parmonInputText(buttons, 5)) or 5))
	local fieldOfView = math.max(15, math.min(80, tonumber(_parmonInputText(buttons, 6)) or 35))
	local cameraDistance = math.max(0.5, math.min(50, tonumber(_parmonInputText(buttons, 7)) or 4.2))
	local uploadEnabled = (tonumber(_parmonInputText(buttons, 8)) or 1) ~= 0
	local titleBase = _parmonInputText(buttons, 9)
	local notifyEmail = _parmonInputText(buttons, 10)
	local feishuTarget = _parmonResolveFeishuTarget()
	local parentToken = uploadEnabled and feishuTarget.token or ""

	if titleBase == "" then
		titleBase = string.format("Parmon_GPU_%s_%s", feishuTarget.label, os.date("%Y%m%d_%H%M%S"))
	end

	local resourceText = CSGmPerfSampler.GetParmonCommonPrefabResourceIds()
	local allResources = _parmonCollectRuntimeResources(resourceText)

	if #allResources == 0 then
		pg.global.ui.tips:showTextTip("运行时资源表中没有找到 Parmon Common Prefab")

		return
	end

	local list, selectionDescription, selectionError = _parmonBuildResourceSelection(allResources, requestedIds, startIndex, requestedCount)

	if not list then
		pg.global.ui.tips:showTextTip(selectionError or "没有可测试的 Parmon")

		return
	end

	local cameraOk, cameraStarted = xpcall(function()
		return CSGmPerfSampler.BeginParmonBenchmarkCamera(fieldOfView, cameraDistance)
	end, debug.traceback)

	if not cameraOk or not cameraStarted then
		pcall(function()
			CSGmPerfSampler.EndParmonBenchmarkCamera()
		end)
		pg.global.ui.tips:showTextTip("固定采集镜头启动失败，请确认当前已进入游戏场景")

		return
	end

	local offsetOk, offsetError = xpcall(function()
		CSGmPerfSampler.SetParmonBenchmarkTargetVerticalOffset(0.5)
	end, debug.traceback)

	if not offsetOk then
		print("[ParmonGpuPerf] 采集相机偏移设置失败：" .. tostring(offsetError))
		pcall(function()
			CSGmPerfSampler.EndParmonBenchmarkCamera()
		end)
		pg.global.ui.tips:showTextTip("固定采集镜头初始化失败，请查看日志")

		return
	end

	_parmonPerfState = {
		cancelled = false,
		uploadFailureCount = 0,
		uploadSucceeded = false,
		uploadAttempted = false,
		completed = 0,
		afkRestorePending = false,
		index = 1,
		list = list,
		warmup = warmup,
		duration = duration,
		interval = interval,
		uploadEnabled = uploadEnabled,
		parentToken = parentToken,
		platformLabel = feishuTarget.label,
		titleBase = titleBase,
		notifyEmail = notifyEmail
	}

	local afkOk, afkError = xpcall(function()
		_parmonBeginNoAfk(_parmonPerfState)
	end, debug.traceback)

	if not afkOk then
		print("[ParmonGpuPerf] 初始化挂机保护失败：" .. tostring(afkError))
		_parmonFinish("初始化失败")

		return
	end

	local summaryOk, summaryPath = xpcall(function()
		return CSGmPerfSampler.OpenBatchSummary()
	end, debug.traceback)

	if not summaryOk then
		print("[ParmonGpuPerf] 初始化批量汇总失败：" .. tostring(summaryPath))
		_parmonFinish("初始化失败")

		return
	end

	_parmonPerfState.summaryPath = summaryPath

	pcall(function()
		pg.global.ui:close(2)
	end)
	print(string.format("[ParmonGpuPerf] 开始：%s，共%d只，平台=%s，预热=%.1fs，采样=%.1fs，FOV=%.1f，固定距离=%.2fm", selectionDescription, #list, feishuTarget.label, warmup, duration, fieldOfView, cameraDistance))

	if uploadEnabled then
		print(string.format("[ParmonGpuPerf] 结束后合并上传：%s -> https://funplus.feishu.cn/wiki/%s", titleBase, parentToken))
	else
		print("[ParmonGpuPerf] 本轮仅保存本地 CSV，不上传飞书")
	end

	_parmonRunCallback("启动首个 Parmon 目标", _parmonPrimeFirstTarget)
end

function GmToolUtils.runParmonCompositeBatchGpuPerfTest(buttons)
	if _parmonPerfState or _batchState then
		pg.global.ui.tips:showTextTip("已有批量性能采集正在运行，请先停止")

		return
	end

	if not pg.global.resMgr then
		pg.global.ui.tips:showTextTip("资源管理器未初始化")

		return
	end

	local templateId = math.floor(tonumber(_parmonInputText(buttons, 0)) or 1021300)
	local warmup = math.max(0.1, tonumber(_parmonInputText(buttons, 1)) or 2)
	local duration = math.max(1, tonumber(_parmonInputText(buttons, 2)) or 10)
	local interval = math.max(1, math.floor(tonumber(_parmonInputText(buttons, 3)) or 5))
	local fieldOfView = math.max(15, math.min(80, tonumber(_parmonInputText(buttons, 4)) or 35))
	local cameraDistance = math.max(0.5, math.min(50, tonumber(_parmonInputText(buttons, 5)) or 4.2))
	local verticalOffset = math.max(-0.5, math.min(0.5, tonumber(_parmonInputText(buttons, 6)) or 0.5))
	local uploadEnabled = (tonumber(_parmonInputText(buttons, 7)) or 1) ~= 0
	local titleBase = _parmonInputText(buttons, 8)
	local notifyEmail = _parmonInputText(buttons, 9)
	local buildOk, list, entries, selectionDescription = pcall(_parmonBuildCompositeSelection, templateId)

	if not buildOk then
		pg.global.ui.tips:showTextTip("动态幻化配置读取失败，请查看日志")
		print("[ParmonGpuPerf] 动态幻化配置异常: " .. tostring(list))

		return
	end

	if not list then
		pg.global.ui.tips:showTextTip(selectionDescription or "动态幻化组合配置无效")

		return
	end

	local feishuTarget = _parmonResolveFeishuTarget()
	local parentToken = uploadEnabled and feishuTarget.token or ""

	if titleBase == "" then
		titleBase = string.format("Parmon_Composite_GPU_%s_%s", feishuTarget.label, os.date("%Y%m%d_%H%M%S"))
	end

	local cameraOk, cameraStarted = xpcall(function()
		return CSGmPerfSampler.BeginParmonBenchmarkCamera(fieldOfView, cameraDistance)
	end, debug.traceback)

	if not cameraOk or not cameraStarted then
		pcall(function()
			CSGmPerfSampler.EndParmonBenchmarkCamera()
		end)
		pg.global.ui.tips:showTextTip("固定采集镜头启动失败，请确认当前已进入游戏场景")

		return
	end

	local offsetOk, offsetError = xpcall(function()
		CSGmPerfSampler.SetParmonBenchmarkTargetVerticalOffset(verticalOffset)
	end, debug.traceback)

	if not offsetOk then
		print("[ParmonGpuPerf] 动态幻化相机偏移设置失败：" .. tostring(offsetError))
		pcall(function()
			CSGmPerfSampler.EndParmonBenchmarkCamera()
		end)
		pg.global.ui.tips:showTextTip("固定采集镜头初始化失败，请查看日志")

		return
	end

	_parmonPerfState = {
		afkRestorePending = false,
		uploadFailureCount = 0,
		uploadSucceeded = false,
		uploadAttempted = false,
		mode = "composite",
		index = 1,
		completed = 0,
		cancelled = false,
		list = list,
		entries = entries,
		warmup = warmup,
		duration = duration,
		interval = interval,
		verticalOffset = verticalOffset,
		uploadEnabled = uploadEnabled,
		parentToken = parentToken,
		platformLabel = feishuTarget.label,
		titleBase = titleBase,
		notifyEmail = notifyEmail
	}

	local afkOk, afkError = xpcall(function()
		_parmonBeginNoAfk(_parmonPerfState)
	end, debug.traceback)

	if not afkOk then
		print("[ParmonGpuPerf] 动态幻化初始化挂机保护失败：" .. tostring(afkError))
		_parmonFinish("初始化失败")

		return
	end

	local summaryOk, summaryPath = xpcall(function()
		return CSGmPerfSampler.OpenBatchSummary()
	end, debug.traceback)

	if not summaryOk then
		print("[ParmonGpuPerf] 动态幻化初始化批量汇总失败：" .. tostring(summaryPath))
		_parmonFinish("初始化失败")

		return
	end

	_parmonPerfState.summaryPath = summaryPath

	pcall(function()
		pg.global.ui:close(2)
	end)
	print(string.format("[ParmonGpuPerf] 动态幻化批量开始：模板=%d，共%d项，平台=%s，预热=%.1fs，采样=%.1fs，FOV=%.1f，距离=%.2fm，垂直偏移=%.2fm", templateId, #list, feishuTarget.label, warmup, duration, fieldOfView, cameraDistance, verticalOffset))
	print("[ParmonGpuPerf] 动态幻化组合：" .. tostring(selectionDescription))

	if uploadEnabled then
		print(string.format("[ParmonGpuPerf] 结束后合并上传：%s -> https://funplus.feishu.cn/wiki/%s", titleBase, parentToken))
	else
		print("[ParmonGpuPerf] 本轮仅保存本地 CSV，不上传飞书")
	end

	_parmonRunCallback("启动首个动态幻化目标", _parmonPrimeFirstTarget)
end

function GmToolUtils.stopParmonBatchGpuPerfTest()
	if not _parmonPerfState then
		pg.global.ui.tips:showTextTip("没有正在运行的 Parmon GPU 采集")

		return
	end

	_parmonPerfState.cancelled = true

	_parmonFinish("已停止")
end

function GmToolUtils.getGrabEggScore()
	if not GmToolUtils._eggScoreDebug then
		return {
			{
				label = "---",
				value = 0
			}
		}
	end

	local score = pg.me and pg.me.eggAllScore or 0

	return {
		{
			label = tostring(score),
			value = score
		}
	}
end

function GmToolUtils.getGrabEggScoreSelected()
	return 0
end

function GmToolUtils.setGrabEggScore()
	if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
		pg.global.ui.config:refreshFuncList()
	end
end

function GmToolUtils.getEggScoreEnabled()
	return GmToolUtils._eggScoreDebug
end

function GmToolUtils.toggleEggScore(enable)
	GmToolUtils._eggScoreDebug = enable

	TimerManager.addTimer(0.1, function()
		if pg.global.ui:checkUIOpen(UIConst.UI_ID_CONFIG) then
			pg.global.ui.config:refreshFuncList()
		end
	end)
end

function GmToolUtils.refreshWaterRecovery()
	for _, petId in pairs(pg.me.petPrepareList or EMPTY_TABLE) do
		local petEnt = pg.getEntity(petId)

		if petEnt and petEnt.waterConfigData and petEnt.curAddVal and petEnt.defaultAddVal then
			if petEnt.curAddVal > petEnt.defaultAddVal then
				petEnt.curAddVal = petEnt.defaultAddVal

				if LoggerManager.checkLogger(LoggerConst.INFO) then
					logger:info("改为基础恢复速率")
				end
			else
				petEnt.curAddVal = petEnt.defaultAddVal + petEnt.inBuffAddVal

				if LoggerManager.checkLogger(LoggerConst.INFO) then
					logger:info("改为快速恢复速率!!!")
				end
			end
		end
	end
end

function GmToolUtils.setGUIEnabled(enable)
	CS.FunPlus.WorldX.Utils.GmToolUtils.SetGUIEnabled(enable)
end

function GmToolUtils.getGUIEnabled()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetGUIEnabled()
end

function GmToolUtils.canShowTouchPointDebug()
	if UNITY_EDITOR then
		return true
	end

	return _G_IsDebugMode == true
end

function GmToolUtils.setTouchPointDebugEnabled(enable)
	local isEnable = enable == true

	if isEnable and not GmToolUtils.canShowTouchPointDebug() then
		return
	end

	CS.FunPlus.WorldX.Utils.GmToolUtils.SetTouchPointDebugEnabled(isEnable)
end

function GmToolUtils.getTouchPointDebugEnabled()
	return CS.FunPlus.WorldX.Utils.GmToolUtils.GetTouchPointDebugEnabled()
end

function GmToolUtils.loadIFix()
	CS.FunPlus.WorldX.Utils.GmToolUtils.LoadIFix()
end

function GmToolUtils.canLoadIFix()
	return true
end

function GmToolUtils.getNvidiaVoiceTest()
	return ClientSwitch.NvidiaVoiceTest
end

function GmToolUtils.setNvidiaVoiceTest(enable)
	ClientSwitch.NvidiaVoiceTest = enable
end

function GmToolUtils.connectLocalASRServer(buttons)
	local ip = tostring(buttons[0]:GetChild("InputField"):GetComponent("UTMPInputField").text)
	local port = tonumber(buttons[1]:GetChild("InputField"):GetComponent("UTMPInputField").text)

	if string.isNilOrEmpty(ip) or port == nil or port < 1 or port > 65535 then
		pg.global.ui.tips:showTextTip("ASR IP 或端口无效")

		return
	end

	AsrHttpClient:health(ip, port, false, 5000, function(ok, result, err)
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			if ok then
				pg.global.ui.tips:showTextTip(inspect(result))
			else
				pg.global.ui.tips:showTextTip(tostring(err))
			end
		end
	end)
end

function GmToolUtils.setPowerSaveEnterBlocked(block)
	local powerSave = pg.game and pg.game.powerSave

	if powerSave and powerSave.setGmBlockEnter then
		powerSave:setGmBlockEnter(block)
	end
end

function GmToolUtils.getPowerSaveEnterBlocked()
	local powerSave = pg.game and pg.game.powerSave

	if powerSave and powerSave.isGmBlockEnter then
		return powerSave:isGmBlockEnter()
	end

	return false
end

return GmToolUtils
