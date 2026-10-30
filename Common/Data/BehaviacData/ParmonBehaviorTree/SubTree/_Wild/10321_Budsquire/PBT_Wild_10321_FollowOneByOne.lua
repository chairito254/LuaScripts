-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10321_Budsquire\\PBT_Wild_10321_FollowOneByOne.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10321_FollowOneByOne = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Wild/10321_Budsquire/PBT_Wild_10321_FollowOneByOne",
		version = 29,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tFollowEntActorID",
				value = "0",
				const = 0,
				type = "int"
			},
			{
				name = "tFollowStopDist",
				value = "0",
				const = 0,
				type = "float"
			},
			{
				name = "tRandomFloat",
				value = "0",
				const = 0,
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "DecoratorLoop",
			id = "1",
			properties = {
				{
					Count = {
						const = -1
					}
				},
				{
					DecorateWhenChildEnds = "false"
				},
				{
					DoneWithinFrame = "false"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						class = "SelectorProbability",
						id = "4",
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
									id = "5",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 70
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "2",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "IfElse",
															id = "12",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "14",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkHasFormation",
																					params = {
																						{
																							field = "tFollowEntActorID"
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
																		class = "Sequence",
																		id = "26",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "20",
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
																					class = "Action",
																					id = "25",
																					properties = {
																						{
																							Method = {
																								func = "showEmojiBubble",
																								params = {
																									{
																										const = "Dizzy"
																									},
																									{
																										const = 0
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
																			},
																			{
																				node = {
																					class = "Assignment",
																					id = "30",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "tRandomFloat"
																							}
																						},
																						{
																							Opr = {
																								func = "getRandomFloat",
																								params = {
																									{
																										const = 25
																									},
																									{
																										const = 30
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
																					class = "Action",
																					id = "10",
																					properties = {
																						{
																							Method = {
																								func = "followTargetWithFormation",
																								params = {
																									{
																										field = "tFollowEntActorID"
																									},
																									{
																										field = "tRandomFloat"
																									},
																									{
																										const = 0.1
																									},
																									{
																										const = 2
																									},
																									{
																										const = 4
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
																		class = "Noop",
																		id = "15",
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
								}
							},
							{
								node = {
									class = "DecoratorWeight",
									id = "6",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 30
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "IfElse",
												id = "18",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "17",
															properties = {
																{
																	Operator = "LessEqual"
																},
																{
																	Opl = {
																		func = "getTimerValue",
																		params = {
																			{
																				const = "PlayAni"
																			}
																		}
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
													},
													{
														node = {
															class = "Sequence",
															id = "8",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "16",
																		properties = {
																			{
																				Method = {
																					func = "startTimer",
																					params = {
																						{
																							const = "PlayAni"
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
																		id = "29",
																		properties = {
																			{
																				Method = {
																					func = "showDialogue",
																					params = {
																						{
																							const = 70008613
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
																		id = "27",
																		properties = {
																			{
																				Method = {
																					func = "showEmojiBubble",
																					params = {
																						{
																							const = "Cry"
																						},
																						{
																							const = 0
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
																},
																{
																	node = {
																		class = "Action",
																		id = "7",
																		properties = {
																			{
																				Method = {
																					func = "playAction",
																					params = {
																						{
																							const = "SprintToRun"
																						},
																						{
																							const = 1
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
																							const = 1
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
																				ResultResumeOption = "BT_ResumeTree"
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		class = "ReferencedBehavior",
																		id = "9",
																		properties = {
																			{
																				ReferenceBehavior = {
																					const = "PBT_Com_Cry"
																				}
																			},
																			{
																				subTreeProperties = {
																					{
																						Name = "tAnimationTimeout",
																						Type = "Const",
																						Value = {
																							const = 5
																						}
																					}
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
															class = "Sequence",
															id = "32",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Assignment",
																		id = "31",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tRandomFloat"
																				}
																			},
																			{
																				Opr = {
																					func = "getRandomFloat",
																					params = {
																						{
																							const = 10
																						},
																						{
																							const = 25
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
																		class = "IfElse",
																		id = "23",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "22",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								func = "getTimerValue",
																								params = {
																									{
																										const = "PlayAni"
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								field = "tRandomFloat"
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
																					id = "19",
																					properties = {
																						{
																							Method = {
																								func = "cleanTimer",
																								params = {
																									{
																										const = "PlayAni"
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
																					class = "Noop",
																					id = "24",
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

return PBT_Wild_10321_FollowOneByOne
