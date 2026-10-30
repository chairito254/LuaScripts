-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Combat_154023.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Combat_154023 = {
	behavior = {
		useForRoute = false,
		agenttype = "BotPlayerAgent",
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Combat_154023",
		version = 158,
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
				name = "Pet",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "PetId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "CheckPlayerPetId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "FirstAddBuff",
				const = 0,
				value = "0",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "448",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "438",
						class = "Action",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "SwitchPet"
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
						id = "1",
						class = "DecoratorLoop",
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
									id = "11",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "5",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "124",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentPet"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorId",
																		params = {
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
															id = "6",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentPetHpPercent"
																	}
																},
																{
																	Opr = {
																		func = "getHpPercent",
																		params = {
																			{
																				field = "tCurrentPet"
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
															id = "12",
															class = "Assignment",
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
																		const = "common"
																	}
																}
															},
															attachments = {},
															children = {}
														}
													},
													{
														node = {
															id = "115",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentEp"
																	}
																},
																{
																	Opr = {
																		func = "getEp",
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
															id = "126",
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
													}
												}
											}
										},
										{
											node = {
												id = "440",
												class = "IfElse",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "439",
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
																				const = "SwitchPet"
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
													},
													{
														node = {
															id = "445",
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
																					field = "tSwitchPetId"
																				}
																			},
																			{
																				Opr = {
																					func = "getPetActorIdByResistAndSupportTagList",
																					params = {
																						{
																							field = "tgt"
																						},
																						{
																							const = {
																								"BREAK",
																								"DPS",
																								"HEAL",
																								"SUP"
																							}
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
																		id = "458",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "456",
																					class = "Condition",
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
																					id = "486",
																					class = "DecoratorLoopUntil",
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
																							Until = "true"
																						}
																					},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "485",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "484",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "Equal"
																												},
																												{
																													Opl = {
																														field = "tSwitchPetId"
																													}
																												},
																												{
																													Opr = {
																														field = "tCurrentPet"
																													}
																												}
																											},
																											attachments = {},
																											children = {}
																										}
																									},
																									{
																										node = {
																											id = "479",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "483",
																														class = "Action",
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
																												},
																												{
																													node = {
																														id = "478",
																														class = "And",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "481",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "isInSkill",
																																				params = {
																																					{
																																						field = "tCurrentPet"
																																					},
																																					{
																																						const = 0
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
																																	id = "482",
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
																																						field = "tCurrentPet"
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
																														id = "480",
																														class = "Action",
																														properties = {
																															{
																																Method = {
																																	func = "switchPetByActorId",
																																	params = {
																																		{
																																			field = "tSwitchPetId"
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
																					id = "461",
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
																		id = "463",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "464",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								field = "FirstAddBuff"
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
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "462",
																								class = "Action",
																								properties = {
																									{
																										Method = {
																											func = "addBuff",
																											params = {
																												{
																													const = 2147110
																												},
																												{
																													const = -1
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
																								id = "467",
																								class = "Assignment",
																								properties = {
																									{
																										CastRight = "false"
																									},
																									{
																										Opl = {
																											field = "FirstAddBuff"
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
																						}
																					}
																				}
																			},
																			{
																				node = {
																					id = "468",
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
																		id = "487",
																		class = "Action",
																		properties = {
																			{
																				Method = {
																					func = "startTimer",
																					params = {
																						{
																							const = "SwitchPet"
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
															id = "442",
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
												id = "247",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "248",
															class = "Assignment",
															properties = {
																{
																	CastRight = "false"
																},
																{
																	Opl = {
																		field = "tCurrentPet"
																	}
																},
																{
																	Opr = {
																		func = "getPetActorId",
																		params = {
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
															id = "240",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "245",
																		class = "Condition",
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
																},
																{
																	node = {
																		id = "243",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "244",
																					class = "Action",
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
																					id = "242",
																					class = "Sequence",
																					properties = {},
																					attachments = {
																						{
																							precondition = true,
																							transition = false,
																							id = "155",
																							effector = false,
																							class = "Precondition",
																							properties = {
																								{
																									BinaryOperator = "And"
																								},
																								{
																									Operator = "GreaterEqual"
																								},
																								{
																									Opl = {
																										func = "getHpPercent",
																										params = {
																											{
																												field = "tCurrentPet"
																											}
																										}
																									}
																								},
																								{
																									Opr2 = {
																										const = 0.2
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
																								id = "444",
																								class = "Action",
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
																		id = "246",
																		class = "Sequence",
																		properties = {},
																		attachments = {
																			{
																				precondition = true,
																				transition = false,
																				id = "155",
																				effector = false,
																				class = "Precondition",
																				properties = {
																					{
																						BinaryOperator = "And"
																					},
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
																						Opr2 = {
																							const = false
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
																					id = "241",
																					class = "Action",
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
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

return PBT_BotPlayer_Combat_154023
