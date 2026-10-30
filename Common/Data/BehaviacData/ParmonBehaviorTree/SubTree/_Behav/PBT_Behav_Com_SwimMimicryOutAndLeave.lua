-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_SwimMimicryOutAndLeave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_SwimMimicryOutAndLeave = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		version = 22,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_SwimMimicryOutAndLeave",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "10",
						class = "IfElse",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "9",
									class = "Condition",
									properties = {
										{
											Operator = "Equal"
										},
										{
											Opl = {
												func = "checkCharacterState",
												params = {
													{
														const = "SWIMMIMICRY"
													},
													{}
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
									id = "7",
									class = "Action",
									properties = {
										{
											Method = {
												func = "switchToState",
												params = {
													{
														const = "SWIMMING"
													},
													{
														const = -1
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
									id = "12",
									class = "True",
									properties = {},
									attachments = {},
									children = {}
								}
							}
						}
					}
				},
				{
					node = {
						id = "8",
						class = "ReferencedBehavior",
						properties = {
							{
								ReferenceBehavior = {
									const = "PBT_Perception_Leave"
								}
							},
							{
								subTreeProperties = {}
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

return PBT_Behav_Com_SwimMimicryOutAndLeave
