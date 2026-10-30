-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_NpcChallenge_20102320000.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_NpcChallenge_20102320000 = {
	behavior = {
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_NpcChallenge_20102320000",
		useForRoute = false,
		version = 113,
		properties = {},
		pars = {
			{
				value = "0",
				name = "CurrentDistToTarget",
				type = "float",
				const = 0
			},
			{
				value = "0",
				name = "CurrentBoxDistToTarget",
				type = "float",
				const = 0
			},
			{
				value = "0",
				name = "goBackDist",
				type = "float",
				const = 0
			},
			{
				value = "0",
				name = "skillStopDist",
				type = "float",
				const = 0
			},
			{
				value = "100",
				name = "tWeight_Group_SideWalk",
				type = "int",
				const = 100
			},
			{
				value = "100",
				name = "tWeight_Group_Wait",
				type = "int",
				const = 100
			},
			{
				value = "100",
				name = "tWeight_Group_Angry",
				type = "int",
				const = 100
			},
			{
				value = "0",
				name = "tSkillRecoverCount",
				type = "int",
				const = 0
			},
			{
				value = "0",
				name = "CurrentHpPercent",
				type = "float",
				const = 0
			},
			{
				value = "0",
				name = "tSkillBuffCount",
				type = "int",
				const = 0
			},
			{
				value = "0",
				name = "tSkillControlCount",
				type = "int",
				const = 0
			},
			{
				value = "0",
				name = "jumpback",
				type = "float",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "212",
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
				},
				{
					node = {
						class = "Assignment",
						id = "217",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "skillCd"
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
						class = "Action",
						id = "385",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "jumpback"
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
						class = "DecoratorLoop",
						id = "3",
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
									id = "439",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Assignment",
												id = "451",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "CurrentDistToTarget"
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
												class = "Assignment",
												id = "434",
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
												class = "Condition",
												id = "435",
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
												class = "IfElse",
												id = "464",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "And",
															id = "475",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "471",
																		properties = {
																			{
																				Operator = "Less"
																			},
																			{
																				Opl = {
																					field = "CurrentDistToTarget"
																				}
																			},
																			{
																				Opr = {
																					func = "getMinAttackDist",
																					params = {
																						{
																							field = "selfId"
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
																		id = "476",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getTimerValue",
																					params = {
																						{
																							const = "jumpback"
																						}
																					}
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
																}
															}
														}
													},
													{
														node = {
															class = "Sequence",
															id = "465",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Compute",
																		id = "469",
																		properties = {
																			{
																				Operator = "Sub"
																			},
																			{
																				Opl = {
																					field = "goBackDist"
																				}
																			},
																			{
																				Opr1 = {
																					field = "attackStopBoxDist"
																				}
																			},
																			{
																				Opr2 = {
																					field = "CurrentBoxDistToTarget"
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
																		id = "466",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "468",
																					properties = {
																						{
																							Operator = "Greater"
																						},
																						{
																							Opl = {
																								func = "getRandomInt",
																								params = {
																									{
																										const = 0
																									},
																									{
																										const = 100
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
																					class = "Action",
																					id = "472",
																					properties = {
																						{
																							Method = {
																								func = "jumpBackByLinkAngle",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 45
																									},
																									{
																										field = "goBackDist"
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
																					id = "467",
																					properties = {
																						{
																							Method = {
																								func = "jumpBackByLinkAngle",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = -45
																									},
																									{
																										field = "goBackDist"
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
																		id = "478",
																		properties = {
																			{
																				Method = {
																					func = "startTimer",
																					params = {
																						{
																							const = "jumpback"
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
															class = "Noop",
															id = "470",
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
												class = "IfElse",
												id = "481",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "474",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "checkSkillNotInCd",
																		params = {
																			{
																				const = 12320210
																			},
																			{
																				const = 0
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
															class = "Sequence",
															id = "480",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "477",
																		properties = {
																			{
																				Method = {
																					func = "castSkill",
																					params = {
																						{
																							const = 0
																						},
																						{
																							const = 12320210
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
																		id = "479",
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
															class = "Noop",
															id = "473",
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
												class = "ReferencedBehavior",
												id = "463",
												properties = {
													{
														ReferenceBehavior = {
															const = "PBT_AutoCombat_NormalAtkCombo"
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

return ST_Monster_AutoCombat_NpcChallenge_20102320000
