-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\PerceptibilityConst.lua

local PerceptibilityConst = {}
local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local EBTRootState = BaseEnum.EBTRootState

PerceptibilityConst.ENTITY_TYPE = {
	PET = 3,
	PLAYER_PET = 2,
	PLAYER = 1,
	ITEM_ENTITY = 13,
	PUPPET = 4
}
PerceptibilityConst.GENDER_RESPONSE = {
	ALL_GENDER = 0,
	DIFF_GENDER = 2,
	SAME_GENDER = 1
}
PerceptibilityConst.SensorState = {
	Free = 0,
	WaitFailCoolDown = 3,
	WaitCoolDown = 2,
	Active = 1
}
PerceptibilityConst.SensorType = {
	Other = 4,
	EnvObj = 3,
	Pamon = 2,
	Player = 1
}
PerceptibilityConst.VisionType = {
	Sight = 1,
	Audition = 2
}
PerceptibilityConst.PropertyName = {
	attenuationWait = "attenuationWait",
	ballHitAddValue = "ballHitAddValue",
	ballNearbyAddValue = "ballNearbyAddValue",
	valueShowEnd = "valueShowEnd",
	valueShowStart = "valueShowStart",
	valueSensed = "valueSensed",
	valueMax = "valueMax",
	valueAlert = "valueAlert",
	valueIdle = "valueIdle",
	visionHeight = "visionHeight",
	visionAreaSleep = "visionAreaSleep",
	visionAreaDefault = "visionAreaDefault",
	attenuation = "attenuation",
	valueChange = "valueChange",
	invisibleSwitch = "invisibleSwitch",
	rayCastingSwitch = "rayCastingSwitch",
	tallGrassSwitch = "tallGrassSwitch",
	playerCrounch = "playerCrounch",
	playerSprint = "playerSprint",
	playerRun = "playerRun",
	playerIdle = "playerIdle",
	visionType = "visionType"
}
PerceptibilityConst.VisionState = {
	addPerceivedValue = -1,
	subPerceivedValue = 0
}
PerceptibilityConst.VisionFilterReason = {
	NotResponse = 1,
	None = 0,
	Affinity = 15,
	ControllingPet = 14,
	SmokeBlock = 13,
	BeAttached = 12,
	InHighGrassArea = 11,
	Friend = 10,
	AreaFilter = 9,
	HighVision = 8,
	Dead = 7,
	SameEthnicity = 6,
	SameSpecies = 5,
	SneakTallGrass = 4,
	Invisible = 3,
	BlockedRayCast = 2
}
PerceptibilityConst.SenseState = {
	Alert = 1,
	None = 0,
	Sensed = 2
}
PerceptibilityConst.PauseReason = {
	AIPause = 2,
	BeTrapped = 1,
	GM = 4,
	Authority = 3
}
PerceptibilityConst.DontNeedClearAllPerceptibilityOnAgentRootState = {
	[EBTRootState.ST_Root_Born] = true,
	[EBTRootState.ST_Root_Idle] = true,
	[EBTRootState.ST_Root_Alert] = true,
	[EBTRootState.ST_Root_Sensed] = true,
	[EBTRootState.ST_Root_Combat] = true
}
PerceptibilityConst.NeedUpdatePerceptibilityOnAgentRootState = {
	[EBTRootState.ST_Root_Born] = true,
	[EBTRootState.ST_Root_Idle] = true,
	[EBTRootState.ST_Root_Alert] = true,
	[EBTRootState.ST_Root_Sensed] = true,
	[EBTRootState.ST_Root_Follow] = true
}

return PerceptibilityConst
