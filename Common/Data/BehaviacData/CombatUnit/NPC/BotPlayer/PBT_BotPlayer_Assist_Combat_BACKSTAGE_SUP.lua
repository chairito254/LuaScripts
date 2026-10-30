-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP = {
	behavior = {
		agenttype = "BotPlayerAgent",
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP",
		version = 110,
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tCurrentPet",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tCurrentPetHpPercent",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tSwitchPetId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tTargetSkillId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tCurrentEp",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tTeammateId1",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tTeammateId2",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tTeammateId3",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tCurrentBreakPercent",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tCurrentSp",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "IsNegative",
				const = false,
				value = "false",
				type = "bool"
			},
			{
				name = "tMaxSkillDist",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tSupportSkillId",
				const = 0,
				value = "0",
				type = "int"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "367",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Or",
						id = "391",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "383",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkTargetIsFunctionId",
												params = {
													{
														field = "tCurrentPet"
													},
													{
														const = "BREAK"
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
									id = "392",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkTargetIsFunctionId",
												params = {
													{
														field = "tCurrentPet"
													},
													{
														const = "DPS"
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
						class = "Selector",
						id = "388",
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
												func = "checkTargetHasBuffTag",
												params = {
													{
														field = "tCurrentPet"
													},
													{
														const = "Positive"
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
									class = "Selector",
									id = "408",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "386",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "385",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "checkTargetHasBuffTag",
																		params = {
																			{
																				field = "tCurrentPet"
																			},
																			{
																				const = "Positive"
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
															class = "Assignment",
															id = "389",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tSwitchPetId"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "SUP"
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
															id = "390",
															properties = {
																{
																	Operator = "NotEqual"
																},
																{
																	Opl = {
																		field = "tSwitchPetId"
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
															id = "382",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "checkTargetHasBuffFromSource",
																		params = {
																			{
																				field = "tCurrentPet"
																			},
																			{
																				const = "Positive"
																			},
																			{
																				field = "tSwitchPetId"
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
													}
												}
											}
										},
										{
											node = {
												class = "Sequence",
												id = "412",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "407",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "checkTargetHasBuffFromSource",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				const = "Negative"
																			},
																			{
																				field = "selfId"
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
															class = "Assignment",
															id = "410",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tSwitchPetId"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorIdByFunctionIdFromPetList",
																		params = {
																			{
																				const = "SUP"
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
															id = "411",
															properties = {
																{
																	Operator = "NotEqual"
																},
																{
																	Opl = {
																		field = "tSwitchPetId"
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
															id = "409",
															properties = {
																{
																	Operator = "Equal"
																},
																{
																	Opl = {
																		func = "checkTargetHasBuffFromSource",
																		params = {
																			{
																				field = "tgt"
																			},
																			{
																				const = "Negative"
																			},
																			{
																				field = "tSwitchPetId"
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
						class = "Condition",
						id = "402",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									func = "checkTargetIsFunctionId",
									params = {
										{
											field = "tCurrentPet"
										},
										{
											const = "SUP"
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
						class = "Selector",
						id = "413",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "404",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkSupportSkillCanCast",
												params = {
													{
														const = 0
													},
													{
														const = "SUP"
													},
													{
														const = 6
													},
													{
														const = true
													},
													{
														const = false
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
									id = "414",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkSupportSkillCanCast",
												params = {
													{
														const = 0
													},
													{
														const = "SUP"
													},
													{
														const = 7
													},
													{
														const = true
													},
													{
														const = false
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
						class = "Assignment",
						id = "403",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "combatTactic"
								}
							},
							{
								Opr = {
									const = "Tactics_SupportSkill_SUP"
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
						id = "415",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "405",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkSupportSkillCanCast",
												params = {
													{
														const = 0
													},
													{
														const = "SUP"
													},
													{
														const = 6
													},
													{
														const = true
													},
													{
														const = true
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
									id = "427",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "416",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkSupportSkillCanCast",
															params = {
																{
																	const = 0
																},
																{
																	const = "SUP"
																},
																{
																	const = 7
																},
																{
																	const = true
																},
																{
																	const = true
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
												class = "Assignment",
												id = "428",
												properties = {
													{
														CastRight = "false"
													},
													{
														Opl = {
															field = "IsNegative"
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
							}
						}
					}
				},
				{
					node = {
						class = "IfElse",
						id = "429",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "430",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												field = "IsNegative"
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
									class = "Selector",
									id = "417",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Sequence",
												id = "425",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Assignment",
															id = "432",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tSupportSkillId"
																	}
																},
																{
																	Opr = {
																		func = "getCanCastSupportSkillId",
																		params = {
																			{
																				const = 0
																			},
																			{
																				const = "SUP"
																			},
																			{
																				const = 7
																			},
																			{
																				const = true
																			},
																			{
																				const = true
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
															id = "423",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tMaxSkillDist"
																	}
																},
																{
																	Opr = {
																		func = "getMaxSkillDist",
																		params = {
																			{
																				field = "tSupportSkillId"
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
															id = "424",
															properties = {},
															attachments = {
																{
																	class = "Precondition",
																	transition = false,
																	effector = false,
																	precondition = true,
																	id = "474",
																	properties = {
																		{
																			BinaryOperator = "And"
																		},
																		{
																			Operator = "Greater"
																		},
																		{
																			Opl = {
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
																		},
																		{
																			Opr2 = {
																				field = "tMaxSkillDist"
																			}
																		},
																		{
																			Phase = "Both"
																		}
																	}
																}
															},
															children = {
																{
																	node = {
																		class = "Action",
																		id = "426",
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
												id = "434",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															class = "Condition",
															id = "433",
															properties = {
																{
																	Operator = "LessEqual"
																},
																{
																	Opl = {
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
																},
																{
																	Opr = {
																		field = "tMaxSkillDist"
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
															id = "418",
															properties = {
																{
																	Method = {
																		func = "tryCommandPetCastSupportSkill",
																		params = {
																			{
																				const = "SUP"
																			},
																			{
																				const = 7
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
									class = "Action",
									id = "381",
									properties = {
										{
											Method = {
												func = "tryCommandPetCastSupportSkill",
												params = {
													{
														const = "SUP"
													},
													{
														const = 6
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

return PBT_BotPlayer_Assist_Combat_BACKSTAGE_SUP
