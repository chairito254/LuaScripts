-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_JumpDist.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_JumpDist = {
	behavior = {
		name = "PatrolTree/PatrolSubTree/ST_JumpDist",
		agenttype = "CombatAgent",
		version = 5,
		useForRoute = true,
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				type = "float",
				name = "tTimeout"
			},
			{
				const = 5,
				value = "5",
				type = "float",
				name = "tDist"
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "tDegree"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playJumpAction",
									params = {
										{
											const = "AI_JumpInRun"
										},
										{
											field = "tTimeout"
										},
										{
											field = "tDegree"
										},
										{
											field = "tDist"
										},
										{
											const = BaseEnum.RootMotionSyncPointEnum.AICustomPoint1
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
		}
	}
}

return ST_JumpDist
