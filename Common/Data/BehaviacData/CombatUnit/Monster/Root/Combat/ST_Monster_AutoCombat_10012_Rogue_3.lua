-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_10012_Rogue_3.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_10012_Rogue_3 = {
	behavior = {
		agenttype = "PuppetAgent",
		version = 52,
		useForRoute = false,
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_10012_Rogue_3",
		properties = {},
		pars = {
			{
				name = "disToTgtForSkillMon",
				value = "0",
				type = "float",
				const = 0
			},
			{
				name = "goBackDist",
				value = "0",
				type = "float",
				const = 0
			}
		},
		attachments = {},
		node = {
			id = "334",
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
						id = "335",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "336",
									class = "Assignment",
									properties = {
										{
											CastRight = "false"
										},
										{
											Opl = {
												field = "tgt"
											}
										},
										{
											Opr = {
												func = "getAuthorityPlayer"
											}
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "337",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToTarget",
												params = {
													{
														field = "tgt"
													},
													{
														const = true
													},
													{
														const = 0
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
											ResultResumeOption = "BT_ResumeSelf"
										}
									},
									attachments = {},
									children = {}
								}
							},
							{
								node = {
									id = "338",
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
														const = 10120810
													},
													{
														const = true
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
		}
	}
}

return ST_Monster_AutoCombat_10012_Rogue_3
