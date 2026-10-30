-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Node_Wait.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Node_Wait = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		version = 6,
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Node_Wait",
		properties = {},
		pars = {
			{
				type = "float",
				const = 0,
				name = "tWaitTime",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "10",
			class = "Action",
			properties = {
				{
					Method = {
						func = "waitTime",
						params = {
							{
								field = "tWaitTime"
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

return PBT_Com_Node_Wait
