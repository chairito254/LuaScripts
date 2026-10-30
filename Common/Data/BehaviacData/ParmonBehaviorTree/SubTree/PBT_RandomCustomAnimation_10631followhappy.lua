-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_RandomCustomAnimation_10631followhappy.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_RandomCustomAnimation_10631followhappy = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_RandomCustomAnimation_10631followhappy",
		useForRoute = false,
		version = 10,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "tFollowTgtId",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "15",
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
					effector = false,
					transition = false,
					id = "16",
					precondition = true,
					class = "Precondition",
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
										field = "tFollowTgtId"
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
							Phase = "Both"
						}
					}
				}
			},
			children = {
				{
					node = {
						id = "2",
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
									id = "4",
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
												id = "27",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "26",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Happy"
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
															id = "3",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playAction",
																		params = {
																			{
																				const = "Behav_EatLoop"
																			},
																			{
																				const = 6
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
							},
							{
								node = {
									id = "6",
									class = "DecoratorWeight",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 40
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												id = "29",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "28",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Happy2"
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
															id = "5",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playAction",
																		params = {
																			{
																				const = "Behav_EatLoop"
																			},
																			{
																				const = 6
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
							},
							{
								node = {
									id = "19",
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
												id = "30",
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
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Surprise2"
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
															id = "18",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playAction",
																		params = {
																			{
																				const = "Behav_EatLoop"
																			},
																			{
																				const = 6
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
							},
							{
								node = {
									id = "22",
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
												id = "35",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "34",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Eat"
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
															id = "23",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playAction",
																		params = {
																			{
																				const = "Behav_EatLoop"
																			},
																			{
																				const = 6
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
							},
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
												const = 40
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												id = "40",
												class = "Sequence",
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
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Cheer"
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
															id = "25",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "playAction",
																		params = {
																			{
																				const = "Behav_EatLoop"
																			},
																			{
																				const = 6
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

return PBT_RandomCustomAnimation_10631followhappy
