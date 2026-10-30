-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91350610.lua

return {
	startNodeId = 1,
	dialogueId = 91350610,
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
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Temp_YKLBus_Stop01.prefab",
				playOnEulerAngleVInput = {
					-1.3,
					4.16,
					0.72
				},
				playOnPositionVInput = {
					-700.11,
					24.45,
					1906.34
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
				StartPlay = {
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
				delayTime = 2
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
			kind = 36,
			inputs = {
				retValueInput = 1
			},
			flowIn = {
				In = 0
			}
		}
	}
}
