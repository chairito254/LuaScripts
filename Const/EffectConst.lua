-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\EffectConst.lua

local EffectConst = {
	ENEMY_CIRCLE_EFFECT_RES = "Eff_Common_Target_Red",
	ROGUE_EXCHANGE_REWARD_NPC_EFF = "Eff_Monster_Robot_Normal_Atk_Gauntlet_Skill_Summon_Self_01_Loop",
	Eff_Level_BossRush_UI_BossRedEye = "Eff_Level_BossRush_UI_BossRedEye",
	Eff_UI_PetExchange_Hand_R = "Eff_UI_PetExchange_Hand_R",
	Eff_UI_PetExchange_Hand_L = "Eff_UI_PetExchange_Hand_L",
	PET_EXCHANGE_LINK = "Eff_UI_PetExchange_Hand_Line",
	EFF_PARMON_STICKON = "Eff_Parmon_10261_StickOn",
	SELF_CIRCLE_EFFECT_RES = "Eff_Common_Target_Green",
	PARTNER_CIRCLE_EFFECT_RES = "Eff_Common_Target_Blue"
}

EffectConst.CUSTOM_PRELOAD_EFF_IDS = {
	"Eff_Parmon_10023_Boss_ScreenUV",
	"Eff_Common_Battle_Break"
}
EffectConst.CIRCLE_EFFECT = {
	blue = "Eff_Common_Target_Blue",
	red = "Eff_Common_Target_Red",
	green = "Eff_Common_Target_Green"
}
EffectConst.BLOOM_QUALITY_EFFECT = {
	"Eff_Env_GrabEgg_Indication_Projectile_White",
	"Eff_Env_GrabEgg_Indication_Projectile_Green",
	"Eff_Env_GrabEgg_Indication_Projectile_Blue",
	"Eff_Env_GrabEgg_Indication_Projectile_Purple",
	"Eff_Env_GrabEgg_Indication_Projectile_Glod",
	"Eff_Env_GrabEgg_Indication_Projectile_Rainbow"
}
EffectConst.QUALITY_EFFECT = {
	"Eff_Env_GrabEgg_Indication_White",
	"Eff_Env_GrabEgg_Indication_Green",
	"Eff_Env_GrabEgg_Indication_Blue",
	"Eff_Env_GrabEgg_Indication_Purple",
	"Eff_Env_GrabEgg_Indication_Glod",
	"Eff_Env_GrabEgg_Indication_Rainbow"
}
EffectConst.TRANSPORT_EFFECT = {
	TOP_END = "Eff_Env_GrabEgg_Transmit_BEgg_Clouds_KeyItem_End",
	BOTTOM_LOOP = "Eff_Env_GrabEgg_Transmit_BEgg_KeyItem_Loop",
	BOTTOM_START = "Eff_Env_GrabEgg_Transmit_BEgg_KeyItem_Start",
	TOP_LOOP = "Eff_Env_GrabEgg_Transmit_BEgg_Clouds_KeyItem_Loop",
	BOTTOM_END = "Eff_Env_GrabEgg_Transmit_BEgg_KeyItem_End"
}
EffectConst.SHINY_EFFECTS = {
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color01_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color02_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color03_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color04_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color05_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color06_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color07_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color08_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color09_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color10_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color11_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color12_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color13_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color14_PM.asset",
	"Assets/Res_Export/Character/MaterialPreset/ParmonDye/UniverselShinyEffectPreset/ShinyEffect_Color15_PM.asset"
}
EffectConst.EFF_BOW_ATTACK = {
	ARROW_FULL_LOOP = 1,
	ARROW_FULL_START = 2
}
EffectConst.EffectMotorType = {
	Curve_Target = 2,
	Straight = 1
}
EffectConst.EFFECT_LEVEL = {
	LOW = 2,
	MIDDLE = 1,
	HIGH = 0,
	AUTO = 100,
	NONE = 4,
	FUNC = 3
}
EffectConst.EFFECT_CATEGORY = {
	ENEMY_PLAYER = 4,
	MONSTER_BOSS = 3,
	LOCKED_ENEMY_PLAYER = 2,
	MAIN_PLAYER = 1,
	MECHANISM = 8,
	SCENE = 7,
	MISC = 6,
	FRIEND_PLAYER = 5
}
EffectConst.EFFECT_TYPE = {
	EQUIP = 7,
	SCREEN = 6,
	HIT = 5,
	BUFF = 4,
	BULLET_SKILL = 3,
	LINE_SKILL = 2,
	NORMAL_SKILL = 1,
	SCENE = 9,
	MISC = 8
}
EffectConst.EFFECT_APPEARANCE_LOD_TYPE = {
	WEAPON = 20,
	RIDE_FLY = 10,
	BODY = 1,
	NONE = 0,
	DECORATION = 25
}
EffectConst.MAPPED_EFFECT_TYPE = {
	MISC = 4,
	SCENE = 5,
	SCREEN = 6,
	EQUIP = 3,
	SKILL = 0,
	HIT = 1,
	BUFF = 2
}
EffectConst.EFFECT_LOD_LEVEL = {
	LEVEL_2 = 40,
	LEVEL_1 = 25,
	LEVEL_0 = 15
}
EffectConst.MountType = {
	Motor = 7,
	Link = 6,
	Camera = 5,
	Custom = 4,
	Model = 3,
	PositionAgent = 2,
	Entity = 1,
	World = 0
}
EffectConst.FollowType = {
	OncePosRootRotation = 6,
	FollowPosRootRotation = 5,
	FollowPosRot = 4,
	FollowPos = 3,
	OncePosRot = 2,
	OncePos = 1,
	Global = 0,
	AlignEffectBone = 7
}
EffectConst.FIXED_EFFECT_KEYS = {
	EFF_EVIL = "Eff_Eyes_Boss"
}
EffectConst.SHADER_RES_ID = {
	CHARACTER_TRANSPARENT = "$MI_VFX_CharacterTransparentEffect.mat"
}
EffectConst.SHADER_PARAM = {
	EFF_EVIL_AMOUNT = "_EvilAmount"
}
EffectConst.EFFECT_EVENT = {
	EFF_EVIL_SMOKE = "HPSmoke"
}
EffectConst.PRESET_NAME = {
	DITHERING_FADE_REVERSE = "DitheringFadeReverse",
	CHARACTER_EDGE_DISSOLVE = "CharacterEdgeDissolve",
	DITHERING_FADE = "DitheringFade",
	IDYLL_DISSLOVE_INVERSE_2 = "Idyll_dissolve02",
	IDYLL_DISSLOVE_INVERSE_1 = "Idyll_dissolve01"
}
EffectConst.EFFECT_PRIORITY_LOWEST = 10000
EffectConst.MIN_LOD_DOWN_LEVEL = 2
EffectConst.MAX_LOD_DOWN_LEVEL = 3
EffectConst.MPE_EFFECT_TYPE = {
	HitEffect = 4,
	Projectile = 3,
	SpellField = 2,
	Skill = 1
}
EffectConst.EFFECT_NAME_TO_INDEX = {}

