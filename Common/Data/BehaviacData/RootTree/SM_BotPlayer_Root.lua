-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\RootTree\\SM_BotPlayer_Root.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local SM_BotPlayer_Root = {
	behavior = {
		name = "RootTree/SM_BotPlayer_Root",
		useForRoute = false,
		version = 15,
		agenttype = "BotPlayerAgent",
		properties = {},
		pars = {
			{
				const = "",
				value = "",
				name = "tCurrentPlan",
				type = "string"
			},
			{
				const = "",
				value = "",
				name = "tSubTreePath",
				type = "string"
			},
			{
				const = false,
				value = "false",
				name = "tRunPlan",
				type = "bool"
			},
			{
				const = "",
				value = "",
				name = "tCurrentPlanId",
				type = "string"
			}
		},
		attachments = {},
		node = {
			class = "Selector",
			id = "12",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "1",
						properties = {},
						attachments = {
							{
								class = "Precondition",
								effector = false,
								transition = false,
								id = "13",
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
											func = "checkHasParmonPlan"
										}
									},
									{
										Opr2 = {
											const = true
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
									class = "Assignment",
									id = "2",
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
									class = "Assignment",
									id = "11",
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
									class = "Assignment",
									id = "8",
									properties = {
										{
											CastRight = "true"
										},
										{
											Opl = {
												field = "tCurrentPlanId"
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
									class = "Selector",
									id = "3",
									properties = {},
									attachments = {
										{
											class = "Precondition",
											effector = false,
											transition = false,
											id = "6",
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
														field = "tCurrentPlanId"
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
												class = "Sequence",
												id = "4",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "ReferencedBehavior",
															id = "5",
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
															class = "Assignment",
															id = "6",
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
												class = "Assignment",
												id = "9",
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
									class = "Condition",
									id = "10",
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
									class = "Action",
									id = "7",
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
				},
				{
					node = {
						class = "ReferencedBehavior",
						id = "13",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Idle"
								}
							}
						},
						attachments = {
							{
								class = "Precondition",
								effector = false,
								transition = false,
								id = "14",
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
											func = "checkHasParmonPlan"
										}
									},
									{
										Opr2 = {
											const = false
										}
									},
									{
										Phase = "Both"
									}
								}
							},
							{
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
											func = "getRootState"
										}
									},
									{
										Opr2 = {
											const = BaseEnum.EBTRootState.ST_Root_Idle
										}
									},
									{
										Phase = "Both"
									}
								}
							}
						},
						children = {}
					}
				},
				{
					node = {
						class = "ReferencedBehavior",
						id = "14",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
											func = "checkHasParmonPlan"
										}
									},
									{
										Opr2 = {
											const = false
										}
									},
									{
										Phase = "Both"
									}
								}
							},
							{
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
											func = "getRootState"
										}
									},
									{
										Opr2 = {
											const = BaseEnum.EBTRootState.ST_Root_Combat
										}
									},
									{
										Phase = "Both"
									}
								}
							}
						},
						children = {}
					}
				}
			}
		}
	}
}

return SM_BotPlayer_Root
