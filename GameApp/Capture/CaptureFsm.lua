-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Capture\\CaptureFsm.lua

local FsmState = {
	E = 2,
	S = 3,
	T = 1,
	Empty = 0
}
local FsmCommand = {
	EnterExit = 2,
	Throw = 1,
	SwitchItem = 3
}
local FsmRule = {
	[FsmState.Empty] = {
		[FsmCommand.Throw] = FsmState.T,
		[FsmCommand.EnterExit] = FsmState.E,
		[FsmCommand.SwitchItem] = FsmState.S
	},
	[FsmState.T] = {
		[FsmCommand.Throw] = FsmState.T
	},
	[FsmState.E] = {
		[FsmCommand.EnterExit] = FsmState.E,
		[FsmCommand.SwitchItem] = FsmState.E,
		[FsmCommand.Throw] = FsmState.E
	},
	[FsmState.S] = {
		[FsmCommand.SwitchItem] = FsmState.S,
		[FsmCommand.EnterExit] = FsmState.E
	}
}
local CaptureFsm = {
	start = FsmState.Empty,
	states = FsmState,
	rules = FsmRule,
	commands = FsmCommand
}

return CaptureFsm
