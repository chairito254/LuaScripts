-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_PlayEffect.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_PlayEffect = {
	behavior = {
		agenttype = "CombatAgent",
		version = 5,
		name = "ParmonBehaviorTree/SubTree/PBT_PlayEffect",
		useForRoute = false,
		properties = {},
		pars = {
			{
				name = "tEffectName",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tEffectPos",
				value = "0:",
				type = "vector<float>",
				const = {}
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "playEffect",
						params = {
							{
								field = "tEffectName"
							},
							{
								field = "tEffectPos"
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

return PBT_PlayEffect
