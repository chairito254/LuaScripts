-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\SandboxStateDef.lua

local SandboxStateDef = {}

SandboxStateDef.Switch = {
	On = 2,
	Off = 1,
	Default = 0
}
SandboxStateDef.ChestShield = {
	OPENED = 2,
	UNLOCKED = 1,
	LOCK = 0
}
SandboxStateDef.ChestContainer = {
	UNLOCKED = 1,
	LOCK = 0
}
SandboxStateDef.DialoguePlayer = {
	FINISHED = 2,
	PLAYING = 1,
	IDLE = 0
}
SandboxStateDef.TimelineContainer = {
	FINISHED = 2,
	PLAYING = 1,
	IDLE = 0
}
SandboxStateDef.CondenseWaterStone = {
	Wet = 1,
	Dry = 0
}
SandboxStateDef.CondenseWaterBoundItem = {
	Phantom = 0,
	Active = 1
}

return SandboxStateDef
