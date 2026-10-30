-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Pet\\PBT_Pet_GuideAsk.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_GuideAsk = {
	behavior = {
		agenttype = "PetAgent",
		version = 13,
		name = "ParmonBehaviorTree/SubTree/_Pet/PBT_Pet_GuideAsk",
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tSensorTgtId",
				type = "int",
				value = "0",
				const = 0
			},
			{
				name = "tRandomWaitTime",
				type = "float",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "8",
			class = "Action",
			properties = {
				{
					Method = {
						func = "waitTime",
						params = {
							{
								const = 3.5
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

return PBT_Pet_GuideAsk
