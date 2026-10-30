-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_ChangeVisionArea_Low.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_ChangeVisionArea_Low = {
	behavior = {
		version = 12,
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_ChangeVisionArea_Low",
		useForRoute = true,
		agenttype = "CombatAgent",
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
								const = "visionAreaLow"
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

return PBT_Node_ChangeVisionArea_Low
