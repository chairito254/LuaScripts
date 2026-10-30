-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_ClimbWaterfallOff.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_ClimbWaterfallOff = {
	behavior = {
		agenttype = "CombatAgent",
		version = 6,
		name = "ParmonBehaviorTree/SubTree/PBT_ClimbWaterfallOff",
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tClimbWaterfallEndType",
				type = "int",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "switchToClimbWaterfallOff",
						params = {
							{
								field = "tClimbWaterfallEndType"
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

return PBT_ClimbWaterfallOff
