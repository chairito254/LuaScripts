-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72035279.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 72035279,
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
			kind = 18,
			inputs = {
				startSkipVInput = true,
				exitCatchModeVInput = false
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 75
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				resetOrientation = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706260
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
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705170
			},
			fields = {
				chatType = 3,
				npcId = 0,
				duration = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 6
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
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				targetPositionVInput = {
					-96.882,
					71.396,
					422.362
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 75
				}
			},
			fields = {
				reset = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706263
			},
			fields = {
				chatType = 10,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706262
			},
			fields = {
				chatType = 6,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 11
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				exitCatchModeVInput = false
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706260
			},
			fields = {
				chatType = 6,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706263
			},
			fields = {
				chatType = 10,
				duration = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				targetPositionVInput = {
					-99.58,
					71.803,
					422.362
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 76
				}
			},
			fields = {
				reset = true,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							outWeight = 0,
							weightedMode = 0,
							value = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							outWeight = 0,
							weightedMode = 0,
							value = 1,
							inWeight = 0,
							outTangent = 0,
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
			kind = 18,
			inputs = {
				blockEventVInput = true,
				startSkipVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true
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
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityIDs",
					nodeId = 61
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				nodeMode = 1,
				resetOrientation = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706260
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706261
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
						nodeId = 21
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706262
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
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706263
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
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706264
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
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3706265
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 18,
			inputs = {
				blockEventVInput = true,
				startSkipVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 59
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				resetOrientation = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 4101364
			},
			fields = {
				chatType = 3,
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 4101365
			},
			fields = {
				chatType = 3,
				duration = 7
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 18,
			inputs = {
				blockEventVInput = true,
				startSkipVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true
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
			flowOut = {
				Out = {
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
				portCount = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 33
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
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					56.59,
					0.856,
					17.34
				},
				rotationVInput = {
					7.083,
					194.92,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 74886489
			},
			flowIn = {
				In = true
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
				entityType = 2,
				templateId = 500006,
				processingTime = 3.5,
				playAniType = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CONTROL_PET_STAGE",
					1,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				True = {
					{
						portId = "In",
						nodeId = 34
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CONTROL_PET_GROPU",
					nil,
					{
						[1] = 1013
					},
					">=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 36
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206101154
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CONTROL_PET_LABEL",
					1,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				False = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206101153
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206101151
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"CONTROL_PET_STAGE",
					2,
					nil,
					"=",
					1
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				True = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 206101152
			},
			fields = {
				chatType = 3,
				duration = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 18,
			inputs = {
				blockEventVInput = true,
				hideAllUIVInput = true,
				hideTopLogoVInput = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 56
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				resetOrientation = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				dialogueIdVInput = 3705241
			},
			fields = {
				chatType = 3,
				anim = "IdleSpecial",
				duration = 11
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705253
			},
			fields = {
				chatType = 3,
				portCount = 2,
				duration = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 55
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3705243
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
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
				dialogueIdVInput = 3705244
			},
			fields = {
				chatType = 3,
				duration = 5
			},
			flowIn = {
				In = true
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
			kind = 7,
			fields = {
				dialogueId = 3705254
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 3705245
			},
			fields = {
				chatType = 3,
				anim = "Taunt",
				portCount = 2,
				duration = 11
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3705247
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705249
			},
			fields = {
				chatType = 3,
				duration = 12
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3705250
			},
			fields = {
				chatType = 3,
				duration = 11
			},
			flowIn = {
				In = true
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
			kind = 12,
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
			kind = 10,
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3705248
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3705242
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 46
					}
				}
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 72035266
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 74886480
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 25
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 75290287
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 75290287
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 60
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 66
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 67
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 62
				},
				["5EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 63
				},
				["6EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 65
				},
				["7EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 64
				}
			},
			fields = {
				portCount = 7
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76106714
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 75334213
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 75290287
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76106768
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76106699
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76106695
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76109107
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 41,
			valueIn = {
				["1EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 68
				},
				["2EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 70
				},
				["3EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 72
				},
				["4EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 71
				},
				["5EntityIDVInput"] = {
					portId = "EntityID",
					nodeId = 73
				}
			},
			fields = {
				portCount = 5
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76109061
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 75290287
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76109059
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 76109057
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 18,
			inputs = {
				blockEventVInput = true,
				startSkipVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true
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
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 78242149
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					310.01,
					0
				},
				targetPositionVInput = {
					-1233.85,
					61.78,
					1665.46
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			}
		}
	}
}
