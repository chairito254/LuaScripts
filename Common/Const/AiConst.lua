-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\AiConst.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local CharacterStateConst = require("Common.Const.CharacterStateConst")
local BehaviorPathMapData = require("Common.Data.BehaviacData.Meta.BehaviorPathMapData")
local EntityTagData = require("Data.entity_tag_data")
local Const = require("Common.Const.Const")
local AiConst = {}

AiConst.AI_DEBUG = {
	MODE = true,
	NAVMESH_LOG = false,
	SELFIE = false,
	PERCEPTIBILITY_NO_IMP = false,
	PERCEPTIBILITY_ID = 0,
	PERCEPTIBILITY = false,
	EVENT_LOG = false,
	PORT = 60779,
	ENT_ID = 0,
	REGISTRATION_INFO = UNITY_EDITOR,
	NODE_LOG = {
		Console_Receive = false,
		Console_Send_Process = false,
		Console_Send_Property = false,
		EntId = -1,
		Enable = false
	}
}
AiConst.CPP = true
AiConst.CT_V2 = true
AiConst.GLOBAL_OPEN_TICK = true
AiConst.DefaultNullTable = Const.CACHED_EMPTY_TABLE
AiConst.BEHAVIOR_TABLE_SLOT = {
	ShinningAdditive = "shinningAdditiveBehavTable",
	AllShinning = "allShinningBehavTable",
	EliteAdditive = "eliteAdditiveBehavTable",
	All = "allBehavTable",
	Additive = "additiveBehavTable",
	AllElite = "allEliteBehavTable"
}
AiConst.TICK_INTERVAL = {
	Normal = 2,
	Special = 1
}
AiConst.STATE_MESSAGE_INTERVAL = 5
AiConst.PERCEPTIBILITY_INTERVAL = 0.5
AiConst.PERCEPTIBILITY_NO_IMP_INTERVAL = 1
AiConst.LOD = {
	High = 1,
	VeryLow = 10,
	Low = 5,
	Mid = 2
}
AiConst.TICK_TRIGGER_LOD = {
	High = 1,
	AllMulti = 300,
	VeryLow = 25,
	Low = 10,
	Mid = 3
}
AiConst.TICK_TRIGGER_LOD_NAME = "TickTriggerLOD"
AiConst.TICK_TRIGGER_NAME = "TickTrigger"
AiConst.ForceRunBtReason = {
	AFKMode = 1,
	Default = 0
}
AiConst.ResetStateType = {
	enter = 1,
	pause = 3,
	exit = 2,
	resume = 4
}
AiConst.PauseBtReason = {
	BreakFall = 10,
	Charm = 11,
	KnockBack = 12,
	KnockUp = 13,
	Dead = 14,
	ClientVisible = 15,
	Capture = 16,
	VoxelLoading = 24,
	DialogueControl = 32,
	SkeletonLoaded = 33,
	HomeInitPetData = 34,
	UltimateAbility = 35,
	SupportAbility = 36,
	SheepGather = 37,
	BeCarry = 38,
	NpcInteractUIEnd = 1999,
	NpcInteractUIStart = 1000,
	SandboxSpecial = 52,
	Confuse = 51,
	SceneLoading = 50,
	PhotoTimePause = 49,
	SneakOutByHit = 48,
	TouchPet = 47,
	SupportPet = 46,
	AnimatorReady = 45,
	ClientModelActive = 44,
	PetCafeInteract = 43,
	ArkPropshop = 42,
	FishingCapture = 41,
	NpcDuelStart = 40,
	Vehicle = 39,
	Microphone = 23,
	BeStick = 22,
	CombatControl = 21,
	DialogueGraph = 20,
	Attach = 19,
	Photo = 18,
	PlayAnimationScript = 17,
	HideShowEntityDic = 31,
	DummyClone = 30,
	AbilityAction = 29,
	InPetBall = 28,
	ChainAttack = 27,
	SandBoxLoading = 26,
	SpaceLoading = 25,
	AppearDash = 9,
	Break = 8,
	Authority = 7,
	Summon = 6,
	InHit = 5,
	Stun = 4,
	Visible = 3,
	Control = 2,
	GM = 1,
	Default = 0
}
AiConst.IgnoreAILodReason = {
	InPetBall = 1,
	GamePlay = 2,
	Route = 0
}
AiConst.IgnoreAILuaLodReason = 1
AiConst.PauseBtReasonNeedBreakPlan = {
	[AiConst.PauseBtReason.Control] = true,
	[AiConst.PauseBtReason.Capture] = true,
	[AiConst.PauseBtReason.TouchPet] = true
}
AiConst.SERVICE_REQUEST_TYPE = {
	FIDN_RANDOM_POINT = 3,
	FIND_SAMPLE_POSITION = 2,
	FIND_PATH = 1,
	RAYCAST_HIT = 4
}
AiConst.ACTION_TYPE = {
	State = 5,
	ShowBubble = 4,
	PlayAnim = 3,
	Random = 2,
	Sequence = 1,
	Wait = 0,
	MoveMode = 7,
	TemplateRef = 6
}
AiConst.PATH_STATE = {
	PATROL = 1,
	EXITED = 4,
	ACTION_EXITING = 3,
	ACTION_RUNNING = 2
}
AiConst.PATROL_SUB_STATE = {
	ST_Sleep = 4,
	ST_Rest = 3,
	ST_PatrolRun = 2,
	ST_PatrolWalk = 1,
	ST_None = 0
}
AiConst.PATROL_MOVE_MAX_TIME = 30
AiConst.PATROL_SPLINE_MAX_TIME = 120
AiConst.PATROL_SPLINE_LONG_MAX_TIME = 600
AiConst.PATROL_SUB_STATE_REV = {}

