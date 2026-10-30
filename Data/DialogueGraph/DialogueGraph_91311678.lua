-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91311678.lua

return {
	startNodeId = 1,
	schema = 1,
	dialogueId = 91311678,
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
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					toplogoComList = {
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
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true
					}
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 1040179,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				skipTime = 0,
				portCount = 3,
				npcStaticId = 91279964,
				npcId = -1,
				matchAudioDuration = true,
				duration = 6.62,
				disableCamera = false,
				chatType = 3
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
						nodeId = 7,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 8,
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
				In = 0
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
			kind = 12,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 6,
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
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 1,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-952.299,
					125.967,
					452.713
				},
				rotationVInput = {
					11.896,
					235.313,
					0.001
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91585468,
				visualizeDOF = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetPositionVInput = {
					-948.89,
					119.23,
					459.1
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				finishToSteer = false,
				reset = false,
				speedCurve = {
					preWrapMode = 8,
					postWrapMode = 8,
					keys = {
						{
							inTangent = 0,
							value = 0,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							outTangent = 1
						},
						{
							inTangent = 1,
							value = 1,
							inWeight = 0,
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							outTangent = 0
						}
					}
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 91279964
			},
			fields = {
				entityType = 2
			}
		}
	}
}
