-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SetFullbodyIdle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SetFullbodyIdle = {
	behavior = {
		agenttype = "PuppetAgent",
		version = 10,
		useForRoute = true,
		name = "ParmonBehaviorTree/SubTree/PBT_SetFullbodyIdle",
		properties = {},
		pars = {
			{
				value = "",
				const = "",
				name = "tAnimationKey",
				type = "string"
			}
		},
		attachments = {},
		node = {
			id = "11",
			class = "Action",
			properties = {
				{
					Method = {
						func = "setFullBodyIdle",
						params = {
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
					ResultResumeOption = "BT_None"
				}
			},
			attachments = {},
			children = {}
		}
	}
}

return PBT_SetFullbodyIdle
