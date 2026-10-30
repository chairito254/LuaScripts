-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Perception_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Perception_Leave = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Perception_Leave",
		version = 60,
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				type = "int",
				const = 0,
				value = "0"
			},
			{
				name = "tLeaveTimeOut",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tSpeedRateType",
				type = "SpeedRateType",
				value = "Mid",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				name = "tSpeed",
				type = "float",
				const = 3.5,
				value = "3.5"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "83",
			properties = {},
			attachments = {
				{
					class = "Effector",
					effector = true,
					precondition = false,
					transition = false,
					id = "5",
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
						class = "Action",
						id = "85",
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
						class = "IfElse",
						id = "88",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Selector",
									id = "90",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "87",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkCharacterState",
															params = {
																{
																	const = "AIRING"
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
												class = "Condition",
												id = "91",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkCharacterState",
															params = {
																{
																	const = "CLIMBING"
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
										}
									}
								}
							},
							{
								node = {
									class = "Action",
									id = "89",
									properties = {
										{
											Method = {
												func = "switchToState",
												params = {
													{
														const = "LOCOMOTION"
													},
													{
														const = 5
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
									class = "Noop",
									id = "86",
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
						class = "Sequence",
						id = "70",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "71",
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
									class = "IfElse",
									id = "72",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "73",
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
												class = "Assignment",
												id = "46",
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
												class = "True",
												id = "74",
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
						class = "IfElse",
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
									class = "Sequence",
									id = "28",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "36",
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
												class = "Action",
												id = "27",
												properties = {
													{
														Method = {
															func = "switchToFly",
															params = {
																{
																	const = 1
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
														ResultResumeOption = "BT_ResumeTree"
													}
												},
												attachments = {
													{
														class = "Effector",
														effector = true,
														precondition = false,
														transition = false,
														id = "77",
														properties = {
															{
																Operator = "Invalid"
															},
															{
																Opl = {
																	func = "setAttenuationMultiple",
																	params = {
																		{
																			field = "selfId"
																		},
																		{
																			const = 1
																		}
																	}
																}
															},
															{
																Phase = "Failure"
															}
														}
													}
												},
												children = {}
											}
										},
										{
											node = {
												class = "Selector",
												id = "37",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Action",
															id = "99",
															properties = {
																{
																	Method = {
																		func = "leaveTargetInCatchFailure",
																		params = {
																			{
																				field = "tSensorTgtId"
																			},
																			{
																				const = 25
																			},
																			{
																				const = 3.5
																			},
																			{
																				const = BaseEnum.SpeedRateType.Mid
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
																	class = "Effector",
																	effector = true,
																	precondition = false,
																	transition = false,
																	id = "100",
																	properties = {
																		{
																			Operator = "Invalid"
																		},
																		{
																			Opl = {
																				func = "setAttenuationMultiple",
																				params = {
																					{
																						field = "selfId"
																					},
																					{
																						const = 1
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
															children = {}
														}
													},
													{
														node = {
															class = "True",
															id = "38",
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
												class = "Action",
												id = "31",
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
									class = "Sequence",
									id = "6",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Selector",
												id = "39",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Action",
															id = "101",
															properties = {
																{
																	Method = {
																		func = "leaveTargetInCatchFailure",
																		params = {
																			{
																				field = "tSensorTgtId"
																			},
																			{
																				const = 35
																			},
																			{
																				field = "tSpeed"
																			},
																			{
																				field = "tSpeedRateType"
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
																	class = "Effector",
																	effector = true,
																	precondition = false,
																	transition = false,
																	id = "100",
																	properties = {
																		{
																			Operator = "Invalid"
																		},
																		{
																			Opl = {
																				func = "setAttenuationMultiple",
																				params = {
																					{
																						field = "selfId"
																					},
																					{
																						const = 1
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
															children = {}
														}
													},
													{
														node = {
															class = "Action",
															id = "43",
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
												class = "Action",
												id = "69",
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_Perception_Leave
