-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\NetworkDiagHelper.lua

local json = require("json")
local ClientUtils = require("Utils.ClientUtils")
local ClientConst = require("Const.ClientConst")
local UIConst = require("Const.UIConst")
local Time = require("Core.Common.Time")
local TimerManager = require("Core.Timer.TimerManager")
local NetworkRouteDiagHelper = require("Utils.NetworkRouteDiagHelper")
local HttpClientProxy = require("Core.Net.Http.HttpClientProxy")
local HttpRequest = require("Core.Net.Http.HttpRequest")
local GlobalData = require("Core.Client.GlobalData")
local LoggerManager = require("Core.Log.LoggerManager")
local logger = LoggerManager.getLogger("NetworkDiagHelper")
local LoggerConst = require("Core.Log.LoggerConst")
local NetworkDiagHelper = {}
local isDiagnosisRunning = false
local SUSPECT_LATENCY_THRESHOLD_MS = 5000
local DEFAULT_HTTP_TIMEOUT_SEC = 8
local PUBLIC_IP_TIMEOUT_SEC = 5
local DEFAULT_DNS_TIMEOUT_SEC = 5
local DEFAULT_TCP_TIMEOUT_SEC = 5
local POLL_INTERVAL_SEC = 0.05
local DIAGNOSIS_OVERALL_TIMEOUT_SEC = 30
local REPORT_SEPARATOR = "============================================================"
local SECTION_SEPARATOR = "------------------------------------------------------------"
local PUBLIC_IP_SERVICES = {
	"https://api.ipify.org",
	"https://ifconfig.me/ip",
	"https://icanhazip.com"
}
local TRUSTED_DNS_SERVICES = {
	{
		name = "Google DoH",
		url = "https://dns.google/resolve?name=%s&type=A"
	},
	{
		name = "Cloudflare DoH",
		url = "https://cloudflare-dns.com/resolve?name=%s&type=A"
	}
}
local DOH_TIMEOUT_SEC = 4

function NetworkDiagHelper.runDiagnosis(shouldUpload, showTips, callback)
	if type(callback) ~= "function" then
		callback = nil
	end

	showTips = showTips ~= false

	if isDiagnosisRunning then
		if showTips then
			ClientUtils.showBubbleMessageRaw(pg.getGameString("NETWORK_DIAG_RUNNING_PROMPT"), 3)
		end

		logger:warn("[NetworkDiag] 诊断正在进行中，忽略重复触发")

		if callback then
			local callbackOk, callbackError = pcall(callback, nil, nil, nil, "Diagnosis already running")

			if not callbackOk then
				logger:error("[NetworkDiag] 诊断完成回调执行失败：%s", tostring(callbackError))
			end
		end

		return
	end

	isDiagnosisRunning = true

	if showTips then
		ClientUtils.showBubbleMessageRaw(pg.getGameString("NETWORK_DIAG_RUNNING"), 3)
	end

	local report = {
		timestamp = os.date("%Y-%m-%d %H:%M:%S"),
		targets = {},
		summary = {}
	}
	local targets, targetNote = NetworkDiagHelper.resolveDiagnosisTargets(showTips)

	if not targets then
		isDiagnosisRunning = false

		logger:error("[NetworkDiag] 没有可用的诊断目标")

		if callback then
			local callbackOk, callbackError = pcall(callback, targetNote)

			if not callbackOk then
				logger:error("[NetworkDiag] 诊断完成回调执行失败：%s", tostring(callbackError))
			end
		end

		return
	end

	report.targets = targets
	report.targetNote = targetNote

	local diagnosisState = {
		finished = false,
		report = report,
		shouldUpload = shouldUpload == true,
		showTips = showTips,
		callback = callback
	}

	diagnosisState.timeoutTimerId = TimerManager.addTimer(DIAGNOSIS_OVERALL_TIMEOUT_SEC, function()
		NetworkDiagHelper.finishDiagnosis(diagnosisState, true)
	end)

	local sysOk, sysInfo = pcall(NetworkDiagHelper.collectSystemInfo)

	if sysOk then
		report.systemInfo = sysInfo
	else
		report.systemInfo = {
			systemInfoError = tostring(sysInfo)
		}

		logger:error("[NetworkDiag] 收集系统信息出错：%s", tostring(sysInfo))
	end

	NetworkDiagHelper.runConcurrentChecks({
		publicIp = function(done)
			NetworkDiagHelper.getPublicIp(function(result)
				if not diagnosisState.finished then
					report.publicIp = result
				end

				done(result)
			end)
		end,
		targets = function(done)
			NetworkDiagHelper.diagnoseTargets(report.targets, done, diagnosisState)
		end
	}, function(results)
		if not diagnosisState.finished then
			report.publicIp = results.publicIp
			report.targets = results.targets or {}
		end

		NetworkDiagHelper.finishDiagnosis(diagnosisState, false)
	end)
end

function NetworkDiagHelper.uploadReport(report, showTips)
	if type(report) ~= "table" then
		logger:error("[NetworkDiag] uploadReport failed: report is invalid")

		return false
	end

	local logged, logError = pcall(function()
		GlobalData.BILogger:customeLog("network_diag_upload", report)
	end)

	if not logged then
		logger:error("[NetworkDiag] BI log failed: error=%s", tostring(logError))

		return false
	end

	return true
end

function NetworkDiagHelper.finishDiagnosis(state, timedOut)
	if state.finished then
		return
	end

	state.finished = true

	if state.timeoutTimerId ~= nil then
		TimerManager.removeTimer(state.timeoutTimerId)

		state.timeoutTimerId = nil
	end

	isDiagnosisRunning = false

	if timedOut then
		state.report.timedOut = true

		for _, target in ipairs(state.report.targets or {}) do
			if target.diagnosis ~= "OK" and target.diagnosis ~= "SUSPECT" and target.diagnosis ~= "FAIL" then
				target.diagnosis = "TIMEOUT"
				target.reasons = {
					"Overall diagnosis timed out before all checks completed."
				}
			end
		end

		logger:warn("[NetworkDiag] 诊断整体超时（%d秒），保存已完成部分的报告", DIAGNOSIS_OVERALL_TIMEOUT_SEC)
	end

	if state.shouldUpload then
		NetworkDiagHelper.uploadReport(state.report, state.showTips)
	end

	local report = state.report

	report.summary = NetworkDiagHelper.generateSummary(report)

	local textContent = NetworkDiagHelper.formatReportText(report)

	if state.callback then
		local callbackOk, callbackError = pcall(state.callback, state.report, textContent)

		if not callbackOk then
			logger:error("[NetworkDiag] 诊断完成回调执行失败：%s", tostring(callbackError))
		end
	end

	if state.showTips then
		pg.global.ui:open(UIConst.UI_ID_NETWORK_DIAG, {
			content = textContent
		})
	end
end

function NetworkDiagHelper.completeTips(reportPath, showTips)
	if not showTips then
		return
	end

	local desc

	if reportPath and reportPath ~= "" then
		desc = pg.getFormatText(pg.getGameString("NETWORK_DIAG_REPORT_SAVED"), reportPath)
	else
		desc = pg.getGameString("NETWORK_DIAG_REPORT_SAVE_FAILED")
	end

	ClientUtils.showConfirmRaw(pg.getGameString("NETWORK_DIAG_FINISHED"), desc, function()
		return
	end, true)
