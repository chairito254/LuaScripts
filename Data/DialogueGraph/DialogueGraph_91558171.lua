-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91558171.lua

return {
	startNodeId = 11,
	dialogueId = 91558171,
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
						nodeId = 12,
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
						nodeId = 13,
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
						nodeId = 14,
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
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000100
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 16,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 315,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000101
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 17,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 249,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000102
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 18,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 183,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3000103
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 19,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 117,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 25,
			fields = {
				condition = {
					"SCENE_ID",
					nil,
					nil,
					"=",
					3003104
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				False = {
					{
						nodeId = 86,
						portId = "In"
					}
				},
				True = {
					{
						nodeId = 20,
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
						nodeId = 27,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 21,
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
					266,
					0
				},
				targetPositionVInput = {
					-1063.027,
					102.115,
					558.184
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
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					330,
					0
				},
				targetPositionVInput = {
					-1060.37,
					102.115,
					553.35
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
						nodeId = 23,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					-1063.62,
					102.22,
					558.76
				},
				rotationVInput = {
					0,
					233.13,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					-1063.69,
					102.22,
					559.36
				},
				rotationVInput = {
					0,
					218.689,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					-1063.43,
					102.22,
					557.6
				},
				rotationVInput = {
					0,
					305.335,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					-1063.13,
					102.22,
					556.62
				},
				rotationVInput = {
					0,
					321.311,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
						nodeId = 28,
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
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 9,
						portId = "End"
					}
				},
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
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
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
				portCount = 4
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
						nodeId = 82,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 84,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 32,
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
						nodeId = 33,
						portId = "In"
					}
				},
				["1"] = {
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
				dialogueIdVInput = 6527061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
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
						nodeId = 35,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 77,
						portId = "In"
					}
				},
				["2"] = {
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
				dialogueIdVInput = 6527062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
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
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 37,
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
						nodeId = 75,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527063,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 38,
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
						nodeId = 39,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 68,
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
				dialogueIdVInput = 6527064,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 40,
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
						nodeId = 41,
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
						nodeId = 63,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527065,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 43,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 60,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
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
						nodeId = 59,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527067
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
						nodeId = 46,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 58,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527069,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
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
						nodeId = 48,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 57,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Cheeksupport_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End",
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
						nodeId = 49,
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
						nodeId = 56,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
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
						nodeId = 51,
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
						nodeId = 52,
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
						nodeId = 53,
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
						nodeId = 54,
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
						nodeId = 55,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 8,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 7,
			fields = {
				dialogueId = 6527068
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 62,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 72,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 64,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -669799096
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 72,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 65,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -989505828
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 72,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 66,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -415407774
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 72,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 67,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -24899292
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 72,
					portId = "BoneTrans"
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 69,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					75.157,
					121.822,
					682.234
				},
				rotationVInput = {
					13.219,
					322.448,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
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
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				blendTimeVInput = 30,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					73.555,
					123.037,
					681.126
				},
				rotationVInput = {
					24.392,
					341.7,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					-1059.833,
					101.744,
					558.064
				},
				rotationVInput = {
					0,
					266.154,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 73,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_CatchBall_BigWhiteBall_ParmonAppear.prefab",
				postionVInput = {
					69.31,
					120,
					688.11
				},
				rotationVInput = {
					0,
					300.031,
					0
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.3,
					120.963,
					685.059
				},
				rotationVInput = {
					3.288,
					7.71,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 76,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.887,
					120.921,
					685.759
				},
				rotationVInput = {
					1.397,
					225.56,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 79,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -989505828,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 81,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.887,
					120.88,
					686.859
				},
				rotationVInput = {
					1.741,
					120.193,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 256,
				fStop = 14.08,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 83,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.809,
					120.935,
					686.715
				},
				rotationVInput = {
					1.913,
					116.927,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
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
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
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
						nodeId = 87,
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
						nodeId = 88,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 11,
			fields = {
				modeInfo = {
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
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 89,
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
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 90,
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
						nodeId = 91,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 92,
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
						nodeId = 93,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 94,
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
						nodeId = 95,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 96,
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
						nodeId = 97,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527063,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 98,
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
						nodeId = 99,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527064,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 100,
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
						nodeId = 101,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527065,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 102,
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
						nodeId = 103,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 104,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 116,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527067
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 105,
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
						nodeId = 106,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527069,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 107,
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
						nodeId = 108,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Cheeksupport_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End",
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
						nodeId = 109,
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
						nodeId = 110,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
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
						nodeId = 111,
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
						nodeId = 112,
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
						nodeId = 113,
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
						nodeId = 114,
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
						nodeId = 115,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 10,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527068
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 105,
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
						nodeId = 124,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 118,
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 119,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
						nodeId = 120,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 121,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 122,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 123,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
						nodeId = 125,
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
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 7,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 126,
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
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 127,
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
						nodeId = 128,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 179,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 181,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 129,
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
						nodeId = 130,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 177,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 131,
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
						nodeId = 132,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 174,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 175,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 133,
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
						nodeId = 134,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 171,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 172,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527063,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 135,
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
						nodeId = 136,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 165,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 167,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 169,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527064,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 137,
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
						nodeId = 138,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 158,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 160,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527065,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 139,
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
						nodeId = 140,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 157,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 141,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 156,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527067
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 142,
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
						nodeId = 143,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 155,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527069,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 144,
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
						nodeId = 145,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 154,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Cheeksupport_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End",
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
						nodeId = 146,
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
						nodeId = 147,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 153,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
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
						nodeId = 148,
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
						nodeId = 149,
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
						nodeId = 150,
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
						nodeId = 151,
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
						nodeId = 152,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 6,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 7,
			fields = {
				dialogueId = 6527068
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 142,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 159,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 169,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 161,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -669799096
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 169,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 162,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -989505828
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 169,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 163,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -415407774
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 169,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 164,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -24899292
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 169,
					portId = "BoneTrans"
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 166,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					75.157,
					121.822,
					682.234
				},
				rotationVInput = {
					13.219,
					322.448,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 168,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				blendTimeVInput = 30,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					73.555,
					123.037,
					681.126
				},
				rotationVInput = {
					24.392,
					341.7,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					69.31,
					118.87,
					688.11
				},
				rotationVInput = {
					0,
					126.346,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 170,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_CatchBall_BigWhiteBall_ParmonAppear.prefab",
				postionVInput = {
					69.31,
					120,
					688.11
				},
				rotationVInput = {
					0,
					300.031,
					0
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.3,
					120.963,
					685.059
				},
				rotationVInput = {
					3.288,
					7.71,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 173,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.887,
					120.921,
					685.759
				},
				rotationVInput = {
					1.397,
					225.56,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 176,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -989505828,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 178,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.887,
					120.88,
					686.859
				},
				rotationVInput = {
					1.741,
					120.193,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 256,
				fStop = 14.08,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 180,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.809,
					120.935,
					686.715
				},
				rotationVInput = {
					1.913,
					116.927,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 182,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
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
						nodeId = 190,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 184,
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 185,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
						nodeId = 186,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 187,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 188,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 189,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
						nodeId = 191,
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
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 5,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 192,
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
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 193,
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
						nodeId = 194,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 245,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 247,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 195,
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
						nodeId = 196,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 243,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 197,
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
						nodeId = 198,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 240,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 241,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 199,
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
						nodeId = 200,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 237,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 238,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527063,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 201,
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
						nodeId = 202,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 231,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 233,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 235,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527064,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 203,
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
						nodeId = 204,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 224,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 226,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527065,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 205,
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
						nodeId = 206,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 223,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 207,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 222,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527067
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 208,
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
						nodeId = 209,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 221,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527069,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 210,
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
						nodeId = 211,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 220,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Cheeksupport_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End",
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
						nodeId = 212,
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
						nodeId = 213,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 219,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
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
						nodeId = 214,
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
						nodeId = 215,
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
						nodeId = 216,
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
						nodeId = 217,
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
						nodeId = 218,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 4,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 7,
			fields = {
				dialogueId = 6527068
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 208,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 225,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 235,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 227,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -669799096
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 235,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 228,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -989505828
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 235,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 229,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -415407774
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 235,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 230,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -24899292
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 235,
					portId = "BoneTrans"
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 232,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					75.157,
					121.822,
					682.234
				},
				rotationVInput = {
					13.219,
					322.448,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 234,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				blendTimeVInput = 30,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					73.555,
					123.037,
					681.126
				},
				rotationVInput = {
					24.392,
					341.7,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					69.31,
					118.87,
					688.11
				},
				rotationVInput = {
					0,
					126.346,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 236,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_CatchBall_BigWhiteBall_ParmonAppear.prefab",
				postionVInput = {
					69.31,
					120,
					688.11
				},
				rotationVInput = {
					0,
					300.031,
					0
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.3,
					120.963,
					685.059
				},
				rotationVInput = {
					3.288,
					7.71,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 239,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.887,
					120.921,
					685.759
				},
				rotationVInput = {
					1.397,
					225.56,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 242,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -989505828,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 244,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.887,
					120.88,
					686.859
				},
				rotationVInput = {
					1.741,
					120.193,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 256,
				fStop = 14.08,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 246,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.809,
					120.935,
					686.715
				},
				rotationVInput = {
					1.913,
					116.927,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 248,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
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
						nodeId = 256,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 250,
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 251,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
						nodeId = 252,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					-868.06,
					132.8,
					1050.82
				},
				rotationVInput = {
					0,
					309.416,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 253,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					-867.49,
					132.8,
					1051.02
				},
				rotationVInput = {
					0,
					294.53,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 254,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					-869.15,
					132.8,
					1050.37
				},
				rotationVInput = {
					0,
					21.944,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 255,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					-870.03,
					132.8,
					1049.85
				},
				rotationVInput = {
					0,
					38.689,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
						nodeId = 257,
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
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 3,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 258,
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
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 259,
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
						nodeId = 260,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 311,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 313,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 261,
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
						nodeId = 262,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 309,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 263,
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
						nodeId = 264,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 306,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 307,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 265,
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
						nodeId = 266,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 303,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 304,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527063,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 267,
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
						nodeId = 268,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 297,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 299,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 301,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527064,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 269,
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
						nodeId = 270,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 290,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 292,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527065,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 271,
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
						nodeId = 272,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 289,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 273,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 288,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527067
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 274,
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
						nodeId = 275,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 287,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527069,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 276,
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
						nodeId = 277,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 286,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Cheeksupport_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End",
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
						nodeId = 278,
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
						nodeId = 279,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 285,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
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
						nodeId = 280,
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
						nodeId = 281,
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
						nodeId = 282,
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
						nodeId = 283,
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
						nodeId = 284,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 2,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 7,
			fields = {
				dialogueId = 6527068
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 274,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 291,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 301,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 293,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -669799096
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 301,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 294,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -989505828
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 301,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 295,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -415407774
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 301,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 296,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -24899292
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 301,
					portId = "BoneTrans"
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 298,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					75.157,
					121.822,
					682.234
				},
				rotationVInput = {
					13.219,
					322.448,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 300,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				blendTimeVInput = 30,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					73.555,
					123.037,
					681.126
				},
				rotationVInput = {
					24.392,
					341.7,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					69.31,
					118.87,
					688.11
				},
				rotationVInput = {
					0,
					126.346,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 302,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_CatchBall_BigWhiteBall_ParmonAppear.prefab",
				postionVInput = {
					69.31,
					120,
					688.11
				},
				rotationVInput = {
					0,
					300.031,
					0
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.3,
					120.963,
					685.059
				},
				rotationVInput = {
					3.288,
					7.71,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 305,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.887,
					120.921,
					685.759
				},
				rotationVInput = {
					1.397,
					225.56,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 308,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -989505828,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 310,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.887,
					120.88,
					686.859
				},
				rotationVInput = {
					1.741,
					120.193,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 256,
				fStop = 14.08,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 312,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.809,
					120.935,
					686.715
				},
				rotationVInput = {
					1.913,
					116.927,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 314,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
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
						nodeId = 322,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 316,
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
					119.725,
					0
				},
				targetPositionVInput = {
					72.564,
					119.71,
					685.959
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
						nodeId = 317,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				staticIdVInput = 1,
				targetEulerAngleVInput = {
					0,
					154.877,
					0
				},
				targetPositionVInput = {
					73.26,
					119.439,
					688.476
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
						nodeId = 318,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990016,
				positionVInput = {
					72.89,
					119.713,
					684.95
				},
				rotationVInput = {
					0,
					84.316,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 319,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990024,
				positionVInput = {
					72.63,
					119.713,
					684.4
				},
				rotationVInput = {
					0,
					69.608,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -415407774
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 320,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990010,
				positionVInput = {
					73.33,
					119.713,
					686.04
				},
				rotationVInput = {
					0,
					156.931,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 321,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990011,
				positionVInput = {
					73.58,
					119.713,
					687.03
				},
				rotationVInput = {
					0,
					173.133,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -24899292
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
						nodeId = 323,
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
					hideInteractionSign = true,
					hideMarkShare = false,
					hideTopLogo = true,
					blockCameraZoom = true,
					toplogoComList = {
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
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 1,
						portId = "End"
					}
				},
				Out = {
					{
						nodeId = 324,
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
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 325,
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
						nodeId = 326,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 377,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 379,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527060,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 327,
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
						nodeId = 328,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 375,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527061,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 4.38,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 329,
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
						nodeId = 330,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 372,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 373,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527062,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 3.75,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 331,
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
						nodeId = 332,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 369,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 370,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527063,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 8.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 333,
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
						nodeId = 334,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 363,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 365,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 367,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527064,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 5.12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 335,
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
						nodeId = 336,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 356,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 358,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527065,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 337,
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
						nodeId = 338,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 355,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527066,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 9.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 339,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 354,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6527067
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 340,
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
						nodeId = 341,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 353,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527069,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = -1,
				matchAudioDuration = true,
				duration = 12,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 342,
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
						nodeId = 343,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 352,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527070,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Cheeksupport_Start",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990016,
				matchAudioDuration = true,
				duration = 9.5,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
				animCfg = {
					"Talk_Cheeksupport_Start",
					"Talk_Cheeksupport_Loop",
					"Talk_Cheeksupport_End",
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
						nodeId = 344,
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
						nodeId = 345,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 351,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6527071,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Talk_Righthand",
				skipTime = 0,
				npcStaticId = -1,
				npcId = 990010,
				matchAudioDuration = true,
				duration = 7.88,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				portCount = 1,
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
						nodeId = 346,
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
						nodeId = 347,
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
						nodeId = 348,
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
						nodeId = 349,
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
						nodeId = 350,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				DirectOut = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -156583582
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 7,
			fields = {
				dialogueId = 6527068
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 340,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -156583582
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990096,
				processingTime = 0,
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 357,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 367,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 359,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -669799096
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 367,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 360,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -989505828
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 367,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 361,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -415407774
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 367,
					portId = "BoneTrans"
				}
			},
			fields = {
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 362,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 26,
			inputs = {
				staticIdVInput = -24899292
			},
			valueIn = {
				faceTransVInput = {
					nodeId = 367,
					portId = "BoneTrans"
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
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 364,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					75.157,
					121.822,
					682.234
				},
				rotationVInput = {
					13.219,
					322.448,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 91578345,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 366,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementAngleVInput = 10,
				blendTimeVInput = 30,
				fovVInput = 35,
				cameraMovementTimeVInput = 10,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				cameraMovementCenterVInput = {
					80.289,
					119.71,
					680.848
				},
				positionVInput = {
					73.555,
					123.037,
					681.126
				},
				rotationVInput = {
					24.392,
					341.7,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 648,
				fStop = 4.57,
				cameraId = 91578348,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 990096,
				positionVInput = {
					69.31,
					118.87,
					688.11
				},
				rotationVInput = {
					0,
					126.346,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -156583582
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 368,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 37,
			inputs = {
				effectKeyVInput = "$Eff_CatchBall_BigWhiteBall_ParmonAppear.prefab",
				postionVInput = {
					69.31,
					120,
					688.11
				},
				rotationVInput = {
					0,
					300.031,
					0
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
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.3,
					120.963,
					685.059
				},
				rotationVInput = {
					3.288,
					7.71,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 91578344,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -669799096,
				lookAtEntityStaticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 371,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Talk_Shrug_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					73.887,
					120.921,
					685.759
				},
				rotationVInput = {
					1.397,
					225.56,
					0
				}
			},
			fields = {
				sensorWidth = 264,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 116,
				fStop = 14.16,
				cameraId = 91578335,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = -989505828,
				lookAtEntityStaticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 374,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				staticIdVInput = -989505828,
				playableStateVInput = "Talk_Righthand"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -669799096
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 376,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -669799096,
				playableStateVInput = "Emotion_Confused_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990010,
				processingTime = 0,
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
			kind = 3,
			inputs = {
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.887,
					120.88,
					686.859
				},
				rotationVInput = {
					1.741,
					120.193,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true,
				focalDistance = 256,
				fStop = 14.08,
				cameraId = 91578330,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 378,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 10,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					70.809,
					120.935,
					686.715
				},
				rotationVInput = {
					1.913,
					116.927,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91578331,
				visualizeDOF = false,
				squeezeFactor = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 28,
			inputs = {
				staticIdVInput = -989505828
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 380,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				staticIdVInput = -989505828,
				playableStateVInput = "Emotion_Firm_Start"
			},
			fields = {
				playAniType = 1,
				isLooping = false,
				entityType = 2,
				templateId = 990016,
				processingTime = 0,
				aniStateList = {
					"Emotion_Firm_Start",
					"Emotion_Firm_Loop",
					"Emotion_Firm_End"
				}
			},
			flowIn = {
				In = 0
			}
		}
	}
}
