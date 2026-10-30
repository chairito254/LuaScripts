-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_10594_Sugarfish.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10594_Sugarfish = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_10594_Sugarfish",
		version = 87,
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "tSkill_ComboAttack",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "skillStopDist",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "tPlayer",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "randomtime",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "MasterID",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "FirstLove",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "483",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "484",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "FirstLove"
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
						id = "482",
						class = "DecoratorLoop",
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
									id = "494",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "487",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "478",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "MasterID"
																	}
																},
																{
																	Opr = {
																		func = "getMasterId"
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "479",
															class = "Condition",
															properties = {
																{
																	Operator = "GreaterEqual"
																},
																{
																	Opl = {
																		func = "getTargetBuffLayerCount",
																		params = {
																			{
																				field = "MasterID"
																			},
																			{
																				const = 2159407
																			}
																		}
																	}
																},
																{
																	Opr = {
																		const = 5
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "498",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "499",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					func = "getTimerValue",
																					params = {
																						{
																							const = "LoveCD"
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
																		id = "500",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getTimerValue",
																					params = {
																						{
																							const = "LoveCD"
																						}
																					}
																				}
																			},
																			{
																				Opr = {
																					const = 15
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
															id = "490",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "turnToTarget",
																		params = {
																			{
																				field = "MasterID"
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
															id = "488",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playAction",
																		params = {
																			{
																				const = "Behav_Love"
																			},
																			{
																				const = 3
																			},
																			{
																				const = ""
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
													},
													{
														node = {
															id = "502",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "FirstLove"
																	}
																},
																{
																	Opr = {
																		const = 1
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "501",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "startTimer",
																		params = {
																			{
																				const = "LoveCD"
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
												id = "198",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "468",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tgt"
																	}
																},
																{
																	Opr = {
																		func = "getTarget"
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "469",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "castSkill",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				const = 15941600
																			},
																			{
																				const = false
																			},
																			{
																				const = 0
																			},
																			{
																				const = false
																			},
																			{
																				const = BaseEnum.CastAbilitySourceType.Normal
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
															id = "495",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "481",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					field = "FirstLove"
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
																		id = "496",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "489",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "turnToTarget",
																								params = {
																									{
																										field = "MasterID"
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
																					id = "486",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "playAction",
																								params = {
																									{
																										const = "Behav_Love"
																									},
																									{
																										const = 3
																									},
																									{
																										const = ""
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
																			},
																			{
																				node = {
																					id = "485",
																					class = "Assignment",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "FirstLove"
																							}
																						},
																						{
																							Opr = {
																								const = 1
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "503",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "startTimer",
																								params = {
																									{
																										const = "LoveCD"
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
																		id = "497",
																		class = "True",
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
															id = "470",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "moveToTarget",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				const = 0
																			},
																			{
																				const = 1
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
																				const = BaseEnum.SpeedRateType.Mid
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
															id = "472",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "randomtime"
																	}
																},
																{
																	Opr = {
																		func = "getRandomFloat",
																		params = {
																			{
																				const = 1.5
																			},
																			{
																				const = 2.5
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
															id = "475",
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
																		id = "476",
																		class = "DecoratorWeight",
																		properties = {
																			{
																				DecorateWhenChildEnds = "false"
																			},
																			{
																				Weight = {
																					const = 3
																				}
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "462",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
																									{
																										field = "randomtime"
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
																		id = "477",
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
																					id = "473",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "playAction",
																								params = {
																									{
																										const = "Behav_Angry"
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
																										const = false
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
							}
						}
					}
				}
			}
		}
	}
}

return ST_Monster_AutoCombat_Boss_10594_Sugarfish