end

function NetworkDiagHelper.diagComplete(report)
	report.summary = NetworkDiagHelper.generateSummary(report)

	logger:error("[NetworkDiag] report=%s", inspect(report))

	local textContent = NetworkDiagHelper.formatReportText(report)

	return textContent
end

function NetworkDiagHelper.resolveDiagnosisTargets(showTips)
	local inGame = not pg.global.ui:checkUIOpen(UIConst.UI_ID_LOGIN)

	if inGame then
		local targets = NetworkDiagHelper.getRuntimeGameServerTargets()

		if #targets > 0 then
			return targets
		end

		logger:warn("[NetworkDiag] 游戏内没有可用的当前 Gate 连接地址")

		return nil, "No active game server connection"
	end

	if not NetworkDiagHelper.checkServerList() then
		logger:error("[NetworkDiag] 未拉到服务器列表，诊断服务器列表 CDN")

		return NetworkDiagHelper.getServerListTargets()
	end

	local serverInfo = NetworkDiagHelper.getCurServerInfo()

	if not serverInfo then
		logger:warn("[NetworkDiag] 没有选择服务器")

		if showTips then
			ClientUtils.showBubbleMessageRaw(pg.getGameString("NETWORK_DIAG_SELECT_SERVER_PROMPT"), 3)
		end

		return nil, "No server selected"
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("[NetworkDiag] 诊断目标：%s", inspect(serverInfo))
	end

	local dirConf = ClientUtils.getDirConf()
	local gateTargets = NetworkDiagHelper.buildGameServerTargets(serverInfo, dirConf) or {}

	return gateTargets
end

function NetworkDiagHelper.isIpAddress(host)
	if type(host) ~= "string" then
		return false
	end

	return host:find(":", 1, true) ~= nil or host:match("^%d+%.%d+%.%d+%.%d+$") ~= nil
end

function NetworkDiagHelper.getRuntimeGameServerTargets()
	local ClientRepo = require("Core.Client.ClientRepo")
	local gates = ClientRepo.netHandler.soulInfo.gates or {}
	local targets = {}

	for i = 1, 2 do
		local gate = gates[i]

		if gate and gate.ip and gate.port then
			targets[#targets + 1] = {
				type = "game_server",
				host = gate.ip,
				tcpHost = gate.ip,
				tcpPort = gate.port,
				skipDns = NetworkDiagHelper.isIpAddress(gate.ip),
				label = "Current Game Server Gate " .. tostring(gate.ip) .. ":" .. tostring(gate.port)
			}
		end
	end

	return targets
end

function NetworkDiagHelper.checkServerList()
	local dirConf = ClientUtils.getDirConf()

	return dirConf ~= nil
end

function NetworkDiagHelper.getCurServerInfo()
	local loginCtrl = pg and pg.global and pg.global.ui and pg.global.ui.login
	local serverComp = loginCtrl and loginCtrl.loginServerComponent
	local selectedServer = serverComp and serverComp.selectServerIndex and serverComp.serverList and serverComp.serverList[serverComp.selectServerIndex]

	return selectedServer
end

function NetworkDiagHelper.getServerListTargets()
	local targets = {}
	local configAppCountry = ClientConfigAppCountry or "cn"
	local configEnvType = ClientConfigEnvType or 0

	if not ClientConfigAppCountry then
		logger:warn("[NetworkDiag] ClientConfigAppCountry not set, using default 'cn'")
	end

	if not ClientConfigEnvType then
		logger:warn("[NetworkDiag] ClientConfigEnvType not set, using default 0")
	end

	local isCN = configAppCountry == "cn"
	local isTest = configEnvType == 0
	local hosts = isCN and {
		{
			label = "China Main CDN",
			host = ClientConst.SERVER_LIST.CN_HOST
		},
		{
			label = "China Backup CDN",
			host = ClientConst.SERVER_LIST.CN_HOST_BACKUP
		}
	} or {
		{
			label = "Overseas Main CDN",
			host = ClientConst.SERVER_LIST.GLOBAL_HOST
		},
		{
			label = "Overseas Backup CDN",
			host = ClientConst.SERVER_LIST.GLOBAL_HOST_BACKUP
		}
	}
	local path = isTest and ClientConst.SERVER_LIST.URL_TEST or ClientConst.SERVER_LIST.URL_PUBLISH

	for i = 1, #hosts do
		local hostInfo = hosts[i]

		targets[#targets + 1] = {
			type = "server_list_cdn",
			host = hostInfo.host,
			path = path,
			url = "https://" .. hostInfo.host .. path,
			label = hostInfo.label
		}
	end

	return targets
end

