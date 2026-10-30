-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91437536.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91437536,
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 3304540,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.38,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 3304541,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.88,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5150018,
				matchAudioDuration = true
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
			kind = 39,
			inputs = {
				maxLockTimeVInput = 3,
				heightDeltaVInput = 2,
				fovBlendFuncVInput = "Linear",
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							time = 0,
							value = 0,
							inTangent = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							time = 1,
							value = 1,
							inTangent = 0,
							weightedMode = 0
						}
					}
				},
				shoulderVInput = {
					-2.97,
					0,
					0
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 8
				}
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
			kind = 4,
			fields = {
				delayTime = 3
			},
			flowIn = {
				In = 0
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
			kind = 47,
			inputs = {
				cancelBlendFovVInput = true,
				fovBlendOutFuncVInput = "Linear",
				cancelSetPlayerCamShoulderVInput = true,
				cancelModifyYawSpeedRatioVInput = true,
				cancelModifyPitchSpeedRatioVInput = true,
				cancelFocusToTargetVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91124586
			},
			fields = {
				entityType = 2
			}
		}
	}
}
