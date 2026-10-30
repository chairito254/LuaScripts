-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_NpcChallenge_Thunder.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_NpcChallenge_Thunder = {
	behavior = {
		useForRoute = false,
		version = 335,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_NpcChallenge_Thunder",
		properties = {},
		pars = {
			{
				value = "false",
				const = false,
				type = "bool",
				name = "tShow50PCBubble"
			},
			{
				value = "false",
				const = false,
				type = "bool",
				name = "tShow20PCBubble"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentDistToTarget"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentEP"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentHpPercent"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_JumpBack"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_RunBack"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_Skill"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_CommonAttack"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "Weight_NothingToDo"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "maxSkillDist"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "skillStopDist"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "goBackDist"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tNewTargetForCatchMode"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "CurrentBoxDistToTarget"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tAngryPrepare"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tDrowningDepth"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tFlyHeight"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tVerticalDistToTgt"
			},
			{
				value = "0",
				const = "0",
				type = "string",
				name = "tSkillPlan"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tSkillUsed"
			},
			{
				value = "0",
				const = "0",
				type = "string",
				name = "tCurrentTactics"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "Skillcd"
			}
		},
		attachments = {},
		node = {
			id = "569",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "1476",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tgt"
								}
							},
							{
								Opr = {
									func = "getTarget"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "1474",
						class = "Action",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											const = 3
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
				},
				{
					node = {
						id = "1477",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											field = "selfId"
										},
										{
											const = 11431000
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = false
										},
										{
											const = BaseEnum.CastAbilitySourceType.Normal
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
		}
	}
}

return ST_Monster_AutoCombat_NpcChallenge_Thunder
