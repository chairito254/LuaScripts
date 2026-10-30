-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\TipAreaConst.lua

local TipAreaConst = {}

TipAreaConst.TICK_INTERVAL = 0.02
TipAreaConst.RECYCLE_TIMEOUT = 5
TipAreaConst.RECYCLE_CHECK_INTERVAL = 0.1
TipAreaConst.RECYCLE_REASON = {
	DESTROY = "destroy",
	ERROR = "error",
	FORCE = "force",
	TIMEOUT = "timeout",
	NORMAL = "normal"
}
TipAreaConst.AREAS = {
	A3 = "A3TipArea",
	PA2 = "PA2TipArea",
	A2 = "A2TipArea",
	MI = "MITipArea",
	A1I = "A1ITipArea",
	M = "MTipArea",
	A1 = "A1TipArea",
	CI = "CITipArea",
	TOP = "TOPTipArea",
	C = "CTipArea",
	CF = "CFTipArea",
	BI = "BITipArea",
	B = "BTipArea"
}
TipAreaConst.UITipAreaFlag = {
	AreaFlag_CustomAreaShow = "CustomAreaShow",
	AreaFlag_Force = "Force",
	AreaFlag_CIShow = "CIShow",
	AreaFlag_Cutscene = "Cutscene",
	AreaFlag_CShow = "CShow",
	AreaFlag_WorldRaceDungeon = "WorldRaceDungeon",
	AreaFlag_BIShow = "BIShow",
	AreaFlag_A1IShow = "A1IShow",
	AreaFlag_A3Show = "A3Show",
	AreaFlag_A2Show = "A2Show",
	AreaFlag_A1Show = "A1Show",
	AreaFlag_SeasonOpenTip = "SeasonOpenTip",
	AreaFlag_PanelHide = "PanelHide",
	AreaFlag_FullScreen = "FullScreen",
	AreaFlag_PetFirstShow = "PetFirstShow",
	AreaFlag_Level = "Level",
	AreaFlag_DialogueGraph = "Dialogue",
	AreaFlag_Quest = "Quest",
	AreaFlag_Default = "Default"
}
TipAreaConst.EDGE_AREAS = {
	Target = "Edge_Target",
	QuestArea = "Edge_QuestArea",
	Challenge = "Edge_Challenge",
	Quest = "Edge_Quest"
}
TipAreaConst.EDGE_HIDE_AREA_C_ITEMS = {
	"ExplorePetReplace",
	"MultiPetObtains",
	"PetEvolve",
	"PetResearch",
	"PropObtain"
}
TipAreaConst.CUTSCENE_HIDE_AREA_C_ITEMS = {
	"ExplorePetReplace",
	"MultiPetObtains",
	"PetEvolve",
	"PetResearch",
	"PropObtain",
	"PetObtain",
	"GiftTips",
	"HomeBookUnlock",
	"QuickUse",
	"FriendOnLine",
	"ScreenCaptureShare"
}
TipAreaConst.CUTSCENE_MAX_SUSPEND_TIME = 60
TipAreaConst.AREAS_CONFIG = {
	[TipAreaConst.AREAS.TOP] = {
		resKey = "topArea",
		maxRunItemNum = 3,
		priority = 1,
		customAreaShow = {
			TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
			TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
		}
	},
	[TipAreaConst.AREAS.A1] = {
		priority = 9,
		resKey = "a1Area"
	},
	[TipAreaConst.AREAS.A1I] = {
		priority = 10,
		resKey = "a1IArea"
	},
	[TipAreaConst.AREAS.A2] = {
		resKey = "a2Area",
		maxRunItemNum = 2,
		priority = 8
	},
	[TipAreaConst.AREAS.A3] = {
		priority = 1,
		resKey = "a3Area"
	},
	[TipAreaConst.AREAS.B] = {
		priority = 1,
		resKey = "bArea"
	},
	[TipAreaConst.AREAS.BI] = {
		priority = 1,
		resKey = "bIArea"
	},
	[TipAreaConst.AREAS.CF] = {
		priority = 1,
		resKey = "cFArea"
	},
	[TipAreaConst.AREAS.C] = {
		resKey = "cArea",
		priority = 1,
		customAreaShow = {
			TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
		}
	},
	[TipAreaConst.AREAS.CI] = {
		resKey = "cIArea",
		priority = 3,
		customAreaShow = {
			TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
		}
	},
	[TipAreaConst.AREAS.M] = {
		priority = 11,
		resKey = "empty"
	},
	[TipAreaConst.AREAS.MI] = {
		priority = 12,
		resKey = "empty"
	},
	[TipAreaConst.AREAS.PA2] = {
		priority = 1,
		resKey = "pA2Area"
	}
}
TipAreaConst.FULL_SCREEN_HIDE_AREA = {
	[TipAreaConst.AREAS.TOP] = true,
	[TipAreaConst.AREAS.A1] = true,
	[TipAreaConst.AREAS.A1I] = true,
	[TipAreaConst.AREAS.A2] = true,
	[TipAreaConst.AREAS.A3] = false,
	[TipAreaConst.AREAS.B] = true,
	[TipAreaConst.AREAS.BI] = true,
	[TipAreaConst.AREAS.CF] = true,
	[TipAreaConst.AREAS.C] = true,
	[TipAreaConst.AREAS.CI] = true,
	[TipAreaConst.AREAS.M] = true,
	[TipAreaConst.AREAS.MI] = false,
	[TipAreaConst.AREAS.PA2] = false
}
TipAreaConst.AREA_ITEMS = {
	[TipAreaConst.AREAS.TOP] = {
		PvpInviteState = {
			resKey = "pvpInvite",
			priority = 30,
			testParam = {
				mode = 1
			}
		},
		PvpPreparation = {
			resKey = "pvpPreparation",
			priority = 31,
			testParam = {
				duration = 50
			}
		},
		WorldRaceCountdown = {
			resKey = "racingCountdown",
			priority = 31,
			testParam = {
				endTime = 0
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		},
		HomeName = {
			resKey = "homeName",
			fixed = true,
			priority = 1,
			testParam = {
				name = "测试Home"
			}
		},
		CountDown = {
			resKey = "countDown",
			priority = 11,
			testParam = {
				useGameTime = true,
				duration = 5,
				infoText = "测试倒计时"
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		},
		TimeViolent = {
			resKey = "timeViolent",
			priority = 12,
			testParam = {
				useGameTime = true,
				duration = 5,
				infoText = "测试狂暴倒计时"
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		},
		BossTitle = {
			resKey = "bossBlood",
			fixed = true,
			priority = 5,
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		},
		GetEggLimitedTime = {
			resKey = "getEggLimitedTime",
			fixed = true,
			priority = 8,
			testParam = {
				progress = 0.5,
				title = "测试进度"
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		},
		GrabEggWaitingInfo = {
			resKey = "waitingInfo",
			fixed = true,
			priority = 8,
			testParam = {
				tipsTextKey = "GRAB_EGG_LOADING_WAIT"
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		},
		TargetEntityInfo = {
			resKey = "petSmallHp",
			priority = 8,
			testParam = {
				duration = 5
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_A1Show,
				TipAreaConst.UITipAreaFlag.AreaFlag_A1IShow
			}
		}
	},
	[TipAreaConst.AREAS.A1] = {
		POIPop = {
			priority = 1,
			resKey = "pOINew"
		},
		QuestComplete = {
			resKey = "questComplete",
			priority = 11,
			testParam = {
				id = 1202075,
				duration = 5
			}
		},
		TowerResultWin = {
			resKey = "towerResultWin",
			priority = 21,
			testParam = {
				duration = 3
			}
		},
		TowerResultWave = {
			resKey = "towerResultWave",
			priority = 22,
			testParam = {
				duration = 5,
				params = {
					totalStage = 10,
					stage = 6
				}
			}
		},
		TowerResultStart = {
			resKey = "towerResultStart",
			priority = 23,
			testParam = {
				duration = 4
			}
		},
		MapAreaUnlockTip = {
			resKey = "mapUnlock",
			priority = 3,
			testParam = {
				unlockName = "测试解锁"
			}
		},
		ArchaicCharacter = {
			resKey = "archaicCharacter",
			priority = 5,
			testParam = {
				noticeKey = "测试1",
				characters = {}
			}
		},
		BossFirstKill = {
			resKey = "bossFirstKill",
			priority = 8,
			testParam = {
				title = "Dragon Lord"
			}
		},
		GrabEggsIncubator = {
			resKey = "grabEggsIncubator",
			fixed = true,
			priority = 0,
			testParam = {
				duration = 3,
				title = "测试Title"
			}
		},
		CountDownBeat = {
			resKey = "countDownBeat",
			priority = 30,
			testParam = {
				endTime = 0
			}
		},
		WorldRaceFinish = {
			resKey = "racingFinish",
			priority = 32,
			testParam = {
				duration = 2
			}
		},
		WorldRaceFinishMore = {
			resKey = "racingFinishMore",
			priority = 32,
			testParam = {
				rank = 1,
				duration = 2
			}
		},
		WorldRaceEnd = {
			resKey = "racingEnd",
			priority = 33,
			testParam = {
				duration = 2
			}
		},
		TransferEgg = {
			resKey = "transferEgg",
			priority = 24,
			testParam = {
				endTime = 0
			}
		},
		EventSeason = {
			resKey = "eventSeasonUContainer",
			priority = 101,
			testParam = {
				endTime = 0
			}
		},
		ResultFail = {
			resKey = "resultFail",
			priority = 20,
			testParam = {
				duration = 3
			}
		},
		BossCatchWarning = {
			resKey = "bossCatchWarning",
			priority = 31,
			testNames = {
				duration = 3
			}
		},
		CountDownLimitedTime = {
			resKey = "countDownLimitedTime",
			priority = 26,
			testParam = {
				title = "测试限时",
				duration = 5
			}
		},
		HomeSeasonCelebration = {
			resKey = "HomeSeasonCelebration",
			priority = 100,
			testParam = {
				title = "庆典准备中",
				duration = 600
			}
		}
	},
	[TipAreaConst.AREAS.A1I] = {
		MapTips = {
			priority = 100,
			resKey = "mapTipsUContainer"
		},
		PlayerExpChanged = {
			resKey = "playerExpChanged",
			priority = 56,
			hidAreas = {
				TipAreaConst.AREAS.A2,
				TipAreaConst.AREAS.A3
			},
			testParam = {
				maxExp = 200,
				addExp = 120,
				curExp = 100,
				oldExp = 100,
				batch = true,
				isLvUp = true,
				newLevel = 11,
				oldLevel = 10
			}
		},
		ItemObtain = {
			priority = 99,
			resKey = "itemObtain"
		}
	},
	[TipAreaConst.AREAS.A2] = {
		OutCombatProgress = {
			resKey = "outBattleProgress",
			priority = 11,
			testParam = {
				progress = 45
			}
		},
		BossMechanismTips = {
			resKey = "bossMechanismTips",
			priority = 12,
			testParam = {
				text = "测试"
			}
		},
		WorldRankingTips = {
			resKey = "worldRankingTips",
			priority = 17,
			testParam = {
				colorPage = 0,
				text = "测试竞速提示"
			}
		},
		BossMechanismProgress = {
			resKey = "bossMechanismProgress",
			priority = 13,
			testParam = {
				countDownDuration = 5,
				text = "测试"
			}
		},
		BattleRoomMechanismTips = {
			resKey = "battleRoomMechanismTips",
			priority = 15,
			testParam = {
				duration = 3,
				text = "测试道馆机制提示"
			}
		},
		DungeonTips = {
			resKey = "dungeonTips",
			priority = 14,
			testParam = {
				countDownDuration = 5,
				text = "测试"
			}
		},
		POIPopArea = {
			priority = 1,
			resKey = "poiAreaTips"
		},
		BossCatchTips = {
			resKey = "bossCatchTips",
			priority = 16,
			testParam = {
				text = "与鸢尾交互，缔结契约"
			}
		}
	},
	[TipAreaConst.AREAS.A3] = {
		NormalText = {
			resKey = "normalText",
			testParam = {
				desc = "测试提示"
			}
		}
	},
	[TipAreaConst.AREAS.B] = {
		ItemRepeatObtain = {
			resKey = "itemRepeatObtain",
			priority = 99,
			testParam = {
				num = 87,
				piecesId = 551000,
				id = 552000
			}
		},
		HelpTips = {
			resKey = "helpTips",
			priority = 10,
			testParam = {
				helpId = 100
			}
		},
		UnderTips = {
			priority = 1,
			resKey = "underTips"
		},
		WorldRaceExit = {
			resKey = "racingExit",
			priority = 21,
			testParam = {
				endTime = 0
			}
		},
		CompletionPrompt = {
			resKey = "completionPrompt",
			priority = 20,
			testParam = {
				templateId = 1001100,
				pointNum = 100
			}
		},
		badgeRepeatObtain = {
			priority = 101,
			resKey = "badgeRepeatObtain"
		},
		GainCrop = {
			resKey = "gainCrop",
			priority = 5,
			testParam = {
				itemId = 1
			}
		}
	},
	[TipAreaConst.AREAS.BI] = {
		AIHelperTips = {
			resKey = "aiHelperTips",
			priority = 1,
			testParam = {
				id = 1004103
			}
		},
		NewClueTips = {
			resKey = "newClueTips",
			priority = 2,
			testParam = {
				questId = 3705043
			}
		},
		ControlPanel = {
			resKey = "controlPanel",
			priority = 3,
			testParam = {
				text = "测试"
			}
		},
		PetConjunctionTips = {
			priority = 4,
			resKey = "petConjunctionTips"
		}
	},
	[TipAreaConst.AREAS.CF] = {
		ShortCutKey = {
			resKey = "shortCutKey",
			fixed = true,
			priority = 1
		}
	},
	[TipAreaConst.AREAS.C] = {
		PropObtain = {
			resKey = "propObtain",
			priority = 10,
			testParam = {
				num = 10,
				id = 1000
			}
		},
		QuickUse = {
			priority = 11,
			resKey = "quickUse"
		},
		FriendOnLine = {
			priority = 12,
			resKey = "friendOnLine"
		},
		HomeBookUnlock = {
			resKey = "homeBookUnlock",
			priority = 12,
			testParam = {
				itemId = 4001000,
				duration = 5
			},
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
			}
		},
		PetObtain = {
			priority = 54,
			resKey = "petObtain"
		},
		MultiPetObtains = {
			priority = 53,
			resKey = "petObtains"
		},
		PetEvolve = {
			resKey = "petEvolve",
			priority = 20,
			testParam = {
				templateId = 1002200,
				canStageUp = true
			}
		},
		PetResearch = {
			priority = 51,
			resKey = "petResearch"
		},
		ExplorePetReplace = {
			priority = 52,
			resKey = "petAbility"
		},
		GiftTips = {
			priority = 25,
			resKey = "giftTips"
		},
		ScreenCaptureShare = {
			resKey = "screenCaptureShareUContainer",
			priority = 32,
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
			}
		}
	},
	[TipAreaConst.AREAS.CI] = {
		TeamInvite = {
			resKey = "friendInvite",
			priority = 60,
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
			}
		},
		PvpInvite = {
			resKey = "pvpInvite",
			priority = 61,
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
			}
		},
		NpcCall = {
			resKey = "npcCall",
			priority = 1,
			customAreaShow = {
				TipAreaConst.UITipAreaFlag.AreaFlag_FullScreen
			}
		},
		LuckyPropObtain = {
			priority = 10,
			resKey = "luckyPropGet"
		}
	},
	[TipAreaConst.AREAS.M] = {
		PreciousProp = {
			priority = 10,
			resKey = "preciousProp"
		},
		QuestChapter = {
			priority = 11,
			resKey = "questChapter"
		},
		PetFirstShow = {
			priority = 12,
			resKey = "petFirstShow"
		}
	},
	[TipAreaConst.AREAS.MI] = {
		PropsObtain = {
			priority = 10,
			resKey = "propsObtain"
		}
	},
	[TipAreaConst.AREAS.PA2] = {
		DropHint = {
			resKey = "dropHint",
			priority = 20,
			testParam = {
				str = "You got a rare item!",
				progressDuration = 5
			}
		}
	}
}
TipAreaConst.TipItemFlag = {
	ItemFlag_Default = 0,
	ItemFlag_BigWhiteBall = 102,
	ItemFlag_SkillFreeAim = 101,
	ItemFlag_NoHUD = 100,
	ItemFlag_Mobile = 99,
	ItemFlag_HideFixed = 1
}
TipAreaConst.ITEM_RUN_STATE = {
	RUN_QUEUE = 3,
	WAITING = 2,
	RUN_FIXED = 1,
	EMPTY = 0
}
TipAreaConst.GMKeyMaps = {
	"TOPTipArea_PvpInviteState",
	"TOPTipArea_PvpPreparation",
	"TOPTipArea_HomeName",
	"TOPTipArea_CountDown",
	"TOPTipArea_TimeViolent",
	"TOPTipArea_CommonTimer",
	"TOPTipArea_BossTitle",
	"TOPTipArea_GetEggLimitedTime",
	"TOPTipArea_GrabEggWaitingInfo",
	"A1TipArea_POIPop",
	"A1TipArea_QuestComplete",
	"A1TipArea_TowerResultWin",
	"A1TipArea_TowerResultWave",
	"A1TipArea_TowerResultStart",
	"A1TipArea_MapAreaUnlockTip",
	"A1TipArea_ArchaicCharacter",
	"A1TipArea_BossFirstKill",
	"A1TipArea_GrabEggsIncubator",
	"A1TipArea_TransferEgg",
	"A1TipArea_BossCatchWarning",
	"A1TipArea_CountDownLimitedTime",
	"A1TipArea_HomeSeasonCelebration",
	"A1TipArea_EventSeason",
	"A1ITipArea_PlayerExpChanged",
	"A1ITipArea_ItemObtain",
	"A2TipArea_OutCombatProgress",
	"A2TipArea_BossMechanismTips",
	"A2TipArea_WorldRankingTips",
	"A2TipArea_BossMechanismProgress",
	"A2TipArea_BattleRoomMechanismTips",
	"A2TipArea_DungeonTips",
	"A2TipArea_POIPopArea",
	"A2TipArea_BossCatchTips",
	"A3TipArea_NormalText",
	"BTipArea_ItemRepeatObtain",
	"BTipArea_HelpTips",
	"BTipArea_UnderTips",
	"BTipArea_CompletionPrompt",
	"BTipArea_GainCrop",
	"BITipArea_AIHelperTips",
	"BITipArea_ControlPanel",
	"BITipArea_NewClueTips",
	"CFTipArea_ShortCutKey",
	"CTipArea_PropObtain",
	"CTipArea_QuickUse",
	"CTipArea_FriendOnLine",
	"CTipArea_HomeBookUnlock",
	"CTipArea_PetObtain",
	"CTipArea_MultiPetObtains",
	"CTipArea_PetEvolve",
	"CTipArea_PetResearch",
	"CTipArea_ExplorePetReplace",
	"CTipArea_GiftTips",
	"CITipArea_TeamInvite",
	"CITipArea_PvpInvite",
	"CITipArea_NpcCall",
	"CITipArea_LuckyPropObtain",
	"MTipArea_PreciousProp",
	"MTipArea_QuestChapter",
	"MITipArea_PropsObtain",
	"PA2TipArea_DropHint"
}

return TipAreaConst
