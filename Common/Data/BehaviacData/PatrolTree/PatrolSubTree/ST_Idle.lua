-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_Idle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Idle = {
	behavior = {
		version = 5,
		name = "PatrolTree/PatrolSubTree/ST_Idle",
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "idleTimeout",
				type = "float",
				const = 4,
				value = "4"
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
						id = "3",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											field = "idleTimeout"
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

return ST_Idle
