-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_RunAway.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_RunAway = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_RunAway",
		version = 11,
		useForRoute = false,
		properties = {},
		pars = {
			{
				value = "0",
				name = "remainBuffTime",
				type = "float",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "3",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "11",
						class = "Action",
						properties = {
							{
								Method = {
									func = "moveToQualifiedPosAwayFromTeammates",
									params = {
										{
											field = "tgt"
										},
										{
											const = 10
										},
										{
											field = "remainBuffTime"
										},
										{
											const = 12
										},
										{
											const = 2
										},
										{
											const = 0
										},
										{
											const = 0
										},
										{
											const = BaseEnum.SpeedRateType.Fast
										},
										{
											const = true
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

return PBT_RunAway
