-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\ClientLogUploadUtils.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("ClientLogUploadUtils")
local msgpack = require("cmsgpack")
local json = require("json")
local Time = require("Core.Common.Time")
local ClientUtils = require("Utils.ClientUtils")
local ClientLogUploadUtils = {}
local UPLOAD_API_TYPE = 2
local HOST_DEV_CN = "worldx-office-api-stage.yimo.com"
local HOST_DEV_EN = "worldx-office-api-stage.aniimo.com"
local HOST_PROD_CN = "worldx-office-api.yimo.com"
local HOST_PROD_EN = "worldx-office-api.aniimo.com"
local API_PATH_UPLOAD = "/out-api/v1/error-logs/upload"
local API_PATH_SIGN = "/out-api/v1/error-logs/signature"
local API_BEARER_AUTH = "Bearer 1669ec793638a7ffc81bb6cdf941f051AeLmeW66K1Z"
local OSS_RESOURCE_TYPE = "UploadPlayerLog"
local MAX_UPLOAD_HEAD_LOG_RAW_SIZE = 131072
local MAX_UPLOAD_RECENT_LOG_RAW_SIZE = 10485760
local RUNTIME_PLATFORM_LOG_CONFIGS = {
	WindowsEditor = {
		useUnityLogPath = true,
		uploadFolder = "editor"
	},
	WindowsPlayer = {
		useUnityLogPath = true,
		uploadFolder = "win"
	},
	OSXEditor = {
		useUnityLogPath = true,
		uploadFolder = "editor"
	},
	OSXPlayer = {
		useUnityLogPath = true,
		uploadFolder = "mac"
	},
	LinuxEditor = {
		useUnityLogPath = true,
		uploadFolder = "editor"
	},
	LinuxPlayer = {
		useUnityLogPath = true,
		uploadFolder = "linux"
	},
	Android = {
		useUnityLogPath = false,
		uploadFolder = "android"
	},
	IPhonePlayer = {
		useUnityLogPath = false,
		uploadFolder = "ios"
	},
	OpenHarmony = {
		useUnityLogPath = false,
		uploadFolder = "harmony"
	}
}
local _isSupportedPlatform = false
local _uploadFolder, _useUnityLogPath, _logFullPath, _logPrevFullPath
local _isLogPrevUploaded = false
local _lastSuccessfulUploadTime = 0
local _uploadRequestStartTime = 0

local function initLogModule()
	local platformLogConfigs = RUNTIME_PLATFORM_LOG_CONFIGS

	RUNTIME_PLATFORM_LOG_CONFIGS = nil

	if type(UnityPlatform) ~= "string" then
		_isSupportedPlatform = false

		return
	end

	local config = platformLogConfigs[UnityPlatform]

	if not config then
		_isSupportedPlatform = false

		return
	end

	_isSupportedPlatform = false
	_uploadFolder = config.uploadFolder
	_useUnityLogPath = config.useUnityLogPath

	if _uploadFolder == nil or type(_uploadFolder) ~= "string" or _useUnityLogPath == nil or type(_useUnityLogPath) ~= "boolean" then
		_isSupportedPlatform = false

		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("无效的日志上传配置, 请检查, 当前平台: %s, _uploadFolder变量类型: %s, _useUnityLogPath变量类型: %s", UnityPlatform, type(_uploadFolder), type(_useUnityLogPath))
		end

		return
	end

	if _useUnityLogPath then
		_logFullPath = CS.UnityEngine.Application.consoleLogPath

		if _logFullPath and _logFullPath ~= "" then
			local dirName, fileName = _logFullPath:match("^(.*[/\\])([^/\\]+)$")

			if fileName == "Player.log" then
				_logPrevFullPath = dirName .. "Player-prev.log"
			elseif UNITY_EDITOR and fileName == "Editor.log" then
				_logPrevFullPath = dirName .. "Editor-prev.log"
			end
		end
	else
		_logFullPath = CS.FunPlus.WorldX.Utils.DeviceLogPersister.CurrentLogPath
		_logPrevFullPath = CS.FunPlus.WorldX.Utils.DeviceLogPersister.PrevLogPath
	end

	if _logFullPath == nil or type(_logFullPath) ~= "string" then
		_isSupportedPlatform = false

		logger:error("Invalid log path, platform: %s, is unity log path: %s, path: (%s) %s", UnityPlatform, tostring(_useUnityLogPath), type(_logFullPath), tostring(_logFullPath))

		return
	end

	_isSupportedPlatform = _logFullPath ~= ""

	if not _isSupportedPlatform then
		logger:info("Log file path is empty, log upload will not be enabled, platform: %s, is unity log path: %s", UnityPlatform, tostring(_useUnityLogPath))

		return
	end

	local lfs = require("lfs")

	if not _logPrevFullPath or _logPrevFullPath == "" or lfs.attributes(_logPrevFullPath, "mode") ~= "file" then
		_logPrevFullPath = nil
	end
