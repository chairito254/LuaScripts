-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_PlayFaceAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_PlayFaceAnimation = {
	behavior = {
		useForRoute = true,
		agenttype = "CombatAgent",
		version = 14,
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_PlayFaceAnimation",
		properties = {},
		pars = {
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tFadeTime"
			},
			{
				type = "string",
				value = "",
				const = "",
				name = "tFaceName"
			}
		},
		attachments = {},
		node = {
			id = "14",
			class = "Action",
			properties = {
				{
					Method = {
						func = "playFaceAnimation",
						params = {
							{
								field = "tFaceName"
							},
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

return PBT_Node_Com_PlayFaceAnimation
