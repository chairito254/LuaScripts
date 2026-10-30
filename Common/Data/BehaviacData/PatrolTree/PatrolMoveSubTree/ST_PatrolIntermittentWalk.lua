-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolMoveSubTree\\ST_PatrolIntermittentWalk.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_PatrolIntermittentWalk = {
	behavior = {
		version = 6,
		useForRoute = false,
		agenttype = "WxAgent",
		name = "PatrolTree/PatrolMoveSubTree/ST_PatrolIntermittentWalk",
		properties = {},
		pars = {
			{
				type = "vector<float>",
				value = "0:",
				name = "patrolPos",
				const = {}
			},
			{
				const = 0,
				type = "float",
				value = "0",
				name = "patrolMaxTime"
			},
			{
				const = 0,
				type = "float",
				value = "0",
				name = "tPatrolSpeed"
			},
			{
				type = "SpeedRateType",
				value = "Slow",
				name = "tBehaviorSpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
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
						id = "9",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "11",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkCanFly"
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
									id = "2",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "4",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkPosIsOnGround",
															params = {
																{
																	field = "patrolPos"
																}
															}
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
												id = "7",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToGround"
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
												id = "8",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToFly",
															params = {
																{
																	const = 2
																},
																{
																	const = 5
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
							},
							{
								node = {
									id = "12",
									class = "Noop",
									properties = {},
									attachments = {},
									children = {}
								}
							}
						}
					}
				},
				{
					node = {
						id = "3",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "6",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToPos",
												params = {
													{
														field = "patrolPos"
													},
													{
														field = "patrolMaxTime"
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
														field = "tPatrolSpeed"
													},
													{
														const = BaseEnum.PathFindType.Auto
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
							},
							{
								node = {
									id = "5",
									class = "True",
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

return ST_PatrolIntermittentWalk
