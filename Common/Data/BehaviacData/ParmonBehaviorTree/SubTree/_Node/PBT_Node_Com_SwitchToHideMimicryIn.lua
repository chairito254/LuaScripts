-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_SwitchToHideMimicryIn.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_SwitchToHideMimicryIn = {
	behavior = {
		version = 5,
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_SwitchToHideMimicryIn",
		properties = {},
		pars = {
			{
				value = "0:",
				name = "tTargetPos",
				type = "vector<float>",
				const = {}
			}
		},
		attachments = {},
		node = {
			class = "Action",
			id = "1",
			properties = {
				{
					Method = {
						func = "switchToHideMimicryIn",
						params = {
							{
								field = "tTargetPos"
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
	}
}

return PBT_Node_Com_SwitchToHideMimicryIn
