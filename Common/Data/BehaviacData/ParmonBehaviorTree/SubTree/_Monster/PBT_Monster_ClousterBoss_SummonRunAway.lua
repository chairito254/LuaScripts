-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Monster\\PBT_Monster_ClousterBoss_SummonRunAway.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Monster_ClousterBoss_SummonRunAway = {
	behavior = {
		agenttype = "PuppetAgent",
		version = 10,
		name = "ParmonBehaviorTree/SubTree/_Monster/PBT_Monster_ClousterBoss_SummonRunAway",
		useForRoute = false,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "Sequence",
			id = "11",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Assignment",
						id = "12",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tgt"
								}
							},
							{
								Opr = {
									func = "getAuthorityPlayer"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						class = "Action",
						id = "10",
						properties = {
							{
								Method = {
									func = "leaveTarget",
									params = {
										{
											field = "tgt"
										},
										{
											const = 20
										},
										{
											const = -1
										},
										{
											const = BaseEnum.SpeedRateType.Fast
										},
										{
											const = 10
										}
									}
								}
							},
							{
								ResultOption = "BT_SUCCESS"
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
						class = "Action",
						id = "6",
						properties = {
							{
								Method = {
									func = "enterDestroySelf"
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
		}
	}
}

return PBT_Monster_ClousterBoss_SummonRunAway
