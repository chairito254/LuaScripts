-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\RootTree\\SM_Npc_Root.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local SM_Npc_Root = {
	behavior = {
		name = "RootTree/SM_Npc_Root",
		useForRoute = false,
		version = 10,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tCurrentPlan",
				type = "string",
				const = "",
				value = ""
			},
			{
				name = "tSubTreePath",
				type = "string",
				const = "",
				value = ""
			},
			{
				name = "tRunPlan",
				type = "bool",
				const = false,
				value = "false"
			},
			{
				name = "tCurrentPlanId",
				type = "string",
				const = "",
				value = ""
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Sequence",
						properties = {},
						attachments = {
							{
								effector = false,
								precondition = true,
								class = "Precondition",
								id = "13",
								transition = false,
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
									id = "3",
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
									id = "12",
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
									id = "9",
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
									id = "4",
									class = "Selector",
									properties = {},
									attachments = {
										{
											effector = false,
											precondition = true,
											class = "Precondition",
											id = "6",
											transition = false,
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
												id = "5",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "6",
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
															id = "7",
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
									id = "11",
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
									id = "8",
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
				},
				{
					node = {
						id = "13",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Idle"
								}
							}
						},
						attachments = {
							{
								effector = false,
								precondition = true,
								class = "Precondition",
								id = "14",
								transition = false,
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
								effector = false,
								precondition = true,
								class = "Precondition",
								id = "15",
								transition = false,
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
				}
			}
		}
	}
}

return SM_Npc_Root
