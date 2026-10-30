-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91323724.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91323724,
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
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = true,
					blockEvent = true,
					disableSpaceFollow = false,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					modeType = 2,
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
						battleRoom = true,
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
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 13,
			fields = {
				resetOrientation = true,
				reactPreset = 0,
				nodeMode = 0,
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				cameraPreset = 0
			},
			flowIn = {
				In = 0
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
						nodeId = 5
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
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
						nodeId = 7
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 29
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
						nodeId = 8
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
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 1.6,
				fovVInput = 60,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					108.182,
					143.006,
					763.684
				},
				rotationVInput = {
					18.943,
					183.264,
					0.003
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91323747,
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
						nodeId = 10
					}
				},
				Out = {
					{
						portId = "In",
						nodeId = 20
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
						portId = "In",
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendTimeVInput = 4,
				fovVInput = 60,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					110.766,
					143.943,
					771.842
				},
				rotationVInput = {
					21.35,
					179.174,
					0
				}
			},
			fields = {
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 91323799,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0
			},
			flowIn = {
				In = 0
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
			kind = 2,
			fields = {
				portCount = 8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 13
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 14
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
						nodeId = 16
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 17
					}
				},
				["5"] = {
					{
						portId = "In",
						nodeId = 18
					}
				},
				["6"] = {
					{
						portId = "In",
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324016
			},
			fields = {
				duration = 5,
				emojiName = "Happy2"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324019
			},
			fields = {
				duration = 5,
				emojiName = "Celebrate"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324021
			},
			fields = {
				duration = 5,
				emojiName = "Cheer"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324024
			},
			fields = {
				duration = 5,
				emojiName = "Cheer"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324026
			},
			fields = {
				duration = 5,
				emojiName = "Happy2"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324028
			},
			fields = {
				duration = 5,
				emojiName = "Happy2"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324030
			},
			fields = {
				duration = 5,
				emojiName = "Happy"
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
						portId = "In",
						nodeId = 21
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 29,
			inputs = {
				staticIdVInput = 91324009
			},
			fields = {
				duration = 3,
				emojiName = "Surprise"
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
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
				delayTime = 3
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
			kind = 29,
			inputs = {
				staticIdVInput = 91324009
			},
			fields = {
				duration = 5,
				emojiName = "Happy"
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 36,
			inputs = {
				retValueInput = 2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				fOutInput = {
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
				delayTime = 13
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 612000202,
				disablePresetLookAtVInput = true,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				npcStaticId = -1,
				skipTime = 0,
				duration = 4,
				npcId = -1,
				matchAudioDuration = true,
				disableCamera = false,
				chatType = 5,
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
						portId = "In",
						nodeId = 27
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
						portId = "In",
						nodeId = 28
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
			kind = 38,
			inputs = {
				entityIdVInput = 2,
				targetPositionVInput = {
					112.96,
					139.899,
					767.84
				}
			},
			fields = {
				finishToSteer = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 39,
			inputs = {
				fovBlendFuncVInput = "Linear"
			},
			valueIn = {
				faceToTargetVInput = {
					portId = "BoneTransform",
					nodeId = 31
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 91324786
			},
			fields = {
				entityType = 4
			}
		}
	}
}
