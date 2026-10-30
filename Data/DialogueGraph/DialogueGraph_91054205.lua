-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91054205.lua

return {
	startNodeId = 1,
	dialogueId = 91054205,
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
			kind = 81,
			inputs = {
				uidVInput = 421,
				waitDestroyVInput = true
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 3,
						portId = "In"
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
						nodeId = 30,
						portId = "In"
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
			kind = 16,
			inputs = {
				slotParamVInput = 880933,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-70.084,
					39.8,
					433.023
				},
				rotationVInput = {
					0,
					43.653,
					0
				}
			},
			fields = {
				entityId = -1550558671,
				ignoreGravity = false
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101005,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 6.12,
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
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = -1550558671
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101006,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.62,
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
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101007,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5,
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
				portCount = 5
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
						nodeId = 46,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
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
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 13,
						portId = "4"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 5
			},
			flowIn = {
				["0"] = 0,
				["4"] = 0,
				["3"] = 0,
				["2"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 14,
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
						nodeId = 15,
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
						nodeId = 42,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 16,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 38,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 40,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 41,
						portId = "In"
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
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 7,
				param = {
					snapshot = false,
					photoMode = "dialogue"
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 18,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 37,
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
						nodeId = 19,
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
						nodeId = 33,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101009,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.5,
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
						nodeId = 22,
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
						nodeId = 32,
						portId = "StopDof"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101010,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 3.62,
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
						nodeId = 23,
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
						nodeId = 24,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 31,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101011,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2.75,
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
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101012,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 5.5,
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
						nodeId = 26,
						portId = "In"
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
				Out = {
					{
						nodeId = 27,
						portId = "In"
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
						nodeId = 28,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = -1550558671
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendFuncVInput = "Linear",
				blendExponentVInput = 1,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					81.115,
					42.72,
					465.656
				},
				rotationVInput = {
					1.375,
					103.82,
					0
				}
			},
			fields = {
				cameraId = 91082090,
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
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendExponentVInput = 1,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-74.895,
					41.108,
					429.836
				},
				rotationVInput = {
					0.834,
					330.269,
					-0.003
				}
			},
			fields = {
				cameraId = 91083295,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = 0,
				StopDof = 1
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
						nodeId = 35,
						portId = "Stop"
					}
				},
				["1"] = {
					{
						nodeId = 36,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Social_HoldFaceLeft_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 60,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 0,
				templateId = 3,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Social_HoldFaceLeft_Start",
					"Social_HoldFaceLeft_Loop",
					"Social_HoldFaceLeft_End"
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
				staticIdVInput = 2,
				playableStateVInput = "Social_HoldFaceLeft_Start",
				playStartLoopEndVInput = true,
				loopDurationVInput = 99
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 60,
					portId = "EntityID"
				}
			},
			fields = {
				entityType = 0,
				templateId = 3,
				processingTime = 1,
				playAniType = 1,
				isLooping = false,
				aniStateList = {
					"Social_HoldFaceLeft_Start",
					"Social_HoldFaceLeft_Loop",
					"Social_HoldFaceLeft_End"
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 25
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 17,
						portId = "closeUIFInput"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91052590,
				staticIdVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 91052590,
				staticIdVInput = 1
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 5,
					portId = "EntityID"
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
						nodeId = 36,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 9101008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 1,
				npcStaticId = 0,
				npcId = 0,
				matchAudioDuration = true,
				duration = 4.12,
				disableCamera = false,
				chatType = 2,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-75.362,
					40.08,
					430.07
				},
				rotationVInput = {
					347.77,
					162.268,
					-0.003
				}
			},
			fields = {
				cameraId = 91077300,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 410,
				fStop = 18.17
			},
			flowIn = {
				In = 0
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
					-73.834,
					41.158,
					436.267
				},
				rotationVInput = {
					359.803,
					167.768,
					-0.003
				}
			},
			fields = {
				cameraId = 91085188,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 410,
				fStop = 18.17
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 13,
						portId = "3"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -1550558671
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 45,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				staticIdVInput = -1550558671,
				maxLimitTimeVInput = 20
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 63,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 63,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							time = 1,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0
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
						nodeId = 13,
						portId = "2"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				maxLimitTimeVInput = 20,
				staticIdVInput = 2,
				speedVInput = 1.25
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 62,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 62,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							time = 1,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0
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
						nodeId = 13,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				autoPathfindingVInput = true,
				maxLimitTimeVInput = 20,
				staticIdVInput = 1,
				speedVInput = 1.25
			},
			valueIn = {
				targetEulerAngleVInput = {
					nodeId = 64,
					portId = "OutEulerAngle"
				},
				targetPositionVInput = {
					nodeId = 64,
					portId = "OutPosition"
				}
			},
			fields = {
				finishToSteer = true,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0
						},
						{
							time = 1,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0
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
						nodeId = 13,
						portId = "1"
					}
				}
			}
		},
		[51] = {
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
						nodeId = 52,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 55,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 57,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		[52] = {
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					185.46,
					0
				},
				targetPositionVInput = {
					-69.781,
					39.805,
					434.354
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
						nodeId = 53,
						portId = "0"
					}
				}
			}
		},
		[53] = {
			kind = 35,
			fields = {
				maxAwaitTime = -1,
				portCount = 6
			},
			flowIn = {
				["0"] = 0,
				["4"] = 0,
				["3"] = 0,
				["2"] = 0,
				["1"] = 0
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
		[54] = {
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		[55] = {
			kind = 14,
			inputs = {
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					240.44,
					0
				},
				targetPositionVInput = {
					-68.556,
					39.805,
					433.606
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
						nodeId = 53,
						portId = "1"
					}
				}
			}
		},
		[56] = {
			kind = 20,
			inputs = {
				isResetValueInput = true,
				staticIdVInput = 91052590
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 53,
						portId = "2"
					}
				}
			}
		},
		[57] = {
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 1,
				staticIdVInput = -1550558671
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 53,
						portId = "3"
					}
				}
			}
		},
		[58] = {
			kind = 3,
			inputs = {
				fovVInput = 40,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-67.2,
					41.586,
					435.277
				},
				rotationVInput = {
					13.21,
					233.256,
					-0.003
				}
			},
			fields = {
				cameraId = 91428009,
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
						nodeId = 53,
						portId = "4"
					}
				}
			}
		},
		[60] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[62] = {
			kind = 43,
			inputs = {
				slotIDVInput = 91082558,
				sceneIDVinput = 501,
				dialogsetIDVInput = 91082556
			}
		},
		[63] = {
			kind = 43,
			inputs = {
				slotIDVInput = 91082559,
				sceneIDVinput = 501,
				dialogsetIDVInput = 91082556
			}
		},
		[64] = {
			kind = 43,
			inputs = {
				slotIDVInput = 91084039,
				sceneIDVinput = 501,
				dialogsetIDVInput = 91082556
			}
		}
	}
}
