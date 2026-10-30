-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\HomeOrderConst.lua

local HomeOrderConst = {}

HomeOrderConst.TYPE = {
	HighPriority = 2,
	Normal = 1,
	Season = 3
}
HomeOrderConst.STATUS = {
	Finish = 2,
	Incomplete = 1
}
HomeOrderConst.QUALITY = {
	"green",
	"blue",
	"purple",
	"orange",
	"rainbow"
}
HomeOrderConst.RefreshResult = {
	OVERLIMIT = 4,
	NOREFRESHCOUNT = 3,
	NOORDER = 2,
	FAIL = 1,
	SUCCESS = 0,
	NOTUNLOCK = 6,
	LOCKED = 5
}
HomeOrderConst.SOURCE = {
	Default = 1,
	Manual = 4,
	CarUpgrade = 3,
	Daily = 2
}

return HomeOrderConst
