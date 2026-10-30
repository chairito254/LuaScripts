-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72037468.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 72037468,
	nodes = {
		[0] = {
			kind = 6,
			flowIn = {
				End = true
			}
		},
		{
			kind = 8,
			flowOut = {
				Start = {
					{
						nodeId = 2,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 18,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706001
			},
			fields = {
				anim = "Behav_Angry",
				duration = 2,
				chatType = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["0"] = true,
				["1"] = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				fovBlendOutTimeVInput = 1.5,
				fovBlendOutFuncVInput = "EaseOut"
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706002
			},
			fields = {
				anim = "Behav_Alert",
				duration = 2,
				chatType = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				fovBlendFuncVInput = "EaseIn",
				maxLockTimeVInput = 3,
				fovBlendTimeVInput = 1,
				shoulderVInput = {
					0.6,
					0.6,
					0.6
				}
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 11,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 69690868
			},
			fields = {
				entityType = 2
			}
		}
	}
}
