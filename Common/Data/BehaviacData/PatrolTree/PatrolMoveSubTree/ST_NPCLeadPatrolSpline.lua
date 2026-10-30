-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolMoveSubTree\\ST_NPCLeadPatrolSpline.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_NPCLeadPatrolSpline = {
	behavior = {
		useForRoute = false,
		version = 16,
		agenttype = "WxAgent",
		name = "PatrolTree/PatrolMoveSubTree/ST_NPCLeadPatrolSpline",
		properties = {},
		pars = {
			{
				type = "vector<float>",
				value = "0:",
				name = "patrolStartPos",
				const = {}
			},
			{
				type = "vector<float>",
				value = "0:",
				name = "patrolPosList",
				const = {}
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "patrolMaxTime"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tPatrolSpeed"
			},
			{
				type = "SpeedRateType",
				value = "Mid",
				name = "tBehaviorSpeedRateType",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				type = "bool",
				const = false,
				value = "false",
				name = "tUseAccurateArrive"
			},
			{
				type = "bool",
				const = false,
				value = "false",
				name = "tIsFirstPoint"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tLeadTargetActorId"
			},
			{
				type = "vector<float>",
				value = "0:",
				name = "tNormalList",
				const = {}
			},
			{
				type = "SpeedRateType",
				value = "Slow",
				name = "tJudgeSpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				type = "vector<float>",
				value = "0:",
				name = "patrolPos",
				const = {}
			},
			{
				type = "PathFindType",
				value = "Auto",
				name = "tPathFindType",
				const = BaseEnum.PathFindType.Auto
			}
		},
		attachments = {},
		node = {
			id = "29",
			class = "Parallel",
			properties = {
				{
					ChildFinishPolicy = "CHILDFINISH_LOOP"
				},
				{
					ExitPolicy = "EXIT_ABORT_RUNNINGSIBLINGS"
				},
				{
					FailurePolicy = "FAIL_ON_ONE"
				},
				{
					SuccessPolicy = "SUCCEED_ON_ALL"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						id = "32",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tJudgeSpeedRateType"
								}
							},
							{
								Opr = {
									func = "judgeSpeedRateTypeByTarget",
									params = {
										{
											field = "tLeadTargetActorId"
										},
										{
											const = 3
										},
										{
											const = 4
										},
										{
											field = "tJudgeSpeedRateType"
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
						id = "27",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "1",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
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
															id = "5",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "7",
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
																							field = "patrolStartPos"
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
																		id = "8",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "12",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkIsFlying",
																								params = {
																									{
																										const = 0
																									}
																								}
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
																					id = "39",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "38",
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
																													field = "tPathFindType"
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
																								id = "37",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "switchToState",
																											params = {
																												{
																													const = "LOCOMOTION"
																												},
																												{
																													const = 0
																												},
																												{
																													const = ""
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
																},
																{
																	node = {
																		id = "9",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "14",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkIsFlying",
																								params = {
																									{
																										const = 0
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
																					id = "42",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "40",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "switchToState",
																											params = {
																												{
																													const = "FLYING"
																												},
																												{
																													const = 0
																												},
																												{
																													const = ""
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
																								id = "41",
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
																													field = "tPathFindType"
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
																						}
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													},
													{
														node = {
															id = "6",
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
												id = "17",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "18",
															class = "Condition",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		field = "tIsFirstPoint"
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
															id = "15",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "moveToPos",
																		params = {
																			{
																				field = "patrolStartPos"
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
																				field = "tJudgeSpeedRateType"
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
															attachments = {
																{
																	precondition = true,
																	id = "19",
																	effector = false,
																	class = "Precondition",
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
																				func = "checkIsInRangeTgt2D",
																				params = {
																					{
																						field = "tLeadTargetActorId"
																					},
																					{
																						const = 0
																					},
																					{
																						const = 5
																					},
																					{
																						const = true
																					},
																					{
																						const = true
																					}
																				}
																			}
																		},
																		{
																			Opr2 = {
																				const = true
																			}
																		},
																		{
																			Phase = "Update"
																		}
																	}
																}
															},
															children = {}
														}
													}
												}
											}
										},
										{
											node = {
												id = "10",
												class = "Action",
												properties = {
													{
														Method = {
															func = "moveToPosList",
															params = {
																{
																	field = "patrolPosList"
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
																	field = "tJudgeSpeedRateType"
																},
																{
																	field = "tPatrolSpeed"
																},
																{
																	field = "tNormalList"
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
												attachments = {
													{
														precondition = true,
														id = "21",
														effector = false,
														class = "Precondition",
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
																	func = "checkIsInRangeTgt2D",
																	params = {
																		{
																			field = "tLeadTargetActorId"
																		},
																		{
																			const = 0
																		},
																		{
																			const = 5
																		},
																		{
																			const = true
																		},
																		{
																			const = true
																		}
																	}
																}
															},
															{
																Opr2 = {
																	const = true
																}
															},
															{
																Phase = "Update"
															}
														}
													}
												},
												children = {}
											}
										}
									}
								}
							},
							{
								node = {
									id = "28",
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

return ST_NPCLeadPatrolSpline
