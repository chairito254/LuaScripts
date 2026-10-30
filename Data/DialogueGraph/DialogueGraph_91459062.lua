-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91459062.lua

return {
	dialogueId = 91459062,
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
						portId = "In",
						nodeId = 4
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 15
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 14
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
						portId = "In",
						nodeId = 18
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 1,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-12.383,
					43.78,
					121.979
				},
				rotationVInput = {
					357.25,
					1.375,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91459065,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 6.7,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-11.802,
					44.749,
					143.26
				},
				rotationVInput = {
					356.218,
					0.344,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91459103,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 6
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
						nodeId = 7
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 8
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
						portId = "In",
						nodeId = 9
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["3"] = {
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
				dialogueIdVInput = 6204596,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcId = 400062,
				matchAudioDuration = true,
				duration = 8.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 1,
				npcStaticId = -1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 10
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				maxLimitTimeVInput = 10,
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					0.231,
					0
				},
				targetPositionVInput = {
					-10.278,
					40.153,
					142.751
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
							inWeight = 0,
							value = 0,
							inTangent = 0,
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							value = 1,
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
				maxLimitTimeVInput = 10,
				staticIdVInput = -348115257,
				targetEulerAngleVInput = {
					0,
					4.009,
					0
				},
				targetPositionVInput = {
					-9.387,
					40.153,
					143.157
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
							inWeight = 0,
							value = 0,
							inTangent = 0,
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							value = 1,
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
				staticIdVInput = 91289820,
				targetEulerAngleVInput = {
					0,
					0.642,
					0
				},
				targetPositionVInput = {
					-17.385,
					40.153,
					152.388
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
							inWeight = 0,
							value = 0,
							inTangent = 0,
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							value = 1,
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
				staticIdVInput = 2,
				targetEulerAngleVInput = {
					0,
					357.416,
					0
				},
				targetPositionVInput = {
					-9.89,
					40.153,
					134.293
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
							inWeight = 0,
							value = 0,
							inTangent = 0,
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							value = 1,
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
				slotParamVInput = 5160004,
				virtualEntityTypeVInput = 2,
				positionVInput = {
					-8.112,
					40.153,
					123.725
				},
				rotationVInput = {
					0,
					357.506,
					0
				}
			},
			fields = {
				ignoreGravity = false,
				entityId = -348115257
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
				staticIdVInput = -348115257,
				targetEulerAngleVInput = {
					0,
					6.95,
					0
				},
				targetPositionVInput = {
					-8.638,
					40.153,
					136.682
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
							inWeight = 0,
							value = 0,
							inTangent = 0,
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							value = 1,
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 1
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
				staticIdVInput = 91289820,
				targetEulerAngleVInput = {
					0,
					358.25,
					0
				},
				targetPositionVInput = {
					-14.9,
					40.153,
					135.655
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
							inWeight = 0,
							value = 0,
							inTangent = 0,
							outTangent = 1,
							outWeight = 0,
							weightedMode = 0,
							time = 0
						},
						{
							inWeight = 0,
							value = 1,
							inTangent = 1,
							outTangent = 0,
							outWeight = 0,
							weightedMode = 0,
							time = 1
						}
					}
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
					359.689,
					0
				},
				targetPositionVInput = {
					-10.73,
					40.153,
					119.037
				}
			},
			fields = {
				setRotation = false,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			}
		}
	}
}
