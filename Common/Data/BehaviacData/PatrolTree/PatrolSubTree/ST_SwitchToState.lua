-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_SwitchToState.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_SwitchToState = {
	behavior = {
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_SwitchToState",
		version = 5,
		useForRoute = true,
		properties = {},
		pars = {
			{
				const = "",
				type = "string",
				value = "",
				name = "tStateName"
			},
			{
				const = "",
				type = "string",
				value = "",
				name = "tAnimationKey"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "switchToState",
						params = {
							{
								field = "tStateName"
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
	}
}

return ST_SwitchToState
