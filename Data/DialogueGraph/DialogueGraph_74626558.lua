-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_74626558.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 74626558,
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
				hideTopLogoVInput = true,
				hideAllUIVInput = true,
				exitCatchModeVInput = false,
				blockPlayerMoveVInput = true,
				blockCameraZoomVInput = true
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
					vlog = true,
					teamSpeech = true,
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
						portId = "In",
						nodeId = 3
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 3
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
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 4
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 6,
				blendFuncVInput = "EaseOut",
				positionVInput = {
					-1778.191,
					29.811,
					1027.21
				},
				rotationVInput = {
					2.948,
					335.364,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626561,
				squeezeFactor = 1
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
			kind = 22,
			inputs = {
				blendVInput = 1.5
			},
			flowIn = {
				In = true
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
						nodeId = 35
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				fovVInput = 46,
				positionVInput = {
					-1772.909,
					40.473,
					1026.424
				},
				rotationVInput = {
					45.405,
					328.832,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626560,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
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
				fovVInput = 46,
				blendTimeVInput = 15,
				positionVInput = {
					-1769.186,
					45.568,
					1023.386
				},
				rotationVInput = {
					10.168,
					336.395,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626562,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 10
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
						nodeId = 11
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 1.5
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
						nodeId = 16
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
						nodeId = 15
					}
				}
			}
		},
		{
			kind = 23,
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				fovVInput = 46,
				positionVInput = {
					-1755.296,
					25.927,
					1097.079
				},
				rotationVInput = {
					359.854,
					261.28,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626564,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 27,
				positionVInput = {
					-1768.921,
					25.875,
					1105.725
				},
				rotationVInput = {
					357.104,
					246.67,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626566,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 18
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
						nodeId = 19
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 1.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
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
				delayTime = 2
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 21
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
						nodeId = 24
					}
				},
				["1"] = {
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
				delayTime = 1
			},
			flowIn = {
				In = true
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
			kind = 23,
			flowIn = {
				In = true
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				fovVInput = 46,
				positionVInput = {
					-1841.287,
					27.091,
					1085.023
				},
				rotationVInput = {
					359.511,
					326.769,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626567,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 25
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 31,
				positionVInput = {
					-1838.194,
					26.492,
					1057.143
				},
				rotationVInput = {
					352.979,
					4.928,
					0
				}
			},
			fields = {
				sensorWidth = 360,
				fStop = 4,
				cameraId = 74626569,
				squeezeFactor = 1
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						portId = "In",
						nodeId = 26
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
						nodeId = 27
					}
				}
			}
		},
		{
			kind = 22,
			inputs = {
				blendVInput = 1.6
			},
			flowIn = {
				In = true
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
						nodeId = 29
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
						nodeId = 32
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
				delayTime = 1
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
			kind = 23,
			flowIn = {
				In = true
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 0.5
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Out = {
					{
						portId = "In",
						nodeId = 33
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.9
			},
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
			kind = 10,
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
						nodeId = 36
					}
				}
			}
		},
		{
			kind = 23,
			flowIn = {
				In = true
			}
		},
		{
			kind = 5,
			inputs = {
				playStartLoopEndVInput = true,
				loopDurationVInput = 80
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 38
				}
			},
			fields = {
				templateId = 1001201,
				playAniType = 1,
				entityType = 1,
				aniStateList = {
					"Behav_SleepStart",
					"Behav_SleepLoop",
					"Behav_SleepEnd"
				}
			},
			flowIn = {
				In = true
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
