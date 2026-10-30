-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_IdlePatrol.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_IdlePatrol = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_IdlePatrol",
		agenttype = "WxAgent",
		version = 14,
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tNoIdleSpProb"
			},
			{
				value = "Slow",
				type = "SpeedRateType",
				name = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				value = "1",
				const = 1,
				type = "float",
				name = "Speed"
			}
		},
		attachments = {},
		node = {
			id = "36",
			class = "IfElse",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "38",
						class = "Condition",
						properties = {
							{
								Operator = "Equal"
							},
							{
								Opl = {
									func = "checkCharacterState",
									params = {
										{
											const = "SWIMMING"
										},
										{
											field = "selfId"
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
						id = "37",
						class = "Action",
						properties = {
							{
								Method = {
									func = "patrolInRange",
									params = {
										{
											const = 0
										},
										{
											field = "SpeedRateType"
										},
										{
											field = "Speed"
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
						id = "28",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "9",
									class = "Action",
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
									id = "0",
									class = "SelectorProbability",
									properties = {
										{
											UntilSuccessOrEnd = false
										}
									},
									attachments = {},
									children = {
										{
											node = {
												id = "2",
												class = "DecoratorWeight",
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
															id = "1",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "4",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "patrolInRange",
																					params = {
																						{
																							const = 0
																						},
																						{
																							field = "SpeedRateType"
																						},
																						{
																							field = "Speed"
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
																		id = "3",
																		class = "Assignment",
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
												id = "5",
												class = "DecoratorWeight",
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
															id = "6",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "26",
																		class = "Compute",
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
																		id = "23",
																		class = "SelectorProbability",
																		properties = {
																			{
																				UntilSuccessOrEnd = false
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "24",
																					class = "DecoratorWeight",
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
																								id = "12",
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
																											id = "13",
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
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
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
																																	id = "10",
																																	class = "Action",
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
																											id = "14",
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
																														id = "17",
																														class = "Sequence",
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
																																	id = "19",
																																	class = "Action",
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
																											id = "15",
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
																														id = "20",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "21",
																																	class = "Condition",
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
																																	id = "22",
																																	class = "Action",
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
																					id = "25",
																					class = "DecoratorWeight",
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
																								id = "8",
																								class = "Wait",
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
																		id = "7",
																		class = "Assignment",
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
		}
	}
}

return PBT_Behav_Com_IdlePatrol
