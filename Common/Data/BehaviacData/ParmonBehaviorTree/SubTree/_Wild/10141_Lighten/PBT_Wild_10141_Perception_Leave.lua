-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10141_Lighten\\PBT_Wild_10141_Perception_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10141_Perception_Leave = {
	behavior = {
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "ParmonBehaviorTree/SubTree/_Wild/10141_Lighten/PBT_Wild_10141_Perception_Leave",
		version = 32,
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "tSensorTgtId",
				value = "0"
			},
			{
				type = "int",
				const = 0,
				name = "tTgtId",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "84",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "119",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "121",
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
									id = "122",
									class = "IfElse",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "124",
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
												id = "120",
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
												id = "123",
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
						id = "83",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "82",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkIsFlying",
												params = {
													{
														field = "selfId"
													}
												}
											}
										},
										{
											Opr = {
												const = false
											}
										}
									},
									attachments = {},
									children = {}
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
												class = "Action",
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
												id = "47",
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
															id = "49",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 70
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "73",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "115",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "playEffectOnTarget",
																								params = {
																									{
																										const = "Eff_Parmon_10141_EscapeLight"
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
																					id = "74",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "77",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "leaveTarget",
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
																												},
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {
																									{
																										transition = false,
																										effector = true,
																										precondition = false,
																										id = "75",
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
																								id = "75",
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
																					id = "76",
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
													},
													{
														node = {
															id = "50",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 30
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "68",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "118",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "addBuff",
																								params = {
																									{
																										const = 10072
																									},
																									{
																										const = 7
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
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "69",
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
								}
							},
							{
								node = {
									id = "89",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "100",
												class = "Action",
												properties = {
													{
														Method = {
															func = "switchToGround"
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
												id = "101",
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
															id = "112",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 70
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "109",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "114",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "playEffectOnTarget",
																								params = {
																									{
																										const = "Eff_Parmon_10141_EscapeLight"
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
																					id = "105",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "104",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "leaveTarget",
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
																												},
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {
																									{
																										transition = false,
																										effector = true,
																										precondition = false,
																										id = "75",
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
																								id = "106",
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
																					id = "103",
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
													},
													{
														node = {
															id = "107",
															class = "DecoratorWeight",
															properties = {
																{
																	DecorateWhenChildEnds = "false"
																},
																{
																	Weight = {
																		const = 30
																	}
																}
															},
															attachments = {},
															children = {
																{
																	node = {
																		id = "110",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "113",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "addBuff",
																								params = {
																									{
																										const = 10072
																									},
																									{
																										const = 7
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
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "108",
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
								}
							}
						}
					}
				}
			}
		}
	}
}

return PBT_Wild_10141_Perception_Leave