end

pcall(function()
	_isSupportedPlatform = false

	local ok, err = pcall(initLogModule)

	if not ok and LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error("Log module initialization failed safely: %s", tostring(err))
	end
end)

local function readLogLines(logPath, maxReadSize, fromHead)
	if not logPath or logPath == "" then
		logger:error("Failed to read log, path is nil or empty")

		return nil
	end

	local file, err = io.open(logPath, "rb")

	if not file then
		logger:error("Failed to open log file, error: %s, path: %s", tostring(err), logPath)

		return nil
	end

	local fileSize, sizeErr = file:seek("end")

	if not fileSize then
		file:close()
		logger:error("Failed to get log file size, error: %s, path: %s", tostring(sizeErr), logPath)

		return nil
	end

	if fileSize == 0 then
		file:close()
		logger:error("Failed to read log, content is empty, path: %s", logPath)

		return nil
	end

	local rawData

	maxReadSize = maxReadSize or fromHead and MAX_UPLOAD_HEAD_LOG_RAW_SIZE or MAX_UPLOAD_RECENT_LOG_RAW_SIZE

	if fileSize <= maxReadSize then
		file:seek("set", 0)

		rawData = file:read("*a")
	elseif fromHead then
		local endPos = maxReadSize

		file:seek("set", maxReadSize - 1)

		local checkBytes = file:read(2)
		local lastByte = checkBytes and checkBytes:sub(1, 1)
		local nextByte = checkBytes and #checkBytes >= 2 and checkBytes:sub(2, 2)

		if lastByte == "\n" then
			endPos = maxReadSize
		elseif lastByte == "\r" then
			endPos = nextByte == "\n" and maxReadSize + 1 or maxReadSize
		else
			local scanPos = maxReadSize
			local chunkSize = 256
			local maxExtend = 4096
			local scanned = 0

			file:seek("set", scanPos)

			while scanned < maxExtend do
				local readSize = math.min(chunkSize, maxExtend - scanned)
				local chunk = file:read(readSize)

				if not chunk or #chunk == 0 then
					break
				end

				local relPos = string.find(chunk, "[\r\n]", 1)

				if relPos then
					local matchChar = chunk:sub(relPos, relPos)
					local absoluteMatchPos = scanPos + scanned + relPos

					if matchChar == "\n" then
						endPos = absoluteMatchPos

						break
					end

					if matchChar == "\r" then
						local nextChar

						if relPos < #chunk then
							nextChar = chunk:sub(relPos + 1, relPos + 1)
						else
							file:seek("set", absoluteMatchPos)

							nextChar = file:read(1)
						end

						endPos = nextChar == "\n" and absoluteMatchPos + 1 or absoluteMatchPos
					end

					break
				end

				scanned = scanned + #chunk
			end
		end

		file:seek("set", 0)

		rawData = file:read(endPos)
	else
		local startPos = fileSize - maxReadSize
		local foundPos

		file:seek("set", startPos - 1)

		local headBytes = file:read(2)
		local prevByte = headBytes and headBytes:sub(1, 1)
		local currByte = headBytes and #headBytes >= 2 and headBytes:sub(2, 2)

		if prevByte == "\n" then
			foundPos = startPos
		elseif prevByte == "\r" then
			foundPos = currByte == "\n" and startPos + 1 or startPos
		end

		if not foundPos then
			file:seek("set", startPos)

			local chunkSize = 256
			local maxSearch = 4096
			local scanned = 0

			while scanned < maxSearch do
				local readSize = math.min(chunkSize, maxSearch - scanned)
				local chunk = file:read(readSize)

				if not chunk or #chunk == 0 then
					break
				end

				local nextLinePos = string.find(chunk, "[\r\n]", 1)

				if nextLinePos then
					local ch = chunk:sub(nextLinePos, nextLinePos)
					local absoluteNextLinePos = startPos + scanned + nextLinePos - 1

					if ch == "\n" then
						foundPos = absoluteNextLinePos + 1

						break
					end

					if ch == "\r" then
						local nextByte

						if nextLinePos < #chunk then
							nextByte = chunk:sub(nextLinePos + 1, nextLinePos + 1)
						else
							file:seek("set", absoluteNextLinePos + 1)

							nextByte = file:read(1)
						end

						foundPos = absoluteNextLinePos + (nextByte == "\n" and 2 or 1)
					end

					break
				end

				scanned = scanned + #chunk
			end
		end

		file:seek("set", foundPos or startPos)

		rawData = file:read("*a")
	end

	file:close()

	return rawData, fileSize
