-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\SettingConst.lua

local SettingConst = {
	EDeviceProfileType = {
		Default = "Default",
		PlayStation5 = "PlayStation5",
		PlayStation4 = "PlayStation4",
		PlayStationDefault = "PlayStationDefault",
		AndoridLow = "AndoridLow",
		AndroidMid = "AndroidMid",
		AndroidHigh = "AndroidHigh",
		AndroidDefault = "AndroidDefault",
		IOSLow = "IOSLow",
		IOSMid = "IOSMid",
		IOSHight = "IOSHight",
		IOSDefault = "IOSDefault",
		WindowsLow = "WindowsLow",
		WindowsMid = "WindowsMid",
		WindowsHigh = "WindowsHigh",
		WindowsDefault = "WindowsDefault",
		EditorMac = "EditorMac",
		EditorWindows = "EditorWindows"
	},
	EntityCountLimitLow = {
		ClientPet = 15,
		ClientPlayer = 15,
		ClientEnvObject = 50,
		NPC = 15,
		ClientPuppet = 15
	},
	EntityCountLimitMiddle = {
		ClientPet = 50,
		ClientPlayer = 50,
		ClientEnvObject = 100,
		NPC = 50,
		ClientPuppet = 50
	},
	EntityCountLimitHigh = {
		ClientPet = 100,
		ClientPlayer = 100,
		ClientEnvObject = 200,
		NPC = 100,
		ClientPuppet = 100
	},
	EntityCountLimitType = {
		ClientPet = "ClientPet",
		ClientPlayer = "ClientPlayer",
		ClientEnvObject = "ClientEnvObject",
		NPC = "NPC",
		ClientPuppet = "ClientPuppet"
	}
}

SettingConst.EntityCountLimitLevel = {
	SettingConst.EntityCountLimitLow,
	SettingConst.EntityCountLimitMiddle,
	SettingConst.EntityCountLimitHigh
}

return SettingConst
