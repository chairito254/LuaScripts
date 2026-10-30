-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\BehaviacData\\ParmonBehaviorTree\\SubTree\\_Behav\\PBT_Behav_Home_Operate.lua

local BaseEnum = require("Common.Data.BehaviacData.BaseEnum.BaseEnum")
local Enums = require("Common.AI.Behaviac.Enums")
local PBT_Behav_Home_Operate = {
	behavior = {
		useForRoute = false,
		version = 28,
		name = "ParmonBehaviorTree/SubTree/_Behav/PBT_Behav_Home_Operate",
		agenttype = "CombatAgent",
		properties = {},
		pars = {
			{
				const = "",
				value = "",
				type = "string",
				name = "tAnimationKey"
			},
			{
				const = "",
				value = "",
				type = "string",
				name = "tFaceAnimationkey"
			},
			{
				value = "0:",
				type = "vector<float>",
				name = "tTargetPos",
				const = {}
			},
			{
				const = 0,
				value = "0",
				type = "float",
				name = "tYaw"
			},
			{
				value = "0:",
				type = "vector<float>",
				name = "tWorkPos",
				const = {}
			}
		},
		attachments = {},
		node = {
			class = "Sequence",
			id = "2",
			properties = {},
			attachments = {},
			children = {
				{
					node = {
						class = "Action",
						id = "19",
						properties = {
							{
								Method = {
									func = "switchToHomeWorkNow",
									params = {
										{
											field = "tWorkPos"
										},
										{
											field = "tYaw"
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
						class = "Action",
						id = "9",
						properties = {
							{
								Method = {
									func = "playAction",
									params = {
										{
											field = "tAnimationKey"
										},
										{
											const = 0
										},
										{
											const = ""
										},
										{
											const = true
										},
										{
											const = false
										},
										{
											const = 0
										},
										{
											const = BaseEnum.AIAnimationRootMotionType.Default
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
						attachments = {
							{
								transition = false,
								class = "Precondition",
								precondition = true,
								effector = false,
								id = "10",
								properties = {
									{
										BinaryOperator = "And"
									},
									{
										Operator = "Equal"
									},
									{
										Opl = {
											func = "playRawAnimation",
											params = {
												{
													field = "tFaceAnimationkey"
												}
											}
										}
									},
									{
										Opr2 = {
											const = BaseEnum.EBTStatus.BT_SUCCESS
										}
									},
									{
										Phase = "Enter"
									}
								}
							},
							{
								transition = false,
								class = "Effector",
								precondition = false,
								effector = true,
								id = "11",
								properties = {
									{
										Operator = "Invalid"
									},
									{
										Opl = {
											func = "stopRawAnimation",
											params = {
												{
													field = "tFaceAnimationkey"
												}
											}
										}
									},
									{
										Phase = "Both"
									}
								}
							},
							{
								transition = false,
								class = "Effector",
								precondition = false,
								effector = true,
								id = "16",
								properties = {
									{
										Operator = "Invalid"
									},
									{
										Opl = {
											func = "switchToStateNow",
											params = {
												{
													const = "LOCOMOTION"
												},
												{
													const = ""
												}
											}
										}
									},
									{
										Phase = "Both"
									}
								}
							}
						},
						children = {}
					}
				}
			}
		}
	}
}

return PBT_Behav_Home_Operate
