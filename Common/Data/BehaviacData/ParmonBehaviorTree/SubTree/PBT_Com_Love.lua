-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Love.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Love = {
	behavior = {
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Love",
		agenttype = "CombatAgent",
		version = 5,
		properties = {},
		pars = {
			{
				name = "tAnimationKey",
				const = "Behav_Love",
				type = "string",
				value = "Behav_Love"
			},
			{
				name = "tAnimationTimeout",
				const = 5,
				type = "float",
				value = "5"
			},
			{
				name = "tEmojiBubbleKey",
				const = "",
				type = "string",
				value = ""
			},
			{
				name = "tEmojiBubbleTimeout",
				const = 5,
				type = "float",
				value = "5"
			},
			{
				name = "tTimelineTag",
				const = "",
				type = "string",
				value = ""
			},
			{
				name = "tNeedLoop",
				const = false,
				type = "bool",
				value = "false"
			},
			{
				name = "tTgtId",
				const = 0,
				type = "int",
				value = "0"
			},
			{
				name = "tTargetAtYawDegree",
				const = 0,
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "2",
			class = "Sequence",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "1",
						class = "Action",
						properties = {
							{
								Method = {
									func = "turnToTargetAtYaw",
									params = {
										{
											field = "tTgtId"
										},
										{
											field = "tTargetAtYawDegree"
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
						id = "4",
						class = "Action",
						properties = {
							{
								Method = {
									func = "showEmojiBubble",
									params = {
										{
											field = "tEmojiBubbleKey"
										},
										{
											field = "tEmojiBubbleTimeout"
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
						id = "5",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											field = "tAnimationKey"
										},
										{
											field = "tAnimationTimeout"
										},
										{
											field = "tTimelineTag"
										},
										{
											field = "tNeedLoop"
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = BaseEnum.AIAnimationRootMotionType.Default
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

return PBT_Com_Love
