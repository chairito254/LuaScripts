-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10031_Mantis\\PBT_Wild_10031_Perception_Leave.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10031_Perception_Leave = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/_Wild/10031_Mantis/PBT_Wild_10031_Perception_Leave",
		agenttype = "PuppetAgent",
		version = 26,
		properties = {},
		pars = {
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tSensorTgtId"
			},
			{
				type = "int",
				const = 0,
				value = "0",
				name = "tTgtId"
			}
		},
		attachments = {},
		node = {
			id = "18",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "24",
						class = "Assignment",
						properties = {
							{
								CastRight = "false"
							},
							{
								Opl = {
									field = "tSensorTgtId"
								}
							},
							{
								Opr = {
									func = "getPerceptibilityTarget"
								}
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "19",
						class = "Action",
						properties = {
							{
								Method = {
									func = "turnToTarget",
									params = {
										{
											field = "tSensorTgtId"
										},
										{
											const = false
										},
										{
											const = 0
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
				},
				{
					node = {
						id = "66",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											const = 0
										},
										{
											const = 10310900
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = true
										},
										{
											const = BaseEnum.CastAbilitySourceType.Normal
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
						id = "68",
						class = "ReferencedBehavior",
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

return PBT_Wild_10031_Perception_Leave
