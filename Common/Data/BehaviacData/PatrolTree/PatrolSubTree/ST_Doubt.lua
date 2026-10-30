-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_Doubt.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Doubt = {
	behavior = {
		useForRoute = true,
		version = 5,
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_Doubt",
		properties = {},
		pars = {},
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
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "Think"
										},
										{
											const = 5
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
						id = "3",
						class = "Wait",
						properties = {
							{
								Time = {
									const = 5000
								}
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

return ST_Doubt
