-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\LuaUIUtils\\UIConstants.lua

return function(LuaUIUtils)
	LuaUIUtils.EXPLORE_SKILL_NAME = {
		canSwim = "SWIM",
		canGlide = "GLIDE",
		canFly = "FLY",
		canClimb = "CLIMB"
	}
	LuaUIUtils.SP_CODE = {
		SP_ATTR = 2,
		SP_FEATURE = 1,
		SP_SKILL = 0
	}
	LuaUIUtils.ELEMENT_BTN_DATA_TABLE = {}
	LuaUIUtils.PET_CARD_ILLUSTRATE_BOOK = 8
	LuaUIUtils.PET_RESEARCH_REWARD = 9
	LuaUIUtils.PET_ICON = 1
	LuaUIUtils.PET_ICON_FLASH = 2
	LuaUIUtils.PET_IMG = 3
	LuaUIUtils.PET_IMG_FLASH = 4
	LuaUIUtils.PET_FIRST_SHOW = 5
	LuaUIUtils.PLAYER_AVATAR_TYPE = {
		DEFAULT = 0,
		CHAT = 1
	}
	LuaUIUtils.ITEM_SOURCE_TYPE_NONINTERACTIVE = 0
	LuaUIUtils.ITEM_SOURCE_TYPE_TIPS = 1
	LuaUIUtils.ITEM_SOURCE_TYPE_MAP_POS = 2
	LuaUIUtils.ITEM_SOURCE_TYPE_MAP_MARK = 3
	LuaUIUtils.ITEM_SOURCE_TYPE_EVENT = 4
	LuaUIUtils.ITEM_SOURCE_TYPE_MAP_FILTER = 5
	LuaUIUtils.ITEM_SOURCE_HOMELAND_FACILITIES = 6
	LuaUIUtils.ITEM_SOURCE_HOME_CAMP_CAR = 7
	LuaUIUtils.ITEM_SOURCE_JUMP_QUEST_PAGE = 8
	LuaUIUtils.JUMP_HOME = 1
	LuaUIUtils.SCREEN_CENTER = Vector3(0.5, 0.5, 0)
	LuaUIUtils.COUNTRY_ICON = 1
	LuaUIUtils.COUNTRY_IMG = 2
	LuaUIUtils.PetInfoState = {
		Find = 1,
		Catch = 0,
		None = 4,
		FriendCatch = 3
	}
	LuaUIUtils.ITEM_ICON_TYPE = {
		ICON_NORMAL = 0,
		ICON_BIG = 2,
		ICON_SMALL = 1
	}
	LuaUIUtils.SLOT_STATE = {
		HAVE = "Have",
		LOCKED = "Locked",
		EMPTY = "Empty",
		EMPTY_NO_WORD = "EmptyNoWord"
	}
	LuaUIUtils.SELECT_STATE = {
		LOCKED = "Locked",
		NULL = "Null",
		TRY = "Try",
		BLANK = "Blank",
		HAVE = "Have",
		PET_WEAR = "PetWear",
		ROLE_WEAR = "RoleWear"
	}
	LuaUIUtils.ArkForbidenOperation = {
		"Hud/BallMenu",
		"Hud/NormalAttack"
	}
	LuaUIUtils.HYPERLINK_EFFECT = {
		OTHER = "other",
		TOOLTIP = "tooltip"
	}
	LuaUIUtils.AbilityActionPath = {
		["Skill/CancelGrab"] = true
	}
end
