-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_82331459.lua

return {
	dialogueId = 82331459,
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
				onSkipStartConnected = true,
				modeInfo = {
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
					applyStateConflict = true,
					toplogoComList = {
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = true,
						alert = true,
						teamSpeech = true,
						vlog = true,
						actionState = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true
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
						nodeId = 7
					}
				},
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
				portCount = 6
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
						nodeId = 6
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 10
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["4"] = {
					{
						portId = "In",
						nodeId = 13
					}
				},
				["5"] = {
					{
						portId = "Play",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 52,
				blendTimeVInput = 4.2,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1531.149,
					78.6,
					805.466
				},
				rotationVInput = {
					352.5,
					83.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 86220808
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
				fovVInput = 54,
				blendTimeVInput = 5.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1531.492,
					78.5,
					805.116
				},
				rotationVInput = {
					346,
					85.2,
					-0.001
				}
			},
			fields = {
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200,
				fStop = 4,
				cameraId = 86221087
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 8.5
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
						nodeId = 8
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 2.5
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 15,
			inputs = {
				lookAtEntityStaticIdVInput = 87051351,
				staticIdVInput = 2
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
			kind = 5,
			inputs = {
				staticIdVInput = 2,
				playableStateVInput = "Story_TouchHigh_Start",
				playStartLoopEndVInput = true,
				speedVInput = 1.2
			},
			fields = {
				processingTime = 0,
				playAniType = 1,
				isLooping = false,
				entityType = 0,
				templateId = 301,
				aniStateList = {
					"Story_TouchHigh_Start",
					"Story_TouchHigh_Loop",
					"Story_TouchHigh_End"
				}
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 38,
			inputs = {
				maxLimitTimeVInput = 20,
				entityIdVInput = 88261159,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					109.9,
					0
				},
				targetPositionVInput = {
					-1522.039,
					76.787,
					805.932
				}
			},
			fields = {
				finishToSteer = true
			},
			flowIn = {
				In = 0
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
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 20,
			inputs = {
				durationVInput = 1.25,
				staticIdVInput = 88261159
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 31,
			inputs = {
				audioEventVInput = "BGM_FirstActiveTeleportflowe"
			},
			fields = {
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
			}
		}
	}
}