end

local function tryReadLogLines(logPath, maxReadSize, fromHead)
	local readSuccess, readResult, logFileSize = pcall(readLogLines, logPath, maxReadSize, fromHead)

	if not readSuccess then
		if fromHead then
			logger:error("Read head log lines failed, error: %s", tostring(readResult))
		else
			logger:error("Read recent log lines failed, error: %s", tostring(readResult))
		end

		return nil
	end

	if not readResult or readResult == "" or not logFileSize or logFileSize == 0 then
		if fromHead then
			logger:error("Read head log lines failed, result is empty or nil")
		else
			logger:error("Read recent log lines failed, result is empty or nil")
		end

		return nil
	end

	return readResult, logFileSize
end

local function tryCompressZstd(data)
	if not data or data == "" then
		return nil
	end

	local ok, compressResult = pcall(msgpack.compress_zstd, data)

	if not ok then
		logger:error("Zstd compress failed, err: %s", tostring(compressResult))

		return nil
	end

	if not compressResult or compressResult == "" then
		logger:error("Zstd compress failed, pcall status is true, but zstd compress result is nil or empty")

		return nil
	end

	return compressResult
end

local function getUploadLogZstdRaw(getPrevLog)
	local logPath

	if getPrevLog then
		logPath = _logPrevFullPath
	else
		logPath = _logFullPath
	end

	if not logPath or logPath == "" then
		return false
	end

	local readHeadResult, logFileSize = tryReadLogLines(logPath, MAX_UPLOAD_HEAD_LOG_RAW_SIZE, true)

	if not readHeadResult or not logFileSize or logFileSize == 0 then
		return false
	end

	local headBytesRead = #readHeadResult

	if logFileSize <= headBytesRead then
		local compressHeadResult = tryCompressZstd(readHeadResult)

		if not compressHeadResult then
			return false
		end

		return true, compressHeadResult
	end

	local unreadSize = logFileSize - headBytesRead
	local maxRecentReadSize = math.min(MAX_UPLOAD_RECENT_LOG_RAW_SIZE, unreadSize)
	local readRecentResult = tryReadLogLines(logPath, maxRecentReadSize, false)

	if not readRecentResult or readRecentResult == "" then
		return false
	end

	local skippedBytes = unreadSize - #readRecentResult

	if skippedBytes > 0 then
		local skippedMB = skippedBytes / 1048576
		local gapNotice = string.format("\n========================================================================\n" .. "[LOG TRUNCATED] Middle log omitted: ~%.2f MB (%d bytes)\n" .. "========================================================================\n\n", skippedMB, skippedBytes)

		readHeadResult = readHeadResult .. gapNotice
	else
		local lastHeadByte = readHeadResult:sub(-1)

		if lastHeadByte ~= "\r" and lastHeadByte ~= "\n" then
			readHeadResult = readHeadResult .. "\n"
		end
	end

	local compressHeadResult = tryCompressZstd(readHeadResult)

	if not compressHeadResult then
		return false
	end

	local compressRecentResult = tryCompressZstd(readRecentResult)

	if not compressRecentResult then
		return false
	end

	return true, compressHeadResult .. compressRecentResult
