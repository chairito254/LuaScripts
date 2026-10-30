-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Monster\\ST_Monster_AutoCombat_Boss_90207_BornSkill.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local ST_Monster_AutoCombat_Boss_90207_BornSkill = {
	behavior = {
		name = "ParmonBehaviorTree/SubTree/_Monster/ST_Monster_AutoCombat_Boss_90207_BornSkill",
		useForRoute = false,
		version = 27,
		agenttype = "PuppetAgent",
		properties = {},
		pars = {
			{
				const = 0,
				value = "0",
				name = "tSkillId",
				type = "int"
			}
		},
		attachments = {},
		node = {
			id = "197",
			class = "Parallel",
			properties = {
				{
					ChildFinishPolicy = "CHILDFINISH_ONCE"
				},
				{
					ExitPolicy = "EXIT_ABORT_RUNNINGSIBLINGS"
				},
				{
					FailurePolicy = "FAIL_ON_ONE"
				},
				{
					SuccessPolicy = "SUCCEED_ON_ALL"
				}
			},
			attachments = {},
			children = {
				{
					node = {
						id = "200",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "201",
									class = "Action",
									properties = {
										{
											Method = {
												func = "addAITag",
												params = {
													{
														field = "selfId"
													},
													{
														const = "TA_90207_EnterCombat"
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
									id = "196",
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
														field = "tSkillId"
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
											ResultResumeOption = "BT_NextNode"
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
						id = "199",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "198",
									class = "Action",
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
							},
							{
								node = {
									id = "195",
									class = "Action",
									properties = {
										{
											Method = {
												func = "setFullBodyIdle",
												params = {
													{
														const = ""
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
		}
	}
}

return ST_Monster_AutoCombat_Boss_90207_BornSkill
