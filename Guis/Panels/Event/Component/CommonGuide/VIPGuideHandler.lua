-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Event\\Component\\CommonGuide\\VIPGuideHandler.lua

local json = require("json")
local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local UIConst = require("Const.UIConst")
local GuideHandlerBase = require("Guis.Panels.Event.Component.CommonGuide.GuideHandlerBase")
local ClientUtils = require("Utils.ClientUtils")
local JUMP_BASE_URLS = {
	test = {
		cn = "https://park-web-test.funplus.com.cn",
		global = "https://park-web-test.funplus.com"
	},
	stage = {
		cn = "https://park-web-stage.funplus.com.cn",
		global = "https://park-web-stage.funplus.com"
	},
	prod = {
		cn = "https://park-web.yimo.com",
		global = "https://park-web.aniimo.com"
	}
}
local VIPGuideHandler = Class.LightClass("VIPGuideHandler", GuideHandlerBase)

function VIPGuideHandler:getOwnedRefKeys()
	return {}
end

function VIPGuideHandler:_escapeUrlQueryValue(value)
	local text = tostring(value or "")
	local success, escaped = pcall(CS.System.Uri.EscapeDataString, text)

	return success and escaped or text
end

function VIPGuideHandler:_getEnvironmentKey()
	if _G_IsDebugMode then
		if string.lower(ClientUtils.getServerListGroup()) == "ver001" then
			return "stage"
		else
			return "test"
		end
	else
		return "prod"
	end
end

function VIPGuideHandler:onButton1()
	local environmentKey = self:_getEnvironmentKey()
	local regionKey = Utils.isOverseas() and "global" or "cn"
	local baseUrl = JUMP_BASE_URLS[environmentKey][regionKey]
	local source = ""

	if pg.global.platform:isMobile() then
		source = "mobile_game"
	elseif pg.global.platform:isConsole() or pg.global.platform:isPC() then
		source = "pc_game"
	end

	local sdkManager = pg and pg.global and pg.global.sdkManager
	local osName = ""
	local channel = ""
	local pkgChannel = ""

	if sdkManager and sdkManager.getTrackingInfo then
		local trackingSuccess, trackingInfo = pcall(sdkManager.getTrackingInfo, sdkManager)

		if trackingSuccess and not string.isNilOrEmpty(trackingInfo) then
			local decodeSuccess, data = pcall(json.decode, trackingInfo)

			if decodeSuccess and Utils.isTable(data) and Utils.isTable(data.properties) then
				osName = tostring(data.properties.os or "")
				channel = tostring(data.properties.channel_id or "")
				pkgChannel = tostring(data.properties.pkg_channel or "")
			end
		end
	end

	local sessionKey = sdkManager and sdkManager:getSessionKey() or ""
	local uid = pg.me and pg.me.uid or ""
	local url = string.format("%s?session_key=%s&uid=%s&os=%s&channel=%s&pkg_channel=%s&lang=%s&source=%s&show_dialog=1", baseUrl, self:_escapeUrlQueryValue(sessionKey), self:_escapeUrlQueryValue(uid), self:_escapeUrlQueryValue(osName), self:_escapeUrlQueryValue(channel), self:_escapeUrlQueryValue(pkgChannel), self:_escapeUrlQueryValue(pg.game.setting:getLanguage()), source)

	if pg.global.platform:isMobile() then
		sdkManager:openUrl("VIPGuideHandler", self.comp.eventId, url)
	elseif pg.global.platform:isConsole() then
		pg.global.ui:open(UIConst.UI_ID_VIP_JUMP_SCAN_CODE, {
			url = url
		})
	elseif pg.global.platform:isPC() then
		sdkManager:openUrl("VIPGuideHandler", self.comp.eventId, url)
	end

	return true
end

return VIPGuideHandler
