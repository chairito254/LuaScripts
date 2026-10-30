-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_79541411.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 79541411,
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
			kind = 11,
			fields = {
				modeInfo = {
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
						nodeId = 4
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
						nodeId = 5
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
						nodeId = 51
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
						nodeId = 6
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
						nodeId = 9
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 47
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-498.958,
					58.939,
					778.151
				},
				rotationVInput = {
					357.901,
					191.825,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 4,
				cameraId = 90858792
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				blendTimeVInput = 6.2,
				positionVInput = {
					-498.724,
					59.32,
					777.3
				},
				rotationVInput = {
					9.147,
					204.762,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 100,
				fStop = 23.89,
				cameraId = 82211766
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = true
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
						nodeId = 11
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
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				applyStateConflictVInput = true,
				startSkipVInput = true,
				startSkipMsgVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 52
				}
			},
			fields = {
				cameraPreset = 2,
				resetOrientation = true,
				reactPreset = 3,
				nodeMode = 1,
				enableGroupLookAt = true
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FOut = {
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
				portCount = 2
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201172
			},
			fields = {
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201173
			},
			fields = {
				duration = 6,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
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
						nodeId = 18
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
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201174,
				defaultSkipBranchVInput = 1
			},
			fields = {
				duration = 6,
				chatType = 3,
				portCount = 2,
				npcStaticId = 79229255,
				npcId = 400204
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
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201175
			},
			flowIn = {
				In = true
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
						nodeId = 22
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["2"] = {
					{
						portId = "0",
						nodeId = 36
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 40
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 39
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
					-496.86,
					58.027,
					779.204
				},
				rotationVInput = {
					5.121,
					110.694,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 20.05,
				cameraId = 85392506
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201177
			},
			fields = {
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "0",
						nodeId = 23
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
				["0"] = true,
				["1"] = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 24
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
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201179
			},
			fields = {
				duration = 8,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
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
						nodeId = 27
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
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201180
			},
			fields = {
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
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
						nodeId = 30
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
						nodeId = 29
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_GiveSmile_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 48
				}
			},
			fields = {
				templateId = 400204,
				processingTime = 1.3,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Story_GiveSmile_Start",
					"Story_GiveSmile_Loop",
					"Story_GiveSmile_End"
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201181
			},
			fields = {
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
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
			kind = 28,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 48
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-496.51,
					58.17,
					778.84
				},
				rotationVInput = {
					9.762,
					123.93,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 100,
				fStop = 23.88,
				cameraId = 90964992
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 35,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-496.733,
					58.001,
					779.096
				},
				rotationVInput = {
					3.23,
					127.196,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 110,
				fStop = 22.71,
				cameraId = 83769298
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Nod"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 48
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400204,
				processingTime = 1.3
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2
			},
			flowIn = {
				["0"] = true,
				["1"] = true
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
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think02"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 49
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400180,
				processingTime = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 49
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 48
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
					nodeId = 48
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 49
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Emotion_Think02"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 49
				}
			},
			fields = {
				playAniType = 1,
				entityType = 2,
				templateId = 400180,
				processingTime = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 49
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 48
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 6201176
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 43
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
						nodeId = 45
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
						portId = "1",
						nodeId = 36
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
					-496.86,
					58.027,
					779.204
				},
				rotationVInput = {
					5.121,
					110.694,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 200,
				fStop = 21.97,
				cameraId = 83760061
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6201178
			},
			fields = {
				duration = 2,
				chatType = 3,
				npcStaticId = 79229255,
				npcId = 400204
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "1",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 48
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 49
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
				loopDurationVInput = 10,
				playableStateVInput = "Behav_DoubtStart"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 52
				}
			},
			fields = {
				templateId = 401059,
				processingTime = 2.333,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"",
					"Behav_DoubtLoop",
					"Behav_DoubtEnd"
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
					-495.758,
					56.856,
					778.375
				},
				rotationVInput = {
					0,
					305.335,
					0
				}
			},
			fields = {
				entityId = -696192355
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
					-495.707,
					56.831,
					779.112
				},
				rotationVInput = {
					0,
					230,
					0
				}
			},
			fields = {
				entityId = -1189661485
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
					-637.213,
					48.048,
					851.638
				},
				rotationVInput = {
					0,
					272.046,
					0
				}
			},
			fields = {
				entityId = -2089878322
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
					113.784,
					0
				},
				targetPositionVInput = {
					-496.893,
					56.808,
					778.538
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 54
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 401059,
				positionVInput = {
					-499.12,
					56.88,
					776.37
				},
				rotationVInput = {
					0,
					25.305,
					0
				}
			},
			fields = {
				entityId = -2110714122
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 45,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-497.973,
					58.38,
					777.258
				},
				rotationVInput = {
					11.481,
					57.925,
					0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 83762406
			}
		},
		{
			kind = 17
		},
		{
			kind = 15
		},
		{
			kind = 15
		},
		{
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 400204,
				positionVInput = {
					-495.758,
					56.856,
					778.375
				},
				rotationVInput = {
					0,
					305.335,
					0
				}
			},
			fields = {
				entityId = -1423035805
			}
		}
	}
}
