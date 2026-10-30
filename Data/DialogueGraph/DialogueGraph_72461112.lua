-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72461112.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 72461112,
	nodes = {
		[0] = {
			kind = 6,
			fields = {
				retFlag = 1
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
			kind = 34,
			valueIn = {
				staticIdVInput = {
					portId = "Value",
					nodeId = 17
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
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
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = true,
					enhanceAmbientIntensity = true,
					toplogoComList = {
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						actionState = true,
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true
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
						nodeId = 11
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
						portId = "In",
						nodeId = 5
					}
				}
			}
		},
		{
			kind = 16,
			inputs = {
				slotParamVInput = 401002,
				virtualEntityTypeVInput = 2
			},
			valueIn = {
				positionVInput = {
					portId = "Value",
					nodeId = 18
				},
				rotationVInput = {
					portId = "Value",
					nodeId = 19
				}
			},
			fields = {
				entityId = -1304919010,
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
				moveTypeVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 5
				},
				targetEulerAngleVInput = {
					portId = "Value",
					nodeId = 23
				},
				targetPositionVInput = {
					portId = "Value",
					nodeId = 22
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
						portId = "1",
						nodeId = 8
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 7
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
						portId = "0",
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 2,
				executeOnce = false
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
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
						portId = "In",
						nodeId = 10
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				fOutInput = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				isFadeInVInput = true,
				durationVInput = 0,
				isResetValueInput = true
			},
			valueIn = {
				staticIdVInput = {
					portId = "Value",
					nodeId = 24
				}
			},
			flowIn = {
				In = 0
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
			kind = 23,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 14
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
						portId = "End",
						nodeId = 0
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
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 60,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				positionVInput = {
					portId = "Value",
					nodeId = 20
				},
				rotationVInput = {
					portId = "Value",
					nodeId = 21
				}
			},
			fields = {
				cameraId = 72461278,
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
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "BeSavedID"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "StartPos"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "StartRot"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "CameraPos"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "CameraRot"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "TargetPos"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "TargetRot"
			}
		},
		{
			kind = 44,
			fields = {
				variableName = "BeSavedID"
			}
		}
	},
	blackboard = {
		BeSavedID = 0,
		CameraPos = {
			0,
			0,
			0
		},
		CameraRot = {
			0,
			0,
			0
		},
		PlayerPos = {
			0,
			0,
			0
		},
		PlayerRot = {
			0,
			0,
			0
		},
		StartPos = {
			0,
			0,
			0
		},
		StartRot = {
			0,
			0,
			0
		},
		TargetPos = {
			0,
			0,
			0
		},
		TargetRot = {
			0,
			0,
			0
		}
	}
}
