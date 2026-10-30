-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Pet_Command_MasterSelfieMode.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_Command_MasterSelfieMode = {
	behavior = {
		version = 6,
		useForRoute = false,
		agenttype = "PetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Pet_Command_MasterSelfieMode",
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
						id = "2",
						class = "DecoratorAlwaysRunning",
						properties = {
							{
								DecorateWhenChildEnds = "false"
							}
						},
						attachments = {
							{
								id = "3",
								transition = false,
								effector = false,
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
											func = "masterIsInSelfieMode"
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
								id = "4",
								transition = false,
								effector = false,
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
									id = "5",
									class = "Action",
									properties = {
										{
											Method = {
												func = "petMoveWithMasterSelfieMode",
												params = {
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

return PBT_Pet_Command_MasterSelfieMode
