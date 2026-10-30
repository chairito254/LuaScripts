-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\Maintenance\\MaintenanceHelper.lua

local HttpClientProxy = require("Core.Net.Http.HttpClientProxy")
local HttpRequest = require("Core.Net.Http.HttpRequest")
local ClientConst = require("Const.ClientConst")
local Time = require("Core.Common.Time")
local json = require("json")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local UIConst = require("Const.UIConst")
local CallbackHandler = require("Core.Common.CallbackHandler")
local logger = LoggerManager.getLogger("MaintenanceHelper")
local API_PATH = "/api/server-maintenance/status"
local REQUEST_TIMEOUT_MS = 5000
local QUERY_COOLDOWN_SECONDS = 10
local HOST = {
	GLOBAL_PUBLISH = "worldx-office-api.aniimo.com",
	CN_TEST = "worldx-office-api-stage.yimo.com",
	GLOBAL_TEST = "worldx-office-api-stage.aniimo.com",
	CN_PUBLISH = "worldx-office-api.yimo.com"
}
local OFFICIAL_WEB_URL = {
	GLOBAL = "https://www.aniimo.com/",
	CN = "https://www.yimo.com/"
}
local MaintenanceHelper = {
	_lastSuccessTime = 0,
	_dialogShowing = false,
	_requestSeq = 0,
	_requesting = false,
	_maintenanceCheckRequired = false,
	_lastMaintenance = false
}

function MaintenanceHelper.getRequestLanguage()
	local languageType = pg and pg.languageType

	return languageType ~= nil and ClientConst.LANGUAGE_TYPE_DESC_MAP[languageType] or nil
end

function MaintenanceHelper.getLocalUtcOffsetSeconds()
	local timestamp = Time.secondCache

	if timestamp == nil or timestamp <= 0 then
		timestamp = Time.getSecond()
	end

	if not pgUtils or not pgUtils.GetLocalUtcOffsetSeconds then
		return nil
	end

	local success, utcOffsetSeconds = pcall(pgUtils.GetLocalUtcOffsetSeconds, timestamp)

	if not success then
		return nil
	end

	return tonumber(utcOffsetSeconds)
end

function MaintenanceHelper.getApiHost()
	local isPublish = ClientConfigEnvType > 0

	if ClientConfigAppCountry == "cn" then
		return isPublish and HOST.CN_PUBLISH or HOST.CN_TEST
	end

	return isPublish and HOST.GLOBAL_PUBLISH or HOST.GLOBAL_TEST
end

function MaintenanceHelper.getOfficialWebUrl()
	return ClientConfigAppCountry == "cn" and OFFICIAL_WEB_URL.CN or OFFICIAL_WEB_URL.GLOBAL
end

function MaintenanceHelper.normalizeDescription(description)
	if type(description) ~= "string" then
		return ""
	end

	return description:gsub("<[bB][rR]%s*/?>", "\n")
end

function MaintenanceHelper:onDialogClosed()
	MaintenanceHelper._dialogShowing = false
end

function MaintenanceHelper:openOfficialWebsite()
	self:onDialogClosed()
	pg.global.sdkManager:openUrl("MaintenanceHelper", "OfficialWebsite", MaintenanceHelper.getOfficialWebUrl())
end

function MaintenanceHelper.showMaintenanceDialog(description, requestKey)
	if MaintenanceHelper._dialogShowing or MaintenanceHelper._dialogShownKey == requestKey then
		return
	end

	local ui = pg and pg.global and pg.global.ui

	if not ui then
		return
	end

	MaintenanceHelper._dialogShowing = true
	MaintenanceHelper._dialogShownKey = requestKey

	ui:open(UIConst.UI_ID_LOGIN_SERVER_MAINTENANCE, {
		description = MaintenanceHelper.normalizeDescription(description),
		officialWebsiteCallback = CallbackHandler(MaintenanceHelper, "openOfficialWebsite")
	}, nil, CallbackHandler(MaintenanceHelper, "onDialogClosed"))
end

function MaintenanceHelper.parseReply(reply)
	if reply == nil or reply.err ~= 0 or string.isNilOrEmpty(reply.body) then
		return nil
	end

	local success, response = pcall(json.decode, reply.body)

	if not success or type(response) ~= "table" or tonumber(response.code) ~= 200 or type(response.data) ~= "table" then
		return nil
	end

	return response.data
end

