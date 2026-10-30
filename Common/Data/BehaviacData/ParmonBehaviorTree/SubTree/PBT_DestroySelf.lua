-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_DestroySelf.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_DestroySelf = {
	behavior = {
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_DestroySelf",
		version = 5,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "enterDestroySelf"
					}
				},
				{
					ResultOption = "BT_SUCCESS"
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

return PBT_DestroySelf
