-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\aictr_const_data.lua

local CTRConst = require("Common.AICt.CTRConst")
local data = {
	puppet_data = {
		mimicryType = "int",
		mimicryOutBySkillElementList = "LuaTableTp",
		mimicryOutByChemList = "LuaTableTp",
		mimicryOutImpulseThreshold = "float",
		stage = "int",
		label = "int",
		perceptFullSpBehavType = "string",
		perceptFullSpBehavProtoId = "int",
		perceptFullBehavType = "string",
		brotherSensedEnterCombatType = "int",
		babyCatchedBrotherEnterCombatType = "int",
		babySensedBrotherEnterCombatType = "int",
		partnerEnterCombatDis = "float",
		partnerEnterCombatType = "int",
		ethnicGroup = "int",
		bornState = "string",
		petPrototypeId = "int",
		id = "int",
		beFollowMode = "int",
		ArriveRainShelterDialogId = "int",
		GotoRainShelterDialogId = "int",
		reactionRainPRTag = "string",
		reactionRainBehav = "string",
		baseFormPet = "int",
		enterWaterDeathDepthRatio = "float",
		catchFailureBehavType = "string",
		sleepRPTag = "string",
		sleepDayTime = "int"
	},
	pet_data = {
		ethnicGroup = "int",
		beFollowMode = "int",
		petPrototypeId = "int",
		baseFormPet = "int"
	},
	getLogicState = {
		"LOCOMOTION",
		"SNEAK",
		"GROUND",
		"FLYING",
		"SWIMMING",
		"MIMICRY",
		"SWIMMIMICRY",
		"MIMICRYOUT",
		"SWIMMIMICRYOUT",
		"SPECIALMOVEIN",
		"SPECIALMOVEOUT"
	},
	getAnimState = {
		Behav_Happy = {
			{
				name = "result",
				value = "Behav_Happy"
			}
		},
		Behav_Eat = {
			{
				name = "1_start",
				value = "Behav_EatStart"
			},
			{
				name = "2_loop",
				value = "Behav_EatLoop"
			},
			{
				name = "3_end",
				value = "Behav_EatEnd"
			}
		}
	},
	foreachPreset = {
		entity = {
			elementType = "int",
			foreachKv = CTRConst.ForeachKV.MAP_KEY
		}
	},
	repeatTrigger = {
		eventTrigger = {
			PercpetEntityReactionTrigger = "interactBehav",
			CommonClientMsgTrigger = "suffix",
			Event_PER_ = "interactBehav",
			LevelMsgTrigger = "in_filtKey",
			GBPMsg_Common = "suffix",
			Event_Ability_ = "suffix",
			GBPMsg_ResPoint = "suffix",
			PlayerVarChangeTrigger = "in_filtKey"
		},
		messageTrigger = {}
	}
}

return data
