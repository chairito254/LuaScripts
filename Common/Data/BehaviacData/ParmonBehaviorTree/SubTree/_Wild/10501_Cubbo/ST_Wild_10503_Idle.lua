-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10501_Cubbo\\ST_Wild_10503_Idle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Wild_10503_Idle = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Wild/10501_Cubbo/ST_Wild_10503_Idle",
		version = 15,
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "29",
			class = "Action",
			properties = {
				{
					Method = {
						func = "addBuff",
						params = {
							{
								const = 1145129
							},
							{
								const = -1
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

return ST_Wild_10503_Idle
