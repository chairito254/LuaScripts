-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_84239224.lua

return {
	dialogueId = 84239224,
	schema = 1,
	startNodeId = 1,
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
				In = 0
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
			kind = 11,
			fields = {
				onSkipStartConnected = true,
				modeInfo = {
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
					hideTopLogo = true,
					hideMarkShare = true,
					toplogoComList = {
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
						alert = true,
						actionState = true,
						vlog = true
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
						nodeId = 20
					}
				},
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
				portCount = 11
			},
			flowIn = {
				In = 0
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
						nodeId = 35
					}
				},
				["10"] = {
					{
						portId = "In",
						nodeId = 38
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 5
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
						nodeId = 9
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 16
					}
				},
				["7"] = {
					{
						portId = "In",
						nodeId = 32
					}
				},
				["8"] = {
					{
						portId = "In",
						nodeId = 33
					}
				},
				["9"] = {
					{
						portId = "In",
						nodeId = 34
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
					106.297,
					0
				},
				targetPositionVInput = {
					-188.748,
					96.666,
					776.4
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 41
				}
			},
			fields = {
				reset = false,
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = 0
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
			kind = 19,
			inputs = {
				speedVInput = 0.75,
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				targetEulerAngleVInput = {
					0,
					106,
					0
				},
				targetPositionVInput = {
					-175.232,
					98.743,
					770.428
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 41
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0
						}
					}
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
					-183.971,
					97.336,
					772.453
				},
				rotationVInput = {
					0,
					118.9,
					0
				}
			},
			fields = {
				entityId = -879752152,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
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
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				targetPositionVInput = {
					-175.84,
					98.633,
					769.494
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 7
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0
						}
					}
				}
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
					-186.34,
					96.987,
					770.941
				},
				rotationVInput = {
					0,
					110.445,
					0
				}
			},
			fields = {
				entityId = -619150801,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				targetPositionVInput = {
					-177.685,
					97.893,
					767.732
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 9
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0
						}
					}
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
					"TWIN_PET_CHOICE",
					nil,
					nil,
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
						portId = "In",
						nodeId = 14
					}
				},
				True = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 500029,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-184.085,
					96.964,
					779.022
				},
				rotationVInput = {
					0,
					110.445,
					0
				}
			},
			fields = {
				entityId = -1740706113,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetPositionVInput = {
					-169.918,
					98.288,
					773.094
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 12
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 500030,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-184.755,
					97.366,
					778.6
				},
				rotationVInput = {
					0,
					110.445,
					357.053
				}
			},
			fields = {
				entityId = -151823174,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetPositionVInput = {
					-176.021,
					98.288,
					773.377
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 14
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0
						}
					}
				}
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
					-186.086,
					96.964,
					772.25
				},
				rotationVInput = {
					0,
					110.445,
					0
				}
			},
			fields = {
				entityId = -902652867,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				speedVInput = 1.238,
				maxLimitTimeVInput = 10,
				targetPositionVInput = {
					-176.008,
					98.635,
					770.225
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 16
				}
			},
			fields = {
				reset = false,
				finishToSteer = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0,
							time = 0,
							weightedMode = 0
						},
						{
							outWeight = 0,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1,
							time = 1,
							weightedMode = 0
						}
					}
				}
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
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3304027
			},
			fields = {
				skipTime = 0,
				npcStaticId = -1,
				npcId = 400204,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 6,
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
						portId = "In",
						nodeId = 20
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				showTopLogoVInput = false,
				showAllUIVInput = false,
				endSkipVInput = true,
				enablePlayerMoveVInput = false,
				enableEventVInput = false,
				enableCameraZoomVInput = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 21
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
				["1"] = {
					{
						portId = "In",
						nodeId = 22
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
						portId = "In",
						nodeId = 23
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
						portId = "In",
						nodeId = 24
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 121,
				param = {
					5701132,
					0,
					{
						-1.5,
						0.4,
						-1.2
					},
					{
						2,
						0,
						2
					},
					{
						0,
						0,
						0
					},
					true
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				CloseOut = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = 0
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
						portId = "In",
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 22,
			flowIn = {
				In = 0
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
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 23,
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
		{
			kind = 21,
			flowIn = {
				In = 0
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
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400070,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-171.55,
					97.811,
					762.423
				},
				rotationVInput = {
					4.559,
					110.445,
					0
				}
			},
			fields = {
				entityId = -1746228532,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400070,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-169.36,
					97.695,
					761.836
				},
				rotationVInput = {
					10.225,
					110.445,
					0
				}
			},
			fields = {
				entityId = -483312940,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 400076,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-159.681,
					99.706,
					756.515
				},
				rotationVInput = {
					0,
					110.445,
					0
				}
			},
			fields = {
				entityId = -1244999902,
				ignoreGravity = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 54,
				blendFuncVInput = "Linear",
				positionVInput = {
					-192.294,
					97.29,
					776.823
				},
				rotationVInput = {
					2.972,
					114.041,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 2000,
				fStop = 4,
				cameraId = 90850220,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 7,
				fovVInput = 54,
				blendFuncVInput = "Linear",
				positionVInput = {
					-178.483,
					100.25,
					771.317
				},
				rotationVInput = {
					356.032,
					117.479,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 2000,
				fStop = 4,
				cameraId = 90850218,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 6,
				fovVInput = 54,
				blendFuncVInput = "Linear",
				positionVInput = {
					-178.239,
					100.25,
					771.221
				},
				rotationVInput = {
					353.585,
					117.479,
					0
				}
			},
			fields = {
				openDof = true,
				focalDistance = 2000,
				fStop = 4,
				cameraId = 90873504,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 6.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 39
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				playableStateVInput = "Story_Dialogue_Start"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 43
				}
			},
			fields = {
				templateId = 4,
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				aniStateList = {
					"Story_Dialogue_Start",
					"Story_Dialogue_Loop",
					"Story_Dialogue_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		[41] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		},
		[43] = {
			kind = 9,
			fields = {
				entityType = 0
			}
		}
	}
}
