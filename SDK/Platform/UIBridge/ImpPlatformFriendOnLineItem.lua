-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\UIBridge\\ImpPlatformFriendOnLineItem.lua

local PlatformNameMaskService = require("SDK.Platform.PlatformNameMaskService")
local M = {}

function M.resolveFriendOnlineDisplayName(_, uid, playerInfo, rawName)
	return PlatformNameMaskService.getMaskedDisplayName({
		action = PlatformNameMaskService.Action.FriendOnlineToastName,
		uid = uid,
		playerInfo = playerInfo,
		rawText = rawName
	})
end

return M
