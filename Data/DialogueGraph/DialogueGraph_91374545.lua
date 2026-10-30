-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91374545.lua

return {
	startNodeId = 1,
	dialogueId = 91374545,
	schema = 1,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 0
			},
			flowIn = {
				End = 0
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				maxLockTimeVInput = 3,
				fovBlendFuncVInput = "Linear",
				playerCamTransitionSpeedVInput = 2
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 6,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				LockTimeOut = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				cancelFocusToTargetVInput = true,
				fovBlendOutFuncVInput = "Linear"
			},
			flowIn = {
				In = 0
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
			kind = 17,
			inputs = {
				staticIdVInput = 91246717
			},
			fields = {
				entityType = 2
			}
		}
	}
}
