-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\BossRushConst.lua

local BossRushConst = {}

BossRushConst.LevelEndType = {
	Abnormal = 5,
	LeaderExit = 4,
	AllPlayerDie = 3,
	BossDie = 2,
	TimeOver = 1
}
BossRushConst.PersonRank = {
	tab1 = 1,
	rankId = 10001,
	tab2 = 1
}
BossRushConst.BossRankList = {
	{
		tab1 = 2,
		configKey = "bossLeft",
		rankId = 10001,
		tab2 = 1
	},
	{
		tab1 = 2,
		configKey = "bossMid",
		rankId = 10001,
		tab2 = 2
	},
	{
		tab1 = 2,
		configKey = "bossRight",
		rankId = 10001,
		tab2 = 3
	}
}
BossRushConst.RankList = {
	BossRushConst.PersonRank,
	BossRushConst.BossRankList[1],
	BossRushConst.BossRankList[2],
	BossRushConst.BossRankList[3]
}

return BossRushConst
