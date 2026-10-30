-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\PlayableConst.lua

local PlayableConstImp = require("Common.Data.PlayableConstImp")
local PlayableConst = {}

for k, v in pairs(PlayableConstImp) do
	PlayableConst[k] = v
end

package.loaded["Common.Data.PlayableConstImp"] = nil
PlayableConst.END_REASON = {
	DESTROY = 2,
	INTERRUPT = 1,
	PLAYBACK = 0
}
PlayableConst.AnimGroupKey = {
	Max = 4,
	PetLift = 2,
	Default = 1
}
PlayableConst.AnimationLayer = {
	HUMAN_LAYER_FULLBODY = 2,
	HUMAN_LAYER_FULLBODYLOWPRIORITY = 1,
	HUMAN_LAYER_BASE = 0,
	LAYER_FULLBODY = 2,
	HUMAN_LAYER_FULLBODYADDITIVE = 3
}
PlayableConst.FacialConst = {
	Happy = PlayableConstImp.Face_Happy,
	Smile = PlayableConstImp.Face_Smile,
	Angry = PlayableConstImp.Face_Angry,
	Sad = PlayableConstImp.Face_Sad,
	Excited = PlayableConstImp.Face_Excited,
	Wink = PlayableConstImp.Face_Wink,
	Lose = PlayableConstImp.Face_Lose,
	Serious = PlayableConstImp.Face_Serious,
	Fear = PlayableConstImp.Face_Fear,
	Expect = PlayableConstImp.Face_Expect,
	Superised = PlayableConstImp.Face_Surprised,
	Shy = PlayableConstImp.Face_Shy,
	Think = PlayableConstImp.Face_Think,
	Confused = PlayableConstImp.Face_Confused,
	Worried = PlayableConstImp.Face_Worried
}
PlayableConst.PackType = {
	Transition = 0,
	State = 1
}
PlayableConst.PlayableTransitionType = {
	NormalizedTime = 1,
	FixedTime = 0,
	NormalizedTimeAndNormalizedOffset = 4,
	FixedTimeAndNormalizedOffset = 2
}
PlayableConst.BaseSyncBlendTree = {
	Max = 15,
	HoldMoveT = 3,
	HoldMove = 2,
	Move = 1,
	None = 0
}

return PlayableConst
