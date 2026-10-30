-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72035993.lua

return {
	startNodeId = 1,
	dialogueId = 72035993,
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 20,
				blendTimeVInput = 9,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-680.256,
					141.701,
					815.478
				},
				rotationVInput = {
					17.683,
					86.327,
					0.015
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 650,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 2900,
				fStop = 25,
				cameraId = 72532417,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4.5
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
			kind = 21,
			inputs = {
				blendTimeVInput = 1
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
