-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90922136.lua

return {
	startNodeId = 1,
	dialogueId = 90922136,
	schema = "v4",
	nodes = {
		[0] = {
			kind = 6,
			flowIn = {
				End = true
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
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
			},
			flowIn = {
				In = true
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
			kind = 18,
			inputs = {
				startSkipVInput = true,
				showHUDVInput = true,
				pauseNearbyMonsterAIVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				applyStateConflictVInput = true
			},
			fields = {
				topLogoComs = {
					callFriends = true,
					alert = true,
					npc = true,
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true,
					multiPlayer = true,
					combat = true
				}
			},
			flowIn = {
				In = true
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
			kind = 22,
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 7
			},
			flowIn = {
				In = true
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
						nodeId = 54
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 6
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 8
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					54.122,
					0
				},
				targetPositionVInput = {
					34.31,
					100.394,
					872.312
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					100.946,
					0
				},
				targetPositionVInput = {
					37.22,
					100.406,
					875.41
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					272.713,
					0
				},
				targetPositionVInput = {
					40.95,
					100.304,
					875.27
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = true
			},
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			fields = {
				duration = 999,
				emojiName = "Furious"
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				playStartLoopEndVInput = true,
				loopDurationVInput = 999
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			fields = {
				templateId = 400800,
				processingTime = 2.5,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"IdleSpecial",
					"IdleSpecial",
					"IdleSpecial"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					35.798,
					101.589,
					874.036
				},
				rotationVInput = {
					12.198,
					63.805,
					359.304
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965758
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 13
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				blendTimeVInput = 2,
				fovVInput = 45,
				positionVInput = {
					35.415,
					101.482,
					873.875
				},
				rotationVInput = {
					11.812,
					63.906,
					359.346
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965759
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 14
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 15
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
						nodeId = 49
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 50
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 47
					}
				},
				["5"] = {
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
				dialogueIdVInput = 6709082
			},
			fields = {
				chatType = 3,
				duration = 3
			},
			flowIn = {
				In = true
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
				portCount = 6
			},
			flowIn = {
				In = true
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
						nodeId = 44
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 45
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 46
					}
				},
				["4"] = {
					{
						portId = "StopLip",
						nodeId = 47
					}
				},
				["5"] = {
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
				dialogueIdVInput = 6709083
			},
			fields = {
				chatType = 3,
				duration = 3
			},
			flowIn = {
				In = true
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
				portCount = 6
			},
			flowIn = {
				In = true
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
						nodeId = 41
					}
				},
				["2"] = {
					{
						portId = "StopLip",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709084
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 20
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 36
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 37
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
						nodeId = 39
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
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709085
			},
			fields = {
				chatType = 3,
				duration = 8
			},
			flowIn = {
				In = true
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
				portCount = 8
			},
			flowIn = {
				In = true
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
						nodeId = 32
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 30
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 31
					}
				},
				["6"] = {
					{
						portId = "StopLip",
						nodeId = 33
					}
				},
				["7"] = {
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
				dialogueIdVInput = 6709086
			},
			fields = {
				chatType = 3,
				duration = 6
			},
			flowIn = {
				In = true
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
			kind = 22,
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = true
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
						nodeId = 28
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
				In = true
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
		{
			kind = 21,
			flowIn = {
				In = true
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
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = true
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
			kind = 23,
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					35.479,
					101.017,
					874.717
				},
				rotationVInput = {
					353.388,
					82.212,
					359.763
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90966081
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Excited"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				StopLip = true,
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Akimbo01_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				templateId = 4,
				playAniType = 1,
				aniStateList = {
					"Story_Akimbo01_Start",
					"Story_Akimbo01_Loop",
					"Story_Akimbo01_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Akimbo01_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			fields = {
				templateId = 400077,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Story_Akimbo01_Start",
					"Story_Akimbo01_Loop",
					"Story_Akimbo01_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					39.074,
					101.114,
					875.109
				},
				rotationVInput = {
					353.766,
					262.039,
					358.993
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965742
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0,
					70,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0,
					75,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					39.958,
					100.834,
					875.146
				},
				rotationVInput = {
					14.649,
					83.868,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965490
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 45,
				positionVInput = {
					39.958,
					100.834,
					875.146
				},
				rotationVInput = {
					14.649,
					83.868,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965503
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				activePlayLip = true
			},
			flowIn = {
				StopLip = true,
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				targetEulerAngleVInput = {
					0,
					153,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Confused"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				StopLip = true,
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 30,
				positionVInput = {
					42.128,
					100.56,
					874.636
				},
				rotationVInput = {
					353.92,
					283.951,
					359.987
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965504
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				targetEulerAngleVInput = {
					0,
					60,
					0
				},
				targetPositionVInput = {
					37.436,
					100.448,
					874.375
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				}
			},
			fields = {
				finishToSteer = true,
				reset = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outTangent = 1,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 0,
							value = 0,
							inTangent = 0
						},
						{
							outTangent = 0,
							weightedMode = 0,
							outWeight = 0,
							inWeight = 0,
							time = 1,
							value = 1,
							inTangent = 1
						}
					}
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 61
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = true
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
		{
			kind = 23,
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Tease_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			fields = {
				templateId = 400077,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Story_Tease_Start",
					"Story_Tease_Loop",
					"Story_Tease_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				fovVInput = 45,
				positionVInput = {
					36.151,
					101.906,
					871.844
				},
				rotationVInput = {
					11.039,
					37.01,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90965744
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90948935
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90948943
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 57
				}
			},
			fields = {
				processingTime = 2.5,
				playAniType = 1,
				entityType = 2,
				templateId = 400800
			}
		},
		{
			kind = 41,
			fields = {
				portCount = 3
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 59
				}
			},
			fields = {
				resetOrientation = true,
				nodeMode = 1,
				enableGroupLookAt = true,
				enableDefaultLookAt = true
			}
		},
		{
			kind = 9
		}
	}
}
