-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CastChargeSkill.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CastChargeSkill = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_CastChargeSkill",
		useForRoute = false,
		version = 8,
		properties = {},
		pars = {
			{
				type = "int",
				name = "tSkillTargetActorId",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tSkillId",
				value = "0",
				const = 0
			},
			{
				type = "bool",
				name = "tAutoCast",
				value = "true",
				const = true
			},
			{
				type = "float",
				name = "tChargeTime",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tPartId",
				value = "0",
				const = 0
			},
			{
				type = "bool",
				name = "tSkipBackswing",
				value = "false",
				const = false
			},
			{
				type = "CastAbilitySourceType",
				name = "tCastAbilitySource",
				value = "Normal",
				const = BaseEnum.CastAbilitySourceType.Normal
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "castChargetSkill",
						params = {
							{
								field = "tSkillTargetActorId"
							},
							{
								field = "tSkillId"
							},
							{
								field = "tChargeTime"
							},
							{
								field = "tPartId"
							},
							{
								field = "tSkipBackswing"
							},
							{
								field = "tAutoCast"
							},
							{
								field = "tCastAbilitySource"
							}
						}
					}
				},
				{
					ResultOption = "BT_INVALID"
				},
				{
					ResultResumeOption = "BT_ResumeSelf"
				}
			},
			attachments = {},
			children = {}
		}
	}
}

return PBT_CastChargeSkill
