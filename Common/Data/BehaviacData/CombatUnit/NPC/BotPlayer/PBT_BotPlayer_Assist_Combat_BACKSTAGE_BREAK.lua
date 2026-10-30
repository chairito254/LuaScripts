-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK = {
	behavior = {
		useForRoute = false,
		agenttype = "BotPlayerAgent",
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK",
		version = 114,
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tCurrentPet"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tCurrentPetHpPercent"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tSwitchPetId"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tTargetSkillId"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tCurrentEp"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tTeammateId1"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tTeammateId2"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tTeammateId3"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tCurrentBreakPercent"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tCurrentSp"
			},
			{
				value = "0",
				const = 0,
				type = "int",
				name = "tSupportSkillId"
			},
			{
				value = "0",
				const = 0,
				type = "float",
				name = "tMaxSkillDist"
			}
		},
		attachments = {},
		node = {
			id = "367",
			class = "Sequence",
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
						id = "393",
						class = "Condition",
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
						id = "462",
						class = "Condition",
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
											const = "BREAK"
										},
										{
											const = 0
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
						id = "460",
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
									const = "Tactics_SupportSkill_BREAK"
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
						class = "Condition",
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
											const = "BREAK"
										},
										{
											const = 0
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
						id = "480",
						class = "Assignment",
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
											const = "BREAK"
										},
										{
											const = 0
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
						id = "482",
						class = "Condition",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tSupportSkillId"
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
						id = "478",
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
												id = "465",
												class = "Assignment",
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
												id = "469",
												class = "Sequence",
												properties = {},
												attachments = {
													{
														effector = false,
														id = "474",
														transition = false,
														class = "Precondition",
														precondition = true,
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
															id = "475",
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
									id = "486",
									class = "Sequence",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "487",
												class = "Condition",
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
												id = "470",
												class = "Action",
												properties = {
													{
														Method = {
															func = "tryCommandPetCastSupportSkill",
															params = {
																{
																	const = "BREAK"
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

return PBT_BotPlayer_Assist_Combat_BACKSTAGE_BREAK