end

local function onUploadCallback(logName, isPrevLogUpload, success, httpStatus, error)
	if not success then
		logger:error("Upload log failed, %s: %s, http status: %s, error: %s", _uploadFolder, logName, httpStatus, error)
	elseif LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("Upload log success, %s: %s, http status: %s", _uploadFolder, logName, httpStatus)
	end

	if isPrevLogUpload then
		_isLogPrevUploaded = true

		return
	end

	_uploadRequestStartTime = 0

	if not success then
		ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_FAILED"))
	else
		_lastSuccessfulUploadTime = Time.getTickSecond()

		ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_SUCCESS"))
	end

	ClientUtils.gc()
end

local function body2LogString(body)
	local bodyType = type(body)
	local log

	if bodyType == "table" then
		log = table.val_to_str(body)
	elseif bodyType == "string" then
		log = #body <= 1024 and body or "string#" .. #body
	else
		log = tostring(body)
	end

	return log
end

local function sendHttpRequest(host, method, path, header, body, isSSL, callback)
	local HttpClientProxy = require("Core.Net.Http.HttpClientProxy")
	local HttpRequest = require("Core.Net.Http.HttpRequest")

	if path == nil then
		path = ""
	end

	local request = HttpRequest(host, nil, method, path, header, body, isSSL)

	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		local scheme = isSSL and "https" or "http"
		local logBody = body2LogString(body)

		logger:debug("[LogUpload] %s %s://%s%s\nHeader: %s\nBody: %s", method, scheme, host, path, table.val_to_str(header), logBody)
	end

	HttpClientProxy():httpRequest(request, 10000, function(reply)
		if LoggerManager.checkLogger(LoggerConst.DEBUG) then
			logger:debug("[LogUpload] http reply: %s", table.val_to_str(reply))
		end

		local SafeCallback = require("Core.Framework.SafeCallback")

		if not reply or reply == "" then
			SafeCallback(callback, false, -404, nil, nil)

			return
		end

		local httpStatus = tonumber(reply.header and reply.header.HTTP_STATUS)
		local replyErr = reply.err
		local success = httpStatus ~= nil and httpStatus >= 200 and httpStatus < 300 and replyErr == 0

		if not success and LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("[LogUpload] request failed, reply error: %s\nHeader: %s\nBody: %s", tostring(replyErr), table.val_to_str(reply.header), body2LogString(reply.body))
		end

		SafeCallback(callback, success, httpStatus, replyErr, reply.body)
	end, false)
end

