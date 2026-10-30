-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91278308.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91278308,
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
			kind = 16,
			inputs = {
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5200042
			},
			valueIn = {
				positionVInput = {
					nodeId = 46,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 46,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -1285998393,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 3
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 2,
					portId = "EntityID"
				},
				targetEulerAngleVInput = {
					nodeId = 47,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 47,
					portId = "OutPosition"
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 4,
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
						nodeId = 5,
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
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1285998393,
				targetEulerAngleVInput = {
					0,
					120,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Sigh",
				animationLayerVInput = 4,
				staticIdVInput = -1285998393
			},
			fields = {
				processingTime = 3.333,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200042
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108022,
				dialogsetCameraIdVInput = 91292517,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Sigh",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "TalkUpper_Sigh",
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108023,
				dialogsetCameraIdVInput = 91292517,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1447552602,
				targetEulerAngleVInput = {
					0,
					141.833,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1447552602
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 9108024,
				dialogsetCameraIdVInput = 91292556,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Face_Lose",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "Face_Lose",
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
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Sigh",
				animationLayerVInput = 4,
				staticIdVInput = -1285998393
			},
			fields = {
				processingTime = 3.333,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 5200042
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
				dialogueIdVInput = 9108068,
				dialogsetCameraIdVInput = 91292556,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "TalkUpper_Sigh",
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5200042,
				matchAudioDuration = true,
				duration = 4.62,
				disableCamera = false,
				chatType = 3,
				animCfg = {
					[1] = "TalkUpper_Sigh",
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
						nodeId = 15,
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
						nodeId = 16,
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1447552602,
				targetEulerAngleVInput = {
					0,
					-60,
					0
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 41,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 33,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 2,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 3
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 18,
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
				Finish = {
					{
						nodeId = 20,
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
				["0"] = 0,
				["1"] = 0,
				["2"] = 0
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 3,
				speedVInput = 0.97,
				staticIdVInput = -1447552602
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 43,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 43,
					portId = "OutPosition"
				}
			},
			fields = {
				reset = false,
				finishToSteer = true,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 23,
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
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108020,
				dialogsetCameraIdVInput = 91292543,
				lookAtIdVInput = 5200042,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1427968528,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -867013800,
				staticIdVInput = -1447552602
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 4,
				maxLimitTimeVInput = 10,
				speedVInput = 0.846,
				staticIdVInput = -867013800,
				targetEulerAngleVInput = {
					0,
					174.268,
					0
				},
				targetPositionVInput = {
					29.332,
					25.075,
					417.063
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
						},
						{
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0
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
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9108021,
				dialogsetCameraIdVInput = 91292543,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5200041,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 2,
					portId = "EntityID"
				}
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1285998393,
				staticIdVInput = -1447552602
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1447552602,
				staticIdVInput = -1285998393
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 32,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraIdVInput = 91292517,
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
				Out = {
					{
						nodeId = 3,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5200041
			},
			valueIn = {
				positionVInput = {
					nodeId = 44,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 44,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -867013800,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_LoveLoop"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 33,
					portId = "EntityID"
				}
			},
			fields = {
				processingTime = 2.25,
				playAniType = 1,
				isLooping = true,
				entityType = 2,
				templateId = 5200041
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 20,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 33,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 34,
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
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					toplogoComList = {
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
						bubble = true,
						alert = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 16,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					141.833,
					0
				},
				targetPositionVInput = {
					2.971,
					25.007,
					442.549
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1
			},
			valueIn = {
				positionVInput = {
					nodeId = 45,
					portId = "OutPosition"
				},
				rotationVInput = {
					nodeId = 45,
					portId = "OutEulerAngle"
				}
			},
			fields = {
				entityId = -1447552602,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 53,
			inputs = {
				cameraIdVInput = 91292543,
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
				Out = {
					{
						nodeId = 20,
						portId = "2"
					}
				}
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91292481,
				slotIDVInput = 91292484
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91292481,
				slotIDVInput = 91292482
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91292481,
				slotIDVInput = 91297501
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91292481,
				slotIDVInput = 91297501
			}
		},
		{
			kind = 43,
			inputs = {
				sceneIDVinput = 501,
				dialogsetIDVInput = 91292481,
				slotIDVInput = 91292483
			}
		}
	}
}
