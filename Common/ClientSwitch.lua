-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\ClientSwitch.lua

local isPublish = not _G_IsDebugMode
local ClientSwitch = {
	EnableCrashSightExceptionCustomLog = true,
	EnableDebugAoi = false,
	ChemElementDebug = false,
	ClientMsCallRateLimitBurstCapacity = 60,
	ClientMsCallRateLimitMaxCount = 20,
	ClientMsCallRateLimitWindowMs = 1000,
	ClientMsCallRateLimitEnable = true,
	EnableInteractionControlEntOptimize = true,
	EnableConfirmReTriggerEvent = false,
	ClosePopupInfoTip = false,
	OpenCreateUserProcess = true,
	EnableUserNameDebugLogin = false,
	TriggerDebugLog = false,
	EnableRendererBatch = true,
	EnableQuestNotice = true,
	GmCameraMaxZoomIndex = 20,
	EnableGmCameraMaxZoomIndex = false,
	GmCameraDistanceScale = 0.8,
	EnableGmCameraDistanceScale = false,
	EnablePlayerInfo = false,
	NvidiaVoiceTest = false,
	EnableGMESDK = true,
	EnableWorldRaceMultiDistance = false,
	EnableMobileSkillBtnClickVer = true,
	EnableArrowTip3DSpaceMode = false,
	EnableEffectMpeLodDown = true,
	OnlyDrawLatestAttackBox = false,
	EnableDrawAbilityGizmo = false,
	ClientEnableDebugLog = _G_IsDebugMode and true
}

return ClientSwitch
