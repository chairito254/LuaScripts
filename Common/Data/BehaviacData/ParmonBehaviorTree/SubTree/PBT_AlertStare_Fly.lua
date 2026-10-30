-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_AlertStare_Fly.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_AlertStare_Fly = {
	behavior = {
		useForRoute = false,
		version = 6,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_AlertStare_Fly",
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tMaxTime",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tRandomWaitTime",
				const = 0,
				value = "0",
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Condition",
						properties = {
							{
								Operator = "NotEqual"
							},
							{
								Opl = {
									field = "tSensorTgtId"
								}
							},
							{
								Opr = {
									const = 0
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "9",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showQuestionMark",
									params = {
										{
											const = "Orange"
										},
										{
											const = 0.2
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
		}
	}
}

return PBT_AlertStare_Fly
