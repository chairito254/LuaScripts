-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_GamePlay_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_GamePlay_Leave = {
	behavior = {
		version = 12,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_GamePlay_Leave",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				const = 0,
				name = "tTargetActorId",
				type = "int"
			},
			{
				value = "35",
				const = 35,
				name = "tLeaveDistance",
				type = "float"
			},
			{
				value = "4",
				const = 4,
				name = "tSpeed",
				type = "float"
			},
			{
				value = "Mid",
				name = "tSpeedRateType",
				type = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				value = "10",
				const = 10,
				name = "tMaxTime",
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "2",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "3",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tTargetActorId"
								}
							},
							{
								Opr = {
									func = "getPerceptibilityTarget"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Action",
						id = "1",
						properties = {
							{
								Method = {
									func = "leaveTarget",
									params = {
										{
											field = "tTargetActorId"
										},
										{
											field = "tLeaveDistance"
										},
										{
											field = "tSpeed"
										},
										{
											field = "tSpeedRateType"
										},
										{
											field = "tMaxTime"
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

return PBT_Behav_GamePlay_Leave
