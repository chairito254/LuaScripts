-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\EntityMixin\\ImpPlatformGMEManager.lua

local M = {}
local PlatformCommunicationService = require("SDK.Platform.PlatformCommunicationService")

function M:StartStreamingRecording()
	if PlatformCommunicationService:isLocalCommunicationBlocked(PlatformCommunicationService.Channel.Voice) then
		PlatformCommunicationService:notifyOutgoingCommunicationDenied(PlatformCommunicationService.Channel.Voice, "voice_record_start", {
			deniedTipKey = "PLATFORM_SOCIAL_VOICE_PRIVILEGE_DENIED",
			notifyUser = true
		})

		return true
	end

	return false
end

function M:UploadRecordedFile(filePath)
	if PlatformCommunicationService:isLocalCommunicationBlocked(PlatformCommunicationService.Channel.Voice) then
		PlatformCommunicationService:notifyOutgoingCommunicationDenied(PlatformCommunicationService.Channel.Voice, "voice_upload", {
			deniedTipKey = "PLATFORM_SOCIAL_VOICE_PRIVILEGE_DENIED",
			notifyUser = true
		})

		return true
	end

	return false
end

return M
