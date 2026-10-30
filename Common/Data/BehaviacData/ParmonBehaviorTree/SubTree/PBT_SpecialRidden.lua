-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SpecialRidden.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SpecialRidden = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_SpecialRidden",
		version = 11,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0:",
				name = "tFlyCenterPos",
				type = "vector<float>",
				const = {}
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "4",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "DecoratorAlwaysRunning",
						id = "5",
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
											func = "isInSpecialRidden"
										}
									},
									{
										Opr2 = {
											const = true
										}
									},
									{
										Phase = "Enter"
									}
								}
							}
						},
						children = {
							{
								node = {
									class = "Action",
									id = "1",
									properties = {
										{
											Method = {
												func = "flyAround",
												params = {
													{
														const = 10
													},
													{
														field = "tFlyCenterPos"
													},
													{
														const = 10
													},
													{
														const = false
													},
													{
														const = 10
													},
													{
														const = 0
													},
													{
														const = 20
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_SpecialRidden
