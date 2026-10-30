-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\EvolutionConst.lua

local UIConst = require("Const.UIConst")
local AddressDataConst = require("Const.AddressDataConst")
local Vector4 = Vector4
local PlayableConst = require("Common.Const.PlayableConst")
local EvolutionConst = {}

EvolutionConst.SoulEggEvolution = {
	EvolutionPetPresetDuration = 3,
	EvolutionPetShowTime = 0.3,
	EvolutionCameraMoveDelayTime = 0.2,
	SoulEggDestroyTime = 0.1,
	IncubateResultChangeTime = 1,
	IncubateResultShowTime = 0,
	EvolutionSpaceEffectName = "Eff_Parmon_EvolutionSpace_hatch",
	EggBrokenEffectKey = "Eff_UI_SoulEgg_Open",
	IncubatePresentationCameraTarget = {
		SmallStage = Vector3.New(-1.44, 1, 3.68),
		LargeStage = Vector3.New(-1.18, 0.23, 3.07)
	},
	IncubatePresentationPosition = {
		LargeStage = {
			Model = Vector3.New(-0.05, -0.75, -2.73),
			SuccessEffect = Vector3.New(-0.05, -0.74, -3.11),
			SuccessBackgroundEffect = Vector3.New(-0.05, -0.84, -2.08)
		}
	},
	SoulEggBreakEffect = {
		petShowTime = 0.2,
		startTime = 0,
		posY = 0.1,
		effectDuration = -1,
		forceLodLevel = 0,
		scale = 0.6,
		cleanupTime = 3,
		effectName = "Eff_SceneObiect_SoulEgg_Open_01"
	},
	SoulEggClickCD = {
		1,
		1,
		1,
		1
	},
	EvolutionSuccess = {
		normalEffectName = "",
		startTime = 0,
		shinyEffectName = "Eff_Parmon_Evolution_Successful_03",
		prewarmTime = 0.15,
		forceLodLevel = 0,
		normalBgEffectName = "Eff_Parmon_Evolution_Successful_BG01_1",
		heightMulti = 0.35,
		shinyBgEffectName = "Eff_Parmon_Evolution_Successful_BG02_1"
	},
	EvolutionAnimation = {
		startTime = 0.5,
		animStateList = {
			{
				"Behav_HappyStart",
				"Behav_HappyLoop",
				"Behav_HappyEnd",
				{}
			},
			{
				"Behav_LoveStart",
				"Behav_LoveLoop",
				"Behav_LoveEnd",
				{}
			}
		}
	},
	UIWhileList = {
		[UIConst.UI_ID_PET_FERTILITY_INCUBATE_RESULT] = true,
		[UIConst.UI_ID_PET_FERTILITY_INCUBATE] = true,
		[UIConst.UI_ID_PET_FERTILITY_CHOOSE_BALL] = true,
		[UIConst.UI_ID_PET_FERTILITY_HATCH_SCENE_HOST] = true,
		[UIConst.UI_ID_TIPS] = true,
		[UIConst.UI_ID_COMMON_CUSTOM_INFO_TIP] = true,
		[UIConst.UI_ID_PET_GIFT_TIPS] = true,
		[UIConst.UI_ID_COMMON_ITEM_TIP] = true,
		[UIConst.UI_ID_PET_FERTILITY_POPUP_CHOOSE_BALL] = true
	},
	Pos = Vector3.New(0, 500, 0),
	DetailOpen = {
		CameraOffSet = Vector3.New(-1, 0.15, 0)
	},
	CameraPrefab = AddressDataConst.SOUL_EGG_CAMERA_PREFAB
}
EvolutionConst.PetEvolution = {
	DialogueWaitTimeout = 60,
	SoundEventName = "SFX_common_stageup",
	TweenEvolutionDissolveHeight = 10,
	EvolutionPetUIShowTime = 7,
	EvolutionSpaceEffectName = "Eff_Parmon_EvolutionSpace",
	DialogueWaitGraphIds = {
		[91054217] = true
	},
	ShinyPresentation = {
		closeDelayAfterSkip = 1,
		skipDelay = 0.5
	},
	EvolutionDissolveOldMeshAnim = {
		border = 2,
		duration = 6,
		startTime = 1,
		voxelParam = Vector4(0.5, 1, 0.7, 0),
		resName = AddressDataConst.EVOLUTION_MATERIAL_DISSOLVE_OLD
	},
	EvolutionDissolveNewMeshAnim = {
		border = 0,
		duration = 2.5,
		startTime = 4.5,
		speed = 2,
		voxelParam = Vector4(0.5, 1, 0.7, 0),
		resName = AddressDataConst.EVOLUTION_MATERIAL_DISSOLVE_NEW
	},
	VEG_NEW = {
		startTime = 4.5,
		duration = 1,
		effectName = "Eff_VEG_Parmon_Evolution_VEG_New"
	},
	VEG_OLD = {
		effectName = "Eff_VEG_Parmon_Evolution_VEG_Old",
		startTime = 1
	},
	EvolutionFnrStartAnim = {
		endValue = 1,
		startTime = 3,
		duration = 5,
		startValue = 0
	},
	EvolutionFnrEndAnim = {
		endValue = 0,
		startTime = 7,
		duration = 1.5,
		startValue = 1
	},
	EvolutionSuccess = {
		heightMulti = 0.35,
		startTime = 7,
		effectName = "Eff_Parmon_Evolution_Successful"
	},
	EvolutionAnimation = {
		startTime = 6.8,
		animStateList = {
			{
				"Behav_HappyStart",
				"Behav_HappyLoop",
				"Behav_HappyEnd",
				{}
			},
			{
				"Behav_LoveStart",
				"Behav_LoveLoop",
				"Behav_LoveEnd",
				{}
			}
		}
	},
	FnrMaterialResName = AddressDataConst.EVOLUTION_MATERIAL_FNR,
	CameraAnimationResName = AddressDataConst.EVOLUTION_CAMERA_ANIMATION_PET,
	UIWhileList = {
		[UIConst.UI_ID_PET_EVOLVE_PET_SHOW] = true
	},
	CameraOffset = {
		multi = 0,
		add = 0
	},
	CameraPivotOffset = {
		multi = 0.65,
		add = 0
	},
	Pos = Vector3.New(0, 5000, 0),
	CameraPrefab = AddressDataConst.EVOLUTION_CAMERA_PREFAB
}

return EvolutionConst
