-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91097787.lua

return {
	dialogueId = 91097787,
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
				onSkipStartConnected = true,
				modeInfo = {
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					hideInteractionSign = true,
					hideMarkShare = true,
					hideTopLogo = true,
					blockCameraZoom = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
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
						nodeId = 3
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 5
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
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 91100581,
				isFadeInVInput = true
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
			kind = 16,
			inputs = {
				slotParamVInput = 5200010,
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					58.5,
					51.82,
					1007.96
				},
				rotationVInput = {
					0,
					284.653,
					0
				}
			},
			fields = {
				entityId = -2002913066,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 5
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 56
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 57
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 60
				}
			},
			fields = {
				portCount = 4
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 6
				}
			},
			fields = {
				reactPreset = 2,
				enableGroupLookAt = false,
				enableDefaultLookAt = false,
				cameraPreset = 2,
				nodeMode = 1,
				resetOrientation = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 8
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
				DirectOut = {
					{
						portId = "In",
						nodeId = 9
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
					73.031,
					0
				},
				targetPositionVInput = {
					57.23,
					51.952,
					1007.657
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
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
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 91026032
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
						nodeId = 12
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
						nodeId = 13
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
						nodeId = 14
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9104014,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5140002,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
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
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9104015,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 5140002,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
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
						portId = "In",
						nodeId = 16
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
						nodeId = 17
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 53
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeInVInput = true,
				enableFadeOutVInput = true,
				dialogueIdVInput = 9104016,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5140002,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 7,
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
						portId = "In",
						nodeId = 18
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
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 56,
			fields = {
				shakeType = 0,
				cameraShakeItem = {
					shakeFrequency = 6,
					shakeDissipation = 28,
					shakeRadius = 2,
					decayTime = 0,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 0,
					flags = 0,
					random = false,
					initPhase = 0,
					shakeBias = 0,
					shakeAmplitude = 0.12,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								inTangent = 0,
								outTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								value = 1,
								inWeight = 0,
								time = 0
							},
							{
								inTangent = 0,
								outTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								value = 1,
								inWeight = 0,
								time = 1
							}
						}
					},
					shakePos = {
						0,
						0,
						0
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								inTangent = 0,
								outTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								value = 1,
								inWeight = 0,
								time = 0
							},
							{
								inTangent = 0,
								outTangent = 0,
								outWeight = 0,
								weightedMode = 0,
								value = 1,
								inWeight = 0,
								time = 1
							}
						}
					},
					shakeDir = {
						0,
						1,
						0
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9104017,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -2002913066,
				npcId = 5200010,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
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
						portId = "In",
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5200010,
				dialogueIdVInput = 9104018,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				anim = "Emotion_Shock",
				portCount = 1,
				animCfg = {
					[1] = "Emotion_Shock",
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
						portId = "In",
						nodeId = 22
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
						nodeId = 23
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 28
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 26
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					54.099,
					53.463,
					1014.286
				},
				rotationVInput = {
					5.103,
					164.732,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91114334,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 24
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
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					58.386,
					53.062,
					1006.171
				},
				rotationVInput = {
					3.212,
					340.057,
					0.003
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91101417,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5200010,
				dialogueIdVInput = 9104019,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2,
				npcStaticId = -1648277245,
				npcId = 5140006,
				matchAudioDuration = true,
				duration = 7.38,
				disableCamera = false,
				chatType = 3,
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
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -1648277245
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				isFadeInVInput = true,
				staticIdVInput = -1648277245
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
			kind = 19,
			inputs = {
				speedVInput = 1.25,
				maxLimitTimeVInput = 8,
				targetEulerAngleVInput = {
					0,
					122.1,
					0
				},
				targetPositionVInput = {
					57.457,
					52.008,
					1008.739
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
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
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							time = 0
						},
						{
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
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
						nodeId = 31
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 46
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
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9104020,
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
				duration = 9.75,
				disableCamera = false,
				chatType = 3,
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
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 5200010,
				dialogueIdVInput = 9104021,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1648277245,
				npcId = 5140006,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 33
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9104022
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 34
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
						nodeId = 35
					}
				},
				["1"] = {
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
				dialogueIdVInput = 9104024,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				skipTime = 2,
				npcStaticId = -1648277245,
				npcId = 5140006,
				matchAudioDuration = true,
				duration = 5.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				anim = "Daily_Thanks",
				portCount = 1,
				animCfg = {
					[1] = "Daily_Thanks",
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
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1648277245,
				lookAtEntityStaticIdVInput = 2
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9104025,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				blackScreenIntervalTime = 2,
				skipTime = 0,
				npcStaticId = -1648277245,
				npcId = 5140006,
				matchAudioDuration = true,
				duration = 9.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				anim = "Daily_Thanks",
				portCount = 1,
				animCfg = {
					[1] = "Daily_Thanks",
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
						portId = "In",
						nodeId = 38
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeInVInput = true,
				enableFadeOutVInput = true,
				dialogueIdVInput = 9104026,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 2,
				npcStaticId = -1,
				npcId = 5140006,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2,
				portCount = 1
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
			kind = 12,
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
			kind = 20,
			inputs = {
				staticIdVInput = -1648277245
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -1808604430
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				},
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 59
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
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1648277245,
				lookAtEntityStaticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 9104023
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -1648277245,
				lookAtEntityStaticIdVInput = -2002913066
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = -1648277245
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = 2,
				defaultTransStateVInput = "idle",
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 403,
				processingTime = 0,
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
			kind = 20,
			inputs = {
				durationVInput = 0,
				isFadeInVInput = true,
				staticIdVInput = -1808604430
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				maxLimitTimeVInput = 8,
				targetEulerAngleVInput = {
					0,
					121.1,
					0
				},
				targetPositionVInput = {
					56.299,
					51.979,
					1009.88
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 57
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
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							time = 0
						},
						{
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
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
			kind = 20,
			inputs = {
				staticIdVInput = 91026032,
				isResetValueInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -2002913066,
				isFadeInVInput = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 91026032
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					56.131,
					53.584,
					1009.769
				},
				rotationVInput = {
					20.573,
					133.965,
					0.004
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91101409,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5140006,
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					54.402,
					52.008,
					1012.447
				},
				rotationVInput = {
					0,
					161.91,
					0
				}
			},
			fields = {
				entityId = -1648277245,
				ignoreGravity = false
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
			kind = 16,
			inputs = {
				slotParamVInput = 500066,
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					52.029,
					52.008,
					1014.209
				},
				rotationVInput = {
					0,
					147.615,
					0
				}
			},
			fields = {
				entityId = -1808604430,
				ignoreGravity = false
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
		[59] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		},
		[60] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
