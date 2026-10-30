-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\PBT_FollowIdle.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_FollowIdle = {
	behavior = {
		agenttype = "PetAgent",
		useForRoute = false,
		name = "ParmonBehaviorTree/SubTree/PBT_FollowIdle",
		version = 5,
		properties = {},
		pars = {
			{
				const = 0,
				name = "tFollowEntActorID",
				type = "int",
				value = "0"
			}
		},
		attachments = {},
		node = {
			id = "1",
			class = "Selector",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						id = "2",
						class = "Sequence",
						properties = {},
						attachments = {
							{
								effector = false,
								precondition = true,
								class = "Precondition",
								id = "8",
								transition = false,
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "Equal"
									},
									{
										Opl = {
											func = "checkIsCloseToFollowTarget",
											params = {
												{
													field = "masterId"
												}
											}
										}
									},
									{
										Opr2 = {
											const = false
										}
									},
									{
										Phase = "Update"
									}
								}
							}
						},
						children = {
							{
								node = {
									id = "4",
									class = "Action",
									properties = {
										{
											Method = {
												func = "waitTime",
												params = {
													{
														const = 9
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
									id = "5",
									class = "Action",
									properties = {
										{
											Method = {
												func = "petPatrolInRange"
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
						id = "3",
						class = "Sequence",
						properties = {},
						attachments = {},
						children = {
							{
								node = {
									id = "6",
									class = "Action",
									properties = {
										{
											Method = {
												func = "moveAside",
												params = {
													{
														field = "masterId"
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
									id = "7",
									class = "Action",
									properties = {
										{
											Method = {
												func = "turnToTarget",
												params = {
													{
														field = "masterId"
													},
													{
														const = false
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
							}
						}
					}
				}
			}
		}
	}
}

return PBT_FollowIdle
