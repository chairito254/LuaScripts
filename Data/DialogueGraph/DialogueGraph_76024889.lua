-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_76024889.lua

return {
	dialogueId = 76024889,
	schema = "v4",
	startNodeId = 1,
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
						nodeId = 2,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				hideAllUIVInput = true,
				hideTopLogoVInput = true
			},
			fields = {
				topLogoComs = {
					npc = true,
					multiPlayer = true,
					combat = true,
					chat = true,
					callFriends = true,
					bubble = true,
					alert = true,
					teamSpeech = true,
					vlog = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true
				}
			},
			flowIn = {
				In = true
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
			kind = 3,
			inputs = {
				fovVInput = 40,
				blendTimeVInput = 2,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-1538.554,
					78.189,
					941.566
				},
				rotationVInput = {
					39.328,
					57.062,
					-0.002
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 76137452
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 14,
			inputs = {
				targetPositionVInput = {
					-1542.22,
					75.063,
					943.94
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
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
			kind = 38,
			inputs = {
				speedVInput = 0.8,
				moveTypeVInput = 2,
				autoPathfindingVInput = true,
				targetEulerAngleVInput = {
					0,
					68.73,
					0
				},
				targetPositionVInput = {
					-1535.45,
					75.01,
					943.11
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				FinishOut = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 10,
				playableStateVInput = "Behav_SleepStart"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 9,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 11001100,
				processingTime = 1.25,
				playAniType = 1,
				entityType = 2,
				aniStateList = {
					"Behav_SleepStart",
					"Behav_SleepLoop",
					"Behav_SleepEnd"
				}
			},
			flowIn = {
				In = true
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
			kind = 4,
			fields = {
				delayTime = 2
			},
			flowIn = {
				In = true
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
			kind = 27,
			fields = {
				uid = 121,
				param = {
					[1] = 5603001
				}
			},
			flowIn = {
				In = true
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 0,
						portId = "End"
					}
				}
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 75436262
			},
			fields = {
				entityType = 2
			}
		}
	}
}
