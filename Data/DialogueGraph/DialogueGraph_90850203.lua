-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90850203.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 90850203,
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
			kind = 11,
			fields = {
				modeInfo = {
					blockCameraZoom = false,
					hideTopLogo = false,
					hideMarkShare = false,
					hideInteractionSign = false,
					showHud = false,
					hideAllUI = false,
					disableSpaceFollow = false,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = false,
					blockEvent = false,
					modeType = 1
				}
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 9
					}
				},
				["3"] = {
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
				dialogueIdVInput = 260240171,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.38,
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
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26024017,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400702,
				matchAudioDuration = true,
				duration = 10,
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
						portId = "In",
						nodeId = 6
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
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 10,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				cancelBlendFovVInput = true,
				fovBlendOutFuncVInput = "Cubic",
				cancelSetPlayerCamShoulderVInput = true,
				cancelFocusToTargetVInput = true
			},
			flowIn = {
				In = 0
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
			kind = 5,
			inputs = {
				staticIdVInput = 90850182,
				playableStateVInput = "EnvBehav_Clap"
			},
			fields = {
				entityType = 2,
				templateId = 400700,
				processingTime = 1.333,
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
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90850182,
				playableStateVInput = "EnvBehav_Clap"
			},
			fields = {
				entityType = 2,
				templateId = 400700,
				processingTime = 1.333,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_IS_CONTROL_PET",
					nil,
					nil,
					"=",
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				maxLockTimeVInput = 4,
				fovBlendTimeVInput = 4,
				fovBlendFuncVInput = "Linear",
				blendToFovVInput = 30,
				transitionSpeedVInput = 5,
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							value = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 1,
							value = 1
						}
					}
				},
				shoulderVInput = {
					0.6,
					0.2,
					0.4
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 17
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 39,
			inputs = {
				resetOnFinishVInput = true,
				maxLockTimeVInput = 5,
				targetZoomVInput = 0.5,
				fovBlendFuncVInput = "Cubic",
				transitionSpeedVInput = 5,
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							value = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 1,
							value = 1
						}
					}
				},
				shoulderVInput = {
					0.4,
					1.5,
					0
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 18
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		[17] = {
			kind = 17,
			inputs = {
				staticIdVInput = 72312830
			},
			fields = {
				entityType = 2
			}
		},
		[18] = {
			kind = 17,
			inputs = {
				staticIdVInput = 72312830
			},
			fields = {
				entityType = 2
			}
		}
	}
}
