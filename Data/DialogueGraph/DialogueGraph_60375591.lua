-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_60375591.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 60375591,
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
				clearEventInputVInput = true,
				blockEventVInput = true,
				startSkipVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				enhanceAmbientIntensityVInput = true
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
			kind = 24,
			inputs = {
				switchToPlayerVInput = true
			},
			flowIn = {
				In = true
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
			kind = 13,
			valueIn = {
				npcIdVInput = {
					portId = "EntityID",
					nodeId = 63
				}
			},
			fields = {
				enableDefaultLookAt = true,
				resetOrientation = true,
				enableGroupLookAt = true
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701521
			},
			fields = {
				portCount = 2,
				duration = 4,
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 62
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 6
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701523
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701524
			},
			fields = {
				anim = "Talk",
				duration = 7
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
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701525
			},
			fields = {
				anim = "Emotion_Think",
				duration = 6
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
			kind = 7,
			fields = {
				dialogueId = 3701526
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701527
			},
			fields = {
				anim = "Emotion_Excited",
				duration = 7
			},
			flowIn = {
				In = true
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
			kind = 7,
			fields = {
				dialogueId = 3701528
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701529
			},
			fields = {
				anim = "Talk",
				duration = 11
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 13
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
						nodeId = 55
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701530
			},
			fields = {
				anim = "Talk",
				skipTime = 4,
				duration = 8
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701531
			},
			fields = {
				anim = "Talk",
				skipTime = 3,
				duration = 9
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 16
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701532
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "1",
						nodeId = 17
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
				["0"] = true,
				["1"] = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 18
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
						nodeId = 19
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 20
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701533
			},
			fields = {
				duration = 4,
				portCount = 3,
				anim = "Talk",
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 49
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 21
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 52
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701535
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701539
			},
			fields = {
				anim = "Talk",
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 23
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701540
			},
			fields = {
				anim = "Talk",
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 24
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701541
			},
			fields = {
				anim = "Talk",
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701542
			},
			flowIn = {
				In = true
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
				dialogueIdVInput = 3701543
			},
			fields = {
				anim = "Emotion_Anxious",
				duration = 8
			},
			flowIn = {
				In = true
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
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701544
			},
			fields = {
				anim = "Emotion_Firm_Start",
				duration = 9
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "1",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 3
			},
			flowIn = {
				["0"] = true,
				["2"] = true,
				["1"] = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701533
			},
			fields = {
				duration = 4,
				portCount = 4,
				anim = "Ani_NPC_Avatar_Boy_Talk",
				chatType = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 46
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 39
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 35
					}
				},
				["3"] = {
					{
						portId = "In",
						nodeId = 30
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701536
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 31
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701545
			},
			fields = {
				anim = "Talk",
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 32
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701546
			},
			fields = {
				anim = "Emotion_Think",
				duration = 17
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 10,
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 34
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
						portId = "End",
						nodeId = 0
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701610
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701611
			},
			fields = {
				anim = "Talk",
				duration = 15
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 37
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701612
			},
			fields = {
				anim = "Talk",
				duration = 12
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "2",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 30,
			fields = {
				portCount = 3
			},
			flowIn = {
				["0"] = true,
				["2"] = true,
				["1"] = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 29
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701535
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 40
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701539
			},
			fields = {
				anim = "Talk",
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 41
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701540
			},
			fields = {
				anim = "Talk",
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 42
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701541
			},
			fields = {
				anim = "Talk",
				duration = 10
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 43
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701542
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 44
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701543
			},
			fields = {
				anim = "Emotion_Anxious",
				duration = 8
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 45
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701544
			},
			fields = {
				anim = "Emotion_Firm_Start",
				duration = 9
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "1",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701534
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 47
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701537
			},
			fields = {
				anim = "Talk",
				duration = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 48
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701538
			},
			fields = {
				anim = "Talk",
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "0",
						nodeId = 38
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701534
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 50
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701537
			},
			fields = {
				anim = "Talk",
				duration = 6
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 51
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701538
			},
			fields = {
				anim = "Talk",
				duration = 7
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "0",
						nodeId = 28
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701610
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 53
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701611
			},
			fields = {
				anim = "Talk",
				duration = 15
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 54
					}
				}
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 3701612
			},
			fields = {
				anim = "Talk",
				duration = 12
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "2",
						nodeId = 28
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
						portId = "In",
						nodeId = 56
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 60,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 2,
				positionVInput = {
					-1035.96,
					112.2,
					1276.92
				},
				rotationVInput = {
					24.05,
					352.5,
					0.01
				}
			},
			fields = {
				cameraId = 88244939,
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 57
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
						portId = "In",
						nodeId = 58
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 60,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 2,
				positionVInput = {
					-773.77,
					119.02,
					1202.25
				},
				rotationVInput = {
					10.98,
					340.12,
					0.01
				}
			},
			fields = {
				cameraId = 88245188,
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 59
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
						portId = "In",
						nodeId = 60
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 60,
				blendFuncVInput = "Cubic",
				blendExponentVInput = 2,
				positionVInput = {
					-872.946,
					104.538,
					1410.734
				},
				rotationVInput = {
					359.828,
					31.284,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 61
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
						portId = "0",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 7,
			fields = {
				dialogueId = 3701522
			},
			flowIn = {
				In = true
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
			kind = 9,
			inputs = {
				staticIdVInput = 62094681
			},
			fields = {
				entityType = 2
			}
		}
	}
}
