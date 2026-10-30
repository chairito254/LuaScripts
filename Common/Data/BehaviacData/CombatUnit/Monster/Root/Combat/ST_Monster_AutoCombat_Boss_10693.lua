-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_10693.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10693 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_10693",
		useForRoute = false,
		version = 160,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				type = "int",
				name = "tSkill_ComboAttack",
				value = "0",
				const = 0
			},
			{
				type = "float",
				name = "skillStopDist",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "tPlayer",
				value = "0",
				const = 0
			},
			{
				type = "int",
				name = "FirstAbsorb",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "198",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "546",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "FirstAbsorb"
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
						id = "533",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "534",
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
									id = "536",
									class = "Action",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "NormalSkillCD"
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
									id = "544",
									class = "Action",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "AbsorbWaterCD"
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
									id = "590",
									class = "Action",
									properties = {
										{
											Method = {
												func = "startTimer",
												params = {
													{
														const = "NormalAttackCD"
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
									id = "535",
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
												id = "625",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "627",
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
															id = "626",
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
																				const = true
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
															id = "485",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "486",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "592",
																					class = "And",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "538",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkTargetHasBuffById",
																											params = {
																												{},
																												{
																													const = 2169310
																												},
																												{
																													const = 1
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
																								id = "593",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkTargetHasBuffById",
																											params = {
																												{},
																												{
																													const = 2169312
																												},
																												{
																													const = 1
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "500",
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
																										const = 16931200
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
																					id = "562",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "turnToPos",
																								params = {
																									{
																										const = {
																											-918.85,
																											445.57,
																											-505.04
																										}
																									},
																									{
																										const = 0
																									},
																									{
																										const = false
																									},
																									{
																										const = 0
																									},
																									{
																										const = true
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
																					id = "559",
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
																										const = 16931300
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
																					id = "595",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "startTimer",
																								params = {
																									{
																										const = "CoreSkillCD"
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
																					id = "610",
																					class = "Action",
																					properties = {
																						{
																							Method = {
																								func = "startTimer",
																								params = {
																									{
																										const = "AbsorbWaterCD"
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
																		id = "539",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "540",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "557",
																								class = "And",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "547",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														field = "FirstAbsorb"
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
																											id = "542",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "AbsorbWaterCD"
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								id = "558",
																								class = "And",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "548",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														field = "FirstAbsorb"
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
																											id = "549",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "AbsorbWaterCD"
																															}
																														}
																													}
																												},
																												{
																													Opr = {
																														const = 40
																													}
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
																					id = "556",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "686",
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
																													const = 16931110
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
																								id = "628",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "moveToPos",
																											params = {
																												{
																													const = {
																														-918.23,
																														445.57,
																														-510.53
																													}
																												},
																												{
																													const = 5
																												},
																												{
																													const = true
																												},
																												{
																													const = 0
																												},
																												{
																													const = BaseEnum.SpeedRateType.Fast
																												},
																												{
																													const = 10
																												},
																												{
																													const = BaseEnum.PathFindType.Auto
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
																										ResultResumeOption = "BT_ResumeSelf"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "553",
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
																													const = 16931100
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
																								id = "555",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "FirstAbsorb"
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
																								id = "554",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "AbsorbWaterCD"
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
																								id = "564",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "567",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkTargetHasBuffById",
																														params = {
																															{},
																															{
																																const = 2169311
																															},
																															{
																																const = 1
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
																											id = "568",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 16931400
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
																													ResultResumeOption = "BT_ResumeTree"
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "569",
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
																},
																{
																	node = {
																		id = "497",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "521",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								func = "getTimerValue",
																								params = {
																									{
																										const = "NormalSkillCD"
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								const = 4
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "585",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "583",
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
																								id = "584",
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
																													const = true
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "479",
																					class = "IfElse",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "471",
																								class = "Condition",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											field = "distToTgt"
																										}
																									},
																									{
																										Opr = {
																											const = 15
																										}
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "570",
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
																											id = "571",
																											class = "DecoratorWeight",
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
																														id = "667",
																														class = "Selector",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "669",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "670",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkTargetLocation",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = -30
																																								},
																																								{
																																									const = 30
																																								},
																																								{
																																									const = 0
																																								},
																																								{
																																									const = 99
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
																																				id = "668",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "turnToTarget",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = true
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
																																				id = "666",
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
																																									const = 16931610
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
																																				id = "665",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "startTimer",
																																							params = {
																																								{
																																									const = "NormalSkillCD"
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
																																	id = "573",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "575",
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
																																									const = 16931610
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
																																				id = "596",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "startTimer",
																																							params = {
																																								{
																																									const = "NormalSkillCD"
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "572",
																											class = "DecoratorWeight",
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
																														id = "673",
																														class = "Selector",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "675",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "676",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "checkTargetLocation",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = -30
																																								},
																																								{
																																									const = 30
																																								},
																																								{
																																									const = 0
																																								},
																																								{
																																									const = 99
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
																																				id = "674",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "turnToTarget",
																																							params = {
																																								{
																																									field = "tgt"
																																								},
																																								{
																																									const = true
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
																																				id = "672",
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
																																									const = 16931500
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
																																				id = "671",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "startTimer",
																																							params = {
																																								{
																																									const = "NormalSkillCD"
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
																																	id = "574",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "580",
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
																																									const = 16931500
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
																																				id = "597",
																																				class = "Action",
																																				properties = {
																																					{
																																						Method = {
																																							func = "startTimer",
																																							params = {
																																								{
																																									const = "NormalSkillCD"
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
																												}
																											}
																										}
																									}
																								}
																							}
																						},
																						{
																							node = {
																								id = "488",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "489",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "distToTgt"
																													}
																												},
																												{
																													Opr = {
																														const = 6
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "586",
																											class = "IfElse",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "581",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkTargetLocation",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 135
																																		},
																																		{
																																			const = 225
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 99
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
																														id = "598",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "587",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 16931700
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
																																	id = "599",
																																	class = "Action",
																																	properties = {
																																		{
																																			Method = {
																																				func = "startTimer",
																																				params = {
																																					{
																																						const = "NormalSkillCD"
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
																														id = "494",
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
																																	id = "495",
																																	class = "DecoratorWeight",
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
																																				id = "629",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "632",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "636",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													func = "checkTargetLocation",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = -30
																																														},
																																														{
																																															const = 30
																																														},
																																														{
																																															const = 0
																																														},
																																														{
																																															const = 99
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
																																										id = "637",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "turnToTarget",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = true
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
																																										id = "631",
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
																																															const = 16931600
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
																																										id = "630",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "NormalSkillCD"
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
																																							id = "601",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "496",
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
																																															const = 16931600
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
																																										id = "600",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "NormalSkillCD"
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "513",
																																	class = "DecoratorWeight",
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
																																				id = "642",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "643",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "638",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													func = "checkTargetLocation",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = -30
																																														},
																																														{
																																															const = 30
																																														},
																																														{
																																															const = 0
																																														},
																																														{
																																															const = 99
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
																																										id = "641",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "turnToTarget",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = true
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
																																										id = "640",
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
																																															const = 16931800
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
																																										id = "639",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "NormalSkillCD"
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
																																							id = "605",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "514",
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
																																															const = 16931800
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
																																										id = "604",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "NormalSkillCD"
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
																											id = "619",
																											class = "IfElse",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "613",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkTargetLocation",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 135
																																		},
																																		{
																																			const = 225
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 99
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
																														id = "661",
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
																																	id = "658",
																																	class = "DecoratorWeight",
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
																																				id = "657",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "660",
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
																																												const = 90
																																											},
																																											{
																																												const = 3
																																											},
																																											{
																																												const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
																																											},
																																											{
																																												const = false
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
																																									ResultResumeOption = "BT_ResumeSelf"
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "664",
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
																																												const = -15
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
																																					},
																																					{
																																						node = {
																																							id = "659",
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
																																												const = 16931000
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
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "662",
																																	class = "DecoratorWeight",
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
																																				id = "616",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "615",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castSkill",
																																										params = {
																																											{
																																												const = 0
																																											},
																																											{
																																												const = 16931700
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
																																							id = "617",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "startTimer",
																																										params = {
																																											{
																																												const = "NormalSkillCD"
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														id = "651",
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
																																	id = "655",
																																	class = "DecoratorWeight",
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
																																				id = "654",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "653",
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
																																												const = 3
																																											},
																																											{
																																												const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
																																											},
																																											{
																																												const = false
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
																																									ResultResumeOption = "BT_ResumeSelf"
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "656",
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
																																												const = 16931000
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
																																					}
																																				}
																																			}
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "652",
																																	class = "DecoratorWeight",
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
																																				id = "499",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "498",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "castSkill",
																																										params = {
																																											{
																																												const = 0
																																											},
																																											{
																																												const = 16931900
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
																																							id = "606",
																																							class = "Action",
																																							properties = {
																																								{
																																									Method = {
																																										func = "startTimer",
																																										params = {
																																											{
																																												const = "NormalSkillCD"
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
																},
																{
																	node = {
																		id = "487",
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
																					id = "503",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 5
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "516",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "507",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "playAction",
																														params = {
																															{
																																const = "Behav_Angry"
																															},
																															{
																																const = 6.17
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
																									},
																									{
																										node = {
																											id = "677",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "turnToTarget",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = true
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "505",
																					class = "DecoratorWeight",
																					properties = {
																						{
																							DecorateWhenChildEnds = "false"
																						},
																						{
																							Weight = {
																								const = 5
																							}
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "509",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "510",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "LessEqual"
																												},
																												{
																													Opl = {
																														field = "distToTgt"
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
																											id = "527",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "528",
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
																																			const = -15
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
																											id = "511",
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
																																const = 7
																															},
																															{
																																const = 3
																															},
																															{
																																const = true
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
																																const = BaseEnum.MoveUpdateLevel.Normal
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "594",
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
																								id = "678",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "683",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "685",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "Equal"
																															},
																															{
																																Opl = {
																																	func = "checkTargetLocation",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = -30
																																		},
																																		{
																																			const = 30
																																		},
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 99
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
																														id = "680",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	func = "getTimerValue",
																																	params = {
																																		{
																																			const = "NormalAttackCD"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 2
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "692",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "693",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "LessEqual"
																																		},
																																		{
																																			Opl = {
																																				field = "distToTgt"
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
																																	id = "695",
																																	class = "True",
																																	properties = {},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "694",
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
																																						const = 3
																																					},
																																					{
																																						const = 3
																																					},
																																					{
																																						const = true
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
																																						const = BaseEnum.MoveUpdateLevel.Normal
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
																														id = "684",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "turnToTarget",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = true
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
																														id = "682",
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
																																			const = 16931000
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
																														id = "679",
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
																																			const = 16931001
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
																														id = "681",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "startTimer",
																																	params = {
																																		{
																																			const = "NormalAttackCD"
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
																											id = "531",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "589",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "GreaterEqual"
																															},
																															{
																																Opl = {
																																	func = "getTimerValue",
																																	params = {
																																		{
																																			const = "NormalAttackCD"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 2
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "698",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "696",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "LessEqual"
																																		},
																																		{
																																			Opl = {
																																				field = "distToTgt"
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
																																	id = "697",
																																	class = "True",
																																	properties = {},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "699",
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
																																						const = 3
																																					},
																																					{
																																						const = 3
																																					},
																																					{
																																						const = true
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
																																						const = BaseEnum.MoveUpdateLevel.Normal
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
																														id = "530",
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
																																			const = 16931000
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
																														id = "532",
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
																																			const = 16931001
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
																														id = "591",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "startTimer",
																																	params = {
																																		{
																																			const = "NormalAttackCD"
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

return ST_Monster_AutoCombat_Boss_10693
