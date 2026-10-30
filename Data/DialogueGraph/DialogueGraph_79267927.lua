-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79267927.lua

return {
	dialogueId = 79267927,
	schema = "v4",
	startNodeId = 1,
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
			inputs = {
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				enhanceAmbientIntensityVInput = true
			},
			fields = {
				topLogoComs = {
					vlog = true,
					teamSpeech = true,
					petFertility = true,
					petChat = true,
					petExchange = true,
					multiPlayer = true,
					callFriends = true,
					alert = true,
					combat = true,
					quest = true,
					photo = true
				}
			},
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
			kind = 4,
			fields = {
				delayTime = 38
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
		}
	}
}
