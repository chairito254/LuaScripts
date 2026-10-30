-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_AddBuff.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_AddBuff = {
	behavior = {
		useForRoute = false,
		version = 10,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_AddBuff",
		properties = {},
		pars = {
			{
				type = "int",
				value = "0",
				name = "tBuffId",
				const = 0
			},
			{
				type = "float",
				value = "-1",
				name = "duration",
				const = -1
			}
		},
		attachments = {},
		node = {
			id = "12",
			class = "Action",
			properties = {
				{
					Method = {
						func = "addBuff",
						params = {
							{
								field = "tBuffId"
							},
							{
								field = "duration"
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

return PBT_AddBuff
