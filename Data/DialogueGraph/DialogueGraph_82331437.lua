-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_82331437.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 82331437,
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
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3709070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				delayTime = 2
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
			kind = 27,
			fields = {
				uid = 121,
				param = {
					3709001,
					0,
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					{
						0,
						0,
						0
					},
					true,
					false,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				cancelFocusToTargetVInput = true,
				cancelBlendFovVInput = true,
				fovBlendOutTimeVInput = 2,
				fovBlendOutFuncVInput = "Linear"
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
			kind = 39,
			inputs = {
				blendToFovVInput = 32,
				transitionSpeedVInput = 0.1,
				resetOnFinishVInput = true,
				maxLockTimeVInput = 5,
				fovBlendTimeVInput = 3,
				fovBlendFuncVInput = "Linear",
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							value = 0,
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 0,
							inTangent = 0
						},
						{
							value = 1,
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 1,
							inTangent = 0
						}
					}
				},
				shoulderVInput = {
					0.72,
					0.18,
					0
				}
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 10,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			}
		},
		[10] = {
			kind = 17,
			inputs = {
				staticIdVInput = 82339394
			},
			fields = {
				entityType = 2
			}
		}
	}
}
