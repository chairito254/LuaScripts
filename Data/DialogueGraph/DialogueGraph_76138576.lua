-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76138576.lua

return {
	startNodeId = 1,
	dialogueId = 76138576,
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
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Angry"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 17,
					portId = "EntityID"
				}
			},
			fields = {
				activePlayLip = false,
				activePlayEmotion = true,
				noBlink = true
			},
			flowIn = {
				In = 0,
				StopEmotion = 1
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
			kind = 4,
			fields = {
				delayTime = 50
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 3,
						portId = "StopEmotion"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-525.422,
					54.187,
					846.872
				},
				rotationVInput = {
					359.481,
					170.125,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 76678679
			},
			flowIn = {
				In = 0
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
			kind = 4,
			fields = {
				delayTime = 20
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
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_PointTo01_Start",
				playStartLoopEndVInput = true,
				animationLayerVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 12,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400077,
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_PointTo01_Start",
					"TalkUpper_PointTo01_Loop",
					"TalkUpper_PointTo01_End"
				}
			},
			flowIn = {
				In = 0
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
		[12] = {
			kind = 9,
			inputs = {
				staticIdVInput = 88066246
			},
			fields = {
				entityType = 2
			}
		},
		[17] = {
			kind = 9,
			inputs = {
				staticIdVInput = 88064950
			},
			fields = {
				entityType = 2
			}
		}
	}
}
