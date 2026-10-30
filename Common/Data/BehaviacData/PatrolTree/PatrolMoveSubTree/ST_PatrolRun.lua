-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolMoveSubTree\\ST_PatrolRun.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_PatrolRun = {
	behavior = {
		version = 5,
		useForRoute = false,
		agenttype = "WxAgent",
		name = "PatrolTree/PatrolMoveSubTree/ST_PatrolRun",
		properties = {},
		pars = {
			{
				type = "vector<float>",
				value = "0:",
				name = "patrolPos",
				const = {}
			},
			{
				const = 15,
				type = "float",
				value = "15",
				name = "patrolMaxTime"
			},
			{
				const = -1,
				type = "float",
				value = "-1",
				name = "tPatrolSpeed"
			},
			{
				const = "RUN",
				type = "string",
				value = "RUN",
				name = "tPatrolAnimationState"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "moveToPos",
						params = {
							{
								field = "patrolPos"
							},
							{
								field = "patrolMaxTime"
							},
							{
								const = true
							},
							{
								const = 0
							},
							{
								const = BaseEnum.SpeedRateType.Mid
							},
							{
								field = "tPatrolSpeed"
							},
							{
								const = BaseEnum.PathFindType.Auto
							},
							{
								const = false
							},
							{
								const = false
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

return ST_PatrolRun
