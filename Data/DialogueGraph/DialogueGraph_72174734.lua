-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72174734.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 72174734,
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
						portId = "In",
						nodeId = 3
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 34,
			inputs = {
				staticIdVInput = 72161034
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 2
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
			kind = 4,
			fields = {
				delayTime = 0.5
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 27
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "AI_IdleSpecial01",
				staticIdVInput = 72161034
			},
			fields = {
				templateId = 401033,
				processingTime = 3.9,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 3
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 72161039
			},
			fields = {
				emojiName = "Happy",
				duration = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 3
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 12
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
						portId = "In",
						nodeId = 13
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 72161034
			},
			fields = {
				emojiName = "Happy",
				duration = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 19
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 72161034,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					99.1,
					0
				},
				targetPositionVInput = {
					-733.7,
					93.603,
					1609.21
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "AI_IdleSpecial01",
				staticIdVInput = 72161034
			},
			fields = {
				templateId = 401033,
				processingTime = 3.9,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 2
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
			},
			flowOut = {
				Out = {
					{
						portId = "0",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0
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
			kind = 19,
			inputs = {
				staticIdVInput = 72161039,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					86.08,
					0
				},
				targetPositionVInput = {
					-733.75,
					93.532,
					1606.87
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0,
							value = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1,
							value = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						portId = "In",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "AI_IdleSpecial01",
				staticIdVInput = 72161039
			},
			fields = {
				templateId = 401033,
				processingTime = 3.9,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 8.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 72161039
			},
			fields = {
				emojiName = "Happy",
				duration = 3
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy",
				staticIdVInput = 72161039
			},
			fields = {
				templateId = 401033,
				processingTime = 3.467,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "0",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CONTROL_PET_GROPU",
					nil,
					{
						[1] = 1002
					},
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 26
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006249,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 33
				}
			},
			fields = {
				duration = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "2",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006260,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 33
				}
			},
			fields = {
				duration = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 401002,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "2",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 72161034
			},
			fields = {
				emojiName = "Happy",
				duration = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CONTROL_PET_GROPU",
					nil,
					{
						[1] = 1002
					},
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006248,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 32
				}
			},
			fields = {
				duration = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "2",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70006259,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 32
				}
			},
			fields = {
				duration = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 401002,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "2",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 34,
			inputs = {
				staticIdVInput = 72161039
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72161034
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72161039
			},
			fields = {
				entityType = 2
			}
		}
	}
}
