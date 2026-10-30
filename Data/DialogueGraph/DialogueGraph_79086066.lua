-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79086066.lua

return {
	schema = 1,
	startNodeId = 2,
	dialogueId = 79086066,
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
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 71,
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
				modeInfo = {
					applyStateConflict = false,
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
					hideUIWhiteList = {
						[306] = true,
						[200] = true
					},
					toplogoComList = {
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
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
				Out = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 45,
			inputs = {
				timelineResIdVInput = "$P_TL_Novice_P7_HuiGui.prefab"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				PreFinish = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				StartPlay = {
					{
						portId = "In",
						nodeId = 191
					}
				}
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 32,
			fields = {
				eventName = "resetBGM"
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
						nodeId = 18
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 9
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 190
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					19.777,
					53.208,
					999.686
				},
				rotationVInput = {
					1.722,
					77.685,
					359.456
				}
			},
			fields = {
				cameraId = 79233773,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 400,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 723,
				fStop = 10
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					274.644,
					0
				},
				targetPositionVInput = {
					30.3,
					51.839,
					1001.887
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
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					71.209,
					0
				},
				targetPositionVInput = {
					28.48,
					51.84,
					1001.09
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 192
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
						portId = "In",
						nodeId = 12
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
					85.273,
					0
				},
				targetPositionVInput = {
					25.488,
					51.83,
					1002.003
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 194
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
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 79259334,
				targetEulerAngleVInput = {
					0,
					77.339,
					0
				},
				targetPositionVInput = {
					24.369,
					51.83,
					1000.927
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
						portId = "In",
						nodeId = 14
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
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 38,
			inputs = {
				targetEulerAngleVInput = {
					0,
					83.025,
					0
				},
				targetPositionVInput = {
					28.396,
					51.836,
					1001.93
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 193
				}
			},
			fields = {
				finishToSteer = true
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
				delayTime = 0.5
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
			kind = 19,
			inputs = {
				staticIdVInput = 79259334,
				maxLimitTimeVInput = 10,
				targetEulerAngleVInput = {
					0,
					78.209,
					0
				},
				targetPositionVInput = {
					28.274,
					51.84,
					1000.948
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
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							value = 0
						},
						{
							inTangent = 1,
							outTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							value = 1
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
				delayTime = 3
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
						nodeId = 189
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
					applyStateConflict = false,
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
					hideUIWhiteList = {
						[306] = true
					},
					toplogoComList = {
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
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
						portId = "In",
						nodeId = 22
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					242.9,
					0
				},
				targetPositionVInput = {
					37.52,
					52.03,
					1007.92
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
						portId = "In",
						nodeId = 23
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
					51.079,
					0
				},
				targetPositionVInput = {
					28.811,
					51.841,
					1000.719
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
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 79259334,
				targetEulerAngleVInput = {
					0,
					103.285,
					0
				},
				targetPositionVInput = {
					27.949,
					51.841,
					1000.001
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
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.1,
				staticIdVInput = 77239042
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
						portId = "End",
						nodeId = 1
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
						nodeId = 186
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 28
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 188
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707901,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 1,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 29
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
						nodeId = 30
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 185
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707902,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 5.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true
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
						nodeId = 32
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
						nodeId = 33
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 183
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 184
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
						nodeId = 34
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
						nodeId = 35
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
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					29.309,
					53.525,
					1000.406
				},
				rotationVInput = {
					7.248,
					61.338,
					0
				}
			},
			fields = {
				cameraId = 90796687,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 115,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 102,
				fStop = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 27,
				blendFuncVInput = "Linear",
				blendTimeVInput = 12,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					29.314,
					53.486,
					1000.472
				},
				rotationVInput = {
					5.529,
					66.495,
					0
				}
			},
			fields = {
				cameraId = 90972670,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 115,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 195,
				fStop = 3.24
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
						portId = "closeUIFInput",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 306,
				param = {
					name = "CHARACTER_APPEARANCE_NAME_Oswin",
					title = "CHARACTER_APPEARANCE_DESC_Oswin",
					pos = {
						-1380,
						0,
						120
					}
				}
			},
			flowIn = {
				closeUIFInput = 1,
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 39
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
						nodeId = 40
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
						nodeId = 41
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
						nodeId = 42
					}
				},
				["1"] = {
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
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239042,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707903,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Talk_Righthand",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 0,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Talk_Righthand",
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
						nodeId = 45
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
						nodeId = 181
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707904,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 0,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707905,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 11.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400129,
				matchAudioDuration = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 3707906,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Story_Thankful",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Story_Thankful",
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
						nodeId = 49
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
						nodeId = 174
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 50
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
					"<=",
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
						nodeId = 173
					}
				},
				True = {
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
				dialogueIdVInput = 3707907,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 52
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
						nodeId = 53
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 171
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707909,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Story_Talk02",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Story_Talk02",
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
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707910,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 6.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400129,
				matchAudioDuration = true
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
						nodeId = 56
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 169
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 158
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 159
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707911,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Nod",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Emotion_Nod",
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
						nodeId = 57
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707912,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true
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
						nodeId = 168
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3707913
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 59
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
						nodeId = 163
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 60
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 165
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 166
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 167
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707915,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Nod",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Emotion_Nod",
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
						nodeId = 61
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
						nodeId = 161
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 62
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707916,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 11.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400129,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 63
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
						nodeId = 64
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 156
					}
				},
				["2"] = {
					{
						portId = "Close",
						nodeId = 158
					}
				},
				["3"] = {
					{
						portId = "Close",
						nodeId = 159
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 160
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707918,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 3.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Invite",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Invite",
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
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707919,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Emotion_Confused_Start",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				animCfg = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End",
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
						portId = "In",
						nodeId = 66
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
						nodeId = 154
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707920,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 10.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400129,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 68
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
						nodeId = 69
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 150
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 152
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707921,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400129,
				matchAudioDuration = true
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
						nodeId = 71
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 148
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 149
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707922,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400100,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 72
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
						nodeId = 73
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
						nodeId = 74
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 80
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 146
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 76
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 77
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 147
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 54,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					25.611,
					53.172,
					1001.835
				},
				rotationVInput = {
					4.234,
					93.046,
					0
				}
			},
			fields = {
				cameraId = 90831515,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
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
						nodeId = 75
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 56,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					25.273,
					53.197,
					1001.853
				},
				rotationVInput = {
					4.234,
					93.046,
					0
				}
			},
			fields = {
				cameraId = 90831553,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
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
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 3707320,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 5.62,
				disableCamera = false,
				chatType = 9,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 77239042,
				speedVInput = 1.15,
				maxLimitTimeVInput = 10,
				targetEulerAngleVInput = {
					0,
					90,
					0
				},
				targetPositionVInput = {
					37.309,
					51.766,
					1004.071
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
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							value = 0
						},
						{
							inTangent = 1,
							outTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							value = 1
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
						portId = "In",
						nodeId = 78
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
						nodeId = 79
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1,
				staticIdVInput = 77239042
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
					2602114,
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
					true
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 81
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707314,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 3.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				anim = "Story_Talk02",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400129,
				matchAudioDuration = true,
				animCfg = {
					[1] = "Story_Talk02",
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
						nodeId = 82
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 37073141,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400129,
				matchAudioDuration = true
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
						nodeId = 84
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
						nodeId = 85
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 89
					}
				},
				["2"] = {
					{
						portId = "Stop",
						nodeId = 146
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 87
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					26.509,
					53.407,
					1003.469
				},
				rotationVInput = {
					10.147,
					126.461,
					0
				}
			},
			fields = {
				cameraId = 90880793,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
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
						nodeId = 86
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					27.075,
					53.28,
					1003.05
				},
				rotationVInput = {
					10.147,
					126.461,
					0
				}
			},
			fields = {
				cameraId = 90880825,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
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
						portId = "Close",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					28.595,
					53.69,
					1003.151
				},
				rotationVInput = {
					7.111,
					181.398,
					2.78
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 2,
				radius = 3,
				spotLightInnerAngle = 40,
				spotLightOuterAngle = 50,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 59103,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9671662,
					r = 1,
					a = 1,
					b = 0.88
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 38,
			inputs = {
				speedVInput = 0.8,
				entityIdVInput = 77239062,
				maxLimitTimeVInput = 5,
				targetEulerAngleVInput = {
					0,
					299.26,
					0
				},
				targetPositionVInput = {
					29.541,
					51.838,
					1001
				}
			},
			fields = {
				finishToSteer = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 90
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
						nodeId = 91
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
						nodeId = 94
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
						nodeId = 143
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 93
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
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 17,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					27.615,
					53.371,
					1005.494
				},
				rotationVInput = {
					8.27,
					163.865,
					0
				}
			},
			fields = {
				cameraId = 91285764,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 138,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 309,
				fStop = 13.49
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707315,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400398,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 95
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
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 77239062
			},
			valueIn = {
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 195
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
						portId = "In",
						nodeId = 97
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
						nodeId = 136
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 98
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 101
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 99
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 134
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 137
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 139
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239062,
				playableStateVInput = "Gauntlet_Skill_Summon_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 400398,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Gauntlet_Skill_Summon_Start",
					"Gauntlet_Skill_Summon_Loop",
					"Gauntlet_Skill_Summon_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "Eff_Avatar_MenuSignal_02"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 196
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
			kind = 49,
			valueIn = {
				effectIdVInput = {
					portId = "EffectID",
					nodeId = 99
				},
				generatorIdVInput = {
					portId = "GeneratorID",
					nodeId = 99
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2.1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 3
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
						nodeId = 103
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 100
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239062,
				playableStateVInput = "Idle"
			},
			fields = {
				entityType = 2,
				templateId = 400398,
				processingTime = 5.167,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
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
						nodeId = 105
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707316,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 7.12,
				disableCamera = false,
				chatType = 10,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707321,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 3.5,
				disableCamera = false,
				chatType = 10,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 107
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707317,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true
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
				}
			}
		},
		{
			kind = 12,
			inputs = {
				resumeNpcVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 109
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
						nodeId = 110
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
						nodeId = 127
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 111
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 200,
				param = {
					helpId = 410
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
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
				portCount = 5
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
						nodeId = 122
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 124
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 125
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707318,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 9.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239040,
				npcId = 400129,
				matchAudioDuration = true
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
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 115
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 120
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 121
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3707319,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 2.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 116
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 37073191,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 77239042,
				npcId = 400129,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 117
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
						portId = "0",
						nodeId = 118
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 119
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = 77239040,
				speedVInput = 1.1,
				maxLimitTimeVInput = 10,
				targetEulerAngleVInput = {
					0,
					242.9,
					0
				},
				targetPositionVInput = {
					37.52,
					52.03,
					1007.92
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
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							value = 0
						},
						{
							inTangent = 1,
							outTangent = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							value = 1
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
				delayTime = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 1,
				playableStateVInput = "Talk_Righthand",
				staticIdVInput = 77239040
			},
			fields = {
				entityType = 2,
				templateId = 401086,
				processingTime = 2,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 54,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					25.729,
					53.174,
					1000.724
				},
				rotationVInput = {
					3.959,
					77.508,
					0
				}
			},
			fields = {
				cameraId = 91285790,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					51.079,
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
						nodeId = 126
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 118
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
						nodeId = 128
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
						portId = "Close",
						nodeId = 129
					}
				},
				["1"] = {
					{
						portId = "Close",
						nodeId = 130
					}
				},
				["2"] = {
					{
						portId = "Close",
						nodeId = 131
					}
				},
				["3"] = {
					{
						portId = "Close",
						nodeId = 132
					}
				},
				["5"] = {
					{
						portId = "Close",
						nodeId = 133
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					29.915,
					53.637,
					1001.732
				},
				rotationVInput = {
					20.189,
					153.056,
					358.91
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = true,
				punctualLightUnit = 1,
				radius = 20,
				spotLightInnerAngle = 80,
				spotLightOuterAngle = 110,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 4,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 11507,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9397849,
					r = 1,
					a = 1,
					b = 0.88
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					29.414,
					53.362,
					1002.898
				},
				rotationVInput = {
					18.738,
					131.861,
					359.426
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 1,
				radius = 1.9,
				spotLightInnerAngle = 70,
				spotLightOuterAngle = 70,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 25356,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9470125,
					r = 1,
					a = 1,
					b = 0.8784314
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					30.911,
					53.363,
					999.686
				},
				rotationVInput = {
					1.53,
					333.62,
					355.22
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 1,
				radius = 3,
				spotLightInnerAngle = 100,
				spotLightOuterAngle = 100,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 20000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9210251,
					r = 0.7028302,
					a = 1,
					b = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					30.894,
					52.766,
					1001.14
				},
				rotationVInput = {
					1.253,
					328.281,
					358.219
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 1,
				radius = 1.87,
				spotLightInnerAngle = 0,
				spotLightOuterAngle = 119,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 28904,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.7792324,
					r = 0.514151,
					a = 1,
					b = 1
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					29.366,
					53.7,
					1003.174
				},
				rotationVInput = {
					21.275,
					208.398,
					356.214
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 1,
				radius = 10,
				spotLightInnerAngle = 0,
				spotLightOuterAngle = 75,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 30000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.934635,
					r = 1,
					a = 1,
					b = 0.85
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 135
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_NPC_Item_BiNiShow.prefab",
				postionVInput = {
					29.355,
					53.397,
					1001.359
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
				fovVInput = 18,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					27.239,
					52.316,
					1005.147
				},
				rotationVInput = {
					350.737,
					156.302,
					0
				}
			},
			fields = {
				cameraId = 91285748,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 138,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 309,
				fStop = 13.49
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.4
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
			kind = 20,
			inputs = {
				durationVInput = 1,
				isFadeInVInput = true,
				staticIdVInput = -99500445
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 1.5,
				loopDurationVInput = 3,
				staticIdVInput = 2,
				playableStateVInput = "BINI_Back_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 0,
				templateId = 301,
				processingTime = 3,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"BINI_Back_Start",
					"BINI_Back_Loop",
					"BINI_Back_End"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 140
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
						nodeId = 141
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.8,
				staticIdVInput = -99500445
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5070005,
				defaultHideVInput = true,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					29.56,
					51.812,
					1000.959
				},
				rotationVInput = {
					0,
					305.959,
					0
				}
			},
			fields = {
				entityId = -99500445,
				ignoreGravity = true
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
						portId = "Close",
						nodeId = 144
					}
				}
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					27.165,
					54.033,
					1003.47
				},
				rotationVInput = {
					27.315,
					160.368,
					8.01
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 1,
				radius = 4.58,
				spotLightInnerAngle = 80,
				spotLightOuterAngle = 80,
				temperature = 1500,
				todEvMappingCurveName = "LightCurve_Ark",
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 4,
				lightUnit = 1,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 68562,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 2,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.984507,
					r = 1,
					a = 1,
					b = 0.9
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 200
				},
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 197
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
			kind = 5,
			inputs = {
				loopDurationVInput = 2,
				playableStateVInput = "Story_Dialogue_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 2
			},
			fields = {
				entityType = 0,
				templateId = 301,
				processingTime = 1.933,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Story_Dialogue_Start",
					"Story_Dialogue_Loop",
					"Story_Dialogue_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				loopDurationVInput = 2,
				playableStateVInput = "Emotion_Excited_Start",
				playStartLoopEndVInput = true,
				staticIdVInput = 77239040
			},
			fields = {
				entityType = 2,
				templateId = 400100,
				processingTime = 1.933,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Emotion_Excited_Start",
					"Emotion_Excited_Loop",
					"Emotion_Excited_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
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
					25.64,
					53.213,
					1000.385
				},
				rotationVInput = {
					9.026,
					75.976,
					0.115
				}
			},
			fields = {
				cameraId = 91069356,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 414,
				fStop = 10.54
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 151
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					25.569,
					53.386,
					1000.85
				},
				rotationVInput = {
					9.541,
					79.415,
					0.115
				}
			},
			fields = {
				cameraId = 91069373,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 350,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 282,
				fStop = 10.54
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 153
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239042,
				staticIdVInput = 77239040
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
					29.309,
					53.235,
					1000.392
				},
				rotationVInput = {
					354.415,
					61.336,
					0.114
				}
			},
			fields = {
				cameraId = 91128440,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 144,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 83,
				fStop = 12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 155
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					29.365,
					53.241,
					1000.422
				},
				rotationVInput = {
					353.556,
					61.506,
					0.114
				}
			},
			fields = {
				cameraId = 91128472,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 144,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 83,
				fStop = 12
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
					25.286,
					52.542,
					1000.238
				},
				rotationVInput = {
					356.547,
					73.476,
					0.114
				}
			},
			fields = {
				cameraId = 91069357,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 300,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 370,
				fStop = 10.54
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 157
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					24.955,
					52.511,
					1000.14
				},
				rotationVInput = {
					356.547,
					73.476,
					0.114
				}
			},
			fields = {
				cameraId = 91069446,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 350,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 282,
				fStop = 10.54
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					30.442,
					54.177,
					1002.057
				},
				rotationVInput = {
					36.956,
					187.918,
					0.19
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 2,
				radius = 5,
				spotLightInnerAngle = 45,
				spotLightOuterAngle = 45,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 70000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9510453,
					r = 1,
					a = 1,
					b = 0.85
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 63,
			inputs = {
				positionVInput = {
					30.304,
					53.953,
					1002.775
				},
				rotationVInput = {
					36.956,
					187.918,
					0.19
				}
			},
			fields = {
				mainLightRange = 3,
				needTodEVMapping = false,
				punctualLightUnit = 2,
				radius = 10,
				spotLightInnerAngle = 45,
				spotLightOuterAngle = 45,
				temperature = 1500,
				twoSide = false,
				usePhysicalLightUnit = false,
				localLightRange = 0,
				lightUnit = 2,
				lightType = 0,
				isSpot = false,
				isDisk = false,
				intensity = 50000,
				ignoreDynamicCasters = false,
				emissionAppearanceType = 0,
				directionalLightAngularDiameter = 0,
				directionLightUnit = 3,
				channel = 0,
				areaLightUnit = 1,
				areaLightShapeRectangleSizeY = 5,
				areaLightShapeRectangleSizeX = 5,
				areaLightShapeCapsuleUseEndCaps = false,
				areaLightShapeCapsuleRadius = 1,
				areaLightShapeCapsuleLength = 5,
				areaLightShape = 0,
				color = {
					g = 0.9560122,
					r = 1,
					a = 1,
					b = 0.88
				}
			},
			dynamicInputs = {
				"colorDynamicVInput",
				"intensityDynamicVInput",
				"positionDynamicVInput",
				"radiusDynamicVInput",
				"rotationDynamicVInput",
				"temperatureDynamicVInput"
			},
			flowIn = {
				In = 0,
				Close = 1
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					274.644,
					0
				},
				targetPositionVInput = {
					30.3,
					51.839,
					1001.887
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
						nodeId = 162
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					29.096,
					53.505,
					999.761
				},
				rotationVInput = {
					7.547,
					42.558,
					0.114
				}
			},
			fields = {
				cameraId = 91127748,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 168,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 205,
				fStop = 12.11
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 164
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 22,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					29.053,
					53.497,
					999.887
				},
				rotationVInput = {
					7.719,
					45.996,
					0.115
				}
			},
			fields = {
				cameraId = 91128564,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 168,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 260,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 77239042,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					91.103,
					0
				},
				targetPositionVInput = {
					28.224,
					51.836,
					1001.665
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
			kind = 14,
			inputs = {
				staticIdVInput = 77239040,
				targetEulerAngleVInput = {
					0,
					231.921,
					0
				},
				targetPositionVInput = {
					30.468,
					51.839,
					1001.796
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
			kind = 7,
			fields = {
				dialogueId = 3707914
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 59
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 14,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					31.853,
					53.869,
					999.349
				},
				rotationVInput = {
					11.969,
					309.073,
					0
				}
			},
			fields = {
				cameraId = 83293671,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 120,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 367,
				fStop = 12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 170
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 14,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					31.737,
					53.853,
					999.328
				},
				rotationVInput = {
					11.969,
					309.589,
					0
				}
			},
			fields = {
				cameraId = 90884565,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 350,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 282,
				fStop = 10.54
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 15,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					21.606,
					52.723,
					1000.51
				},
				rotationVInput = {
					359.675,
					82.42,
					0.114
				}
			},
			fields = {
				cameraId = 80720979,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 280,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 740,
				fStop = 15.77
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 172
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 15,
				blendTimeVInput = 20,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					21.763,
					52.724,
					1000.508
				},
				rotationVInput = {
					359.503,
					82.248,
					0.114
				}
			},
			fields = {
				cameraId = 80720980,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
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
				dialogueIdVInput = 3707908,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				duration = 4.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
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
						portId = "In",
						nodeId = 177
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 175
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					30.288,
					52.948,
					1000.652
				},
				rotationVInput = {
					358.356,
					306.632,
					0
				}
			},
			fields = {
				cameraId = 91081591,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 216,
				fStop = 16
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 176
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					30.213,
					52.914,
					1000.709
				},
				rotationVInput = {
					357.496,
					305.773,
					0
				}
			},
			fields = {
				cameraId = 91081594,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 161,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					30.327,
					52.919,
					1000.565
				},
				rotationVInput = {
					355.778,
					305.257,
					0
				}
			},
			fields = {
				cameraId = 91384342,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 216,
				fStop = 16
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 178
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 16,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					30.309,
					52.931,
					1000.553
				},
				rotationVInput = {
					356.809,
					305.085,
					0
				}
			},
			fields = {
				cameraId = 91384564,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 160,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 161,
				fStop = 16
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 18,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					31.815,
					53.655,
					999.111
				},
				rotationVInput = {
					8.613,
					311.873,
					0.115
				}
			},
			fields = {
				cameraId = 90815358,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 141,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 282,
				fStop = 17.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 180
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 18,
				blendTimeVInput = 10,
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					31.728,
					53.625,
					999.154
				},
				rotationVInput = {
					8.441,
					313.248,
					0.115
				}
			},
			fields = {
				cameraId = 90884266,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 337,
				fStop = 23
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239042
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
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239042,
				playableStateVInput = "Show"
			},
			fields = {
				entityType = 2,
				templateId = 400129,
				processingTime = 4.667,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 77239042
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239040,
				playableStateVInput = "Story_IntroduceOtherLeft"
			},
			fields = {
				entityType = 2,
				templateId = 400100,
				processingTime = 3.833,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239042
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 187
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 77239040
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 77239040,
				playableStateVInput = "TalkUpper_Greet",
				animationLayerVInput = 4
			},
			fields = {
				entityType = 2,
				templateId = 400100,
				processingTime = 0,
				playAniType = 1,
				isLooping = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 20,
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					22.338,
					53.016,
					1000.369
				},
				rotationVInput = {
					1.378,
					78.72,
					359.456
				}
			},
			fields = {
				cameraId = 81488122,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 400,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 723,
				fStop = 10.02
			},
			flowIn = {
				In = 0
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
						nodeId = 129
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 130
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 131
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 132
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 144
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 133
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 72,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		{
			kind = 17,
			fields = {
				entityType = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 77239062
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 77239062
			},
			fields = {
				entityType = 2
			}
		},
		[200] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