function NetworkDiagHelper.buildGameServerTargets(serverInfo, dirConf)
	if not serverInfo then
		return
	end

	if not serverInfo.ClusterName or serverInfo.ClusterName == "LOCAL" then
		return
	end

	local addrList = dirConf and dirConf.msGateAddrList

	for _, info in ipairs(dirConf and dirConf.localDirData or {}) do
		if info.ClusterId == serverInfo.ClusterId and info.ClusterName == serverInfo.ClusterName and info.msGateAddrList ~= nil then
			addrList = info.msGateAddrList

			break
		end
	end

	if ClientConfigMsGate and ClientConfigMsGate ~= "" then
		addrList = {
			ClientConfigMsGate
		}
	end

	if not addrList or #addrList == 0 then
		logger:warn("[NetworkDiag] 服务器 %s(%s) No MS Gate address available", tostring(serverInfo.ClusterName), tostring(serverInfo.ClusterId))

		return
	end

	local clusterName = serverInfo and serverInfo.ClusterName or "Unknown Server"
	local clusterId = serverInfo and serverInfo.ClusterId or 0
	local targets = {}

	for i = 1, #addrList do
		local address = addrList[i]
		local addressText = type(address) == "string" and address or tostring(address or "")
		local ip, port = addressText:match("^%[([^%]]+)%]:(%d+)$")
		local ambiguousIpv6 = false

		if not ip then
			local candidateHost, candidatePort = addressText:match("^(.+):(%d+)$")

			if candidateHost and candidateHost:find(":", 1, true) then
				ambiguousIpv6 = true
			else
				ip, port = candidateHost, candidatePort
			end
		end

		port = tonumber(port) or 0

		local validAddress = ip ~= nil and port >= 1 and port <= 65535
		local target = {
			type = "game_server",
			host = ip or addressText or "unknown",
			tcpHost = validAddress and ip or nil,
			tcpPort = validAddress and port or nil,
			name = clusterName,
			clusterId = clusterId,
			skipDns = NetworkDiagHelper.isIpAddress(ip),
			label = string.format("Game Server %s Gateway %s", clusterName, addressText)
		}

		if ambiguousIpv6 then
			target.configurationError = string.format("MS Gate address is an unbracketed IPv6 address; use the [IPv6]:port format: %s", addressText)
		elseif not validAddress then
			target.configurationError = string.format("Invalid MS Gate address format: %s", addressText)
		end

		targets[#targets + 1] = target
	end

	return targets
end

function NetworkDiagHelper.collectSystemInfo()
	local info = {}
	local application = CS.UnityEngine.Application

	info.platform = tostring(application.platform or "Unknown")
	info.systemLanguage = tostring(application.systemLanguage or "Unknown")
	info.isEditor = application.isEditor or false

	if application.internetReachability then
		info.internetReachability = tostring(application.internetReachability)
	end

	info.systemDnsServers, info.systemDnsError = NetworkDiagHelper.collectSystemDnsServers()
	info.ipv6Addresses, info.ipv6AddressError = NetworkDiagHelper.collectIpv6Addresses()
	info.macAddresses, info.macAddressError = NetworkDiagHelper.collectMacAddresses()

	local sdkManager = pg.global.sdkManager

	if sdkManager then
		info.fpId = sdkManager:getFpId()
	end

	local sysInfo = CS.UnityEngine.SystemInfo

	info.osName = tostring(sysInfo.operatingSystem or "Unknown")
	info.osFamily = tostring(sysInfo.operatingSystemFamily or "Unknown")
	info.deviceModel = tostring(sysInfo.deviceModel or "Unknown")
	info.deviceType = tostring(sysInfo.deviceType or "Unknown")
	info.processorType = tostring(sysInfo.processorType or "Unknown")
	info.processorCount = tonumber(sysInfo.processorCount or 0)
	info.systemMemorySize = tonumber(sysInfo.systemMemorySize or 0)
	info.graphicsDeviceName = tostring(sysInfo.graphicsDeviceName or "Unknown")
	info.timestamp = os.date("%Y-%m-%d %H:%M:%S")
	info.timestampUnix = os.time()
	info.configEnvType = ClientConfigEnvType or 0
	info.configAppCountry = ClientConfigAppCountry or "unknown"

	return info
end

function NetworkDiagHelper.collectIpv6Addresses()
	local ipv6Addresses = {}
	local seen = {}
	local ok, interfaces = pcall(function()
		return CS.System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces()
	end)

	if not ok then
		return ipv6Addresses, "Failed to read device IPv6 addresses: " .. tostring(interfaces)
	end

	if not interfaces then
		return ipv6Addresses, "No network interface found"
	end

	local readError

	for i = 0, interfaces.Length - 1 do
		local readOk, addresses = pcall(function()
			local adapter = interfaces[i]

			if not adapter or tostring(adapter.NetworkInterfaceType):match("^Loopback") or not tostring(adapter.OperationalStatus):match("^Up") then
				return {}
			end

			local properties = adapter:GetIPProperties()
			local unicastAddresses = properties and properties.UnicastAddresses

			if not unicastAddresses then
				return {}
			end

			local entries = {}
			local count = tonumber(unicastAddresses.Count or unicastAddresses.Length or 0) or 0

			for j = 0, count - 1 do
				local addressInfo = unicastAddresses[j]
				local address = addressInfo and addressInfo.Address

				if address and tostring(address.AddressFamily):match("^InterNetworkV6") then
					local value = address:ToString()

					if value ~= "" and value ~= "::" and value ~= "::1" then
						entries[#entries + 1] = value
					end
				end
			end

			return entries
		end)

		if readOk then
			for _, address in ipairs(addresses) do
				if not seen[address] then
					seen[address] = true
					ipv6Addresses[#ipv6Addresses + 1] = address
				end
			end
		else
			readError = readError or tostring(addresses)
		end
	end

	if #ipv6Addresses == 0 then
		return ipv6Addresses, readError or "No device IPv6 address available"
	end

	return ipv6Addresses, readError
end

function NetworkDiagHelper.collectSystemDnsServers()
	local dnsServers = {}
	local seen = {}
	local ok, interfaces = pcall(function()
		return CS.System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces()
	end)

	if not ok then
		return dnsServers, "Failed to read system DNS addresses: " .. tostring(interfaces)
	end

	if not interfaces then
		return dnsServers, "No network interface found"
	end

	local readError

	for i = 0, interfaces.Length - 1 do
		local readOk, addresses = pcall(function()
			local adapter = interfaces[i]

			if not adapter or tostring(adapter.NetworkInterfaceType):match("^Loopback") or not tostring(adapter.OperationalStatus):match("^Up") then
				return {}
			end

			local properties = adapter:GetIPProperties()
			local dnsAddresses = properties and properties.DnsAddresses

			if not dnsAddresses then
				return {}
			end

			local entries = {}
			local count = tonumber(dnsAddresses.Count or dnsAddresses.Length or 0) or 0

			for j = 0, count - 1 do
				local address = dnsAddresses[j]

				if address then
					local value = address:ToString()

					if value ~= "" and value ~= "0.0.0.0" and value ~= "::" then
						entries[#entries + 1] = value
					end
				end
			end

			return entries
		end)

		if readOk then
			for _, address in ipairs(addresses) do
				if not seen[address] then
					seen[address] = true
					dnsServers[#dnsServers + 1] = address
				end
			end
		else
			readError = readError or tostring(addresses)
		end
	end

	if #dnsServers == 0 then
		return dnsServers, readError or "No system DNS address available"
	end

	return dnsServers, readError
end

function NetworkDiagHelper.collectMacAddresses()
	local macAddresses = {}
	local ok, interfaces = pcall(function()
		return CS.System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces()
	end)

	if not ok then
		return macAddresses, "Failed to read network adapters: " .. tostring(interfaces)
	end

	if not interfaces then
		return macAddresses, "No network adapter found"
	end

	local readError

	for i = 0, interfaces.Length - 1 do
		local readOk, entry = pcall(function()
			local adapter = interfaces[i]

			if tostring(adapter.NetworkInterfaceType) == "Loopback" then
				return nil
			end

			local physicalAddress = adapter:GetPhysicalAddress()

			if not physicalAddress then
				return nil
			end

			local mac = physicalAddress:ToString():upper()

			if #mac ~= 12 or mac:find("[^%x]") or mac == "000000000000" or mac == "FFFFFFFFFFFF" or mac == "020000000000" then
				return nil
			end

			return {
				name = tostring(adapter.Name or "Unknown"),
				status = tostring(adapter.OperationalStatus),
				mac = mac:gsub("(%x%x)", "%1:"):sub(1, -2)
			}
		end)

		if readOk then
			if entry then
				macAddresses[#macAddresses + 1] = entry
			end
		else
			readError = readError or tostring(entry)
		end
	end

	if readError then
		return macAddresses, "Failed to read some network adapters: " .. readError
	end

	if #macAddresses == 0 then
		return macAddresses, "No usable MAC address available (not provided by the adapter or access restricted by the system)"
	end

	return macAddresses
end

function NetworkDiagHelper.getPublicIp(callback)
	NetworkDiagHelper.tryPublicIpService({
		callbackInvoked = false,
		callback = callback,
		requestUrls = {}
	}, 1)
end

function NetworkDiagHelper.tryPublicIpService(state, index)
	if index > #PUBLIC_IP_SERVICES then
		NetworkDiagHelper.completePublicIp(state, {
			error = "All public IP services failed",
			ip = "UNAVAILABLE",
			requestUrls = state.requestUrls
		})

		return
	end

	local service = PUBLIC_IP_SERVICES[index]

	state.requestUrls[#state.requestUrls + 1] = service

	NetworkDiagHelper.testHttpGet(service, PUBLIC_IP_TIMEOUT_SEC, function(result)
		if result.success and result.body then
			local raw = result.body:match("^%s*(.-)%s*$") or ""
			local ip = NetworkDiagHelper.normalizePublicIp(raw)

			if ip then
				NetworkDiagHelper.completePublicIp(state, {
					ip = ip,
					service = service,
					requestUrls = state.requestUrls
				})

				return
			end
		end

		NetworkDiagHelper.tryPublicIpService(state, index + 1)
	end)
end

function NetworkDiagHelper.normalizePublicIp(text)
	if not text or text == "" then
		return nil
	end

	if text:match("^%d+%.%d+%.%d+%.%d+$") then
		return text
	end

	if text:find(":", 1, true) and text:match("^[%x:%.]+$") then
		return text
	end

	return nil
end

function NetworkDiagHelper.completePublicIp(state, result)
	if state.callbackInvoked then
		return
	end

	state.callbackInvoked = true

	state.callback(result)
end

function NetworkDiagHelper.diagnoseTargets(targets, callback, state)
	local checks = {}

	for i = 1, #targets do
		targets[i].route = targets[i].route or {
			status = "PENDING",
			host = targets[i].host,
			hops = {}
		}
		checks[i] = function(done)
			NetworkDiagHelper.diagnoseTarget(targets[i], function(targetReport)
				if not state or not state.finished then
					targets[i] = targetReport
				end

				done(targetReport)
			end)
		end
	end

	NetworkDiagHelper.runConcurrentChecks(checks, function(results)
		if not state or not state.finished then
			for i = 1, #targets do
				targets[i] = results[i]
			end
		end

		callback(targets)
	end)
end

function NetworkDiagHelper.diagnoseTarget(target, callback)
	local routeResult = target.route or {
		status = "PENDING",
		host = target.host,
		hops = {}
	}
	local targetReport = {
		diagnosis = "UNKNOWN",
		type = target.type,
		host = target.host,
		label = target.label,
		url = target.url,
		dns = {},
		connectivity = {},
		route = routeResult
	}

	if target.configurationError then
		targetReport.diagnosis = "FAIL"
		targetReport.reasons = {
			target.configurationError
		}
		targetReport.route.status = "SKIPPED"
		targetReport.route.note = "Invalid target configuration; route tracing skipped"

		callback(targetReport)

		return
	end

	local checks = {}

	if not target.skipDns then
		function checks.dns(done)
			NetworkDiagHelper.testDnsResolution(target.host, done)
		end
	else
		targetReport.dns.system = {
			note = "Target is an IP address; DNS resolution is not required",
			skipped = true
		}
	end

	if target.url then
		function checks.http(done)
			NetworkDiagHelper.testHttpGet(target.url, DEFAULT_HTTP_TIMEOUT_SEC, done)
		end
	end

	if target.tcpHost and target.tcpPort then
		function checks.tcp(done)
			NetworkDiagHelper.testTcpConnect(target.tcpHost, target.tcpPort, DEFAULT_TCP_TIMEOUT_SEC, done)
		end
	end

	function checks.route(done)
		NetworkRouteDiagHelper.trace(target.host, done, targetReport.route)
	end

	NetworkDiagHelper.runConcurrentChecks(checks, function(results)
		if results.dns then
			targetReport.dns.system = results.dns
		end

		targetReport.connectivity.http = results.http
		targetReport.connectivity.tcp = results.tcp
		targetReport.route = results.route or targetReport.route
		targetReport.diagnosis = NetworkDiagHelper.analyzeTargetResult(targetReport)

		callback(targetReport)
	end)
end

function NetworkDiagHelper.analyzeTargetResult(targetReport)
	local reasons = {}
	local dnsResult = targetReport.dns.system
	local httpResult = targetReport.connectivity.http
	local tcpResult = targetReport.connectivity.tcp

	if not dnsResult and not httpResult and not tcpResult then
		targetReport.reasons = {
			"No network checks completed"
		}

		return "UNKNOWN"
	end

	if tcpResult and not tcpResult.success then
		reasons[#reasons + 1] = string.format("TCP connection failed: %s", tcpResult.error or "unknown")
		targetReport.reasons = reasons

		return "FAIL"
	end

	if httpResult and not httpResult.success then
		reasons[#reasons + 1] = "HTTP connection failed"
		targetReport.reasons = reasons

		return "FAIL"
	end

	if dnsResult and dnsResult.isPrivate then
		reasons[#reasons + 1] = dnsResult.suspect or "DNS returned private IP"
		targetReport.reasons = reasons

		return "SUSPECT"
	end

	if httpResult and httpResult.latencyMs and httpResult.latencyMs > SUSPECT_LATENCY_THRESHOLD_MS then
		reasons[#reasons + 1] = string.format("High HTTP latency (%dms > %dms)", httpResult.latencyMs, SUSPECT_LATENCY_THRESHOLD_MS)
		targetReport.reasons = reasons

		return "SUSPECT"
	end

	if tcpResult and tcpResult.latencyMs and tcpResult.latencyMs > SUSPECT_LATENCY_THRESHOLD_MS then
		reasons[#reasons + 1] = string.format("High TCP latency (%dms > %dms)", tcpResult.latencyMs, SUSPECT_LATENCY_THRESHOLD_MS)
		targetReport.reasons = reasons

		return "SUSPECT"
	end

	targetReport.reasons = reasons

	return "OK"
end

function NetworkDiagHelper.isPrivateIp(ip)
	if not ip or ip == "" then
		return false
	end

	local normalizedIp = string.lower(ip)

	if normalizedIp == "::" or normalizedIp == "::1" or normalizedIp:match("^fe80:") or normalizedIp:match("^fc") or normalizedIp:match("^fd") then
		return true
	end

	if ip:match("^10%.") then
		return true
	end

	if ip:match("^127%.") then
		return true
	end

	if ip:match("^169%.254%.") then
		return true
	end

	if ip:match("^192%.168%.") then
		return true
	end

	local second_octet = ip:match("^172%.(%d+)%.")

	if second_octet then
		local n = tonumber(second_octet)

		if n and n >= 16 and n <= 31 then
			return true
		end
	end

	if ip == "0.0.0.0" or ip == "255.255.255.255" then
		return true
	end

	return false
end

function NetworkDiagHelper.startPoll(step, onError, intervalSec)
	intervalSec = intervalSec or POLL_INTERVAL_SEC

	local poll

	function poll()
		local ok, done = pcall(step)

		if not ok then
			if onError then
				onError(done)
			end

			return
		end

		if done then
			return
		end

		TimerManager.addTimer(intervalSec, poll)
	end

	TimerManager.addTimer(intervalSec, poll)
end

function NetworkDiagHelper.parseUrl(url)
	local scheme, rest = url:match("^(%a[%w+.-]*)://(.+)$")

	if not scheme then
		return nil, "URL is missing a scheme: " .. tostring(url)
	end

	local ssl = string.lower(scheme) == "https"
	local authority, path = rest:match("^([^/]+)(/.*)$")

	if not authority then
		authority = rest
		path = "/"
	end

	local host, port
	local bracketHost, bracketPort = authority:match("^%[([^%]]+)%]:?(%d*)$")

	if bracketHost then
		host = bracketHost
		port = bracketPort ~= "" and tonumber(bracketPort) or nil
	else
		host, port = authority:match("^([^:]+):(%d+)$")

		if not host then
			host = authority
			port = nil
		else
			port = tonumber(port)
		end
	end

	if not host or host == "" then
		return nil, "URL is missing a host name: " .. tostring(url)
	end

	return {
		ssl = ssl,
		host = host,
		port = port,
		path = path
	}
end

function NetworkDiagHelper.getHttpStatus(header)
	if type(header) ~= "table" then
		return nil
	end

	return tonumber(header.HTTP_STATUS or header.http_status or header["Http-Status"])
end

function NetworkDiagHelper.testHttpGet(url, timeout, callback)
	local startTime = Time.realtimeSinceStartup

	local function elapsedMs()
		return math.floor((Time.realtimeSinceStartup - startTime) * 1000)
	end

	local parsed, parseError = NetworkDiagHelper.parseUrl(url)

	if not parsed then
		callback({
			success = false,
			statusCode = 0,
			error = parseError,
			latencyMs = elapsedMs()
		})

		return
	end

	local invokedCallback = false

	local function done(result)
		if invokedCallback then
			return
		end

		invokedCallback = true

		callback(result)
	end

	local timeoutMs = (timeout or DEFAULT_HTTP_TIMEOUT_SEC) * 1000
	local invoked, invokeError = pcall(function()
		local request = HttpRequest(parsed.host, parsed.port, HttpRequest.Method.GET, parsed.path, nil, nil, parsed.ssl)

		HttpClientProxy():httpRequest(request, timeoutMs, function(reply)
			local statusCode = NetworkDiagHelper.getHttpStatus(reply and reply.header) or 0
			local transportOk = reply ~= nil and reply.err == 0
			local statusOk = statusCode == 0 or statusCode >= 200 and statusCode < 300

			done({
				success = transportOk and statusOk,
				error = transportOk and (statusOk and false or "HTTP status " .. statusCode) or "http request error: " .. tostring(reply and reply.err),
				body = reply and reply.body or nil,
				statusCode = statusCode,
				latencyMs = elapsedMs()
			})
		end, false)
	end)

	if not invoked then
		done({
			success = false,
			statusCode = 0,
			error = tostring(invokeError),
			latencyMs = elapsedMs()
		})
	end
end

function NetworkDiagHelper.parseTrustedDnsResponse(body, serviceName, statusCode)
	local ok, response = pcall(json.decode, body or "")

	if not ok or not response then
		return nil, "DoH response is not valid JSON"
	end

	local responseStatus = tonumber(response.Status)

	if responseStatus ~= nil and responseStatus ~= 0 then
		return nil, string.format("DoH DNS status code %d", responseStatus)
	end

	local ips = {}

	if response.Answer then
		for _, answer in ipairs(response.Answer) do
			if tonumber(answer.type) == 1 and type(answer.data) == "string" then
				ips[#ips + 1] = answer.data
			end
		end
	end

	if #ips == 0 then
		return nil, "DoH returned no A record"
	end

	return {
		method = "DoH",
		available = true,
		service = serviceName,
		ips = ips,
		statusCode = statusCode
	}
end

function NetworkDiagHelper.queryTrustedDns(host, result, state)
	local services = TRUSTED_DNS_SERVICES
	local checks = {}

	for i = 1, #services do
		local service = services[i]
		local url = string.format(service.url, host)

		state.requestUrls[#state.requestUrls + 1] = url
		checks[i] = function(done)
			NetworkDiagHelper.testHttpGet(url, DOH_TIMEOUT_SEC, function(httpResult)
				if httpResult.success then
					local trusted, parseError = NetworkDiagHelper.parseTrustedDnsResponse(httpResult.body, service.name, httpResult.statusCode)

					if trusted then
						done(trusted)

						return
					end

					done({
						error = parseError
					})

					return
				end

				done({
					error = httpResult.error or "Trusted DoH request failed"
				})
			end)
		end
	end

	NetworkDiagHelper.runConcurrentChecks(checks, function(results)
		local trusted, lastError

		for i = 1, #services do
			local r = results[i]

			if r and r.available then
				trusted = r

				break
			elseif r and r.error then
				lastError = lastError or r.error
			end
		end

		if trusted then
			trusted.requestUrls = state.requestUrls
			result.trusted = trusted

			if result.available and result.ips and #result.ips > 0 then
				local systemIp = result.ips[1]
				local matched = false

				for _, trustedIp in ipairs(trusted.ips) do
					if trustedIp == systemIp then
						matched = true

						break
					end
				end

				result.trustedMatch = matched

				if not matched then
					result.note = "System DNS differs from trusted DoH; CDN routing may cause normal differences. For reference only."
				end
			end
		else
			result.trusted = {
				method = "DoH",
				available = false,
				ips = {},
				error = lastError or "Trusted DoH unavailable",
				requestUrls = state.requestUrls
			}
		end

		NetworkDiagHelper.completeDnsResolution(state, result)
	end)
end

function NetworkDiagHelper.resolveSystemDns(host, result, onDone)
	local startTime = Time.realtimeSinceStartup
	local task

	local function fillFromAddresses(addresses)
		local count = tonumber(addresses.Length) or 0

		for i = 0, count - 1 do
			local addr = addresses[i]

			if addr then
				result.ips[#result.ips + 1] = addr:ToString()
			end
		end

		result.available = #result.ips > 0

		local var_62_0 = result

		if result.available then
			-- block empty
		end

		var_62_0.note = "System DNS returned no address"

		for _, ip in ipairs(result.ips) do
			if NetworkDiagHelper.isPrivateIp(ip) then
				result.isPrivate = true
				result.suspect = "DNS returned a private IP (possible hijacking)"

				break
			end
		end
	end

	local function step()
		if not task.IsCompleted then
			if Time.realtimeSinceStartup - startTime >= DEFAULT_DNS_TIMEOUT_SEC then
				result.error = "System DNS resolution timed out"
				result.note = result.error

				onDone()

				return true
			end

			return false
		end

		local ok, err = pcall(function()
			if task.IsFaulted then
				local ex = task.Exception

				result.error = ex and ex:GetBaseException().Message or "System DNS resolution failed"
				result.note = result.error
			elseif task.IsCanceled then
				result.error = "System DNS resolution was canceled"
				result.note = result.error
			else
				fillFromAddresses(task.Result)
			end
		end)

		if not ok then
			result.method = "System DNS unavailable"
			result.error = tostring(err)
			result.note = result.error
		end

		onDone()

		return true
	end

	local invoked, invokeError = pcall(function()
		task = CS.System.Net.Dns.GetHostAddressesAsync(host)
	end)

	if not invoked or not task then
		result.method = "System DNS unavailable"
		result.note = "The current runtime cannot call system DNS: " .. tostring(invokeError)

		onDone()

		return
	end

	NetworkDiagHelper.startPoll(step, function(err)
		result.method = "System DNS unavailable"
		result.error = tostring(err)
		result.note = result.error

		onDone()
	end)
end

function NetworkDiagHelper.testDnsResolution(host, callback)
	local systemDnsServers, systemDnsError = NetworkDiagHelper.collectSystemDnsServers()
	local callbackState = {
		callbackInvoked = false,
		callback = callback,
		requestUrls = {}
	}
	local result = {
		available = false,
		method = "System DNS",
		isPrivate = false,
		note = "System DNS returned no address; unable to confirm",
		ips = {},
		systemDnsServers = systemDnsServers,
		systemDnsError = systemDnsError
	}

	NetworkDiagHelper.resolveSystemDns(host, result, function()
		NetworkDiagHelper.queryTrustedDns(host, result, callbackState)
	end)
end

function NetworkDiagHelper.completeDnsResolution(state, result)
	if state.callbackInvoked then
		return
	end

	state.callbackInvoked = true

	state.callback(result)
end

function NetworkDiagHelper.testTcpConnect(host, port, timeout, callback)
	local startTime = Time.realtimeSinceStartup
	local timeoutSec = timeout or DEFAULT_TCP_TIMEOUT_SEC

	local function elapsedMs()
		return math.floor((Time.realtimeSinceStartup - startTime) * 1000)
	end

	local invoked = false
	local client

	local function finish(success, err)
		if invoked then
			return
		end

		invoked = true

		pcall(function()
			if client then
				client:Close()
			end
		end)
		callback({
			success = success,
			error = err,
			latencyMs = elapsedMs()
		})
	end

	local asyncResult

	local function step()
		if invoked then
			return true
		end

		if not asyncResult.IsCompleted then
			if Time.realtimeSinceStartup - startTime >= timeoutSec then
				finish(false, "TCP connection timeout")

				return true
			end

			return false
		end

		local ok, err = pcall(function()
			client:EndConnect(asyncResult)
		end)

		if ok then
			finish(true, nil)
		else
			finish(false, tostring(err))
		end

		return true
	end

	local started, startError = pcall(function()
		client = CS.System.Net.Sockets.TcpClient()
		asyncResult = client:BeginConnect(host, port, nil, nil)
	end)

	if not started or not asyncResult then
		finish(false, "The current runtime cannot start a TCP connection: " .. tostring(startError))

		return
	end

	NetworkDiagHelper.startPoll(step, function(err)
		finish(false, "The current runtime cannot poll the TCP connection: " .. tostring(err))
	end)
end

function NetworkDiagHelper.runConcurrentChecks(checks, callback)
	local pending = 0

	for _ in pairs(checks) do
		pending = pending + 1
	end

	if pending == 0 then
		callback({})

		return
	end

	local results = {}
	local pendingState = {
		value = pending
	}

	for name, check in pairs(checks) do
		local checkState = {
			callbackInvoked = false,
			name = name,
			results = results,
			pending = pendingState,
			callback = callback
		}
		local invoked, invokeError = pcall(function()
			check(function(result)
				NetworkDiagHelper.completeConcurrentCheck(checkState, result)
			end)
		end)

		if not invoked then
			NetworkDiagHelper.completeConcurrentCheck(checkState, {
				success = false,
				error = tostring(invokeError)
			})
		end
	end
end

function NetworkDiagHelper.completeConcurrentCheck(state, result)
	if state.callbackInvoked then
		return
	end

	state.callbackInvoked = true
	state.results[state.name] = result
	state.pending.value = state.pending.value - 1

	if state.pending.value == 0 then
		state.callback(state.results)
	end
end

function NetworkDiagHelper.generateSummary(report)
	local summary = {
		failCount = 0,
		suspectCount = 0,
		okCount = 0,
		incompleteCount = 0,
		totalTargets = #report.targets,
		suspectTargets = {}
	}

	for i = 1, #report.targets do
		local target = report.targets[i]
		local diagnosis = target.diagnosis

		if diagnosis == "OK" then
			summary.okCount = summary.okCount + 1
		elseif diagnosis == "SUSPECT" then
			summary.suspectCount = summary.suspectCount + 1
			summary.suspectTargets[#summary.suspectTargets + 1] = {
				index = i,
				label = target.label or target.host,
				reasons = target.reasons or {}
			}
		elseif diagnosis == "FAIL" then
			summary.failCount = summary.failCount + 1
		elseif diagnosis == "UNKNOWN" or diagnosis == "TIMEOUT" then
			summary.incompleteCount = summary.incompleteCount + 1
		end
	end

	return summary
end

function NetworkDiagHelper.formatReportText(report)
	local ctx = {
		count = 0,
		lines = {}
	}

	NetworkDiagHelper.formatReportHeader(ctx, report)
	NetworkDiagHelper.formatSystemInfo(ctx, report)
	NetworkDiagHelper.formatPublicIp(ctx, report)
	NetworkDiagHelper.formatDiagnosisResults(ctx, report)
	NetworkDiagHelper.formatSummary(ctx, report)
	NetworkDiagHelper.formatFooter(ctx)

	return table.concat(ctx.lines, "\n")
end

function NetworkDiagHelper.appendLine(ctx, line)
	ctx.count = ctx.count + 1
	ctx.lines[ctx.count] = line or ""
end

function NetworkDiagHelper.appendSection(ctx, title)
	NetworkDiagHelper.appendLine(ctx, SECTION_SEPARATOR)
	NetworkDiagHelper.appendLine(ctx, title)
	NetworkDiagHelper.appendLine(ctx, SECTION_SEPARATOR)
end

function NetworkDiagHelper.formatReportHeader(ctx, report)
	NetworkDiagHelper.appendLine(ctx, REPORT_SEPARATOR)
	NetworkDiagHelper.appendLine(ctx, "Network Diagnosis Report")
	NetworkDiagHelper.appendLine(ctx, REPORT_SEPARATOR)
	NetworkDiagHelper.appendLine(ctx, string.format("Generated at: %s", report.timestamp))

	if report.timedOut then
		NetworkDiagHelper.appendLine(ctx, "Diagnosis status: Timed out (showing completed checks)")
	elseif report.error then
		NetworkDiagHelper.appendLine(ctx, string.format("Diagnosis status: Failed (%s)", report.error))
	end

	if report.targetNote then
		NetworkDiagHelper.appendLine(ctx, string.format("Target note: %s", report.targetNote))
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatSystemInfo(ctx, report)
	NetworkDiagHelper.appendSection(ctx, "[A] System Information")

	if report.systemInfo then
		local info = report.systemInfo

		NetworkDiagHelper.appendLine(ctx, string.format("Platform       : %s", info.platform or "Unknown"))

		if info.osName then
			NetworkDiagHelper.appendLine(ctx, string.format("Operating system: %s", info.osName))
		end

		if info.deviceModel then
			NetworkDiagHelper.appendLine(ctx, string.format("Device model   : %s", info.deviceModel))
		end

		if info.processorType then
			NetworkDiagHelper.appendLine(ctx, string.format("Processor      : %s", info.processorType))
		end

		if info.systemMemorySize and info.systemMemorySize > 0 then
			NetworkDiagHelper.appendLine(ctx, string.format("Memory         : %d MB", info.systemMemorySize))
		end

		if info.internetReachability then
			NetworkDiagHelper.appendLine(ctx, string.format("Reachability   : %s", info.internetReachability))
		end

		if info.fpId then
			NetworkDiagHelper.appendLine(ctx, string.format("User fpId      : %s", info.fpId))
		else
			NetworkDiagHelper.appendLine(ctx, "User fpId      : unavailable")
		end

		if info.systemDnsServers and #info.systemDnsServers > 0 then
			NetworkDiagHelper.appendLine(ctx, string.format("System DNS     : %s", table.concat(info.systemDnsServers, ", ")))
		else
			NetworkDiagHelper.appendLine(ctx, "System DNS     : unavailable")
		end

		if info.systemDnsError then
			NetworkDiagHelper.appendLine(ctx, string.format("DNS details    : %s", info.systemDnsError))
		end

		if info.ipv6Addresses and #info.ipv6Addresses > 0 then
			NetworkDiagHelper.appendLine(ctx, string.format("Device IPv6    : %s", table.concat(info.ipv6Addresses, ", ")))
		else
			NetworkDiagHelper.appendLine(ctx, "Device IPv6    : unavailable")
		end

		if info.ipv6AddressError then
			NetworkDiagHelper.appendLine(ctx, string.format("IPv6 details   : %s", info.ipv6AddressError))
		end

		if info.macAddresses and #info.macAddresses > 0 then
			for _, adapter in ipairs(info.macAddresses) do
				NetworkDiagHelper.appendLine(ctx, string.format("Adapter MAC    : %s (%s, %s)", adapter.mac, adapter.name, adapter.status))
			end
		else
			NetworkDiagHelper.appendLine(ctx, "Adapter MAC    : unavailable")
		end

		if info.macAddressError then
			NetworkDiagHelper.appendLine(ctx, string.format("MAC details    : %s", info.macAddressError))
		end

		NetworkDiagHelper.appendLine(ctx, string.format("System language: %s", info.systemLanguage or "Unknown"))

		local envType = info.configEnvType == 0 and "Test build" or "Release build"
		local region = info.configAppCountry == "cn" and "China" or "Overseas"

		NetworkDiagHelper.appendLine(ctx, string.format("Configuration  : %s (%s)", envType, region))
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatPublicIp(ctx, report)
	NetworkDiagHelper.appendSection(ctx, "[A2] Public IP")

	if report.publicIp then
		if report.publicIp.requestUrls and #report.publicIp.requestUrls > 0 then
			for i, url in ipairs(report.publicIp.requestUrls) do
				NetworkDiagHelper.appendLine(ctx, string.format("Probe URL[%d]   : %s", i, url))
			end
		end

		if report.publicIp.ip and report.publicIp.ip ~= "UNAVAILABLE" then
			NetworkDiagHelper.appendLine(ctx, string.format("Public IP      : %s", report.publicIp.ip))

			if report.publicIp.service then
				NetworkDiagHelper.appendLine(ctx, string.format("Service        : %s", report.publicIp.service))
			end
		else
			NetworkDiagHelper.appendLine(ctx, "Public IP      : unavailable")

			if report.publicIp.error then
				NetworkDiagHelper.appendLine(ctx, string.format("Reason         : %s", report.publicIp.error))
			end
		end
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatDnsResult(ctx, dnsSystem)
	NetworkDiagHelper.appendLine(ctx, "--- DNS Resolution ---")

	if not dnsSystem then
		NetworkDiagHelper.appendLine(ctx, "Status         : Unknown")
		NetworkDiagHelper.appendLine(ctx, "")

		return
	end

	if dnsSystem.skipped then
		NetworkDiagHelper.appendLine(ctx, "Status         : Skipped")
		NetworkDiagHelper.appendLine(ctx, string.format("Note           : %s", dnsSystem.note or "DNS resolution not required"))
		NetworkDiagHelper.appendLine(ctx, "")

		return
	end

	if dnsSystem.systemDnsServers and #dnsSystem.systemDnsServers > 0 then
		NetworkDiagHelper.appendLine(ctx, string.format("System DNS      : %s", table.concat(dnsSystem.systemDnsServers, ", ")))
	else
		NetworkDiagHelper.appendLine(ctx, "System DNS      : unavailable")

		if dnsSystem.systemDnsError then
			NetworkDiagHelper.appendLine(ctx, string.format("DNS details     : %s", dnsSystem.systemDnsError))
		end
	end

	if dnsSystem.available then
		NetworkDiagHelper.appendLine(ctx, "Status         : Success")
		NetworkDiagHelper.appendLine(ctx, string.format("Method         : %s", dnsSystem.method or "System DNS"))

		if dnsSystem.ips and #dnsSystem.ips > 0 then
			NetworkDiagHelper.appendLine(ctx, string.format("Resolved IP    : %s", table.concat(dnsSystem.ips, ", ")))
		end

		if dnsSystem.isPrivate then
			NetworkDiagHelper.appendLine(ctx, string.format("⚠ Warning       : %s", dnsSystem.suspect or "DNS returned a private IP"))
		end
	else
		NetworkDiagHelper.appendLine(ctx, "Status         : Unknown (system DNS returned no address)")

		if dnsSystem.note then
			NetworkDiagHelper.appendLine(ctx, string.format("Note           : %s", dnsSystem.note))
		end
	end

	if dnsSystem.trusted then
		NetworkDiagHelper.appendLine(ctx, "--- Trusted DoH Comparison ---")

		if dnsSystem.trusted.requestUrls then
			for i, url in ipairs(dnsSystem.trusted.requestUrls) do
				NetworkDiagHelper.appendLine(ctx, string.format("Probe URL[%d]   : %s", i, url))
			end
		end

		if dnsSystem.trusted.available then
			NetworkDiagHelper.appendLine(ctx, string.format("Service        : %s", dnsSystem.trusted.service))
			NetworkDiagHelper.appendLine(ctx, string.format("Resolved IP    : %s", table.concat(dnsSystem.trusted.ips, ", ")))

			if dnsSystem.trustedMatch == false then
				NetworkDiagHelper.appendLine(ctx, "Note           : Differs from system DNS; CDN routing may cause normal differences")
			end
		else
			NetworkDiagHelper.appendLine(ctx, "Status         : Unavailable")

			if dnsSystem.trusted.error then
				NetworkDiagHelper.appendLine(ctx, string.format("Error          : %s", dnsSystem.trusted.error))
			end
		end
	end

	if dnsSystem.note and dnsSystem.available then
		NetworkDiagHelper.appendLine(ctx, string.format("Note           : %s", dnsSystem.note))
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatHttpResult(ctx, http)
	if not http then
		return
	end

	NetworkDiagHelper.appendLine(ctx, "--- HTTPS Connectivity ---")

	if http.success then
		NetworkDiagHelper.appendLine(ctx, "Status         : Success (HTTPS certificate and HTTP status are valid)")
		NetworkDiagHelper.appendLine(ctx, string.format("Latency        : %d ms", http.latencyMs or 0))

		if http.statusCode and http.statusCode > 0 then
			NetworkDiagHelper.appendLine(ctx, string.format("HTTP status    : %d", http.statusCode))
		end

		if http.body and #http.body > 0 then
			NetworkDiagHelper.appendLine(ctx, string.format("Response size  : %d bytes", #http.body))
		end
	else
		NetworkDiagHelper.appendLine(ctx, "Status         : Failed")
		NetworkDiagHelper.appendLine(ctx, string.format("Latency        : %d ms", http.latencyMs or 0))

		if http.error then
			NetworkDiagHelper.appendLine(ctx, string.format("Error          : %s", http.error))
		end
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatTcpResult(ctx, tcp)
	if not tcp then
		return
	end

	NetworkDiagHelper.appendLine(ctx, "--- TCP Connectivity (MS Gate Port) ---")

	if tcp.success then
		NetworkDiagHelper.appendLine(ctx, "Status         : Success (port reachable)")
		NetworkDiagHelper.appendLine(ctx, string.format("Elapsed        : %d ms", tcp.latencyMs or 0))
	else
		NetworkDiagHelper.appendLine(ctx, "Status         : Failed (port unreachable)")
		NetworkDiagHelper.appendLine(ctx, string.format("Elapsed        : %d ms", tcp.latencyMs or 0))

		if tcp.error then
			NetworkDiagHelper.appendLine(ctx, string.format("Error          : %s", tcp.error))
		end
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatRouteResult(ctx, route)
	if not route then
		return
	end

	NetworkDiagHelper.appendLine(ctx, "--- Route Trace (TTL) ---")

	if route.targetIp then
		NetworkDiagHelper.appendLine(ctx, string.format("Target IP      : %s", route.targetIp))
	end

	if route.status == "COMPLETE" then
		NetworkDiagHelper.appendLine(ctx, string.format("Route hops     : %d (TTL required to reach target)", route.hopCount or 0))
	elseif route.status == "SKIPPED" then
		NetworkDiagHelper.appendLine(ctx, "Status         : Skipped")
	else
		NetworkDiagHelper.appendLine(ctx, string.format("Status         : %s", route.status or "UNKNOWN"))
		NetworkDiagHelper.appendLine(ctx, "Route hops     : unconfirmed")
	end

	if route.note then
		NetworkDiagHelper.appendLine(ctx, string.format("Details        : %s", route.note))
	end

	if route.hops and #route.hops > 0 then
		for _, hop in ipairs(route.hops) do
			NetworkDiagHelper.appendLine(ctx, string.format("  TTL=%d    : %s [%s]%s", hop.ttl or 0, hop.address or "*", hop.status or "Unknown", hop.latencyMs and string.format(" %d ms", hop.latencyMs) or ""))
		end
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatSingleTarget(ctx, index, target)
	NetworkDiagHelper.appendLine(ctx, string.format("========== Target-%d: %s ==========", index, target.label or target.host))
	NetworkDiagHelper.appendLine(ctx, string.format("Type           : %s", target.type))
	NetworkDiagHelper.appendLine(ctx, string.format("Host           : %s", target.host))

	if target.url then
		NetworkDiagHelper.appendLine(ctx, string.format("Probe URL      : %s", target.url))
	end

	if target.tcpPort then
		NetworkDiagHelper.appendLine(ctx, string.format("Port           : %d", target.tcpPort))
	end

	NetworkDiagHelper.appendLine(ctx, "")
	NetworkDiagHelper.formatDnsResult(ctx, target.dns and target.dns.system)
	NetworkDiagHelper.formatHttpResult(ctx, target.connectivity and target.connectivity.http)
	NetworkDiagHelper.formatTcpResult(ctx, target.connectivity and target.connectivity.tcp)
	NetworkDiagHelper.formatRouteResult(ctx, target.route)
	NetworkDiagHelper.appendLine(ctx, string.format("Diagnosis      : %s", target.diagnosis))

	if target.reasons and #target.reasons > 0 then
		NetworkDiagHelper.appendLine(ctx, "Failure reasons:")

		for j = 1, #target.reasons do
			NetworkDiagHelper.appendLine(ctx, string.format("  - %s", target.reasons[j]))
		end
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatDiagnosisResults(ctx, report)
	NetworkDiagHelper.appendSection(ctx, "[B] Diagnostic Results")

	for i = 1, #report.targets do
		NetworkDiagHelper.formatSingleTarget(ctx, i, report.targets[i])
	end
end

function NetworkDiagHelper.formatSummary(ctx, report)
	NetworkDiagHelper.appendSection(ctx, "[C] Overall Summary")

	if report.summary then
		local s = report.summary

		NetworkDiagHelper.appendLine(ctx, string.format("Targets        : %d", s.totalTargets))
		NetworkDiagHelper.appendLine(ctx, string.format("Healthy        : %d", s.okCount))
		NetworkDiagHelper.appendLine(ctx, string.format("Suspect        : %d", s.suspectCount))
		NetworkDiagHelper.appendLine(ctx, string.format("Failed         : %d", s.failCount))
		NetworkDiagHelper.appendLine(ctx, string.format("Incomplete     : %d", s.incompleteCount or 0))

		if s.suspectCount > 0 and s.suspectTargets and #s.suspectTargets > 0 then
			NetworkDiagHelper.appendLine(ctx, "")
			NetworkDiagHelper.appendLine(ctx, "⚠ Suspect target details:")

			for i = 1, #s.suspectTargets do
				local suspectTarget = s.suspectTargets[i]

				NetworkDiagHelper.appendLine(ctx, string.format("  Target-%d     : %s", suspectTarget.index, suspectTarget.label))

				if suspectTarget.reasons and #suspectTarget.reasons > 0 then
					for j = 1, #suspectTarget.reasons do
						NetworkDiagHelper.appendLine(ctx, string.format("    - %s", suspectTarget.reasons[j]))
					end
				end
			end
		end
	end

	NetworkDiagHelper.appendLine(ctx, "")
end

function NetworkDiagHelper.formatFooter(ctx)
	NetworkDiagHelper.appendLine(ctx, REPORT_SEPARATOR)
	NetworkDiagHelper.appendLine(ctx, "If you encounter connection issues, please send this report to support.")
	NetworkDiagHelper.appendLine(ctx, REPORT_SEPARATOR)
end

function NetworkDiagHelper.saveReport(report)
	local txtPath = NetworkDiagHelper.getReportPath()
	local textContent = NetworkDiagHelper.formatReportText(report)
	local success = false

	if CS and CS.System and CS.System.IO and CS.System.IO.File then
		pcall(function()
			CS.System.IO.File.WriteAllText(txtPath, textContent)

			success = true
		end)
	else
		pcall(function()
			local f = io.open(txtPath, "w")

			if f then
				f:write(textContent)
				f:close()

				success = true
			end
		end)
	end

	if success then
		return txtPath, textContent
	else
		return nil, textContent
	end
end

function NetworkDiagHelper.getReportPath()
	local txtPath = CS.UnityEngine.Application.persistentDataPath .. "/network_diag.txt"

	return txtPath
end

return NetworkDiagHelper
