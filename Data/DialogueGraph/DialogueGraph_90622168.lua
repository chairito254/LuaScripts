-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90622168.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 90622168,
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
						nodeId = 3,
						portId = "In"
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
						nodeId = 4,
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
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
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
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 0,
						portId = "End"
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
			kind = 2,
			fields = {
				portCount = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["1"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 196,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 7,
						portId = "In"
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
					45.903,
					0
				},
				targetPositionVInput = {
					-1382.033,
					80.419,
					1019.177
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
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1
						}
					}
				}
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
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				positionVInput = {
					-1385.396,
					82.806,
					1018.138
				},
				rotationVInput = {
					19.862,
					73.209,
					-0.001
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 336,
				fStop = 10,
				cameraId = 90737619,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 25,
				positionVInput = {
					-1384.607,
					82.487,
					1018.396
				},
				rotationVInput = {
					17.111,
					71.147,
					-0.001
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 336,
				fStop = 10,
				cameraId = 90829718,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_RACE",
					1005100,
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
						nodeId = 11,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 113,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_RACE",
					1005200,
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
						nodeId = 12,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 162,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_RACE",
					1005300,
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
						nodeId = 112,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 13,
						portId = "In"
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
						nodeId = 63,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 14,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 110,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				positionVInput = {
					-1384.196,
					83,
					1019.845
				},
				rotationVInput = {
					359.282,
					283.078,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 180,
				fStop = 17,
				cameraId = 91125009,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 30,
				positionVInput = {
					-1384.196,
					82,
					1019.845
				},
				rotationVInput = {
					359.282,
					283.078,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 180,
				fStop = 17,
				cameraId = 91125010,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 16,
						portId = "In"
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
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
						3,
						3,
						3
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
			kind = 4,
			fields = {
				delayTime = 3.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
				dialogueIdVInput = 6505094
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 19,
						portId = "In"
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
						nodeId = 20,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505024
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
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
						nodeId = 21,
						portId = "In"
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
						nodeId = 22,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 60,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505025
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
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
						nodeId = 23,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505026
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
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
						nodeId = 25,
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505027
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 0,
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
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505028,
				defaultSkipBranchVInput = 2
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 11,
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
						nodeId = 28,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6505029
			},
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505031
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
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
						nodeId = 31,
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
						nodeId = 32,
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
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505032
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 33,
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
						nodeId = 34,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505036
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 8.38,
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
						nodeId = 35,
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
						nodeId = 1,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 4,
				animationLayerVInput = 4,
				staticIdVInput = 86076120,
				playableStateVInput = "TalkUpper_Like"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 3.333,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 37,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 5,
				playableStateVInput = "TalkUpper_Crossingarms_Start",
				staticIdVInput = 86076120,
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 1,
				playAniType = 1,
				aniStateList = {
					"TalkUpper_Crossingarms_Start",
					"TalkUpper_Crossingarms_Loop",
					"TalkUpper_Crossingarms_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 4,
				playableStateVInput = "Daily_Invite_Start",
				staticIdVInput = 86076120,
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 1,
				playAniType = 1,
				aniStateList = {
					"Daily_Invite_Start",
					"Daily_Invite_Loop",
					"Daily_Invite_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "Linear",
				positionVInput = {
					-1383.013,
					81.743,
					1018.828
				},
				rotationVInput = {
					5.939,
					54.716,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 135,
				fStop = 20,
				cameraId = 90829871,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Talk_Shrug_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 1,
				playAniType = 1,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6505030
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505033
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
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
						nodeId = 43,
						portId = "In"
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
						nodeId = 44,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 52,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505034
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
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
						nodeId = 45,
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
						nodeId = 46,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6505035
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 8.25,
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
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 86076120,
				speedVInput = 0.75,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					188.967,
					0
				},
				targetPositionVInput = {
					-1381.765,
					80.419,
					1019.747
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
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
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
				FinishOut = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 86076120,
				playableStateVInput = "TalkUpper_Shrug",
				playStartLoopEndVInput = true,
				loopDurationVInput = 4,
				animationLayerVInput = 4
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 1,
				playAniType = 1,
				aniStateList = {
					"TalkUpper_Shrug",
					"TalkUpper_Shrug",
					"TalkUpper_Shrug"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "Linear",
				positionVInput = {
					-1385.334,
					81.718,
					1019.372
				},
				rotationVInput = {
					5.079,
					88.578,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 20,
				cameraId = 90829891,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "Linear",
				blendTimeVInput = 0.5,
				positionVInput = {
					-1385.334,
					81.718,
					1019.372
				},
				rotationVInput = {
					5.079,
					88.578,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 20,
				cameraId = 90830142,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "Linear",
				blendTimeVInput = 0.5,
				positionVInput = {
					-1384.752,
					81.666,
					1019.386
				},
				rotationVInput = {
					3.017,
					89.266,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 20,
				cameraId = 90830144,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				positionVInput = {
					-1381.682,
					81.736,
					1020.892
				},
				rotationVInput = {
					5.251,
					186.898,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 190,
				fStop = 25,
				cameraId = 90829839,
				visualizeDOF = false
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
			},
			flowOut = {
				Out = {
					{
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_ShakeHead"
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 1,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 55,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2,
				lookAtEntityStaticIdVInput = 86076120
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				positionVInput = {
					-1385.229,
					81.962,
					1016.887
				},
				rotationVInput = {
					3.704,
					54.373,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 350,
				fStop = 20,
				cameraId = 90829674,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 18,
				fovVInput = 25,
				positionVInput = {
					-1386.669,
					82.104,
					1016.732
				},
				rotationVInput = {
					4.564,
					66.405,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 350,
				fStop = 20,
				cameraId = 90829821,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "TalkUpper_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 401,
				processingTime = 1,
				playAniType = 1,
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
			kind = 3,
			inputs = {
				fovVInput = 25,
				positionVInput = {
					-1382.168,
					81.779,
					1020.572
				},
				rotationVInput = {
					7.314,
					172.803,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 135,
				fStop = 25,
				cameraId = 90829666,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "Linear",
				blendTimeVInput = 0.3,
				positionVInput = {
					-1382.811,
					81.931,
					1019.485
				},
				rotationVInput = {
					13.845,
					70.014,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 200,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 135,
				fStop = 20,
				cameraId = 90829622,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 86076120,
				playableStateVInput = "Talk_Introduce"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 2.7,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 86076120,
				animationLayerVInput = 4,
				playableStateVInput = "TalkUpper_Like"
			},
			fields = {
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005305,
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
						nodeId = 64,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 103,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005304,
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
						nodeId = 72,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990074,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1116927411
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack01",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 65,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005300,
				processingTime = 2.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 67,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10053_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 65,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 68,
						portId = "In"
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
						nodeId = 69,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 65,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 65,
					portId = "EntityID"
				}
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
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005303,
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
						nodeId = 80,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990073,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -575638234
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack01",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 73,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005300,
				processingTime = 2.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 75,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10053_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 73,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 76,
						portId = "In"
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
						nodeId = 77,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 73,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 73,
					portId = "EntityID"
				}
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
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005302,
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
						nodeId = 88,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990072,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -418749737
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack01",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 81,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005300,
				processingTime = 2.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 83,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10053_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 81,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 84,
						portId = "In"
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
						nodeId = 85,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 81,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 81,
					portId = "EntityID"
				}
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
						nodeId = 82,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005301,
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
						nodeId = 96,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990071,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -113045865
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 95,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack01",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 89,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005300,
				processingTime = 2.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 91,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10053_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 89,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 92,
						portId = "In"
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
						nodeId = 93,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 89,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 94,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 89,
					portId = "EntityID"
				}
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
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990066,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1912437297
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 102,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack01",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 96,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005300,
				processingTime = 2.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 98,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10053_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 96,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 99,
						portId = "In"
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
						nodeId = 100,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 96,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 96,
					portId = "EntityID"
				}
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
						nodeId = 97,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990075,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1776676417
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 109,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack01",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 103,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005300,
				processingTime = 2.833,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 105,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10053_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 103,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 106,
						portId = "In"
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
						nodeId = 107,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 103,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 108,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 103,
					portId = "EntityID"
				}
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
						nodeId = 104,
						portId = "In"
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
						nodeId = 111,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_10051_Fireball_Hit.prefab",
				postionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_RACE",
					1005500,
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
						nodeId = 113,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 147,
						portId = "In"
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
						nodeId = 119,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 114,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 117,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 145,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 28,
				positionVInput = {
					-1384.196,
					82,
					1019.845
				},
				rotationVInput = {
					359.282,
					283.078,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 180,
				fStop = 17,
				cameraId = 90829468,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 28,
				positionVInput = {
					-1384.196,
					81.3,
					1019.845
				},
				rotationVInput = {
					359.282,
					283.078,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 180,
				fStop = 17,
				cameraId = 90829582,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 116,
						portId = "In"
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
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
						3,
						3,
						3
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
			kind = 4,
			fields = {
				delayTime = 3.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 118,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
				dialogueIdVInput = 6505023
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005101,
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
						nodeId = 128,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 120,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990067,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -197218927
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 127,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Skill_Fireball",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 120,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005100,
				processingTime = 1.25,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 122,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10051_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 120,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 123,
						portId = "In"
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
						nodeId = 124,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 120,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 125,
						portId = "In"
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
						nodeId = 126,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 120,
					portId = "EntityID"
				}
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
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005104,
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
						nodeId = 137,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 129,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990068,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1018727779
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 136,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Skill_Fireball",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 129,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005100,
				processingTime = 1.25,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 131,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10051_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 129,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 132,
						portId = "In"
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
						nodeId = 133,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 129,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 134,
						portId = "In"
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
						nodeId = 135,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 129,
					portId = "EntityID"
				}
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
						nodeId = 130,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990029,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -2090166212
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 144,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Skill_Fireball",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 137,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005100,
				processingTime = 1.25,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 139,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10051_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 137,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 140,
						portId = "In"
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
						nodeId = 141,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 137,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 142,
						portId = "In"
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
						nodeId = 143,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 137,
					portId = "EntityID"
				}
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
						nodeId = 138,
						portId = "In"
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
						nodeId = 146,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_10051_Fireball_Hit.prefab",
				postionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
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
						nodeId = 148,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 155,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 158,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 160,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990076,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.9,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -868659061
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 154,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack04",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 148,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005500,
				processingTime = 3.067,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 150,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10055_Attack_L"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 148,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 151,
						portId = "In"
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
						nodeId = 152,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 148,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 153,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 148,
					portId = "EntityID"
				}
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
						nodeId = 149,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				positionVInput = {
					-1383.083,
					82.5,
					1019.634
				},
				rotationVInput = {
					330,
					282.562,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 100,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 17,
				cameraId = 91227658,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 156,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				fovVInput = 25,
				positionVInput = {
					-1383.083,
					82.2,
					1019.634
				},
				rotationVInput = {
					15,
					281.703,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 100,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 17,
				cameraId = 91227661,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 157,
						portId = "In"
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
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
						3,
						3,
						3
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
			kind = 4,
			fields = {
				delayTime = 3.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 159,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
				dialogueIdVInput = 6505097
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 19,
						portId = "In"
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
						nodeId = 161,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_10055_Skill_Attack01.prefab",
				postionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
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
						nodeId = 168,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 163,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 166,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 194,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				positionVInput = {
					-1383.083,
					82.024,
					1019.634
				},
				rotationVInput = {
					344.844,
					282.562,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 100,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 17,
				cameraId = 91125023,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 164,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				fovVInput = 25,
				positionVInput = {
					-1383.083,
					82.024,
					1019.634
				},
				rotationVInput = {
					25.409,
					281.703,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 100,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 108,
				fStop = 17,
				cameraId = 91125022,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 165,
						portId = "In"
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
					decayTime = 2,
					sustainTime = 0.1,
					attackTime = 0,
					holdForever = false,
					playSpace = 0,
					shakeType = 1,
					shakeRadiusCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
						3,
						3,
						3
					},
					shakeFrequencyCurve = {
						postWrapMode = 8,
						preWrapMode = 8,
						keys = {
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 0,
								outTangent = 0,
								inTangent = 0
							},
							{
								value = 1,
								inWeight = 0,
								weightedMode = 0,
								outWeight = 0,
								time = 1,
								outTangent = 0,
								inTangent = 0
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
			kind = 4,
			fields = {
				delayTime = 3.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 167,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				enableFadeOutVInput = true,
				enableFadeInVInput = true,
				dialogueIdVInput = 6505093
			},
			fields = {
				skipTime = 1,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005201,
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
						nodeId = 177,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 169,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990069,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -982117518
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 176,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack02",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 169,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005200,
				processingTime = 1.367,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 171,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10052_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 169,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 172,
						portId = "In"
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
						nodeId = 173,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 169,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 174,
						portId = "In"
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
						nodeId = 175,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 169,
					portId = "EntityID"
				}
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
						nodeId = 170,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"HAS_PET_ID",
					1005204,
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
						nodeId = 186,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 178,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990070,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -651446136
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 185,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack02",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 178,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005200,
				processingTime = 1.05,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 180,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10052_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 178,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 181,
						portId = "In"
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
						nodeId = 182,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 178,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 183,
						portId = "In"
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
						nodeId = 184,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 178,
					portId = "EntityID"
				}
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
						nodeId = 179,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 990065,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1659315316
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 193,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 1,
				playableStateVInput = "Attack02",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 186,
					portId = "EntityID"
				}
			},
			fields = {
				isLooping = false,
				entityType = 1,
				templateId = 1005200,
				processingTime = 1.05,
				playAniType = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 188,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Combat_Parmon_10052_Attack_H"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 186,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 189,
						portId = "In"
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
						nodeId = 190,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "parmon_10051_Skill_FireBall_Shoot"
			},
			valueIn = {
				audioTransformVInput = {
					nodeId = 186,
					portId = "BoneTrans"
				}
			},
			flowIn = {
				Play = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 191,
						portId = "In"
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
						nodeId = 192,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 186,
					portId = "BoneTrans"
				}
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
						nodeId = 187,
						portId = "In"
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
						nodeId = 195,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_Parmon_10051_Fireball_Hit.prefab",
				postionVInput = {
					-1385.996,
					80.805,
					1020.282
				},
				rotationVInput = {
					0,
					102.252,
					0
				}
			},
			fields = {
				playOne = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 1,
				maxLimitTimeVInput = 0.2,
				speedVInput = 1.25,
				moveTypeVInput = 2,
				targetEulerAngleVInput = {
					0,
					58.647,
					0
				},
				targetPositionVInput = {
					-1385.632,
					80.873,
					1017.328
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
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0,
							inTangent = 1
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		}
	}
}
