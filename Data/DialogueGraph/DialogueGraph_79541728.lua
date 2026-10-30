-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79541728.lua

return {
	startNodeId = 1,
	dialogueId = 79541728,
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
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 58,
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				hideAllUIVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				applyStateConflictVInput = true,
				startSkipVInput = true,
				hideTopLogoVInput = true
			},
			fields = {
				topLogoComs = {
					petExchange = true,
					multiPlayer = true,
					callFriends = true,
					petChat = true,
					combat = true,
					bubble = true,
					petFertility = true,
					npc = true,
					chat = true,
					alert = true
				}
			},
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
						nodeId = 6
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
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 7
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 15
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
						nodeId = 20
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 108
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 109
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401059,
				positionVInput = {
					-499.12,
					56.884,
					776.37
				},
				rotationVInput = {
					0,
					24.431,
					0
				}
			},
			fields = {
				entityId = -34832840
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_DoubtStart",
				playStartLoopEndVInput = true,
				loopDurationVInput = 90
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 401059,
				processingTime = 1.083,
				aniStateList = {
					"Behav_DoubtStart",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
				}
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
					nodeId = 7
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 401059,
				processingTime = 9.683
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_HappyStart"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 401059,
				processingTime = 1.083,
				aniStateList = {
					"Behav_HappyStart",
					"Behav_HappyLoop",
					"Behav_HappyEnd"
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Behav_Happy"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 401059,
				processingTime = 1.083,
				aniStateList = {
					"Behav_Happy",
					"Behav_Happy",
					"Behav_Happy"
				}
			}
		},
		{
			kind = 15,
			inputs = {
				staticIdVInput = 2
			},
			valueIn = {
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 7
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
					nodeId = 20
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 7
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
					nodeId = 15
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400204,
				positionVInput = {
					-497.308,
					56.85,
					777
				},
				rotationVInput = {
					0,
					210,
					0
				}
			},
			fields = {
				entityId = -1081141270
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "TalkUpper_Cheeksupport"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 15
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 4.9
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Serious"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 15
				}
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
				playableStateVInput = "TalkUpper_Deny"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 15
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 3
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
					-498.892,
					59.27,
					780.668
				},
				rotationVInput = {
					18.184,
					161.401,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 228,
				fStop = 6.01,
				cameraId = 84045289,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-497.25,
					56.818,
					777.93
				},
				rotationVInput = {
					0,
					199.913,
					0
				}
			},
			fields = {
				entityId = -1450504535
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Talk_Shrug_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 5.2,
				aniStateList = {
					"Talk_Shrug_Start",
					"Talk_Shrug_Loop",
					"Talk_Shrug_End"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 22
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Crossingarms"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 5.2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 33,
			inputs = {
				facialEmotionVInput = "Serious"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
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
			kind = 4,
			fields = {
				delayTime = 0.5
			},
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
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.5
			},
			flowIn = {
				In = true
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
				portCount = 5
			},
			flowIn = {
				In = true
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
						nodeId = 12
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 13
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
						nodeId = 107
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
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 13,
			fields = {
				resetOrientation = true,
				reactPreset = 3,
				enableGroupLookAt = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201224
			},
			fields = {
				npcId = 401059,
				duration = 7,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201225
			},
			fields = {
				npcId = 400180,
				duration = 7,
				chatType = 3,
				portCount = 2,
				npcStaticId = 79229264
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201226,
				defaultSkipBranchVInput = 1
			},
			fields = {
				npcId = 401059,
				duration = 7,
				chatType = 3,
				portCount = 2,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 104
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201227
			},
			flowIn = {
				In = true
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
				In = true
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 6201229
			},
			fields = {
				npcId = 401059,
				duration = 6,
				chatType = 3,
				npcStaticId = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "0",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["1"] = true,
				["0"] = true
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
		{
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 37
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 103
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201231
			},
			fields = {
				npcId = 401059,
				duration = 7,
				chatType = 3,
				npcStaticId = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201232
			},
			fields = {
				npcId = 401059,
				duration = 8,
				chatType = 3,
				npcStaticId = 79229255
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201233
			},
			fields = {
				npcId = 401059,
				duration = 12,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 6201234,
				defaultSkipBranchVInput = 1
			},
			fields = {
				npcId = 401059,
				duration = 8,
				chatType = 3,
				portCount = 2,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 41
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 99
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201235
			},
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 3
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 15.2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-499.162,
					59.171,
					777.121
				},
				rotationVInput = {
					356.87,
					173.26,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 100,
				fStop = 31.99,
				cameraId = 84058503,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201237
			},
			fields = {
				npcId = 401059,
				duration = 10,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "0",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["1"] = true,
				["0"] = true
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
				dialogueIdVInput = 6201239
			},
			fields = {
				npcId = 401059,
				duration = 12,
				chatType = 3,
				npcStaticId = 79229255
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201240
			},
			fields = {
				npcId = 401059,
				duration = 11,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				dialogueIdVInput = 6201241
			},
			fields = {
				npcId = 401059,
				duration = 7,
				chatType = 3,
				npcStaticId = 79229255
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201242
			},
			fields = {
				npcId = 401059,
				duration = 12,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 50
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
						portId = "In",
						nodeId = 51
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 98
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6201243
			},
			fields = {
				npcId = 400180,
				duration = 7,
				chatType = 3,
				npcStaticId = 79229255
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201244
			},
			fields = {
				npcId = 400180,
				duration = 11,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 53
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
						nodeId = 55
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
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-497.817,
					58.411,
					780.363
				},
				rotationVInput = {
					359.62,
					186.152,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 8.68,
				cameraId = 84051395,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201245
			},
			fields = {
				npcId = 401059,
				duration = 6,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 6201246
			},
			fields = {
				npcId = 401059,
				duration = 11,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
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
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 59
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 58
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
					-498.92,
					58.331,
					776.644
				},
				rotationVInput = {
					13.715,
					58.613,
					0.004
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 8.35,
				cameraId = 84051713,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201247
			},
			fields = {
				npcId = 400180,
				duration = 8,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 60
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
						nodeId = 62
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 61
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
					-498.473,
					58.649,
					779.158
				},
				rotationVInput = {
					3.23,
					180.308,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 7.34,
				cameraId = 84051806,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201248
			},
			fields = {
				npcId = 401059,
				duration = 8,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 63
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201249
			},
			fields = {
				npcId = 400204,
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 64
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201250
			},
			fields = {
				npcId = 401059,
				duration = 6,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 65
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201251
			},
			fields = {
				npcId = 0,
				duration = 4,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
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
						nodeId = 68
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 67
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
					-499.348,
					59.108,
					778.108
				},
				rotationVInput = {
					359.792,
					180.136,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 6.42,
				cameraId = 84051988,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201252
			},
			fields = {
				npcId = 401059,
				duration = 10,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 69
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
						portId = "In",
						nodeId = 70
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
						nodeId = 97
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 17
					}
				},
				["4"] = {
					{
						portId = "StopLip",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201253
			},
			fields = {
				npcId = 400204,
				duration = 10,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 71
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201254
			},
			fields = {
				npcId = 400204,
				duration = 10,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 72
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
						nodeId = 74
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 73
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
					-499.348,
					59.108,
					778.108
				},
				rotationVInput = {
					359.792,
					180.136,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 6.42,
				cameraId = 90859010,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201255,
				defaultSkipBranchVInput = 1
			},
			fields = {
				npcId = 401059,
				duration = 4,
				chatType = 3,
				portCount = 2,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 75
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 96
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201256
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "0",
						nodeId = 76
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["1"] = true,
				["0"] = true
			},
			flowOut = {
				Out = {
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
				portCount = 4
			},
			flowIn = {
				In = true
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
						nodeId = 95
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201258
			},
			fields = {
				npcId = 400204,
				duration = 6,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201259
			},
			fields = {
				npcId = 400204,
				duration = 11,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 80
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
						nodeId = 81
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 94
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201260
			},
			fields = {
				npcId = 401059,
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 82
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201261
			},
			fields = {
				npcId = 401059,
				duration = 7,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201262
			},
			fields = {
				npcId = 401059,
				duration = 12,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 84
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
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 86
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 85
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 9
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
					-496.58,
					59.461,
					782.649
				},
				rotationVInput = {
					10.277,
					188.044,
					0.004
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 280,
				fStop = 8.6,
				cameraId = 84054320,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201264
			},
			fields = {
				npcId = 0,
				duration = 3,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 87
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
						nodeId = 88
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				lookAtIdVInput = 401059,
				dialogueIdVInput = 6201265
			},
			fields = {
				npcId = 400180,
				duration = 4,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
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
				portCount = 2
			},
			flowIn = {
				In = true
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
						nodeId = 91
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201263
			},
			fields = {
				npcId = 400204,
				duration = 4,
				chatType = 7,
				skipTime = 3,
				npcStaticId = 79229255
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
					146.3,
					0
				},
				targetPositionVInput = {
					-517,
					49,
					696
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 126
				}
			},
			fields = {
				setRotation = true,
				setPosition = true
			},
			flowIn = {
				In = true
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
						nodeId = 93
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
						portId = "End",
						nodeId = 0
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
					-499.348,
					59.108,
					778.108
				},
				rotationVInput = {
					359.792,
					180.136,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 6.42,
				cameraId = 90859008,
				squeezeFactor = 1
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
					-499.137,
					58.389,
					776.548
				},
				rotationVInput = {
					11.137,
					67.379,
					0.004
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 6.92,
				cameraId = 84052603,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201257
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 76
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
					-498.102,
					58.121,
					776.396
				},
				rotationVInput = {
					9.418,
					58.612,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 100,
				fStop = 6.17,
				cameraId = 85461047,
				squeezeFactor = 1
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
					-498.074,
					58.203,
					777.007
				},
				rotationVInput = {
					12.684,
					45.205,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 14.24,
				cameraId = 84049622,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201236
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 100
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
						portId = "In",
						nodeId = 102
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 101
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 15.2,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-499.162,
					59.171,
					777.121
				},
				rotationVInput = {
					356.87,
					173.26,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 100,
				fStop = 32,
				cameraId = 90859013,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201238
			},
			fields = {
				npcId = 401059,
				duration = 8,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "1",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 12.1,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-499.4,
					59.127,
					778.25
				},
				rotationVInput = {
					2.714,
					178.245,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 180,
				fStop = 18.96,
				cameraId = 85454900,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201228
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 105
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
						nodeId = 106
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201230
			},
			fields = {
				npcId = 401059,
				duration = 6,
				chatType = 3,
				npcStaticId = 79229255
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "1",
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 7.9,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-499.525,
					59.27,
					780.398
				},
				rotationVInput = {
					17.497,
					156.932,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 228,
				fStop = 6.01,
				cameraId = 85454175,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-496.602,
					56.858,
					777.705
				},
				rotationVInput = {
					0,
					199.913,
					0
				}
			},
			fields = {
				entityId = -464087137
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
					201.378,
					0
				},
				targetPositionVInput = {
					-498.114,
					56.806,
					777.584
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 125
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
			kind = 12,
			flowOut = {
				Out = {
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
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 112
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
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400066,
				positionVInput = {
					-496.79,
					56.841,
					777.764
				},
				rotationVInput = {
					0,
					199.913,
					0
				}
			},
			fields = {
				entityId = -2104508128
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 15.5,
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-498.533,
					58.479,
					777.305
				},
				rotationVInput = {
					11.652,
					203.514,
					0.004
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 80,
				fStop = 25.8,
				cameraId = 84049617,
				squeezeFactor = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-498.393,
					58.643,
					778.302
				},
				rotationVInput = {
					15.778,
					198.014,
					0.004
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 5.17,
				cameraId = 84052013,
				squeezeFactor = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-498.348,
					58.471,
					778.413
				},
				rotationVInput = {
					13.371,
					180.996,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84052741,
				squeezeFactor = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-498.592,
					58.393,
					779.226
				},
				rotationVInput = {
					356.526,
					181.855,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 85454889,
				squeezeFactor = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-498.592,
					58.393,
					779.226
				},
				rotationVInput = {
					356.526,
					181.855,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 84045290,
				squeezeFactor = 1
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				blendTimeVInput = 10.5,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-498.61,
					58.362,
					778.086
				},
				rotationVInput = {
					9.246,
					186.668,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 130,
				fStop = 8.01,
				cameraId = 85457192,
				squeezeFactor = 1
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-497.544,
					56.804,
					778.037
				},
				rotationVInput = {
					0,
					199.913,
					0
				}
			},
			fields = {
				entityId = -1142796910
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-497.952,
					56.81,
					778.839
				},
				rotationVInput = {
					0,
					199.913,
					0
				}
			},
			fields = {
				entityId = -1663507594
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400180,
				positionVInput = {
					-496.948,
					56.824,
					780.043
				},
				rotationVInput = {
					0,
					199.913,
					0
				}
			},
			fields = {
				entityId = -697703590
			}
		},
		{
			kind = 14,
			inputs = {
				targetPositionVInput = {
					-512.51,
					50.28,
					689.86
				}
			},
			fields = {
				setPosition = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2
			},
			fields = {
				entityId = -1968405968
			}
		},
		{
			kind = 17
		},
		{
			kind = 17
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 2,
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					-499.231,
					59.163,
					777.113
				},
				rotationVInput = {
					356.87,
					173.26,
					0.003
				}
			},
			fields = {
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 6.42,
				cameraId = 90859012,
				squeezeFactor = 1
			}
		},
		{
			kind = 59,
			fields = {
				animationCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 1.00235,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = -2.937509,
							inTangent = -2.937509,
							time = 1.000829,
							weightedMode = 0,
							value = 0.007076263,
							outWeight = 0
						}
					}
				}
			}
		},
		{
			kind = 46,
			fields = {
				volumeComponentCount = 1,
				volumeParamInfoCount = 1,
				volumeComponents = {
					{
						active = true,
						typeName = "VignetteComponent",
						parameters = {
							m_VignetteColor = {
								overrideState = true,
								valueType = "color",
								value = {
									g = 34.29675,
									a = 1,
									b = 34.29675,
									r = 34.29675
								}
							},
							m_EdgeWidth = {
								overrideState = true,
								value = 0.763,
								valueType = "float"
							},
							m_EdgeSoftness = {
								overrideState = true,
								value = 0.35,
								valueType = "float"
							},
							m_VignetteAlpha = {
								overrideState = true,
								value = 1,
								valueType = "float"
							},
							m_FisheyeFovDeg = {
								overrideState = false,
								value = 0,
								valueType = "float"
							},
							m_FollowAspect = {
								overrideState = false,
								value = true,
								valueType = "bool"
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "VignetteComponent",
						params = {}
					}
				}
			}
		},
		{
			kind = 12
		},
		{
			kind = 59,
			fields = {
				animationCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 1.999939,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0.1174946,
							inTangent = 0.1174946,
							time = 2.746019,
							weightedMode = 0,
							value = 0.4325165,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = -0.01289218,
							inTangent = -0.01289218,
							time = 4.47884,
							weightedMode = 0,
							value = 0.8506042,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 6.482499,
							weightedMode = 0,
							value = 0.2488505,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 7.758335,
							weightedMode = 0,
							value = 0.5957549,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 8.973153,
							weightedMode = 0,
							value = 0.3635166,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 10.554,
							weightedMode = 0,
							value = 0.8042349,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 12.97342,
							weightedMode = 0,
							value = 0.1795261,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 13.55958,
							weightedMode = 0,
							value = 0.28123,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = -0.3442466,
							inTangent = -0.3442466,
							time = 14.39524,
							weightedMode = 0,
							value = 0.06354927,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 15.00103,
							weightedMode = 0,
							value = 0.0002282123,
							outWeight = 0
						}
					}
				}
			}
		},
		{
			kind = 46,
			valueIn = {
				["1"] = {
					portId = "animationCurveVOutput",
					nodeId = 131
				}
			},
			fields = {
				volumeComponentCount = 1,
				volumeParamInfoCount = 1,
				volumeComponents = {
					{
						active = true,
						typeName = "VignetteComponent",
						parameters = {
							m_VignetteColor = {
								overrideState = true,
								valueType = "color",
								value = {
									g = 0,
									a = 1,
									b = 0,
									r = 0
								}
							},
							m_EdgeWidth = {
								overrideState = true,
								value = 2,
								valueType = "float"
							},
							m_EdgeSoftness = {
								overrideState = true,
								value = 0.75,
								valueType = "float"
							},
							m_VignetteAlpha = {
								overrideState = true,
								value = 1,
								valueType = "float"
							},
							m_FisheyeFovDeg = {
								overrideState = false,
								value = 0,
								valueType = "float"
							},
							m_FollowAspect = {
								overrideState = false,
								value = true,
								valueType = "bool"
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "VignetteComponent",
						params = {
							{
								paramIndex = 1,
								name = "宽度"
							}
						}
					}
				}
			},
			dynamicInputs = {
				"1"
			}
		},
		{
			kind = 59,
			fields = {
				animationCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 0,
							weightedMode = 0,
							value = 1.999939,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0.1174946,
							inTangent = 0.1174946,
							time = 2.746019,
							weightedMode = 0,
							value = 0.4325165,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = -0.01289218,
							inTangent = -0.01289218,
							time = 4.47884,
							weightedMode = 0,
							value = 0.8506042,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 6.482499,
							weightedMode = 0,
							value = 0.2488505,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 7.758335,
							weightedMode = 0,
							value = 0.5957549,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 8.973153,
							weightedMode = 0,
							value = 0.3635166,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 10.554,
							weightedMode = 0,
							value = 0.8042349,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 12.97342,
							weightedMode = 0,
							value = 0.1795261,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 13.55958,
							weightedMode = 0,
							value = 0.28123,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = -0.3442466,
							inTangent = -0.3442466,
							time = 14.39524,
							weightedMode = 0,
							value = 0.06354927,
							outWeight = 0
						},
						{
							inWeight = 0,
							outTangent = 0,
							inTangent = 0,
							time = 15.00103,
							weightedMode = 0,
							value = 0.0002282123,
							outWeight = 0
						}
					}
				}
			}
		}
	}
}
