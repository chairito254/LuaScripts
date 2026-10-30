-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\UIScene\\UISceneConst.lua

local Const = require("Common.Const.Const")
local VQ = Const.VIDEO_QUALITY
local UISceneConst = {
	PET_RESEARCH_DETAIL_V3 = "PetDetailSceneV3",
	PET_VARIANT_PROCESS_SCENE = "PetVariantProcessScene",
	PET_MANAGEMENT_TRAINING_SCENE = "PetManagementTrainingScene",
	PET_MANAGEMENT_TRAINING_SCENE2 = "PetManagementTrainingScene2",
	PET_ILL_BOOK_MODEL_SCENE = "PetResearchModelScene",
	AVATAR_SCENE = "AvatarScene",
	AVATAR_CREATE_ROLE_SCENE = "AvatarCreateRoleScene",
	GRAB_EGG_SETTLEMENT_SCENE = "GrabEggSettlementScene",
	PET_EXCHANGE_WAIT_SCENE = "PetExchangeWaitScene",
	WORLD_RACE_SETTLEMENT_SCENE = "WorldRaceSettlementScene",
	NPC_DUEL_START_PREVIEW_SCENE = "NPCDuelStartScene",
	HOME_CAR_SCENE = "HomeCarScene",
	PET_SPECIAL_PREVIEW_SCENE = "PetSpecialTrainScene",
	PET_MANAGEMENT_PREVIEW_SCENE = "PetManagementPreviewScene",
	PLAYER_ENHANCE_SCENE = "PlayerEnhanceScene",
	PET_FIRST_MEET = "PetFirstMeetScene",
	PVP_REWARD_SCENE = "PVPRewardScene",
	PVP_BP_SCENE = "PVPBpScene",
	PVP_TEAM_SCENE = "PVPTeamScene",
	NPC_SIMPLE_SCENE = "NpcSimpleScene",
	TEAM_ROOM_SCENE = "TeamRoomScene",
	ITEM_VIEWER_SCENE = "ItemViewerScene",
	PET_BALL_PREVIEW_SCENE = "PetBallPreviewScene",
	VITALITY_SCENE = "VitalityScene",
	ILLUSTRATED_GUIDE_C_SCENE = "IllustratedGuideCScene",
	BP_PURCHASE_SCENE = "BPPurchaseScene",
	ILLUSTRATED_GUIDE_SCENE = "IllustratedGuideScene",
	BP_SCENE = "BattlePassScene",
	CALCINATION_SCENE = "CalcinationScene",
	CASH_SCENE = "CashScene",
	PET_SHINY_SCENE = "PetShinyScene",
	BOSS_RUSH_MODEL_SCENE = "BossRushModelScene",
	GROW_GIFT_SELECT_SCENE = "GrowGiftSelectScene",
	BOSS_RUSH_SCENE = "BossRushScene",
	PET_TRANSMOG_SCENE = "PetTransmogScene",
	FURNITURE_STORE_SCENE = "FurnitureStoreScene",
	PET_INHERITANCE_CHOOSE_SCENE = "PetInheritanceChooseScene",
	MODEL_SCENE = "ModelScene",
	PET_INHERITANCE_MAIN_SCENE = "PetInheritanceMainScene",
	ROGUE_ULTIMATE_PET_SCENE = "RogUltimatePetScene",
	FISHING_CAPTURE_RESULT_SCENE = "FishingCaptureResultScene",
	SOUL_EGG_EVOLUTION_SCENE = "SoulEggEvolutionScene",
	HOME_CAMP_RVPETS_SCENE = "HomeCampRVPetsScene",
	PET_RESEARCH_DETAIL_V2 = "PetDetailSceneV2",
	GRAB_EGG_BAG_SCENE = "GrabEggBagScene",
	PET_RESEARCH_DETAIL = "PetResearchDetailScene",
	GRAB_EGG_MODE_SCENE = "GrabEggModeScene",
	LOTTERY_SCENE = "LotteryScene",
	AFK_SHOP_SCENE = "AFKShopScene"
}

UISceneConst.Scene_Load_State = {
	None = 0,
	Loaded = 2,
	Loading = 1
}
UISceneConst.RT_PLATFORM = {
	PC = 1,
	CONSOLE = 2,
	MOBILE = 3
}
UISceneConst.RT_ALIGNMENT = 32
UISceneConst.RT_DEPTH_BUFFER = 24
UISceneConst.RT_MIN_LONG_SIDE = 192
UISceneConst.RT_FAIL_LAYOUT_NOT_READY = "layoutNotReady"
UISceneConst.RT_FAIL_INVALID_PARAM = "invalidParam"
UISceneConst.RT_PLATFORM_SCALE = {
	[UISceneConst.RT_PLATFORM.PC] = 1,
	[UISceneConst.RT_PLATFORM.CONSOLE] = 1,
	[UISceneConst.RT_PLATFORM.MOBILE] = 0.8
}
UISceneConst.RT_QUALITY_SCALE = {
	[UISceneConst.RT_PLATFORM.PC] = {
		[VQ.TOP] = 1.25,
		[VQ.HIGH] = 1,
		[VQ.MID] = 0.85,
		[VQ.LOW] = 0.7
	},
	[UISceneConst.RT_PLATFORM.CONSOLE] = {
		[VQ.TOP] = 1.2,
		[VQ.HIGH] = 1,
		[VQ.MID] = 0.85,
		[VQ.LOW] = 0.7
	},
	[UISceneConst.RT_PLATFORM.MOBILE] = {
		[VQ.TOP] = 1.25,
		[VQ.HIGH] = 1,
		[VQ.MID] = 0.8,
		[VQ.LOW] = 0.625
	}
}
UISceneConst.RT_MAX_LONG_SIDE = {
	[UISceneConst.RT_PLATFORM.PC] = {
		[VQ.TOP] = 2048,
		[VQ.HIGH] = 2048,
		[VQ.MID] = 1536,
		[VQ.LOW] = 1024
	},
	[UISceneConst.RT_PLATFORM.CONSOLE] = {
		[VQ.TOP] = 2048,
		[VQ.HIGH] = 2048,
		[VQ.MID] = 1536,
		[VQ.LOW] = 1024
	},
	[UISceneConst.RT_PLATFORM.MOBILE] = {
		[VQ.TOP] = 1024,
		[VQ.HIGH] = 1024,
		[VQ.MID] = 768,
		[VQ.LOW] = 512
	}
}
UISceneConst.RT_PLATFORM_NAME = {
	[UISceneConst.RT_PLATFORM.PC] = "PC",
	[UISceneConst.RT_PLATFORM.CONSOLE] = "Console",
	[UISceneConst.RT_PLATFORM.MOBILE] = "Mobile"
}
UISceneConst.RT_QUALITY_NAME = {
	[VQ.LOW] = "LOW",
	[VQ.MID] = "MID",
	[VQ.HIGH] = "HIGH",
	[VQ.TOP] = "TOP"
}

return UISceneConst
