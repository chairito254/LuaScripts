-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_10163.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10163 = {
	behavior = {
		version = 104,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_10163",
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				name = "tSkill_ComboAttack",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11630400",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631200",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631300",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631301",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631302",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631303",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631400",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631500",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631501",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631600",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11631700",
				value = "0"
			},
			{
				const = 0,
				type = "float",
				name = "skillStopDist",
				value = "0"
			},
			{
				const = 0,
				type = "int",
				name = "tPlayer",
				value = "0"
			},
			{
				const = false,
				type = "bool",
				name = "tMechanismed",
				value = "false"
			},
			{
				const = 0,
				type = "int",
				name = "tSkill_11630430",
				value = "0"
			},
			{
				const = 0,
				type = "float",
				name = "tBoxDist",
				value = "0"
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
						id = "152",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "sideWalkWeight"
								}
							},
							{
								Opr = {
									const = 100
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "311",
						class = "Action",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "shieldSys"
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
						id = "466",
						class = "Action",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "fightInterval"
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
									id = "4",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "8",
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
												id = "5",
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
												id = "6",
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
												id = "7",
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
												id = "251",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tPlayer"
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
												id = "526",
												class = "Assignment",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "tBoxDist"
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
												id = "256",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "301",
															class = "And",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "506",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkTargetHasBuffById",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 91163042
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
																		id = "302",
																		class = "Condition",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkCanUseSkill",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = 11631200
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
															id = "260",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "296",
																		class = "Assignment",
																		properties = {
																			{
																				CastRight = "false"
																			},
																			{
																				Opl = {
																					field = "skillStopDist"
																				}
																			},
																			{
																				Opr = {
																					func = "getSkillStopBoxDist",
																					params = {
																						{
																							const = 11631200
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
																		id = "294",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "297",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								func = "getMaxSkillDist",
																								params = {
																									{
																										const = 11631200
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								field = "distToTgtForSkill"
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "295",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "298",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "skillStopDist"
																										}
																									},
																									{
																										Opr = {
																											func = "getSkillStopBoxDist",
																											params = {
																												{
																													const = 11631200
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
																								id = "299",
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
																													field = "skillStopDist"
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
																													const = BaseEnum.MoveUpdateLevel.Once
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
																					id = "293",
																					class = "Noop",
																					properties = {},
																					attachments = {},
																					children = {}
																				}
																			}
																		}
																	}
																},
																{
																	node = {
																		id = "261",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "castSkill",
																					params = {
																						{
																							field = "tPlayer"
																						},
																						{
																							const = 11631200
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
																		id = "479",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "playAction",
																					params = {
																						{
																							const = "Behav_AlertLoop"
																						},
																						{
																							const = -1
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
																				ResultResumeOption = "BT_ResumeTree"
																			}
																		},
																		attachments = {},
																		children = {}
																	}
																},
																{
																	node = {
																		id = "480",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "playAction",
																					params = {
																						{
																							const = "Behav_AlertEnd"
																						},
																						{
																							const = -1
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
															id = "303",
															class = "Selector",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "304",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "305",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								func = "getHpPercent",
																								params = {
																									{
																										field = "selfId"
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								const = 0.8
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "307",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkCanUseSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 11631400
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
																					id = "308",
																					class = "IfElse",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "309",
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
																											const = 8
																										}
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "313",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "315",
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
																																const = 11631400
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
																											id = "316",
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
																																const = 11631700
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								id = "310",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "320",
																											class = "Selector",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "321",
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
																																			const = "shieldSys"
																																		}
																																	}
																																}
																															},
																															{
																																Opr = {
																																	const = 50
																																}
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														id = "322",
																														class = "Condition",
																														properties = {
																															{
																																Operator = "LessEqual"
																															},
																															{
																																Opl = {
																																	func = "getTimerValue",
																																	params = {
																																		{
																																			const = "shieldSys"
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
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "312",
																											class = "Action",
																											properties = {
																												{
																													Method = {
																														func = "startTimer",
																														params = {
																															{
																																const = "shieldSys"
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
																											id = "318",
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
																																const = 11631400
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
																											id = "319",
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
																																const = 11631700
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
																		id = "438",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "439",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								func = "getHpPercent",
																								params = {
																									{
																										field = "selfId"
																									}
																								}
																							}
																						},
																						{
																							Opr = {
																								const = 0.5
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "441",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								field = "fightCd"
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
																					id = "443",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkCanUseSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 11631303
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
																					id = "442",
																					class = "Assignment",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "fightCd"
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
																					id = "450",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "446",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "skillStopDist"
																										}
																									},
																									{
																										Opr = {
																											func = "getSkillStopBoxDist",
																											params = {
																												{
																													const = 11631303
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
																								id = "451",
																								class = "IfElse",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "449",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "LessEqual"
																												},
																												{
																													Opl = {
																														func = "getMaxSkillDist",
																														params = {
																															{
																																const = 11631303
																															}
																														}
																													}
																												},
																												{
																													Opr = {
																														field = "distToTgtForSkill"
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "452",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "453",
																														class = "Assignment",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "skillStopDist"
																																}
																															},
																															{
																																Opr = {
																																	func = "getSkillStopBoxDist",
																																	params = {
																																		{
																																			const = 11631303
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
																														id = "447",
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
																																			field = "skillStopDist"
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
																																			const = BaseEnum.MoveUpdateLevel.Once
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
																											id = "448",
																											class = "Noop",
																											properties = {},
																											attachments = {},
																											children = {}
																										}
																									}
																								}
																							}
																						},
																						{
																							node = {
																								id = "445",
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
																													const = 11631303
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
																								id = "493",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playAction",
																											params = {
																												{
																													const = "Behav_AlertLoop"
																												},
																												{
																													const = -1
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								id = "494",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "playAction",
																											params = {
																												{
																													const = "Behav_AlertEnd"
																												},
																												{
																													const = -1
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
																},
																{
																	node = {
																		id = "9",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "10",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								field = "tBoxDist"
																							}
																						},
																						{
																							Opr = {
																								field = "maxKeepBoxDist"
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "11",
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
																										field = "bestKeepBoxDist"
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
																										const = BaseEnum.MoveUpdateLevel.Once
																									},
																									{
																										const = BaseEnum.PathFindType.Auto
																									},
																									{
																										const = BaseEnum.SpeedRateType.Mid
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
																					id = "458",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "454",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_ComboAttack"
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
																								id = "457",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11630430"
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
																								id = "455",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631301"
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
																								id = "459",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631302"
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
																								id = "463",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631303"
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
																								id = "461",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631500"
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
																								id = "456",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631501"
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
																								id = "462",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631600"
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
																								id = "460",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "tSkill_11631700"
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
																								id = "12",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "13",
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
																														id = "15",
																														class = "DecoratorWeight",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	field = "attackWeight"
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "470",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "472",
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
																																									Operator = "Greater"
																																								},
																																								{
																																									Opl = {
																																										func = "getHpPercent",
																																										params = {
																																											{
																																												field = "selfId"
																																											}
																																										}
																																									}
																																								},
																																								{
																																									Opr = {
																																										const = 0.5
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "467",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "468",
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
																																															const = "fightInterval"
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													const = 1.5
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "469",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getTimerValue",
																																													params = {
																																														{
																																															const = "fightInterval"
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
																																								}
																																							}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "478",
																																							class = "True",
																																							properties = {},
																																							attachments = {},
																																							children = {}
																																						}
																																					}
																																				}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "24",
																																				class = "Sequence",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "46",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "49",
																																										class = "Compute",
																																										properties = {
																																											{
																																												Operator = "Add"
																																											},
																																											{
																																												Opl = {
																																													field = "sideWalkWeight"
																																												}
																																											},
																																											{
																																												Opr1 = {
																																													field = "sideWalkWeight"
																																												}
																																											},
																																											{
																																												Opr2 = {
																																													const = 100
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "50",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "attackWeight"
																																												}
																																											},
																																											{
																																												Opr = {
																																													const = 100
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
																																							id = "323",
																																							class = "IfElse",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "324",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "LessEqual"
																																											},
																																											{
																																												Opl = {
																																													func = "getHpPercent",
																																													params = {
																																														{
																																															field = "selfId"
																																														}
																																													}
																																												}
																																											},
																																											{
																																												Opr = {
																																													const = 0.5
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {}
																																									}
																																								},
																																								{
																																									node = {
																																										id = "353",
																																										class = "IfElse",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "354",
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
																																													id = "382",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "386",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "384",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631303
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
																																																			id = "383",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631303"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "385",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "393",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "392",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631501
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
																																																			id = "395",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631501"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "394",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "388",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "387",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631301
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
																																																			id = "389",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631301"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "390",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "432",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "431",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631600
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
																																																			id = "433",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631600"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 80
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "430",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "391",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
																																																			const = 50
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
																																													id = "364",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "366",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "365",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11630430
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
																																																			id = "367",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11630430"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "368",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "379",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "378",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631501
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
																																																			id = "380",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631501"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 250
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "381",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "370",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "369",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631303
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
																																																			id = "371",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631303"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 100
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "372",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "375",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "374",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631600
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
																																																			id = "376",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631600"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "377",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "373",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
																																																			const = 100
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
																																										id = "187",
																																										class = "IfElse",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "186",
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
																																													id = "190",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "194",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "192",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631302
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
																																																			id = "191",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631302"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "202",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "204",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "203",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631301
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
																																																			id = "205",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631301"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "206",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "361",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "360",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631500
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
																																																			id = "362",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631500"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 100
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "363",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "436",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "435",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631600
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
																																																			id = "437",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631600"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 80
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "434",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "232",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
																																																			const = 50
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
																																													id = "200",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "240",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "239",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11630430
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
																																																			id = "241",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11630430"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "242",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "236",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "235",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631500
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
																																																			id = "237",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631500"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 250
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "238",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "274",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "273",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631302
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
																																																			id = "275",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631302"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 100
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "276",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "289",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "288",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "Equal"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "checkCanUseSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 11631600
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
																																																			id = "290",
																																																			class = "Assignment",
																																																			properties = {
																																																				{
																																																					CastRight = "false"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "tSkill_11631600"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						const = 200
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "291",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "243",
																																																class = "Compute",
																																																properties = {
																																																	{
																																																		Operator = "Add"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr1 = {
																																																			field = "tSkill_ComboAttack"
																																																		}
																																																	},
																																																	{
																																																		Opr2 = {
																																																			const = 100
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
																																								}
																																							}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "156",
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
																																										id = "157",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_ComboAttack"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "38",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "159",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "158",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						field = "maxAttackDist"
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "146",
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
																																																								field = "attackStopBoxDist"
																																																							},
																																																							{
																																																								const = 5
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
																																																								const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "160",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "41",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castNormalAtkCombo",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 3
																																																				},
																																																				{
																																																					const = true
																																																				},
																																																				{
																																																					const = 2
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
																																								},
																																								{
																																									node = {
																																										id = "165",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11630430"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "162",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "169",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11630430
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
																																																id = "153",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "149",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11630430
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "212",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "211",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11630430
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
																																																						id = "120",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "154",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "166",
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
																																																					const = 11630430
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
																																										id = "189",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631301"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "183",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "179",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631301
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
																																																id = "184",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "182",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631301
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "215",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "216",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631301
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
																																																						id = "180",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "181",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "178",
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
																																																					const = 11631301
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
																																																id = "491",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_AngryLoop"
																																																				},
																																																				{
																																																					const = -1
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
																																																		ResultResumeOption = "BT_ResumeTree"
																																																	}
																																																},
																																																attachments = {},
																																																children = {}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "492",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_AngryEnd"
																																																				},
																																																				{
																																																					const = -1
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
																																								},
																																								{
																																									node = {
																																										id = "407",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631302"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "405",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "401",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631302
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
																																																id = "406",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "404",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631302
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "408",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "409",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631302
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
																																																						id = "402",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "403",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "400",
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
																																																					const = 11631302
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
																																										id = "268",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631500"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "265",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "269",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631500
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
																																																id = "266",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "270",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631500
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "267",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "271",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631500
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
																																																						id = "263",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "264",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "272",
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
																																																					const = 11631500
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
																																										id = "283",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631501"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "280",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "284",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631501
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
																																																id = "281",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "285",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631501
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "282",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "286",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631501
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
																																																						id = "278",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "279",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "287",
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
																																																					const = 11631501
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
																																																id = "497",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_AlertLoop"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
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
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																id = "498",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_AlertEnd"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
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
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																								},
																																								{
																																									node = {
																																										id = "414",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631600"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "411",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "415",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631600
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
																																																id = "412",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "416",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631600
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "413",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "417",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631600
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
																																																						id = "418",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "410",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "419",
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
																																																					const = 11631600
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
																																										id = "424",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631700"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "421",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "425",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631700
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
																																																id = "422",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "426",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631700
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "423",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "427",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631700
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
																																																						id = "428",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "420",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "429",
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
																																																					const = 11631700
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
																																										id = "177",
																																										class = "DecoratorWeight",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													field = "tSkill_11631303"
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "175",
																																													class = "Sequence",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																id = "171",
																																																class = "Assignment",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "skillStopDist"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getSkillStopBoxDist",
																																																			params = {
																																																				{
																																																					const = 11631303
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
																																																id = "176",
																																																class = "IfElse",
																																																properties = {},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			id = "174",
																																																			class = "Condition",
																																																			properties = {
																																																				{
																																																					Operator = "LessEqual"
																																																				},
																																																				{
																																																					Opl = {
																																																						func = "getMaxSkillDist",
																																																						params = {
																																																							{
																																																								const = 11631303
																																																							}
																																																						}
																																																					}
																																																				},
																																																				{
																																																					Opr = {
																																																						field = "distToTgtForSkill"
																																																					}
																																																				}
																																																			},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	},
																																																	{
																																																		node = {
																																																			id = "213",
																																																			class = "Sequence",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {
																																																				{
																																																					node = {
																																																						id = "214",
																																																						class = "Assignment",
																																																						properties = {
																																																							{
																																																								CastRight = "false"
																																																							},
																																																							{
																																																								Opl = {
																																																									field = "skillStopDist"
																																																								}
																																																							},
																																																							{
																																																								Opr = {
																																																									func = "getSkillStopBoxDist",
																																																									params = {
																																																										{
																																																											const = 11631303
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
																																																						id = "172",
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
																																																											field = "skillStopDist"
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
																																																											const = BaseEnum.MoveUpdateLevel.Once
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
																																																			id = "173",
																																																			class = "Noop",
																																																			properties = {},
																																																			attachments = {},
																																																			children = {}
																																																		}
																																																	}
																																																}
																																															}
																																														},
																																														{
																																															node = {
																																																id = "170",
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
																																																					const = 11631303
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
																																																id = "495",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_AlertLoop"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
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
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																																id = "496",
																																																class = "Action",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "playAction",
																																																			params = {
																																																				{
																																																					const = "Behav_AlertEnd"
																																																				},
																																																				{
																																																					const = -1
																																																				},
																																																				{
																																																					const = ""
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
																																																					const = BaseEnum.AIAnimationRootMotionType.Default
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
																																							id = "233",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "155",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_ComboAttack"
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
																																										id = "244",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11630430"
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
																																										id = "196",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631301"
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
																																										id = "277",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631302"
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
																																										id = "396",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631303"
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
																																										id = "397",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631500"
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
																																										id = "197",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631501"
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
																																										id = "398",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631600"
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
																																										id = "399",
																																										class = "Assignment",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "tSkill_11631700"
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
																																										id = "465",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "startTimer",
																																													params = {
																																														{
																																															const = "fightInterval"
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
																														id = "17",
																														class = "DecoratorWeight",
																														properties = {
																															{
																																DecorateWhenChildEnds = "false"
																															},
																															{
																																Weight = {
																																	field = "sideWalkWeight"
																																}
																															}
																														},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "16",
																																	class = "False",
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
																											id = "53",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "59",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "60",
																																	class = "Compute",
																																	properties = {
																																		{
																																			Operator = "Add"
																																		},
																																		{
																																			Opl = {
																																				field = "attackWeight"
																																			}
																																		},
																																		{
																																			Opr1 = {
																																				field = "attackWeight"
																																			}
																																		},
																																		{
																																			Opr2 = {
																																				const = 50
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "61",
																																	class = "Assignment",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "sideWalkWeight"
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
																														id = "217",
																														class = "IfElse",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "228",
																																	class = "And",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "74",
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
																																							field = "minAttackDist"
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "75",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							func = "isGoBackCd"
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	id = "218",
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
																																				id = "219",
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
																																							id = "76",
																																							class = "Selector",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "230",
																																										class = "Sequence",
																																										properties = {},
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
																																																		field = "attackStopBoxDist"
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
																																											},
																																											{
																																												node = {
																																													id = "234",
																																													class = "Compute",
																																													properties = {
																																														{
																																															Operator = "Add"
																																														},
																																														{
																																															Opl = {
																																																field = "sideWalkWeight"
																																															}
																																														},
																																														{
																																															Opr1 = {
																																																field = "sideWalkWeight"
																																															}
																																														},
																																														{
																																															Opr2 = {
																																																const = 100
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
																																										id = "80",
																																										class = "Action",
																																										properties = {
																																											{
																																												Method = {
																																													func = "runBack",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															field = "attackStopBoxDist"
																																														},
																																														{
																																															const = 2
																																														},
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
																																					}
																																				}
																																			}
																																		},
																																		{
																																			node = {
																																				id = "220",
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
																																							id = "151",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "101",
																																										class = "Condition",
																																										properties = {
																																											{
																																												Operator = "Equal"
																																											},
																																											{
																																												Opl = {
																																													field = "canWalkLeftOrRight"
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
																																										id = "102",
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
																																													id = "104",
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
																																																id = "105",
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
																																																					const = 1.5
																																																				},
																																																				{
																																																					const = -35
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
																																													id = "108",
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
																																																id = "109",
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
																																	id = "221",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "222",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Equal"
																																					},
																																					{
																																						Opl = {
																																							field = "canWalkLeftOrRight"
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
																																				id = "225",
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
																																							id = "226",
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
																																										id = "223",
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
																																															const = 1.5
																																														},
																																														{
																																															const = -35
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
																																							id = "227",
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
																																										id = "224",
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
				}
			}
		}
	}
}

return ST_Monster_AutoCombat_Boss_10163
