-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_Com_Happy.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Com_Happy = {
	behavior = {
		useForRoute = false,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_Com_Happy",
		version = 5,
		properties = {},
		pars = {
			{
				name = "tWaitTime",
				const = 0,
				value = "0",
				type = "float"
			},
			{
				name = "tAnimationKey",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tAnimationTimeout",
				const = 5,
				value = "5",
				type = "float"
			},
			{
				name = "tEmojiBubbleKey",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tEmojiBubbleTimeout",
				const = 5,
				value = "5",
				type = "float"
			},
			{
				name = "tTimelineTag",
				const = "",
				value = "",
				type = "string"
			},
			{
				name = "tNeedLoop",
				const = false,
				value = "false",
				type = "bool"
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
									func = "waitTime",
									params = {
										{
											field = "tWaitTime"
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
						id = "3",
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
						id = "4",
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

return PBT_Com_Happy
