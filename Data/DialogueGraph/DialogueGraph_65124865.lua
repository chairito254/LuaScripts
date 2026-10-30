-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_65124865.lua

return {
	startNodeId = 1,
	dialogueId = 65124865,
	schema = "v4",
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				duration = 2,
				emojiName = "Fear"
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 270113
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				}
			},
			fields = {
				duration = 4,
				npcId = 401002,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		[5] = {
			kind = 9,
			valueIn = {
				staticIdVInput = {
					portId = "Value",
					nodeId = 4
				}
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {
		SavedID = 0
	}
}
