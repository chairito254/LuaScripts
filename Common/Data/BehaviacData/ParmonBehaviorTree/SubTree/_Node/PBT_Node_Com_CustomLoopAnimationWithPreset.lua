-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_CustomLoopAnimationWithPreset.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_CustomLoopAnimationWithPreset = {
	behavior = {
		version = 5,
		useForRoute = true,
		agenttype = "CombatAgent",
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_CustomLoopAnimationWithPreset",
		properties = {},
		pars = {
			{
				value = "0",
				type = "float",
				name = "tWaitTime",
				const = 0
			},
			{
				value = "",
				type = "string",
				name = "tEmojiBubbleKey",
				const = ""
			},
			{
				value = "5",
				type = "float",
				name = "tEmojiBubbleTimeout",
				const = 5
			},
			{
				value = "",
				type = "string",
				name = "tAnimationStartKey",
				const = ""
			},
			{
				value = "",
				type = "string",
				name = "tAnimationLoopKey",
				const = ""
			},
			{
				value = "",
				type = "string",
				name = "tAnimationEndKey",
				const = ""
			},
			{
				value = "5",
				type = "float",
				name = "tAnimationTimeout",
				const = 5
			},
			{
				value = "",
				type = "string",
				name = "tTimelineTag",
				const = ""
			},
			{
				value = "false",
				type = "bool",
				name = "tNeedLoop",
				const = false
			},
			{
				value = "false",
				type = "bool",
				name = "tAnimationPlayOnce",
				const = false
			},
			{
				value = "",
				type = "string",
				name = "tPresetName",
				const = ""
			},
			{
				value = "0",
				type = "int",
				name = "tLoopCount",
				const = 0
			},
			{
				value = "0:",
				type = "vector<string>",
				name = "tRenderNameList",
				const = {}
			},
			{
				value = "1",
				type = "float",
				name = "tPresetDuration",
				const = 1
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
						id = "5",
						class = "Action",
						properties = {
							{
								Method = {
									func = "playPreset",
									params = {
										{
											field = "selfId"
										},
										{
											field = "tPresetName"
										},
										{
											field = "tPresetDuration"
										},
										{
											const = false
										},
										{
											field = "tLoopCount"
										},
										{
											field = "tRenderNameList"
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
						attachments = {
							{
								effector = true,
								precondition = false,
								id = "7",
								class = "Effector",
								transition = false,
								properties = {
									{
										Operator = "Invalid"
									},
									{
										Opl = {
											func = "stopPreset",
											params = {
												{
													field = "selfId"
												},
												{
													field = "tPresetName"
												}
											}
										}
									},
									{
										Phase = "Both"
									}
								}
							}
						},
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
									func = "stopPreset",
									params = {
										{
											field = "selfId"
										},
										{
											field = "tPresetName"
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
				}
			}
		}
	}
}

return PBT_Node_Com_CustomLoopAnimationWithPreset
