-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_73784258.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 73784258,
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
			kind = 20,
			inputs = {
				durationVInput = 0.25,
				staticIdVInput = 1
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
			kind = 20,
			inputs = {
				durationVInput = 0.25,
				staticIdVInput = 2
			},
			flowIn = {
				In = 0
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
			kind = 11,
			fields = {
				modeInfo = {
					hideAllUI = false,
					disableSpaceFollow = true,
					applyStateConflict = false,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = false,
					exitCatchMode = false,
					resetAllActions = false,
					blockEvent = false,
					modeType = 0,
					blockCameraZoom = false,
					hideTopLogo = false,
					hideMarkShare = false,
					hideInteractionSign = false,
					showHud = false
				}
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
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 0.5,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-0.004,
					0.75,
					-4.767
				},
				rotationVInput = {
					358.633,
					5.102,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 0,
				fStop = 4,
				cameraId = 0,
				visualizeDOF = false,
				squeezeFactor = 1
			},
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 70003008,
				dialogsetCameraMovementAxisVInput = {
					0,
					1,
					0
				}
			},
			fields = {
				skipTime = 0,
				portCount = 3,
				npcStaticId = -1,
				npcId = 890025,
				matchAudioDuration = true,
				duration = 3,
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
						nodeId = 7,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 14,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 17,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 70003009
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
			kind = 12,
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
			kind = 40,
			inputs = {
				guideIdVInput = 305160
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Start = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 21,
			flowIn = {
				In = 0
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
			kind = 20,
			inputs = {
				durationVInput = 0.1,
				isFadeInVInput = true,
				staticIdVInput = 2
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
			kind = 20,
			inputs = {
				durationVInput = 0.1,
				isFadeInVInput = true,
				staticIdVInput = 1
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 13,
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
			kind = 7,
			fields = {
				dialogueId = 70003010
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 15,
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
						nodeId = 16,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 40,
			inputs = {
				guideIdVInput = 305170
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Start = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 70003011
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 18,
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
						nodeId = 19,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 40,
			inputs = {
				guideIdVInput = 305180
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Start = {
					{
						nodeId = 10,
						portId = "In"
					}
				}
			}
		}
	}
}