function EffectConst.initEffectName2Index()
	local enumNames = CS.FunPlus.WorldX.Effect.EffectConfigInfo.fieldsByOrder

	if enumNames == nil then
		return
	end

	for i = 0, enumNames.Length - 1 do
		EffectConst.EFFECT_NAME_TO_INDEX[enumNames[i]] = i + 1
	end
end

EffectConst.EFFECT_SHARE_MEM_LEN = CS.FunPlus.WorldX.Effect.EffectConfigInfo.memSize
EffectConst.DEFAULT_SHARE_MEM = {
	combatRTPCType = 2,
	forceLodLevel = -1,
	enableMultipleLoop = 0,
	syncType = 0,
	visibleType = 0,
	startTime = 0,
	effectType = 1,
	dropInKill = 0,
	linkChangeLength = 0,
	neverHide = 0,
	effectLevel = 0,
	linkLength = 1,
	linkEndOffsetZ = 0,
	linkEndOffsetY = 0,
	linkEndOffsetX = 0,
	scaleZ = 0,
	scaleY = 0,
	scaleX = 0,
	rotationZ = 0,
	rotationY = 0,
	rotationX = 0,
	positionZ = 0,
	positionY = 0,
	positionX = 0,
	resID = "",
	bone = "",
	followType = 1,
	mountType = 3,
	layer = -1,
	speed = 1,
	duration = 0,
	delay = 0,
	sizeDontEffectPos = 0,
	useBoneSize = 0,
	useModelSize = 0,
	vanishTime = 0,
	staticSpeed = 0,
	freezeWithAnimator = 1
}

return EffectConst
