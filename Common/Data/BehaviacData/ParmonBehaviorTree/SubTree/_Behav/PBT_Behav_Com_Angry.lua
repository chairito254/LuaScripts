-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_Angry.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_Angry = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_Angry",
		useForRoute = false,
		version = 17,
		properties = {},
		pars = {
			{
				value = "0",
				name = "tTargetActorId",
				type = "int",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "24",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "20",
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
				},
				{
					node = {
						id = "23",
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
						attachments = {
							{
								effector = false,
								precondition = true,
								id = "80",
								class = "Precondition",
								transition = false,
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
							}
						},
						children = {
							{
								node = {
									id = "25",
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
												id = "15",
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
									id = "27",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "22",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														effector = true,
														precondition = false,
														id = "103",
														class = "Effector",
														transition = false,
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
															id = "16",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Angry"
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
													},
													{
														node = {
															id = "14",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playSleAnimationOnce",
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
												id = "21",
												class = "Action",
												properties = {
													{
														Method = {
															func = "waitTime",
															params = {
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
												id = "29",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														effector = true,
														precondition = false,
														id = "103",
														class = "Effector",
														transition = false,
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
															id = "30",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Angry"
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
													},
													{
														node = {
															id = "31",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playSleAnimationOnce",
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
												id = "17",
												class = "Action",
												properties = {
													{
														Method = {
															func = "waitTime",
															params = {
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

return PBT_Behav_Com_Angry
