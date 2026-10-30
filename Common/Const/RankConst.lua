-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\RankConst.lua

local ResetType = {
	SeasonFull = 5,
	SeasonHalf = 4,
	Month = 3,
	Week = 2,
	Day = 1,
	None = 0,
	Custom = 6
}
local RankConst = {
	MaxRankIdLength = 128,
	RefreshOffset = 0,
	OpenType = {
		FixedTime = 3,
		Season = 2,
		Launch = 1,
		Custom = 4
	},
	ResetType = ResetType,
	SettleType = {
		SeasonFull = 5,
		SeasonHalf = 4,
		Month = 3,
		Week = 2,
		Day = 1
	},
	CloseType = {
		FixedTime = 1,
		None = 0,
		Custom = 2
	},
	TemporarySettle = {
		Normal = 0,
		Skip = 2,
		Previous = 1
	},
	ShowEnum = {
		PlayerInfo = 1,
		BossRushBuffSelect = 8,
		BossRushBattlePet = 7,
		BossRushBestScore = 6,
		PetInfo = 5,
		PlayerLevel = 4,
		PetTeamInfo = 3,
		TeamInfo = 2
	},
	ConfigFieldForInfo = {
		"extraInfo1",
		"extraInfo2",
		"extraInfo3",
		"extraInfo4"
	},
	Rule = {
		Desc = 1,
		Asc = 2
	},
	DataType = {
		TEAM = 2,
		PERSON = 1
	}
}

RankConst.RefreshType = ResetType
RankConst.OpenType.LaunchDay = RankConst.OpenType.Launch
RankConst.OpenType.SeasonStuff = RankConst.OpenType.Season
RankConst.OpenType.ConfigDay = RankConst.OpenType.FixedTime
RankConst.SettleType.None = 0

return RankConst
