-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72061903.lua

return {
	startNodeId = 1,
	dialogueId = 72061903,
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
			kind = 56,
			fields = {
				shakeType = 1,
				cameraShakeItem = {
					flags = 0,
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadius = 70,
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								weightedMode = 0,
								time = 0,
								value = 1
							},
							{
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								weightedMode = 0,
								time = 1,
								value = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					noisePosAmplitudes = {
						0,
						0,
						0
					},
					noiseRotAmplitudes = {
						3,
						3,
						3
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								weightedMode = 0,
								time = 0,
								value = 1
							},
							{
								outWeight = 0,
								inWeight = 0,
								outTangent = 0,
								inTangent = 0,
								weightedMode = 0,
								time = 1,
								value = 1
							}
						}
					},
					noisePosSeeds = {
						0,
						0,
						0
					},
					noiseRotSeeds = {
						0,
						0,
						0
					}
				}
			},
			flowIn = {
				In = 0
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
				delayTime = 10
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
