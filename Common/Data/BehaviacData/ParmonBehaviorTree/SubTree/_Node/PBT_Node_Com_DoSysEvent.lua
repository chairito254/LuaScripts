-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_DoSysEvent.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_DoSysEvent = {
	behavior = {
		useForRoute = true,
		version = 16,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_DoSysEvent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tEventId"
			}
		},
		attachments = {},
		node = {
			id = "21",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "19",
						class = "Action",
						properties = {
							{
								Method = {
									func = "doSysEvent",
									params = {
										{
											field = "selfId"
										},
										{
											field = "tEventId"
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
						id = "20",
						class = "Action",
						properties = {
							{
								Method = {
									func = "debugLog",
									params = {
										{
											field = "tEventId"
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

return PBT_Node_Com_DoSysEvent
