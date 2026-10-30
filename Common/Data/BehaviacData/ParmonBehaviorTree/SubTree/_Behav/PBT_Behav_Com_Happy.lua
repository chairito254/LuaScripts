-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_Happy.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Happy = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_Happy",
		version = 21,
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tTargetActorId"
			}
		},
		attachments = {},
		node = {
			id = "42",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "58",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "56",
									class = "Action",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "tMoveTimer"
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
									id = "57",
									class = "Sequence",
									properties = {},
									attachments = {
										{
											transition = false,
											effector = false,
											precondition = true,
											id = "113",
											class = "Precondition",
											properties = {
												{
													BinaryOperator = "And"
												},
												{
													Operator = "LessEqual"
												},
												{
													Opl = {
														func = "getTimerValue",
														params = {
															{
																const = "tMoveTimer"
															}
														}
													}
												},
												{
													Opr2 = {
														const = 10
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
											id = "117",
											class = "Precondition",
											properties = {
												{
													BinaryOperator = "And"
												},
												{
													Operator = "LessEqual"
												},
												{
													Opl = {
														func = "getDistByTgt",
														params = {
															{
																field = "tTargetActorId"
															},
															{
																const = true
															},
															{
																const = true
															},
															{
																const = 0
															}
														}
													}
												},
												{
													Opr2 = {
														const = 15
													}
												},
												{
													Phase = "Both"
												}
											}
										},
										{
											transition = false,
											effector = true,
											precondition = false,
											id = "119",
											class = "Effector",
											properties = {
												{
													Operator = "Invalid"
												},
												{
													Opl = {
														func = "cleanTimer",
														params = {
															{
																const = "tMoveTimer"
															}
														}
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
												id = "40",
												class = "Action",
												properties = {
													{
														Method = {
															func = "moveToTarget",
															params = {
																{
																	field = "tTargetActorId"
																},
																{
																	const = 2
																},
																{
																	const = 10
																},
																{
																	const = false
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
																	const = BaseEnum.MoveUpdateLevel.Normal
																},
																{
																	const = BaseEnum.PathFindType.Auto
																},
																{
																	const = BaseEnum.SpeedRateType.Slow
																},
																{
																	const = 0
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
										}
									}
								}
							}
						}
					}
				},
				{
					node = {
						id = "45",
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
									id = "43",
									class = "DecoratorAlwaysSuccess",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										}
									},
									attachments = {},
									children = {
										{
											node = {
												id = "38",
												class = "Action",
												properties = {
													{
														Method = {
															func = "turnToTarget",
															params = {
																{
																	field = "tTargetActorId"
																},
																{
																	const = false
																},
																{
																	const = 0
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
										}
									}
								}
							},
							{
								node = {
									id = "41",
									class = "Sequence",
									properties = {},
									attachments = {
										{
											transition = false,
											effector = false,
											precondition = true,
											id = "35",
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
														func = "checkTargetLocation",
														params = {
															{
																field = "tTargetActorId"
															},
															{
																const = 0
															},
															{
																const = 0
															},
															{
																const = 0
															},
															{
																const = 3
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
													Phase = "Both"
												}
											}
										},
										{
											transition = false,
											effector = true,
											precondition = false,
											id = "103",
											class = "Effector",
											properties = {
												{
													Operator = "Invalid"
												},
												{
													Opl = {
														func = "hideEmojiBubble"
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
												id = "34",
												class = "SelectorProbability",
												properties = {
													{
														UntilSuccessOrEnd = true
													}
												},
												attachments = {},
												children = {
													{
														node = {
															id = "35",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 1
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "36",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Happy"
																						},
																						{
																							const = 5
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
															id = "33",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 1
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "37",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Proud"
																						},
																						{
																							const = 5
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
											}
										},
										{
											node = {
												id = "55",
												class = "Action",
												properties = {
													{
														Method = {
															func = "sendMessageToTrigger",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = 1011
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
												id = "46",
												class = "Action",
												properties = {
													{
														Method = {
															func = "playSleAnimationOnce",
															params = {
																{
																	const = "Behav_HappyStart"
																},
																{
																	const = "Behav_HappyLoop"
																},
																{
																	const = "Behav_HappyEnd"
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
												id = "54",
												class = "Action",
												properties = {
													{
														Method = {
															func = "waitTime",
															params = {
																{
																	const = 1
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
												id = "52",
												class = "SelectorProbability",
												properties = {
													{
														UntilSuccessOrEnd = true
													}
												},
												attachments = {},
												children = {
													{
														node = {
															id = "49",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 1
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "50",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Happy"
																						},
																						{
																							const = 5
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
															id = "48",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 1
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "51",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Proud"
																						},
																						{
																							const = 5
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
											}
										},
										{
											node = {
												id = "53",
												class = "Action",
												properties = {
													{
														Method = {
															func = "playSleAnimationOnce",
															params = {
																{
																	const = "Behav_HappyStart"
																},
																{
																	const = "Behav_HappyLoop"
																},
																{
																	const = "Behav_HappyEnd"
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
				}
			}
		}
	}
}

return PBT_Behav_Com_Happy
