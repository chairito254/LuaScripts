-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_SwitchToFly.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_SwitchToFly = {
	behavior = {
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_SwitchToFly",
		version = 5,
		properties = {},
		pars = {
			{
				name = "tFlyHeight",
				type = "float",
				const = 5,
				value = "5"
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "switchToFly",
						params = {
							{
								field = "tFlyHeight"
							},
							{
								const = 5
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

return ST_SwitchToFly
