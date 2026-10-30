-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90849954.lua

return {
	startNodeId = 1,
	dialogueId = 90849954,
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
			kind = 4,
			fields = {
				delayTime = 1
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
				blendToFovVInput = 30,
				transitionSpeedVInput = 0,
				targetZoomVInput = 0.15,
				playerCamTransitionSpeedVInput = 2.5,
				pitchSpeedRatioVInput = 0.1,
				yawSpeedRatioVInput = 0.14,
				fovBlendFuncVInput = "Cubic",
				playerCamShoulderVInput = {
					0.382,
					-0.1,
					0.2
				}
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
			kind = 4,
			fields = {
				delayTime = 60
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				fovBlendOutTimeVInput = 6,
				fovBlendOutFuncVInput = "Linear",
				cancelSetPlayerCamShoulderVInput = true,
				cancelFocusToTargetVInput = true,
				cancelBlendFovVInput = true
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
