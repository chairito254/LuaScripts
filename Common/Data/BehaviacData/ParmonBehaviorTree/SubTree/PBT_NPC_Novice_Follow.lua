-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_NPC_Novice_Follow.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_NPC_Novice_Follow = {
	behavior = {
		agenttype = "PuppetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_NPC_Novice_Follow",
		version = 6,
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				value = "0",
				name = "tFollowEntActorID"
			}
		},
		attachments = {},
		node = {
			id = "3",
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
						id = "4",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "23",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "17",
												class = "Condition",
												properties = {
													{
														Operator = "GreaterEqual"
													},
													{
														Opl = {
															func = "getDistByTgt",
															params = {
																{
																	field = "tFollowEntActorID"
																},
																{
																	const = false
																},
																{
																	const = false
																},
																{
																	const = 0
																}
															}
														}
													},
													{
														Opr = {
															const = 10
														}
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
															func = "teleportToTargetSide",
															params = {
																{
																	field = "tFollowEntActorID"
																},
																{
																	const = 1
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
										},
										{
											node = {
												id = "24",
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
									id = "13",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveToAppointedArea",
												params = {
													{
														field = "tFollowEntActorID"
													},
													{
														const = "NPCFollowNormalArea"
													},
													{
														const = "NPCNoviceStartArea"
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
											precondition = true,
											transition = false,
											id = "25",
											class = "Precondition",
											effector = false,
											properties = {
												{
													BinaryOperator = "And"
												},
												{
													Operator = "Less"
												},
												{
													Opl = {
														func = "getDistByTgt",
														params = {
															{
																field = "tFollowEntActorID"
															},
															{
																const = false
															},
															{
																const = false
															},
															{
																const = 0
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
													Phase = "Update"
												}
											}
										}
									},
									children = {}
								}
							},
							{
								node = {
									id = "29",
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
									attachments = {
										{
											precondition = true,
											transition = false,
											id = "30",
											class = "Precondition",
											effector = false,
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
																field = "tFollowEntActorID"
															},
															{
																const = false
															},
															{
																const = false
															},
															{
																const = 0
															}
														}
													}
												},
												{
													Opr2 = {
														const = 3
													}
												},
												{
													Phase = "Enter"
												}
											}
										}
									},
									children = {
										{
											node = {
												id = "28",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "31",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "turnToTarget",
																		params = {
																			{
																				field = "tFollowEntActorID"
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
															id = "26",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playNPCWaitAnimation"
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
															id = "27",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "waitTime",
																		params = {
																			{
																				const = 10
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

return PBT_NPC_Novice_Follow
