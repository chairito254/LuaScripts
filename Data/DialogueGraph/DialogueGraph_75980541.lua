-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_75980541.lua

return {
	schema = "v4",
	startNodeId = 1,
	dialogueId = 75980541,
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
				enhanceAmbientIntensityVInput = true,
				clearEventInputVInput = true,
				blockPlayerMoveVInput = true,
				blockEventVInput = true,
				blockCameraZoomVInput = true,
				showHUDVInput = true,
				hideTopLogoVInput = true,
				hideAllUIVInput = true
			},
			fields = {
				topLogoComs = {
					callFriends = true,
					bubble = true,
					alert = true,
					vlog = true,
					teamSpeech = true,
					quest = true,
					photo = true,
					petFertility = true,
					petExchange = true,
					petChat = true,
					npc = true,
					multiPlayer = true,
					combat = true,
					chat = true
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
						nodeId = 6,
						portId = "In"
					}
				},
				["1"] = {
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
				delayTime = 5
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
			kind = 4,
			fields = {
				delayTime = 8
			},
			flowIn = {
				In = true
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
				fovVInput = 46,
				blendTimeVInput = 3,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					59.179,
					0.468,
					20.652
				},
				rotationVInput = {
					344.895,
					74.478,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					nodeId = 11,
					portId = "BoneTransform"
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 3086,
				fStop = 4,
				cameraId = 76005254
			},
			flowIn = {
				In = true
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
						nodeId = 8,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				fovVInput = 46,
				blendTimeVInput = 3,
				blendFuncVInput = "EaseInOut",
				positionVInput = {
					59.179,
					0.468,
					20.652
				},
				rotationVInput = {
					344.895,
					74.478,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					nodeId = 12,
					portId = "BoneTransform"
				}
			},
			fields = {
				squeezeFactor = 1,
				sensorWidth = 360,
				openDof = true,
				focalDistance = 1,
				fStop = 4,
				cameraId = 76007616
			},
			flowIn = {
				In = true
			},
			flowOut = {
				Finish = {
					{
						nodeId = 9,
						portId = "In"
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
			}
		},
		{
			kind = 46,
			fields = {
				volumeParamInfoCount = 1,
				volumeComponentCount = 1,
				volumeComponents = {
					{
						typeName = "DiaphragmDepthOfFieldComponent",
						active = false,
						parameters = {
							m_FocalDistance = {
								valueType = "float",
								overrideState = true,
								value = 1
							},
							m_FStop = {
								valueType = "float",
								overrideState = true,
								value = 1
							},
							m_SensorWidth = {
								valueType = "float",
								overrideState = true,
								value = 24.576
							},
							m_SqueezeFactor = {
								valueType = "float",
								overrideState = true,
								value = 1
							},
							m_DepthBlurAmount = {
								valueType = "float",
								overrideState = true,
								value = 1
							},
							m_DepthBlurRadius = {
								valueType = "float",
								overrideState = true,
								value = 0
							},
							m_RecombineQuality = {
								valueType = "int",
								overrideState = true,
								value = 0
							},
							m_SmoothGather = {
								valueType = "bool",
								overrideState = false,
								value = false
							},
							m_VisualizeDOF = {
								valueType = "bool",
								overrideState = true,
								value = false
							}
						}
					}
				},
				volumeParamInfo = {
					{
						volumeTypeName = "DiaphragmDepthOfFieldComponent",
						params = {
							{
								name = "Focal Distance",
								paramIndex = 0
							}
						}
					}
				}
			},
			dynamicInputs = {
				"0"
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 75188143
			},
			fields = {
				entityType = 2
			}
		},
		{
			kind = 17,
			inputs = {
				staticIdVInput = 75315139
			},
			fields = {
				entityType = 2
			}
		}
	}
}
