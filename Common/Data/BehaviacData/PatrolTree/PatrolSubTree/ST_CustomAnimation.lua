-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\PatrolTree\\PatrolSubTree\\ST_CustomAnimation.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_CustomAnimation = {
	behavior = {
		version = 6,
		name = "PatrolTree/PatrolSubTree/ST_CustomAnimation",
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				name = "tWaitTime",
				value = "0",
				const = 0,
				type = "float"
			},
			{
				name = "tAnimationKey",
				value = "",
				const = "",
				type = "string"
			},
			{
				name = "tAnimationTimeout",
				value = "5",
				const = 5,
				type = "float"
			},
			{
				name = "tEmojiBubbleKey",
				value = "",
				const = "",
				type = "string"
			},
			{
				name = "tEmojiBubbleTimeout",
				value = "5",
				const = 5,
				type = "float"
			},
			{
				name = "tNeedLoop",
				value = "false",
				const = false,
				type = "bool"
			},
			{
				name = "tEmojiBubbleMustPlayFull",
				value = "false",
				const = false,
				type = "bool"
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "1",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "2",
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
						class = "Action",
						id = "3",
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
						class = "Action",
						id = "4",
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
											const = ""
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

return ST_CustomAnimation
