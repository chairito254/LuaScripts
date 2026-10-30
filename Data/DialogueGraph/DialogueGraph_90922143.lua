-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90922143.lua

return {
	dialogueId = 90922143,
	schema = "v4",
	startNodeId = 2,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 1
			},
			flowIn = {
				End = true
			}
		},
		{
			kind = 6,
			fields = {
				retFlag = 2
			},
			flowIn = {
				End = true
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
				In = true
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
			kind = 18,
			inputs = {
				showHUDVInput = true,
				pauseNearbyMonsterAIVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				applyStateConflictVInput = true,
				startSkipVInput = true
			},
			fields = {
				topLogoComs = {
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
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true
				}
			},
			flowIn = {
				In = true
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
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 6,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 96,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 95,
						portId = "In"
					}
				},
				["4"] = {
					{
						nodeId = 97,
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
				In = true
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 91,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 93,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 94,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709128
			},
			fields = {
				duration = 7,
				chatType = 3,
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 54,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6709129
			},
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = true
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
						nodeId = 14,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 12,
						portId = "In"
					}
				},
				["3"] = {
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
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-67.164,
					101.181,
					826.811
				},
				rotationVInput = {
					4.491,
					252.704,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90963188,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-67.164,
					101.181,
					826.811
				},
				rotationVInput = {
					4.148,
					250.297,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90963190,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 90948982
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 90964379,
				facialEmotionVInput = "Angry"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 90964379,
				targetEulerAngleVInput = {
					0,
					67.96,
					0
				}
			},
			fields = {
				reset = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FinishOut = {
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
				In = true
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
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709131
			},
			fields = {
				duration = 4,
				chatType = 3,
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 49,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 50,
						portId = "In"
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6709132
			},
			fields = {
				duration = 9,
				chatType = 3,
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 20,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["3"] = {
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
				blendExponentVInput = 2,
				fovVInput = 40,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-70.095,
					101.057,
					823.855
				},
				rotationVInput = {
					1.226,
					20.76,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 8.09,
				cameraId = 90963269,
				focalDistance = 172,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 38,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-70.095,
					101.057,
					823.855
				},
				rotationVInput = {
					1.226,
					22.307,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 5.93,
				cameraId = 90963396,
				focalDistance = 338,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-69.041,
					101.24,
					825.55
				},
				rotationVInput = {
					2.601,
					26.088,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 18.37,
				cameraId = 90963280,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90964379,
				playableStateVInput = "PointTo_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 2,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = true
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
				portCount = 2
			},
			flowIn = {
				In = true
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
				}
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 2,
				facialEmotionVInput = "Shy"
			},
			fields = {
				noBlink = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true,
				StopEmotion = true
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
						nodeId = 28,
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
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "StopEmotion"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				templateId = 4,
				processingTime = 1.733,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709133
			},
			fields = {
				duration = 8,
				chatType = 3,
				portCount = 3
			},
			flowIn = {
				In = true
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
						nodeId = 48,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709134
			},
			fields = {
				duration = 7,
				chatType = 3,
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 42,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 43,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 47,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709135
			},
			fields = {
				duration = 10,
				chatType = 3,
				portCount = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 33,
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
				},
				["3"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709136
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
						nodeId = 34,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = true
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
			kind = 10,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 36,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
				["1"] = {
					{
						nodeId = 37,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 22,
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90964379,
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 400803,
				playAniType = 1,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					242.906,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 16.2,
				cameraId = 90963380,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					241.531,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 12.44,
				cameraId = 90963381,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 2,
				facialEmotionVInput = "Excited"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90964379,
				playableStateVInput = "Emotion_Think_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 2.367,
				aniStateList = {
					"Emotion_Think_Start",
					"Emotion_Think_Loop",
					"Emotion_Think_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-66.559,
					101.182,
					826.989
				},
				rotationVInput = {
					2.773,
					251.501,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 13.87,
				cameraId = 90963361,
				focalDistance = 338,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 44,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 2.5,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-66.559,
					101.182,
					826.989
				},
				rotationVInput = {
					2.773,
					250.469,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 13.87,
				cameraId = 90963374,
				focalDistance = 338,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-60.012,
					104.14,
					825.589
				},
				rotationVInput = {
					14.805,
					280.721,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 4,
				cameraId = 90963357,
				focalDistance = 531,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-60.012,
					104.14,
					825.589
				},
				rotationVInput = {
					10.679,
					280.549,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 4,
				cameraId = 90963362,
				focalDistance = 1274,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 2,
				facialEmotionVInput = "Think"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 2,
				facialEmotionVInput = "Smile"
			},
			fields = {
				activePlayEmotion = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90964379,
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 0.833,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					242.906,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 18.62,
				cameraId = 90963247,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					241.531,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 15.53,
				cameraId = 90963249,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 90964379,
				facialEmotionVInput = "Angry"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Crossingarms",
				staticIdVInput = 90964379
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 6.333
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6709130
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 55,
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
				In = true
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
						nodeId = 58,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-67.164,
					101.181,
					826.811
				},
				rotationVInput = {
					4.491,
					252.704,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90964516,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-67.164,
					101.181,
					826.811
				},
				rotationVInput = {
					4.148,
					250.297,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90964517,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 2,
				staticIdVInput = 90964379
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 90964379,
				targetEulerAngleVInput = {
					0,
					67.96,
					0
				}
			},
			fields = {
				reset = true
			},
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = true
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
						nodeId = 62,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 88,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 89,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Daily_Thanks",
				staticIdVInput = 90964379
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 3.167
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709137
			},
			fields = {
				duration = 5,
				chatType = 3,
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 78,
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709138
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
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709139
			},
			fields = {
				duration = 2,
				chatType = 3,
				portCount = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 65,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 73,
						portId = "In"
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6709140
			},
			fields = {
				duration = 12,
				chatType = 3,
				portCount = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 66,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 69,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 70,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 72,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6709141
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
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 12,
			flowIn = {
				In = true
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
			kind = 10,
			flowIn = {
				In = true
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
				staticIdVInput = 90964379,
				playableStateVInput = "Emotion_Firm_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 400803,
				playAniType = 1,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					242.906,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 16.2,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					241.531,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 12.44,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 90964379,
				facialEmotionVInput = "Happy"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-66.559,
					101.182,
					826.989
				},
				rotationVInput = {
					2.773,
					251.501,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 13.87,
				focalDistance = 338,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 74,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 2.5,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-66.559,
					101.182,
					826.989
				},
				rotationVInput = {
					2.773,
					250.469,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 13.87,
				focalDistance = 338,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-60.012,
					104.14,
					825.589
				},
				rotationVInput = {
					14.805,
					280.721,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 4,
				focalDistance = 531,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-60.012,
					104.14,
					825.589
				},
				rotationVInput = {
					10.679,
					280.549,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 4,
				focalDistance = 1274,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 90964379,
				facialEmotionVInput = "Happy"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true,
				noBlink = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 40,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-70.095,
					101.057,
					823.855
				},
				rotationVInput = {
					1.226,
					20.76,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 8.09,
				cameraId = 90964514,
				focalDistance = 172,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 38,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-70.095,
					101.057,
					823.855
				},
				rotationVInput = {
					1.226,
					22.307,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 5.93,
				cameraId = 90963423,
				focalDistance = 338,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 80,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-69.041,
					101.24,
					825.55
				},
				rotationVInput = {
					2.601,
					26.088,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 18.37,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90964379,
				playableStateVInput = "PointTo_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 2,
				aniStateList = {
					"PointTo_Start",
					"PointTo_Loop",
					"PointTo_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 83,
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 87,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 2,
				facialEmotionVInput = "Shy"
			},
			fields = {
				noBlink = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true,
				StopEmotion = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 85,
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
				In = true
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
			kind = 4,
			fields = {
				delayTime = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 84,
						portId = "StopEmotion"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Emotion_Confused_Start",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				templateId = 4,
				processingTime = 1.733,
				aniStateList = {
					"Emotion_Confused_Start",
					"Emotion_Confused_Loop",
					"Emotion_Confused_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				entityIdVInput = 90964379,
				facialEmotionVInput = "Excited"
			},
			fields = {
				activePlayLip = true,
				activePlayEmotion = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					242.906,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 18.62,
				cameraId = 90963419,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 90,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 3,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-68.7,
					101.141,
					826.14
				},
				rotationVInput = {
					1.913,
					241.531,
					0
				}
			},
			fields = {
				openDof = true,
				fStop = 21.88,
				cameraId = 90963420,
				focalDistance = 117,
				squeezeFactor = 1,
				sensorWidth = 212
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-66.026,
					101.18,
					823.88
				},
				rotationVInput = {
					7.949,
					304.815,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90963131,
				squeezeFactor = 1,
				sensorWidth = 360
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 92,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 4,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-66.266,
					101.139,
					824.044
				},
				rotationVInput = {
					8.98,
					298.455,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 90963135,
				squeezeFactor = 1,
				sensorWidth = 360
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
					236.717,
					0
				},
				targetPositionVInput = {
					-68.475,
					99.88,
					826.648
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 100,
					portId = "EntityID"
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
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 90964379,
				staticIdVInput = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 90948982,
				targetEulerAngleVInput = {
					0,
					314.055,
					0
				},
				targetPositionVInput = {
					-17.84,
					103.648,
					789.37
				}
			},
			fields = {
				reset = true,
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 90964379,
				targetPositionVInput = {
					-69.79,
					99.853,
					825.6
				}
			},
			fields = {
				reset = true,
				setPosition = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90964379,
				loopDurationVInput = 99999,
				playableStateVInput = "Squat_Idle",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400807,
				processingTime = 4.733,
				aniStateList = {
					"Squat_Idle",
					"Squat_Idle",
					"Squat_Idle"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90948982,
				loopDurationVInput = 9999,
				playableStateVInput = "SquatObserve",
				playStartLoopEndVInput = true
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400803,
				processingTime = 6,
				aniStateList = {
					"SquatObserve",
					"SquatObserve",
					"SquatObserve"
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = 90948982,
				loopDurationVInput = 99999,
				playableStateVInput = "Idle",
				playStartLoopEndVInput = true
			},
			fields = {
				entityType = 2,
				templateId = 400803,
				playAniType = 1,
				aniStateList = {
					"Idle",
					"Idle",
					"Idle"
				}
			}
		},
		{
			kind = 9
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 90948982
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					nodeId = 101,
					portId = "EntityID"
				}
			},
			fields = {
				enableDefaultLookAt = true,
				resetOrientation = true,
				reactPreset = 3,
				enableGroupLookAt = true
			}
		}
	}
}
