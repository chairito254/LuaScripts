-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_LeaveTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_LeaveTarget = {
	behavior = {
		version = 10,
		name = "ParmonBehaviorTree/SubTree/PBT_LeaveTarget",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tTargetActorId",
				const = 0,
				value = "0",
				type = "int"
			},
			{
				name = "tLeaveDistance",
				const = 5,
				value = "5",
				type = "float"
			},
			{
				name = "tSpeed",
				const = 4,
				value = "4",
				type = "float"
			},
			{
				name = "tSpeedRateType",
				value = "Mid",
				type = "SpeedRateType",
				const = BaseEnum.SpeedRateType.Mid
			},
			{
				name = "tMaxTime",
				const = 10,
				value = "10",
				type = "float"
			}
		},
		attachments = {},
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

return PBT_LeaveTarget
