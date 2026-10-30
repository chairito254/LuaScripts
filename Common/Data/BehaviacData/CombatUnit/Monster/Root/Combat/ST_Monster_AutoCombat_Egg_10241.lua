-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Egg_10241.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Egg_10241 = {
	behavior = {
		useForRoute = false,
		version = 57,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Egg_10241",
		properties = {},
		pars = {
			{
				type = "float",
				const = 0,
				value = "0",
				name = "CurrentDistToTarget"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "CurrentBoxDistToTarget"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "goBackDist"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "skillStopDist"
			},
			{
				type = "int",
				const = 100,
				value = "100",
				name = "tWeight_Group_SideWalk"
			},
			{
				type = "int",
				const = 100,
				value = "100",
				name = "tWeight_Group_Wait"
			},
			{
				type = "int",
				const = 100,
				value = "100",
				name = "tWeight_Group_Angry"
			}
		},
		attachments = {},
		node = {
			id = "344",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "347",
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
						id = "346",
						class = "Condition",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tgt"
								}
							},
							{
								Opr = {
									const = 0
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "345",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "distToTgt"
								}
							},
							{
								Opr = {
									func = "getDistByTgt",
									params = {
										{
											field = "tgt"
										},
										{
											const = false
										},
										{
											const = false
										},
										{
											const = 0
										}
									}
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "351",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "attackWeight"
								}
							},
							{
								Opr = {
									const = 100
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "352",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "skillCd"
								}
							},
							{
								Opr = {
									const = 5
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "394",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											field = "tgt"
										},
										{
											const = 12410100
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

return ST_Monster_AutoCombat_Egg_10241
