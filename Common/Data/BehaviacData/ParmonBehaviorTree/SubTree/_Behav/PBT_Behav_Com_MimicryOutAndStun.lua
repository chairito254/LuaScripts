-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Com_MimicryOutAndStun.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Com_MimicryOutAndStun = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Com_MimicryOutAndStun",
		version = 31,
		useForRoute = false,
		agenttype = "CombatAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "11",
						class = "Action",
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
						id = "26",
						class = "Action",
						properties = {
							{
								Method = {
									func = "addBuff",
									params = {
										{
											const = 2117404
										},
										{
											const = 8
										}
									}
								}
							},
							{
								ResultOption = "BT_INVALID"
							},
							{
								ResultResumeOption = "BT_NextNode"
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

return PBT_Behav_Com_MimicryOutAndStun
