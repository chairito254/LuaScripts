-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_ClimbWaterfallOn.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_ClimbWaterfallOn = {
	behavior = {
		version = 7,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_ClimbWaterfallOn",
		properties = {},
		pars = {
			{
				value = "0:",
				name = "tClimbWaterfallOnPos",
				type = "vector<float>",
				const = {}
			},
			{
				value = "0:",
				name = "tClimbWaterfallOnRot",
				type = "vector<float>",
				const = {}
			},
			{
				const = 0,
				value = "0",
				name = "tClimbWaterfallOnYaw",
				type = "float"
			}
		},
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
						class = "Action",
						properties = {
							{
								Method = {
									func = "turnToYaw",
									params = {
										{
											field = "tClimbWaterfallOnYaw"
										},
										{
											const = false
										},
										{
											const = 5
										},
										{
											const = false
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
								ResultResumeOption = "BT_ResumeSelf"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "4",
						class = "Action",
						properties = {
							{
								Method = {
									func = "switchToClimbWaterfallOn",
									params = {
										{
											field = "tClimbWaterfallOnPos"
										},
										{
											field = "tClimbWaterfallOnRot"
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

return PBT_ClimbWaterfallOn
