-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_82321943.lua

return {
	startNodeId = 1,
	dialogueId = 82321943,
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
					blockCameraZoom = true,
					hideTopLogo = false,
					hideMarkShare = true,
					hideInteractionSign = false,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2
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
			kind = 3,
			inputs = {
				blendTimeVInput = 1.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-546.154,
					157.548,
					1157.732
				},
				rotationVInput = {
					32.315,
					113.011,
					0.03
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 82447831,
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
						nodeId = 4,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 8
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
			kind = 34,
			inputs = {
				staticIdVInput = 89163775
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 34,
			inputs = {
				staticIdVInput = 89163776
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 7,
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
						nodeId = 8,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 15,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Love",
				duration = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 9,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 15,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1029100,
				processingTime = 2.667,
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
						nodeId = 10,
						portId = "0"
					}
				}
			}
		},
		{
			kind = 35,
			fields = {
				portCount = 2,
				maxAwaitTime = -1
			},
			flowIn = {
				["0"] = 0,
				["1"] = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 0.3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 12,
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
			kind = 29,
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				}
			},
			fields = {
				emojiName = "Love",
				duration = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 14,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Love"
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 16,
					portId = "EntityID"
				}
			},
			fields = {
				templateId = 1029100,
				processingTime = 2.667,
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
						nodeId = 10,
						portId = "1"
					}
				}
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 89163775
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 89163776
			},
			fields = {
				entityType = 2
			}
		}
	}
}
