-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_Minespine.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_Minespine = {
	behavior = {
		version = 144,
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_Minespine",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "goBackDist",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "selfhp",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "disToTgtForSkillMon",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "creations",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "RandomYaw",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "battlestage",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "disToBornPos",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "skillfail",
				type = "int"
			},
			{
				const = 0,
				value = "0",
				name = "happyaction",
				type = "int"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "26",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "444",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "445",
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
									id = "443",
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
									id = "446",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "bornPos"
											}
										},
										{
											Opr = {
												func = "getBornPos"
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
									id = "383",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "384",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkIsInSneak"
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
												id = "375",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Action",
															id = "442",
															properties = {
																{
																	Method = {
																		func = "turnToTarget",
																		params = {
																			{
																				field = "tgt"
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
															class = "Action",
															id = "376",
															properties = {
																{
																	Method = {
																		func = "castSkill",
																		params = {
																			{
																				const = 0
																			},
																			{
																				const = 12850710
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
										},
										{
											node = {
												class = "Action",
												id = "447",
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
							},
							{
								node = {
									class = "Assignment",
									id = "589",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "battlestage"
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
									id = "588",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "skillfail"
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
						class = "DecoratorLoop",
						id = "10",
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
									id = "25",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "393",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Assignment",
															id = "381",
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
															id = "394",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "disToBornPos"
																	}
																},
																{
																	Opr = {
																		func = "getDistByPos",
																		params = {
																			{
																				field = "bornPos"
																			},
																			{
																				const = true
																			},
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
													}
												}
											}
										},
										{
											node = {
												class = "IfElse",
												id = "221",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "And",
															id = "665",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "664",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					func = "checkIsInBreakRecover",
																					params = {
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
																		class = "Condition",
																		id = "227",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					field = "battlestage"
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
																		class = "Condition",
																		id = "700",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkCanUseSkill",
																					params = {
																						{
																							field = "selfId"
																						},
																						{
																							const = 12851003
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
															class = "IfElse",
															id = "34",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "And",
																		id = "669",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "668",
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
																					class = "Condition",
																					id = "33",
																					properties = {
																						{
																							Operator = "Less"
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
																			}
																		}
																	}
																},
																{
																	node = {
																		class = "IfElse",
																		id = "29",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "211",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkIsInSneak"
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
																					id = "395",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "396",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											field = "disToBornPos"
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
																								id = "421",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Assignment",
																											id = "425",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "battlestage"
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
																											class = "Action",
																											id = "438",
																											properties = {
																												{
																													Method = {
																														func = "turnToPos",
																														params = {
																															{
																																field = "bornPos"
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
																											class = "Action",
																											id = "431",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12850801
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
																											id = "450",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12850702
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
																											class = "Selector",
																											id = "612",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "424",
																														properties = {
																															{
																																Method = {
																																	func = "moveToPos",
																																	params = {
																																		{
																																			field = "bornPos"
																																		},
																																		{
																																			const = 5
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = 1
																																		},
																																		{
																																			const = BaseEnum.SpeedRateType.Fast
																																		},
																																		{
																																			const = 13
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
																														class = "True",
																														id = "613",
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
																											class = "Action",
																											id = "539",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12851003
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
																													ResultResumeOption = "BT_NextNode"
																												}
																											},
																											attachments = {
																												{
																													precondition = true,
																													class = "Precondition",
																													transition = false,
																													effector = false,
																													id = "595",
																													properties = {
																														{
																															BinaryOperator = "And"
																														},
																														{
																															Operator = "Equal"
																														},
																														{
																															Opl = {
																																func = "checkIsInSneak"
																															}
																														},
																														{
																															Opr2 = {
																																const = true
																															}
																														},
																														{
																															Phase = "Enter"
																														}
																													}
																												}
																											},
																											children = {}
																										}
																									},
																									{
																										node = {
																											class = "Selector",
																											id = "538",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "656",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850713
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "651",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Sequence",
																														id = "681",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "540",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "skillfail"
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
																																	class = "Action",
																																	id = "682",
																																	properties = {
																																		{
																																			Method = {
																																				func = "addBuff",
																																				params = {
																																					{
																																						const = 1000601
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
																																			ResultResumeOption = "BT_NextNode"
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
																								class = "IfElse",
																								id = "400",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "401",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "disToBornPos"
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
																											class = "Sequence",
																											id = "214",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "229",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Selector",
																														id = "614",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "378",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 1
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 13
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
																																	class = "True",
																																	id = "618",
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
																														class = "Action",
																														id = "596",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "535",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "655",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "695",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "537",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "696",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																											id = "416",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "420",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Action",
																														id = "597",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "532",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "654",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "679",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "533",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "680",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																					class = "IfElse",
																					id = "398",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "399",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											field = "disToBornPos"
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
																								id = "414",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Assignment",
																											id = "410",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "battlestage"
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
																											id = "430",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "440",
																														properties = {
																															{
																																Method = {
																																	func = "turnToPos",
																																	params = {
																																		{
																																			field = "bornPos"
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
																														class = "Action",
																														id = "415",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850703
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
																														class = "Selector",
																														id = "616",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "413",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 3
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 13
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
																																	class = "True",
																																	id = "621",
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
																											class = "Action",
																											id = "598",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12851003
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
																													ResultResumeOption = "BT_NextNode"
																												}
																											},
																											attachments = {
																												{
																													precondition = true,
																													class = "Precondition",
																													transition = false,
																													effector = false,
																													id = "595",
																													properties = {
																														{
																															BinaryOperator = "And"
																														},
																														{
																															Operator = "Equal"
																														},
																														{
																															Opl = {
																																func = "checkIsInSneak"
																															}
																														},
																														{
																															Opr2 = {
																																const = true
																															}
																														},
																														{
																															Phase = "Enter"
																														}
																													}
																												}
																											},
																											children = {}
																										}
																									},
																									{
																										node = {
																											class = "Selector",
																											id = "529",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "653",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850713
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "651",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Sequence",
																														id = "677",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "530",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "skillfail"
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
																																	class = "Action",
																																	id = "678",
																																	properties = {
																																		{
																																			Method = {
																																				func = "addBuff",
																																				params = {
																																					{
																																						const = 1000601
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
																																			ResultResumeOption = "BT_NextNode"
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
																								class = "IfElse",
																								id = "402",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "403",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "disToBornPos"
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
																											class = "Sequence",
																											id = "212",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "228",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Action",
																														id = "441",
																														properties = {
																															{
																																Method = {
																																	func = "turnToPos",
																																	params = {
																																		{
																																			field = "bornPos"
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
																														class = "Action",
																														id = "388",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850702
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
																														class = "Selector",
																														id = "619",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "379",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 1
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 13
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
																																	class = "True",
																																	id = "620",
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
																														class = "Action",
																														id = "599",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "526",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "216",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "673",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "528",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "674",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																											id = "408",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "404",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Action",
																														id = "409",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850701
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Action",
																														id = "600",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "523",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "652",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "675",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "525",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "676",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																},
																{
																	node = {
																		class = "IfElse",
																		id = "670",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "671",
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
																					class = "Assignment",
																					id = "672",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "battlestage"
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
																					class = "True",
																					id = "32",
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
															class = "True",
															id = "222",
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
												id = "466",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "And",
															id = "667",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "666",
																		properties = {
																			{
																				Operator = "NotEqual"
																			},
																			{
																				Opl = {
																					func = "checkIsInBreakRecover",
																					params = {
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
																		class = "Condition",
																		id = "459",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					field = "battlestage"
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
																		class = "Condition",
																		id = "697",
																		properties = {
																			{
																				Operator = "Equal"
																			},
																			{
																				Opl = {
																					func = "checkCanUseSkill",
																					params = {
																						{
																							field = "selfId"
																						},
																						{
																							const = 12851003
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
															class = "IfElse",
															id = "458",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "457",
																		properties = {
																			{
																				Operator = "Less"
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
																					const = 0.4
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
																		id = "454",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "460",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								func = "checkIsInSneak"
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
																					id = "471",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "472",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											field = "disToBornPos"
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
																								id = "494",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Assignment",
																											id = "607",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "battlestage"
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
																											class = "Action",
																											id = "502",
																											properties = {
																												{
																													Method = {
																														func = "turnToPos",
																														params = {
																															{
																																field = "bornPos"
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
																											class = "Action",
																											id = "501",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12850801
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
																											class = "Selector",
																											id = "623",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "497",
																														properties = {
																															{
																																Method = {
																																	func = "moveToPos",
																																	params = {
																																		{
																																			field = "bornPos"
																																		},
																																		{
																																			const = 5
																																		},
																																		{
																																			const = true
																																		},
																																		{
																																			const = 1
																																		},
																																		{
																																			const = BaseEnum.SpeedRateType.Fast
																																		},
																																		{
																																			const = 13
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
																														class = "True",
																														id = "624",
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
																											class = "Action",
																											id = "601",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12851003
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
																											attachments = {
																												{
																													precondition = true,
																													class = "Precondition",
																													transition = false,
																													effector = false,
																													id = "595",
																													properties = {
																														{
																															BinaryOperator = "And"
																														},
																														{
																															Operator = "Equal"
																														},
																														{
																															Opl = {
																																func = "checkIsInSneak"
																															}
																														},
																														{
																															Opr2 = {
																																const = true
																															}
																														},
																														{
																															Phase = "Enter"
																														}
																													}
																												}
																											},
																											children = {}
																										}
																									},
																									{
																										node = {
																											class = "Selector",
																											id = "632",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "657",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850713
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "651",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Sequence",
																														id = "683",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "631",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "skillfail"
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
																																	class = "Action",
																																	id = "684",
																																	properties = {
																																		{
																																			Method = {
																																				func = "addBuff",
																																				params = {
																																					{
																																						const = 1000601
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
																																			ResultResumeOption = "BT_NextNode"
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
																								class = "IfElse",
																								id = "475",
																								properties = {},
																								attachments = {},
																								children = {
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
																														field = "disToBornPos"
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
																											class = "Sequence",
																											id = "462",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "468",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Selector",
																														id = "625",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "469",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 1
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 13
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
																																	class = "True",
																																	id = "626",
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
																														class = "Action",
																														id = "602",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "634",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "658",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "685",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "633",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "686",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																											id = "490",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "493",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Action",
																														id = "603",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "636",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "659",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "687",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "635",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "688",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																					class = "IfElse",
																					id = "473",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "474",
																								properties = {
																									{
																										Operator = "GreaterEqual"
																									},
																									{
																										Opl = {
																											field = "disToBornPos"
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
																								id = "488",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Assignment",
																											id = "484",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "battlestage"
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
																											class = "Sequence",
																											id = "500",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "503",
																														properties = {
																															{
																																Method = {
																																	func = "turnToPos",
																																	params = {
																																		{
																																			field = "bornPos"
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
																														class = "Action",
																														id = "489",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850703
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
																														class = "Selector",
																														id = "627",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "487",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 3
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 13
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
																																	class = "True",
																																	id = "628",
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
																											class = "Action",
																											id = "604",
																											properties = {
																												{
																													Method = {
																														func = "castSkill",
																														params = {
																															{
																																const = 0
																															},
																															{
																																const = 12851003
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
																													ResultResumeOption = "BT_NextNode"
																												}
																											},
																											attachments = {
																												{
																													precondition = true,
																													class = "Precondition",
																													transition = false,
																													effector = false,
																													id = "595",
																													properties = {
																														{
																															BinaryOperator = "And"
																														},
																														{
																															Operator = "Equal"
																														},
																														{
																															Opl = {
																																func = "checkIsInSneak"
																															}
																														},
																														{
																															Opr2 = {
																																const = true
																															}
																														},
																														{
																															Phase = "Enter"
																														}
																													}
																												}
																											},
																											children = {}
																										}
																									},
																									{
																										node = {
																											class = "Selector",
																											id = "638",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "660",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850713
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "651",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Sequence",
																														id = "689",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Assignment",
																																	id = "637",
																																	properties = {
																																		{
																																			CastRight = "false"
																																		},
																																		{
																																			Opl = {
																																				field = "skillfail"
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
																																	class = "Action",
																																	id = "690",
																																	properties = {
																																		{
																																			Method = {
																																				func = "addBuff",
																																				params = {
																																					{
																																						const = 1000601
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
																																			ResultResumeOption = "BT_NextNode"
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
																								class = "IfElse",
																								id = "477",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "478",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														field = "disToBornPos"
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
																											class = "Sequence",
																											id = "455",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "452",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Action",
																														id = "504",
																														properties = {
																															{
																																Method = {
																																	func = "turnToPos",
																																	params = {
																																		{
																																			field = "bornPos"
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
																														class = "Action",
																														id = "470",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850702
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
																														class = "Selector",
																														id = "629",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "465",
																																	properties = {
																																		{
																																			Method = {
																																				func = "moveToPos",
																																				params = {
																																					{
																																						field = "bornPos"
																																					},
																																					{
																																						const = 5
																																					},
																																					{
																																						const = true
																																					},
																																					{
																																						const = 1
																																					},
																																					{
																																						const = BaseEnum.SpeedRateType.Fast
																																					},
																																					{
																																						const = 13
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
																																	class = "True",
																																	id = "630",
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
																														class = "Action",
																														id = "605",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "640",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "661",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "691",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "639",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "692",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																											id = "482",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Assignment",
																														id = "479",
																														properties = {
																															{
																																CastRight = "false"
																															},
																															{
																																Opl = {
																																	field = "battlestage"
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
																														class = "Action",
																														id = "483",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12850701
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
																														id = "606",
																														properties = {
																															{
																																Method = {
																																	func = "castSkill",
																																	params = {
																																		{
																																			const = 0
																																		},
																																		{
																																			const = 12851003
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
																																ResultResumeOption = "BT_NextNode"
																															}
																														},
																														attachments = {
																															{
																																precondition = true,
																																class = "Precondition",
																																transition = false,
																																effector = false,
																																id = "595",
																																properties = {
																																	{
																																		BinaryOperator = "And"
																																	},
																																	{
																																		Operator = "Equal"
																																	},
																																	{
																																		Opl = {
																																			func = "checkIsInSneak"
																																		}
																																	},
																																	{
																																		Opr2 = {
																																			const = true
																																		}
																																	},
																																	{
																																		Phase = "Enter"
																																	}
																																}
																															}
																														},
																														children = {}
																													}
																												},
																												{
																													node = {
																														class = "Selector",
																														id = "642",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "662",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						const = 0
																																					},
																																					{
																																						const = 12850713
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
																																			ResultResumeOption = "BT_NextNode"
																																		}
																																	},
																																	attachments = {
																																		{
																																			precondition = true,
																																			class = "Precondition",
																																			transition = false,
																																			effector = false,
																																			id = "651",
																																			properties = {
																																				{
																																					BinaryOperator = "And"
																																				},
																																				{
																																					Operator = "Equal"
																																				},
																																				{
																																					Opl = {
																																						func = "checkIsInSneak"
																																					}
																																				},
																																				{
																																					Opr2 = {
																																						const = true
																																					}
																																				},
																																				{
																																					Phase = "Enter"
																																				}
																																			}
																																		}
																																	},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	class = "Sequence",
																																	id = "693",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Assignment",
																																				id = "641",
																																				properties = {
																																					{
																																						CastRight = "false"
																																					},
																																					{
																																						Opl = {
																																							field = "skillfail"
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
																																				class = "Action",
																																				id = "694",
																																				properties = {
																																					{
																																						Method = {
																																							func = "addBuff",
																																							params = {
																																								{
																																									const = 1000601
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
																																						ResultResumeOption = "BT_NextNode"
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
																},
																{
																	node = {
																		class = "True",
																		id = "456",
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
															class = "True",
															id = "467",
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
												id = "580",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "575",
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
															id = "578",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "573",
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
																},
																{
																	node = {
																		class = "Selector",
																		id = "572",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Sequence",
																					id = "576",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Selector",
																								id = "570",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "569",
																											properties = {
																												{
																													Operator = "Less"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "JumpBackCd"
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
																											class = "Condition",
																											id = "568",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "JumpBackCd"
																															}
																														}
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								class = "Action",
																								id = "566",
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
																													const = 5
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
																								class = "Action",
																								id = "571",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "JumpBackCd"
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
																					id = "567",
																					properties = {
																						{
																							Method = {
																								func = "walkBack",
																								params = {
																									{
																										field = "tgt"
																									},
																									{
																										const = 5
																									},
																									{
																										const = 3
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
																},
																{
																	node = {
																		class = "True",
																		id = "582",
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
															class = "True",
															id = "581",
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
												class = "Sequence",
												id = "11",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "IfElse",
															id = "544",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Condition",
																		id = "644",
																		properties = {
																			{
																				Operator = "Greater"
																			},
																			{
																				Opl = {
																					field = "skillfail"
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
																		id = "650",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Action",
																					id = "648",
																					properties = {
																						{
																							Method = {
																								func = "turnToTarget",
																								params = {
																									{
																										field = "tgt"
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
																					id = "647",
																					properties = {
																						{
																							Method = {
																								func = "playAction",
																								params = {
																									{
																										const = "Behav_Angry"
																									},
																									{
																										const = 0
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
																					class = "Assignment",
																					id = "649",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "skillfail"
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
																					id = "663",
																					properties = {
																						{
																							CastRight = "false"
																						},
																						{
																							Opl = {
																								field = "happyaction"
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
																		class = "IfElse",
																		id = "645",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "543",
																					properties = {
																						{
																							Operator = "GreaterEqual"
																						},
																						{
																							Opl = {
																								field = "happyaction"
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
																					class = "Sequence",
																					id = "119",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Action",
																								id = "118",
																								properties = {
																									{
																										Method = {
																											func = "turnToTarget",
																											params = {
																												{
																													field = "tgt"
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
																								id = "112",
																								properties = {
																									{
																										Method = {
																											func = "playAction",
																											params = {
																												{
																													const = "Behav_Happy"
																												},
																												{
																													const = 0
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
																								class = "Assignment",
																								id = "546",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "happyaction"
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
																					class = "True",
																					id = "646",
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
															class = "Condition",
															id = "17",
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
															id = "18",
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
															id = "19",
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
															class = "SelectorProbability",
															id = "150",
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
																		id = "152",
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
																					class = "Sequence",
																					id = "156",
																					properties = {},
																					attachments = {
																						{
																							precondition = true,
																							class = "Precondition",
																							transition = false,
																							effector = false,
																							id = "549",
																							properties = {
																								{
																									BinaryOperator = "And"
																								},
																								{
																									Operator = "GreaterEqual"
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
																									Opr2 = {
																										const = 1
																									}
																								},
																								{
																									Phase = "Enter"
																								}
																							}
																						},
																						{
																							precondition = true,
																							class = "Precondition",
																							transition = false,
																							effector = false,
																							id = "550",
																							properties = {
																								{
																									BinaryOperator = "And"
																								},
																								{
																									Operator = "Equal"
																								},
																								{
																									Opl = {
																										func = "checkCanCombat"
																									}
																								},
																								{
																									Opr2 = {
																										const = true
																									}
																								},
																								{
																									Phase = "Enter"
																								}
																							}
																						}
																					},
																					children = {
																						{
																							node = {
																								class = "Sequence",
																								id = "145",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Assignment",
																											id = "144",
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
																														func = "getPropertyCd",
																														params = {
																															{
																																const = "fightCd"
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
																											id = "146",
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
																														func = "getPropertyCd",
																														params = {
																															{
																																const = "skillCd"
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
																											id = "168",
																											properties = {
																												{
																													CastRight = "false"
																												},
																												{
																													Opl = {
																														field = "atkCd"
																													}
																												},
																												{
																													Opr = {
																														func = "getPropertyCd",
																														params = {
																															{
																																const = "atkCd"
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
																								class = "Selector",
																								id = "147",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "169",
																											properties = {
																												{
																													Operator = "Less"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "fightCd01"
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
																											class = "Condition",
																											id = "170",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "fightCd01"
																															}
																														}
																													}
																												},
																												{
																													Opr = {
																														field = "fightCd"
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
																								class = "Selector",
																								id = "171",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Sequence",
																											id = "172",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Selector",
																														id = "148",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "158",
																																	properties = {
																																		{
																																			Operator = "Less"
																																		},
																																		{
																																			Opl = {
																																				func = "getTimerValue",
																																				params = {
																																					{
																																						const = "skillCd01"
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
																																	class = "Condition",
																																	id = "157",
																																	properties = {
																																		{
																																			Operator = "GreaterEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getTimerValue",
																																				params = {
																																					{
																																						const = "skillCd01"
																																					}
																																				}
																																			}
																																		},
																																		{
																																			Opr = {
																																				field = "skillCd"
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
																														class = "Assignment",
																														id = "173",
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
																																	func = "selectSkillByWeight",
																																	params = {
																																		{
																																			field = "tgt"
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
																														class = "Sequence",
																														id = "183",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "IfElse",
																																	id = "178",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "149",
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
																																							const = 12
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
																																				id = "163",
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
																																										const = 70
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Action",
																																										id = "551",
																																										properties = {
																																											{
																																												Method = {
																																													func = "castSkill",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = 12850102
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
																																					},
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
																																										const = 20
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Action",
																																										id = "363",
																																										properties = {
																																											{
																																												Method = {
																																													func = "moveToTarget",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = 10
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
																																															const = false
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
																																				id = "185",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Condition",
																																							id = "186",
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
																																							class = "SelectorProbability",
																																							id = "189",
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
																																										id = "318",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 20
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "SelectorProbability",
																																													id = "311",
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
																																																id = "317",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Action",
																																																			id = "314",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 12850201
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
																																														},
																																														{
																																															node = {
																																																class = "DecoratorWeight",
																																																id = "312",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Action",
																																																			id = "315",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 12850202
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
																																														},
																																														{
																																															node = {
																																																class = "DecoratorWeight",
																																																id = "313",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Action",
																																																			id = "316",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 12850203
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
																																											}
																																										}
																																									}
																																								},
																																								{
																																									node = {
																																										class = "DecoratorWeight",
																																										id = "330",
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
																																													class = "Sequence",
																																													id = "552",
																																													properties = {},
																																													attachments = {
																																														{
																																															precondition = true,
																																															class = "Precondition",
																																															transition = false,
																																															effector = false,
																																															id = "553",
																																															properties = {
																																																{
																																																	BinaryOperator = "And"
																																																},
																																																{
																																																	Operator = "Less"
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
																																																	Opr2 = {
																																																		const = 0.85
																																																	}
																																																},
																																																{
																																																	Phase = "Enter"
																																																}
																																															}
																																														}
																																													},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "334",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 12850102
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
																																										class = "DecoratorWeight",
																																										id = "583",
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
																																													class = "Sequence",
																																													id = "585",
																																													properties = {},
																																													attachments = {
																																														{
																																															precondition = true,
																																															class = "Precondition",
																																															transition = false,
																																															effector = false,
																																															id = "553",
																																															properties = {
																																																{
																																																	BinaryOperator = "And"
																																																},
																																																{
																																																	Operator = "Less"
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
																																																	Opr2 = {
																																																		const = 0.7
																																																	}
																																																},
																																																{
																																																	Phase = "Enter"
																																																}
																																															}
																																														}
																																													},
																																													children = {
																																														{
																																															node = {
																																																class = "Action",
																																																id = "584",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "castSkill",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 12850500
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
																																										class = "DecoratorWeight",
																																										id = "205",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 20
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Action",
																																													id = "206",
																																													properties = {
																																														{
																																															Method = {
																																																func = "moveToTarget",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		const = 5
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
																																																		const = false
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
																																							id = "188",
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
																																										id = "203",
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
																																													class = "Action",
																																													id = "204",
																																													properties = {
																																														{
																																															Method = {
																																																func = "castSkill",
																																																params = {
																																																	{
																																																		field = "tgt"
																																																	},
																																																	{
																																																		const = 12850600
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
																																								},
																																								{
																																									node = {
																																										class = "DecoratorWeight",
																																										id = "201",
																																										properties = {
																																											{
																																												DecorateWhenChildEnds = "false"
																																											},
																																											{
																																												Weight = {
																																													const = 40
																																												}
																																											}
																																										},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "SelectorProbability",
																																													id = "304",
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
																																																id = "308",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
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
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 12850201
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
																																														},
																																														{
																																															node = {
																																																class = "DecoratorWeight",
																																																id = "305",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
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
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 12850202
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
																																														},
																																														{
																																															node = {
																																																class = "DecoratorWeight",
																																																id = "309",
																																																properties = {
																																																	{
																																																		DecorateWhenChildEnds = "false"
																																																	},
																																																	{
																																																		Weight = {
																																																			const = 50
																																																		}
																																																	}
																																																},
																																																attachments = {},
																																																children = {
																																																	{
																																																		node = {
																																																			class = "Action",
																																																			id = "310",
																																																			properties = {
																																																				{
																																																					Method = {
																																																						func = "castSkill",
																																																						params = {
																																																							{
																																																								field = "tgt"
																																																							},
																																																							{
																																																								const = 12850203
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
																																	class = "SelectorProbability",
																																	id = "104",
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
																																				id = "109",
																																				properties = {
																																					{
																																						DecorateWhenChildEnds = "false"
																																					},
																																					{
																																						Weight = {
																																							const = 20
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "IfElse",
																																							id = "365",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "364",
																																										properties = {
																																											{
																																												Operator = "Less"
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
																																													const = 0.7
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
																																															const = 12851002
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
																																															const = 12851001
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
																																				class = "DecoratorWeight",
																																				id = "110",
																																				properties = {
																																					{
																																						DecorateWhenChildEnds = "false"
																																					},
																																					{
																																						Weight = {
																																							const = 20
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "IfElse",
																																							id = "114",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "115",
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
																																													const = 7
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
																																										id = "141",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													class = "Compute",
																																													id = "138",
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
																																																field = "distToTgt"
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
																																													id = "289",
																																													properties = {},
																																													attachments = {},
																																													children = {
																																														{
																																															node = {
																																																class = "Assignment",
																																																id = "288",
																																																properties = {
																																																	{
																																																		CastRight = "false"
																																																	},
																																																	{
																																																		Opl = {
																																																			field = "RandomYaw"
																																																		}
																																																	},
																																																	{
																																																		Opr = {
																																																			func = "getRandomFloat",
																																																			params = {
																																																				{
																																																					const = -45
																																																				},
																																																				{
																																																					const = 45
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
																																																class = "Action",
																																																id = "286",
																																																properties = {
																																																	{
																																																		Method = {
																																																			func = "turnToTargetAtYaw",
																																																			params = {
																																																				{
																																																					field = "tgt"
																																																				},
																																																				{
																																																					const = 90
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
																																																					const = 12850801
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
																																										class = "Action",
																																										id = "116",
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
																																															const = false
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
																																				id = "111",
																																				properties = {
																																					{
																																						DecorateWhenChildEnds = "false"
																																					},
																																					{
																																						Weight = {
																																							const = 20
																																						}
																																					}
																																				},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "285",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Assignment",
																																										id = "284",
																																										properties = {
																																											{
																																												CastRight = "false"
																																											},
																																											{
																																												Opl = {
																																													field = "RandomYaw"
																																												}
																																											},
																																											{
																																												Opr = {
																																													func = "getRandomFloat",
																																													params = {
																																														{
																																															const = -45
																																														},
																																														{
																																															const = 45
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
																																										class = "Action",
																																										id = "282",
																																										properties = {
																																											{
																																												Method = {
																																													func = "turnToTargetAtYaw",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															field = "RandomYaw"
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
																																										class = "Action",
																																										id = "283",
																																										properties = {
																																											{
																																												Method = {
																																													func = "castSkill",
																																													params = {
																																														{
																																															field = "tgt"
																																														},
																																														{
																																															const = 12850801
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
																																		}
																																	}
																																}
																															},
																															{
																																node = {
																																	class = "Compute",
																																	id = "542",
																																	properties = {
																																		{
																																			Operator = "Add"
																																		},
																																		{
																																			Opl = {
																																				field = "happyaction"
																																			}
																																		},
																																		{
																																			Opr1 = {
																																				field = "happyaction"
																																			}
																																		},
																																		{
																																			Opr2 = {
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
																														class = "Action",
																														id = "175",
																														properties = {
																															{
																																Method = {
																																	func = "startTimer",
																																	params = {
																																		{
																																			const = "skillCd01"
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
																											id = "176",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Selector",
																														id = "177",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Condition",
																																	id = "180",
																																	properties = {
																																		{
																																			Operator = "Less"
																																		},
																																		{
																																			Opl = {
																																				func = "getTimerValue",
																																				params = {
																																					{
																																						const = "atkCd01"
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
																																	class = "Condition",
																																	id = "181",
																																	properties = {
																																		{
																																			Operator = "GreaterEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getTimerValue",
																																				params = {
																																					{
																																						const = "atkCd01"
																																					}
																																				}
																																			}
																																		},
																																		{
																																			Opr = {
																																				field = "atkCd"
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
																														class = "Selector",
																														id = "608",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Action",
																																	id = "448",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 12851001
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
																																	id = "611",
																																	properties = {
																																		{
																																			Method = {
																																				func = "castSkill",
																																				params = {
																																					{
																																						field = "tgt"
																																					},
																																					{
																																						const = 12850500
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
																												},
																												{
																													node = {
																														class = "Action",
																														id = "93",
																														properties = {
																															{
																																Method = {
																																	func = "startTimer",
																																	params = {
																																		{
																																			const = "atkCd01"
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
																														class = "Compute",
																														id = "541",
																														properties = {
																															{
																																Operator = "Add"
																															},
																															{
																																Opl = {
																																	field = "happyaction"
																																}
																															},
																															{
																																Opr1 = {
																																	field = "happyaction"
																																}
																															},
																															{
																																Opr2 = {
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
																									}
																								}
																							}
																						},
																						{
																							node = {
																								class = "IfElse",
																								id = "94",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "95",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														func = "checkIsBossAI"
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
																											id = "96",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Compute",
																														id = "98",
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
																																	const = 25
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
																														id = "99",
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
																																	const = 125
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
																											id = "97",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Compute",
																														id = "100",
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
																																	const = 25
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
																														id = "101",
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
																																	const = 125
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
																								class = "Action",
																								id = "102",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "fightCd01"
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
																		class = "DecoratorWeight",
																		id = "154",
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
																					class = "Sequence",
																					id = "554",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "561",
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
																								class = "Condition",
																								id = "555",
																								properties = {
																									{
																										Operator = "Less"
																									},
																									{
																										Opl = {
																											field = "distToTgt"
																										}
																									},
																									{
																										Opr = {
																											const = 12
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
																								id = "558",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "559",
																											properties = {
																												{
																													Operator = "Less"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "Side_Walk"
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
																											class = "Condition",
																											id = "560",
																											properties = {
																												{
																													Operator = "GreaterEqual"
																												},
																												{
																													Opl = {
																														func = "getTimerValue",
																														params = {
																															{
																																const = "Side_Walk"
																															}
																														}
																													}
																												},
																												{
																													Opr = {
																														const = 18
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
																								class = "SelectorProbability",
																								id = "562",
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
																											id = "564",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														const = 50
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "556",
																														properties = {
																															{
																																Method = {
																																	func = "sideWalk",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 4
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
																											class = "DecoratorWeight",
																											id = "563",
																											properties = {
																												{
																													DecorateWhenChildEnds = "false"
																												},
																												{
																													Weight = {
																														const = 50
																													}
																												}
																											},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "565",
																														properties = {
																															{
																																Method = {
																																	func = "sideWalk",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 4
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
																						},
																						{
																							node = {
																								class = "Action",
																								id = "557",
																								properties = {
																									{
																										Method = {
																											func = "startTimer",
																											params = {
																												{
																													const = "Side_Walk"
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

return ST_Monster_AutoCombat_Boss_Minespine
