-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_77654500.lua

return {
	startNodeId = 1,
	dialogueId = 77654500,
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
			kind = 24,
			inputs = {
				switchToPetVInput = true
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					toplogoComList = {
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
						chat = true,
						callFriends = true
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
						nodeId = 4,
						portId = "In"
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
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 13
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
						nodeId = 84,
						portId = "In"
					}
				},
				["11"] = {
					{
						nodeId = 8,
						portId = "Play"
					}
				},
				["12"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 85,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 90,
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
					129.326,
					0
				},
				targetPositionVInput = {
					-118.049,
					106.526,
					692.928
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 91,
					portId = "EntityID"
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
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Idle",
				loopDurationVInput = 20
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 91,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400117,
				processingTime = 2.333
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "VOX_Emotion_Parmon_10211_Happy"
			},
			fields = {
				fadeOutTime = 0,
				fadeInTime = 0,
				enableFadeOut = false,
				enableFadeIn = false
			},
			flowIn = {
				Play = 0
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
						nodeId = 10,
						portId = "In"
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304279,
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
				duration = 4
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304280,
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
				duration = 2.88
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
						nodeId = 14,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 82,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304281,
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
				portCount = 3,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 5.5
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
				},
				["1"] = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304282
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304284,
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
						nodeId = 17,
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
						nodeId = 18,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 78,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304287,
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
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2
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
						nodeId = 77,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304288,
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
				duration = 6.38
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304289,
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
				duration = 3.88
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
						nodeId = 23,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 75,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304290,
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
				duration = 3.5
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
			kind = 12,
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
						nodeId = 26,
						portId = "In"
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
						nodeId = 39,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 27,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 28,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["5"] = {
					{
						nodeId = 32,
						portId = "In"
					}
				},
				["6"] = {
					{
						nodeId = 34,
						portId = "In"
					}
				},
				["7"] = {
					{
						nodeId = 36,
						portId = "In"
					}
				},
				["8"] = {
					{
						nodeId = 37,
						portId = "In"
					}
				},
				["9"] = {
					{
						nodeId = 38,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					356.795,
					75.427,
					0
				},
				targetPositionVInput = {
					-131.296,
					104.208,
					694.938
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 90,
					portId = "EntityID"
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
			kind = 16,
			inputs = {
				slotParamVInput = 400077,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-130.011,
					104.339,
					694.457
				},
				rotationVInput = {
					0,
					331.445,
					0
				}
			},
			fields = {
				entityId = -325414195,
				ignoreGravity = false
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
						nodeId = 30,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0,
					30,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 28,
					portId = "EntityID"
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
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 28,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
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
					-129.025,
					105.674,
					696.523
				},
				rotationVInput = {
					15.486,
					216.019,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91069910,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
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
			kind = 3,
			inputs = {
				fovVInput = 50,
				blendTimeVInput = 2,
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-129.44,
					105.463,
					695.81
				},
				rotationVInput = {
					14.97,
					215.675,
					0
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 79482210,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230
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
						nodeId = 35,
						portId = "In"
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
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 85,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 88,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
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
			kind = 16,
			inputs = {
				slotParamVInput = 400204,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-130.406,
					103.929,
					694.843
				},
				rotationVInput = {
					0,
					123.373,
					0
				}
			},
			fields = {
				entityId = -1827015201,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 71,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0,
					50,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
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
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				}
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304291,
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
				duration = 2.5
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
						nodeId = 47,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 46,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 45,
						portId = "In"
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
					-131.364,
					105.18,
					695.055
				},
				rotationVInput = {
					1.901,
					89.767,
					359.843
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91069936,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				processingTime = 3.017,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304292,
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
				duration = 2.12
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 48,
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
						nodeId = 50,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 49,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Righthand"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 4,
				processingTime = 2.5
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304293,
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
				duration = 6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 51,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304294,
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
				duration = 3.12
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
						nodeId = 53,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304295,
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
				duration = 9.62
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 54,
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
						nodeId = 55,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304296,
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
				npcId = 400066,
				matchAudioDuration = true,
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 56,
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
						nodeId = 57,
						portId = "In"
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
						nodeId = 58,
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
						nodeId = 59,
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
						nodeId = 60,
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
						nodeId = 61,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 0,
						portId = "End"
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
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Story_Circle"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 90,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400066,
				processingTime = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 50,
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-129.897,
					105.489,
					696.756
				},
				rotationVInput = {
					15.974,
					185.44,
					0.004
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 82213351,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Anger01_Start",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
				processingTime = 0,
				aniStateList = {
					"Emotion_Anger01_Start",
					"Emotion_Anger01_Loop",
					"Emotion_Anger01_End"
				}
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
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 90,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
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
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0,
					-20,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
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
			kind = 33,
			inputs = {
				facialEmotionVInput = "Serious"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				}
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
				playableStateVInput = "Talk_Lefthand"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
				processingTime = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkCasual",
				speedVInput = 3
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400204,
				processingTime = 3.833
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 40,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
				},
				lookAtEntityIdVInput = {
					nodeId = 39,
					portId = "EntityID"
				}
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
					248.73,
					0
				},
				targetPositionVInput = {
					-129.53,
					104.58,
					695.69
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 92,
					portId = "EntityID"
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
						nodeId = 74,
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
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-117.349,
					107.031,
					693.13
				},
				rotationVInput = {
					13.904,
					314.067,
					359.412
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 100,
				fStop = 11,
				cameraId = 91054306,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230
			},
			flowIn = {
				In = 0
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
			kind = 3,
			inputs = {
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-118.253,
					107.404,
					695.917
				},
				rotationVInput = {
					4.453,
					155.196,
					0.176
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 91054241,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseIn",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-117.101,
					107.289,
					692.443
				},
				rotationVInput = {
					19.32,
					310.722,
					3.264
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 79480968,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3304283
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304285,
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
				duration = 5.25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304286,
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
				duration = 3.5
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
			kind = 3,
			inputs = {
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-117.038,
					107.378,
					693.908
				},
				rotationVInput = {
					358.441,
					138.342,
					0.002
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91055428,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 85,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400117,
				processingTime = 0,
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
				blendFuncVInput = "Linear",
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-117.912,
					107.191,
					695.39
				},
				rotationVInput = {
					0.023,
					160.193,
					359.673
				}
			},
			fields = {
				recombineQuality = 0,
				openDof = true,
				focalDistance = 200,
				fStop = 16,
				cameraId = 82138204,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 230
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400121,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-115.948,
					107.203,
					692.597
				},
				rotationVInput = {
					0,
					293.265,
					0
				}
			},
			fields = {
				entityId = -2143030079,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				playableStateVInput = "Story_Circle",
				loopDurationVInput = 10
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 85,
					portId = "EntityID"
				}
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 400117,
				processingTime = 2
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
						nodeId = 86,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400122,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-116.368,
					107.233,
					691.925
				},
				rotationVInput = {
					0,
					311.001,
					0
				}
			},
			fields = {
				entityId = -1698206808,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400119,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-115.55,
					107.18,
					693.196
				},
				rotationVInput = {
					0,
					271.913,
					0
				}
			},
			fields = {
				entityId = -182463001,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400066,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-117.913,
					106.387,
					693.709
				},
				rotationVInput = {
					0,
					143.724,
					0
				}
			},
			fields = {
				entityId = -177251887,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
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
		}
	}
}
