-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Pet_Back.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_Back = {
	behavior = {
		version = 21,
		agenttype = "PetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Pet_Back",
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				type = "float",
				name = "tInWaterDepth",
				value = "0"
			},
			{
				const = 0,
				type = "float",
				name = "tCurrentDistToMaster",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "69",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "71",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showMasterBubble",
									params = {
										{
											const = "back"
										},
										{
											const = 1
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
						id = "70",
						class = "Action",
						properties = {
							{
								Method = {
									func = "teleportToTargetSide",
									params = {
										{
											field = "masterId"
										},
										{
											const = 0
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
								ResultResumeOption = "BT_ResumeSelf"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "66",
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
						attachments = {
							{
								transition = false,
								id = "67",
								class = "Precondition",
								effector = false,
								precondition = true,
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "Equal"
									},
									{
										Opl = {
											func = "hasAITag",
											params = {
												{
													field = "selfId"
												},
												{
													const = "TA_PetEnterBack"
												}
											}
										}
									},
									{
										Opr2 = {
											const = true
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
									id = "68",
									class = "Action",
									properties = {
										{
											Method = {
												func = "followEntity",
												params = {
													{
														field = "masterId"
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
	}
}

return PBT_Pet_Back
