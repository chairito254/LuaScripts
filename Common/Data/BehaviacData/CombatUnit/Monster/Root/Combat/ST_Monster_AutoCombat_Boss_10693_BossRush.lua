-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Boss_10693_BossRush.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_10693_BossRush = {
	behavior = {
		version = 103,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Boss_10693_BossRush",
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				value = "0",
				type = "int",
				name = "tSkill_ComboAttack",
				const = 0
			},
			{
				value = "0",
				type = "float",
				name = "skillStopDist",
				const = 0
			},
			{
				value = "0",
				type = "int",
				name = "tPlayer",
				const = 0
			},
			{
				value = "0",
				type = "int",
				name = "FirstAbsorb",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "609",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "657",
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
						class = "Sequence",
						id = "651",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Assignment",
									id = "652",
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
									class = "Action",
									id = "654",
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
									class = "Action",
									id = "655",
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
									class = "Action",
									id = "661",
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
									class = "DecoratorLoop",
									id = "653",
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
												id = "712",
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
															id = "630",
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
															class = "Selector",
															id = "619",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		class = "Sequence",
																		id = "713",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					class = "Condition",
																					id = "642",
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
																					class = "Sequence",
																					id = "618",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Assignment",
																								id = "656",
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
																								id = "612",
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
																					class = "IfElse",
																					id = "617",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								class = "Condition",
																								id = "613",
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
																								class = "SelectorProbability",
																								id = "644",
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
																											id = "616",
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
																														class = "Selector",
																														id = "699",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "701",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "702",
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
																																				class = "Action",
																																				id = "700",
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
																																				class = "Action",
																																				id = "698",
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
																																				class = "Action",
																																				id = "697",
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
																																	class = "Sequence",
																																	id = "643",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Action",
																																				id = "641",
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
																																				class = "Action",
																																				id = "664",
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
																											class = "DecoratorWeight",
																											id = "645",
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
																														class = "Selector",
																														id = "705",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	class = "Sequence",
																																	id = "707",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				class = "Condition",
																																				id = "708",
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
																																				class = "Action",
																																				id = "706",
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
																																				class = "Action",
																																				id = "704",
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
																																				class = "Action",
																																				id = "703",
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
																																	class = "Sequence",
																																	id = "640",
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
																																				class = "Action",
																																				id = "665",
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
																								class = "IfElse",
																								id = "620",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "621",
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
																											class = "IfElse",
																											id = "626",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "627",
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
																														class = "Sequence",
																														id = "666",
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
																																	class = "Action",
																																	id = "667",
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
																														class = "SelectorProbability",
																														id = "716",
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
																																	id = "622",
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
																																				class = "Selector",
																																				id = "615",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "677",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "680",
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
																																										class = "Action",
																																										id = "679",
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
																																										class = "Action",
																																										id = "676",
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
																																										class = "Action",
																																										id = "639",
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
																																							class = "Sequence",
																																							id = "669",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Action",
																																										id = "623",
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
																																										class = "Action",
																																										id = "668",
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
																																	class = "DecoratorWeight",
																																	id = "635",
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
																																				class = "Selector",
																																				id = "684",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Sequence",
																																							id = "685",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Condition",
																																										id = "678",
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
																																										class = "Action",
																																										id = "683",
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
																																										class = "Action",
																																										id = "682",
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
																																										class = "Action",
																																										id = "681",
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
																																							class = "Sequence",
																																							id = "670",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										class = "Action",
																																										id = "636",
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
																																										class = "Action",
																																										id = "671",
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
																											class = "IfElse",
																											id = "715",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Condition",
																														id = "709",
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
																														class = "SelectorProbability",
																														id = "710",
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
																																	id = "692",
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
																																				id = "691",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "694",
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
																																							class = "Action",
																																							id = "696",
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
																																							class = "Action",
																																							id = "693",
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
																																	class = "DecoratorWeight",
																																	id = "695",
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
																																				id = "674",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "673",
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
																																							class = "Action",
																																							id = "675",
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
																														class = "SelectorProbability",
																														id = "711",
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
																																	id = "689",
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
																																				id = "690",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "687",
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
																																							class = "Action",
																																							id = "686",
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
																																	class = "DecoratorWeight",
																																	id = "688",
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
																																				id = "625",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							class = "Action",
																																							id = "624",
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
																																							class = "Action",
																																							id = "672",
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
																		class = "SelectorProbability",
																		id = "714",
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
																					id = "628",
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
																								class = "Sequence",
																								id = "638",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Action",
																											id = "631",
																											properties = {
																												{
																													Method = {
																														func = "playAction",
																														params = {
																															{
																																const = "Behav_Angry"
																															},
																															{
																																const = 1
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
																					id = "629",
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
																								class = "IfElse",
																								id = "632",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "633",
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
																											class = "Sequence",
																											id = "646",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														class = "Action",
																														id = "647",
																														properties = {
																															{
																																Method = {
																																	func = "sideWalk",
																																	params = {
																																		{
																																			field = "tgt"
																																		},
																																		{
																																			const = 1
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
																											class = "Action",
																											id = "634",
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
																					class = "DecoratorWeight",
																					id = "663",
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
																								id = "649",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											class = "Condition",
																											id = "660",
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
																											class = "Action",
																											id = "648",
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
																									},
																									{
																										node = {
																											class = "Action",
																											id = "650",
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
																											class = "Action",
																											id = "662",
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

return ST_Monster_AutoCombat_Boss_10693_BossRush
