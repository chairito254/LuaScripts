-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_PlayEffectOnTarget.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_PlayEffectOnTarget = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_PlayEffectOnTarget",
		version = 5,
		properties = {},
		pars = {
			{
				name = "tEffectName",
				type = "string",
				value = "",
				const = ""
			},
			{
				name = "tTargetActorId",
				type = "int",
				value = "0",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "playEffectOnTarget",
						params = {
							{
								field = "tEffectName"
							},
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
					ResultResumeOption = "BT_None"
				}
			},
			attachments = {},
			children = {}
		}
	}
}

return PBT_PlayEffectOnTarget
