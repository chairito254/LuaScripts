-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\AI\\BehaviacAgent\\Unit\\AIAbility\\AIAreaData.lua

local AIAreaData = {
	PetFollowSpeedUpArea = {
		movementStrategyType = "SpeedUp",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 2,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 20,
				maxDist = 4.5
			},
			{
				minDist = 2,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -20,
				maxDist = 4.5
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	},
	PetFollowSlowDownArea = {
		movementStrategyType = "SlowDown",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 0.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 20,
				maxDist = 4.5
			},
			{
				minDist = 0.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -20,
				maxDist = 4.5
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	},
	PetFollowCameraNormalArea = {
		movementStrategyType = "FaceCameraSameMove",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 0.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 30,
				maxDist = 4.5
			},
			{
				minDist = 0.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -30,
				maxDist = 4.5
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	},
	PetFollowCameraChangeSpeedArea = {
		movementStrategyType = "FaceCameraChangeSpeedMove",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 2,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 30,
				maxDist = 4.5
			},
			{
				minDist = 2,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -30,
				maxDist = 4.5
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	},
	PetFollowNormalArea = {
		movementStrategyType = "Normal",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 0.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 20,
				maxDist = 4.5
			},
			{
				minDist = 0.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -20,
				maxDist = 4.5
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	},
	PetFollowMoveAwayArea = {
		movementStrategyType = "MoveAway",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 1.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 20,
				maxDist = 4
			},
			{
				minDist = 1.5,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -20,
				maxDist = 4
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	},
	NPCFollowNormalArea = {
		movementStrategyType = "Normal",
		areaSelectStrategyType = "FollowSelect",
		areaDataList = {
			{
				minDist = 1,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = 50,
				maxDist = 2.5
			},
			{
				minDist = 1,
				simpleNum = 4,
				areaDataType = "RelativeFocusPos",
				targetAngle = -50,
				maxDist = 2.5
			}
		},
		backupPosDataList = {
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = 0,
				maxDist = 1.5
			},
			{
				minDist = 0.5,
				simpleNum = 1,
				areaDataType = "RelativeFocusPos",
				targetAngle = -180,
				maxDist = 1.5
			}
		}
	}
}

return AIAreaData
