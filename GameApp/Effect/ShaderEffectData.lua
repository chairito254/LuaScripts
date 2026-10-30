-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Effect\\ShaderEffectData.lua

local data = {
	switchAppearDissolve = {
		endValue = 10,
		changeMatResId = "$Eff_Merge_GeomDissolve_01.mat",
		presetName = "CharacterEdgeDissolve",
		recipeName = "modelDissolve",
		startValue = -0.1,
		duration = 0.5,
		pos = {
			0,
			0,
			0
		}
	},
	switchAppearDissolveTall = {
		endValue = 50,
		changeMatResId = "$Eff_Merge_GeomDissolve_01.mat",
		height = 4,
		presetName = "CharacterEdgeDissolve",
		recipeName = "modelDissolve",
		startValue = -0.1,
		duration = 0.5,
		pos = {
			0,
			0,
			0
		}
	},
	shaderFrozen = {
		stopKey = "shaderFrozen",
		recipeName = "shaderFrozen",
		endValue = 1
	}
}

return data
