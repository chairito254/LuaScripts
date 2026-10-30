-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Test_Thunten_Threeday.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Test_Thunten_Threeday = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Test_Thunten_Threeday",
		useForRoute = false,
		agenttype = "PuppetAgent",
		version = 70,
		properties = {},
		pars = {
			{
				type = "int",
				name = "bubbleCount",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "DecoratorLoop",
			id = "18",
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
						class = "Sequence",
						id = "19",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Assignment",
									id = "103",
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
												func = "getAuthorityPlayer"
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									class = "Condition",
									id = "21",
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
									class = "Assignment",
									id = "28",
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
									class = "Assignment",
									id = "29",
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
									class = "Selector",
									id = "30",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "130",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "133",
															properties = {
																{
																	Operator = "LessEqual"
																},
																{
																	Opl = {
																		func = "getTimerValue",
																		params = {
																			{
																				const = "enterCombat2"
																			}
																		}
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
															class = "Action",
															id = "132",
															properties = {
																{
																	Method = {
																		func = "startTimer",
																		params = {
																			{
																				const = "enterCombat2"
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
															id = "131",
															properties = {
																{
																	Method = {
																		func = "waitTime",
																		params = {
																			{
																				const = 1.5
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
															class = "Assignment",
															id = "136",
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
																		func = "getAuthorityPlayer"
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															class = "SelectorProbability",
															id = "140",
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
																		id = "138",
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
																					class = "Action",
																					id = "141",
																					properties = {
																						{
																							Method = {
																								func = "sideWalk",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 1.5
																									},
																									{
																										const = 35
																									},
																									{
																										const = -1
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
																		class = "DecoratorWeight",
																		id = "135",
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
																					class = "Action",
																					id = "143",
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
																										const = -35
																									},
																									{
																										const = -2
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
																		class = "DecoratorWeight",
																		id = "134",
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
																					class = "Action",
																					id = "144",
																					properties = {
																						{
																							Method = {
																								func = "sideWalk",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 1.5
																									},
																									{
																										const = 60
																									},
																									{
																										const = -1
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
																		class = "DecoratorWeight",
																		id = "139",
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
																					class = "Action",
																					id = "142",
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
																										const = -2
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
																		class = "DecoratorWeight",
																		id = "137",
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
																					class = "Action",
																					id = "146",
																					properties = {
																						{
																							Method = {
																								func = "sideWalk",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 1.5
																									},
																									{
																										const = 45
																									},
																									{
																										const = -1
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
																		class = "DecoratorWeight",
																		id = "145",
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
																					class = "Action",
																					id = "147",
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
																										const = -45
																									},
																									{
																										const = -2
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
										},
										{
											node = {
												class = "Sequence",
												id = "31",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "33",
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
															class = "Action",
															id = "4",
															properties = {
																{
																	Method = {
																		func = "moveToTarget",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				const = 2.5
																			},
																			{
																				const = 2
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
																				const = 6
																			},
																			{
																				const = BaseEnum.MoveUpdateLevel.VeryFast
																			},
																			{
																				const = BaseEnum.PathFindType.Auto
																			},
																			{
																				const = BaseEnum.SpeedRateType.Fast
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
												class = "Sequence",
												id = "32",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "37",
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
															class = "Condition",
															id = "38",
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
																		const = 4.5
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															class = "Sequence",
															id = "150",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Selector",
																		id = "151",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "69",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 10320310
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
																					class = "Action",
																					id = "152",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
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
																		class = "Action",
																		id = "39",
																		properties = {
																			{
																				Method = {
																					func = "moveToTarget",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 2.5
																						},
																						{
																							const = 2
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
																							const = 6
																						},
																						{
																							const = BaseEnum.MoveUpdateLevel.VeryFast
																						},
																						{
																							const = BaseEnum.PathFindType.Auto
																						},
																						{
																							const = BaseEnum.SpeedRateType.Fast
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
																		class = "Selector",
																		id = "153",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "159",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 10320110
																									},
																									{
																										const = false
																									},
																									{
																										const = 0
																									},
																									{
																										const = true
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
																					class = "Action",
																					id = "154",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
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
																}
															}
														}
													}
												}
											}
										},
										{
											node = {
												class = "Sequence",
												id = "2",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "5",
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
																		const = 4.5
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															class = "SelectorProbability",
															id = "6",
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
																		id = "90",
																		properties = {
																			{
																				DecorateWhenChildEnds = "false"
																			},
																			{
																				Weight = {
																					const = 4
																				}
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "74",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 10320110
																									},
																									{
																										const = false
																									},
																									{
																										const = 0
																									},
																									{
																										const = true
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
																		class = "DecoratorWeight",
																		id = "76",
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
																					class = "Sequence",
																					id = "118",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Action",
																								id = "117",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 10320000
																												},
																												{
																													const = true
																												},
																												{
																													const = 0
																												},
																												{
																													const = true
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
																								class = "Action",
																								id = "119",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 10320001
																												},
																												{
																													const = true
																												},
																												{
																													const = 0
																												},
																												{
																													const = true
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
																								class = "Action",
																								id = "148",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 10320002
																												},
																												{
																													const = true
																												},
																												{
																													const = 0
																												},
																												{
																													const = true
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
																		class = "DecoratorWeight",
																		id = "91",
																		properties = {
																			{
																				DecorateWhenChildEnds = "false"
																			},
																			{
																				Weight = {
																					const = 4
																				}
																			}
																		},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "92",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 10320600
																									},
																									{
																										const = false
																									},
																									{
																										const = 0
																									},
																									{
																										const = true
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

return ST_Monster_AutoCombat_Test_Thunten_Threeday
