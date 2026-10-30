-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\ClientAbilityConst.lua

local AbilityConst = require("Common.Const.AbilityConst")
local ClientAbilityConst = {}

ClientAbilityConst.MESH_HIT_BOX_COLOR = {
	b = 0,
	g = 0,
	a = 0.4196078431372549,
	r = 1
}
ClientAbilityConst.MESH_GROUND_SWEEP_COLOR = {
	b = 0,
	g = 1,
	a = 0.4196078431372549,
	r = 0
}
ClientAbilityConst.MESH_HIT_BODY_COLOR = {
	b = 0,
	g = 1,
	a = 0.4196078431372549,
	r = 0
}
ClientAbilityConst.MESH_RB_COLLIDER_COLOR = {
	b = 1,
	g = 0,
	a = 0.4196078431372549,
	r = 0
}
ClientAbilityConst.MESH_COMBAT_COLLIDER_COLOR = {
	b = 0,
	g = 0.45,
	a = 0.12549019607843137,
	r = 1
}
ClientAbilityConst.MESH_RB_CATCH_COLLIDER_COLOR = {
	b = 1,
	g = 1,
	a = 0.4196078431372549,
	r = 0
}
ClientAbilityConst.HIT_BOX_PART_ANIS = {
	[AbilityConst.HIT_BOX_PART_TYPE.Head] = "Hit_Shake_Head",
	[AbilityConst.HIT_BOX_PART_TYPE.HandL] = "Hit_Shake_Hand_L",
	[AbilityConst.HIT_BOX_PART_TYPE.HandR] = "Hit_Shake_Hand_R",
	[AbilityConst.HIT_BOX_PART_TYPE.FootL] = "Hit_Shake_Foot_L",
	[AbilityConst.HIT_BOX_PART_TYPE.FootR] = "Hit_Shake_Foot_R",
	[AbilityConst.HIT_BOX_PART_TYPE.Tail] = "Hit_Shake_Tail",
	[AbilityConst.HIT_BOX_PART_TYPE.Body] = "Hit_Shake",
	[AbilityConst.HIT_BOX_PART_TYPE.Extra1] = "Hit_Shake_Extra1",
	[AbilityConst.HIT_BOX_PART_TYPE.Extra2] = "Hit_Shake_Extra2",
	[AbilityConst.HIT_BOX_PART_TYPE.Extra3] = "Hit_Shake_Extra3",
	[AbilityConst.HIT_BOX_PART_TYPE.Extra4] = "Hit_Shake_Extra4"
}
ClientAbilityConst.ATTRIBUTE_SHOW_TYPE = {
	FLOAT = 2,
	PERCENT = 1,
	INT = 0
}
ClientAbilityConst.SOUND_RANGE_TYPE = {
	Projectile = 2,
	Melee = 1
}
ClientAbilityConst.PLAY_CUT_SCENE_POS = {
	0,
	5000,
	0
}
ClientAbilityConst.TICK_LOD = {
	{
		2500,
		900,
		225
	},
	{
		1,
		0.5,
		0
	}
}
ClientAbilityConst.HIT_CANCEL_ABILITY_CTS = {
	THORNS_HIT = true,
	KNOCK_UP = true,
	KNOCK_BACK = true,
	KNOCK_HEAVY = true,
	KNOCK_LIGHT = true
}
ClientAbilityConst.ROOT_MOTION_SCALE_KEYS = {
	DEFAULT = 1,
	DUMMY_CLONE = 2
}
ClientAbilityConst.ProjectileSweepShape = {
	Box = 1,
	Sphere = 0
}
ClientAbilityConst.IndicatorType = {
	AimWalk = 3,
	ShowAim = 2,
	SelectPos = 1
}
ClientAbilityConst.EFFECT_POST_FOLLOW_TYPE = {
	RotationTowardsAimPos = 0,
	CustomTransformPosAndStickGround = 1
}
ClientAbilityConst.TIMELINE_FAST_FORWARD_SKIP_ACTIONS = {
	applyHitCameraImpulse = true,
	playCameraPerlinNoiseImpulse = true,
	playCameraImpulseAnim = true,
	playCameraImpulse = true,
	playCameraImpulseById = true,
	cancelCameraLockOnTarget = true,
	cameraLockOnTarget = true,
	cancelCameraFaceTo = true,
	cameraFaceTo = true,
	cameraEvent = true,
	cameraBlendToPitch = true,
	cancelFovCameraAnim = true,
	playFovCameraAnim = true,
	cancelPitchYawCameraAnim = true,
	playPitchYawCameraAnim = true,
	stopSkillCameraAnim = true,
	playSoundAtPos = true,
	playHitSound = true,
	stopSoundStr = true,
	playSoundStr = true,
	fadeFovCameraAnimOnVelocityChange = true,
	resetLockOnCameraExtraYAngle = true,
	lockOnCameraSetExtraYAngle = true,
	resetCameraDistanceScale = true,
	setCameraDistanceScale = true
}

return ClientAbilityConst