local function createMultipartData(fields, filename, fileContent)
	local boundary = string.format("LuaBoundary_%x_%x", math.floor(Time.getMillisecondUTC()), math.floor(Time.getMicrosecond()))
	local delimiter = "--" .. boundary
	local parts = {}

	if fields then
		for key, value in pairs(fields) do
			table.insert(parts, delimiter)
			table.insert(parts, string.format("Content-Disposition: form-data; name=\"%s\"", key))
			table.insert(parts, "")
			table.insert(parts, tostring(value))
		end
	end

	table.insert(parts, delimiter)
	table.insert(parts, string.format("Content-Disposition: form-data; name=\"file\"; filename=\"%s\"", filename))
	table.insert(parts, "")
	table.insert(parts, fileContent)

	local fileIndex = #parts

	table.insert(parts, delimiter .. "--")
	table.insert(parts, "")

	local body = table.concat(parts, "\r\n")
	local headers = {
		["Content-Type"] = "multipart/form-data; boundary=" .. boundary,
		["Content-Length"] = tostring(#body)
	}

	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		parts[fileIndex] = "file#" .. #fileContent

		table.insert(parts, 1, "[LogUpload] multipart body data:")
		logger:debug(table.concat(parts, "\n"))

		parts = nil
	end

	return body, headers
end

local function getHttpUploadHost()
	local isDevEnv = not ClientConfigEnvType or ClientConfigEnvType <= 0
	local isCn = not ClientConfigAppCountry or ClientConfigAppCountry == "" or ClientConfigAppCountry == "cn"

	if isDevEnv then
		return isCn and HOST_DEV_CN or HOST_DEV_EN
	else
		return isCn and HOST_PROD_CN or HOST_PROD_EN
	end
end

local function getSafeUid()
	local uid = "0"

	if not pg.me then
		uid = "0"
	else
		uid = pg.me.uid

		if not uid or uid == "" then
			uid = "0"
		end
	end

	return uid
end

local function getRawFpAccountId()
	if not pg.global.sdkManager then
		return nil
	end

	return pg.global.sdkManager:getAccountId()
end

local function getSafeFpAccountId()
	local accountId = getRawFpAccountId()

	if not accountId or accountId == "" then
		return "0"
	end

	local repl = "_"

	if string.find(accountId, "_", 1, true) then
		repl = "-"
	end

	return string.gsub(accountId, "[^%w%-_]", repl)
end

local function createHttpApiRequestId(zstdRaw)
	local fpAccountIdId = getSafeFpAccountId()
	local uid = getSafeUid()
	local ms = math.floor(Time.getMillisecondUTC())
	local us = math.floor(Time.getMicrosecond())

	return string.format("%s_%s_%x_%x_%x", fpAccountIdId, uid, ms, us, #zstdRaw)
end

local function uploadByHttpApiV1(logName, logZstdRaw, isPrevLogUpload)
	local function requestCallback(success, httpStatus, error, response)
		if not success or httpStatus ~= 200 then
			onUploadCallback(logName, isPrevLogUpload, success, httpStatus, httpStatus == 200 and error or response)

			return
		end

		local decodeSuccess, decodeResult = pcall(json.decode, response)

		if not decodeSuccess then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, decodeResult)

			return
		end

		local data = decodeResult.data

		success = decodeResult.code == 200 and data and data.status == "uploaded"

		onUploadCallback(logName, isPrevLogUpload, success, httpStatus, response)
	end

	local HttpRequest = require("Core.Net.Http.HttpRequest")
	local host = getHttpUploadHost()
	local method = HttpRequest.Method.POST
	local multipartData = {
		["Content-Type"] = "application/octet-stream",
		["Content-Encoding"] = "zstd",
		request_id = createHttpApiRequestId(logZstdRaw),
		path = _uploadFolder,
		["Content-Disposition"] = string.format("attachment; filename=\"%s.log\"", logName)
	}
	local fileName = logName .. ".log.zst"
	local body, header = createMultipartData(multipartData, fileName, logZstdRaw)

	header.Authorization = API_BEARER_AUTH
	header.Accept = "application/json"

	sendHttpRequest(host, method, API_PATH_UPLOAD, header, body, true, requestCallback)
end

local function uploadByHttpApiV2(logName, logZstdRaw, isPrevLogUpload)
	local function signatureCallback(success, httpStatus, error, response)
		if not success or httpStatus ~= 200 then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, httpStatus == 200 and error or response)

			return
		end

		local decodeSuccess, decodeResult = pcall(json.decode, response)

		if not decodeSuccess then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, decodeResult)

			return
		end

		local data = decodeResult.data

		if decodeResult.code ~= 200 or not data or type(data) ~= "table" then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, response)

			return
		end

		local uploadValue = data.upload
		local directUploadValue = data.direct_upload

		if not uploadValue or type(uploadValue) ~= "table" or uploadValue.status ~= "pending" or not directUploadValue or type(directUploadValue) ~= "table" then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, response)

			return
		end

		local ossUrl = directUploadValue.url
		local ossHeaders = directUploadValue.headers

		if not ossUrl or ossUrl == "" or type(ossUrl) ~= "string" or not ossHeaders or type(ossHeaders) ~= "table" then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, response)

			return
		end

		local ossScheme, ossHost, ossPathAndQuery = string.match(ossUrl, "^([hH][tT][tT][pP][sS]?)://([^/]+)(.*)")

		if not ossScheme or not ossHost or ossHost == "" or not ossPathAndQuery or ossPathAndQuery == "" then
			onUploadCallback(logName, isPrevLogUpload, false, httpStatus, ossHost)

			return
		end

		local function uploadCallback(success, httpStatus, error, response)
			if not success or httpStatus ~= 200 then
				onUploadCallback(logName, isPrevLogUpload, false, httpStatus, httpStatus == 200 and error or response)

				return
			end

			onUploadCallback(logName, isPrevLogUpload, success, httpStatus, response)
		end

		local HttpRequest = require("Core.Net.Http.HttpRequest")
		local isSSL = ossScheme == "https" or string.lower(ossScheme) == "https" or string.lower(ossScheme) ~= "http"

		sendHttpRequest(ossHost, HttpRequest.Method.PUT, ossPathAndQuery, ossHeaders, logZstdRaw, isSSL, uploadCallback)
	end

	local body = {
		["Content-Encoding"] = "zstd",
		["Content-Type"] = "application/octet-stream",
		request_id = createHttpApiRequestId(logZstdRaw),
		path = _uploadFolder,
		file_name = logName .. ".log.zst",
		file_size = #logZstdRaw,
		["Content-Disposition"] = string.format("attachment; filename=\"%s.log\"", logName)
	}
	local header = {
		["Content-Type"] = "application/json",
		Accept = "application/json",
		Authorization = API_BEARER_AUTH
	}
	local HttpRequest = require("Core.Net.Http.HttpRequest")
	local host = getHttpUploadHost()
	local method = HttpRequest.Method.POST

	body = json.encode(body)

	sendHttpRequest(host, method, API_PATH_SIGN, header, body, true, signatureCallback)
