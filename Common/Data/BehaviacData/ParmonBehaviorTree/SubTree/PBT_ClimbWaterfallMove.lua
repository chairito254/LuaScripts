-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_ClimbWaterfallMove.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_ClimbWaterfallMove = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_ClimbWaterfallMove",
		useForRoute = false,
		version = 6,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tTargetPosList",
				value = "0:",
				type = "vector<float>",
				const = {}
			},
			{
				name = "tNormalList",
				value = "0:",
				type = "vector<float>",
				const = {}
			},
			{
				name = "tSpeedRateType",
				value = "Slow",
				type = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				name = "tSpeed",
				value = "0",
				const = 0,
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "moveToPosList",
						params = {
							{
								field = "tTargetPosList"
							},
							{
								const = 100
							},
							{
								const = true
							},
							{
								const = 0
							},
							{
								field = "tSpeedRateType"
							},
							{
								field = "tSpeed"
							},
							{
								field = "tNormalList"
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

return PBT_ClimbWaterfallMove
