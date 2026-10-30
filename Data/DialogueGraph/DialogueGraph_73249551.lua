-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73249551.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 73249551,
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					0.803,
					0.574,
					-4.247
				},
				rotationVInput = {
					356.304,
					359.472,
					0
				}
			},
			fields = {
				fStop = 4,
				cameraId = 73249866,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 508
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 2,
				isFadeInVInput = true
			},
			flowIn = {
				In = 0
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
			kind = 21,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		}
	}
}
