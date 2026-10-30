-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Home_RandomEvent.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Home_RandomEvent = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Home_RandomEvent",
		version = 6,
		properties = {},
		pars = {
			{
				const = "",
				name = "tAnimationKey",
				type = "string",
				value = ""
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
						class = "Action",
						id = "2",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											field = "tAnimationKey"
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

return PBT_Behav_Home_RandomEvent
