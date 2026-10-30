-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_FlyGrabEntity.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_FlyGrabEntity = {
	behavior = {
		agenttype = "CombatAgent",
		version = 13,
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_FlyGrabEntity",
		useForRoute = true,
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "tTargetActorId",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "12",
			class = "Action",
			properties = {
				{
					Method = {
						func = "flyGrabEntity",
						params = {
							{
								field = "tTargetActorId"
							},
							{
								const = 5
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

return PBT_Node_Com_FlyGrabEntity
