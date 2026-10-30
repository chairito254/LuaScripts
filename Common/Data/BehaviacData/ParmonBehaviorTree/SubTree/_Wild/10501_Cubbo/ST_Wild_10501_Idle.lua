-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10501_Cubbo\\ST_Wild_10501_Idle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Wild_10501_Idle = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Wild/10501_Cubbo/ST_Wild_10501_Idle",
		agenttype = "CombatAgent",
		version = 15,
		useForRoute = true,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "Action",
			id = "29",
			properties = {
				{
					Method = {
						func = "addBuff",
						params = {
							{
								const = 215010101
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

return ST_Wild_10501_Idle
