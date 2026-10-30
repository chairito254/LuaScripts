-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\RootTree\\SM_Monster_Root.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local SM_Monster_Root = {
	behavior = {
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "RootTree/SM_Monster_Root",
		version = 15,
		properties = {},
		pars = {
			{
				type = "string",
				value = "",
				const = "",
				name = "tCurrentPlan"
			},
			{
				type = "string",
				value = "",
				const = "",
				name = "tSubTreePath"
			},
			{
				type = "bool",
				value = "false",
				const = false,
				name = "tRunPlan"
			},
			{
				type = "string",
				value = "",
				const = "",
				name = "tCurrentPlanId"
			}
		},
		attachments = {},
		node = {
			id = "12",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "13",
						class = "ReferencedBehavior",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "15",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_Dead
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
						id = "14",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_GoHome"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "16",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_GoHome
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
						id = "24",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									const = "PBT_WildFollow"
								}
							},
							{
								subTreeProperties = {}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
						id = "1",
						class = "Sequence",
						properties = {},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "18",
								class = "Precondition",
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "NotEqual"
									},
									{
										Opl = {
											func = "getRootState"
										}
									},
									{
										Opr2 = {
											const = BaseEnum.EBTRootState.ST_Root_Dead
										}
									},
									{
										Phase = "Both"
									}
								}
							},
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "19",
								class = "Precondition",
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "NotEqual"
									},
									{
										Opl = {
											func = "getRootState"
										}
									},
									{
										Opr2 = {
											const = BaseEnum.EBTRootState.ST_Root_GoHome
										}
									},
									{
										Phase = "Both"
									}
								}
							},
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "25",
								class = "Precondition",
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "NotEqual"
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
							},
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "13",
								class = "Precondition",
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
									id = "11",
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
									id = "8",
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
									id = "3",
									class = "Selector",
									properties = {},
									attachments = {
										{
											transition = false,
											effector = false,
											precondition = true,
											id = "6",
											class = "Precondition",
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
												id = "4",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "5",
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
															id = "6",
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
												id = "9",
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
									id = "10",
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
									id = "7",
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
						id = "23",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
						id = "17",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_AutoCombat"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
						id = "22",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_Recruit
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
						id = "27",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Alert"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_Alert
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
						id = "28",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Sensed"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_Sensed
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
						id = "29",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									func = "getCurrentBehaviorPath"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_HomeLand
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
						id = "31",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Born"
								}
							}
						},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "20",
								class = "Precondition",
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
								transition = false,
								effector = false,
								precondition = true,
								id = "21",
								class = "Precondition",
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
											const = BaseEnum.EBTRootState.ST_Root_Born
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

return SM_Monster_Root
