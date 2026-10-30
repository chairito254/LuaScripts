-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_FlyFollowTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_FlyFollowTarget = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_FlyFollowTarget",
		agenttype = "CombatAgent",
		version = 9,
		properties = {},
		pars = {
			{
				value = "0",
				name = "tActorId",
				type = "int",
				const = 0
			},
			{
				value = "0",
				name = "Dist",
				type = "float",
				const = 0
			},
			{
				value = "0",
				name = "Height",
				type = "float",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "2",
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
			attachments = {},
			children = {
				{
					node = {
						id = "1",
						class = "Action",
						properties = {
							{
								Method = {
									func = "flyToTarget",
									params = {
										{
											field = "tActorId"
										},
										{
											field = "Dist"
										},
										{
											field = "Height"
										},
										{
											const = 0
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = false
										},
										{
											const = false
										},
										{
											const = 0
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

return PBT_FlyFollowTarget