end

local function uploadByClientService(logName, logZstdRaw, isPrevLogUpload)
	local key = string.format("%s/%s.log.zst", _uploadFolder, logName)

	local function serviceCallback(_, uploadSuccess, errorType, httpStatus)
		onUploadCallback(logName, isPrevLogUpload, uploadSuccess, httpStatus, errorType)
	end

	ClientUtils.addBinaryResource(OSS_RESOURCE_TYPE, key, logZstdRaw, serviceCallback)
end

local function uploadImpl(logName, logZstdRaw, isPrevLogUpload)
	if UPLOAD_API_TYPE == 0 then
		uploadByClientService(logName, logZstdRaw, isPrevLogUpload)
	elseif UPLOAD_API_TYPE == 1 then
		uploadByHttpApiV1(logName, logZstdRaw, isPrevLogUpload)
	elseif UPLOAD_API_TYPE == 2 then
		uploadByHttpApiV2(logName, logZstdRaw, isPrevLogUpload)
	else
		onUploadCallback(logName, isPrevLogUpload, false, -1, "Unknown upload api type: " .. UPLOAD_API_TYPE)
	end
end

local function getLogName(millisecondUTC, logSize)
	local fpAccountId = getSafeFpAccountId()
	local uid = getSafeUid()

	return string.format("%s_%s_%s_%x", fpAccountId, uid, millisecondUTC, logSize)
