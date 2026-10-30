-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_ChangeVisionArea_Mid.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_ChangeVisionArea_Mid = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_ChangeVisionArea_Mid",
		version = 13,
		useForRoute = true,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "Action",
			id = "19",
			properties = {
				{
					Method = {
						func = "setVisionAreaOverride",
						params = {
							{
								const = "visionAreaMid"
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

return PBT_Node_ChangeVisionArea_Mid
