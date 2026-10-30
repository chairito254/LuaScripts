-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_NPC_Novice_ReadyToFight.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_NPC_Novice_ReadyToFight = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_NPC_Novice_ReadyToFight",
		useForRoute = false,
		agenttype = "CombatAgent",
		version = 11,
		properties = {},
		pars = {
			{
				name = "tTarget",
				type = "int",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "27",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "30",
						properties = {
							{
								Method = {
									func = "turnToTarget",
									params = {
										{
											field = "tTarget"
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
				},
				{
					node = {
						class = "Action",
						id = "29",
						properties = {
							{
								Method = {
									func = "enterCombat",
									params = {
										{
											field = "tTarget"
										}
									}
								}
							},
							{
								ResultOption = "BT_SUCCESS"
							},
							{
								ResultResumeOption = "BT_None"
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

return PBT_NPC_Novice_ReadyToFight
