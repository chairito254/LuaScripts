-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91418588.lua

return {
	startNodeId = 1,
	dialogueId = 91418588,
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
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6516201,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 4.5,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6516202,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.25,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 6,
						portId = "1"
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
				["0"] = 0,
				["1"] = 0
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
				maxLockTimeVInput = 2.5,
				fovBlendFuncVInput = "Linear"
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 11,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				LockTimeOut = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				maxLockTimeVInput = 3,
				fovBlendFuncVInput = "Linear"
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 12,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				LockTimeOut = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				cancelModifyYawSpeedRatioVInput = true,
				cancelModifyPitchSpeedRatioVInput = true,
				cancelFocusToTargetVInput = true,
				cancelBlendFovVInput = true,
				fovBlendOutFuncVInput = "Linear",
				cancelSetPlayerCamShoulderVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 6,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91036020
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91453746
			},
			fields = {
				entityType = 2
			}
		}
	}
}
