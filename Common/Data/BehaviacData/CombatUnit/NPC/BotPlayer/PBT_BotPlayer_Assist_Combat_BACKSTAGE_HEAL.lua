-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\NPC\\BotPlayer\\PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL = {
	behavior = {
		version = 102,
		name = "CombatUnit/NPC/BotPlayer/PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL",
		agenttype = "BotPlayerAgent",
		useForRoute = false,
		properties = {},
		pars = {
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tCurrentPet"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tCurrentPetHpPercent"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tSwitchPetId"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tTargetSkillId"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tCurrentEp"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tTeammateId1"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tTeammateId2"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tTeammateId3"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tCurrentBreakPercent"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tCurrentSp"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tSupportSkillId"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tMaxSkillDist"
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
						class = "Selector",
						id = "368",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "369",
									properties = {
										{
											Operator = "LessEqual"
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
									class = "Or",
									id = "370",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "371",
												properties = {
													{
														Operator = "LessEqual"
													},
													{
														Opl = {
															func = "getHpPercent",
															params = {
																{
																	field = "tTeammateId1"
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
												id = "365",
												properties = {
													{
														Operator = "LessEqual"
													},
													{
														Opl = {
															func = "getHpPercent",
															params = {
																{
																	field = "tTeammateId2"
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
												id = "366",
												properties = {
													{
														Operator = "LessEqual"
													},
													{
														Opl = {
															func = "getHpPercent",
															params = {
																{
																	field = "tTeammateId3"
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
						id = "385",
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
											const = "HEAL"
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
						id = "394",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "387",
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
														const = "HEAL"
													},
													{
														const = 2
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
									id = "389",
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
														const = "HEAL"
													},
													{
														const = 3
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
						id = "386",
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
									const = "Tactics_SupportSkill"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Or",
						id = "390",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "391",
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
														const = "HEAL"
													},
													{
														const = 2
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
									class = "Condition",
									id = "392",
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
														const = "HEAL"
													},
													{
														const = 3
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
							}
						}
					}
				},
				{
					node = {
						class = "Selector",
						id = "364",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "363",
									properties = {
										{
											Method = {
												func = "tryCommandPetCastSupportSkill",
												params = {
													{
														const = "HEAL"
													},
													{
														const = 2
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
									id = "372",
									properties = {
										{
											Method = {
												func = "tryCommandPetCastSupportSkill",
												params = {
													{
														const = "HEAL"
													},
													{
														const = 3
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

return PBT_BotPlayer_Assist_Combat_BACKSTAGE_HEAL
