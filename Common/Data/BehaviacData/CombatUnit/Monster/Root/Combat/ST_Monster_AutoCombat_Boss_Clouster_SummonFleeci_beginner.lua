-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_Clouster_SummonFleeci_beginner.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_Clouster_SummonFleeci_beginner = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_Clouster_SummonFleeci_beginner",
		version = 16,
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				name = "disToTgtForSkillMon",
				const = 7,
				value = "7",
				type = "float"
			},
			{
				name = "goBackDist",
				const = 0,
				value = "0",
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "154",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "160",
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
									func = "getAuthorityPlayer"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "DecoratorLoop",
						id = "150",
						properties = {
							{
								Count = {
									const = -1
								}
							},
							{
								DecorateWhenChildEnds = "false"
							},
							{
								DoneWithinFrame = "false"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "174",
									properties = {
										{
											Method = {
												func = "playPhaseAction",
												params = {
													{
														const = "Behav_HappyStart"
													},
													{
														const = "Behav_HappyLoop"
													},
													{
														const = "Behav_HappyEnd"
													},
													{
														const = 3
													},
													{
														const = ""
													},
													{
														const = false
													},
													{
														const = false
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
		}
	}
}

return ST_Monster_AutoCombat_Boss_Clouster_SummonFleeci_beginner