function MaintenanceHelper.requestMaintenanceStatus(force)
	if force then
		MaintenanceHelper._dialogShownKey = nil
	end

	if not MaintenanceHelper._maintenanceCheckRequired then
		return
	end

	local language = MaintenanceHelper.getRequestLanguage()
	local utcOffsetSeconds = MaintenanceHelper.getLocalUtcOffsetSeconds()

	if string.isNilOrEmpty(language) or utcOffsetSeconds == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("maintenance query missing language or local UTC offset")
		end

		return
	end

	local requestKey = string.format("%s|%s", language, tostring(utcOffsetSeconds))

	if MaintenanceHelper._requesting and MaintenanceHelper._requestKey == requestKey then
		return
	end

	if not force and MaintenanceHelper._lastSuccessKey == requestKey then
		if MaintenanceHelper._lastMaintenance then
			MaintenanceHelper.showMaintenanceDialog(MaintenanceHelper._lastDescription, requestKey)

			return
		end

		local now = Time.secondCache or Time.getSecond()

		if now - MaintenanceHelper._lastSuccessTime < QUERY_COOLDOWN_SECONDS then
			return
		end
	end

	MaintenanceHelper._requestSeq = MaintenanceHelper._requestSeq + 1

	local requestSeq = MaintenanceHelper._requestSeq

	MaintenanceHelper._requesting = true
	MaintenanceHelper._requestKey = requestKey

	local requestPath = string.format("%s?language=%s&utcOffsetSeconds=%d", API_PATH, language, utcOffsetSeconds)
	local request = HttpRequest(MaintenanceHelper.getApiHost(), nil, HttpRequest.Method.GET, requestPath, {
		Accept = "application/json"
	}, nil, true)

	HttpClientProxy():httpRequest(request, REQUEST_TIMEOUT_MS, CallbackHandler(MaintenanceHelper, "onMaintenanceResponse", requestSeq, requestKey), false)
end

function MaintenanceHelper:onMaintenanceResponse(requestSeq, requestKey, reply)
	if requestSeq ~= MaintenanceHelper._requestSeq then
		return
	end

	MaintenanceHelper._requesting = false
	MaintenanceHelper._requestKey = nil

	local data = MaintenanceHelper.parseReply(reply)

	if data == nil then
		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("maintenance query failed")
		end

		return
	end

	MaintenanceHelper._lastSuccessKey = requestKey
	MaintenanceHelper._lastSuccessTime = Time.secondCache or Time.getSecond()
	MaintenanceHelper._lastMaintenance = data.maintenance == true
	MaintenanceHelper._lastDescription = data.description

	if MaintenanceHelper._lastMaintenance and MaintenanceHelper._maintenanceCheckRequired then
		MaintenanceHelper.showMaintenanceDialog(data.description, requestKey)
	end
end

function MaintenanceHelper.isServerListEmpty(dirConf)
	local serverList = dirConf and dirConf.localDirData

	return type(serverList) ~= "table" or #serverList == 0
end

function MaintenanceHelper.areAllServersUnavailable(dirConf)
	local serverList = dirConf and dirConf.localDirData

	if MaintenanceHelper.isServerListEmpty(dirConf) then
		return false
	end

	for _, serverInfo in ipairs(serverList) do
		local status = type(serverInfo) == "table" and tonumber(serverInfo.Status) or nil

		if status == nil or status == 1 then
			return false
		end
	end

	return true
end

function MaintenanceHelper.isSelectedServerUnavailable(dirConf, serverId, serverName)
	if MaintenanceHelper.isServerListEmpty(dirConf) then
		return true
	end

	for _, serverInfo in ipairs(dirConf.localDirData) do
		local hasServerName = not string.isNilOrEmpty(serverName)
		local matched

		if hasServerName then
			matched = tostring(serverInfo.ClusterName or "") == tostring(serverName)
		else
			matched = tostring(serverInfo.ClusterId or "") == tostring(serverId or "")
		end

		if matched then
			local status = tonumber(serverInfo.Status)

			return status ~= nil and status ~= 1
		end
	end

	return false
end

function MaintenanceHelper.resetMaintenanceState()
	MaintenanceHelper._maintenanceCheckRequired = false
	MaintenanceHelper._requestSeq = MaintenanceHelper._requestSeq + 1
	MaintenanceHelper._requesting = false
	MaintenanceHelper._requestKey = nil
	MaintenanceHelper._lastSuccessKey = nil
	MaintenanceHelper._lastMaintenance = false
	MaintenanceHelper._lastDescription = nil
	MaintenanceHelper._dialogShownKey = nil
end

function MaintenanceHelper.onServerListUpdated(dirConf)
	local maintenanceCheckRequired = MaintenanceHelper.isServerListEmpty(dirConf) or MaintenanceHelper.areAllServersUnavailable(dirConf)

	if not maintenanceCheckRequired then
		MaintenanceHelper.resetMaintenanceState()

		return
	end

	MaintenanceHelper._maintenanceCheckRequired = true

	MaintenanceHelper.requestMaintenanceStatus(false)
end

function MaintenanceHelper.checkBeforeEnterGame(dirConf, serverId, serverName)
	if not MaintenanceHelper.isSelectedServerUnavailable(dirConf, serverId, serverName) then
		return
	end

	MaintenanceHelper._maintenanceCheckRequired = true

	MaintenanceHelper.requestMaintenanceStatus(true)
end

return MaintenanceHelper
