-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_AutoCombat_Assist_KeepDis.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_AutoCombat_Assist_KeepDis = {
	behavior = {
		version = 33,
		useForRoute = false,
		agenttype = "PetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_AutoCombat_Assist_KeepDis",
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
				name = "CurrentDistToTarget",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "CurrentBoxDistToTarget",
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "25",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Condition",
						id = "26",
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
						id = "27",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									func = "isGoBackCd"
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
						id = "14",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Condition",
									id = "35",
									properties = {
										{
											Operator = "NotEqual"
										},
										{
											Opl = {
												func = "checkCharacterState",
												params = {
													{
														const = "SPECIALDEFENSE"
													},
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
									class = "And",
									id = "67",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "36",
												properties = {
													{
														Operator = "NotEqual"
													},
													{
														Opl = {
															func = "checkNormalAttackByTags",
															params = {
																{
																	field = "selfId"
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
												class = "Condition",
												id = "68",
												properties = {
													{
														Operator = "Equal"
													},
													{
														Opl = {
															func = "checkIsBreakST",
															params = {
																{
																	field = "tgt"
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
									class = "Compute",
									id = "15",
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
									id = "16",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												class = "Condition",
												id = "18",
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
												id = "17",
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
												id = "19",
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
									class = "ReferencedBehavior",
									id = "65",
									properties = {
										{
											ReferenceBehavior = {
												const = "PBT_AutoCombat_NormalAtkCombo"
											}
										},
										{
											subTreeProperties = {
												{
													Type = "Self",
													Name = "CurrentDistToTarget",
													Value = {
														field = "CurrentDistToTarget"
													}
												},
												{
													Type = "Self",
													Name = "CurrentBoxDistToTarget",
													Value = {
														field = "CurrentBoxDistToTarget"
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
	}
}

return PBT_AutoCombat_Assist_KeepDis
