-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\PlatformOnlineIDVisibilityService.lua

local ClientConst = require("Const.ClientConst")
local EventConst = require("Common.Const.EventConst")
local PlatformOnlineIDVisibilityService = {}

PlatformOnlineIDVisibilityService.DEFAULT_VISIBLE = false

function PlatformOnlineIDVisibilityService:isVisible()
	return pg.game.setting:getBool(ClientConst.PrefKey.ShowPlatformOnlineID, PlatformOnlineIDVisibilityService.DEFAULT_VISIBLE)
end

function PlatformOnlineIDVisibilityService:setVisible(visible)
	visible = visible == true

	if self:isVisible() == visible then
		return false
	end

	pg.game.setting:setBool(ClientConst.PrefKey.ShowPlatformOnlineID, visible)
	pg.global.eventEmitter:emit(EventConst.PLATFORM_ONLINE_ID_CHANGED, "")

	return true
end

return PlatformOnlineIDVisibilityService
