-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_HeartBreak.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_HeartBreak = {
	behavior = {
		version = 5,
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_HeartBreak",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "3",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "Heartbreak"
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
						id = "4",
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

return ST_HeartBreak
