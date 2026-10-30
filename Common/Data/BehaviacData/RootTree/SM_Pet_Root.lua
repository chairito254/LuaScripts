-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\RootTree\\SM_Pet_Root.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local SM_Pet_Root = {
	behavior = {
		version = 8,
		name = "RootTree/SM_Pet_Root",
		useForRoute = false,
		agenttype = "PetAgent",
		properties = {},
		pars = {
			{
				type = "string",
				const = "",
				name = "tCurrentPlan",
				value = ""
			},
			{
				type = "string",
				const = "",
				name = "tSubTreePath",
				value = ""
			},
			{
				type = "bool",
				const = false,
				name = "tRunPlan",
				value = "false"
			},
			{
				type = "string",
				const = "",
				name = "tCurrentPlanId",
				value = ""
			}
		},
		attachments = {},
		node = {
			class = "Selector",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "2",
						properties = {},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "13",
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
									id = "3",
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
									id = "4",
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
									id = "10",
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
									class = "Selector",
									id = "5",
									properties = {},
									attachments = {
										{
											precondition = true,
											class = "Precondition",
											effector = false,
											transition = false,
											id = "6",
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
												class = "Sequence",
												id = "6",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "ReferencedBehavior",
															id = "7",
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
															id = "8",
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
												id = "11",
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
									id = "12",
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
									id = "9",
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
						id = "14",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Idle"
								}
							}
						},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
						id = "17",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
											const = BaseEnum.EBTRootState.ST_Root_Follow
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
						id = "18",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
				},
				{
					node = {
						class = "ReferencedBehavior",
						id = "19",
						properties = {
							{
								ReferenceBehavior = {
									const = "PBT_Noop"
								}
							},
							{
								subTreeProperties = {}
							}
						},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
											const = BaseEnum.EBTRootState.ST_Root_Guide
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
						id = "20",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
											const = BaseEnum.EBTRootState.ST_Root_Wait
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
						id = "21",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "15",
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
								precondition = true,
								class = "Precondition",
								effector = false,
								transition = false,
								id = "16",
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
											const = BaseEnum.EBTRootState.ST_Root_Afk
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

return SM_Pet_Root
