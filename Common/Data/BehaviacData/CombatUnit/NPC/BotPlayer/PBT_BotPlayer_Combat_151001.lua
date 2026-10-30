-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Combat_151001.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Combat_151001 = {
	behavior = {
		useForRoute = false,
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Combat_151001",
		version = 291,
		agenttype = "BotPlayerAgent",
		properties = {},
		pars = {
			{
				const = 0,
				name = "tCurrentPet",
				type = "int",
				value = "0"
			},
			{
				const = 0,
				name = "tCurrentPetHpPercent",
				type = "float",
				value = "0"
			},
			{
				const = 0,
				name = "tSwitchPetId",
				type = "int",
				value = "0"
			},
			{
				const = 0,
				name = "tTargetSkillId",
				type = "int",
				value = "0"
			},
			{
				const = 0,
				name = "tCurrentEp",
				type = "float",
				value = "0"
			},
			{
				const = 0,
				name = "tRandomInt",
				type = "int",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "464",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
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
												id = "415",
												class = "Condition",
												properties = {
													{
														Operator = "NotEqual"
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
												id = "470",
												class = "Selector",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "471",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "473",
																		class = "Sequence",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "472",
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
																								func = "getPetActorIdByFunctionIdFromPetList",
																								params = {
																									{
																										const = "DPS"
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
																					id = "474",
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
																			}
																		}
																	}
																},
																{
																	node = {
																		id = "375",
																		class = "Selector",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "376",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "382",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
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
																														field = "tSwitchPetId"
																													}
																												},
																												{
																													Opr = {
																														func = "getPetActorIdByFunctionIdFromPetList",
																														params = {
																															{
																																const = "DPS"
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
																											id = "381",
																											class = "Condition",
																											properties = {
																												{
																													Operator = "NotEqual"
																												},
																												{
																													Opl = {
																														func = "checkTargetHasBuffById",
																														params = {
																															{
																																field = "tSwitchPetId"
																															},
																															{
																																const = 912120104
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
																								id = "4",
																								class = "Selector",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "291",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "297",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "292",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "LessEqual"
																																		},
																																		{
																																			Opl = {
																																				field = "tCurrentPetHpPercent"
																																			}
																																		},
																																		{
																																			Opr = {
																																				const = 0.6
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
																																				func = "getPetActorIdByFunctionIdFromPetList",
																																				params = {
																																					{
																																						const = "HEAL"
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
																																	id = "295",
																																	class = "Selector",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "298",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "NotEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getSkillIdByFeature",
																																							params = {
																																								{
																																									const = 2
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
																																									field = "tSwitchPetId"
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
																																				id = "296",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "NotEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getSkillIdByFeature",
																																							params = {
																																								{
																																									const = 3
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
																																									field = "tSwitchPetId"
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
																															}
																														}
																													}
																												},
																												{
																													node = {
																														id = "299",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
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
																																				field = "combatTactic"
																																			}
																																		},
																																		{
																																			Opr = {
																																				const = "Tactics_HEAL"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "544",
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
																																				id = "542",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "543",
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
																																							id = "536",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "540",
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
																																										id = "541",
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
																																													id = "539",
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
																																										id = "537",
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
																															}
																														}
																													}
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "94",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "88",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "235",
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
																																				func = "getPetActorIdByFunctionIdFromPetList",
																																				params = {
																																					{
																																						const = "ENERGY"
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
																																	id = "303",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "NotEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getSkillIdByFeature",
																																				params = {
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
																																						const = false
																																					},
																																					{
																																						field = "tSwitchPetId"
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
																														id = "100",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "95",
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
																																				const = "Tactics_ENERGY"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "553",
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
																																				id = "551",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "552",
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
																																							id = "545",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "549",
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
																																										id = "550",
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
																																													id = "548",
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
																																										id = "546",
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
																															}
																														}
																													}
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "448",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "238",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "239",
																																	class = "Sequence",
																																	properties = {},
																																	attachments = {},
																																	children = {
																																		{
																																			node = {
																																				id = "413",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Greater"
																																					},
																																					{
																																						Opl = {
																																							field = "tCurrentEp"
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
																																		},
																																		{
																																			node = {
																																				id = "465",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "458",
																																							class = "Condition",
																																							properties = {
																																								{
																																									Operator = "NotEqual"
																																								},
																																								{
																																									Opl = {
																																										field = "combatTactic"
																																									}
																																								},
																																								{
																																									Opr = {
																																										const = "Tactics_STORE"
																																									}
																																								}
																																							},
																																							attachments = {},
																																							children = {}
																																						}
																																					},
																																					{
																																						node = {
																																							id = "466",
																																							class = "Condition",
																																							properties = {
																																								{
																																									Operator = "Equal"
																																								},
																																								{
																																									Opl = {
																																										func = "getPetActorIdByFunctionIdFromPetList",
																																										params = {
																																											{
																																												const = "ENERGY"
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
																																				id = "252",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "Less"
																																					},
																																					{
																																						Opl = {
																																							func = "getCreationCountByTemplateId",
																																							params = {
																																								{
																																									field = "tCurrentPet"
																																								},
																																								{
																																									const = 10
																																								},
																																								{
																																									const = 123203
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
																																				id = "242",
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
																																							func = "getPetActorIdByFunctionIdFromPetList",
																																							params = {
																																								{
																																									const = "HEAL"
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
																																				id = "244",
																																				class = "Condition",
																																				properties = {
																																					{
																																						Operator = "NotEqual"
																																					},
																																					{
																																						Opl = {
																																							func = "getSkillIdByFeature",
																																							params = {
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
																																									const = false
																																								},
																																								{
																																									field = "tSwitchPetId"
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
																																	id = "245",
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
																																				const = "Tactics_Butterfly"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "562",
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
																																				id = "560",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "561",
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
																																							id = "554",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "558",
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
																																										id = "559",
																																										class = "And",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "556",
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
																																													id = "557",
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
																																										id = "555",
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
																															}
																														}
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
																																	id = "449",
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
																																	id = "468",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "NotEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getPetActorIdByFunctionIdFromPetList",
																																				params = {
																																					{
																																						const = "DPS"
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
																																	id = "457",
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
																																				const = "Tactics_STORE"
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
																																				func = "getPetActorIdByFunctionIdFromPetList",
																																				params = {
																																					{
																																						const = "DPS"
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
																																	id = "571",
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
																																				id = "569",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "570",
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
																																							id = "563",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "567",
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
																																										id = "568",
																																										class = "And",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "565",
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
																																													id = "566",
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
																																										id = "564",
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
																															}
																														}
																													}
																												}
																											}
																										}
																									},
																									{
																										node = {
																											id = "343",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "341",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "339",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "GreaterEqual"
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
																																						field = "tCurrentPet"
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
																																	id = "350",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "isOnGrass",
																																				params = {
																																					{
																																						field = "tgt"
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
																																	id = "441",
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
																																				func = "getPetActorIdByFunctionIdFromPetList",
																																				params = {
																																					{
																																						const = "DPS"
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
																																	id = "442",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "Equal"
																																		},
																																		{
																																			Opl = {
																																				func = "getSkillIdByFeature",
																																				params = {
																																					{
																																						const = 14
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
																																						field = "tSwitchPetId"
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
																																	id = "383",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "GreaterEqual"
																																		},
																																		{
																																			Opl = {
																																				field = "tCurrentEp"
																																			}
																																		},
																																		{
																																			Opr = {
																																				const = 60
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "347",
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
																																				func = "getPetActorIdByFunctionIdFromPetList",
																																				params = {
																																					{
																																						const = "ENERGY"
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
																																	id = "346",
																																	class = "Condition",
																																	properties = {
																																		{
																																			Operator = "NotEqual"
																																		},
																																		{
																																			Opl = {
																																				func = "getSkillIdByFeature",
																																				params = {
																																					{
																																						const = 1
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
																																						field = "tSwitchPetId"
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
																														id = "344",
																														class = "Sequence",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "348",
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
																																				const = "Tactics_Control"
																																			}
																																		}
																																	},
																																	attachments = {},
																																	children = {}
																																}
																															},
																															{
																																node = {
																																	id = "580",
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
																																				id = "578",
																																				class = "Selector",
																																				properties = {},
																																				attachments = {},
																																				children = {
																																					{
																																						node = {
																																							id = "579",
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
																																							id = "572",
																																							class = "Sequence",
																																							properties = {},
																																							attachments = {},
																																							children = {
																																								{
																																									node = {
																																										id = "576",
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
																																										id = "577",
																																										class = "And",
																																										properties = {},
																																										attachments = {},
																																										children = {
																																											{
																																												node = {
																																													id = "574",
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
																																													id = "575",
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
																																										id = "573",
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
																															}
																														}
																													}
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
																					id = "75",
																					class = "Sequence",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "73",
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
																											func = "getPetActorIdByFunctionIdFromPetList",
																											params = {
																												{
																													const = "DPS"
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
																								id = "417",
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
																											id = "416",
																											class = "Sequence",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "418",
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
																														id = "494",
																														class = "And",
																														properties = {},
																														attachments = {},
																														children = {
																															{
																																node = {
																																	id = "495",
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
																																	id = "496",
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
																														id = "67",
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
																					id = "125",
																					class = "Noop",
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
															id = "484",
															class = "Sequence",
															properties = {},
															attachments = {},
															children = {
																{
																	node = {
																		id = "480",
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
																					id = "481",
																					class = "DecoratorWeight",
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
																								id = "475",
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
																											func = "getPetActorIdByFunctionIdFromPetList",
																											params = {
																												{
																													const = "ENERGY"
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
																					id = "482",
																					class = "DecoratorWeight",
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
																								id = "483",
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
																											func = "getPetActorIdByFunctionIdFromPetList",
																											params = {
																												{
																													const = "HEAL"
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
																			}
																		}
																	}
																},
																{
																	node = {
																		id = "535",
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
																					id = "533",
																					class = "Selector",
																					properties = {},
																					attachments = {},
																					children = {
																						{
																							node = {
																								id = "534",
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
																								id = "527",
																								class = "Sequence",
																								properties = {},
																								attachments = {},
																								children = {
																									{
																										node = {
																											id = "531",
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
																											id = "532",
																											class = "And",
																											properties = {},
																											attachments = {},
																											children = {
																												{
																													node = {
																														id = "529",
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
																														id = "530",
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
																											id = "528",
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
																}
															}
														}
													}
												}
											}
										},
										{
											node = {
												id = "336",
												class = "Sequence",
												properties = {},
												attachments = {},
												children = {
													{
														node = {
															id = "335",
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
															id = "334",
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
													}
												}
											}
										},
										{
											node = {
												id = "265",
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
															id = "268",
															class = "Sequence",
															properties = {},
															attachments = {
																{
																	transition = false,
																	effector = false,
																	precondition = true,
																	id = "440",
																	class = "Precondition",
																	properties = {
																		{
																			BinaryOperator = "And"
																		},
																		{
																			Operator = "LessEqual"
																		},
																		{
																			Opl = {
																				func = "getEp",
																				params = {
																					{
																						field = "tCurrentPet"
																					}
																				}
																			}
																		},
																		{
																			Opr2 = {
																				const = 40
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
																		id = "269",
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
																		id = "267",
																		class = "Sequence",
																		properties = {},
																		attachments = {
																			{
																				transition = false,
																				effector = false,
																				precondition = true,
																				id = "155",
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
																					id = "264",
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
															id = "444",
															class = "IfElse",
															properties = {},
															attachments = {},
															children = {
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
																					func = "checkTargetIsFunctionId",
																					params = {
																						{
																							field = "tCurrentPet"
																						},
																						{
																							const = "ENERGY"
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
																		id = "489",
																		class = "IfElse",
																		properties = {},
																		attachments = {},
																		children = {
																			{
																				node = {
																					id = "487",
																					class = "Condition",
																					properties = {
																						{
																							Operator = "Equal"
																						},
																						{
																							Opl = {
																								field = "combatTactic"
																							}
																						},
																						{
																							Opr = {
																								const = "Tactics_Control"
																							}
																						}
																					},
																					attachments = {},
																					children = {}
																				}
																			},
																			{
																				node = {
																					id = "490",
																					class = "Sequence",
																					properties = {},
																					attachments = {
																						{
																							transition = false,
																							effector = false,
																							precondition = true,
																							id = "155",
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
																						},
																						{
																							transition = false,
																							effector = false,
																							precondition = true,
																							id = "361",
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
																												const = 10081
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
																								id = "486",
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
																			},
																			{
																				node = {
																					id = "488",
																					class = "Sequence",
																					properties = {},
																					attachments = {
																						{
																							transition = false,
																							effector = false,
																							precondition = true,
																							id = "155",
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
																						},
																						{
																							transition = false,
																							effector = false,
																							precondition = true,
																							id = "361",
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
																												const = 10081
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
																						},
																						{
																							transition = false,
																							effector = false,
																							precondition = true,
																							id = "372",
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
																												field = "tCurrentPet"
																											},
																											{
																												const = 2104502
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
																								id = "485",
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
																		id = "446",
																		class = "Sequence",
																		properties = {},
																		attachments = {
																			{
																				transition = false,
																				effector = false,
																				precondition = true,
																				id = "155",
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
																			},
																			{
																				transition = false,
																				effector = false,
																				precondition = true,
																				id = "361",
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
																									const = 10081
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
																			},
																			{
																				transition = false,
																				effector = false,
																				precondition = true,
																				id = "322",
																				class = "Precondition",
																				properties = {
																					{
																						BinaryOperator = "And"
																					},
																					{
																						Operator = "Less"
																					},
																					{
																						Opl = {
																							func = "getCreationCountByTemplateId",
																							params = {
																								{
																									field = "tCurrentPet"
																								},
																								{
																									const = 10
																								},
																								{
																									const = 123203
																								}
																							}
																						}
																					},
																					{
																						Opr2 = {
																							const = 2
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
																					id = "445",
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

return PBT_BotPlayer_Combat_151001
