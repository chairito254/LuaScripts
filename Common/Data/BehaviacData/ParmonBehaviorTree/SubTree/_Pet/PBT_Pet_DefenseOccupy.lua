-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Pet\\PBT_Pet_DefenseOccupy.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Pet_DefenseOccupy = {
	behavior = {
		agenttype = "PetAgent",
		version = 13,
		name = "ParmonBehaviorTree/SubTree/_Pet/PBT_Pet_DefenseOccupy",
		useForRoute = false,
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "11",
			class = "DecoratorLoop",
			properties = {
				{
					Count = {
						const = -1
					}
				},
				{
					DecorateWhenChildEnds = "false"
				},
				{
					DoneWithinFrame = "false"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						id = "12",
						class = "Action",
						properties = {
							{
								Method = {
									func = "waitTime",
									params = {
										{
											const = 60
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

return PBT_Pet_DefenseOccupy
