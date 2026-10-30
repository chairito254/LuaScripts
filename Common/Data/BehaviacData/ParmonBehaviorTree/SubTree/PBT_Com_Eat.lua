-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Eat.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Eat = {
	behavior = {
		version = 7,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Eat",
		properties = {},
		pars = {
			{
				value = "5",
				type = "float",
				name = "eatTimeOut",
				const = 5
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "8",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "9",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "Eat"
										},
										{
											field = "eatTimeOut"
										},
										{
											const = false
										},
										{
											const = false
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
				},
				{
					node = {
						class = "Action",
						id = "10",
						properties = {
							{
								Method = {
									func = "playPhaseAction",
									params = {
										{
											const = "Behav_EatStart"
										},
										{
											const = "Behav_EatLoop"
										},
										{
											const = "Behav_EatEnd"
										},
										{
											field = "eatTimeOut"
										},
										{
											const = ""
										},
										{
											const = false
										},
										{
											const = false
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

return PBT_Com_Eat
