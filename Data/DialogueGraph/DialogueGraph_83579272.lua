-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_83579272.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 83579272,
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
			kind = 24,
			inputs = {
				switchToWalkVInput = true,
				switchToPetVInput = true
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
						nodeId = 5
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					135.265,
					0
				},
				targetPositionVInput = {
					-672.44,
					26.997,
					1988.64
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 9
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
			}
		},
		{
			kind = 39,
			inputs = {
				heightDeltaVInput = 3,
				fovBlendFuncVInput = "Linear",
				maxLockTimeVInput = 5,
				shoulderVInput = {
					0,
					0.12,
					0.3
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 10
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3712070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3712071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3712072,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 6,
				blackScreenIntervalTime = 2,
				portCount = 1,
				blackScreenPlayType = 0,
				anim = "Behav_Love",
				skipTime = 2,
				npcStaticId = -1,
				npcId = 500137,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				animCfg = {
					[1] = "Behav_Love",
					[2] = {
						[1] = true,
						[2] = 0
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 83572781
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 83574234
			},
			fields = {
				entityType = 2
			}
		}
	}
}
