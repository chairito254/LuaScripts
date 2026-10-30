-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_CustomAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_CustomAnimation = {
	behavior = {
		version = 8,
		name = "ParmonBehaviorTree/SubTree/PBT_CustomAnimation",
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tWaitTime",
				type = "float",
				const = 0,
				value = "0"
			},
			{
				name = "tAnimationKey",
				type = "string",
				const = "",
				value = ""
			},
			{
				name = "tAnimationTimeout",
				type = "float",
				const = 5,
				value = "5"
			},
			{
				name = "tEmojiBubbleKey",
				type = "string",
				const = "",
				value = ""
			},
			{
				name = "tEmojiBubbleTimeout",
				type = "float",
				const = 5,
				value = "5"
			},
			{
				name = "tTimelineTag",
				type = "string",
				const = "",
				value = ""
			},
			{
				name = "tNeedLoop",
				type = "bool",
				const = false,
				value = "false"
			},
			{
				name = "tAnimationPlayOnce",
				type = "bool",
				const = false,
				value = "false"
			},
			{
				name = "tEmojiBubbleMustPlayFull",
				type = "bool",
				const = false,
				value = "false"
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
											field = "tEmojiBubbleMustPlayFull"
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
						id = "6",
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
											field = "tAnimationPlayOnce"
										},
										{
											const = 10
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

return PBT_CustomAnimation
