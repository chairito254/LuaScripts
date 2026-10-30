-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_JumpToGlide.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_JumpToGlide = {
	behavior = {
		useForRoute = true,
		version = 9,
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_JumpToGlide",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "jumpTime",
				type = "float"
			},
			{
				const = 0,
				value = "0",
				name = "glideStartTime",
				type = "float"
			},
			{
				const = false,
				value = "false",
				name = "IsVerticalJump",
				type = "bool"
			}
		},
		attachments = {},
		node = {
			id = "5",
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
									field = "IsVerticalJump"
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
									func = "playJumpGlideAction",
									params = {
										{
											const = "Jump"
										},
										{
											field = "jumpTime"
										},
										{
											field = "glideStartTime"
										},
										{
											const = 0
										},
										{
											const = 0
										},
										{
											const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
										},
										{
											const = 10
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
						id = "6",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playJumpGlideAction",
									params = {
										{
											const = "AI_JumpInRun"
										},
										{
											field = "jumpTime"
										},
										{
											field = "glideStartTime"
										},
										{
											const = 0
										},
										{
											const = 5
										},
										{
											const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
										},
										{
											const = 10
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

return ST_JumpToGlide
