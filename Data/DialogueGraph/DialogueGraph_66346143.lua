-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_66346143.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 66346143,
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
			kind = 22,
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
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					290.704,
					0
				},
				targetPositionVInput = {
					-490.93,
					57.78,
					839.178
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 87,
					portId = "EntityID"
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
						nodeId = 5,
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
					hideInteractionSign = false,
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
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						multiPlayer = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
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
						nodeId = 6,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				enablePlayerMoveVInput = false,
				enableEventVInput = false,
				enableCameraZoomVInput = false,
				showTopLogoVInput = false,
				showAllUIVInput = false,
				endSkipVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 7,
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
						nodeId = 14,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 15,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 16,
						portId = "StopDof"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					343.873,
					358.993
				},
				targetPositionVInput = {
					-511.92,
					52.925,
					836.745
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 91,
					portId = "EntityID"
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Dialogue_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 91,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 4,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Story_Dialogue_Start",
					"Story_Dialogue_Loop",
					"Story_Dialogue_End"
				}
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
					5701140,
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
					true,
					0
				}
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
			kind = 4,
			fields = {
				delayTime = 4.5
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
			kind = 10,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1
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
			kind = 3,
			inputs = {
				fovVInput = 50,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-510.996,
					54.17,
					835.375
				},
				rotationVInput = {
					350.142,
					344.57,
					359.183
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 25,
				cameraId = 90918819,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 650,
				recombineQuality = 1,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk",
				staticIdVInput = 79412478,
				loopDurationVInput = 60
			},
			fields = {
				templateId = 400063,
				processingTime = 21.2,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				fovVInput = 23,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-515.642,
					56.08,
					840.216
				},
				rotationVInput = {
					15.745,
					2.299,
					0
				}
			},
			fields = {
				focalDistance = 594,
				fStop = 8.02,
				cameraId = 72517797,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0,
				StopDof = 1
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
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
						nodeId = 18,
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
				["0"] = {
					{
						nodeId = 19,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 42,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 45,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 51,
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
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-487.985,
					58.998,
					838.558
				},
				rotationVInput = {
					357.458,
					291.452,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72477715,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 21,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 35,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-492.135,
					59.715,
					839.8
				},
				rotationVInput = {
					7.061,
					291.452,
					1.95
				}
			},
			fields = {
				focalDistance = 2001,
				fStop = 27.81,
				cameraId = 72481916,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 22,
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
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-507.274,
					53.748,
					839.856
				},
				rotationVInput = {
					340.198,
					308.67,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72508986,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 30,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-507.343,
					53.67,
					839.872
				},
				rotationVInput = {
					340.198,
					308.67,
					0
				}
			},
			fields = {
				focalDistance = 463,
				fStop = 32,
				cameraId = 91518057,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 328,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 4
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
						nodeId = 40,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 39,
						portId = "In"
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
						nodeId = 27,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 25,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-522.111,
					56.475,
					849.649
				},
				rotationVInput = {
					23.652,
					352.673,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72507454,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 3,
				fovVInput = 25,
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-522.232,
					56.698,
					849.732
				},
				rotationVInput = {
					23.652,
					352.673,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72507455,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				portCount = 3
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
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 23,
				blendFuncVInput = "Cubic",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-515.639,
					56.354,
					840.305
				},
				rotationVInput = {
					18.667,
					2.128,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 72518141,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
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
			kind = 2,
			fields = {
				portCount = 9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["2"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400326,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-516.594,
					52.941,
					845.42
				},
				rotationVInput = {
					0,
					356.47,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -816293067
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 33,
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
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Applaud_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 10
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 32,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 0.967,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 16,
			inputs = {
				slotParamVInput = 400276,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-515.643,
					53.027,
					845.388
				},
				rotationVInput = {
					0,
					359.007,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -229474195
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				playableStateVInput = "Story_Akimbo01_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 10
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 35,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 1.667,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400273,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-514.615,
					52.997,
					845.421
				},
				rotationVInput = {
					0,
					355.814,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -531627874
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Applaud_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 10
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 37,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 0.967,
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
				playableStateVInput = "Behav_HappyLoop",
				speedVInput = 0.8,
				loopDurationVInput = 60,
				staticIdVInput = 91352610
			},
			fields = {
				templateId = 400311,
				processingTime = 2.967,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 91352610,
				targetEulerAngleVInput = {
					0,
					185.725,
					0
				},
				targetPositionVInput = {
					-514.027,
					53.11,
					847.849
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400276,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-509.3,
					52.905,
					841.068
				},
				rotationVInput = {
					0,
					333.742,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -38369865
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 43,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 4.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Pray_Loop"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 42,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 2.883,
				playAniType = 1,
				isLooping = true,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400273,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-510.39,
					52.907,
					841.078
				},
				rotationVInput = {
					0,
					333.742,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -715263308
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 46,
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
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Pray_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 60
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 45,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 2.883,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400326,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-509.772,
					52.905,
					842.281
				},
				rotationVInput = {
					0,
					328.583,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -416736693
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 49,
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
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Pray_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 60
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 48,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 2.883,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400273,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-509.233,
					52.915,
					842.406
				},
				rotationVInput = {
					0,
					325.736,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -314525462
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 52,
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
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Pray_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 60
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 51,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 400276,
				processingTime = 2.883,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		[87] = {
			kind = 17,
			fields = {
				entityType = 0
			}
		},
		[91] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
