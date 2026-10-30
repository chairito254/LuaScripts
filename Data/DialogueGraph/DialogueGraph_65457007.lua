-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_65457007.lua

return {
	dialogueId = 65457007,
	schema = 1,
	startNodeId = 1,
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 30
				},
				targetEulerAngleVInput = {
					portId = "OutEulerAngle",
					nodeId = 32
				},
				targetPositionVInput = {
					portId = "OutPosition",
					nodeId = 32
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
							inTangent = 0,
							value = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							time = 0
						},
						{
							inTangent = 1,
							value = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							time = 1
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
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 4
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
						nodeId = 15
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 20
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveLoop",
				fadeDurationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 31
				}
			},
			fields = {
				entityType = 1,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
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
				delayTime = 2
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
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "Stop",
						nodeId = 4
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveEnd",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 31
				}
			},
			fields = {
				entityType = 1,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 31
				}
			},
			fields = {
				entityType = 1,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "End",
						nodeId = 0
					}
				},
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
				dialogueIdVInput = 70002701,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveLoop",
				fadeDurationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 33
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
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
						portId = "Stop",
						nodeId = 10
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveEnd",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 33
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 33
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveLoop",
				fadeDurationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 34
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 17
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
						portId = "Stop",
						nodeId = 15
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveEnd",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 34
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 34
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveLoop",
				fadeDurationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 35
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 22
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
						portId = "Stop",
						nodeId = 20
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveEnd",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 35
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 35
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveLoop",
				fadeDurationVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 36
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 27
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
						portId = "Stop",
						nodeId = 25
					}
				},
				["1"] = {
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
				playableStateVInput = "Behav_LoveEnd",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 36
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 36
				}
			},
			fields = {
				entityType = 2,
				templateId = 1002400,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 43,
			inputs = {
				slotIDVInput = 65462947,
				sceneIDVinput = 415,
				dialogsetIDVInput = 65462945
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 65357390
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 65358462
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 65358477
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 65358507
			},
			fields = {
				entityType = 2
			}
		}
	}
}
