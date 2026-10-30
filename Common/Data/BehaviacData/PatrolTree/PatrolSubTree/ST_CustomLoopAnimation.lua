-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_CustomLoopAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_CustomLoopAnimation = {
	behavior = {
		agenttype = "CombatAgent",
		name = "PatrolTree/PatrolSubTree/ST_CustomLoopAnimation",
		version = 5,
		useForRoute = true,
		properties = {},
		pars = {
			{
				const = 0,
				type = "float",
				name = "tWaitTime",
				value = "0"
			},
			{
				const = "",
				type = "string",
				name = "tEmojiBubbleKey",
				value = ""
			},
			{
				const = 5,
				type = "float",
				name = "tEmojiBubbleTimeout",
				value = "5"
			},
			{
				const = "",
				type = "string",
				name = "tAnimationStartKey",
				value = ""
			},
			{
				const = "",
				type = "string",
				name = "tAnimationLoopKey",
				value = ""
			},
			{
				const = "",
				type = "string",
				name = "tAnimationEndKey",
				value = ""
			},
			{
				const = 5,
				type = "float",
				name = "tAnimationTimeout",
				value = "5"
			},
			{
				const = false,
				type = "bool",
				name = "tIsLoop",
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
											field = "tIsLoop"
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
											const = ""
										},
										{
											const = false
										},
										{
											field = "tIsLoop"
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

return ST_CustomLoopAnimation
