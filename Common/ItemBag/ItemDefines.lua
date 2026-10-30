-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\ItemBag\\ItemDefines.lua

local ItemDefine = {
	ItemEvent = {
		Add = 1,
		Remove = 2
	},
	BagOverFlowMode = {
		CustomHandleWhenOverflow = 3,
		Infinite = 2,
		AllowOverflowOnlyOnce = 1,
		Default = 0
	},
	PileupMode = {
		CustomHandleWhenOverPile = 2,
		DropWhenOverPile = 1,
		AllowMultiPile = 0
	}
}

return ItemDefine
