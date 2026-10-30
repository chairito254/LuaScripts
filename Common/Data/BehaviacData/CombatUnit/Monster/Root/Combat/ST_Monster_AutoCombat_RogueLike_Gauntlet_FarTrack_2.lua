-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_RogueLike_Gauntlet_FarTrack_2.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_RogueLike_Gauntlet_FarTrack_2 = {
	behavior = {
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_RogueLike_Gauntlet_FarTrack_2",
		version = 84,
		useForRoute = false,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				value = "0",
				name = "disToTgtForSkillMon",
				const = 0,
				type = "float"
			},
			{
				value = "0",
				name = "goBackDist",
				const = 0,
				type = "float"
			}
		},
		attachments = {},
		node = {
			id = "247",
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
						id = "377",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "355",
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
														const = 70020501
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
							},
							{
								node = {
									id = "378",
									class = "Action",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														const = 7
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
		}
	}
}

return ST_Monster_AutoCombat_RogueLike_Gauntlet_FarTrack_2
