-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91194028.lua

return {
	startNodeId = 1,
	dialogueId = 91194028,
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
					blockCameraZoom = true,
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
						nodeId = 24,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 3,
						portId = "In"
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
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 74,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 0.3
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
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.3
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
				portCount = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 61,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 68,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 73,
						portId = "Play"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304644,
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
				npcId = -1,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 11,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 61,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 63,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 62,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304645,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 12,
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
						nodeId = 13,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 59,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 60,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304646,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 2,
				skipTime = 3,
				npcStaticId = -1,
				npcId = 5150019,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 55,
						portId = "In"
					}
				},
				ShowFinOut = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304647
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 15,
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
						nodeId = 16,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 52,
						portId = "Stop"
					}
				},
				["2"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304649,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 20,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 42,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-916.084,
					379.71,
					-329.675
				},
				rotationVInput = {
					6.9,
					125.348,
					359.989
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 415,
				fStop = 11.95,
				cameraId = 91218321,
				visualizeDOF = false
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
			kind = 3,
			inputs = {
				fovVInput = 42,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-915.467,
					379.486,
					-330.113
				},
				rotationVInput = {
					6.9,
					125.348,
					359.989
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 415,
				fStop = 11.95,
				cameraId = 91459421,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304651,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 0,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
			kind = 25,
			fields = {
				condition = {
					"QUEST_STATE",
					5702130,
					nil,
					">=",
					4
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 22,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 44,
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
						nodeId = 23,
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
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304652,
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
				duration = 2.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 25,
						portId = "In"
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
						nodeId = 26,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 29,
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
			kind = 22,
			inputs = {
				blendVInput = 0.3
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.3
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
						nodeId = 30,
						portId = "In"
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
						nodeId = 31,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 33,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 35,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -1764054417
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -1874039975
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -1890330020
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = -714101552
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0,
				staticIdVInput = 91459324
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
			kind = 12,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -1890330020,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"PLAYER_BODY_TYPE",
					1,
					1,
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
						nodeId = 40,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 42,
						portId = "In"
					}
				}
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
					-918.822,
					379.618,
					-324.451
				},
				rotationVInput = {
					5.685,
					223.67,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 247,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 22.14,
				cameraId = 91548002,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-919.034,
					379.587,
					-324.672
				},
				rotationVInput = {
					5.685,
					223.67,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 247,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 22.14,
				cameraId = 91548003,
				visualizeDOF = false
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
					-918.916,
					379.628,
					-324.553
				},
				rotationVInput = {
					10.154,
					224.013,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 247,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 22.14,
				cameraId = 91571986,
				visualizeDOF = false
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
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-919.018,
					379.608,
					-324.692
				},
				rotationVInput = {
					9.81,
					225.044,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 247,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 22.14,
				cameraId = 91571987,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
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
						nodeId = 45,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 38,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 33046521,
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
				duration = 5.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 47,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 48,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 33046522,
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
				duration = 6.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 41,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-922.109,
					379.539,
					-322.21
				},
				rotationVInput = {
					0.7,
					143.915,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 247,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 22.14,
				cameraId = 91572011,
				visualizeDOF = false
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
			kind = 3,
			inputs = {
				fovVInput = 41,
				blendTimeVInput = 12,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-921.85,
					379.535,
					-322.565
				},
				rotationVInput = {
					0.528,
					143.915,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 247,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 166,
				fStop = 22.14,
				cameraId = 91572012,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -714101552,
				targetEulerAngleVInput = {
					0,
					146.3,
					0
				},
				targetPositionVInput = {
					-919.487,
					378.262,
					-325.512
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
							time = 0,
							outTangent = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							time = 1,
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -714101552,
				playableStateVInput = "PointTo_Start"
			},
			fields = {
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
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
				staticIdVInput = -1890330020,
				playableStateVInput = "Emotion_Think_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
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
				fovVInput = 46,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-958.632,
					409.6,
					-300.322
				},
				rotationVInput = {
					354.684,
					141.338,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 723,
				fStop = 16.87,
				cameraId = 91547978,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-958.632,
					426.132,
					-300.322
				},
				rotationVInput = {
					354.684,
					141.338,
					359.991
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 723,
				fStop = 16.87,
				cameraId = 91547990,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304648
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 56,
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
						nodeId = 57,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 52,
						portId = "Stop"
					}
				},
				["3"] = {
					{
						nodeId = 53,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304650,
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
				npcId = 5150018,
				matchAudioDuration = true,
				duration = 7.25,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 52,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 59,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -651975490,
				playableStateVInput = "Behav_DoubtStart"
			},
			fields = {
				templateId = 5150019,
				processingTime = 2.35,
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
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -714101552,
				playableStateVInput = "Talk_Lefthand"
			},
			fields = {
				templateId = 5150018,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 2
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				speedVInput = 1.5,
				staticIdVInput = -1890330020,
				playableStateVInput = "Story_TouchMiddle_Start"
			},
			fields = {
				templateId = 403,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Story_TouchMiddle_Start",
					"Story_TouchMiddle_Loop",
					"Story_TouchMiddle_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = -1890330020,
				staticIdVInput = -714101552
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -714101552,
				targetEulerAngleVInput = {
					0,
					255.769,
					0
				},
				targetPositionVInput = {
					-919.487,
					378.262,
					-325.512
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
							time = 0,
							outTangent = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							time = 1,
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1890330020,
				targetEulerAngleVInput = {
					0,
					74.687,
					0
				},
				targetPositionVInput = {
					-920.587,
					378.174,
					-325.825
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
							time = 0,
							outTangent = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							time = 1,
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
			kind = 19,
			inputs = {
				staticIdVInput = -651975490,
				targetEulerAngleVInput = {
					0,
					98.946,
					0
				},
				targetPositionVInput = {
					-920.654,
					378.203,
					-324.844
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
							time = 0,
							outTangent = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 0,
							inTangent = 0
						},
						{
							time = 1,
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							value = 1,
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
			kind = 3,
			inputs = {
				fovVInput = 31,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-923.694,
					379.415,
					-324.265
				},
				rotationVInput = {
					5.685,
					107.817,
					359.988
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 476,
				fStop = 15.37,
				cameraId = 91547871,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 31,
				blendTimeVInput = 15,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-922.827,
					379.373,
					-324.543
				},
				rotationVInput = {
					5.341,
					109.536,
					359.988
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 476,
				fStop = 15.37,
				cameraId = 91547877,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 39,
				blendTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-925.227,
					380.389,
					-322.176
				},
				rotationVInput = {
					8.422,
					129.987,
					359.987
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 524,
				fStop = 8.19,
				cameraId = 91459402,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 79,
					portId = "EntityIDs"
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 1
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
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 39,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-931.133,
					381.577,
					-321.242
				},
				rotationVInput = {
					0.7,
					123.46,
					359.988
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 524,
				fStop = 8.19,
				cameraId = 91545724,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 39,
				blendTimeVInput = 5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-931.133,
					381.577,
					-321.242
				},
				rotationVInput = {
					358.7,
					127.94,
					359.988
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 524,
				fStop = 8.19,
				cameraId = 91545730,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "BGM_Scene_PowerfulLand_ConchSong_Fountain",
				isBGMVInput = true
			},
			fields = {
				enableFadeOut = true,
				enableFadeIn = false,
				fadeOutTime = 1,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
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
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 39,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-923.31,
					379.469,
					-323.751
				},
				rotationVInput = {
					5.843,
					129.3,
					359.987
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 524,
				fStop = 8.19,
				cameraId = 91459382,
				visualizeDOF = false
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
						nodeId = 77,
						portId = "In"
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
						nodeId = 78,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 80,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 1,
				positionVInput = {
					-920.601,
					378.174,
					-325.819
				},
				rotationVInput = {
					0,
					175.402,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1890330020
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					nodeId = 78,
					portId = "EntityID"
				},
				["2EntityIDVInput"] = {
					nodeId = 80,
					portId = "EntityID"
				},
				["3EntityIDVInput"] = {
					nodeId = 81,
					portId = "EntityID"
				},
				["4EntityIDVInput"] = {
					nodeId = 82,
					portId = "EntityID"
				},
				["5EntityIDVInput"] = {
					nodeId = 84,
					portId = "EntityID"
				}
			},
			fields = {
				portCount = 5
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150018,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-919.495,
					378.262,
					-325.502
				},
				rotationVInput = {
					0,
					211.358,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -714101552
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150020,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-918.84,
					378.227,
					-325.101
				},
				rotationVInput = {
					0,
					217.231,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1764054417
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150021,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-919.618,
					378.278,
					-324.557
				},
				rotationVInput = {
					0,
					201.944,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -1874039975
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 91459324,
				durationVInput = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 5150019,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-920.813,
					378.203,
					-325.024
				},
				rotationVInput = {
					0,
					163.902,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -651975490
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
						nodeId = 86,
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
					180.407,
					0
				},
				targetPositionVInput = {
					-920.602,
					378.174,
					-325.819
				}
			},
			fields = {
				reset = false,
				setRotation = true,
				setPosition = true
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
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 50,
			inputs = {
				fillLightIntensityVInput = 8410,
				enableFillLightVInput = true
			},
			flowIn = {
				In = 0
			}
		}
	}
}
