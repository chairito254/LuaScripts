-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Wild\\10191_Shelly\\ST_Wild_10191_GrassGame.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Wild_10191_GrassGame = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Wild/10191_Shelly/ST_Wild_10191_GrassGame",
		version = 5,
		useForRoute = true,
		agenttype = "CombatAgent",
		properties = {},
		pars = {},
		attachments = {},
		node = {
			id = "2",
			class = "Action",
			properties = {
				{
					Method = {
						func = "castSkill",
						params = {
							{
								const = 0
							},
							{
								const = 11910310
							},
							{
								const = false
							},
							{
								const = 0
							},
							{
								const = false
							},
							{
								const = BaseEnum.CastAbilitySourceType.Normal
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

return ST_Wild_10191_GrassGame
