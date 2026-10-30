-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91048325.lua

return {
	dialogueId = 91048325,
	schema = 1,
	startNodeId = 3,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = 0
			}
		},
		{
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = 0
			}
		},
		{
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
						nodeId = 4
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					toplogoComList = {
						combat = true,
						chat = true,
						callFriends = true,
						bubble = false,
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
						multiPlayer = true
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
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 7
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 9
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 10
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
						nodeId = 49
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					355.889,
					0
				},
				targetPositionVInput = {
					-1335.332,
					102.675,
					1183.957
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
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0,
							inWeight = 0,
							value = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1,
							inWeight = 0,
							value = 1,
							weightedMode = 0
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
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					342.322,
					0
				},
				targetPositionVInput = {
					-1334.645,
					102.525,
					1182.724
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
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0,
							inWeight = 0,
							value = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1,
							inWeight = 0,
							value = 1,
							weightedMode = 0
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
				playableStateVInput = "Talk_Crossingarms_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 91051095
			},
			fields = {
				templateId = 301,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Talk_Crossingarms_Start",
					"Talk_Crossingarms_Loop",
					"Talk_Crossingarms_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_AlertStart",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 91051242
			},
			fields = {
				templateId = 5120135,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_AlertStart",
					"Behav_AlertLoop",
					"Behav_AlertEnd"
				}
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
			kind = 29,
			inputs = {
				staticIdVInput = 91051242
			},
			fields = {
				duration = 5,
				emojiName = "Happy"
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
				delayTime = 10
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
			kind = 29,
			inputs = {
				staticIdVInput = 91051242
			},
			fields = {
				duration = 5,
				emojiName = "Happy"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				staticIdVInput = 91051100,
				loopDurationVInput = 999
			},
			fields = {
				templateId = 5120131,
				processingTime = 1.7,
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
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91051100
			},
			fields = {
				duration = 5,
				emojiName = "Alert"
			},
			flowIn = {
				In = 0
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
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 194,
				param = {
					npcObserveId = 2
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CHECK_CLIENT_CUSTOM_VARIABLE",
					1133,
					nil,
					">=",
					1
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						portId = "End",
						nodeId = 2
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 21
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
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					toplogoComList = {
						combat = true,
						chat = true,
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
						multiPlayer = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						portId = "End",
						nodeId = 1
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
				portCount = 5
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
						nodeId = 48
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 47
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 651704,
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
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				duration = 3.5
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
						nodeId = 25
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 42
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 651705,
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
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 26
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
						nodeId = 27
					}
				},
				["1"] = {
					{
						portId = "Stop",
						nodeId = 35
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 36
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 33
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 651706,
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
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				duration = 2
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
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 30
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
						nodeId = 31
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91051095
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91051214,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 91051216,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "SquatFall_End",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 91075213
			},
			fields = {
				templateId = 5120140,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"SquatFall_End",
					"Idle",
					"Idle"
				}
			},
			flowIn = {
				Stop = 1,
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
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 91051095
			},
			fields = {
				templateId = 301,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "SquatObserve_End",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999,
				staticIdVInput = 91051214
			},
			fields = {
				templateId = 301,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Squat_End",
					"Emotion_Smile01",
					"Emotion_Smile01"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Item_SceneObject_Chest_Magnificent_Ancient_Open_Orange.prefab",
				postionVInput = {
					-1334.806,
					102.315,
					1185.58
				},
				rotationVInput = {
					0,
					323.41,
					0
				}
			},
			fields = {
				playOne = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1336.349,
					104.535,
					1181.427
				},
				rotationVInput = {
					16.12,
					19.516,
					0.042
				}
			},
			fields = {
				cameraId = 91079215,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 270,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 342,
				fStop = 7.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 91051108
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Akimbo02_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 91051095
			},
			fields = {
				templateId = 301,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Story_Akimbo02_Start",
					"Story_Akimbo02_Loop",
					"Story_Akimbo02_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5120138,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1334.806,
					102.315,
					1185.58
				},
				rotationVInput = {
					0,
					323.41,
					0
				}
			},
			fields = {
				entityId = -594641132,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1335.679,
					104,
					1186.467
				},
				rotationVInput = {
					8.899,
					161.478,
					0.021
				}
			},
			fields = {
				cameraId = 91078655,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 270,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 21.66
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1335.679,
					103.628,
					1186.467
				},
				rotationVInput = {
					8.899,
					161.478,
					0.021
				}
			},
			fields = {
				cameraId = 91080091,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 270,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 21.66
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 1,
				cameraShakeItem = {
					flags = 0,
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadius = -1,
					decayTime = 5,
					sustainTime = 5,
					attackTime = 3,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0,
								inWeight = 0,
								value = 1,
								weightedMode = 0
							},
							{
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0,
								inWeight = 0,
								value = 1,
								weightedMode = 0
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					noisePosAmplitudes = {
						0,
						0,
						0
					},
					noiseRotAmplitudes = {
						0.5,
						0.5,
						0.5
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0,
								inWeight = 0,
								value = 1,
								weightedMode = 0
							},
							{
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0,
								inWeight = 0,
								value = 1,
								weightedMode = 0
							}
						}
					},
					noisePosSeeds = {
						0,
						0,
						0
					},
					noiseRotSeeds = {
						0,
						0,
						0
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
				playableStateVInput = "SquatObserve_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				templateId = 301,
				processingTime = 1.7,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Squat_Start",
					"SquatObserve_Loop",
					"Squat_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1336.974,
					104.733,
					1180.705
				},
				rotationVInput = {
					14.7,
					22.704,
					0
				}
			},
			fields = {
				cameraId = 91048490,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 450,
				fStop = 6.5
			},
			flowIn = {
				In = 0
			}
		}
	}
}
