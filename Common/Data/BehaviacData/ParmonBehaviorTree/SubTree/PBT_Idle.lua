-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Idle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Idle = {
	behavior = {
		useForRoute = false,
		agenttype = "WxAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Idle",
		version = 13,
		properties = {},
		pars = {
			{
				type = "int",
				name = "tNoIdleSpProb",
				const = 0,
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "20",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "21",
						properties = {
							{
								Method = {
									func = "doSendMessage",
									params = {
										{
											field = "selfId"
										},
										{
											const = {}
										},
										{
											const = "IdleMsgTrigger"
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
						class = "Action",
						id = "22",
						properties = {
							{
								Method = {
									func = "switchToState",
									params = {
										{
											field = "IdleMotionState"
										},
										{
											const = -1
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
						class = "SelectorProbability",
						id = "1",
						properties = {
							{
								UntilSuccessOrEnd = false
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "DecoratorWeight",
									id = "3",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												field = "patrolWeight"
											}
										}
									},
									attachments = {},
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
															class = "Action",
															id = "19",
															properties = {
																{
																	Method = {
																		func = "patrolInRange",
																		params = {
																			{
																				const = 0
																			},
																			{
																				const = BaseEnum.SpeedRateType.Slow
																			},
																			{
																				const = 0
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
															class = "Assignment",
															id = "5",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "patrolWeight"
																	}
																},
																{
																	Opr = {
																		const = 0
																	}
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
									class = "DecoratorWeight",
									id = "7",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 50
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "8",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Compute",
															id = "46",
															properties = {
																{
																	Operator = "Sub"
																},
																{
																	Opl = {
																		field = "tNoIdleSpProb"
																	}
																},
																{
																	Opr1 = {
																		const = 100
																	}
																},
																{
																	Opr2 = {
																		field = "AI_IdleSpecialProb"
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															class = "SelectorProbability",
															id = "42",
															properties = {
																{
																	UntilSuccessOrEnd = false
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		class = "DecoratorWeight",
																		id = "43",
																		properties = {
																			{
																				DecorateWhenChildEnds = "false"
																			},
																			{
																				Weight = {
																					field = "AI_IdleSpecialProb"
																				}
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "SelectorProbability",
																					id = "30",
																					properties = {
																						{
																							UntilSuccessOrEnd = true
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "DecoratorWeight",
																								id = "31",
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
																											class = "Sequence",
																											id = "35",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "34",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "hasAnimState",
																																	params = {
																																		{
																																			const = "IdleSpecial"
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
																														class = "Action",
																														id = "28",
																														properties = {
																															{
																																Method = {
																																	func = "playAction",
																																	params = {
																																		{
																																			const = "IdleSpecial"
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = ""
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = BaseEnum.AIAnimationRootMotionType.Default
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
																								class = "DecoratorWeight",
																								id = "32",
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
																											class = "Sequence",
																											id = "36",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "37",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "hasAnimState",
																																	params = {
																																		{
																																			const = "IdleSpecial02"
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
																														class = "Action",
																														id = "38",
																														properties = {
																															{
																																Method = {
																																	func = "playAction",
																																	params = {
																																		{
																																			const = "IdleSpecial02"
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = ""
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = BaseEnum.AIAnimationRootMotionType.Default
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
																								class = "DecoratorWeight",
																								id = "33",
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
																											class = "Sequence",
																											id = "39",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "40",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "hasAnimState",
																																	params = {
																																		{
																																			const = "IdleSpecial03"
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
																														class = "Action",
																														id = "41",
																														properties = {
																															{
																																Method = {
																																	func = "playAction",
																																	params = {
																																		{
																																			const = "IdleSpecial03"
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = ""
																																		},
																																		{
																																			const = false
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = BaseEnum.AIAnimationRootMotionType.Default
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
																},
																{
																	node = {
																		class = "DecoratorWeight",
																		id = "44",
																		properties = {
																			{
																				DecorateWhenChildEnds = "false"
																			},
																			{
																				Weight = {
																					field = "tNoIdleSpProb"
																				}
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Wait",
																					id = "14",
																					properties = {
																						{
																							Time = {
																								const = 3000
																							}
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
															class = "Assignment",
															id = "12",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "patrolWeight"
																	}
																},
																{
																	Opr = {
																		const = 50
																	}
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

return PBT_Idle
