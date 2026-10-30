-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Perception_MimicryEnterResPoint.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Perception_MimicryEnterResPoint = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_Perception_MimicryEnterResPoint",
		useForRoute = false,
		version = 27,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tSensorTgtId"
			},
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tRandomWaitTime"
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "17",
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
								const = "Msg_VisionValue_Full_MimicryEnterResPoint"
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

return PBT_Perception_MimicryEnterResPoint
