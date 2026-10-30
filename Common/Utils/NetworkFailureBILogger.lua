-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\NetworkFailureBILogger.lua

local LoggerManager = require("Core.Log.LoggerManager")
local GlobalData = require("Core.Client.GlobalData")
local ClientRepo = require("Core.Client.ClientRepo")
local logger = LoggerManager.getLogger("NetworkFailureBILogger")
local NetworkFailureBILogger = {}

local function copyConnectionAddress(data, prefix, address)
	if type(address) ~= "table" then
		return
	end

	data[prefix .. "_ip"] = data[prefix .. "_ip"] or address[1]
	data[prefix .. "_port"] = data[prefix .. "_port"] or address[2]
end

local function copyResolvedIp(data, prefix, client)
	local session = client and client.session

	if session ~= nil and session.resolvedIp ~= nil then
		data[prefix .. "_resolved_ip"] = data[prefix .. "_resolved_ip"] or session.resolvedIp
	end
end

local function buildData(fields)
	local data = {}

	for key, value in pairs(fields or {}) do
		if value ~= nil then
			data[key] = value
		end
	end

	data.server_id = data.server_id or GlobalData.ServerId
	data.uid = data.uid or GlobalData.UserName

	local clientIPInfoData = pg.global.sdkManager:getClientIPInfoData()

	if clientIPInfoData ~= nil then
		data.outer_ip = clientIPInfoData.ip
		data.country = clientIPInfoData.country
		data.continent = clientIPInfoData.continent
	end

	copyConnectionAddress(data, "gate", ClientRepo.choiceSoulGate)
	copyConnectionAddress(data, "ms_gate", ClientRepo.choiceMsGate)

	local netHandler = ClientRepo.netHandler
	local gateClient = netHandler and (netHandler.gateClientSoul or netHandler.gateClient)

	copyResolvedIp(data, "gate", gateClient)

	local msClient = ClientRepo.globalMsProxy and ClientRepo.globalMsProxy.msclient

	copyResolvedIp(data, "ms_gate", msClient)

	return data
end

local function report(eventName, fields)
	if GlobalData.BILogger == nil or type(GlobalData.BILogger.customeLog) ~= "function" then
		return
	end

	local data = {}
	local dataOk, dataErr = pcall(function()
		data = buildData(fields)
	end)

	if not dataOk then
		logger:error("build network failure BI data failed event=%s error=%s", eventName, tostring(dataErr))

		return
	end

	local ok, err = pcall(function()
		local NetworkDiagHelper = require("Utils.NetworkDiagHelper")

		NetworkDiagHelper.runDiagnosis(false, false, function(diagnosisReport)
			if diagnosisReport ~= nil then
				data.network_diag = diagnosisReport
			end

			GlobalData.BILogger:customeLog(eventName, data)
		end)
	end)

	if not ok then
		GlobalData.BILogger:customeLog(eventName, data)
		logger:error("report network failure BI failed event=%s error=%s", eventName, tostring(err))
	end
end

function NetworkFailureBILogger.reportLoginFailure(fields)
	report("game_login_fail", fields)
end

function NetworkFailureBILogger.reportReconnectFailure(fields)
	report("game_reconnect_fail", fields)
end

return NetworkFailureBILogger
