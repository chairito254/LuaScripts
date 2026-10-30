-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_70832768.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 70832768,
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
			kind = 34,
			valueIn = {
				staticIdVInput = {
					nodeId = 4,
					portId = "Value"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 100240101
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				chatType = 1,
				anim = "Behav_Angry",
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		[5] = {
			kind = 17,
			valueIn = {
				staticIdVInput = {
					nodeId = 4,
					portId = "Value"
				}
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {
		StaticID = 0
	}
}
