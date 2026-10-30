-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_NpcChallenge_20100270002.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_NpcChallenge_20100270002 = {
	behavior = {
		version = 46,
		useForRoute = false,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_NpcChallenge_20100270002",
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				name = "Defense",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "CurrentDistToTarget",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "CurrentBoxDistToTarget",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "goBackDist",
				const = 0,
				value = "0",
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "287",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "256",
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
						class = "DecoratorLoop",
						id = "288",
						properties = {
							{
								Count = {
									const = -1
								}
							},
							{
								DecorateWhenChildEnds = "false"
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
									id = "375",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "379",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Assignment",
															id = "378",
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
															class = "Assignment",
															id = "376",
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
															id = "377",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "CurrentBoxDistToTarget"
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
													}
												}
											}
										},
										{
											node = {
												class = "IfElse",
												id = "324",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "325",
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
																				const = 10003
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
															class = "IfElse",
															id = "352",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "354",
																		properties = {
																			{
																				Operator = "GreaterEqual"
																			},
																			{
																				Opl = {
																					func = "getSp",
																					params = {
																						{
																							field = "selfId"
																						}
																					}
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
																		class = "IfElse",
																		id = "334",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "336",
																					properties = {
																						{
																							Operator = "LessEqual"
																						},
																						{
																							Opl = {
																								field = "CurrentDistToTarget"
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
																					class = "Sequence",
																					id = "331",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "342",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											func = "getSp",
																											params = {
																												{
																													field = "selfId"
																												}
																											}
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
																								id = "333",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "skillId"
																										}
																									},
																									{
																										Opr = {
																											func = "getUltimateSkillId"
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
																													field = "skillId"
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
																								class = "Compute",
																								id = "335",
																								properties = {
																									{
																										Operator = "Add"
																									},
																									{
																										Opl = {
																											field = "skillId"
																										}
																									},
																									{
																										Opr1 = {
																											field = "skillId"
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
																						},
																						{
																							node = {
																								class = "Action",
																								id = "330",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													field = "skillId"
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
																					class = "Sequence",
																					id = "340",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "341",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											func = "getSp",
																											params = {
																												{
																													field = "selfId"
																												}
																											}
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
																								class = "Action",
																								id = "337",
																								properties = {
																									{
																										Method = {
																											func = "moveToTarget",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 15
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
																													const = BaseEnum.MoveUpdateLevel.Normal
																												},
																												{
																													const = BaseEnum.PathFindType.Voxel
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
																										ResultResumeOption = "BT_ResumeTree"
																									}
																								},
																								attachments = {},
																								children = {}
																							}
																						},
																						{
																							node = {
																								class = "Assignment",
																								id = "339",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "skillId"
																										}
																									},
																									{
																										Opr = {
																											func = "getUltimateSkillId"
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
																								id = "338",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													field = "skillId"
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
																								class = "Compute",
																								id = "329",
																								properties = {
																									{
																										Operator = "Add"
																									},
																									{
																										Opl = {
																											field = "skillId"
																										}
																									},
																									{
																										Opr1 = {
																											field = "skillId"
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
																													field = "skillId"
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
																},
																{
																	node = {
																		class = "Sequence",
																		id = "355",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "IfElse",
																					id = "369",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "367",
																								properties = {
																									{
																										Operator = "Equal"
																									},
																									{
																										Opl = {
																											func = "checkCharacterState",
																											params = {
																												{
																													const = "SPECIALDEFENSE"
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
																								class = "Action",
																								id = "368",
																								properties = {
																									{
																										Method = {
																											func = "castSkill",
																											params = {
																												{
																													const = 0
																												},
																												{
																													const = 10270400
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
																								class = "Noop",
																								id = "370",
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
																					class = "Selector",
																					id = "404",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Sequence",
																								id = "406",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "407",
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
																											class = "Action",
																											id = "405",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 11200202
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
																								class = "IfElse",
																								id = "411",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Or",
																											id = "412",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "415",
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
																														class = "Condition",
																														id = "413",
																														properties = {
																															{
																																Operator = "Greater"
																															},
																															{
																																Opl = {
																																	field = "CurrentDistToTarget"
																																}
																															},
																															{
																																Opr = {
																																	field = "maxAttackDist"
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
																											id = "408",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "410",
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
																														id = "409",
																														properties = {
																															{
																																Method = {
																																	func = "castNormalAtkCombo",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 0
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
																									},
																									{
																										node = {
																											class = "Action",
																											id = "414",
																											properties = {
																												{
																													Method = {
																														func = "castNormalAtkCombo",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 0
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
																											attachments = {
																												{
																													transition = false,
																													class = "Precondition",
																													effector = false,
																													precondition = true,
																													id = "356",
																													properties = {
																														{
																															BinaryOperator = "And"
																														},
																														{
																															Operator = "LessEqual"
																														},
																														{
																															Opl = {
																																field = "CurrentDistToTarget"
																															}
																														},
																														{
																															Opr2 = {
																																field = "maxAttackDist"
																															}
																														},
																														{
																															Phase = "Update"
																														}
																													}
																												}
																											},
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
															class = "Selector",
															id = "265",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Sequence",
																		id = "267",
																		properties = {},
																		attachments = {
																			{
																				transition = false,
																				class = "Precondition",
																				effector = false,
																				precondition = true,
																				id = "453",
																				properties = {
																					{
																						BinaryOperator = "And"
																					},
																					{
																						Operator = "Equal"
																					},
																					{
																						Opl = {
																							func = "checkCharacterState",
																							params = {
																								{
																									const = "SPECIALDEFENSE"
																								},
																								{
																									const = 0
																								}
																							}
																						}
																					},
																					{
																						Opr2 = {
																							const = false
																						}
																					},
																					{
																						Phase = "Update"
																					}
																				}
																			}
																		},
																		children = {
																			{
																				node = {
																					class = "Assignment",
																					id = "291",
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
																					id = "290",
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
																					id = "318",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Or",
																								id = "319",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "322",
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
																											class = "Condition",
																											id = "320",
																											properties = {
																												{
																													Operator = "Greater"
																												},
																												{
																													Opl = {
																														field = "CurrentDistToTarget"
																													}
																												},
																												{
																													Opr = {
																														field = "maxAttackDist"
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
																								id = "315",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "317",
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
																											id = "316",
																											properties = {
																												{
																													Method = {
																														func = "castNormalAtkCombo",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 0
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
																						},
																						{
																							node = {
																								class = "Action",
																								id = "321",
																								properties = {
																									{
																										Method = {
																											func = "castNormalAtkCombo",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 0
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
																								attachments = {
																									{
																										transition = false,
																										class = "Precondition",
																										effector = false,
																										precondition = true,
																										id = "356",
																										properties = {
																											{
																												BinaryOperator = "And"
																											},
																											{
																												Operator = "LessEqual"
																											},
																											{
																												Opl = {
																													field = "CurrentDistToTarget"
																												}
																											},
																											{
																												Opr2 = {
																													field = "maxAttackDist"
																												}
																											},
																											{
																												Phase = "Update"
																											}
																										}
																									}
																								},
																								children = {}
																							}
																						}
																					}
																				}
																			},
																			{
																				node = {
																					class = "ReferencedBehavior",
																					id = "393",
																					properties = {
																						{
																							ReferenceBehavior = {
																								const = "PBT_AutoCombat_Attack"
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
																},
																{
																	node = {
																		class = "Sequence",
																		id = "266",
																		properties = {},
																		attachments = {
																			{
																				transition = false,
																				class = "Precondition",
																				effector = false,
																				precondition = true,
																				id = "453",
																				properties = {
																					{
																						BinaryOperator = "And"
																					},
																					{
																						Operator = "Equal"
																					},
																					{
																						Opl = {
																							func = "checkCharacterState",
																							params = {
																								{
																									const = "SPECIALDEFENSE"
																								},
																								{
																									const = 0
																								}
																							}
																						}
																					},
																					{
																						Opr2 = {
																							const = true
																						}
																					},
																					{
																						Phase = "Update"
																					}
																				}
																			}
																		},
																		children = {
																			{
																				node = {
																					class = "Assignment",
																					id = "314",
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
																					id = "313",
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
																					class = "Action",
																					id = "258",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 10270320
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
																					id = "394",
																					properties = {
																						{
																							Method = {
																								func = "waitTime",
																								params = {
																									{
																										const = 5
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
																					id = "395",
																					properties = {
																						{
																							Method = {
																								func = "castSkill",
																								params = {
																									{
																										field = "selfId"
																									},
																									{
																										const = 10270400
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
																					class = "IfElse",
																					id = "402",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Or",
																								id = "399",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "401",
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
																											class = "Condition",
																											id = "400",
																											properties = {
																												{
																													Operator = "Greater"
																												},
																												{
																													Opl = {
																														field = "CurrentDistToTarget"
																													}
																												},
																												{
																													Opr = {
																														field = "maxAttackDist"
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
																								id = "396",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "398",
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
																											id = "397",
																											properties = {
																												{
																													Method = {
																														func = "castNormalAtkCombo",
																														params = {
																															{
																																field = "tgt"
																															},
																															{
																																const = 0
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
																						},
																						{
																							node = {
																								class = "Action",
																								id = "403",
																								properties = {
																									{
																										Method = {
																											func = "castNormalAtkCombo",
																											params = {
																												{
																													field = "tgt"
																												},
																												{
																													const = 0
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
																								attachments = {
																									{
																										transition = false,
																										class = "Precondition",
																										effector = false,
																										precondition = true,
																										id = "356",
																										properties = {
																											{
																												BinaryOperator = "And"
																											},
																											{
																												Operator = "LessEqual"
																											},
																											{
																												Opl = {
																													field = "CurrentDistToTarget"
																												}
																											},
																											{
																												Opr2 = {
																													field = "maxAttackDist"
																												}
																											},
																											{
																												Phase = "Update"
																											}
																										}
																									}
																								},
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

return ST_Monster_AutoCombat_NpcChallenge_20100270002
