-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72787032.lua

return {
	dialogueId = 72787032,
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
						portId = "End",
						nodeId = 0
					}
				},
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 194
				}
			},
			fields = {
				resetOrientation = false,
				reactPreset = 0,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = false,
				cameraPreset = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801104,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 6
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 192
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801105
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
				dialogueIdVInput = 3801107,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 8
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
						nodeId = 9
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
						nodeId = 10
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
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 18
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 20
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 22
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 191
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					239.768,
					0
				},
				targetPositionVInput = {
					-554.959,
					49.66,
					860.759
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 195
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400117,
				positionVInput = {
					-553.134,
					49.841,
					861.102
				},
				rotationVInput = {
					0,
					230.034,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1746487237
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 12
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
				slotParamVInput = 400119,
				positionVInput = {
					-553.49,
					50.105,
					862.789
				},
				rotationVInput = {
					0,
					230.034,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -797325863
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 24,
			inputs = {
				switchToPetVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 14
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					46.728,
					0
				},
				targetPositionVInput = {
					-554.193,
					49.67,
					860.428
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 14
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 14
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
				slotParamVInput = 400121,
				positionVInput = {
					-552.187,
					50.127,
					859.918
				},
				rotationVInput = {
					0,
					230.034,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1424527011
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
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
				slotParamVInput = 400122,
				positionVInput = {
					-552.545,
					50.125,
					862.39
				},
				rotationVInput = {
					0,
					230.034,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -643256078
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
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
				slotParamVInput = 400123,
				positionVInput = {
					-551.947,
					50.054,
					861.289
				},
				rotationVInput = {
					0,
					230.034,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1091320025
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0.3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 22
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
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
			kind = 23,
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
						nodeId = 27
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
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-554.958,
					51.053,
					862.69
				},
				rotationVInput = {
					9.77,
					201.608,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73549482
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.052,
					51.009,
					862.451
				},
				rotationVInput = {
					9.77,
					201.608,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73549999
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801108,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 30
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
						nodeId = 183
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 176
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 187
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 189
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
						nodeId = 32
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
						nodeId = 33
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
						nodeId = 34
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 175
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
						nodeId = 35
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
						nodeId = 36
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 44
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 42
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 43
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.157,
					51.177,
					863.454
				},
				rotationVInput = {
					13.723,
					205.045,
					-0.003
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73550444
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.66,
					50.887,
					862.378
				},
				rotationVInput = {
					13.723,
					205.045,
					-0.003
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73593422
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -617361914,
				playableStateVInput = "Story_TouchMiddle_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 6,
				entityIdVInput = -1104665415
			},
			fields = {
				templateId = 400152,
				processingTime = 4.067,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_TouchMiddle_Start",
					"Story_TouchMiddle_Loop",
					"Story_TouchMiddle_End"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -617361914,
				targetEulerAngleVInput = {
					0,
					55,
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
			kind = 5,
			inputs = {
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_SleepStart",
				playStartLoopEndVInput = true,
				loopDurationVInput = 10,
				entityIdVInput = -1211702387
			},
			fields = {
				templateId = 500068,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_SleepStart",
					"Behav_SleepLoop",
					"Behav_SleepEnd"
				}
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Cheeksupport"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 195
				}
			},
			fields = {
				templateId = 4,
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					239.768,
					0
				},
				targetPositionVInput = {
					-555.128,
					49.677,
					860.885
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 195
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400152,
				positionVInput = {
					-556.17,
					49.571,
					860.09
				},
				rotationVInput = {
					0,
					326,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -617361914
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
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
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
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801109,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 47
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 174
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801110
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3801112,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 49
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
						nodeId = 50
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 173
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 40
					}
				},
				["4"] = {
					{
						portId = "Stop",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801113,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 51
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
						nodeId = 54
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 52
					}
				},
				["2"] = {
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
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-556.577,
					51.284,
					863.826
				},
				rotationVInput = {
					15.114,
					167.145,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73603663
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
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-557.058,
					51.284,
					863.697
				},
				rotationVInput = {
					15.457,
					164.051,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91350804
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801114,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 18,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 55
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801115,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 7,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801116,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 57
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
						nodeId = 58
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 170
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 169
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801117,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 59
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
						nodeId = 60
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 166
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 168
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0.196,
					214.708,
					359.963
				}
			},
			valueIn = {
				staticIdVInput = {
					portId = "EntityID",
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
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 4,
				playableStateVInput = "Emotion_Confused"
			},
			valueIn = {
				staticIdVInput = {
					portId = "EntityID",
					nodeId = 195
				}
			},
			fields = {
				templateId = 4,
				processingTime = 5.5,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Confused",
					"Emotion_Confused",
					"Emotion_Confused"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 62
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
						nodeId = 63
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 164
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
						nodeId = 162
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
						nodeId = 64
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
						nodeId = 65
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 161
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801118,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 14,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 66
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801119,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 11,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 67
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801120,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 68
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 160
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801121
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
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801123,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 10,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 70
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 159
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801124
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
						nodeId = 72
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 149
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 156
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801126,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 4,
				disableCamera = false,
				chatType = 5,
				blackScreenPlayType = 1,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				portCount = 2
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
						nodeId = 148
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801127,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 75
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
						nodeId = 76
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 146
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 147
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801128,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 144
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 145
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801129,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 79
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
						nodeId = 80
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801130,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 81
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
						nodeId = 82
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 141
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801131,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 83
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
						portId = "In",
						nodeId = 84
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
						nodeId = 85
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
						nodeId = 86
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
						nodeId = 87
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
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 90
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
						portId = "In",
						nodeId = 135
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 138
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801132,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 13,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 91
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 134
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801133
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801135,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 8,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 93
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
						nodeId = 94
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801136,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 15,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 95
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801137,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801138,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 10,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 97
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				defaultSkipBranchVInput = 1,
				dialogueIdVInput = 3801155,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 2,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 6,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 98
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 132
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801156
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
						nodeId = 131
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801159,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 101
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
						nodeId = 102
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
						nodeId = 103
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
						nodeId = 104
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
						nodeId = 105
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 129
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 130
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				portCount = 3
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
						nodeId = 126
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 128
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801160,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 109
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
						nodeId = 110
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 125
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801161,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 111
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
						nodeId = 112
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
						nodeId = 123
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3801162,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 113
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
						nodeId = 114
					}
				},
				["1"] = {
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
				dialogueIdVInput = 3801163,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 115
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
						nodeId = 116
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 118
					}
				},
				["2"] = {
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
				dialogueIdVInput = 3801164,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 3,
				disableCamera = false,
				chatType = 0,
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
						nodeId = 117
					}
				}
			}
		},
		{
			kind = 68,
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
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-554.958,
					51.053,
					862.69
				},
				rotationVInput = {
					9.77,
					201.608,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 119
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 4,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.052,
					51.009,
					862.451
				},
				rotationVInput = {
					9.77,
					201.608,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73610708
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -617361914,
				playableStateVInput = "Daily_Thanks_Start"
			},
			fields = {
				templateId = 400152,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Daily_Thanks_Start",
					"Daily_Thanks_Loop",
					"Daily_Thanks_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_CryStart"
			},
			fields = {
				templateId = 500068,
				processingTime = 14.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1225764524,
				loopDurationVInput = 3,
				playableStateVInput = "JumpBack"
			},
			fields = {
				templateId = 400370,
				processingTime = 14.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
						nodeId = 124
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
					portId = "EntityID",
					nodeId = 130
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				templateId = 500068,
				processingTime = 14.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-554.288,
					50.985,
					860.076
				},
				rotationVInput = {
					4.27,
					46.258,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73610578
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 127
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-554.044,
					50.96,
					860.309
				},
				rotationVInput = {
					4.27,
					46.258,
					0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73610579
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1225764524,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				templateId = 400370,
				processingTime = 14.167,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1650005513,
				targetEulerAngleVInput = {
					0,
					93.071,
					0
				},
				targetPositionVInput = {
					-553.034,
					50.053,
					862.85
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400370,
				positionVInput = {
					-551.062,
					50.393,
					862.157
				},
				rotationVInput = {
					0,
					276.796,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1225764524
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -617361914,
				playableStateVInput = "Story_Give_Start"
			},
			fields = {
				templateId = 400152,
				processingTime = 2.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Story_Give_Start",
					"Story_Give_Loop",
					"Story_Give_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801157
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
			kind = 5,
			inputs = {
				staticIdVInput = -617361914,
				playableStateVInput = "Emotion_ShakeHead"
			},
			fields = {
				templateId = 400152,
				processingTime = 2.367,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801134
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 92
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -617361914,
				loopDurationVInput = 4,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				templateId = 400152,
				processingTime = 13.033,
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
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.01,
					51.318,
					863.993
				},
				rotationVInput = {
					15.114,
					196.194,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 137
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.129,
					51.203,
					863.585
				},
				rotationVInput = {
					15.114,
					195.679,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -617361914
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -617361914,
				targetEulerAngleVInput = {
					0,
					50,
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
			kind = 14,
			inputs = {
				staticIdVInput = -1650005513,
				targetEulerAngleVInput = {
					0,
					53.752,
					0
				},
				targetPositionVInput = {
					-556.922,
					49.656,
					860.769
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
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
						nodeId = 142
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_HappyStart"
			},
			fields = {
				templateId = 500068,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -617361914,
				loopDurationVInput = 4,
				playableStateVInput = "Daily_Thanks"
			},
			fields = {
				templateId = 400152,
				processingTime = 4.067,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -1650005513,
				targetEulerAngleVInput = {
					0,
					140,
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_CryStart"
			},
			fields = {
				templateId = 500068,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -617361914,
				loopDurationVInput = 6,
				playableStateVInput = "Emotion_ShakeHead"
			},
			fields = {
				templateId = 400152,
				processingTime = 4.067,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1650005513,
				staticIdVInput = -617361914
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = 72772091,
				playableStateVInput = "Behav_CryStart"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 178
				}
			},
			fields = {
				templateId = 500068,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
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
				portCount = 10
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
						nodeId = 13
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
						nodeId = 19
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 23
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 152
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 153
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 154
					}
				},
				["9"] = {
					{
						portId = "In",
						nodeId = 155
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
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					-120.493,
					0
				},
				targetPositionVInput = {
					-555.194,
					49.657,
					860.751
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 195
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = -1650005513,
				targetEulerAngleVInput = {
					0,
					282.618,
					0
				},
				targetPositionVInput = {
					-557.445,
					49.719,
					861.066
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -617361914,
				targetEulerAngleVInput = {
					0,
					326,
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
			kind = 20,
			inputs = {
				durationVInput = 0.3
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 191
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.9
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.518,
					50.586,
					862.838
				},
				rotationVInput = {
					6.332,
					211.853,
					-0.003
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91350805
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
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.518,
					50.586,
					862.815
				},
				rotationVInput = {
					6.332,
					211.853,
					-0.003
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73610089
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801125
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
			kind = 7,
			fields = {
				dialogueId = 3801122
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 5,
				staticIdVInput = -1746487237,
				playableStateVInput = "Behav_LoveStart"
			},
			fields = {
				templateId = 400117,
				processingTime = 4.067,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_LoveStart",
					"Behav_LoveLoop",
					"Behav_LoveEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-556.154,
					50.295,
					861.78
				},
				rotationVInput = {
					2.895,
					116.971,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73609804
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 163
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.721,
					50.283,
					861.947
				},
				rotationVInput = {
					2.551,
					126.941,
					0
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73609811
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-556.922,
					50.954,
					860.69
				},
				rotationVInput = {
					6.16,
					78.984,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73609808
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 167
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-556.671,
					50.927,
					860.741
				},
				rotationVInput = {
					6.16,
					78.64,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73609810
			},
			flowIn = {
				In = 0
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
						nodeId = 61
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1746487237,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				templateId = 400117,
				processingTime = 4.067,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-556.637,
					50.894,
					863.256
				},
				rotationVInput = {
					3.238,
					110.267,
					-0.002
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73603664
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 171
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.804,
					50.844,
					862.948
				},
				rotationVInput = {
					3.238,
					110.267,
					-0.002
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73603711
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 5,
				staticIdVInput = -617361914,
				playableStateVInput = "Emotion_Anger01_Start"
			},
			fields = {
				templateId = 400152,
				processingTime = 4.067,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Emotion_Anger01_Start",
					"Emotion_Anger01_Loop",
					"Emotion_Anger01_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_CryStart"
			},
			fields = {
				templateId = 500068,
				processingTime = 2,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_CryStart",
					"Behav_CryLoop",
					"Behav_CryEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801111
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72772087,
				durationVInput = 0.2
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
						nodeId = 177
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
						nodeId = 178
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
						nodeId = 179
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 182
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500068,
				positionVInput = {
					-556.922,
					49.656,
					860.445
				},
				rotationVInput = {
					0,
					53.752,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1650005513
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -1650005513,
				playableStateVInput = "SneakOutGround"
			},
			fields = {
				templateId = 500068,
				processingTime = 0.7,
				playAniType = 1,
				isLooping = false,
				entityType = 2
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
						nodeId = 181
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 2,
				staticIdVInput = -1650005513,
				playableStateVInput = "Behav_AngryStart"
			},
			fields = {
				templateId = 500068,
				processingTime = 1.4,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Behav_AngryStart",
					"Behav_AngryLoop",
					"Behav_AngryEnd"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = 72772091,
				durationVInput = 0.01
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.151,
					51.22,
					861.963
				},
				rotationVInput = {
					32.459,
					232.375,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73550002
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 184
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 3,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-555.799,
					50.691,
					861.459
				},
				rotationVInput = {
					32.975,
					232.031,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73550003
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
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-554.733,
					51.224,
					861.846
				},
				rotationVInput = {
					20.083,
					242.516,
					-0.003
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 73592163
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 186
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				blendExponentVInput = 0,
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-554.733,
					51.224,
					861.846
				},
				rotationVInput = {
					20.083,
					242.516,
					-0.003
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91434935
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
						nodeId = 188
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72772091,
				targetEulerAngleVInput = {
					0,
					136.227,
					0
				},
				targetPositionVInput = {
					-548.377,
					52.758,
					857.987
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 195
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 72772087,
				targetEulerAngleVInput = {
					0,
					130,
					0
				},
				targetPositionVInput = {
					-548.377,
					52.758,
					857.987
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 3,
				staticIdVInput = 72772087,
				playableStateVInput = "Emotion_Excited_Start"
			},
			fields = {
				templateId = 400152,
				processingTime = 1.017,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 500211,
				positionVInput = {
					-551.06,
					50.47,
					863.01
				},
				rotationVInput = {
					0,
					230.034,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -787538042
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3801106
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
		[194] = {
			kind = 9,
			inputs = {
				staticIdVInput = 72772087
			},
			fields = {
				entityType = 2
			}
		},
		[195] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
