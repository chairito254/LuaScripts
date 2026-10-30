-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\CombatUnit\\Monster\\Root\\Combat\\ST_Monster_AutoCombat_RogueLike_Gauntlet_FarLaser_2.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_RogueLike_Gauntlet_FarLaser_2 = {
	behavior = {
		version = 84,
		useForRoute = false,
		agenttype = "PuppetAgent",
		name = "CombatUnit/Monster/Root/Combat/ST_Monster_AutoCombat_RogueLike_Gauntlet_FarLaser_2",
		properties = {},
		pars = {
			{
				type = "float",
				value = "0",
				name = "disToTgtForSkillMon",
				const = 0
			},
			{
				type = "float",
				value = "0",
				name = "goBackDist",
				const = 0
			}
		},
		attachments = {},
		node = {
			class = "DecoratorLoop",
			id = "247",
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
						class = "Sequence",
						id = "377",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									class = "Assignment",
									id = "379",
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
									class = "Action",
									id = "378",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														const = 4.5
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
									id = "355",
									properties = {
										{
											Method = {
												func = "castSkill",
												params = {
													{
														field = "tgt"
													},
													{
														const = 70020301
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
		}
	}
}

return ST_Monster_AutoCombat_RogueLike_Gauntlet_FarLaser_2
