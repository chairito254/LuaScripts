-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_85586645.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 85586645,
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
						portId = "Play",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "SFX_ACT_10431Rhythm_Jump"
			},
			valueIn = {
				audioTransformVInput = {
					portId = "BoneTransform",
					nodeId = 4
				}
			},
			fields = {
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "JumpSpray"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 4
				}
			},
			fields = {
				entityType = 2,
				templateId = 401056,
				processingTime = 0.75,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 86116438
			},
			fields = {
				entityType = 2
			}
		}
	}
}
