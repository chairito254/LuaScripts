-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\PBT_Plan.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Plan = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/PBT_Plan",
		version = 7,
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = "",
				type = "string",
				value = "",
				name = "tCurrentPlan"
			},
			{
				const = "",
				type = "string",
				value = "",
				name = "tSubTreePath"
			},
			{
				const = false,
				type = "bool",
				value = "false",
				name = "tRunPlan"
			},
			{
				const = 0,
				type = "int",
				value = "0",
				name = "tCurrentPlanId"
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
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tRunPlan"
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
						id = "4",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tCurrentPlan"
								}
							},
							{
								Opr = {
									func = "getParmonPlanSubtreePath"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "14",
						class = "Assignment",
						properties = {
							{
								CastRight = "true"
							},
							{
								Opl = {
									field = "tCurrentPlanId "
								}
							},
							{
								Opr = {
									func = "getParmonPlanID"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "5",
						class = "Selector",
						properties = {},
						attachments = {
							{
								id = "6",
								class = "Precondition",
								transition = false,
								effector = false,
								precondition = true,
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "Equal"
									},
									{
										Opl = {
											field = "tCurrentPlanId "
										}
									},
									{
										Opr2 = {
											func = "getParmonPlanID"
										}
									},
									{
										Phase = "Both"
									}
								}
							}
						},
						children = {
							{
								node = {
									id = "7",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "9",
												class = "ReferencedBehavior",
												properties = {
													{
														ReferenceBehavior = {
															field = "tCurrentPlan"
														}
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												id = "10",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tRunPlan"
														}
													},
													{
														Opr = {
															func = "tryRunParmonPlan"
														}
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
									id = "15",
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tRunPlan"
											}
										},
										{
											Opr = {
												const = false
											}
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
						id = "16",
						class = "Condition",
						properties = {
							{
								Operator = "Equal"
							},
							{
								Opl = {
									field = "tRunPlan"
								}
							},
							{
								Opr = {
									const = false
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
						class = "Action",
						properties = {
							{
								Method = {
									func = "breakParmonPlan",
									params = {
										{
											field = "tCurrentPlanId "
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
				}
			}
		}
	}
}

return PBT_Plan
