-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_MimicryOutAndLeave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_MimicryOutAndLeave = {
	behavior = {
		version = 19,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_MimicryOutAndLeave",
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "Sequence",
			id = "2",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "7",
						properties = {
							{
								Method = {
									func = "switchToState",
									params = {
										{
											const = "LOCOMOTION"
										},
										{
											const = -1
										},
										{
											const = ""
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
				},
				{
					node = {
						class = "ReferencedBehavior",
						id = "8",
						properties = {
							{
								ReferenceBehavior = {
									const = "PBT_Perception_Leave"
								}
							},
							{
								subTreeProperties = {}
							}
						},
						attachments = {},
						children = {}
					}
				}
			}
		}
	}
}

return PBT_Behav_Com_MimicryOutAndLeave
