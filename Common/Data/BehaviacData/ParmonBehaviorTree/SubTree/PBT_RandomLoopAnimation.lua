-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_RandomLoopAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_RandomLoopAnimation = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_RandomLoopAnimation",
		version = 6,
		useForRoute = true,
		properties = {},
		pars = {
			{
				value = "1:0",
				name = "tWeightList",
				type = "vector<float>",
				const = {
					0
				}
			},
			{
				value = "1:",
				name = "tStateList",
				type = "vector<string>",
				const = {
					""
				}
			},
			{
				value = "",
				name = "tAnimState",
				type = "string",
				const = ""
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "5",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tAnimState"
								}
							},
							{
								Opr = {
									func = "getStringByWeight",
									params = {
										{
											field = "tWeightList"
										},
										{
											field = "tStateList"
										}
									}
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Action",
						id = "4",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											field = "tAnimState"
										},
										{
											const = 0
										},
										{
											const = ""
										},
										{
											const = true
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = BaseEnum.AIAnimationRootMotionType.Default
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

return PBT_RandomLoopAnimation
