-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_Jump.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Jump = {
	behavior = {
		version = 5,
		useForRoute = true,
		name = "PatrolTree/PatrolSubTree/ST_Jump",
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				const = 0,
				type = "float",
				name = "tTimeout",
				value = "0"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "2",
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
											const = 0
										},
										{
											const = 3
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

return ST_Jump
