-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\HelpConst.lua

local HelpConst = {
	EntryState = {
		ENTRY_NONE = 0,
		ENTRY_UNLOCKED = 2,
		ENTRY_LOCKED = 1
	},
	EntryType = {
		ENTRY_EXPLORE = 4,
		ENTRY_COMBAT = 3,
		ENTRY_GROW = 2,
		ENTRY_SYSTEM = 1,
		ENTRY_ALL = 0
	},
	EntryTypeName = {
		[0] = "ENTRY_ALL",
		"ENTRY_SYSTEM",
		"ENTRY_GROW",
		"ENTRY_COMBAT",
		"ENTRY_EXPLORE"
	},
	SettingTabIndex2Name = {
		[0] = "game",
		"operate",
		"video",
		"audio",
		"language"
	}
}

return HelpConst
