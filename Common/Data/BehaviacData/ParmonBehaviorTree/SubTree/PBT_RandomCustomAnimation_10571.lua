-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_RandomCustomAnimation_10571.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_RandomCustomAnimation_10571 = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_RandomCustomAnimation_10571",
		agenttype = "PuppetAgent",
		version = 8,
		useForRoute = false,
		properties = {},
		pars = {},
		attachments = {},
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
																	const = "Naughty"
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
																	const = "Behav_Happy"
																},
																{
																	const = 5
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
									const = 50
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
																	const = "Laugh"
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
																	const = "Behav_Happy"
																},
																{
																	const = 5
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
									id = "31",
									class = "Sequence",
									properties = {},
									attachments = {},
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
																	const = "Proud"
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
																	const = "Behav_Happy"
																},
																{
																	const = 5
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
						id = "21",
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
									id = "33",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "32",
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
												id = "20",
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
																	const = 5
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
									id = "34",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "35",
												class = "Action",
												properties = {
													{
														Method = {
															func = "showEmojiBubble",
															params = {
																{
																	const = "Cool"
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
																	const = "Behav_Love"
																},
																{
																	const = 5
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
									const = 50
								}
							}
						},
						attachments = {},
						children = {
							{
								node = {
									id = "36",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "37",
												class = "Action",
												properties = {
													{
														Method = {
															func = "showEmojiBubble",
															params = {
																{
																	const = "Smirk"
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
																	const = "Behav_Happy"
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

return PBT_RandomCustomAnimation_10571
