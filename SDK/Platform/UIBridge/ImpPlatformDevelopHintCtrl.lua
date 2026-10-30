-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\UIBridge\\ImpPlatformDevelopHintCtrl.lua

local M = {}

function M:shouldShowDevelopHint()
	local platform = pg.global.platform

	return not platform:isXbox() and not platform:isXboxPC() and not platform:isPS()
end

return M
