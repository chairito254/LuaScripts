-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_State_Idle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_State_Idle = {
	behavior = {
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_State_Idle",
		version = 18,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "Sequence",
			id = "20",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "21",
						properties = {
							{
								Method = {
									func = "doSendMessage",
									params = {
										{
											field = "selfId"
										},
										{
											const = {}
										},
										{
											const = "IdleMsgTrigger"
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
						class = "ReferencedBehavior",
						id = "56",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Idle"
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

return PBT_State_Idle
