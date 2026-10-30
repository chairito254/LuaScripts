-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_RandomCustomAnimation_10651.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_RandomCustomAnimation_10651 = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_RandomCustomAnimation_10651",
		version = 7,
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "SelectorProbability",
			id = "2",
			properties = {
				{
					UntilSuccessOrEnd = false
				}
			},
			attachments = {},
			children = {
				{
					node = {
						class = "DecoratorWeight",
						id = "4",
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
									class = "Sequence",
									id = "27",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "26",
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
												class = "Action",
												id = "3",
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
						class = "DecoratorWeight",
						id = "6",
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
									class = "Sequence",
									id = "29",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "28",
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
												class = "Action",
												id = "5",
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
						class = "DecoratorWeight",
						id = "19",
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
									class = "Sequence",
									id = "31",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "30",
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
												class = "Action",
												id = "18",
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
						class = "DecoratorWeight",
						id = "21",
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
									class = "Sequence",
									id = "33",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "32",
												properties = {
													{
														Method = {
															func = "showEmojiBubble",
															params = {
																{
																	const = "Celebrate"
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
												class = "Action",
												id = "20",
												properties = {
													{
														Method = {
															func = "playAction",
															params = {
																{
																	const = "IdleSpecial"
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
				},
				{
					node = {
						class = "DecoratorWeight",
						id = "22",
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
									class = "Sequence",
									id = "34",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "35",
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
												class = "Action",
												id = "23",
												properties = {
													{
														Method = {
															func = "playAction",
															params = {
																{
																	const = "IdleSpecial"
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
				},
				{
					node = {
						class = "DecoratorWeight",
						id = "24",
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
									class = "Sequence",
									id = "36",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Action",
												id = "37",
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
												class = "Action",
												id = "25",
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

return PBT_RandomCustomAnimation_10651
