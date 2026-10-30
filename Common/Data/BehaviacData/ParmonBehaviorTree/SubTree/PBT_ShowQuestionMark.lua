-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_ShowQuestionMark.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_ShowQuestionMark = {
	behavior = {
		agenttype = "CombatAgent",
		useForRoute = false,
		version = 5,
		name = "ParmonBehaviorTree/SubTree/PBT_ShowQuestionMark",
		properties = {},
		pars = {
			{
				value = "",
				const = "",
				name = "tMarkType",
				type = "string"
			},
			{
				value = "0",
				const = 0,
				name = "tTimeout",
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "2",
			class = "Action",
			properties = {
				{
					Method = {
						func = "showQuestionMark",
						params = {
							{
								field = "tMarkType"
							},
							{
								field = "tTimeout"
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

return PBT_ShowQuestionMark
