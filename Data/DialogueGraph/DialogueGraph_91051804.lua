-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91051804.lua

return {
	startNodeId = 1,
	dialogueId = 91051804,
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
					hideInteractionSign = false,
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
						nodeId = 10,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 301218,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				anim = "Behav_Alert",
				portCount = 1,
				skipTime = 0,
				npcStaticId = 91051610,
				npcId = 201834,
				matchAudioDuration = true,
				duration = 2.62,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2,
				animCfg = {
					[1] = "Behav_Alert",
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
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 301219,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				portCount = 1,
				skipTime = 0,
				npcStaticId = -1,
				npcId = 0,
				matchAudioDuration = true,
				duration = 2,
				disableCamera = false,
				chatType = 3,
				blackScreenPlayType = 0,
				blackScreenIntervalTime = 2
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
						nodeId = 9,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 7,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 8,
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
			kind = 20,
			inputs = {
				durationVInput = 2
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 11,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-11.016,
					104.224,
					700.919
				},
				rotationVInput = {
					62.774,
					123.93,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91086642,
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
			kind = 17,
			inputs = {
				staticIdVInput = 91051610
			},
			fields = {
				entityType = 2
			}
		}
	}
}
