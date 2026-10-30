-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Egg_10161.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Egg_10161 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Egg_10161",
		useForRoute = false,
		version = 58,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				name = "CurrentDistToTarget",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "CurrentBoxDistToTarget",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "goBackDist",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "skillStopDist",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tWeight_Group_SideWalk",
				const = 100,
				type = "int",
				value = "100"
			},
			{
				name = "tWeight_Group_Wait",
				const = 100,
				type = "int",
				value = "100"
			},
			{
				name = "tWeight_Group_Angry",
				const = 100,
				type = "int",
				value = "100"
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
						id = "3",
						class = "DecoratorLoop",
						properties = {
							{
								Count = {
									const = -1
								}
							},
							{
								DecorateWhenChildEnds = "true"
							},
							{
								DoneWithinFrame = "false"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									id = "434",
									class = "Action",
									properties = {
										{
											Method = {
												func = "leaveTarget",
												params = {
													{
														field = "tgt"
													},
													{
														const = 30
													},
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Fast
													},
													{
														const = 20
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

return ST_Monster_AutoCombat_Egg_10161
