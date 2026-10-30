-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Data\\DialogueGraph\\DialogueGraph_72284867.lua

return {
	startNodeId = 1,
	dialogueId = 72284867,
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
				onSkipStartConnected = true,
				modeInfo = {
					hideInteractionSign = true,
					showHud = true,
					hideAllUI = true,
					disableSpaceFollow = true,
					applyStateConflict = true,
					pauseNearbyMonsterAI = false,
					enhanceAmbientIntensity = true,
					exitCatchMode = true,
					resetAllActions = true,
					blockEvent = true,
					modeType = 2,
					blockCameraZoom = true,
					hideTopLogo = true,
					hideMarkShare = true,
					toplogoComList = {
						teamSpeech = true,
						quest = true,
						photo = true,
						petFertility = true,
						petExchange = true,
						petChat = true,
						npc = true,
						multiPlayer = true,
						combat = true,
						chat = true,
						callFriends = true,
						bubble = false,
						alert = true,
						actionState = true,
						vlog = true
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				OnSkipStart = {
					{
						nodeId = 0,
						portId = "End"
					}
				},
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
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 4,
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
			kind = 58,
			flowIn = {
				In = 0
			},
			flowOut = {
				Finish = {
					{
						nodeId = 5,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "OutBag",
				staticIdVInput = 2
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 3,
				processingTime = 1,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.4
			},
			flowIn = {
				In = 0
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
			kind = 2,
			fields = {
				portCount = 3
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 40,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 8,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 41,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.45
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
			kind = 22,
			inputs = {
				blendVInput = 0.15
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 10,
						portId = "In"
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
						nodeId = 11,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				fovVInput = 36,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1689.183,
					94.336,
					757.542
				},
				rotationVInput = {
					17.407,
					126.431,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 73751593,
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
						nodeId = 12,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 13,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendExponentVInput = 0,
				blendTimeVInput = 6,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1688.688,
					93.32,
					757.114
				},
				rotationVInput = {
					2.8,
					124.39,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					nodeId = 43,
					portId = "BoneTransform"
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 73750003,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.2
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
			kind = 27,
			fields = {
				uid = 180
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 16,
						portId = "closeUIFInput"
					}
				},
				Out = {
					{
						nodeId = 15,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.8
			},
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
			kind = 27,
			fields = {
				uid = 180,
				param = {
					26022022,
					0,
					0,
					0,
					0,
					{
						-1686.22,
						93.55,
						754.59
					},
					{
						0,
						149.1,
						0
					},
					0,
					364
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 18,
						portId = "closeUIFInput"
					}
				},
				Out = {
					{
						nodeId = 17,
						portId = "In"
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
						nodeId = 18,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 180,
				param = {
					26022023,
					0,
					0,
					0,
					0,
					{
						-1685.11,
						92.83,
						756.17
					},
					{
						0,
						95.1,
						0
					},
					0,
					0
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 19,
						portId = "closeUIFInput"
					}
				},
				Out = {
					{
						nodeId = 35,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 27,
			fields = {
				uid = 180,
				param = {
					260220230,
					0,
					0,
					1,
					0,
					{
						-1686.24,
						93.28,
						755.09
					},
					{
						0,
						141.4,
						0
					},
					0,
					0
				}
			},
			flowIn = {
				In = 0,
				closeUIFInput = 1
			},
			flowOut = {
				CloseOut = {
					{
						nodeId = 21,
						portId = "In"
					}
				},
				Out = {
					{
						nodeId = 20,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 2.8
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 14,
						portId = "closeUIFInput"
					}
				}
			}
		},
		{
			kind = 22,
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 22,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 2,
			fields = {
				portCount = 4
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				["0"] = {
					{
						nodeId = 33,
						portId = "Play"
					}
				},
				["1"] = {
					{
						nodeId = 23,
						portId = "In"
					}
				},
				["2"] = {
					{
						nodeId = 34,
						portId = "In"
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
						nodeId = 24,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 32,
			fields = {
				eventName = "showPhoto",
				eventParam = {
					[1] = "$UI_Img_ItemView_1004100.png",
					[2] = {
						1004100
					}
				}
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 25,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 23,
			inputs = {
				blendOutTimeVInput = 0.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 26,
						portId = "In"
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
						nodeId = 27,
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
						nodeId = 30,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 28,
						portId = "In"
					}
				}
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
						nodeId = 29,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 5,
			inputs = {
				playableStateVInput = "IntoBag",
				staticIdVInput = 2
			},
			fields = {
				isLooping = false,
				entityType = 0,
				templateId = 3,
				processingTime = 1,
				playAniType = 1
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 21,
			inputs = {
				blendTimeVInput = 1.6
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 31,
						portId = "In"
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
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 32,
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
			kind = 31,
			inputs = {
				audioEventVInput = "ui_photo_shutter"
			},
			fields = {
				enableFadeOut = false,
				enableFadeIn = false,
				fadeOutTime = 0,
				fadeInTime = 0
			},
			flowIn = {
				Play = 0
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "Cubic",
				blendExponentVInput = 0,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1688.688,
					93.32,
					757.114
				},
				rotationVInput = {
					2.8,
					124.39,
					0
				}
			},
			valueIn = {
				dofTargetVInput = {
					nodeId = 44,
					portId = "BoneTransform"
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 91285011,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = true
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.2
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 36,
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
						nodeId = 38,
						portId = "In"
					}
				},
				["1"] = {
					{
						nodeId = 37,
						portId = "In"
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
			kind = 46,
			fields = {
				volumeComponentCount = 1,
				volumeComponents = {
					{
						active = false,
						typeName = "GlitchComponent",
						parameters = {
							m_GlitchSeed = {
								overrideState = true,
								valueType = "vector3",
								value = {
									z = 1.2,
									y = 1.5,
									x = 0.5
								}
							},
							m_GlitchStrength = {
								overrideState = true,
								value = 2,
								valueType = "float"
							},
							m_GlitchSpeed = {
								overrideState = true,
								value = 8,
								valueType = "float"
							},
							m_JitterSpeed = {
								overrideState = true,
								value = 2,
								valueType = "float"
							},
							m_GlitchDirectionStrength = {
								overrideState = true,
								valueType = "vector2",
								value = {
									y = -0.25,
									x = 1
								}
							},
							m_GlitchBlockNum = {
								overrideState = true,
								valueType = "vector4",
								value = {
									w = 30,
									z = 11,
									y = 12,
									x = 8
								}
							},
							m_GlitchBlockClip = {
								overrideState = true,
								value = 0.7,
								valueType = "float"
							},
							m_RGBSPlit = {
								overrideState = true,
								valueType = "vector3",
								value = {
									z = 0.2,
									y = 0.1,
									x = 1
								}
							},
							m_GhostFactor = {
								overrideState = true,
								value = 0.8,
								valueType = "float"
							},
							m_Noisy_Tilling = {
								overrideState = true,
								valueType = "vector2",
								value = {
									y = 0.7,
									x = 0.04
								}
							},
							m_NoisyOffset = {
								overrideState = true,
								value = 0,
								valueType = "float"
							}
						}
					}
				}
			},
			flowIn = {
				In = 0,
				Stop = 1
			},
			flowOut = {
				Out = {
					{
						nodeId = 39,
						portId = "In"
					}
				}
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 1.5
			},
			flowIn = {
				In = 0
			},
			flowOut = {
				Out = {
					{
						nodeId = 38,
						portId = "Stop"
					}
				}
			}
		},
		{
			kind = 3,
			inputs = {
				blendFuncVInput = "EaseOut",
				blendExponentVInput = 0,
				blendTimeVInput = 18,
				fovVInput = 35,
				cameraMovementAxisVInput = {
					0,
					1,
					0
				},
				positionVInput = {
					-1689.09,
					94.336,
					757.922
				},
				rotationVInput = {
					15,
					155.7,
					0
				}
			},
			fields = {
				focalDistance = 200,
				fStop = 4,
				cameraId = 73721531,
				visualizeDOF = false,
				squeezeFactor = 1,
				sensorWidth = 360,
				recombineQuality = 0,
				openDof = false
			},
			flowIn = {
				In = 0
			}
		},
		{
			kind = 4,
			fields = {
				delayTime = 0.6
			},
			flowIn = {
				In = 0
			}
		},
		[43] = {
			kind = 17,
			inputs = {
				staticIdVInput = 72462615
			},
			fields = {
				entityType = 2
			}
		},
		[44] = {
			kind = 17,
			inputs = {
				staticIdVInput = 72462615
			},
			fields = {
				entityType = 2
			}
		}
	}
}
