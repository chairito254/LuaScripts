-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Affinity.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Affinity = {
	behavior = {
		version = 10,
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Affinity",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				name = "tTgtId",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "31",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					transition = false,
					id = "5",
					class = "Effector",
					effector = true,
					precondition = false,
					properties = {
						{
							Operator = "Invalid"
						},
						{
							Opl = {
								func = "removeEntityTag",
								params = {
									{
										field = "selfId"
									},
									{
										const = "TE_Par_Affinity"
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
						id = "30",
						class = "Action",
						properties = {
							{
								Method = {
									func = "addEntityTag",
									params = {
										{
											field = "selfId"
										},
										{
											const = "TE_Par_Affinity"
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
									func = "showEmojiBubble",
									params = {
										{
											const = "Love"
										},
										{
											const = 3
										},
										{
											const = false
										},
										{
											const = true
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
						id = "1",
						class = "Action",
						properties = {
							{
								Method = {
									func = "turnToTargetAtYaw",
									params = {
										{
											field = "tTgtId"
										},
										{
											const = 0
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
				},
				{
					node = {
						id = "6",
						class = "Action",
						properties = {
							{
								Method = {
									func = "moveAroundTarget",
									params = {
										{
											field = "tTgtId"
										},
										{
											const = 1.5
										},
										{
											const = 2.8
										},
										{
											const = BaseEnum.SpeedRateType.Mid
										},
										{
											const = false
										},
										{
											const = 3
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
						id = "16",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "29",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "27",
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
												id = "28",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														transition = false,
														id = "113",
														class = "Precondition",
														effector = false,
														precondition = true,
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
														id = "117",
														class = "Precondition",
														effector = false,
														precondition = true,
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
																			field = "tTgtId"
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
														id = "119",
														class = "Effector",
														effector = true,
														precondition = false,
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
															id = "14",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "moveToTarget",
																		params = {
																			{
																				field = "tTgtId"
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
									id = "19",
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
												id = "17",
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
															id = "12",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "turnToTarget",
																		params = {
																			{
																				field = "tTgtId"
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
												id = "15",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														transition = false,
														id = "35",
														class = "Precondition",
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
																	func = "checkTargetLocation",
																	params = {
																		{
																			field = "tTgtId"
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
														id = "103",
														class = "Effector",
														effector = true,
														precondition = false,
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
															id = "8",
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
																		id = "9",
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
																					id = "10",
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
																		id = "7",
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
																					id = "11",
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
															id = "26",
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
															id = "13",
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
															id = "25",
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
															id = "23",
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
																		id = "20",
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
																					id = "21",
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
																		id = "18",
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
																					id = "22",
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
															id = "24",
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
		}
	}
}

return PBT_Com_Affinity
