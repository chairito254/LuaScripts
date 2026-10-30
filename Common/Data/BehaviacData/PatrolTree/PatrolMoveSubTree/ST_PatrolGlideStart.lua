-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolMoveSubTree\\ST_PatrolGlideStart.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_PatrolGlideStart = {
	behavior = {
		version = 9,
		name = "PatrolTree/PatrolMoveSubTree/ST_PatrolGlideStart",
		useForRoute = false,
		agenttype = "WxAgent",
		properties = {},
		pars = {
			{
				type = "vector<float>",
				value = "0:",
				name = "patrolPosList",
				const = {}
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "patrolMaxTime"
			},
			{
				type = "SpeedRateType",
				value = "Slow",
				name = "tBehaviorSpeedRateType",
				const = BaseEnum.SpeedRateType.Slow
			},
			{
				type = "float",
				value = "0",
				const = 0,
				name = "tPatrolSpeed"
			},
			{
				type = "bool",
				value = "false",
				const = false,
				name = "tUseAccurateArrive"
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
						id = "6",
						class = "Action",
						properties = {
							{
								Method = {
									func = "switchToState",
									params = {
										{
											const = "GLIDING"
										},
										{
											const = 0
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
						id = "2",
						class = "Action",
						properties = {
							{
								Method = {
									func = "moveToPosList",
									params = {
										{
											field = "patrolPosList"
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
											field = "tBehaviorSpeedRateType"
										},
										{
											field = "tPatrolSpeed"
										},
										{
											const = {}
										},
										{
											field = "tUseAccurateArrive"
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

return ST_PatrolGlideStart
