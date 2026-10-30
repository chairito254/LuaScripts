-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79509747.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 79509747,
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
			kind = 24,
			inputs = {
				switchToWalkVInput = true
			},
			flowIn = {
				In = 0
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
			kind = 39,
			inputs = {
				targetZoomVInput = 0.15,
				maxLockTimeVInput = 999,
				fovBlendTimeVInput = 2,
				fovBlendFuncVInput = "Linear",
				blendToFovVInput = 60,
				playerCamShoulderVInput = {
					0.25,
					-0.1,
					0.2
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				LockTimeOut = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5
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
		}
	}
}
