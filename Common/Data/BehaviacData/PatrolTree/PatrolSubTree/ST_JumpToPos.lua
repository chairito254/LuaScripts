-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_JumpToPos.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_JumpToPos = {
	behavior = {
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_JumpToPos",
		version = 7,
		properties = {},
		pars = {
			{
				type = "float",
				name = "tTimeout",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tTargetPosX",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tTargetPosY",
				const = 0,
				value = "0"
			},
			{
				type = "float",
				name = "tTargetPosZ",
				const = 0,
				value = "0"
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
									func = "playJumpActionToPos",
									params = {
										{
											const = "JumpInRun"
										},
										{
											field = "tTimeout"
										},
										{
											field = "tTargetPosX"
										},
										{
											field = "tTargetPosY"
										},
										{
											field = "tTargetPosZ"
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

return ST_JumpToPos
