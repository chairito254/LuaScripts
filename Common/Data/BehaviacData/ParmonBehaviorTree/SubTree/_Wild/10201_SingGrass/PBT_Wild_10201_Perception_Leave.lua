-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10201_SingGrass\\PBT_Wild_10201_Perception_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10201_Perception_Leave = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Wild/10201_SingGrass/PBT_Wild_10201_Perception_Leave",
		version = 29,
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tTgtId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tCharacterState",
				const = "0",
				value = "0",
				type = "string"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "18",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "24",
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
						class = "Action",
						id = "19",
						properties = {
							{
								Method = {
									func = "turnToTarget",
									params = {
										{
											field = "tSensorTgtId"
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
						class = "Action",
						id = "21",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											const = 0.5
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
						class = "DecoratorAlwaysSuccess",
						id = "71",
						properties = {
							{
								DecorateWhenChildEnds = "true"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Sequence",
									id = "69",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "72",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkCharacterState",
															params = {
																{
																	const = "MIMICRY"
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
												class = "Action",
												id = "68",
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
												class = "Action",
												id = "73",
												properties = {
													{
														Method = {
															func = "sendMessageToTrigger",
															params = {
																{
																	field = "selfId"
																},
																{
																	const = 1016
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
										}
									}
								}
							}
						}
					}
				},
				{
					node = {
						class = "SelectorProbability",
						id = "47",
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
									id = "49",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 10
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "8",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Action",
															id = "15",
															properties = {
																{
																	Method = {
																		func = "showEmojiBubble",
																		params = {
																			{
																				const = "Happy"
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
															class = "Action",
															id = "14",
															properties = {
																{
																	Method = {
																		func = "playPhaseAction",
																		params = {
																			{
																				const = "Behav_HappyStart"
																			},
																			{
																				const = "Behav_HappyLoop"
																			},
																			{
																				const = "Behav_HappyEnd"
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
													},
													{
														node = {
															class = "ReferencedBehavior",
															id = "67",
															properties = {
																{
																	ReferenceBehavior = {
																		const = "PBT_Perception_Leave"
																	}
																},
																{
																	subTreeProperties = {}
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
									id = "50",
									properties = {
										{
											DecorateWhenChildEnds = "false"
										},
										{
											Weight = {
												const = 90
											}
										}
									},
									attachments = {},
									children = {
										{
											node = {
												class = "ReferencedBehavior",
												id = "66",
												properties = {
													{
														ReferenceBehavior = {
															const = "PBT_Perception_Leave"
														}
													},
													{
														subTreeProperties = {}
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

return PBT_Wild_10201_Perception_Leave
