-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_ChangeVisionArea_Default.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_ChangeVisionArea_Default = {
	behavior = {
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_ChangeVisionArea_Default",
		version = 9,
		useForRoute = true,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "19",
			class = "Action",
			properties = {
				{
					Method = {
						func = "setVisionAreaOverride",
						params = {
							{
								const = "visionAreaDefault"
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

return PBT_Node_ChangeVisionArea_Default
