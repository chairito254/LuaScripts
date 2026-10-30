-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\BaseEnum\\BaseEnum.lua

local _M = {}

_M.AbilityType = {
	Climb = 4,
	SkateBoard = 3,
	Glide = 2,
	Swim = 1,
	HideMimicry = 7,
	Fly = 6,
	SwimMimicry = 5
}
_M.AbilityType_NAME = {
	"Swim",
	"Glide",
	"SkateBoard",
	"Climb",
	"SwimMimicry",
	"Fly",
	"HideMimicry"
}
_M.AIAnimationRootMotionType = {
	RootPosition = 2,
	None = 1,
	Default = 0,
	RootMotion = 4,
	RootRotation = 3
}
_M.BlendType = {
	Cubic = 4,
	EaseInOut = 3,
	EaseOut = 2,
	EaseIn = 1,
	Linear = 0
}
_M.CalcQualifiedPosQueryType = {
	EightCompassDirections = 0
}
_M.CastAbilitySourceType = {
	Normal = 0,
	Let_go_env_obj = 5,
	Call_Friends = 4
}
_M.EBTRootState = {
	ST_Root_Born = 0,
	ST_Root_Dead = 100,
	ST_Root_HomeLand = 99,
	ST_Root_Wait = 10,
	ST_Root_GoHome = 9,
	ST_Root_Combat = 8,
	ST_Root_Afk = 7,
	ST_Root_Guide = 6,
	ST_Root_Follow = 5,
	ST_Root_Recruit = 4,
	ST_Root_Sensed = 3,
	ST_Root_Alert = 2,
	ST_Root_Idle = 1
}
_M.EBTRootState_NAME = {
	[0] = "ST_Root_Born",
	"ST_Root_Idle",
	"ST_Root_Alert",
	"ST_Root_Sensed",
	"ST_Root_Recruit",
	"ST_Root_Follow",
	"ST_Root_Guide",
	"ST_Root_Afk",
	"ST_Root_Combat",
	"ST_Root_GoHome",
	"ST_Root_Wait",
	[100] = "ST_Root_Dead",
	[99] = "ST_Root_HomeLand"
}
_M.EBTStatus = {
	BT_SUCCESS = 1,
	BT_INVALID = 0,
	BT_RUNNING = 3,
	BT_FAILURE = 2
}
_M.MoveUpdateLevel = {
	Once = 99999,
	Slow = 20,
	Fast = 2,
	VeryFast = 0,
	Normal = 10
}
_M.PathFindType = {
	Voxel = 5,
	Physics = 4,
	ForceMove = 3,
	AirNav = 2,
	Navmesh = 1,
	Auto = 0
}
_M.PetActionMode = {
	Invade = 2,
	Peace = 1,
	Catch = 0
}
_M.RootMotionSyncPointEnum = {
	Point4 = 3,
	Point3 = 2,
	Point2 = 1,
	Point1 = 0,
	AICustomPoint3 = 12,
	AICustomPoint2 = 11,
	AICustomPoint1 = 10,
	Point9 = 8,
	Point8 = 7,
	Point7 = 6,
	Point6 = 5,
	Point5 = 4
}
_M.SpeedRateType = {
	Fast = 2,
	Slow = 0,
	Mid = 1,
	Burst = 3
}
_M.RelationType = {
	arbitrary = 4,
	neutral = 3,
	enemy = 2,
	partner = 1
}

return _M
