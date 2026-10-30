-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_TurnToTargetPos.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_TurnToTargetPos = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_TurnToTargetPos",
		useForRoute = false,
		version = 5,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				name = "tTargetAtYawDegree",
				const = 0,
				type = "float"
			},
			{
				value = "3:0|0|0",
				name = "tTargetPos",
				type = "vector<float>",
				const = {
					0,
					0,
					0
				}
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "2",
			properties = {
				{
					Method = {
						func = "turnToPos",
						params = {
							{
								field = "tTargetPos"
							},
							{
								field = "tTargetAtYawDegree"
							},
							{
								const = false
							},
							{
								const = 0
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

return PBT_TurnToTargetPos
