-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_MoveToPoint.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_MoveToPoint = {
	behavior = {
		version = 5,
		useForRoute = false,
		agenttype = "WxAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_MoveToPoint",
		properties = {},
		pars = {
			{
				value = "0:",
				name = "tMovePos",
				type = "vector<float>",
				const = {}
			},
			{
				value = "15",
				const = 15,
				name = "tMoveMaxTime",
				type = "float"
			},
			{
				value = "-1",
				const = -1,
				name = "tMoveSpeed",
				type = "float"
			},
			{
				value = "Mid",
				name = "tBehaviorSpeedRateType",
				type = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				value = "false",
				const = false,
				name = "tUseAccurateArrive",
				type = "bool"
			},
			{
				value = "false",
				const = false,
				name = "tTeleportIfCannotMove",
				type = "bool"
			}
		},
		attachments = {},
		node = {
			class = "Selector",
			id = "6",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "4",
						properties = {
							{
								Method = {
									func = "moveToPos",
									params = {
										{
											field = "tMovePos"
										},
										{
											field = "tMoveMaxTime"
										},
										{
											const = true
										},
										{
											const = 0
										},
										{
											field = "tBehaviorSpeedRateType"
										},
										{
											field = "tMoveSpeed"
										},
										{
											const = BaseEnum.PathFindType.Auto
										},
										{
											const = false
										},
										{
											field = "tUseAccurateArrive"
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
						class = "IfElse",
						id = "8",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "13",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "tTeleportIfCannotMove"
											}
										},
										{
											Opr = {
												const = true
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									class = "Action",
									id = "7",
									properties = {
										{
											Method = {
												func = "teleportToPosition",
												params = {
													{
														field = "tMovePos"
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
							},
							{
								node = {
									class = "DecoratorAlwaysFailure",
									id = "12",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "Noop",
												id = "11",
												properties = {},
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
		}
	}
}

return PBT_MoveToPoint
