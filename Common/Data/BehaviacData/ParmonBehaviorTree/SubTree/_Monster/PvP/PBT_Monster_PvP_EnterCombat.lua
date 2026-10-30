-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Monster\\PvP\\PBT_Monster_PvP_EnterCombat.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Monster_PvP_EnterCombat = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Monster/PvP/PBT_Monster_PvP_EnterCombat",
		useForRoute = false,
		version = 5,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				name = "tTargetID",
				value = "0",
				type = "int",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "enterCombat",
						params = {
							{
								field = "tTargetID"
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

return PBT_Monster_PvP_EnterCombat
