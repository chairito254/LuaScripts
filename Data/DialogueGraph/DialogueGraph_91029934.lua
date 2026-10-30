-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91029934.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91029934,
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
						nodeId = 4,
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
			kind = 39,
			inputs = {
				maxLockTimeVInput = 99,
				fovBlendFuncVInput = "Linear"
			},
			valueIn = {
				faceToTargetVInput = {
					nodeId = 8,
					portId = "BoneTransform"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6516090,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "EnvBehav_Point_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120102,
				matchAudioDuration = true,
				duration = 2.88,
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"EnvBehav_Point_Start",
					"EnvBehav_Point_Loop",
					"EnvBehav_Point_End",
					{
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
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6516091,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5120100,
				matchAudioDuration = true,
				duration = 4.62,
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
						nodeId = 6,
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
						nodeId = 7,
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
				fovBlendOutFuncVInput = "Linear",
				cancelSetPlayerCamShoulderVInput = true,
				cancelModifyYawSpeedRatioVInput = true,
				cancelModifyPitchSpeedRatioVInput = true
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
			kind = 17,
			inputs = {
				staticIdVInput = 91395349
			},
			fields = {
				entityType = 2
			}
		}
	}
}
