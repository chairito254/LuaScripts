-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_RogueLike_Gauntlet_Tower.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_RogueLike_Gauntlet_Tower = {
	behavior = {
		version = 63,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_RogueLike_Gauntlet_Tower",
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				type = "float",
				name = "disToTgtForSkillMon",
				value = "0"
			},
			{
				const = 0,
				type = "float",
				name = "goBackDist",
				value = "0"
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
								Operator = "LessEqual"
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
															func = "getActorId",
															params = {
																{
																	const = 58735915
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
																							const = 0
																						},
																						{
																							const = 6
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
																		class = "Action",
																		id = "328",
																		properties = {
																			{
																				Method = {
																					func = "castSkill",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 70000100
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
																					const = 13
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
																					class = "SelectorProbability",
																					id = "361",
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
																								id = "362",
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
																																const = 70000100
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
																								class = "DecoratorWeight",
																								id = "363",
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
																											class = "Sequence",
																											id = "365",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "366",
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
																														id = "364",
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
																														id = "367",
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
																			},
																			{
																				node = {
																					class = "SelectorProbability",
																					id = "350",
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
																								id = "349",
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
																											id = "353",
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								class = "DecoratorWeight",
																								id = "351",
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
																											id = "352",
																											properties = {
																												{
																													Method = {
																														func = "waitTime",
																														params = {
																															{
																																const = 2
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
																		class = "SelectorProbability",
																		id = "329",
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
																					id = "331",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 3
																							}
																						}
																					},
																					attachments = {},
																					children = {
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
																											class = "SelectorProbability",
																											id = "340",
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
																														id = "341",
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
																																	id = "345",
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														class = "DecoratorWeight",
																														id = "342",
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
																																	id = "346",
																																	properties = {
																																		{
																																			Method = {
																																				func = "waitTime",
																																				params = {
																																					{
																																						const = 2
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
																					class = "DecoratorWeight",
																					id = "332",
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
																								class = "Sequence",
																								id = "338",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "337",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 70000100
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
																											class = "SelectorProbability",
																											id = "339",
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
																														id = "343",
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
																																	id = "347",
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														class = "DecoratorWeight",
																														id = "344",
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
																																	id = "348",
																																	properties = {
																																		{
																																			Method = {
																																				func = "waitTime",
																																				params = {
																																					{
																																						const = 2
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
					}
				}
			}
		}
	}
}

return ST_Monster_AutoCombat_RogueLike_Gauntlet_Tower
