-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\CharacterStateConstImp.lua

local CharacterStateConst = {
	[0] = {
		name = "NONE"
	},
	{
		name = "LOCOMOTION",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SPEEDBURST",
		isStateMachine = true,
		parent = 1
	},
	{
		name = "SPEEDBURSTLOOP",
		parent = 2
	},
	{
		name = "IDLE",
		parent = 1
	},
	{
		name = "RUN",
		parent = 1
	},
	{
		name = "DASH",
		parent = 1
	},
	{
		name = "WALK",
		parent = 1
	},
	{
		name = "SPRINT",
		parent = 1
	},
	{
		name = "TURN",
		parent = 1
	},
	{
		name = "AIRING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "FALL",
		parent = 10
	},
	{
		name = "GROUNDFALL",
		parent = 10
	},
	{
		name = "JUMP",
		parent = 10
	},
	{
		name = "JUMPINRUN",
		parent = 10
	},
	{
		name = "CLIMBING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "CLIMBIDLE",
		parent = 15
	},
	{
		name = "CLIMBMOVE",
		parent = 15
	},
	{
		name = "CLIMBON",
		parent = 15
	},
	{
		name = "CLIMBOFF",
		parent = 15
	},
	{
		name = "FLYING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "FLYHOVER",
		parent = 20
	},
	{
		name = "FLYMOVE",
		parent = 20
	},
	{
		name = "FLYRISE",
		parent = 20
	},
	{
		name = "FLYENDGRAB",
		parent = 20
	},
	{
		name = "FLYSTARTGRAB",
		parent = 20
	},
	{
		name = "GLIDING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "GLIDEIDLE",
		parent = 26
	},
	{
		name = "GLIDEMOVE",
		parent = 26
	},
	{
		name = "GLIDESTART",
		parent = 26
	},
	{
		name = "SWIMMING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SWIMIDLE",
		parent = 30
	},
	{
		name = "SWIMFASTMOVE",
		parent = 30
	},
	{
		name = "SWIMMOVE",
		parent = 30
	},
	{
		name = "SWIMJUMP",
		parent = 30
	},
	{
		name = "SNEAK",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SNEAKIDLE",
		parent = 35
	},
	{
		name = "SNEAKMOVE",
		parent = 35
	},
	{
		name = "MIMICRY",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "MIMICRYIDLE",
		parent = 38
	},
	{
		name = "GROUND",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "GROUNDIDLE",
		parent = 40
	},
	{
		name = "GROUNDWALK",
		parent = 40
	},
	{
		name = "AIR2GROUND",
		parent = 40
	},
	{
		name = "SKATEBOARD",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SKATEBOARDMOVE",
		parent = 44
	},
	{
		name = "SWIMMIMICRY",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SWIMMIMICRYIDLE",
		parent = 46
	},
	{
		name = "SPECIALMOVE",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SPECIALMOVEFORWARD",
		parent = 48
	},
	{
		name = "SPECIALMOVEIDLE",
		parent = 48
	},
	{
		name = "MOUNTING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "MOUNT",
		parent = 51
	},
	{
		name = "MOUNTSPECIAL",
		parent = 51
	},
	{
		name = "MOUNTENTER",
		parent = 51
	},
	{
		name = "MOUNTEXIT",
		parent = 51
	},
	{
		name = "STORYBEHAVIOR",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "STORYTURN",
		parent = 56
	},
	{
		name = "HIDEMIMICRY",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "HIDEMIMICRYIDLE",
		parent = 58
	},
	{
		name = "STATICSPAWN",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "STATICSPAWNIDLE",
		parent = 60
	},
	{
		name = "PERFORM",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "PERFORMSTART",
		parent = 62
	},
	{
		name = "PERFORMLOOP",
		parent = 62
	},
	{
		name = "PERFORMEND",
		parent = 62
	},
	{
		name = "STATICLOCOMOTION",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "STATICLOCOMOTIONIDLE",
		parent = 66
	},
	{
		name = "CLIMBWATERFALL",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "CLIMBWATERFALLJUMPON",
		parent = 68
	},
	{
		name = "CLIMBWATERFALLMOVE",
		parent = 68
	},
	{
		name = "CLIMBWATERFALLIDLE",
		parent = 68
	},
	{
		name = "CLIMBWATERFALLJUMPDASH",
		parent = 68
	},
	{
		name = "CLIMBWATERFALLJUMPTOP",
		parent = 68
	},
	{
		name = "CLIMBWATERFALLJUMPOUT",
		parent = 68
	},
	{
		name = "LAND",
		parent = 0
	},
	{
		name = "FLYCHARGING",
		parent = 0
	},
	{
		name = "SNEAKIN",
		parent = 0
	},
	{
		name = "SNEAKOUT",
		parent = 0
	},
	{
		name = "SNEAKOUTBYHIT",
		parent = 0
	},
	{
		name = "DEAD",
		parent = 0
	},
	{
		name = "PLAYANIMATIONSCRIPT",
		parent = 0
	},
	{
		name = "GROUNDOUT",
		parent = 0
	},
	{
		name = "GROUNDIN",
		parent = 0
	},
	{
		name = "APPEARDASH",
		parent = 0
	},
	{
		name = "SPECIALDEFENSE",
		parent = 0
	},
	{
		name = "MIMICRYIN",
		parent = 0
	},
	{
		name = "MIMICRYOUT",
		parent = 0
	},
	{
		name = "SWIMMIMICRYIN",
		parent = 0
	},
	{
		name = "SWIMMIMICRYOUT",
		parent = 0
	},
	{
		name = "PATHFINDING",
		parent = 0
	},
	{
		name = "SPECIALMOVEIN",
		parent = 0
	},
	{
		name = "SPECIALMOVEOUT",
		parent = 0
	},
	{
		name = "HIDEMIMICRYIN",
		parent = 0
	},
	{
		name = "HIDEMIMICRYOUT",
		parent = 0
	},
	{
		name = "TAKEROOTIN",
		parent = 0
	},
	{
		name = "TAKEROOT",
		parent = 0
	},
	{
		name = "TAKEROOTOUT",
		parent = 0
	},
	{
		name = "BEGRAB",
		parent = 0
	},
	{
		name = "HOMEWORK",
		parent = 0
	},
	{
		name = "SANDBOXSPECIAL",
		parent = 0
	},
	{
		name = "CUSTOMANIMATION",
		parent = 1
	},
	{
		name = "RUNSTOP",
		parent = 1
	},
	{
		name = "SPRINTSTOP",
		parent = 1
	},
	{
		name = "CROUCHING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "CROUCHIDLE",
		parent = 104
	},
	{
		name = "CROUCHMOVE",
		parent = 104
	},
	{
		name = "CROUCHEXIT",
		parent = 104
	},
	{
		name = "SPEEDBURSTSTART",
		parent = 2
	},
	{
		name = "SPEEDBURSTEND",
		parent = 2
	},
	{
		name = "SPEEDBURSTFALL",
		parent = 2
	},
	{
		name = "SPEEDBURSTJUMP",
		parent = 2
	},
	{
		name = "SPRINTTURN",
		parent = 1
	},
	{
		name = "BOUNCE",
		parent = 10
	},
	{
		name = "CLIMBSLIP",
		parent = 15
	},
	{
		name = "CLIMBDASH",
		parent = 15
	},
	{
		name = "CLIMBSPRINT",
		parent = 15
	},
	{
		name = "FLYDASH",
		parent = 20
	},
	{
		name = "FLYSPRINT",
		parent = 20
	},
	{
		name = "GLIDERISE",
		parent = 26
	},
	{
		name = "SWIMDASH",
		parent = 30
	},
	{
		name = "FOURWAY",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "FOURWAYMOVE",
		parent = 121
	},
	{
		name = "FOURWAYIDLE",
		parent = 121
	},
	{
		name = "SKILLMOTION",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SKILLMOVE",
		parent = 124
	},
	{
		name = "SKILLJUMP",
		parent = 124
	},
	{
		name = "SKILLJUMPEND",
		parent = 124
	},
	{
		name = "SKILLJUMPFALL",
		parent = 124
	},
	{
		name = "SKILLIDLE",
		parent = 124
	},
	{
		name = "SKILLDASH",
		parent = 124
	},
	{
		name = "HOOKSPRINT",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "HOOKWAIT",
		parent = 131
	},
	{
		name = "HOOKSUCCESS",
		parent = 131
	},
	{
		name = "HOOKSPRINTLOOP",
		parent = 131
	},
	{
		name = "HOOKSUCCESSEND",
		parent = 131
	},
	{
		name = "HOOKFAILLOOP",
		parent = 131
	},
	{
		name = "HOOKFAILEND",
		parent = 131
	},
	{
		name = "HOOKAIM",
		parent = 131
	},
	{
		name = "HOOKSTART",
		parent = 131
	},
	{
		name = "SPECIALRIDE",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SPECIALRIDECLIMBON",
		parent = 140
	},
	{
		name = "SPECIALRIDEBREAKFAIL",
		parent = 140
	},
	{
		name = "SPECIALRIDEBREAKSUCCESS",
		parent = 140
	},
	{
		name = "SPECIALRIDEIDLE",
		parent = 140
	},
	{
		name = "LATERALATTACK",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "NORMALSTANDATTACK",
		parent = 145
	},
	{
		name = "LEFTSIDEATTACK",
		parent = 145
	},
	{
		name = "RIGHTSIDEATTACK",
		parent = 145
	},
	{
		name = "FRONTSIDEATTACK",
		parent = 145
	},
	{
		name = "BACKSIDEATTACK",
		parent = 145
	},
	{
		name = "SURF",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SURFSTART",
		parent = 151
	},
	{
		name = "SURFLOOP",
		parent = 151
	},
	{
		name = "SURFSTOP",
		parent = 151
	},
	{
		name = "SURFJUMP",
		parent = 151
	},
	{
		name = "SURFFALL",
		parent = 151
	},
	{
		name = "SKILL",
		parent = 0
	},
	{
		name = "NORMALATTACK",
		parent = 0
	},
	{
		name = "STRUGGLE",
		parent = 0
	},
	{
		name = "HOOKCANCEL",
		parent = 0
	},
	{
		name = "SKILLGLIDING",
		parent = 0
	},
	{
		name = "SKILLGLIDINGEND",
		parent = 0
	},
	{
		name = "INFLATEDASH",
		parent = 0
	},
	{
		name = "SOCIALANIM",
		parent = 0
	},
	{
		name = "CLOUD",
		parent = 0
	},
	{
		name = "CROUCHTHROWIDLE",
		parent = 104
	},
	{
		name = "CROUCHTHROWMOVE",
		parent = 104
	},
	{
		name = "THROWING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "THROWWALK",
		parent = 168
	},
	{
		name = "THROWIDLE",
		parent = 168
	},
	{
		name = "MAGNESIS",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "MAGNESISBEGIN",
		parent = 171
	},
	{
		name = "MAGNESISGRABWALK",
		parent = 171
	},
	{
		name = "MAGNESISTHROW",
		parent = 171
	},
	{
		name = "MAGNESISGRABIDLE",
		parent = 171
	},
	{
		name = "CLIMBACROSS",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "CLIMBACROSSSTEPUP",
		parent = 176
	},
	{
		name = "CLIMBACROSSL",
		parent = 176
	},
	{
		name = "CLIMBACROSSH",
		parent = 176
	},
	{
		name = "SKATEBOARDSTART",
		parent = 44
	},
	{
		name = "SKATEBOARDJUMPSTART",
		parent = 44
	},
	{
		name = "SKATEBOARDJUMPFALL",
		parent = 44
	},
	{
		name = "SKATEBOARDJUMPEND",
		parent = 44
	},
	{
		name = "DRUMMING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "DRUMIDLE",
		parent = 184
	},
	{
		name = "DRUMLEFTHAND",
		parent = 184
	},
	{
		name = "DRUMRIGHTHAND",
		parent = 184
	},
	{
		name = "DRUMLEFTSTOP",
		parent = 184
	},
	{
		name = "DRUMRIGHTSTOP",
		parent = 184
	},
	{
		name = "SKILLEND",
		parent = 124
	},
	{
		name = "SKILLIDLETOMOVE",
		parent = 124
	},
	{
		name = "SKILLMOVETOIDLE",
		parent = 124
	},
	{
		name = "SKILLBEGIN",
		parent = 124
	},
	{
		name = "SKILLTHROWING",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "SKILLTHROWIDLE",
		parent = 194
	},
	{
		name = "SKILLTHROWMOVE",
		parent = 194
	},
	{
		name = "WALKINGATTACK",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "WALKINGATTACKIDLE",
		parent = 197
	},
	{
		name = "WALKINGATTACKMOVE",
		parent = 197
	},
	{
		name = "BEGG",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "BEGGPICK",
		parent = 200
	},
	{
		name = "BEGGIDLE",
		parent = 200
	},
	{
		name = "BEGGRUN",
		parent = 200
	},
	{
		name = "BEGGDROP",
		parent = 200
	},
	{
		name = "BEGGLAND",
		parent = 200
	},
	{
		name = "BEGGFALL",
		parent = 200
	},
	{
		name = "BEGGJUMP",
		parent = 200
	},
	{
		name = "FALLEN",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "FALLENIDLE",
		parent = 208
	},
	{
		name = "FALLENDMOVESTART",
		parent = 208
	},
	{
		name = "FALLENMOVELOOP",
		parent = 208
	},
	{
		name = "FALLENMOVELOOPEND",
		parent = 208
	},
	{
		name = "FALLENSTANDUP",
		parent = 208
	},
	{
		name = "FALLENSTART",
		parent = 208
	},
	{
		name = "FALLENFALL",
		parent = 208
	},
	{
		name = "FALLENFALLTOGROUND",
		parent = 208
	},
	{
		name = "AID",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "AIDSTART",
		parent = 217
	},
	{
		name = "AIDLOOP",
		parent = 217
	},
	{
		name = "AIDEND",
		parent = 217
	},
	{
		name = "EGGMODE",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "EGGMODEIDLE",
		parent = 221
	},
	{
		name = "EGGMODEJUMP",
		parent = 221
	},
	{
		name = "EGGMODEBEATTACHED",
		parent = 221
	},
	{
		name = "DIGEGG",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "DIGEGGSTART",
		parent = 225
	},
	{
		name = "DIGEGGIDLE",
		parent = 225
	},
	{
		name = "DIGEGGACTION",
		parent = 225
	},
	{
		name = "DIGEGGEND",
		parent = 225
	},
	{
		name = "CARRY",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "CARRYSTART",
		parent = 230
	},
	{
		name = "CARRYIDLE",
		parent = 230
	},
	{
		name = "CARRYRUN",
		parent = 230
	},
	{
		name = "CARRYLAND",
		parent = 230
	},
	{
		name = "CARRYFALL",
		parent = 230
	},
	{
		name = "CARRYEND",
		parent = 230
	},
	{
		name = "FISHINGCAPTURE",
		isStateMachine = true,
		parent = 0
	},
	{
		name = "FISHINGCAPTUREIDLE",
		parent = 237
	},
	{
		name = "FISHINGCAPTUREMOVE",
		parent = 237
	},
	{
		name = "REVIVE",
		parent = 0
	},
	{
		name = "NEARDEAD",
		parent = 0
	},
	{
		name = "BEATTACHED",
		parent = 0
	},
	CARRYLAND = 234,
	CARRYRUN = 233,
	CARRYIDLE = 232,
	CARRYSTART = 231,
	CARRY = 230,
	DIGEGGEND = 229,
	DIGEGGACTION = 228,
	DIGEGGIDLE = 227,
	DIGEGGSTART = 226,
	DIGEGG = 225,
	EGGMODEBEATTACHED = 224,
	EGGMODEJUMP = 223,
	EGGMODEIDLE = 222,
	EGGMODE = 221,
	AIDEND = 220,
	AIDLOOP = 219,
	AIDSTART = 218,
	AID = 217,
	FALLENFALLTOGROUND = 216,
	FALLENFALL = 215,
	FALLENSTART = 214,
	FALLENSTANDUP = 213,
	FALLENMOVELOOPEND = 212,
	FALLENMOVELOOP = 211,
	FALLENDMOVESTART = 210,
	FALLENIDLE = 209,
	FALLEN = 208,
	BEGGJUMP = 207,
	BEGGFALL = 206,
	BEGGLAND = 205,
	BEGGDROP = 204,
	BEGGRUN = 203,
	BEGGIDLE = 202,
	BEGGPICK = 201,
	BEGG = 200,
	WALKINGATTACKMOVE = 199,
	WALKINGATTACKIDLE = 198,
	WALKINGATTACK = 197,
	SKILLTHROWMOVE = 196,
	SKILLTHROWIDLE = 195,
	SKILLTHROWING = 194,
	SKILLBEGIN = 193,
	SKILLMOVETOIDLE = 192,
	SKILLIDLETOMOVE = 191,
	SKILLEND = 190,
	DRUMRIGHTSTOP = 189,
	DRUMLEFTSTOP = 188,
	DRUMRIGHTHAND = 187,
	DRUMLEFTHAND = 186,
	DRUMIDLE = 185,
	DRUMMING = 184,
	SKATEBOARDJUMPEND = 183,
	SKATEBOARDJUMPFALL = 182,
	SKATEBOARDJUMPSTART = 181,
	SKATEBOARDSTART = 180,
	CLIMBACROSSH = 179,
	CLIMBACROSSL = 178,
	CLIMBACROSSSTEPUP = 177,
	CLIMBACROSS = 176,
	MAGNESISGRABIDLE = 175,
	MAGNESISTHROW = 174,
	MAGNESISGRABWALK = 173,
	MAGNESISBEGIN = 172,
	MAGNESIS = 171,
	THROWIDLE = 170,
	THROWWALK = 169,
	THROWING = 168,
	CROUCHTHROWMOVE = 167,
	CROUCHTHROWIDLE = 166,
	CLOUD = 165,
	SOCIALANIM = 164,
	INFLATEDASH = 163,
	SKILLGLIDINGEND = 162,
	SKILLGLIDING = 161,
	HOOKCANCEL = 160,
	STRUGGLE = 159,
	NORMALATTACK = 158,
	SKILL = 157,
	SURFFALL = 156,
	SURFJUMP = 155,
	SURFSTOP = 154,
	SURFLOOP = 153,
	SURFSTART = 152,
	SURF = 151,
	BACKSIDEATTACK = 150,
	FRONTSIDEATTACK = 149,
	RIGHTSIDEATTACK = 148,
	LEFTSIDEATTACK = 147,
	NORMALSTANDATTACK = 146,
	LATERALATTACK = 145,
	SPECIALRIDEIDLE = 144,
	SPECIALRIDEBREAKSUCCESS = 143,
	SPECIALRIDEBREAKFAIL = 142,
	SPECIALRIDECLIMBON = 141,
	SPECIALRIDE = 140,
	HOOKSTART = 139,
	HOOKAIM = 138,
	HOOKFAILEND = 137,
	HOOKFAILLOOP = 136,
	HOOKSUCCESSEND = 135,
	HOOKSPRINTLOOP = 134,
	HOOKSUCCESS = 133,
	HOOKWAIT = 132,
	HOOKSPRINT = 131,
	SKILLDASH = 130,
	SKILLIDLE = 129,
	SKILLJUMPFALL = 128,
	SKILLJUMPEND = 127,
	SKILLJUMP = 126,
	SKILLMOVE = 125,
	SKILLMOTION = 124,
	FOURWAYIDLE = 123,
	FOURWAYMOVE = 122,
	FOURWAY = 121,
	SWIMDASH = 120,
	GLIDERISE = 119,
	FLYSPRINT = 118,
	FLYDASH = 117,
	CLIMBSPRINT = 116,
	CLIMBDASH = 115,
	CLIMBSLIP = 114,
	BOUNCE = 113,
	SPRINTTURN = 112,
	SPEEDBURSTJUMP = 111,
	SPEEDBURSTFALL = 110,
	SPEEDBURSTEND = 109,
	SPEEDBURSTSTART = 108,
	CROUCHEXIT = 107,
	CROUCHMOVE = 106,
	CROUCHIDLE = 105,
	CROUCHING = 104,
	SPRINTSTOP = 103,
	RUNSTOP = 102,
	CUSTOMANIMATION = 101,
	SANDBOXSPECIAL = 100,
	HOMEWORK = 99,
	BEGRAB = 98,
	TAKEROOTOUT = 97,
	TAKEROOT = 96,
	TAKEROOTIN = 95,
	HIDEMIMICRYOUT = 94,
	HIDEMIMICRYIN = 93,
	SPECIALMOVEOUT = 92,
	SPECIALMOVEIN = 91,
	PATHFINDING = 90,
	SWIMMIMICRYOUT = 89,
	SWIMMIMICRYIN = 88,
	MIMICRYOUT = 87,
	MIMICRYIN = 86,
	SPECIALDEFENSE = 85,
	APPEARDASH = 84,
	GROUNDIN = 83,
	GROUNDOUT = 82,
	PLAYANIMATIONSCRIPT = 81,
	DEAD = 80,
	SNEAKOUTBYHIT = 79,
	SNEAKOUT = 78,
	REVIVE = 240,
	NEARDEAD = 241,
	BEATTACHED = 242,
	CARRYFALL = 235,
	CARRYEND = 236,
	FISHINGCAPTURE = 237,
	FISHINGCAPTUREIDLE = 238,
	FISHINGCAPTUREMOVE = 239,
	NONE = 0,
	LOCOMOTION = 1,
	SPEEDBURST = 2,
	SPEEDBURSTLOOP = 3,
	IDLE = 4,
	RUN = 5,
	DASH = 6,
	WALK = 7,
	SPRINT = 8,
	TURN = 9,
	AIRING = 10,
	FALL = 11,
	GROUNDFALL = 12,
	JUMP = 13,
	JUMPINRUN = 14,
	CLIMBING = 15,
	CLIMBIDLE = 16,
	CLIMBMOVE = 17,
	CLIMBON = 18,
	CLIMBOFF = 19,
	FLYING = 20,
	FLYHOVER = 21,
	FLYMOVE = 22,
	FLYRISE = 23,
	FLYENDGRAB = 24,
	FLYSTARTGRAB = 25,
	GLIDING = 26,
	GLIDEIDLE = 27,
	GLIDEMOVE = 28,
	GLIDESTART = 29,
	SWIMMING = 30,
	SWIMIDLE = 31,
	SWIMFASTMOVE = 32,
	SWIMMOVE = 33,
	SWIMJUMP = 34,
	SNEAK = 35,
	SNEAKIDLE = 36,
	SNEAKMOVE = 37,
	MIMICRY = 38,
	MIMICRYIDLE = 39,
	GROUND = 40,
	GROUNDIDLE = 41,
	GROUNDWALK = 42,
	AIR2GROUND = 43,
	SKATEBOARD = 44,
	SKATEBOARDMOVE = 45,
	SWIMMIMICRY = 46,
	SWIMMIMICRYIDLE = 47,
	SPECIALMOVE = 48,
	SPECIALMOVEFORWARD = 49,
	SPECIALMOVEIDLE = 50,
	MOUNTING = 51,
	MOUNT = 52,
	MOUNTSPECIAL = 53,
	MOUNTENTER = 54,
	MOUNTEXIT = 55,
	STORYBEHAVIOR = 56,
	STORYTURN = 57,
	HIDEMIMICRY = 58,
	HIDEMIMICRYIDLE = 59,
	STATICSPAWN = 60,
	STATICSPAWNIDLE = 61,
	PERFORM = 62,
	PERFORMSTART = 63,
	PERFORMLOOP = 64,
	PERFORMEND = 65,
	STATICLOCOMOTION = 66,
	SNEAKIN = 77,
	FLYCHARGING = 76,
	LAND = 75,
	CLIMBWATERFALLJUMPOUT = 74,
	CLIMBWATERFALLJUMPTOP = 73,
	CLIMBWATERFALLJUMPDASH = 72,
	CLIMBWATERFALLIDLE = 71,
	CLIMBWATERFALLMOVE = 70,
	CLIMBWATERFALLJUMPON = 69,
	CLIMBWATERFALL = 68,
	STATICLOCOMOTIONIDLE = 67
}

return CharacterStateConst
