-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_RogueLike_Gauntlet_Huge2.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_RogueLike_Gauntlet_Huge2 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_RogueLike_Gauntlet_Huge2",
		useForRoute = false,
		version = 47,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "disToTgtForSkillMon",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "goBackDist",
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "IfElse",
			id = "239",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Condition",
						id = "238",
						properties = {
							{
								Operator = "Less"
							},
							{
								Opl = {
									func = "getTimerValue",
									params = {
										{
											const = "enterCombat"
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
						class = "Sequence",
						id = "237",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "229",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "enterCombat"
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
									class = "Assignment",
									id = "299",
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
									class = "Action",
									id = "326",
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
						class = "DecoratorLoop",
						id = "247",
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
									id = "230",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Assignment",
												id = "245",
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
												id = "244",
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
												id = "243",
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
												id = "242",
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
												class = "IfElse",
												id = "236",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "249",
															properties = {
																{
																	Operator = "LessEqual"
																},
																{
																	Opl = {
																		func = "getTimerValue",
																		params = {
																			{
																				const = "skill"
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
															class = "Sequence",
															id = "231",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "248",
																		properties = {
																			{
																				Method = {
																					func = "startTimer",
																					params = {
																						{
																							const = "skill"
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
																		id = "217",
																		properties = {
																			{
																				Method = {
																					func = "startTimer",
																					params = {
																						{
																							const = "fight"
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
													},
													{
														node = {
															class = "Action",
															id = "235",
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
												class = "IfElse",
												id = "241",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "289",
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
															class = "Sequence",
															id = "327",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "291",
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
																							const = 5
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
																		id = "328",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "329",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 70000102
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
																							ResultResumeOption = "BT_ResumeTree"
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					class = "Action",
																					id = "330",
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
													},
													{
														node = {
															class = "IfElse",
															id = "226",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "292",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getTimerValue",
																					params = {
																						{
																							const = "fight"
																						}
																					}
																				}
																			},
																			{
																				Opr = {
																					const = 3
																				}
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		class = "IfElse",
																		id = "225",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "290",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								func = "getTimerValue",
																								params = {
																									{
																										const = "skill"
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
																					class = "Sequence",
																					id = "219",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Selector",
																								id = "331",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "332",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 70000201
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
																													ResultResumeOption = "BT_ResumeTree"
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											class = "Action",
																											id = "287",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 70000102
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
																													ResultResumeOption = "BT_ResumeTree"
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
																								id = "223",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "skill"
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
																								id = "227",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "fight"
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
																			},
																			{
																				node = {
																					class = "Sequence",
																					id = "218",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Action",
																								id = "296",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 70000000
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								class = "Action",
																								id = "297",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 70000001
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								class = "Action",
																								id = "298",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 70000002
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								class = "Action",
																								id = "216",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "fight"
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
																		class = "Sequence",
																		id = "222",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "SelectorProbability",
																					id = "252",
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
																								id = "253",
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
																											id = "304",
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
																								id = "254",
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
																											id = "303",
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
																								id = "255",
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
																											id = "305",
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
																								id = "256",
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
																											id = "308",
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
																								id = "283",
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
																											id = "306",
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
																								id = "284",
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
																											id = "307",
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

return ST_Monster_AutoCombat_RogueLike_Gauntlet_Huge2
