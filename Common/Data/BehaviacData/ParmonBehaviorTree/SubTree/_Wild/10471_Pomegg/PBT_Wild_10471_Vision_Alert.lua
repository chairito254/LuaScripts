-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10471_Pomegg\\PBT_Wild_10471_Vision_Alert.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10471_Vision_Alert = {
	behavior = {
		version = 29,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Wild/10471_Pomegg/PBT_Wild_10471_Vision_Alert",
		properties = {},
		pars = {
			{
				value = "0",
				type = "int",
				name = "tSensorTgtId",
				const = 0
			},
			{
				value = "0",
				type = "float",
				name = "tRandomWaitTime",
				const = 0
			},
			{
				value = "0",
				type = "float",
				name = "tRandomWaitTime2",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {
				{
					transition = false,
					id = "41",
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
										const = "TE_Par_Alert"
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
						id = "29",
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
						id = "44",
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
											const = "TE_Par_Alert"
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
						id = "3",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "8",
									class = "Action",
									properties = {
										{
											Method = {
												func = "showQuestionMark",
												params = {
													{
														const = "Normal"
													},
													{
														const = 1.8
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
									id = "36",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "38",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "34",
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
													},
													{
														node = {
															id = "39",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "switchToState",
																		params = {
																			{
																				const = "AIRING"
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
													}
												}
											}
										},
										{
											node = {
												id = "37",
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
									id = "22",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "32",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "30",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "27",
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
																		id = "49",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "playSleAnimationFixTime",
																					params = {
																						{
																							const = "Behav_AlertStart"
																						},
																						{
																							const = "Behav_SleepLoop"
																						},
																						{
																							const = "Behav_SleepEnd"
																						},
																						{
																							const = 9999
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
															id = "33",
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
												id = "21",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tRandomWaitTime2"
														}
													},
													{
														Opr = {
															func = "getRandomFloat",
															params = {
																{
																	const = 1
																},
																{
																	const = 1.5
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
												id = "19",
												class = "Action",
												properties = {
													{
														Method = {
															func = "waitTime",
															params = {
																{
																	field = "tRandomWaitTime2"
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

return PBT_Wild_10471_Vision_Alert
