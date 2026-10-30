-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91278303.lua

return {
	startNodeId = 1,
	dialogueId = 91278303,
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					toplogoComList = {
						alert = true,
						battleRoom = true,
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
						chat = true,
						callFriends = true,
						bubble = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 3,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				endSkipVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
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
			kind = 22,
			inputs = {
				blendVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 6,
						portId = "In"
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
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200041,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 37,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 37,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1410401848
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AngryLoop"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 7,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 5200041,
				processingTime = 1.967,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 9,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 3,
				maxAwaitTime = -1
			},
			flowIn = {
				["2"] = 0,
				["1"] = 0,
				["0"] = 0
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 33,
					portId = "EntityIDs"
				}
			},
			fields = {
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1,
				enableGroupLookAt = false,
				enableDefaultLookAt = true,
				cameraPreset = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FOut = {
					{
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108004,
				dialogsetCameraIdVInput = 91296585,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 2.25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9108005
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108006,
				dialogsetCameraIdVInput = 91296585,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 3.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108007,
				dialogsetCameraIdVInput = 91296595,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 5.75
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 8.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108009,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200041,
				matchAudioDuration = true,
				duration = 4.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 18,
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
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91278017,
				isResetValueInput = true,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1410401848,
				moveTypeVInput = 4,
				targetPositionVInput = {
					36.662,
					25,
					509.465
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							inWeight = 0,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
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
				Out = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108010,
				dialogsetCameraIdVInput = 91296637,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200041,
				matchAudioDuration = true,
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108011,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -83288512,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 2.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 23,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108012,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				anim = "TalkUpper_PointTo01",
				skipTime = 0,
				npcStaticId = -83288512,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 4.5,
				animCfg = {
					[1] = "TalkUpper_PointTo01",
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
						nodeId = 25,
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108061,
				dialogsetCameraIdVInput = 91296585,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -83288512,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 6.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -83288512,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 7.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108063,
				dialogsetCameraIdVInput = 91296637,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -83288512,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 5.25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 30,
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
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -83288512,
				playableStateVInput = "TalkUpper_Sigh",
				defaultTransStateVInput = "Idle",
				animationLayerVInput = 4
			},
			fields = {
				templateId = 5200042,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -83288512,
				playableStateVInput = "TalkUpper_PointTo01",
				defaultTransStateVInput = "Idle",
				animationLayerVInput = 4
			},
			fields = {
				templateId = 5200042,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 34,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 7,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 39,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 3
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5200042,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					nodeId = 38,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 38,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -83288512
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 5,
				playStartLoopEndVInput = true,
				playableStateVInput = "TalkUpper_Sigh_Start",
				animationLayerVInput = 4
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 34,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 5200042,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"TalkUpper_Sigh_Start",
					"TalkUpper_Sigh_Loop",
					"TalkUpper_Sigh_End"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 9,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 60,
			inputs = {
				exitTypeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 9,
						portId = "2"
					}
				}
			}
		},
		{
			kind = 43,
			inputs = {
				dialogsetIDVInput = 91296548,
				slotIDVInput = 91296671,
				sceneIDVinput = 501
			}
		},
		{
			kind = 43,
			inputs = {
				dialogsetIDVInput = 91296548,
				slotIDVInput = 91296550,
				sceneIDVinput = 501
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
