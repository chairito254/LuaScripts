-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_NPC\\PBT_NPC_LeadPatrol_WaitPlayer.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_NPC_LeadPatrol_WaitPlayer = {
	behavior = {
		version = 5,
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_NPC/PBT_NPC_LeadPatrol_WaitPlayer",
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				name = "tLeadTargetActorId",
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Selector",
			id = "3",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Sequence",
						id = "2",
						properties = {},
						attachments = {
							{
								effector = false,
								transition = false,
								id = "11",
								precondition = true,
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
											func = "checkIsInRangeTgt2D",
											params = {
												{
													field = "tLeadTargetActorId"
												},
												{
													const = 0
												},
												{
													const = 4
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
									class = "Action",
									id = "6",
									properties = {
										{
											Method = {
												func = "turnToTarget",
												params = {
													{
														field = "tLeadTargetActorId"
													},
													{
														const = false
													},
													{
														const = 3
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
									id = "9",
									properties = {
										{
											Method = {
												func = "playSleAnimationOnce",
												params = {
													{
														const = "Emotion_Cheer_Start"
													},
													{
														const = ""
													},
													{
														const = "Emotion_Cheer_End"
													},
													{
														const = ""
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
									id = "8",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
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
						id = "7",
						properties = {},
						attachments = {},
						children = {}
					}
				}
			}
		}
	}
}

return PBT_NPC_LeadPatrol_WaitPlayer
