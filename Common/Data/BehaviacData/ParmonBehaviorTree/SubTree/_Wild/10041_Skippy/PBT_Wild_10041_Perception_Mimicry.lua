-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10041_Skippy\\PBT_Wild_10041_Perception_Mimicry.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10041_Perception_Mimicry = {
	behavior = {
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "ParmonBehaviorTree/SubTree/_Wild/10041_Skippy/PBT_Wild_10041_Perception_Mimicry",
		version = 34,
		properties = {},
		pars = {
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tSensorTgtId"
			},
			{
				type = "int",
				value = "0",
				const = 0,
				name = "tTgtId"
			},
			{
				type = "string",
				value = "",
				const = "",
				name = "tAnimationKey"
			},
			{
				type = "string",
				value = "",
				const = "",
				name = "tCharacterState"
			}
		},
		attachments = {},
		node = {
			id = "18",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "24",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tSensorTgtId"
								}
							},
							{
								Opr = {
									func = "getPerceptibilityTarget"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "68",
						class = "Action",
						properties = {
							{
								Method = {
									func = "switchToState",
									params = {
										{
											const = "SWIMMIMICRY"
										},
										{
											const = 0
										},
										{
											field = "tAnimationKey"
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
						id = "87",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "70",
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
														field = "tSensorTgtId"
													},
													{
														const = true
													},
													{
														const = true
													},
													{
														const = 0
													}
												}
											}
										},
										{
											Opr = {
												const = 30
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "72",
									class = "Action",
									properties = {
										{
											Method = {
												func = "switchToState",
												params = {
													{
														const = "SWIMMIMICRYOUT"
													},
													{
														const = 0
													},
													{
														field = "tAnimationKey"
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
									id = "88",
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

return PBT_Wild_10041_Perception_Mimicry
