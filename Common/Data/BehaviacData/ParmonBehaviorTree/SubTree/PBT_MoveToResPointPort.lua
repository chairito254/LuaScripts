-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_MoveToResPointPort.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_MoveToResPointPort = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_MoveToResPointPort",
		version = 7,
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				type = "int",
				value = "0",
				name = "tPointId"
			},
			{
				const = 0,
				type = "int",
				value = "0",
				name = "tPortId"
			},
			{
				const = 0,
				type = "float",
				value = "0",
				name = "tTimeout"
			},
			{
				type = "SpeedRateType",
				value = "Slow",
				name = "tSpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				const = 0,
				type = "float",
				value = "0",
				name = "tSpeed"
			},
			{
				const = false,
				type = "bool",
				value = "false",
				name = "tUseAccurateArrive"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Action",
						properties = {
							{
								Method = {
									func = "moveToResPointPort",
									params = {
										{
											field = "tPointId"
										},
										{
											field = "tPortId"
										},
										{
											field = "tTimeout"
										},
										{
											field = "tSpeedRateType"
										},
										{
											field = "tSpeed"
										},
										{
											field = "tUseAccurateArrive"
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
				},
				{
					node = {
						id = "3",
						class = "Action",
						properties = {
							{
								Method = {
									func = "turnToResPointPort",
									params = {
										{
											field = "tPointId"
										},
										{
											field = "tPortId"
										},
										{
											const = false
										},
										{
											const = 0
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

return PBT_MoveToResPointPort
