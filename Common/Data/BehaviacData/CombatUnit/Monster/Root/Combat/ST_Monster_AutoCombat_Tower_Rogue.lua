-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_Tower_Rogue.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Tower_Rogue = {
	behavior = {
		agenttype = "PuppetAgent",
		version = 17,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_Tower_Rogue",
		useForRoute = false,
		properties = {},
		pars = {
			{
				const = 0,
				name = "disToTgtForSkillMon",
				type = "float",
				value = "0"
			},
			{
				const = 0,
				name = "goBackDist",
				type = "float",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "3",
			class = "DecoratorLoop",
			properties = {
				{
					Count = {
						const = -1
					}
				},
				{
					DecorateWhenChildEnds = "true"
				},
				{
					DoneWithinFrame = "false"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						id = "187",
						class = "Action",
						properties = {
							{
								Method = {
									func = "castSkill",
									params = {
										{
											field = "tgt"
										},
										{
											const = 10110221
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = true
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
								ResultResumeOption = "BT_ResumeTree"
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

return ST_Monster_AutoCombat_Tower_Rogue
