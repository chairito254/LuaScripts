-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_SneakOut.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_SneakOut = {
	behavior = {
		agenttype = "WxAgent",
		useForRoute = true,
		name = "ParmonBehaviorTree/SubTree/PBT_SneakOut",
		version = 5,
		properties = {},
		pars = {
			{
				const = false,
				name = "tIsHit",
				type = "bool",
				value = "false"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Action",
			properties = {
				{
					Method = {
						func = "switchToSneakOut",
						params = {
							{
								field = "tIsHit"
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

return PBT_SneakOut
