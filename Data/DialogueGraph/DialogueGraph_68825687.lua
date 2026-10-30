-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_68825687.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 68825687,
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
				hideAllUIVInput = true,
				blockEventVInput = true,
				hideTopLogoVInput = true
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
				portCount = 2
			},
			flowIn = {
				In = true
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
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				fovVInput = 42,
				positionVInput = {
					-693.43,
					103.103,
					588.766
				},
				rotationVInput = {
					340.749,
					261.612,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 68825781
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
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendTimeVInput = 12,
				fovVInput = 30,
				positionVInput = {
					-693.894,
					103.328,
					588.7
				},
				rotationVInput = {
					338.686,
					259.55,
					0
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				focalDistance = 200,
				fStop = 4,
				cameraId = 68825781
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 15,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				},
				lookAtEntityIdVInput = {
					portId = "EntityID",
					nodeId = 23
				}
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
			kind = 5,
			inputs = {
				playableStateVInput = "Behav_Angry"
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				templateId = 500042,
				playAniType = 1,
				entityType = 2
			},
			flowIn = {
				In = true
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
						nodeId = 9
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
						nodeId = 10
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 11
					}
				},
				["2"] = {
					{
						portId = "In",
						nodeId = 12
					}
				}
			}
		},
		{
			kind = 29,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				emojiName = "Furious",
				duration = 5
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 1,
			inputs = {
				dialogueIdVInput = 2605168
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				duration = 4,
				chatType = 1
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
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
				portCount = 3
			},
			flowIn = {
				In = true
			},
			flowOut = {
				["0"] = {
					{
						portId = "In",
						nodeId = 14
					}
				},
				["1"] = {
					{
						portId = "In",
						nodeId = 17
					}
				}
			}
		},
		{
			kind = 19,
			inputs = {
				moveTypeVInput = 2,
				targetPositionVInput = {
					-716.635,
					100.613,
					579.647
				}
			},
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			fields = {
				speedCurve = {
					postWrapMode = 8,
					preWrapMode = 8,
					keys = {
						{
							weightedMode = 0,
							outWeight = 0,
							time = 0,
							inWeight = 0,
							outTangent = 1,
							inTangent = 0,
							value = 0
						},
						{
							weightedMode = 0,
							outWeight = 0,
							time = 1,
							inWeight = 0,
							outTangent = 0,
							inTangent = 1,
							value = 1
						}
					}
				}
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
			kind = 4,
			fields = {
				delayTime = 1.4
			},
			flowIn = {
				In = true
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
			kind = 20,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				}
			},
			flowIn = {
				In = true
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 3
			},
			flowIn = {
				In = true
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
			kind = 10,
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
			kind = 21,
			inputs = {
				blendTimeVInput = 2.2
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
			kind = 9,
			inputs = {
				staticIdVInput = 68825372
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 26,
			valueIn = {
				entityIdVInput = {
					portId = "EntityID",
					nodeId = 20
				},
				faceTransVInput = {
					portId = "BoneTransform",
					nodeId = 22
				}
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head"
			}
		},
		{
			kind = 9,
			inputs = {
				staticIdVInput = 68825372
			}
		}
	}
}
