-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_StopFaceAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_StopFaceAnimation = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_StopFaceAnimation",
		version = 12,
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				value = "0",
				name = "tFadeTime",
				const = 0,
				type = "float"
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "13",
			properties = {
				{
					Method = {
						func = "stopFaceAnimation",
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

return PBT_Node_Com_StopFaceAnimation
