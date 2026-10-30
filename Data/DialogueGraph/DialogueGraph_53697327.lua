-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_53697327.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 53697327,
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
					nodeId = 8,
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
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				duration = 4,
				emojiName = "Doubt"
			},
			flowIn = {
				In = true
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
			kind = 5,
			inputs = {
				playableStateVInput = "HideStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 401001,
				playAniType = 1,
				entityType = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "HideLoop"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 401001,
				playAniType = 1,
				entityType = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "HideEnd"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 401001,
				playAniType = 1,
				entityType = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 68
		},
		[9] = {
			kind = 9,
			valueIn = {
				staticIdVInput = {
					nodeId = 8,
					portId = "Value"
				}
			},
			fields = {
				entityType = 2
			}
		},
		[10] = {
			kind = 73,
			inputs = {
				presetNameVInput = "FocusToTarget"
			}
		}
	},
	blackboard = {
		AskhelpID = 0
	}
}
