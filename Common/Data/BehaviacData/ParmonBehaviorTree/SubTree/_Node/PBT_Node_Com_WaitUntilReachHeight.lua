-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_WaitUntilReachHeight.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_WaitUntilReachHeight = {
	behavior = {
		useForRoute = true,
		version = 15,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_WaitUntilReachHeight",
		properties = {},
		pars = {
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tHeight"
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tTempPosY"
			},
			{
				type = "float",
				value = "30",
				const = 30,
				name = "tTimeout"
			}
		},
		attachments = {},
		node = {
			id = "12",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "13",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tTempPosY"
								}
							},
							{
								Opr = {
									func = "getPositionYRelativeToGround",
									params = {
										{
											field = "selfId"
										},
										{
											field = "tHeight"
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
						id = "19",
						class = "Action",
						properties = {
							{
								Method = {
									func = "startTimer",
									params = {
										{
											const = "timeout"
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
						id = "21",
						class = "Sequence",
						properties = {},
						attachments = {
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "22",
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
											func = "getTimerValue",
											params = {
												{
													const = "timeout"
												}
											}
										}
									},
									{
										Opr2 = {
											field = "tTimeout"
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
									id = "14",
									class = "Selector",
									properties = {},
									attachments = {},
									children = {
										{
											node = {
												id = "15",
												class = "DecoratorAlwaysRunning",
												properties = {
													{
														DecorateWhenChildEnds = "false"
													}
												},
												attachments = {
													{
														transition = false,
														effector = false,
														precondition = true,
														id = "16",
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
																	func = "getPositionY",
																	params = {
																		{
																			field = "selfId"
																		}
																	}
																}
															},
															{
																Opr2 = {
																	field = "tTempPosY"
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
															id = "17",
															class = "Action",
															properties = {
																{
																	Method = {
																		func = "waitTime",
																		params = {
																			{
																				const = 9999
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
												id = "18",
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
				}
			}
		}
	}
}

return PBT_Node_Com_WaitUntilReachHeight
