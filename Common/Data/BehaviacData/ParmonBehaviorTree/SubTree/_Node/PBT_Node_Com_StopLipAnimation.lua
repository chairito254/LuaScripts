-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_StopLipAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_StopLipAnimation = {
	behavior = {
		version = 11,
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_StopLipAnimation",
		properties = {},
		pars = {
			{
				const = 0,
				type = "float",
				value = "0",
				name = "tFadeTime"
			}
		},
		attachments = {},
		node = {
			id = "12",
			class = "Action",
			properties = {
				{
					Method = {
						func = "stopLipAnimation",
						params = {
							{
								field = "tFadeTime"
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

return PBT_Node_Com_StopLipAnimation
