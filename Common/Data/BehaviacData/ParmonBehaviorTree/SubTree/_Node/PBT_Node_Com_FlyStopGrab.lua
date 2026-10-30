-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Node\\PBT_Node_Com_FlyStopGrab.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Node_Com_FlyStopGrab = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Node/PBT_Node_Com_FlyStopGrab",
		version = 18,
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			class = "Sequence",
			id = "15",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "DecoratorAlwaysSuccess",
						id = "20",
						properties = {
							{
								DecorateWhenChildEnds = "true"
							}
						},
						attachments = {},
						children = {
							{
								node = {
									class = "Action",
									id = "14",
									properties = {
										{
											Method = {
												func = "flyStopGrab",
												params = {
													{
														const = 5
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
				},
				{
					node = {
						class = "Action",
						id = "18",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											const = 0.5
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

return PBT_Node_Com_FlyStopGrab
