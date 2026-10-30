-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\UIBridge\\ImpPlatformSettingCtrl.lua

local M = {}
local PlatformCrossPlatformService = require("SDK.Platform.PlatformCrossPlatformService")

function M.isCrossPlatformSettingReadOnly()
	return PlatformCrossPlatformService:isCrossPlatformSettingReadOnly()
end

return M
