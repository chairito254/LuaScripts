-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_58484036.lua

return {
	startNodeId = 2,
	dialogueId = 58484036,
	schema = "v4",
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 2
			}
		},
		{
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
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801158
			},
			fields = {
				chatType = 5,
				skipTime = 2,
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "End",
						nodeId = 1
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 2
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801166
			},
			fields = {
				chatType = 3,
				portCount = 2,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801167
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801158
			},
			fields = {
				chatType = 5,
				skipTime = 3,
				duration = 4
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801168
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801169
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					-1029.922,
					90.631,
					742.703
				},
				rotationVInput = {
					0,
					31.553,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = true
			}
		}
	}
}
