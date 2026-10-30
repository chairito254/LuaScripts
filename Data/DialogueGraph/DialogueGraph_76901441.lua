-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76901441.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 76901441,
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
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					toplogoComList = {
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
						vlog = true,
						teamSpeech = true,
						quest = true,
						photo = true
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
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					64.34,
					0
				},
				targetPositionVInput = {
					-846.833,
					140.612,
					1348.679
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
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
			kind = 5,
			inputs = {
				playableStateVInput = "IdleSpecial",
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				templateId = 1016100,
				processingTime = 3.583,
				playAniType = 1,
				isLooping = false,
				entityType = 1
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
			kind = 5,
			inputs = {
				speedVInput = 0.75,
				playableStateVInput = "SprintLoop",
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				templateId = 1016100,
				processingTime = 0.333,
				playAniType = 1,
				isLooping = false,
				entityType = 1
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
			kind = 5,
			inputs = {
				speedVInput = 0.75,
				playableStateVInput = "JumpInRun",
				applyRootMotionVInput = true
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				templateId = 1016100,
				processingTime = 0.667,
				playAniType = 1,
				isLooping = false,
				entityType = 1
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
						nodeId = 8
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
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
						nodeId = 13
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 10
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendTimeVInput = 0.75,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-842.789,
					143.307,
					1350.265
				},
				rotationVInput = {
					78.037,
					69.443,
					0
				}
			},
			fields = {
				focalDistance = 0,
				fStop = 4,
				cameraId = 80361830,
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.1
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
			kind = 21,
			inputs = {
				blendTimeVInput = 0.9
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
			kind = 4,
			fields = {
				delayTime = 0.5
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
			kind = 36,
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.2
			},
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
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					64.34,
					0
				},
				targetPositionVInput = {
					-842.084,
					142.862,
					1350.628
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 18
				}
			},
			fields = {
				setRotation = true,
				setPosition = true,
				reset = false
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				speedVInput = 0.75,
				playableStateVInput = "FallLoop",
				applyRootMotionVInput = true
			},
			fields = {
				templateId = 1016100,
				processingTime = 0.667,
				playAniType = 1,
				isLooping = false,
				entityType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 9,
			fields = {
				entityType = 1
			}
		}
	}
}