for k, v in pairs(AiConst.PATROL_SUB_STATE) do
	AiConst.PATROL_SUB_STATE_REV[v] = k
end

AiConst.CompositeType = {
	Sequence = 0,
	SelectorProbability = 1
}
AiConst.AUTO_PATH_CLOSE_LEN = 0.2
AiConst.FOLLOW_SAME_POS_SQR_DELTA = 0.01
AiConst.MAX_CHECK_DISTANCE = 400
AiConst.WALK_RANGE = 1.5
AiConst.WALK_MAX_HEIGHT = 2
AiConst.FOLLOW_ANIMATION_STATE_SWAP_TIME = 3
AiConst.FOLLOW_SPEED_SLOWDOWN_DEGREE = 70
AiConst.FOLLOW_SPEED_MAX_RATE = 1.2
AiConst.FOLLOW_SPEED_TARGET_RATE = 1.5
AiConst.FOLLOW_SPEED_MIN_RATE = 0.8
AiConst.FOLLOW_TOO_CLOSE = 0.5
AiConst.FOLLOW_CLOSE = 1.5
AiConst.FOLLOW_CLOSE_POW_2 = AiConst.FOLLOW_CLOSE * AiConst.FOLLOW_CLOSE
AiConst.FOLLOW_MID = 4
AiConst.FOLLOW_FAR = 5.5
AiConst.FOLLOW_TELEPORT = 20
AiConst.FOLLOW_MASTER_START_SPEED = 0.5
AiConst.FOLLOW_MASTER_SPEED_UP_SPEED = 4
AiConst.FOLLOW_LOCAL_MASTER_ANGLE = 150
AiConst.FOLLOW_SLOW_DOWN_TIME = 5
AiConst.FOLLOW_HEIGHT = 3
AiConst.PET_FOLLOW_DEGREE = 70
AiConst.PET_FOLLOW_RATIO = 0.66
AiConst.PET__FOLLOW_CAMERA_AFFECT_ANGLE = 80
AiConst.FOLLOW_SPEED_RATE = 0.7
AiConst.FOLLOW_RANGE_PLAN = 8
AiConst.FOLLOW_DEGREE = 120
AiConst.FOLLOW_CD = 20
AiConst.MAX_LEAVE_DISTANCE = 50
AiConst.LEVEL_DISTANCE = 10
AiConst.LEVEL_BACK_DISTANCE = 2
AiConst.MIN_LEAVE_DISTANCE = 2
AiConst.FLY_LEAVE_HEIGHT = 3
AiConst.DIRECTION_ANGLE = 60
AiConst.LEAVE_TARGET_DIRECTION_RECTIFIED_RATE = 0.9
AiConst.RANDOM_RADIUS = 2
AiConst.NAVMESH_RANDOM_RADIUS = 1
AiConst.MOVE_CD = 10
AiConst.NAVMESH_SERVICE_DEFAULIT_TIME = 10
AiConst.TARGET_POINT_STOP_DIST = 0.2
AiConst.STOP_DIST_MIN = 4
AiConst.SQUARE_TARGET_POINT_STOP_DIST = AiConst.TARGET_POINT_STOP_DIST * AiConst.TARGET_POINT_STOP_DIST
AiConst.DODGE_TIMEOUT = 2
AiConst.WALK_BACK_CD = 10
AiConst.CATCH_FAILURE_LEAVE_TIMEOUT = 10
AiConst.JUMP_TIME_OUT = 10
AiConst.JUMP_MAX_HEIGHT = 2
AiConst.DEFAULT_JUMP_MAX_DIST = 10
AiConst.EPSILON = 1.4013e-45
AiConst.KEEP_DIST_TIME = 1
AiConst.LET_GO_TIMEOUT = 5
AiConst.PET_PATROL_MATER_FORWARD = 10
AiConst.PET_PATROL_MASTER_BACK = -2
AiConst.PET_PATROL_RANGE_DEGREE = 45
AiConst.PET_MOVE_NEAR_DIST = 1
AiConst.PET_MOVE_ASIDE_EXTEND_DIST = 1
AiConst.PET_MOVE_ASIDE_MIN_DIST = 0.5
AiConst.PET_MOVE_ASIDE_MAX_DIST = 20
AiConst.PET_MOVE_ASIDE_ANGLE_RANGE = 150
AiConst.PET_MOVE_EXTRA_DIST_IN_SELFIE = 2
AiConst.PET_MOVE_RANGE_LENGTH_IN_SELFIE = 2
AiConst.PET_MOVE_RANGE_ANGLE_IN_SELFIE = 30
AiConst.PET_MOVE_OPTION_ANGLE_IN_SELFIE = 10
AiConst.PET_MOVE_REPATH_CD = 1
AiConst.TURN_YAW_MAX_TIME = 2
AiConst.LEAVE_REPTAH_CD = 0.7
AiConst.DEFAULT_REPATH_CD = 0.7
AiConst.BEHAVIOR_CD_REASON = {
	FailCD = 3,
	SuccessCD = 2,
	StartCD = 1,
	ActiveFailCD = 6,
	FailGCD = 5,
	SuccessGCD = 4
}
AiConst.MOVE_AROUND_POS_NUM = 18
AiConst.MOVE_AROUND_POS_DELTA_ANGLE = 10
AiConst.MOVE_AROUND_FADE_POS_NUM = 6
AiConst.MAX_OVERRIDE_CAN_SWIM = 3
AiConst.HIDE_EMOJI_BUBBLE_TIMEOUT = 30
AiConst.SYNC_POINT_CUSTOM_INDEX = 10
AiConst.DEFAULT_ANIM_FADE_TIME = 0.2
AiConst.FLY_DEFAULT_STOP_DISTANCE = 0.2
AiConst.FLY_DEFAULT_TIMEOUT = 5
AiConst.FLY_AROUND_POS_NUM = 18
AiConst.FLY_AROUND_POS_DELTA_ANGLE = 10
AiConst.COMBO_INTERRUPT_PROB = 0.3
AiConst.PET_COMBO_INTERRUPT_PROB = 0.1
AiConst.AI_CONTROL_FLAG = {
	Capture = 2,
	Default = 1,
	Battle = 4
}
AiConst.PET_FEAR_LEVEL = 5
AiConst.PET_TELEPORT_DEGREE = {
	MaxDegree = 75,
	MinDegree = 45
}
AiConst.VOXEL_SEARCH_HEIGHT = 0.5
AiConst.PATROL_STATE = {
	Surf = 11,
	Wait = 7,
	ClimbWaterfall = 10,
	Jump = 9,
	Climb = 8,
	Disable = 6,
	WayPointBehaviorTurn = 5,
	WayPointBehavior = 4,
	MovingBehavior = 3,
	IntermittentPatrol = 2,
	Patrol = 1,
	Init = 0
}
AiConst.CLIMB_STATE = {
	ClimbEmoji = 3,
	ClimbWait = 2,
	ClimbMove = 1,
	ClimbOn = 0,
	ClimbDisable = 5,
	ClimbOff = 4
}
AiConst.CLIMB_WATERFALL_STATE = {
	ClimbWaterfallOn = 0,
	ClimbWaterfallDisable = 3,
	ClimbWaterfallOff = 2,
	ClimbWaterfallMove = 1
}
AiConst.SURF_PLAN_STATE = {
	SurfMove = 1,
	SurfOn = 0,
	SurfDisable = 3,
	SurfOff = 2
}
AiConst.SURF_Action = {
	SurfStart = 0,
	SurfStop = 3,
	SurfJump = 2,
	SurfLoop = 1
}
AiConst.SURF_ACTION_STATE = {
	[AiConst.SURF_Action.SurfStart] = CharacterStateConst.SURFSTART,
	[AiConst.SURF_Action.SurfLoop] = CharacterStateConst.SURFLOOP,
	[AiConst.SURF_Action.SurfJump] = CharacterStateConst.SURFJUMP,
	[AiConst.SURF_Action.SurfStop] = CharacterStateConst.SURFSTOP
}
AiConst.ClimbWaterfallEndType = {
	JumpTop = 0,
	JumpOut = 1
}
AiConst.ClimbType = {
	ClimbEmoji = 2,
	ClimbWait = 1,
	ClimbMove = 0
}
AiConst.CHARGE_SKILL_STATE = {
	Charge = 3,
	initCharged = 2,
	Uncharged = 1,
	Skill = 4
}
AiConst.DEFAULT_SENSOR_TREE_PATH_PRE = "MBTree/MBSubTree/"
AiConst.DEFAULT_PARMON_BEHAVIOR_TREE_PATH_PRE = "ParmonBehaviorTree/SubTree/"
AiConst.DEFAULT_PLAN_MIN_PRIORITY = -999999
AiConst.DEFAULT_PERCEPTIBLITY_ATTENUATION = -10
AiConst.PET_COMMAND_MODE = {
	Normal = 1,
	Conductor = 2
}
AiConst.DefaultAnimationClipLength = 0
AiConst.DefaultAnimationTimeout = 5
AiConst.DefaultSwitchStateTimeout = 10
AiConst.RemoteSyncSqrtDistance = 400
AiConst.DefaultGlideVelocityY = 2
AiConst.NAVMESH_SERVICE = {
	REQ_FAILED_ID = 0,
	REQ_MAX_ID = 2147483647,
	REQ_MIN_ID = 100,
	REQ_LOCAL_ID = 99
}
AiConst.AUTO_PATH_REQ_STATE = {
	PartialSuccess = 8,
	ForceCancel = 7,
	Success = 6,
	ResponsePathDiscard = 5,
	SceneIdNotMatch = 3,
	ServicePathNotFound = 2,
	ServiceError = 1,
	Invalid = 0,
	PartialSuccessExceedDistance = 9
}
AiConst.SMDefaultBaseState = {
	[BaseEnum.EBTRootState.ST_Root_Born] = BehaviorPathMapData.EnumNameMap.PBT_Behav_Com_Born,
	[BaseEnum.EBTRootState.ST_Root_Idle] = BehaviorPathMapData.EnumNameMap.PBT_Idle,
	[BaseEnum.EBTRootState.ST_Root_Alert] = BehaviorPathMapData.EnumNameMap.PBT_Idle,
	[BaseEnum.EBTRootState.ST_Root_Sensed] = BehaviorPathMapData.EnumNameMap.PBT_Idle,
	[BaseEnum.EBTRootState.ST_Root_Follow] = BehaviorPathMapData.EnumNameMap.PBT_FollowIdle,
	[BaseEnum.EBTRootState.ST_Root_Guide] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Combat] = BehaviorPathMapData.EnumNameMap.PBT_AutoCombat,
	[BaseEnum.EBTRootState.ST_Root_GoHome] = BehaviorPathMapData.EnumNameMap.PBT_GoHome,
	[BaseEnum.EBTRootState.ST_Root_Recruit] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Wait] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Dead] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Afk] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_HomeLand] = BehaviorPathMapData.EnumNameMap.PBT_Behav_Home_IdlePatrol
}
AiConst.PetSMDefaultBaseState = {
	[BaseEnum.EBTRootState.ST_Root_Born] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Idle] = BehaviorPathMapData.EnumNameMap.PBT_FollowIdle,
	[BaseEnum.EBTRootState.ST_Root_Alert] = BehaviorPathMapData.EnumNameMap.PBT_FollowIdle,
	[BaseEnum.EBTRootState.ST_Root_Sensed] = BehaviorPathMapData.EnumNameMap.PBT_FollowIdle,
	[BaseEnum.EBTRootState.ST_Root_Follow] = BehaviorPathMapData.EnumNameMap.PBT_Pet_Follow,
	[BaseEnum.EBTRootState.ST_Root_Guide] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Combat] = BehaviorPathMapData.EnumNameMap.PBT_AutoCombat,
	[BaseEnum.EBTRootState.ST_Root_GoHome] = BehaviorPathMapData.EnumNameMap.PBT_GoHome,
	[BaseEnum.EBTRootState.ST_Root_Recruit] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Wait] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Dead] = BehaviorPathMapData.EnumNameMap.PBT_Noop,
	[BaseEnum.EBTRootState.ST_Root_Afk] = BehaviorPathMapData.EnumNameMap.PBT_Pet_Afk_Common,
	[BaseEnum.EBTRootState.ST_Root_HomeLand] = BehaviorPathMapData.EnumNameMap.PBT_Behav_Home_IdlePatrol
}
AiConst.ParmonPlanType = {
	SensorPlan = 5,
	BornPlan = 4,
	PatrolPlan = 3,
	EventPlan = 1,
	None = 999,
	SurfPlan = 9,
	ClimbWaterfallPlan = 8,
	NPCLeadPlan = 7,
	ClimbPlan = 6
}
AiConst.PatrolType = {
	Climb = 3,
	Glide = 2,
	Normal = 1,
	NPCLead = 4
}
AiConst.BehavType = {
	base = "base",
	additive = "additive"
}
AiConst.AIBeInterruptedType = {
	CanInterruptedByEP = 4,
	CanInterruptedBySelf = 2,
	CanInterruptedByHighPriority = 1
}
AiConst.Follow_Type = {
	Teleport = 5,
	SpeedUpFollow = 4,
	SlowDownFollow = 3,
	NormalFollow = 2,
	MoveAway = 1
}
AiConst.NpcStatusType = {
	Finish = 2,
	Running = 1,
	Abort = 3,
	None = 0
}
AiConst.EnvObjRVOType = {
	EnableDynamicRVO = 2,
	Disable = 0,
	EnableStaticRVO = 1
}
AiConst.RVODisableControlType = {
	ControlPlayerSwitchToPet = 8,
	BeUnSummoned = 5,
	BeStick = 6,
	Airing = 3,
	Authority = 4,
	Visible = 7,
	Photo = 16,
	SimpleMoveEntityFarDistance = 14,
	Climb = 2,
	Disable = 1,
	FarDistance = 14,
	BeGrab = 13,
	StaticSpawn = 12,
	NoCollision = 11,
	Dialogue = 10,
	HomePetEvent = 9
}
AiConst.TeleportMinDistance = 0.1
AiConst.CatchMode_LowHPPercent = 0.2
AiConst.InvadeMode_PetCombatRange = 15
AiConst.AIControllerDisableReason = Const.ControlDisableReason
AiConst.MovementConst = {
	AreaDataType = {
		RelativeFocusPos = 1
	},
	PosUpdateStrategyType = {
		PetFollow = 1
	},
	ArriveStrategyType = {
		CommonArrive = 1
	}
}
AiConst.TrapNearBy = {
	height = 2,
	distance = 5
}
AiConst.MimicryState = {
	Defense = 1,
	Fake = 2,
	None = 0
}
AiConst.EBehaviorPatrolMoveType = {
	Climb = 2,
	Surf = 4,
	Common = 0,
	ClimbWaterfall = 3,
	Jump = 1
}
AiConst.HTNTaskType = {
	Primitive = 1,
	Compound = 2,
	None = 0
}
AiConst.AIDayTimeType = {
	Day = 1,
	Night = 2,
	None = 0
}
AiConst.WorldDayTime2AIDayTime = {
	[Const.TimePeriod.Morning] = AiConst.AIDayTimeType.Day,
	[Const.TimePeriod.Day] = AiConst.AIDayTimeType.Day,
	[Const.TimePeriod.Dusk] = AiConst.AIDayTimeType.Day,
	[Const.TimePeriod.Night] = AiConst.AIDayTimeType.Night
}
AiConst.HomePetMoveSpeed = 3
AiConst.HomePetMoveMaxTimeDelta = 1.5
AiConst.HomePetVoxelPatrol = {
	standSearchDistance = 3,
	standSearchCells = 2,
	standHeightRange = 2,
	moveTimeDelta = 5,
	moveTimeRatio = 3
}
AiConst.RequestBuffTimeout = 1
AiConst.DefaultPGCommonNone = "PG_Common_None"
AiConst.NpcReactionRange = 5
AiConst.CombatDodgeMaxTime = 0.2
AiConst.EAgentType = {
	PetAgent = 5,
	VirtualAIAgent = 8,
	PuppetAgent = 7,
	PetBallAgent = 6,
	luaAgent = 1,
	BotPlayerAgent = 4,
	CombatAgent = 3,
	WxAgent = 2
}
AiConst.CombatTag = "TE_Par_GroupCombat_TokenHolder"
AiConst.BotPlayerDefaultCombatTactic = "Common"
AiConst.LuaMethodResetStateOffset = 1000
AiConst.DecelerationDisableReason = {
	Logic = 1,
	AIDefault = 2,
	None = 0
}
AiConst.SimpleMoveBehaviorMode = {
	Router = 1,
	None = 0,
	FollowEntity = 4,
	PlaySleAnim = 3,
	PlaySingleAnim = 2
}
AiConst.RouteType = {
	Simple = 1,
	Default = 0
}
AiConst.DefaultPathFindInvalidId = 0
AiConst.OfflineBehavGroupId = "BG_Wild_Com_IdlePatrol"
AiConst.BattleFieldRadius = 30
AiConst.DROP_STUN_BUFF_ID = 10072
AiConst.DROP_STUN_DURATION_MIN = 2
AiConst.DROP_STUN_HEIGHT = 5
AiConst.clientMoveStateMap = {
	[CharacterStateConst.SNEAK] = function()
		return CharacterStateConst.SNEAKMOVE
	end,
	[CharacterStateConst.GROUND] = function()
		return CharacterStateConst.GROUNDWALK
	end,
	[CharacterStateConst.FLYING] = function()
		return CharacterStateConst.FLYMOVE
	end,
	[CharacterStateConst.CLIMBING] = function()
		return CharacterStateConst.CLIMBMOVE
	end,
	[CharacterStateConst.CLIMBWATERFALL] = function(SpeedRateType)
		if SpeedRateType == BaseEnum.SpeedRateType.Slow then
			return CharacterStateConst.CLIMBWATERFALLIDLE
		elseif SpeedRateType == BaseEnum.SpeedRateType.Fast or SpeedRateType == BaseEnum.SpeedRateType.Burst then
			return CharacterStateConst.CLIMBWATERFALLJUMPDASH
		end

		return CharacterStateConst.CLIMBWATERFALLMOVE
	end,
	[CharacterStateConst.GLIDING] = function()
		return CharacterStateConst.GLIDEMOVE
	end,
	[CharacterStateConst.MIMICRY] = function()
		return CharacterStateConst.MIMICRYIDLE
	end,
	[CharacterStateConst.STATICSPAWN] = function()
		return CharacterStateConst.STATICSPAWNIDLE
	end,
	[CharacterStateConst.SPECIALMOVE] = function()
		return CharacterStateConst.SPECIALMOVEFORWARD
	end,
	[CharacterStateConst.SWIMMING] = function(SpeedRateType)
		if SpeedRateType == BaseEnum.SpeedRateType.Fast then
			return CharacterStateConst.SWIMFASTMOVE
		end

		return CharacterStateConst.SWIMMOVE
	end,
	[CharacterStateConst.LOCOMOTION] = function(SpeedRateType)
		if SpeedRateType == BaseEnum.SpeedRateType.Slow then
			return CharacterStateConst.WALK
		elseif SpeedRateType == BaseEnum.SpeedRateType.Fast then
			return CharacterStateConst.SPRINT
		elseif SpeedRateType == BaseEnum.SpeedRateType.Burst then
			return CharacterStateConst.SPEEDBURSTLOOP
		end

		return CharacterStateConst.RUN
	end
}
AiConst.serverMoveStateMap = {
	[CharacterStateConst.SNEAK] = function()
		return CharacterStateConst.SNEAKMOVE
	end,
	[CharacterStateConst.MIMICRY] = function()
		return CharacterStateConst.MIMICRYIDLE
	end,
	[CharacterStateConst.FLYING] = function()
		return CharacterStateConst.FLYMOVE
	end,
	[CharacterStateConst.LOCOMOTION] = function(SpeedRateType)
		if SpeedRateType == BaseEnum.SpeedRateType.Slow then
			return CharacterStateConst.WALK
		end

		return CharacterStateConst.RUN
	end
}
AiConst.idleStateMap = {
	[CharacterStateConst.SNEAK] = CharacterStateConst.SNEAKIDLE,
	[CharacterStateConst.FLYING] = CharacterStateConst.FLYHOVER,
	[CharacterStateConst.GROUND] = CharacterStateConst.GROUNDIDLE,
	[CharacterStateConst.CLIMBING] = CharacterStateConst.CLIMBIDLE,
	[CharacterStateConst.CLIMBWATERFALL] = CharacterStateConst.CLIMBWATERFALLIDLE,
	[CharacterStateConst.MIMICRY] = CharacterStateConst.MIMICRYIDLE,
	[CharacterStateConst.GLIDING] = CharacterStateConst.GLIDEIDLE,
	[CharacterStateConst.SWIMMING] = CharacterStateConst.SWIMIDLE,
	[CharacterStateConst.LOCOMOTION] = CharacterStateConst.IDLE
}

return AiConst
