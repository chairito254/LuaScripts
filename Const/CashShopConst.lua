-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Const\\CashShopConst.lua

local CashShopConst = {}

CashShopConst.CategoryType = {
	MONTHLYCARD = 2,
	RECOMMEND = 1,
	TRADE_MARKET = 8,
	RECHARGE = 7,
	EXCHANGE = 6,
	ITEM = 5,
	AVATAR = 4,
	GIFTPACK = 3
}
CashShopConst.BtnState = {
	BUY = 0,
	SOLD_OUT = 5,
	PURCHASED = 4,
	LOCKED = 3,
	OBTAIN = 2,
	DIRECT_PURCHASED = 1
}
CashShopConst.ShowModle = {
	PIC = 2,
	MODLE = 1,
	Lottery = 6,
	FirstTopup = 5,
	BattlePass = 4,
	MonthCard = 3
}
CashShopConst.BgType = {
	SPECIAL_SCENE = 3,
	MODLE = 1,
	IMAGE = 2
}
CashShopConst.DEFAULT_SPECIAL_SCENE_TIMELINE = "$P_TL_UIScene_Avatar_Girl_Set_G10035_Entrance.prefab"
CashShopConst.SceneBgType = {
	SCENE_3D = 2,
	IMG_2D = 1,
	SPECIAL_3D = 3
}
CashShopConst.GiftPackTabType = {
	Fix = 302,
	Optional = 301,
	Weekly = 303
}
CashShopConst.ExchangeShopTabType = {
	Exchange = 602,
	Random = 601
}
CashShopConst.ShopShowType = {
	OPEN = 0,
	TRACK = 1
}
CashShopConst.ShopAvatarType = {
	NORMAL = 2,
	PROMINENT = 1
}
CashShopConst.CommodityAvatarType = {
	SUIT = 3000,
	ACCESSORY_PACKAGE = 4000
}
CashShopConst.AccessoryPreviewTarget = {
	PLAYER = 0,
	FURNITURE = 2,
	PET = 1
}
CashShopConst.SuitPowerType = {
	FASHION_SWITCH = 1,
	PLAYER_PET_TIPS = 4,
	PLAYER_PET_INTERACTION = 3,
	PET_IDLE = 2
}
CashShopConst.ShopItemType = {
	NO_DETAILS = 2,
	DETAILS = 1
}
CashShopConst.CommodityItemType = {
	AVATAR_FRAME = 1,
	PANEL = 4,
	AVATAR = 2,
	CHAT_BUBBLE = 3
}
CashShopConst.AppearanceModelType = {
	PET = 2,
	PLAYER = 1
}
CashShopConst.CardShopType = {
	BattlePass = 1,
	MonthCard = 0
}
CashShopConst.PetActionType = {
	CashShopBuy = 4,
	CashShop = 3,
	BattlePass = 2,
	BattlePassPurchase = 1
}

return CashShopConst
