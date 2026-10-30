-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_91430674.lua

return {
	schema = 1,
	startNodeId = 1,
	dialogueId = 91430674,
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
						nodeId = 3,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 6,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				cameraMovementTypeVInput = 2,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1583.17,
					88.95,
					830.709
				},
				rotationVInput = {
					0.07,
					77.461,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					nodeId = 7,
					portId = "BoneTransform"
				}
			},
			fields = {
				fStop = 8,
				cameraId = 91460906,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 310
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 5,
						portId = "In"
					}
				},
				Out = {
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
				delayTime = 125
			},
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
			kind = 3,
			inputs = {
				blendTimeVInput = 30,
				fovVInput = 30,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1583.2,
					88.95,
					830.996
				},
				rotationVInput = {
					0.07,
					87,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					nodeId = 7,
					portId = "BoneTransform"
				}
			},
			fields = {
				fStop = 4,
				cameraId = 91460915,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false,
				focalDistance = 200
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 14,
			inputs = {
				targetEulerAngleVInput = {
					0,
					109.715,
					0
				},
				targetPositionVInput = {
					-1581.781,
					87.582,
					831.237
				}
			},
			valueIn = {
				entityIdVInput = {
					nodeId = 8,
					portId = "EntityID"
				}
			},
			fields = {
				setPosition = true,
				reset = false,
				setRotation = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 17,
			inputs = {
				boneNameVInput = "Bip001 Head",
				staticIdVInput = 52417422
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			fields = {
				entityType = 0
			}
		}
	}
}
