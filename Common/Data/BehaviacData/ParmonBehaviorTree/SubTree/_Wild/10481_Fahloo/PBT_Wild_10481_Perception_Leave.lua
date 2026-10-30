-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10481_Fahloo\\PBT_Wild_10481_Perception_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10481_Perception_Leave = {
	behavior = {
		version = 60,
		name = "ParmonBehaviorTree/SubTree/_Wild/10481_Fahloo/PBT_Wild_10481_Perception_Leave",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "tSensorTgtId",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "39",
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
										const = "TE_Par_Leave"
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
						id = "38",
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
											const = "TE_Par_Leave"
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
						id = "67",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "71",
									class = "Action",
									properties = {
										{
											Method = {
												func = "setAttenuationMultiple",
												params = {
													{
														field = "selfId"
													},
													{
														const = 0.1
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
									id = "68",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "69",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
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
												id = "66",
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
												id = "70",
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
				},
				{
					node = {
						id = "21",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "17",
									class = "Action",
									properties = {
										{
											Method = {
												func = "showQuestionMark",
												params = {
													{
														const = "DirectFull"
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
											ResultResumeOption = "BT_None"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "79",
									class = "Action",
									properties = {
										{
											Method = {
												func = "showEmojiBubble",
												params = {
													{
														const = "Surprise"
													},
													{
														const = 4
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
									id = "80",
									class = "Action",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														const = 0.7
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
									id = "40",
									class = "Action",
									properties = {
										{
											Method = {
												func = "switchToFly",
												params = {
													{
														const = 0
													},
													{
														const = 2
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
									id = "43",
									class = "Action",
									properties = {
										{
											Method = {
												func = "addBuff",
												params = {
													{
														const = 11146
													},
													{
														const = 15
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
									id = "46",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "65",
												class = "Action",
												properties = {
													{
														Method = {
															func = "flyToTarget",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = 0
																},
																{
																	const = 20
																},
																{
																	const = 10
																},
																{
																	const = true
																},
																{
																	const = 15
																},
																{
																	const = false
																},
																{
																	const = true
																},
																{
																	const = 2
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
												id = "84",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "85",
															class = "Condition",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "checkTargetHasBuffById",
																		params = {
																			{
																				field = "selfId"
																			},
																			{
																				const = 11146
																			},
																			{
																				const = 1
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
															id = "59",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "61",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "playEffectOnTarget",
																					params = {
																						{
																							const = "Eff_Parmon_LevelAppear_Normal"
																						},
																						{
																							field = "selfId"
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
																		id = "47",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "enterDestroySelf"
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
															id = "86",
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
							},
							{
								node = {
									id = "87",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "91",
												class = "Condition",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkTargetHasBuffById",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = 11146
																},
																{
																	const = 1
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
												id = "90",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "89",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playEffectOnTarget",
																		params = {
																			{
																				const = "Eff_Parmon_LevelAppear_Normal"
																			},
																			{
																				field = "selfId"
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
															id = "88",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "enterDestroySelf"
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
												id = "92",
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
		}
	}
}

return PBT_Wild_10481_Perception_Leave
