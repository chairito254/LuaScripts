-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\PlatformPrivacyUtils.lua

local PlatformPrivacyUtils = {}
local PlatformBridgeLuaFacade = CS.FunPlus.WorldX.SDK.Platform.PlatformBridgeLuaFacade

PlatformPrivacyUtils.state = {
	resolved = false,
	shouldRedactSensitiveLogs = true
}

function PlatformPrivacyUtils.resolveSandboxState()
	if PlatformPrivacyUtils.state.resolved then
		return
	end

	PlatformPrivacyUtils.state.resolved = true

	if not PlatformBridgeLuaFacade then
		PlatformPrivacyUtils.state.shouldRedactSensitiveLogs = false

		return
	end

	if PlatformBridgeLuaFacade.ShouldRedactSensitiveLogs then
		PlatformPrivacyUtils.state.shouldRedactSensitiveLogs = PlatformBridgeLuaFacade.ShouldRedactSensitiveLogs() == true

		return
	end

	PlatformPrivacyUtils.state.shouldRedactSensitiveLogs = false
end

function PlatformPrivacyUtils:shouldRedactSensitiveLogs()
	PlatformPrivacyUtils.resolveSandboxState()

	return PlatformPrivacyUtils.state.shouldRedactSensitiveLogs
end

return PlatformPrivacyUtils
