-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Pet_Command_MasterCrouchAndCatchMode.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_Command_MasterCrouchAndCatchMode = {
	behavior = {
		useForRoute = false,
		version = 5,
		agenttype = "PetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Pet_Command_MasterCrouchAndCatchMode",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "4",
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
								id = "6",
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
											func = "masterIsInCrouch"
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
							},
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "7",
								class = "Precondition",
								properties = {
									{
										BinaryOperator = "Or"
									},
									{
										Operator = "Equal"
									},
									{
										Opl = {
											func = "masterIsInCatchMode"
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
							},
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "11",
								class = "Precondition",
								properties = {
									{
										BinaryOperator = "Or"
									},
									{
										Operator = "Equal"
									},
									{
										Opl = {
											func = "masterIsInMagnesisMode"
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
							},
							{
								transition = false,
								effector = false,
								precondition = true,
								id = "5",
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
											func = "isInCombat",
											params = {
												{
													const = 0
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
									id = "10",
									class = "Action",
									properties = {
										{
											Method = {
												func = "petMoveWithMasterCrouchAndCatchMode",
												params = {
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Slow
													},
													{
														const = 0
													},
													{
														const = BaseEnum.SpeedRateType.Mid
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

return PBT_Pet_Command_MasterCrouchAndCatchMode
