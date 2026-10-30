-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_SwitchToHideMimicryOut.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_SwitchToHideMimicryOut = {
	behavior = {
		useForRoute = false,
		version = 14,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_SwitchToHideMimicryOut",
		properties = {},
		pars = {
			{
				value = "true",
				name = "tNeedPlayAnim",
				const = true,
				type = "bool"
			},
			{
				value = "0",
				name = "tJumpDistance",
				const = 0,
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "3",
			class = "Action",
			properties = {
				{
					Method = {
						func = "switchToHideMimicryOut",
						params = {
							{
								field = "tNeedPlayAnim"
							},
							{
								field = "tJumpDistance"
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

return PBT_Node_Com_SwitchToHideMimicryOut
