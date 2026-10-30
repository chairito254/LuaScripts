-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91287123.lua

return {
	schema = 1,
	startNodeId = 3,
	dialogueId = 91287123,
	nodes = {
		[2] = {
			kind = 6,
			fields = {
				retFlag = 0
			},
			flowIn = {
				End = 0
			}
		},
		[3] = {
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
		[4] = {
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
						nodeId = 5
					}
				}
			}
		},
		[5] = {
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = true,
					showHud = true,
					toplogoComList = {
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
						alert = true,
						battleRoom = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = true
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
						nodeId = 63
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		[6] = {
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
						nodeId = 7
					}
				}
			}
		},
		[7] = {
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
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 10
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
						nodeId = 62
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		[8] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160004,
				positionVInput = {
					73.175,
					230.009,
					1044.184
				},
				rotationVInput = {
					0,
					114.011,
					0
				}
			},
			fields = {
				entityId = -1384858910,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		[9] = {
			kind = 5,
			inputs = {
				staticIdVInput = -1384858910,
				playableStateVInput = "Behav_Alert"
			},
			fields = {
				templateId = 5160004,
				processingTime = 7.017,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		[10] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0.665,
					208.431,
					0
				},
				targetPositionVInput = {
					73.981,
					229.862,
					1044.28
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
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
		[11] = {
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Story_LookAround02"
			},
			fields = {
				templateId = 301,
				processingTime = 9.633,
				playAniType = 1,
				isLooping = false,
				entityType = 0
			},
			flowIn = {
				Stop = 1,
				In = 0
			}
		},
		[12] = {
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
						nodeId = 13
					}
				}
			}
		},
		[13] = {
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
						nodeId = 14
					}
				}
			}
		},
		[14] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204630,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				ShowFinOut = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		[15] = {
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
						nodeId = 16
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
						portId = "Stop",
						nodeId = 9
					}
				},
				["3"] = {
					{
						portId = "Stop",
						nodeId = 11
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 58
					}
				}
			}
		},
		[16] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204631,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160004,
				matchAudioDuration = true,
				duration = 3.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				}
			}
		},
		[17] = {
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
						nodeId = 52
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 18
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		[18] = {
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		[19] = {
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
						nodeId = 20
					}
				}
			}
		},
		[20] = {
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				durationVInput = 1,
				targetEulerAngleVInput = {
					359.344,
					19.049,
					0.108
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
						nodeId = 21
					}
				}
			}
		},
		[21] = {
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
						nodeId = 22
					}
				}
			}
		},
		[22] = {
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
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		[23] = {
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160002,
				positionVInput = {
					57.191,
					230.169,
					1028.264
				},
				rotationVInput = {
					0,
					41.638,
					0
				}
			},
			fields = {
				entityId = -2018267313,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		[24] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204632,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
				}
			}
		},
		[25] = {
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
						nodeId = 26
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
						nodeId = 29
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		[26] = {
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
						nodeId = 27
					}
				}
			}
		},
		[27] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					76.463,
					231.534,
					1045.428
				},
				rotationVInput = {
					13.099,
					239.918,
					0
				}
			},
			fields = {
				cameraId = 91405867,
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
						nodeId = 28
					}
				}
			}
		},
		[28] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					76.788,
					231.621,
					1045.616
				},
				rotationVInput = {
					13.099,
					239.918,
					0
				}
			},
			fields = {
				cameraId = 91575005,
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
		[29] = {
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
						nodeId = 30
					}
				}
			}
		},
		[30] = {
			kind = 26,
			inputs = {
				staticIdVInput = 2,
				durationVInput = 0.8,
				targetEulerAngleVInput = {
					0,
					210.141,
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
		[31] = {
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
		[32] = {
			kind = 26,
			inputs = {
				staticIdVInput = -1384858910,
				durationVInput = 0.8,
				targetEulerAngleVInput = {
					0,
					227.55,
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
		[33] = {
			kind = 5,
			inputs = {
				staticIdVInput = -2018267313,
				playableStateVInput = "Daily_Yell_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				templateId = 5160002,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"Daily_Yell_Start",
					"Daily_Yell_Loop",
					"Daily_Yell_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		[34] = {
			kind = 1,
			inputs = {
				dialogueIdVInput = 6204633,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 5160002,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1
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
		[35] = {
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		[36] = {
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
						nodeId = 37
					}
				}
			}
		},
		[37] = {
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
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		[38] = {
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
						nodeId = 39
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 49
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
		[39] = {
			kind = 27,
			fields = {
				uid = 121,
				param = {
					6204063,
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
				closeUIFInput = 1,
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
		[40] = {
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
						nodeId = 41
					}
				}
			}
		},
		[41] = {
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
						nodeId = 42
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		[42] = {
			kind = 22,
			inputs = {
				blendVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		[43] = {
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
						nodeId = 44
					}
				}
			}
		},
		[44] = {
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
						portId = "End",
						nodeId = 2
					}
				}
			}
		},
		[45] = {
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
						portId = "closeUIFInput",
						nodeId = 39
					}
				}
			}
		},
		[46] = {
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
						nodeId = 47
					}
				}
			}
		},
		[47] = {
			kind = 3,
			inputs = {
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					76.685,
					231.358,
					1046.769
				},
				rotationVInput = {
					7.868,
					222.87,
					0
				}
			},
			fields = {
				cameraId = 91579090,
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
						nodeId = 48
					}
				}
			}
		},
		[48] = {
			kind = 21,
			inputs = {
				blendTimeVInput = 1.5
			},
			flowIn = {
				In = 0
			}
		},
		[49] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					113.783,
					232.087,
					1043.154
				},
				rotationVInput = {
					341.248,
					263.542,
					0
				}
			},
			fields = {
				cameraId = 91549645,
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
						nodeId = 50
					}
				}
			}
		},
		[50] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 8,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					113.974,
					233.102,
					1044.054
				},
				rotationVInput = {
					343.139,
					261.308,
					0
				}
			},
			fields = {
				cameraId = 91549648,
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
		[51] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					131.845,
					0
				},
				targetPositionVInput = {
					-199.924,
					127.7,
					867.319
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
		[52] = {
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
						nodeId = 53
					}
				}
			}
		},
		[53] = {
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					84.948,
					230.614,
					1019.191
				},
				rotationVInput = {
					348.983,
					331.954,
					0
				}
			},
			fields = {
				cameraId = 91574869,
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
						nodeId = 54
					}
				}
			}
		},
		[54] = {
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					90.963,
					229.501,
					1017.681
				},
				rotationVInput = {
					339.186,
					328.86,
					0
				}
			},
			fields = {
				cameraId = 91574884,
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
		[55] = {
			kind = 26,
			inputs = {
				staticIdVInput = -1384858910,
				durationVInput = 1.2,
				targetEulerAngleVInput = {
					0,
					13.528,
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
		[56] = {
			kind = 4,
			fields = {
				delayTime = 0.1
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
		[57] = {
			kind = 15,
			inputs = {
				staticIdVInput = -1384858910,
				lookAtEntityStaticIdVInput = 2,
				lookAtDurationVInput = 0.5
			},
			flowIn = {
				In = 0
			}
		},
		[58] = {
			kind = 4,
			fields = {
				delayTime = 0.1
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
		[59] = {
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1384858910,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
			}
		},
		[60] = {
			kind = 3,
			inputs = {
				fovVInput = 34,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					74.786,
					231.343,
					1040.144
				},
				rotationVInput = {
					9.782,
					346.048,
					0
				}
			},
			fields = {
				cameraId = 91405799,
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
						nodeId = 61
					}
				}
			}
		},
		[61] = {
			kind = 3,
			inputs = {
				fovVInput = 34,
				blendTimeVInput = 20,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					76.206,
					231.472,
					1038.5
				},
				rotationVInput = {
					8.063,
					335.563,
					0
				}
			},
			fields = {
				cameraId = 91574898,
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
		[62] = {
			kind = 64,
			fields = {
				timePeriod = 2,
				changeType = 1,
				weather = 0
			},
			flowIn = {
				In = 0
			}
		},
		[63] = {
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["1"] = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		}
	}
}
