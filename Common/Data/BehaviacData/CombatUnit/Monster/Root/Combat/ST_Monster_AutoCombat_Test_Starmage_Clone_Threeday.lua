-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Test_Starmage_Clone_Threeday.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Test_Starmage_Clone_Threeday = {
	behavior = {
		agenttype = "PuppetAgent",
		version = 5,
		useForRoute = false,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Test_Starmage_Clone_Threeday",
		properties = {},
		pars = {
			{
				value = "1",
				type = "int",
				name = "bubbleCount",
				const = 1
			}
		},
		attachments = {},
		node = {
			id = "16",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "0",
						class = "Wait",
						properties = {
							{
								Time = {
									const = 1000
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
						class = "DecoratorLoop",
						properties = {
							{
								Count = {
									const = -1
								}
							},
							{
								DecorateWhenChildEnds = "true"
							},
							{
								DoneWithinFrame = "false"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									id = "19",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "20",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tgt"
														}
													},
													{
														Opr = {
															func = "getTarget"
														}
													}
												},
												attachments = {},
												children = {}
											}
										},
										{
											node = {
												id = "21",
												class = "Condition",
												properties = {
													{
														Operator = "NotEqual"
													},
													{
														Opl = {
															field = "tgt"
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
												id = "22",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "23",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "24",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					field = "bubbleCount"
																				}
																			},
																			{
																				Opr = {
																					const = 1
																				}
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
																					func = "castSkill",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 10310401
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
																		class = "Compute",
																		properties = {
																			{
																				Operator = "Sub"
																			},
																			{
																				Opl = {
																					field = "bubbleCount"
																				}
																			},
																			{
																				Opr1 = {
																					field = "bubbleCount"
																				}
																			},
																			{
																				Opr2 = {
																					const = 1
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
															id = "25",
															class = "Condition",
															properties = {
																{
																	Operator = "NotEqual"
																},
																{
																	Opl = {
																		field = "tgt"
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
													}
												}
											}
										},
										{
											node = {
												id = "28",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "distToTgt"
														}
													},
													{
														Opr = {
															func = "getDistByTgt",
															params = {
																{
																	field = "tgt"
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
													}
												},
												attachments = {},
												children = {}
											}
										},
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
															field = "distToTgtForSkill"
														}
													},
													{
														Opr = {
															func = "getDistByTgt",
															params = {
																{
																	field = "tgt"
																},
																{
																	const = false
																},
																{
																	const = true
																},
																{
																	const = 0
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
												id = "30",
												class = "Selector",
												properties = {},
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
																		id = "33",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					field = "distToTgtForSkill"
																				}
																			},
																			{
																				Opr = {
																					const = 17
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "34",
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
																					id = "35",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 2
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "54",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "moveToTarget",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 2
																												},
																												{
																													const = 3
																												},
																												{
																													const = false
																												},
																												{
																													const = false
																												},
																												{
																													const = true
																												},
																												{
																													const = 0
																												},
																												{
																													const = BaseEnum.MoveUpdateLevel.VeryFast
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "36",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 1
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "55",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "sideWalk",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 3
																												},
																												{
																													const = 35
																												},
																												{
																													const = 12
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
																					id = "47",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 1
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "56",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "sideWalk",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 3
																												},
																												{
																													const = -35
																												},
																												{
																													const = 12
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
																					id = "49",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 1
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "51",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "53",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 10129901
																															},
																															{
																																const = true
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
																													ResultResumeOption = "BT_ResumeSelf"
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "52",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 10124410
																															},
																															{
																																const = true
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
																},
																{
																	node = {
																		id = "50",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "moveToTarget",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 12
																						},
																						{
																							const = 3
																						},
																						{
																							const = false
																						},
																						{
																							const = false
																						},
																						{
																							const = true
																						},
																						{
																							const = 0
																						},
																						{
																							const = BaseEnum.MoveUpdateLevel.VeryFast
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
																}
															}
														}
													},
													{
														node = {
															id = "32",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "37",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					field = "distToTgtForSkill"
																				}
																			},
																			{
																				Opr = {
																					const = 17
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "38",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					field = "distToTgtForSkill"
																				}
																			},
																			{
																				Opr = {
																					const = 5
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "57",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "58",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "60",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 10129901
																												},
																												{
																													const = true
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
																										ResultResumeOption = "BT_ResumeSelf"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "61",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 10124410
																												},
																												{
																													const = true
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
																					id = "59",
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
																								id = "62",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "64",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 3
																															},
																															{
																																const = 35
																															},
																															{
																																const = 12
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
																								id = "63",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "65",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 3
																															},
																															{
																																const = -35
																															},
																															{
																																const = 12
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
															id = "2",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "5",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					field = "distToTgtForSkill"
																				}
																			},
																			{
																				Opr = {
																					const = 5
																				}
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
																					id = "6",
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
																								id = "7",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "66",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 10124410
																															},
																															{
																																const = true
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
																								id = "8",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "67",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 2
																															},
																															{
																																const = 60
																															},
																															{
																																const = 12
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
																								id = "43",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "69",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 2
																															},
																															{
																																const = -60
																															},
																															{
																																const = 12
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
																								id = "70",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "78",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "jumpBackByLinkAngle",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 0
																															},
																															{
																																const = 8
																															},
																															{
																																const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
																								id = "71",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "79",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 10129901
																															},
																															{
																																const = true
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
																					id = "75",
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
																								id = "76",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "72",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 2
																															},
																															{
																																const = 60
																															},
																															{
																																const = 12
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
																								id = "77",
																								class = "DecoratorWeight",
																								properties = {
																									{
																										DecorateWhenChildEnds = "false"
																									},
																									{
																										Weight = {
																											const = 1
																										}
																									}
																								},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "73",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "sideWalk",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 2
																															},
																															{
																																const = -60
																															},
																															{
																																const = 12
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
	}
}

return ST_Monster_AutoCombat_Test_Starmage_Clone_Threeday
