-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_48880636.lua

return {
	dialogueId = 48880636,
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 5,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 8
				}
			},
			fields = {
				playAniType = 2
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetPositionVInput = {
					-360.14,
					66.78,
					1857.7
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 5,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				playAniType = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 5,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 9
				}
			},
			fields = {
				playAniType = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 2
			}
		}
	}
}
