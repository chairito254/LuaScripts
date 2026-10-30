-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_10581_CastSkill.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_10581_CastSkill = {
	behavior = {
		useForRoute = false,
		version = 14,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_10581_CastSkill",
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				const = 0,
				type = "int",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "30",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					effector = true,
					precondition = false,
					transition = false,
					id = "5",
					class = "Effector",
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
						id = "26",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "25",
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
									id = "27",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "28",
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
												id = "24",
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
												id = "29",
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
						id = "14",
						class = "IfElse",
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
												func = "checkCharacterState",
												params = {
													{
														const = "LOCOMOTION"
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
									id = "17",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "5",
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
																	const = 3
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
												id = "7",
												class = "Action",
												properties = {
													{
														Method = {
															func = "castSkill",
															params = {
																{
																	const = 0
																},
																{
																	const = 15810910
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
														ResultResumeOption = "BT_NextNode"
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
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "19",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "23",
															class = "Action",
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
																	effector = true,
																	precondition = false,
																	transition = false,
																	id = "100",
																	class = "Effector",
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
															id = "20",
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
												id = "22",
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_10581_CastSkill
