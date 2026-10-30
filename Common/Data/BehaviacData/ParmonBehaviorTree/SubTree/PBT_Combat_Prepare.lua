-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Combat_Prepare.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Combat_Prepare = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/PBT_Combat_Prepare",
		agenttype = "CombatAgent",
		version = 10,
		useForRoute = false,
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
						id = "3",
						properties = {
							{
								Method = {
									func = "hideQuestionMark"
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
				},
				{
					node = {
						class = "ReferencedBehavior",
						id = "1",
						properties = {
							{
								ReferenceBehavior = {
									field = "Param_ST_Combat_Prepare"
								}
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

return PBT_Combat_Prepare