end

local function silentUploadPrevLog(millisecondUTC)
	if _isLogPrevUploaded or not _logPrevFullPath or _logPrevFullPath == "" then
		return
	end

	local success, logZstdRaw = getUploadLogZstdRaw(true)

	if not success or not logZstdRaw or logZstdRaw == "" then
		_isLogPrevUploaded = true

		return
	end

	local logName = getLogName(millisecondUTC, #logZstdRaw)

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("Start upload prev log, %s: %s, raw size: %.1f KB, log path: %s", _uploadFolder, logName, #logZstdRaw / 1024, _logPrevFullPath)
	end

	uploadImpl(logName, logZstdRaw, true)
end

function ClientLogUploadUtils.uploadLog()
	if not _isSupportedPlatform then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("当前平台不支持或未成功初始化日志上传模块, 该方法正常不应被触发, 平台: %s", tostring(UnityPlatform))
		end

		ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_INIT_FAILED"))

		return false
	end

	if UPLOAD_API_TYPE == 0 and (not pg.me or not pg.me.uid) then
		logger:error("Can't upload log, user not logged in or uid is nil")
		ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_INIT_FAILED"))

		return false
	end

	local nowDeviceTime = Time.getTickSecond()

	if _lastSuccessfulUploadTime > 0 and nowDeviceTime - _lastSuccessfulUploadTime <= 30 then
		ClientUtils.showBubbleMessageRaw(pg.getGameString("OPERATE_TOO_MANY"))

		return false
	end

	if _uploadRequestStartTime > 0 and nowDeviceTime - _uploadRequestStartTime <= 20 then
		ClientUtils.showBubbleMessageRaw(pg.getGameString("OPERATE_TOO_MANY"))

		return false
	end

	if not _uploadFolder or _uploadFolder == "" then
		logger:error("Can't upload log, upload folder is nil or empty")
		ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_INIT_FAILED"))

		return false
	end

	local millisecondUTC = math.floor(Time.getMillisecondUTC())

	logger:info("[%s][%s] Ready upload log, fpAccountId: %s, uid: %s, path: %s", millisecondUTC, _uploadFolder, getRawFpAccountId(), getSafeUid(), _logFullPath)
	pcall(silentUploadPrevLog, millisecondUTC - 1)

	if not _useUnityLogPath then
		local flushSuccess, flushError = pcall(CS.FunPlus.WorldX.Utils.DeviceLogPersister.FlushImmediate)

		if not flushSuccess and LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("强制执行自定义日志Flush失败, 平台: %s, 日志路径: %s, 错误: %s", tostring(UnityPlatform), _logFullPath, tostring(flushError))
		end
	end

	local success, logZstdRaw = getUploadLogZstdRaw(false)

	if not success or not logZstdRaw or logZstdRaw == "" then
		ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_INIT_FAILED"))

		return false
	end

	local logName = getLogName(millisecondUTC, #logZstdRaw)

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("Start upload log, %s: %s, raw size: %.1f KB", _uploadFolder, logName, #logZstdRaw / 1024)
	end

	_uploadRequestStartTime = nowDeviceTime

	ClientUtils.showBubbleMessageRaw(pg.getGameString("UPLOAD_LOG_START"))
	uploadImpl(logName, logZstdRaw, false)
	ClientUtils.gc()

	return true
end

function ClientLogUploadUtils.isSupportedPlatform()
	if not _isSupportedPlatform then
		return false
	end

	if UPLOAD_API_TYPE == 0 and (not pg.me or not pg.me.uid) then
		return false
	end

	return true
end

return ClientLogUploadUtils
