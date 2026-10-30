-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Test\\PBT_Test_TurnToPos.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Test_TurnToPos = {
	behavior = {
		useForRoute = false,
		version = 13,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Test/PBT_Test_TurnToPos",
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				name = "tSensorTgtId",
				value = "0"
			},
			{
				type = "vector<float>",
				name = "tSensorTgtPos",
				value = "0:",
				const = {}
			}
		},
		attachments = {},
		node = {
			id = "4",
			class = "Action",
			properties = {
				{
					Method = {
						func = "turnToPos",
						params = {
							{
								field = "tSensorTgtPos"
							},
							{
								const = 0
							},
							{
								const = true
							},
							{
								const = 5
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

return PBT_Test_TurnToPos
