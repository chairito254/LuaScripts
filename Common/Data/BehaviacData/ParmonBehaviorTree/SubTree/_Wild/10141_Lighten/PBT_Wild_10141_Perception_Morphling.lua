-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10141_Lighten\\PBT_Wild_10141_Perception_Morphling.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Wild_10141_Perception_Morphling = {
	behavior = {
		useForRoute = false,
		version = 27,
		agenttype = "PuppetAgent",
		name = "ParmonBehaviorTree/SubTree/_Wild/10141_Lighten/PBT_Wild_10141_Perception_Morphling",
		properties = {},
		pars = {
			{
				type = "int",
				name = "tSensorTgtId",
				const = 0,
				value = "0"
			},
			{
				type = "int",
				name = "tTgtId",
				const = 0,
				value = "0"
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
						id = "69",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											const = "Proud"
										},
										{
											const = 3
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
								ResultResumeOption = "BT_None"
							}
						},
						attachments = {},
						children = {}
					}
				},
				{
					node = {
						id = "70",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playPhaseAction",
									params = {
										{
											const = "Behav_HappyStart"
										},
										{
											const = "Behav_HappyLoop"
										},
										{
											const = "Behav_HappyEnd"
										},
										{
											const = 0
										},
										{
											const = ""
										},
										{
											const = true
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
		}
	}
}

return PBT_Wild_10141_Perception_Morphling
