-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_90653830.lua

return {
	startNodeId = 1,
	dialogueId = 90653830,
	schema = "v4",
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
						portId = "In",
						nodeId = 2
					}
				}
			}
		},
		{
			kind = 18,
			inputs = {
				startSkipVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				blockCameraZoomVInput = true,
				applyStateConflictVInput = true
			},
			fields = {
				topLogoComs = {
					petChat = true,
					npc = true,
					multiPlayer = true,
					combat = true,
					bubble = true,
					alert = true,
					chat = true,
					callFriends = true,
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true
				}
			},
			flowIn = {
				In = true
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
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 15
				}
			},
			fields = {
				enableGroupLookAt = true,
				enableDefaultLookAt = true,
				resetOrientation = true,
				reactPreset = 3
			},
			flowIn = {
				In = true
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
				portCount = 6
			},
			flowIn = {
				In = true
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
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Talk_Crossingarms",
				fadeDurationVInput = 0
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 16
				}
			},
			fields = {
				templateId = 400079,
				processingTime = 5.867,
				playAniType = 1,
				entityType = 2
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 30,
				blendFuncVInput = "EaseInOut",
				blendExponentVInput = 2,
				positionVInput = {
					-1583.42,
					89.015,
					831.406
				},
				rotationVInput = {
					1.863,
					90.993,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 255,
				fStop = 10.18
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					98.213,
					0
				},
				targetPositionVInput = {
					-1582.04,
					87.582,
					831.738
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 17
				}
			},
			fields = {
				setPosition = true,
				setRotation = true
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6701351
			},
			fields = {
				npcId = 400079,
				duration = 10,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 9
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 6701352
			},
			fields = {
				npcId = 400079,
				duration = 3,
				chatType = 3
			},
			flowIn = {
				In = true
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
			kind = 12,
			flowIn = {
				In = true
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
			kind = 2,
			fields = {
				portCount = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 12
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 14
					}
				}
			}
		},
		{
			kind = 10,
			inputs = {
				endSkipVInput = true,
				showAllUIVInput = false
			},
			flowIn = {
				In = true
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
			kind = 4,
			fields = {
				delayTime = 1
			},
			flowIn = {
				In = true
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
			kind = 21,
			flowIn = {
				In = true
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 52417422
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 52417422
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17
		}
	}
}
