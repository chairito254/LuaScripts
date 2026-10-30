-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Pet_CombatDodge.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_CombatDodge = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Pet_CombatDodge",
		version = 9,
		properties = {},
		pars = {
			{
				name = "tTargetActorId",
				type = "int",
				const = 0,
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "2",
						properties = {
							{
								Method = {
									func = "combatDodge",
									params = {
										{
											field = "tTargetActorId"
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
						class = "Action",
						id = "3",
						properties = {
							{
								Method = {
									func = "combatMoveAround",
									params = {
										{
											field = "tTargetActorId"
										},
										{
											const = 0
										},
										{
											const = BaseEnum.SpeedRateType.Mid
										},
										{
											const = 3
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
		}
	}
}

return PBT_Pet_CombatDodge
