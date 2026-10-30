-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolMoveSubTree\\ST_NPCLeadPatrol.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_NPCLeadPatrol = {
	behavior = {
		useForRoute = false,
		agenttype = "WxAgent",
		name = "PatrolTree/PatrolMoveSubTree/ST_NPCLeadPatrol",
		version = 11,
		properties = {},
		pars = {
			{
				name = "patrolPos",
				type = "vector<float>",
				value = "0:",
				const = {}
			},
			{
				name = "patrolMaxTime",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tPatrolSpeed",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tBehaviorSpeedRateType",
				type = "SpeedRateType",
				value = "Slow",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				name = "tPathFindType",
				type = "PathFindType",
				value = "Auto",
				const = BaseEnum.PathFindType.Auto
			},
			{
				name = "tUseAccurateArrive",
				type = "bool",
				const = false,
				value = "false"
			},
			{
				name = "tLeadTargetActorId",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "tJudgeSpeedRateType",
				type = "SpeedRateType",
				value = "Slow",
				const = BaseEnum.SpeedRateType.Slow
			}
		},
		attachments = {},
		node = {
			id = "24",
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
						id = "25",
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
											field = "tBehaviorSpeedRateType"
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
						id = "77",
						class = "Selector",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "78",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "15",
												class = "IfElse",
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
																		id = "68",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "8",
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
																					id = "52",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "53",
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
																													field = "tJudgeSpeedRateType"
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
																								attachments = {
																									{
																										id = "26",
																										transition = false,
																										effector = false,
																										precondition = true,
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
																												Phase = "Enter"
																											}
																										}
																									}
																								},
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
																			},
																			{
																				node = {
																					id = "69",
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
																		id = "72",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "70",
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
																					id = "54",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "55",
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
																								id = "56",
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
																													field = "tJudgeSpeedRateType"
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
																								attachments = {
																									{
																										id = "26",
																										transition = false,
																										effector = false,
																										precondition = true,
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
																												Phase = "Enter"
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
																					id = "71",
																					class = "Noop",
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
													},
													{
														node = {
															id = "79",
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
												id = "67",
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
																	field = "tJudgeSpeedRateType"
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
												attachments = {
													{
														id = "26",
														transition = false,
														effector = false,
														precondition = true,
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
																Phase = "Enter"
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
									id = "81",
									class = "Noop",
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

return ST_NPCLeadPatrol
