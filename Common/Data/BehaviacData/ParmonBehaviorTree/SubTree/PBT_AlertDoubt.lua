-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_AlertDoubt.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_AlertDoubt = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_AlertDoubt",
		agenttype = "CombatAgent",
		version = 5,
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				const = 0,
				type = "int",
				value = "0"
			},
			{
				name = "tRandomWaitTime",
				const = 0,
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Condition",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tSensorTgtId"
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
						id = "12",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tRandomWaitTime"
								}
							},
							{
								Opr = {
									func = "getRandomFloat",
									params = {
										{
											const = 0
										},
										{
											const = 0.7
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
						id = "13",
						class = "Action",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											field = "tRandomWaitTime"
										}
									}
								}
							},
							{
								ResultOption = "BT_INVALID"
							},
							{
								ResultResumeOption = "BT_ResumeTree"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "3",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "8",
									class = "Action",
									properties = {
										{
											Method = {
												func = "showQuestionMark",
												params = {
													{
														const = "Gray"
													},
													{
														const = 1.8
													}
												}
											}
										},
										{
											ResultOption = "BT_INVALID"
										},
										{
											ResultResumeOption = "BT_None"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "4",
									class = "Action",
									properties = {
										{
											Method = {
												func = "playAction",
												params = {
													{
														const = "Behav_Alert"
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
													},
													{
														const = 0
													},
													{
														const = BaseEnum.AIAnimationRootMotionType.Default
													}
												}
											}
										},
										{
											ResultOption = "BT_INVALID"
										},
										{
											ResultResumeOption = "BT_ResumeTree"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "15",
									class = "Action",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														const = 50
													}
												}
											}
										},
										{
											ResultOption = "BT_INVALID"
										},
										{
											ResultResumeOption = "BT_ResumeTree"
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

return PBT_AlertDoubt
