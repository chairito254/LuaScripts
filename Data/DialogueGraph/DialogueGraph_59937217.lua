-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_59937217.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 59937217,
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
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					180,
					0
				},
				targetPositionVInput = {
					-330.44,
					0.05,
					-7.74
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 22
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
							time = 0,
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1
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
				portCount = 9
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
						nodeId = 7
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 13
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 16
					}
				},
				["8"] = {
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
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 23
				}
			},
			fields = {
				entityType = 1,
				templateId = 1020100,
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 24
				}
			},
			fields = {
				entityType = 1,
				templateId = 1020100,
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
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 70002277,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 25
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 26
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 35
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 27
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 28
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 38
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 29
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 30
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 36
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 31
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 32
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 37
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
				playableStateVInput = "Mimicry_End"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 33
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 34
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Mimicry_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 39
				}
			},
			fields = {
				entityType = 2,
				templateId = 11020100,
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
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364953
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364953
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364955
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364955
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364954
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364954
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364956
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364956
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364957
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364957
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364953
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364954
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364956
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364955
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 60364957
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {
		myInteger = 0
	}
}
