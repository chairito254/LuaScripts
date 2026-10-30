-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Perception_Stare_Loop.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Perception_Stare_Loop = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Perception_Stare_Loop",
		version = 23,
		properties = {},
		pars = {
			{
				type = "int",
				name = "tSensorTgtId",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tMaxTime",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tRandomTime",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "tWeightPatrol",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "tWeightStare",
				const = 0,
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					id = "46",
					transition = false,
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
										const = "TE_Par_Stare"
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
						id = "27",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tSensorTgtId"
								}
							},
							{
								Opr = {
									func = "getPerceptibilityTarget"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "2",
						class = "Condition",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tSensorTgtId"
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
						id = "45",
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
											const = "TE_Par_Stare"
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
						id = "49",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tWeightStare"
								}
							},
							{
								Opr = {
									const = 30
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "47",
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
									id = "35",
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
												id = "37",
												class = "DecoratorWeight",
												properties = {
													{
														DecorateWhenChildEnds = "false"
													},
													{
														Weight = {
															field = "tWeightPatrol"
														}
													}
												},
												attachments = {},
												children = {
													{
														node = {
															id = "50",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "39",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "waitTime",
																					params = {
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
																		id = "51",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tWeightStare"
																				}
																			},
																			{
																				Opr = {
																					const = 30
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
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tWeightPatrol"
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
												id = "38",
												class = "DecoratorWeight",
												properties = {
													{
														DecorateWhenChildEnds = "false"
													},
													{
														Weight = {
															field = "tWeightStare"
														}
													}
												},
												attachments = {},
												children = {
													{
														node = {
															id = "53",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "54",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "moveToTarget",
																					params = {
																						{
																							field = "tSensorTgtId"
																						},
																						{
																							const = 5
																						},
																						{
																							const = 5
																						},
																						{
																							const = false
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
																							const = BaseEnum.MoveUpdateLevel.Once
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
																},
																{
																	node = {
																		id = "58",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "36",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "turnToTarget",
																								params = {
																									{
																										field = "tSensorTgtId"
																									},
																									{
																										const = true
																									},
																									{
																										const = 2
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
																					id = "59",
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
																		id = "40",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "42",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "43",
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
																													const = "Behav_AngryLoop"
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
																								id = "41",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playPhaseAction",
																											params = {
																												{
																													const = "Behav_AngryStart"
																												},
																												{
																													const = "Behav_AngryLoop"
																												},
																												{
																													const = "Behav_AngryEnd"
																												},
																												{
																													const = 0
																												},
																												{
																													const = ""
																												},
																												{
																													const = true
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
																					id = "44",
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
																										const = 4
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
																},
																{
																	node = {
																		id = "55",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tWeightStare"
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
																		id = "56",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "tWeightPatrol"
																				}
																			},
																			{
																				Opr = {
																					const = 30
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

return PBT_Perception_Stare_Loop
