-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91034329.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91034329,
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
				modeInfo = {
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = false,
					blockEvent = false,
					modeType = 0,
					blockCameraZoom = false,
					hideTopLogo = false,
					hideMarkShare = false,
					hideInteractionSign = false,
					showHud = false,
					hideAllUI = false,
					disableSpaceFollow = false,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false
				}
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
						nodeId = 4,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 9,
						portId = "In"
					}
				},
				["3"] = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6204191,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				blackScreenIntervalTime = 2,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2.88
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				disablePresetLookAtVInput = true,
				dialogueIdVInput = 6204192,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				disableCamera = false,
				chatType = 6,
				blackScreenPlayType = 0,
				npcStaticId = -1,
				portCount = 1,
				skipTime = 0,
				blackScreenIntervalTime = 2,
				npcId = 400062,
				matchAudioDuration = true,
				duration = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 10
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
			kind = 10,
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
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				staticIdVInput = 91121158,
				targetEulerAngleVInput = {
					0,
					294.615,
					0
				},
				targetPositionVInput = {
					-137.565,
					100.001,
					757.951
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
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
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
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				staticIdVInput = 91578127,
				targetEulerAngleVInput = {
					0,
					305.318,
					0
				},
				targetPositionVInput = {
					-136.303,
					100.162,
					759.657
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
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
			kind = 16,
			inputs = {
				virtualEntityTypeVInput = 2,
				slotParamVInput = 5160049,
				positionVInput = {
					-139.712,
					100.003,
					751.999
				},
				rotationVInput = {
					0,
					266.832,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -2147365953
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				maxLimitTimeVInput = 10,
				speedVInput = 1.25,
				staticIdVInput = -2147365953,
				targetEulerAngleVInput = {
					0,
					232.048,
					0
				},
				targetPositionVInput = {
					-163.992,
					102.347,
					748.238
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							time = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 0,
							outTangent = 1,
							inTangent = 0
						},
						{
							time = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							value = 1,
							outTangent = 0,
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
						nodeId = 12,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				staticIdVInput = -2147365953
			},
			flowIn = {
				In = 0
			}
		}
	}
}
