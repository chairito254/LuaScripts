-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_77242332.lua

return {
	dialogueId = 77242332,
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
			kind = 11,
			fields = {
				modeInfo = {
					blockEvent = false,
					modeType = 1,
					blockCameraZoom = false,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = true,
					resetAllActions = false,
					hideUIWhiteList = {
						[5] = true,
						[306] = true,
						[46] = true
					},
					toplogoComList = {
						callFriends = true,
						bubble = true,
						alert = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true
					}
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
				portCount = 2
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
			kind = 24,
			inputs = {
				speedVInput = 0.95,
				switchToWalkVInput = true
			},
			flowIn = {
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
			kind = 39,
			inputs = {
				playerCamTransitionSpeedVInput = 0.5,
				pitchSpeedRatioVInput = 0.5,
				maxLockTimeVInput = 4,
				fovBlendTimeVInput = 2,
				fovBlendFuncVInput = "Linear",
				blendToFovVInput = 60,
				playerCamShoulderVInput = {
					0.25,
					-0.1,
					0.2
				},
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 0
						},
						{
							inTangent = 0,
							time = 3,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0
						}
					}
				},
				shoulderVInput = {
					0.25,
					-0.1,
					0.2
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 35
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
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 38
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 35
				}
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707325,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 2,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
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
						nodeId = 9
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707326,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 10
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
						nodeId = 11
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
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 3707327,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				chatType = 6,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400130,
				matchAudioDuration = false,
				duration = 2.75,
				disableCamera = false
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
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239040,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400100,
				processingTime = 2
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
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 20,
				speedVInput = 1.2,
				staticIdVInput = 77239040,
				targetPositionVInput = {
					47.37,
					51.76,
					1027.28
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
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1
						},
						{
							inTangent = 1,
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0
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
				staticIdVInput = 77239040,
				playableStateVInput = "Story_Greet"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400100,
				processingTime = 4.9
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				fovBlendOutFuncVInput = "Linear",
				cancelFocusToTargetVInput = true,
				fovBlendOutTimeVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 28,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 38
				}
			},
			flowIn = {
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
			kind = 2,
			fields = {
				portCount = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["1"] = {
					{
						portId = "In",
						nodeId = 22
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 27
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
						portId = "In",
						nodeId = 23
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
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				playerCamTransitionSpeedVInput = 0.5,
				pitchSpeedRatioVInput = 0.5,
				maxLockTimeVInput = 3,
				fovBlendTimeVInput = 2,
				fovBlendFuncVInput = "Linear",
				blendToFovVInput = 60,
				playerCamShoulderVInput = {
					0.25,
					-0.1,
					0.2
				},
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 0
						},
						{
							inTangent = 0,
							time = 3,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0
						}
					}
				},
				shoulderVInput = {
					0.25,
					-0.1,
					0.2
				}
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 40
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4
			},
			flowIn = {
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
			kind = 47,
			inputs = {
				fovBlendOutFuncVInput = "Linear",
				cancelFocusToTargetVInput = true,
				fovBlendOutTimeVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 24,
			inputs = {
				switchToLocomotionVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 10,
			flowIn = {
				In = 0
			}
		},
		[35] = {
			kind = 17,
			inputs = {
				staticIdVInput = 79631975
			},
			fields = {
				entityType = 2
			}
		},
		[38] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[40] = {
			kind = 17,
			inputs = {
				staticIdVInput = 78796613,
				boneNameVInput = "Bip001 Head"
			},
			fields = {
				entityType = 2
			}
		}
	},
	blackboard = {}
}
