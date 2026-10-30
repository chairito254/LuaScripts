-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_PlayLipAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_PlayLipAnimation = {
	behavior = {
		version = 15,
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_PlayLipAnimation",
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tFadeTime",
				const = 0,
				value = "0",
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "15",
			class = "Action",
			properties = {
				{
					Method = {
						func = "playLipAnimation",
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

return PBT_Node_Com_PlayLipAnimation
