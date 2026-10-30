-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CustomLoopAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CustomLoopAnimation = {
	behavior = {
		version = 9,
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/PBT_CustomLoopAnimation",
		properties = {},
		pars = {
			{
				type = "float",
				const = 0,
				value = "0",
				name = "tWaitTime"
			},
			{
				type = "string",
				const = "",
				value = "",
				name = "tEmojiBubbleKey"
			},
			{
				type = "float",
				const = 5,
				value = "5",
				name = "tEmojiBubbleTimeout"
			},
			{
				type = "string",
				const = "",
				value = "",
				name = "tAnimationStartKey"
			},
			{
				type = "string",
				const = "",
				value = "",
				name = "tAnimationLoopKey"
			},
			{
				type = "string",
				const = "",
				value = "",
				name = "tAnimationEndKey"
			},
			{
				type = "float",
				const = 5,
				value = "5",
				name = "tAnimationTimeout"
			},
			{
				type = "string",
				const = "",
				value = "",
				name = "tTimelineTag"
			},
			{
				type = "bool",
				const = false,
				value = "false",
				name = "tNeedLoop"
			},
			{
				type = "bool",
				const = false,
				value = "false",
				name = "tAnimationPlayOnce"
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
											field = "tNeedLoop"
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
									func = "playPhaseAction",
									params = {
										{
											field = "tAnimationStartKey"
										},
										{
											field = "tAnimationLoopKey"
										},
										{
											field = "tAnimationEndKey"
										},
										{
											field = "tAnimationTimeout"
										},
										{
											field = "tTimelineTag"
										},
										{
											field = "tAnimationPlayOnce"
										},
										{
											field = "tNeedLoop"
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

return PBT_CustomLoopAnimation
