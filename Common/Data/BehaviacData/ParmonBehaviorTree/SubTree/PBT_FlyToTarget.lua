-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_FlyToTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_FlyToTarget = {
	behavior = {
		useForRoute = true,
		name = "ParmonBehaviorTree/SubTree/PBT_FlyToTarget",
		agenttype = "CombatAgent",
		version = 10,
		properties = {},
		pars = {
			{
				name = "tActorId",
				const = 0,
				type = "int",
				value = "0"
			},
			{
				name = "tStopDist",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tHeight",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tTimeout",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tNotFaceToPos",
				const = false,
				type = "bool",
				value = "false"
			},
			{
				name = "tMinHoldTime",
				const = 0,
				type = "float",
				value = "0"
			},
			{
				name = "tIgnoreVertical",
				const = false,
				type = "bool",
				value = "false"
			},
			{
				name = "tIgnoreHorizontal",
				const = false,
				type = "bool",
				value = "false"
			},
			{
				name = "tSpeed",
				const = 0,
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "flyToTarget",
						params = {
							{
								field = "tActorId"
							},
							{
								field = "tStopDist"
							},
							{
								field = "tHeight"
							},
							{
								field = "tTimeout"
							},
							{
								field = "tNotFaceToPos"
							},
							{
								field = "tMinHoldTime"
							},
							{
								field = "tIgnoreVertical"
							},
							{
								field = "tIgnoreHorizontal"
							},
							{
								field = "tSpeed"
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

return PBT_FlyToTarget
