-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Data\\AICtrData\\aictr_condition_graph_data.lua

local data = {
	BCM_Budclaw_Check_Dis = {
		inPorts = {
			entityTag = ""
		},
		outPorts = {
			result = false
		}
	},
	BCM_Budclaw_Select_Target = {
		inPorts = {
			entityTag2 = "",
			entityTag1 = ""
		},
		outPorts = {
			entity2 = 0,
			entity1 = 0,
			result2 = false,
			result1 = false
		}
	},
	BCM_Common_CheckPER = {
		inPorts = {
			tActorId = 0
		},
		outPorts = {
			tPetNotCurrPet = false,
			tIsPuppet = false,
			tIsPlayerInterrupt = false,
			tIsPlayer = false
		}
	},
	BCM_Common_CheckVisionNormal = {
		inPorts = {
			targetActorId = 0
		},
		outPorts = {
			result = false
		}
	},
	BCM_Npc_GetRunningStatus = {
		inPorts = {
			behavName = "",
			status = 1,
			staticId = 0
		},
		outPorts = {
			resList = {}
		}
	},
	BCM_SelectEnvObjinDisbyEntityTag = {
		inPorts = {
			Distance = 0,
			TargetId = 0,
			EntityTag = ""
		},
		outPorts = {
			HasEntity = false,
			Actorid = 0
		}
	}
}

return data
