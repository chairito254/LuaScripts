-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_84829055.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 84829055,
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
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = false,
					blockEvent = false,
					modeType = 1,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = false,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					toplogoComList = {
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = false,
						photo = true
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
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
						nodeId = 8
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 26024028,
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
				duration = 4,
				disableCamera = false,
				chatType = 2,
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
						nodeId = 7
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
						nodeId = 11
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 39,
			inputs = {
				fovBlendFuncVInput = "Linear",
				blendToFovVInput = 30,
				transitionSpeedVInput = 5,
				maxLockTimeVInput = 4,
				fovBlendTimeVInput = 4,
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							outWeight = 0,
							value = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 0
						},
						{
							inTangent = 0,
							outWeight = 0,
							value = 1,
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0
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
					nodeId = 22
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 10
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
				fovBlendFuncVInput = "Cubic",
				resetOnFinishVInput = true,
				transitionSpeedVInput = 5,
				maxLockTimeVInput = 5,
				targetZoomVInput = 0.5,
				rotSpeedCurveVInput = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							outWeight = 0,
							value = 0,
							weightedMode = 0,
							time = 0,
							inWeight = 0,
							outTangent = 0
						},
						{
							inTangent = 0,
							outWeight = 0,
							value = 1,
							weightedMode = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0
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
					nodeId = 23
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 10
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
						nodeId = 13
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
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				enablePlayerMoveVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 47,
			inputs = {
				cancelBlendFovVInput = true,
				fovBlendOutTimeVInput = 2,
				fovBlendOutFuncVInput = "Linear",
				cancelSetPlayerCamShoulderVInput = true,
				cancelFocusToTargetVInput = true
			},
			flowIn = {
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
				delayTime = 1
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
		[22] = {
			kind = 17,
			inputs = {
				staticIdVInput = 73510409
			},
			fields = {
				entityType = 2
			}
		},
		[23] = {
			kind = 17,
			inputs = {
				staticIdVInput = 73510409
			},
			fields = {
				entityType = 2
			}
		}
	}
}
