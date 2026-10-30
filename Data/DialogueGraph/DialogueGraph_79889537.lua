-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79889537.lua

return {
	dialogueId = 79889537,
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
						nodeId = 3
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 190
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 191
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					blockCameraZoom = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					hideUIWhiteList = {
						[121] = true
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
				OnSkipStart = {
					{
						portId = "In",
						nodeId = 5
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 19
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
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
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
			kind = 10,
			inputs = {
				showAllUIVInput = false,
				endSkipVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 8
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 17
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 13
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 16
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 18
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -468231986
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1743896043
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1415202851
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 121,
				param = {
					5701082,
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 79337005
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 71926584
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "0",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 3
			},
			flowIn = {
				["1"] = 0,
				["0"] = 0,
				["2"] = 0
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
						portId = "In",
						nodeId = 188
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 22
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
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 186
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 187
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
						nodeId = 28
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 34
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 33
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400077,
				positionVInput = {
					-634.236,
					48.168,
					853.195
				},
				rotationVInput = {
					0,
					166.223,
					0
				}
			},
			fields = {
				entityId = -1743896043,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 2,
				staticIdVInput = -1743896043
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
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 79337005
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1743896043,
				playableStateVInput = "Story_FoldArms_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400077,
				aniStateList = {
					"Story_FoldArms_Start",
					"Story_FoldArms_Loop",
					"Story_FoldArms_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 200001,
				positionVInput = {
					-633.416,
					48.276,
					853.649
				},
				rotationVInput = {
					0,
					188.09,
					0
				}
			},
			fields = {
				entityId = -1104119422,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1104119422,
				speedVInput = 1.129,
				targetEulerAngleVInput = {
					0,
					198.87,
					0
				},
				targetPositionVInput = {
					-633.695,
					48.026,
					851.942
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
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
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1104119422,
				lookAtEntityStaticIdVInput = 79337005
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 31
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
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1104119422,
				playableStateVInput = "Story_ShakeHead",
				speedVInput = 2
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 200001
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityIdVInput = -1350180127,
				lookAtEntityStaticIdVInput = -1350180127
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304070,
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
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 35
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
						nodeId = 36
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 184
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304071,
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
				npcId = 400077,
				matchAudioDuration = true,
				duration = 7.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 37
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
						nodeId = 38
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 182
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 183
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 181
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304073,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3907913
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 41
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
						nodeId = 42
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
						nodeId = 179
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 180
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 44
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
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					blockCameraZoom = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					hideUIWhiteList = {
						[121] = true
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
				OnSkipStart = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 46
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
						nodeId = 176
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 177
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 178
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					blockCameraZoom = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					hideUIWhiteList = {
						[190] = true
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
				OnSkipStart = {
					{
						portId = "In",
						nodeId = 175
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 49
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 70
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 72
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 75
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 50
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 51
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 68
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 173
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 174
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
					139.97,
					0
				},
				targetPositionVInput = {
					-636.698,
					48.032,
					850.512
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-637.72,
					49.392,
					852.082
				},
				rotationVInput = {
					40.369,
					81.214,
					-0.002
				}
			},
			fields = {
				cameraId = 84206173,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 230,
				fStop = 18.21
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 2.3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-637.67,
					49.348,
					852.09
				},
				rotationVInput = {
					40.369,
					81.214,
					-0.002
				}
			},
			fields = {
				cameraId = 84234370,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 230,
				fStop = 18.21
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 53
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
						nodeId = 55
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 54
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 62
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					139.96,
					0
				},
				targetPositionVInput = {
					-636.57,
					48.023,
					850.497
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
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
						nodeId = 58
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 56
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-636.46,
					48.949,
					850.143
				},
				rotationVInput = {
					18.942,
					100.275,
					0
				}
			},
			fields = {
				cameraId = 84190031,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304074,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 59
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
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1202062510,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1415202851,
				targetEulerAngleVInput = {
					0,
					300.855,
					0
				},
				targetPositionVInput = {
					-635.479,
					48.686,
					849.127
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1104119422,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					167.73,
					0
				},
				targetPositionVInput = {
					-636.021,
					48.007,
					851.215
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1743896043,
				speedVInput = 1.25,
				targetEulerAngleVInput = {
					0,
					170.702,
					0
				},
				targetPositionVInput = {
					-635.268,
					48.019,
					851.574
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
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
						nodeId = 64
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
						nodeId = 65
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 66
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1104119422,
				lookAtEntityStaticIdVInput = -468231986
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -468231986
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1743896043,
				lookAtEntityStaticIdVInput = -468231986
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.7
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 69
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 600047,
				positionVInput = {
					-636.544,
					48.173,
					852.374
				},
				rotationVInput = {
					62.527,
					118.119,
					0
				}
			},
			fields = {
				entityId = -1202062510,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
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
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 57,
			inputs = {
				playerEntIdVInput = -1415202851,
				petEntIdVInput = -468231986,
				isIdyllVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 73
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 74
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -468231986,
				targetEulerAngleVInput = {
					0,
					288.859,
					0
				},
				targetPositionVInput = {
					-634.74,
					47.94,
					849.845
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 2.01,
				playableStateVInput = "EnvBehav_Sleep_End",
				speedVInput = 1.1,
				staticIdVInput = -468231986
			},
			fields = {
				processingTime = 8,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400203
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 5.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 77
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
						nodeId = 78
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 57,
			inputs = {
				switchToPetVInput = false,
				playerEntIdVInput = -1415202851,
				petEntIdVInput = -468231986,
				isIdyllVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 80
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 167
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 169
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 168
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 172
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304075,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 5.88
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 81
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
						nodeId = 82
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
						nodeId = 83
					}
				},
				["1"] = {
					{
						portId = "closeUIFInput",
						nodeId = 167
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 84
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 85
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 162
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 165
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 163
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 161
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 164
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 166
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-636.286,
					49.395,
					848.92
				},
				rotationVInput = {
					1.491,
					3.008,
					0.177
				}
			},
			fields = {
				cameraId = 84191171,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 140,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304076,
				lookAtIdVInput = 400204,
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
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.75
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 86
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 87
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 157
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 155
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 156
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 160
					}
				},
				["5"] = {
					{
						portId = "StopEmotion",
						nodeId = 161
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304018,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 4.88
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304077,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 5.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 89
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
						nodeId = 93
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 92
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 91
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 90
					}
				}
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Smile",
				entityIdVInput = -1743896043
			},
			fields = {
				noBlink = false,
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				StopEmotion = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1743896043,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				processingTime = 3.2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400077
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-635.789,
					49.27,
					850.379
				},
				rotationVInput = {
					1.995,
					20.678,
					358.847
				}
			},
			fields = {
				cameraId = 84193687,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304078,
				lookAtIdVInput = 400204,
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
				portCount = 3,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400077,
				matchAudioDuration = true,
				duration = 4.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 94
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
						nodeId = 97
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 96
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 95
					}
				},
				["3"] = {
					{
						portId = "StopEmotion",
						nodeId = 90
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-637.369,
					49.718,
					849.349
				},
				rotationVInput = {
					19.605,
					91.505,
					0
				}
			},
			fields = {
				cameraId = 90845899,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 160,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Emotion_Nod"
			},
			fields = {
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304079,
				defaultSkipBranchVInput = 1,
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
				audioName = "VOX_Chapter01_Sunia_004",
				portCount = 3,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 98
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 149
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304080
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 99
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
						nodeId = 100
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 101
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				processingTime = 2.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304082,
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
				audioName = "VOX_Chapter01_Sunia_005",
				portCount = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 8.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 102
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
						nodeId = 103
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304084,
				lookAtIdVInput = 400077,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 9.25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 105
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
						nodeId = 106
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 147
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 148
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"TWIN_PET_CHOICE",
					nil,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 145
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 107
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
						nodeId = 108
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 144
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304085,
				lookAtIdVInput = 400204,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 4.12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 109
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
						nodeId = 111
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 110
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-637.369,
					49.718,
					849.349
				},
				rotationVInput = {
					19.605,
					91.505,
					0
				}
			},
			fields = {
				cameraId = 90845730,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 160,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304087,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 112
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 113
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 139
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 140
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 141
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 142
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 143
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304088,
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
				npcId = 400077,
				matchAudioDuration = true,
				duration = 5.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 114
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
						nodeId = 119
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 115
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 117
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 118
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 137
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 116
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-637.369,
					49.718,
					849.349
				},
				rotationVInput = {
					19.605,
					91.505,
					0
				}
			},
			fields = {
				cameraId = 90845790,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 160,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				processingTime = 2.683,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Serious",
				entityIdVInput = -1415202851
			},
			fields = {
				noBlink = false,
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304089,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 10.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 120
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304090,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 5.38
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 121
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
						nodeId = 122
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 135
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 117
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304091,
				lookAtIdVInput = 400077,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 3.25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 123
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
						nodeId = 124
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 136
					}
				},
				["2"] = {
					{
						portId = "StopEmotion",
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304092,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 125
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 126
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 134
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 127
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 129
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 131
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 132
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 133
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304093,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 5
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
			kind = 26,
			inputs = {
				durationVInput = 0.7,
				staticIdVInput = -468231986,
				targetEulerAngleVInput = {
					0,
					180,
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
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 9,
				autoPathfindingVInput = true,
				staticIdVInput = -468231986,
				targetPositionVInput = {
					-622.256,
					48.224,
					841.693
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-638.882,
					49.377,
					849.82
				},
				rotationVInput = {
					358.73,
					104.109,
					358.847
				}
			},
			fields = {
				cameraId = 91282055,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 130
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-638.339,
					49.675,
					849.675
				},
				rotationVInput = {
					358.902,
					106.856,
					358.847
				}
			},
			fields = {
				cameraId = 91282063,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 1561,
				fStop = 32
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				maxLimitTimeVInput = 9,
				autoPathfindingVInput = true,
				staticIdVInput = -1743896043,
				targetEulerAngleVInput = {
					0,
					124.366,
					0
				},
				targetPositionVInput = {
					-623.849,
					48.224,
					840.693
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				speedVInput = 0.75,
				staticIdVInput = 2,
				targetPositionVInput = {
					-631.256,
					48.224,
					847.693
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 1.12,
				maxLimitTimeVInput = 9,
				autoPathfindingVInput = true,
				staticIdVInput = -1104119422,
				targetPositionVInput = {
					-631.256,
					48.224,
					847.693
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.936,
				maxLimitTimeVInput = 9,
				autoPathfindingVInput = true,
				staticIdVInput = -1415202851,
				targetEulerAngleVInput = {
					0,
					124.366,
					0
				},
				targetPositionVInput = {
					-623.849,
					48.224,
					840.693
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Shy",
				entityIdVInput = -1415202851
			},
			fields = {
				noBlink = false,
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				StopEmotion = 1,
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1415202851
			},
			flowIn = {
				In = 0
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
						nodeId = 138
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1415202851,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-635.869,
					49.516,
					848.196
				},
				rotationVInput = {
					13.229,
					3.544,
					0.724
				}
			},
			fields = {
				cameraId = 91303892,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 144,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 115,
				fStop = 8.1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1415202851,
				lookAtEntityStaticIdVInput = -1743896043
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -1743896043
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1743896043,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Excited",
				entityIdVInput = -1743896043
			},
			fields = {
				noBlink = false,
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1104119422,
				playableStateVInput = "Story_ShakeHead"
			},
			fields = {
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 500030
			},
			flowIn = {
				In = 0
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
						nodeId = 146
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 144
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304086,
				lookAtIdVInput = 400204,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 4.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 109
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-636.157,
					49.061,
					848.799
				},
				rotationVInput = {
					17.715,
					2.64,
					0
				}
			},
			fields = {
				cameraId = 90762661,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 150,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1104119422,
				lookAtEntityStaticIdVInput = -1415202851
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304081
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 150
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
						nodeId = 151
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 152
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				processingTime = 2.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304083,
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
				npcId = 400204,
				matchAudioDuration = true,
				duration = 8.12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 153
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
						nodeId = 104
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 154
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Shrug",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 3.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
				aniStateList = {
					"",
					"",
					""
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				processingTime = 3.433,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-639.369,
					49.767,
					850.665
				},
				rotationVInput = {
					14.072,
					93.578,
					358.207
				}
			},
			fields = {
				cameraId = 84191170,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 160,
				fStop = 16
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 158
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 159
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				fovVInput = 35,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-639.369,
					49.767,
					850.665
				},
				rotationVInput = {
					11.323,
					97.791,
					358.227
				}
			},
			fields = {
				cameraId = 90845728,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 160,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1743896043,
				targetEulerAngleVInput = {
					0,
					170.704,
					0
				},
				targetPositionVInput = {
					-635.358,
					48.02,
					851.606
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Smile",
				entityIdVInput = -1415202851
			},
			fields = {
				noBlink = false,
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Confused",
				entityIdVInput = 2
			},
			fields = {
				noBlink = false,
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				StopEmotion = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -1415202851
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1415202851,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1743896043,
				lookAtEntityStaticIdVInput = -1415202851
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				animationLayerVInput = 4,
				playableStateVInput = "TalkUpper_Confused_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				processingTime = 5.333,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				aniStateList = {
					"TalkUpper_Confused_Start",
					"TalkUpper_Confused_Loop",
					"TalkUpper_Confused_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -468231986,
				targetEulerAngleVInput = {
					0,
					288.859,
					0
				},
				targetPositionVInput = {
					-634.61,
					47.954,
					849.616
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 27,
			fields = {
				uid = 306,
				param = {
					title = "CHARACTER_APPEARANCE_DESC_Sunia",
					name = "CHARACTER_APPEARANCE_NAME_Sunia",
					pos = {
						-1000,
						0,
						0
					}
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-636.891,
					49.345,
					849.935
				},
				rotationVInput = {
					12.869,
					106.68,
					358.216
				}
			},
			fields = {
				cameraId = 84220053,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 120,
				fStop = 16
			},
			flowIn = {
				In = 0
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
						nodeId = 171
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 170
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1415202851,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				processingTime = 7.117,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Surprised",
				entityIdVInput = -1415202851
			},
			fields = {
				noBlink = true,
				activePlayLip = true,
				activePlayEmotion = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1104119422,
				lookAtEntityStaticIdVInput = -1415202851
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 71926584,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1115081540,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 22,
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-623.459,
					48.391,
					836.861
				},
				rotationVInput = {
					0,
					137.554,
					0
				}
			},
			fields = {
				entityId = -468231986,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400204,
				positionVInput = {
					-623.459,
					48.391,
					836.861
				},
				rotationVInput = {
					0,
					137.554,
					0
				}
			},
			fields = {
				entityId = -1415202851,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1672610893,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1104119422,
				playableStateVInput = "Skill_RoarAttack"
			},
			fields = {
				processingTime = 2.417,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 1110075
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1104119422,
				lookAtEntityStaticIdVInput = 79337005
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304072,
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
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1104119422,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-635.461,
					49.562,
					851.132
				},
				rotationVInput = {
					31.252,
					73.321,
					1.566
				}
			},
			fields = {
				cameraId = 91305731,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 120,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 9.77
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-635.427,
					49.786,
					854.326
				},
				rotationVInput = {
					14.745,
					154.715,
					0
				}
			},
			fields = {
				cameraId = 91305417,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 120,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 9.77
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 185
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 16,
				fovVInput = 35,
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-635.852,
					49.675,
					854.477
				},
				rotationVInput = {
					16.672,
					144.745,
					0
				}
			},
			fields = {
				cameraId = 91305730,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 120,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 300,
				fStop = 10.77
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					136.968,
					0
				},
				targetPositionVInput = {
					-635.101,
					48.078,
					852.508
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
							weightedMode = 0,
							value = 0,
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							time = 0
						},
						{
							weightedMode = 0,
							value = 1,
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							time = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 999,
				playableStateVInput = "Behav_SleepLoop",
				playStartLoopEndVInput = true,
				staticIdVInput = -1672610893
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400066,
				aniStateList = {
					"Behav_SleepLoop",
					"Behav_SleepLoop",
					"Behav_SleepLoop"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-636.002,
					49.523,
					852.174
				},
				rotationVInput = {
					28.62,
					112.4,
					0
				}
			},
			fields = {
				cameraId = 91305419,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 170,
				fStop = 7
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 189
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-635.16,
					49.026,
					851.827
				},
				rotationVInput = {
					28.62,
					112.4,
					0
				}
			},
			fields = {
				cameraId = 91397297,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 78,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 170,
				fStop = 7
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-633.93,
					47.94,
					849.6
				},
				rotationVInput = {
					0,
					317.677,
					0
				}
			},
			fields = {
				entityId = -1672610893,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "1",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 600046,
				positionVInput = {
					-633.883,
					48.004,
					851.315
				},
				rotationVInput = {
					0,
					137.554,
					0
				}
			},
			fields = {
				entityId = -1115081540,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "2",
						nodeId = 20
					}
				}
			}
		}
	}
}
