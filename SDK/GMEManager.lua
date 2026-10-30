-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\GMEManager.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("GMEManager")
local Class = require("Core.Framework.Class")
local ClientSwitch = require("Common.ClientSwitch")
local MessageName = require("Const.MessageName")
local AudioConst = require("Const.AudioConst")
local Time = require("Core.Common.Time")
local json = require("Lib.json")
local Const = require("Common.Const.Const")
local TimerManager = require("Core.Timer.TimerManager")
local Utils = require("Common/Utils/Utils")
local base64 = require("base64")
local zlib = require("zlib")
local Sha256 = require("Core.Common.Sha256")
local GMEManager = Class.OldLightClass("GMEManager", nil, true)
local NVIDIA_RECORD_MIN_HOLD_SECONDS = 1.5
local RECORD_MODE_STREAMING = "streaming"
local RECORD_MODE_LOCAL = "local"
local MIN_RECORD_DURATION = 1000
local TRANSLATE_TEXT_TIMEOUT = 15
local TRANSLATE_TEXT_SUSPEND_RECOVER = 30
local RECORD_STOP_TIMEOUT = 10
local USER_SIG_REFRESH_ADVANCE = 300
local USER_SIG_REQUEST_TIMEOUT = 10
local DOWNLOAD_FILE_TIMEOUT = 30
local ROOM_EVENT_SWITCH_COMPLETE = 13
local GME_ERROR_MESSAGE = {
	[4100] = "VOICE_RECORD_AUDIO_TOO_SHORT",
	[32769] = "ERR_VOICE_S2T_SYSTEM_INTERNAL_ERROR"
}
local ITMG_EVENT_ID_USER_UPDATE = {
	NO_AUDIO = 6,
	HAS_AUDIO = 5,
	MIC_CLOSED = 4,
	MIC_OPENED = 3,
	EXIT = 2,
	ENTER = 1
}

function GMEManager:ctor()
	self:clear()
end

function GMEManager:clear()
	self:_cancelTranslateTimers()
	self:_cancelRecordStopTimeout()

	if self.userSigRequestTimerId then
		TimerManager.removeTimer(self.userSigRequestTimerId)
	end

	for _, timerId in pairs(self.downloadFileRequestTimers or {}) do
		TimerManager.removeTimer(timerId)
	end

	self.recordFiles = self.recordFiles or {}
	self.recordStopCallbacks = {}
	self.recording = false
	self.recordStopping = false
	self.recordStartRequesting = false
	self.recordStartRequestSeq = (self.recordStartRequestSeq or 0) + 1
	self.recordStartCallback = nil
	self.recordStartedAt = nil
	self.recordMode = nil
	self.localRecordStopCallback = nil
	self.recordStopTimerId = nil
	self.cacheVolume = nil
	self.playFromSequence = false
	self.audioPlaySequence = {}
	self.playCompleteIgnoreMap = {}
	self.curPlayingFilePath = nil
	self.curPlayingChannel = nil
	self.playFileCallback = nil
	self.pendingPlayFileId = nil
	self.uploadFileQueue = {}
	self.currentUploadFileRequest = nil
	self.downloadFileCallbacks = {}
	self.downloadFileRequesting = {}
	self.downloadFileRequestTimers = {}
	self.downloadFileRequestPaths = {}
	self.downloadFileRequestSeq = self.downloadFileRequestSeq or 0
	self.translateTextRequestId = 0
	self.translateTextQueue = {}
	self.translateTextRequests = {}
	self.currentTranslateTextRequest = nil
	self.translateTextSuspended = false
	self.translateSuspendTimerId = nil
	self.enterRoomCallback = nil
	self.switchRoomCallback = nil
	self.exitRoomCallback = nil
	self.currentRoomId = nil
	self.reportedRtcRoomId = nil
	self.roomAuthGeneration = (self.roomAuthGeneration or 0) + 1
	self.userSig = nil
	self.userSigExpireTime = 0
	self.userSigRequesting = false
	self.userSigRequestTimerId = nil
	self.userSigCallbacks = {}
	self.userSigRequestUid = nil
	self.userSigRequestAppId = nil
	self.userSigGeneration = (self.userSigGeneration or 0) + 1
end

function GMEManager:connect()
	local appId = tostring(Utils.getServerAppId())

	self.csgmeManager:Connect(appId, tostring(pg.me.uid))
end

function GMEManager:getUserSign(callback)
	local now = math.floor(Time.secondCache)

	if not string.isNilOrEmpty(self.userSig) and now < (self.userSigExpireTime or 0) - USER_SIG_REFRESH_ADVANCE then
		self:_invokeCallback(callback, self.userSig, self.userSigExpireTime)

		return self.userSig
	end

	if callback then
		table.insert(self.userSigCallbacks, callback)
	end

	if self.userSigRequesting then
		return nil
	end

	if not pg.me or not pg.me.serverMsg then
		local callbacks = self.userSigCallbacks

		self.userSigCallbacks = {}

		for _, pendingCallback in ipairs(callbacks) do
			self:_invokeCallback(pendingCallback, nil, 0)
		end

		return nil
	end

	self.userSigRequesting = true
	self.userSigRequestUid = tostring(pg.me.uid)
	self.userSigRequestAppId = tostring(Utils.getServerAppId())

	local generation = self.userSigGeneration

	self.userSigRequestTimerId = TimerManager.addTimer(USER_SIG_REQUEST_TIMEOUT, function()
		if generation ~= self.userSigGeneration or not self.userSigRequesting then
			return
		end

		self.userSigRequestTimerId = nil
		self.userSigRequesting = false
		self.userSigRequestUid = nil
		self.userSigRequestAppId = nil

		local callbacks = self.userSigCallbacks

		self.userSigCallbacks = {}

		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("GenerateUserSig timeout")
		end

		for _, pendingCallback in ipairs(callbacks) do
			self:_invokeCallback(pendingCallback, nil, 0)
		end
	end)

	pg.me:serverMsg("RPC_CS_GenerateUserSig")

	return nil
end

function GMEManager:onUserSigGenerated(userSig, expireTime)
	if not self.userSigRequesting then
		return
	end

	local signedUid, signedAppId = self:decodeUserSigIdentity(userSig)

	if signedUid ~= self.userSigRequestUid or signedAppId ~= self.userSigRequestAppId then
		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("Ignore mismatched UserSig response: expected uid=%s appId=%s, actual uid=%s appId=%s", tostring(self.userSigRequestUid), tostring(self.userSigRequestAppId), tostring(signedUid), tostring(signedAppId))
		end

		return
	end

	if self.userSigRequestTimerId then
		TimerManager.removeTimer(self.userSigRequestTimerId)

		self.userSigRequestTimerId = nil
	end

	self.userSigRequesting = false
	self.userSigRequestUid = nil
	self.userSigRequestAppId = nil
	expireTime = tonumber(expireTime) or 0

	if not string.isNilOrEmpty(userSig) and expireTime > math.floor(Time.secondCache) then
		self.userSig = userSig
		self.userSigExpireTime = expireTime
	else
		self.userSig = nil
		self.userSigExpireTime = 0
	end

	local callbacks = self.userSigCallbacks

	self.userSigCallbacks = {}

	for _, pendingCallback in ipairs(callbacks) do
		self:_invokeCallback(pendingCallback, self.userSig, self.userSigExpireTime)
	end
end

function GMEManager:_notifyRoomResult(callback, code)
	local roomId, isRoomEntered

	if self.enterRoomCallback == nil and self.switchRoomCallback == nil then
		roomId = self:GetRoomId()
		isRoomEntered = self:IsRoomEntered()
		self.currentRoomId = isRoomEntered and roomId or nil

		self:_syncRtcRoomMemberStatus(self.currentRoomId)
	end

	self:onReceiveError(code)
	self:_invokeCallback(callback, code, roomId, isRoomEntered)
end

function GMEManager:_syncRtcRoomMemberStatus(roomId)
	roomId = not string.isNilOrEmpty(roomId) and tostring(roomId) or nil

	if self.reportedRtcRoomId == roomId then
		return
	end

	local player = pg.me

	if not player or not player.server then
		return
	end

	if self.reportedRtcRoomId then
		player:serverMsg("RPC_CS_SetRtcRoomMemberStatus", self.reportedRtcRoomId, false)
	end

	if roomId then
		player:serverMsg("RPC_CS_SetRtcRoomMemberStatus", roomId, true)
	end

	self.reportedRtcRoomId = roomId
end

function GMEManager:_getVoiceCacheKey(fileId)
	if string.isNilOrEmpty(fileId) then
		return nil
	end

	return Sha256.hex(fileId)
end

function GMEManager:_getCachedRecordedFilePath(cacheKey)
	if string.isNilOrEmpty(cacheKey) or not self.csgmeManager then
		return nil
	end

	local filePath = self.recordFiles[cacheKey]

	if not string.isNilOrEmpty(filePath) and self.csgmeManager:RecordFileExists(filePath) then
		return filePath
	end

	self.recordFiles[cacheKey] = nil

	local deterministicPath = self.csgmeManager:GetRecordFilePath(cacheKey .. ".ogg")

	if not self.csgmeManager:RecordFileExists(deterministicPath) then
		return nil
	end

	self.recordFiles[cacheKey] = deterministicPath

	return deterministicPath
end

function GMEManager:_normalizeRecordedFilePath(filePath, cacheKey)
	if string.isNilOrEmpty(filePath) or string.isNilOrEmpty(cacheKey) then
		return filePath
	end

	if not self.csgmeManager then
		return filePath
	end

	return self.csgmeManager:NormalizeRecordFilePath(filePath, cacheKey .. ".ogg")
end

function GMEManager:Init()
	local mgr = CS.FunPlus.WorldX.SDK.Tencent.GMEManager

	mgr.InitFromLua()

	self.csgmeManager = mgr.GetInstance()
end

function GMEManager:UnInit()
	if self:checkSDKValid() then
		self:restoreIOSRecordState()
		self.csgmeManager:UnInit()
	end

	self:_syncRtcRoomMemberStatus(nil)
	self:clear()
end

function GMEManager:PreloadUserSign()
	if not self:checkSDKValid() then
		return
	end

	self:connect()
	self:getUserSign()
end

function GMEManager:CheckMicPermission()
	if self:checkSDKValid() then
		return self.csgmeManager:CheckMicPermission()
	end
end

function GMEManager:GetSendStreamLevel()
	if self:checkSDKValid() then
		return self.csgmeManager:GetSendStreamLevel()
	end
end

function GMEManager:GetRecvStreamLevel(userID)
	if self:checkSDKValid() then
		return self.csgmeManager:GetRecvStreamLevel(userID)
	end
end

function GMEManager:GetSpeakerLevel()
	if self:checkSDKValid() then
		return self.csgmeManager:GetSpeakerLevel()
	end
end

function GMEManager:GetMicLevel()
	if self:checkSDKValid() then
		return self.csgmeManager:GetMicLevel()
	end
end

function GMEManager:GetRoomId()
	if self:checkSDKValid() then
		return self.csgmeManager:GetRoomId() or ""
	end

	return ""
end

function GMEManager:IsRoomEntered()
	return self:checkSDKValid() and self.csgmeManager:IsRoomEntered() or false
end

function GMEManager:ChangeRoomType(room)
	if self:checkSDKValid() then
		self.csgmeManager:ChangeRoomType(room)
	end
end

function GMEManager:GetRoomType()
	if self:checkSDKValid() then
		return self.csgmeManager:GetRoomType()
	end

	return Const.GME_VOICE_ROOM_TYPE.FLUENCY
end

function GMEManager:EnterRoom(roomId, roomType, callback)
	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1)

		return
	end

	local authGeneration = self.roomAuthGeneration

	self:connect()
	self:getUserSign(function(userSig)
		if authGeneration ~= self.roomAuthGeneration then
			return
		end

		if not self:checkSDKValid() or string.isNilOrEmpty(userSig) then
			self:_invokeCallback(callback, -1)

			return
		end

		local code = self.csgmeManager:EnterRoom(tostring(roomId), userSig, roomType or Const.GME_VOICE_ROOM_TYPE.FLUENCY)

		if code ~= 0 then
			self:_invokeCallback(callback, code)
			self:onReceiveError(code)

			return
		end

		self.enterRoomCallback = callback or false
	end)
end

function GMEManager:SwitchRoom(roomId, callback)
	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1)

		return
	end

	local authGeneration = self.roomAuthGeneration

	self:connect()
	self:getUserSign(function(userSig)
		if authGeneration ~= self.roomAuthGeneration then
			return
		end

		if not self:checkSDKValid() or string.isNilOrEmpty(userSig) then
			self:_invokeCallback(callback, -1)

			return
		end

		local code = self.csgmeManager:SwitchRoom(tostring(roomId), userSig)

		if code ~= 0 then
			self:_invokeCallback(callback, code)
			self:onReceiveError(code)

			return
		end

		self.switchRoomCallback = callback or false
	end)
end

function GMEManager:ExitRoom(callback)
	self.roomAuthGeneration = self.roomAuthGeneration + 1

	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1)

		return
	end

	local code = self.csgmeManager:ExitRoom()

	if code ~= 0 then
		self:_invokeCallback(callback, code)
		self:onReceiveError(code)

		return
	end

	self.exitRoomCallback = callback or false
end

function GMEManager:MutedUser(userId)
	if self:checkSDKValid() then
		self.csgmeManager:MutedUser(userId)
	end
end

function GMEManager:UnMutedUser(userId)
	if self:checkSDKValid() then
		self.csgmeManager:UnMutedUser(userId)
	end
end

function GMEManager:IsAudioCaptureDeviceEnabled()
	if self:checkSDKValid() then
		return self.csgmeManager:IsAudioCaptureDeviceEnabled()
	end

	return false
end

function GMEManager:EnableMic(isOn, isSend)
	if self:checkSDKValid() then
		isSend = isSend or false

		self.csgmeManager:EnableMic(isOn, isSend)

		local micVol = pg.game.setting:getMicVol()

		self:SetMicVolume(micVol)
	end
end

function GMEManager:GetMicState()
	if self:checkSDKValid() then
		return self.csgmeManager:GetMicState() == 1
	end

	return false
end

function GMEManager:EnableSpeaker(isOn, isRecv)
	if self:checkSDKValid() then
		isRecv = isRecv or false

		self.csgmeManager:EnableSpeaker(isOn, isRecv)
	end
end

function GMEManager:GetSpeakerState()
	if self:checkSDKValid() then
		return self.csgmeManager:GetSpeakerState() == 1
	end

	return false
end

function GMEManager:SetMicVolume(volume)
	if self:checkSDKValid() then
		self.csgmeManager:SetMicVolume(volume)
	end
end

function GMEManager:SetSpeakerVolume(volume)
	if self:checkSDKValid() then
		local masterVol = pg.game.setting:getVolume(AudioConst.VolumeType.All)

		self.csgmeManager:SetSpeakerVolume(math.floor(volume * masterVol * 0.02))
	end
end

function GMEManager:_canStartRecording(operationName)
	if not self:checkSDKValid() then
		return false
	end

	if self.recordStartRequesting or self.recording or self.recordStopping then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("%s ignored: recordStartRequesting=%s recording=%s recordStopping=%s", operationName, tostring(self.recordStartRequesting), tostring(self.recording), tostring(self.recordStopping))
		end

		return false
	end

	return true
end

function GMEManager:_finishStreamingRecordingStart(requestSeq, started, code)
	if requestSeq ~= self.recordStartRequestSeq or not self.recordStartRequesting then
		return
	end

	self.recordStartRequesting = false

	local callback = self.recordStartCallback

	self.recordStartCallback = nil

	self:_invokeCallback(callback, started, code)
end

function GMEManager:CancelPendingStreamingRecording()
	if not self.recordStartRequesting then
		return false
	end

	self.recordStartRequestSeq = self.recordStartRequestSeq + 1
	self.recordStartRequesting = false

	local callback = self.recordStartCallback

	self.recordStartCallback = nil

	self:_invokeCallback(callback, false, -1)

	return true
end

function GMEManager:_prepareRecordingStart()
	if UNITY_IOS then
		self.csgmeManager:SetMediaCapture(true)

		self.cacheVolume = pg.game.setting:getVolume(AudioConst.VolumeType.All)

		pg.game.setting:setVolume(AudioConst.VolumeType.All, 0)
	end

	self:EnableMic(false, true)
	self:connect()
end

function GMEManager:_restoreRecordingEnvironment()
	self:restoreMicAfterRecording()
	self:restoreIOSRecordState()
end

function GMEManager:_completeRecordingStart(result, recordMode, operationName)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("%s result=%s", operationName, tostring(result))
	end

	if result ~= 0 then
		self:_restoreRecordingEnvironment()

		return false
	end

	self.recording = true
	self.recordStopping = false
	self.recordStartedAt = Time.realtimeSinceStartup
	self.recordMode = recordMode

	return true
end

function GMEManager:_canStopRecording(expectedMode, operationName)
	if not self.recording or self.recordMode ~= expectedMode then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("%s ignored: recording=%s recordStopping=%s mode=%s", operationName, tostring(self.recording), tostring(self.recordStopping), tostring(self.recordMode))
		end

		return false
	end

	return true
end

function GMEManager:_requestRecordingStop(recordMode, operationName)
	self.recording = false
	self.recordStartedAt = nil
	self.recordStopping = true

	self:restoreMicAfterRecording()

	local result

	if recordMode == RECORD_MODE_LOCAL then
		result = self.csgmeManager:StopLocalRecording()
	else
		result = self.csgmeManager:StopStreamingRecording()
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("%s result=%s", operationName, tostring(result))
	end

	self:restoreIOSRecordState()

	if result ~= 0 then
		self.recordStopping = false
		self.recordMode = nil

		self:onReceiveError(result)
	end

	return result
end

function GMEManager:_resetRecordingState()
	self.recording = false
	self.recordStopping = false
	self.recordStartedAt = nil
	self.recordMode = nil

	self:_cancelRecordStopTimeout()
end

function GMEManager:StartLocalRecording()
	if not self:_canStartRecording("StartLocalRecording") then
		return false
	end

	self:_prepareRecordingStart()

	local result = self.csgmeManager:StartLocalRecording(self:getRecordFileName())

	return self:_completeRecordingStart(result, RECORD_MODE_LOCAL, "StartLocalRecording")
end

function GMEManager:StartStreamingRecording(speechLanguage, translateLanguage, onStarted)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("StartStreamingRecording entered at=%.3f recording=%s recordStopping=%s", Time.realtimeSinceStartup, tostring(self.recording), tostring(self.recordStopping))
	end

	local _h = GMEManager._platformHooks

	if _h and _h.StartStreamingRecording and _h.StartStreamingRecording(self) then
		self:_invokeCallback(onStarted, false, -1)

		return false
	end

	if not self:_canStartRecording("StartStreamingRecording") then
		self:_invokeCallback(onStarted, false, -1)

		return false
	end

	self:connect()

	self.recordStartRequestSeq = self.recordStartRequestSeq + 1

	local requestSeq = self.recordStartRequestSeq

	self.recordStartRequesting = true
	self.recordStartCallback = onStarted

	local resolvedSynchronously = false
	local synchronousResult = false

	self:getUserSign(function(userSig)
		if requestSeq ~= self.recordStartRequestSeq or not self.recordStartRequesting then
			return
		end

		if not self:checkSDKValid() or string.isNilOrEmpty(userSig) then
			resolvedSynchronously = true

			self:_finishStreamingRecordingStart(requestSeq, false, -1)

			return
		end

		self:_prepareRecordingStart()

		speechLanguage = speechLanguage or Const.COUNTRY_LANGUAGES_CODE.CN
		translateLanguage = translateLanguage or Const.COUNTRY_LANGUAGES_CODE.CN

		local fileName = self:getRecordFileName()

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("SDK StartStreamingRecording called at=%.3f fileName=%s speechLanguage=%s translateLanguage=%s", Time.realtimeSinceStartup, tostring(fileName), tostring(speechLanguage), tostring(translateLanguage))
		end

		local result = self.csgmeManager:StartStreamingRecording(fileName, userSig, speechLanguage, translateLanguage)

		synchronousResult = self:_completeRecordingStart(result, RECORD_MODE_STREAMING, "StartStreamingRecording")
		resolvedSynchronously = true

		self:_finishStreamingRecordingStart(requestSeq, synchronousResult, result)
	end)

	return not resolvedSynchronously or synchronousResult
end

function GMEManager:StopLocalRecording(onComplete)
	if not self:_canStopRecording(RECORD_MODE_LOCAL, "StopLocalRecording") then
		return false
	end

	if not self:checkSDKValid() then
		self:_restoreRecordingEnvironment()
		self:_resetRecordingState()
		self:_invokeCallback(onComplete, nil, nil, nil, -1, false)

		return false
	end

	local holdDuration = self.recordStartedAt and Time.realtimeSinceStartup - self.recordStartedAt or 0

	self:EnableMic(false, true)

	if holdDuration < NVIDIA_RECORD_MIN_HOLD_SECONDS then
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("StopLocalRecording cancelled: holdDuration=%.3f minDuration=%.3f", holdDuration, NVIDIA_RECORD_MIN_HOLD_SECONDS)
		end

		local result = self.csgmeManager:CancelRecording()

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("CancelRecording for short press result=%s", tostring(result))
		end

		self:_restoreRecordingEnvironment()
		self:_resetRecordingState()
		pg.global.showBubbleMessageRaw(pg.getGameString("VOICE_RECORD_AUDIO_TOO_SHORT"))
		self:_invokeCallback(onComplete, nil, nil, nil, 0, true)

		return false
	end

	self.localRecordStopCallback = onComplete

	local result = self:_requestRecordingStop(RECORD_MODE_LOCAL, "StopLocalRecording")

	if result ~= 0 then
		local callback = self.localRecordStopCallback

		self.localRecordStopCallback = nil

		self:_invokeCallback(callback, nil, nil, nil, result, false)

		return false
	end

	self:_scheduleRecordStopTimeout(RECORD_MODE_LOCAL)

	return true
end

function GMEManager:StopStreamingRecording(onComplete)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("StopStreamingRecording entered at=%.3f recording=%s recordStopping=%s", Time.realtimeSinceStartup, tostring(self.recording), tostring(self.recordStopping))
	end

	if self:CancelPendingStreamingRecording() then
		self:_invokeCallback(onComplete, nil, nil, nil, nil, nil, nil, -1, false)

		return false
	end

	if not self:_canStopRecording(RECORD_MODE_STREAMING, "StopStreamingRecording") then
		return false
	end

	if not self:checkSDKValid() then
		self:_restoreRecordingEnvironment()
		self:_resetRecordingState()
		self:_invokeCallback(onComplete, nil, nil, nil, nil, nil, nil, -1, false)

		return false
	end

	if onComplete then
		table.insert(self.recordStopCallbacks, onComplete)
	end

	local result = self:_requestRecordingStop(RECORD_MODE_STREAMING, "StopStreamingRecording")

	if result ~= 0 then
		self:_notifyRecordStopped(nil, nil, nil, nil, nil, nil, result, false)

		return false
	end

	self:_scheduleRecordStopTimeout(RECORD_MODE_STREAMING)

	return true
end

function GMEManager:CancelRecording()
	local pendingStartCancelled = self:CancelPendingStreamingRecording()

	self.localRecordStopCallback = nil
	self.recordStopCallbacks = {}

	self:_resetRecordingState()

	local sdkValid = self:checkSDKValid()
	local result = -1

	if sdkValid and not pendingStartCancelled then
		result = self.csgmeManager:CancelRecording()

		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("CancelRecording result=%s", tostring(result))
		end
	end

	self:_restoreRecordingEnvironment()

	return pendingStartCancelled or sdkValid and result == 0
end

function GMEManager:restoreMicAfterRecording()
	facade:SendMessageCommand(MessageName.GME_RECORD_WILL_STOP, {})
end

function GMEManager:restoreIOSRecordState()
	if UNITY_IOS and self.cacheVolume then
		pg.game.setting:setVolume(AudioConst.VolumeType.All, self.cacheVolume)

		self.cacheVolume = nil

		self.csgmeManager:SetMediaCapture(false)
	end
end

function GMEManager:_cancelRecordStopTimeout()
	if self.recordStopTimerId then
		TimerManager.removeTimer(self.recordStopTimerId)

		self.recordStopTimerId = nil
	end
end

function GMEManager:_scheduleRecordStopTimeout(recordMode)
	self:_cancelRecordStopTimeout()

	self.recordStopTimerId = TimerManager.addTimer(RECORD_STOP_TIMEOUT, function()
		self.recordStopTimerId = nil

		if not self.recordStopping or self.recordMode ~= recordMode then
			return
		end

		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("StopRecording timeout: mode=%s no completion callback in %ss", tostring(recordMode), tostring(RECORD_STOP_TIMEOUT))
		end

		self:_resetRecordingState()

		if recordMode == RECORD_MODE_LOCAL then
			local callback = self.localRecordStopCallback

			self.localRecordStopCallback = nil

			self:_invokeCallback(callback, nil, nil, nil, -1, false)
		else
			self:_notifyRecordStopped(nil, nil, nil, nil, nil, nil, -1, false)
		end
	end)
end

function GMEManager:_notifyRecordStopped(fileId, filePath, fileSize, duration, text, auditResult, code, tooShort)
	if not self.recordStopCallbacks or #self.recordStopCallbacks == 0 then
		return
	end

	local callbacks = self.recordStopCallbacks

	self.recordStopCallbacks = {}

	for _, callback in ipairs(callbacks) do
		local res, err = xpcall(callback, debug.traceback, fileId, filePath, fileSize, duration, text, auditResult, code, tooShort)

		if not res and LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("Error in record stop callback : %s", tostring(err))
		end
	end
end

function GMEManager:PlayRecordedFile(fileId, callback)
	if string.isNilOrEmpty(fileId) then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("PlayRecordedFile invalid fileId: %s", tostring(fileId))
		end

		self:_invokeCallback(callback, -1, nil)

		return
	end

	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1, nil)

		return
	end

	local cacheKey = self:_getVoiceCacheKey(fileId)

	if self.playFileCallback then
		self:_invokeCallback(self.playFileCallback, -1, self.curPlayingFilePath)
	end

	self.playFromSequence = false
	self.audioPlaySequence = {}
	self.curPlayingChannel = nil
	self.playFileCallback = callback

	local filePath = self:_getCachedRecordedFilePath(cacheKey)

	if filePath then
		self:_playRecordedFile(filePath, fileId)
	else
		self.pendingPlayFileId = cacheKey

		self:DownloadRecordedFile(fileId, self:_getDownloadFileName(cacheKey))
	end
end

function GMEManager:PlayRecordedFileSequence(fileId, curChannel, callback)
	if string.isNilOrEmpty(fileId) then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("PlayRecordedFileSequence invalid fileId: %s", tostring(fileId))
		end

		self:_invokeCallback(callback, -1, nil)

		return
	end

	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1, nil)

		return
	end

	local cacheKey = self:_getVoiceCacheKey(fileId)

	if not self.playFromSequence and self.playFileCallback and self.playFileCallback ~= callback then
		local previous = self.playFileCallback

		self.playFileCallback = nil

		self:_invokeCallback(previous, -1, self.curPlayingFilePath)
	end

	if callback then
		self.playFileCallback = callback
	end

	if not table.contains(self.audioPlaySequence, fileId) then
		self.audioPlaySequence[#self.audioPlaySequence + 1] = fileId
	end

	if not self.playFromSequence then
		self.playFromSequence = true
		self.curPlayingChannel = curChannel

		local filePath = self:_getCachedRecordedFilePath(cacheKey)

		if filePath then
			self:_playRecordedFileSeqTop()
		else
			self.pendingPlayFileId = cacheKey

			self:DownloadRecordedFile(fileId, self:_getDownloadFileName(cacheKey))
		end
	end
end

function GMEManager:getCurPlayingChannel()
	return self.curPlayingChannel
end

function GMEManager:_playRecordedFileSeqTop()
	if not self.audioPlaySequence[1] then
		self.playFromSequence = false

		return
	end

	local fileId = self.audioPlaySequence[1]
	local cacheKey = self:_getVoiceCacheKey(fileId)
	local filePath = self:_getCachedRecordedFilePath(cacheKey)

	if filePath then
		self:_playRecordedFile(filePath, fileId, true)
		table.remove(self.audioPlaySequence, 1)
	else
		self.pendingPlayFileId = cacheKey

		self:DownloadRecordedFile(fileId, self:_getDownloadFileName(cacheKey))
	end
end

function GMEManager:_playRecordedFile(filePath, fileId, fromSequence)
	if self:checkSDKValid() then
		if self.curPlayingFilePath == filePath then
			self:_markIgnorePlayComplete(self.curPlayingFilePath)
		end

		self.curPlayingFilePath = filePath

		self.csgmeManager:PlayRecordedFile(filePath)
		facade:SendMessageCommand(MessageName.GME_PLAY_FILE_START, {
			filePath = filePath,
			fileId = fileId,
			fromSequence = fromSequence or false
		})
	end
end

function GMEManager:_markIgnorePlayComplete(filePath)
	if string.isNilOrEmpty(filePath) then
		return
	end

	if not self.playCompleteIgnoreMap then
		self.playCompleteIgnoreMap = {}
	end

	self.playCompleteIgnoreMap[filePath] = (self.playCompleteIgnoreMap[filePath] or 0) + 1
end

function GMEManager:_consumeIgnorePlayComplete(filePath)
	if string.isNilOrEmpty(filePath) or not self.playCompleteIgnoreMap then
		return false
	end

	local count = self.playCompleteIgnoreMap[filePath]

	if not count or count <= 0 then
		return false
	end

	if count == 1 then
		self.playCompleteIgnoreMap[filePath] = nil
	else
		self.playCompleteIgnoreMap[filePath] = count - 1
	end

	return true
end

function GMEManager:StopPlayFile()
	if self:checkSDKValid() then
		local stoppedFilePath = self.curPlayingFilePath

		if self.curPlayingFilePath then
			self:_markIgnorePlayComplete(self.curPlayingFilePath)
		end

		self.csgmeManager:StopPlayFile()

		self.curPlayingFilePath = nil
		self.playFromSequence = false
		self.audioPlaySequence = {}
		self.curPlayingChannel = nil
		self.pendingPlayFileId = nil

		local callback = self.playFileCallback

		self.playFileCallback = nil

		if callback then
			self:_invokeCallback(callback, -1, stoppedFilePath)
		end
	end
end

function GMEManager:_startNextUploadFileRequest()
	if self.currentUploadFileRequest or #self.uploadFileQueue == 0 then
		return
	end

	local request = table.remove(self.uploadFileQueue, 1)

	self.currentUploadFileRequest = request

	self:_withPTTAuth(function()
		if self.currentUploadFileRequest ~= request then
			return
		end

		local result = self.csgmeManager:UploadRecordedFile(request.filePath)

		if result ~= 0 then
			self:_completeUploadFileRequest(result, request.filePath, nil, nil)
		end
	end, function(code)
		if self.currentUploadFileRequest ~= request then
			return
		end

		self.currentUploadFileRequest = nil
		code = code or -1

		self:onReceiveError(code)
		self:_invokeCallback(request.callback, code, request.filePath, nil, nil, request.filePath)
		self:_startNextUploadFileRequest()
	end)
end

function GMEManager:_completeUploadFileRequest(code, filePath, fileId, auditResult)
	local request = self.currentUploadFileRequest

	if not request then
		return
	end

	self.currentUploadFileRequest = nil

	local sourceFilePath = request.filePath
	local cacheKey = code == 0 and self:_getVoiceCacheKey(fileId) or nil

	if code == 0 and cacheKey then
		filePath = self:_normalizeRecordedFilePath(filePath, cacheKey)

		if not self.csgmeManager:RecordFileExists(filePath) then
			code = -1
		else
			self.recordFiles[cacheKey] = filePath
		end
	elseif code == 0 then
		code = -1
	end

	self:onReceiveError(code)
	self:_invokeCallback(request.callback, code, filePath, fileId, auditResult, sourceFilePath)
	self:_startNextUploadFileRequest()
end

function GMEManager:UploadRecordedFile(filePath, callback)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("UploadRecordedFile entered at=%.3f filePath=%s", Time.realtimeSinceStartup, tostring(filePath))
	end

	if string.isNilOrEmpty(filePath) then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("UploadRecordedFile invalid filePath: %s", tostring(filePath))
		end

		self:_invokeCallback(callback, -1, filePath, nil, nil, filePath)

		return
	end

	local _h = GMEManager._platformHooks

	if _h and _h.UploadRecordedFile and _h.UploadRecordedFile(self, filePath) then
		self:_invokeCallback(callback, -1, filePath, nil, nil, filePath)

		return
	end

	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1, filePath, nil, nil, filePath)

		return
	end

	table.insert(self.uploadFileQueue, {
		filePath = filePath,
		callback = callback
	})
	self:_startNextUploadFileRequest()
end

function GMEManager:_cancelDownloadFileTimeout(cacheKey)
	local timerId = self.downloadFileRequestTimers[cacheKey]

	if timerId then
		TimerManager.removeTimer(timerId)

		self.downloadFileRequestTimers[cacheKey] = nil
	end
end

function GMEManager:_scheduleDownloadFileTimeout(cacheKey, fileId, filePath)
	self:_cancelDownloadFileTimeout(cacheKey)

	self.downloadFileRequestTimers[cacheKey] = TimerManager.addTimer(DOWNLOAD_FILE_TIMEOUT, function()
		self.downloadFileRequestTimers[cacheKey] = nil

		if not self.downloadFileRequesting[cacheKey] then
			return
		end

		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("DownloadRecordedFile timeout: fileId=%s filePath=%s", tostring(fileId), tostring(filePath))
		end

		self:_completeDownloadRecordedFile(-1, filePath, fileId, cacheKey, nil)
	end)
end

function GMEManager:_isSameRecordFilePath(firstPath, secondPath)
	if string.isNilOrEmpty(firstPath) or string.isNilOrEmpty(secondPath) then
		return false
	end

	local normalizedFirstPath = firstPath:gsub("\\", "/")
	local normalizedSecondPath = secondPath:gsub("\\", "/")

	if normalizedFirstPath == normalizedSecondPath then
		return true
	end

	local firstFileName = normalizedFirstPath:match("([^/]+)$")
	local secondFileName = normalizedSecondPath:match("([^/]+)$")

	return firstFileName ~= nil and firstFileName == secondFileName
end

function GMEManager:DownloadRecordedFile(fileId, filePath, callback)
	if string.isNilOrEmpty(fileId) or string.isNilOrEmpty(filePath) then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("DownloadRecordedFile invalid args: fileId=%s filePath=%s", tostring(fileId), tostring(filePath))
		end

		self:_invokeCallback(callback, -1, filePath, fileId, nil)

		return
	end

	local cacheKey = self:_getVoiceCacheKey(fileId)

	if not self:checkSDKValid() then
		self:_invokeCallback(callback, -1, filePath, fileId, nil)

		return
	end

	if callback then
		self.downloadFileCallbacks[cacheKey] = self.downloadFileCallbacks[cacheKey] or {}

		table.insert(self.downloadFileCallbacks[cacheKey], callback)
	end

	if self.downloadFileRequesting[cacheKey] then
		return
	end

	self.downloadFileRequesting[cacheKey] = true
	self.downloadFileRequestSeq = self.downloadFileRequestSeq + 1

	local requestFileName = string.format("%s.%d.download.ogg", cacheKey, self.downloadFileRequestSeq)
	local requestFilePath = self.csgmeManager:GetRecordFilePath(requestFileName)

	self.downloadFileRequestPaths[cacheKey] = requestFilePath

	self:_withPTTAuth(function()
		self:_scheduleDownloadFileTimeout(cacheKey, fileId, requestFilePath)
		self.csgmeManager:DownloadRecordedFile(fileId, requestFileName)
	end, function(code)
		self:_completeDownloadRecordedFile(code, requestFilePath, fileId, cacheKey, nil)
	end)
end

function GMEManager:SpeechToText(fileId, speechLanguage, translateLanguage)
	if not self:checkSDKValid() then
		return
	end

	speechLanguage = speechLanguage or Const.COUNTRY_LANGUAGES_CODE.CN
	translateLanguage = translateLanguage or Const.COUNTRY_LANGUAGES_CODE.CN

	self:_withPTTAuth(function()
		self.csgmeManager:SpeechToText(fileId, speechLanguage, translateLanguage)
	end, function(code)
		self:onReceiveError(code)
	end)
end

function GMEManager:_notifyTranslateTextRequest(request, success, translatedText, response)
	if not request or request.notified then
		return
	end

	request.notified = true

	if self.translateTextRequests then
		self.translateTextRequests[request.id] = nil
	end

	local callback = request.callback

	request.callback = nil

	if callback then
		self:_invokeCallback(callback, request.id, success, translatedText or "", response)
	end
end

function GMEManager:CancelTranslateText(requestId)
	requestId = tonumber(requestId)

	local request = requestId and self.translateTextRequests and self.translateTextRequests[requestId] or nil

	if not request then
		return false
	end

	request.cancelled = true

	if self.currentTranslateTextRequest ~= request then
		for index = #self.translateTextQueue, 1, -1 do
			if self.translateTextQueue[index] == request then
				table.remove(self.translateTextQueue, index)

				break
			end
		end
	end

	self:_notifyTranslateTextRequest(request, false, "", nil)

	return true
end

function GMEManager:_resumeTranslateText(reason)
	if self.translateSuspendTimerId then
		TimerManager.removeTimer(self.translateSuspendTimerId)

		self.translateSuspendTimerId = nil
	end

	if not self.translateTextSuspended then
		return
	end

	self.translateTextSuspended = false

	if LoggerManager.checkLogger(LoggerConst.WARN) then
		logger:warn("TranslateText resumed: %s", tostring(reason))
	end

	self:_startNextTranslateTextRequest()
end

function GMEManager:_scheduleTranslateSuspendRecover()
	if self.translateSuspendTimerId then
		TimerManager.removeTimer(self.translateSuspendTimerId)
	end

	self.translateSuspendTimerId = TimerManager.addTimer(TRANSLATE_TEXT_SUSPEND_RECOVER, function()
		self.translateSuspendTimerId = nil

		self:_resumeTranslateText("recover timer")
	end)
end

function GMEManager:_startNextTranslateTextRequest()
	if self.currentTranslateTextRequest or not self.translateTextQueue or #self.translateTextQueue == 0 then
		return
	end

	local request = table.remove(self.translateTextQueue, 1)

	self.currentTranslateTextRequest = request
	request.timerId = TimerManager.addTimer(TRANSLATE_TEXT_TIMEOUT, function()
		if self.currentTranslateTextRequest ~= request then
			return
		end

		self.currentTranslateTextRequest = nil
		request.timerId = nil
		self.translateTextSuspended = true

		self:_scheduleTranslateSuspendRecover()

		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("TranslateText timeout: requestId=%s", tostring(request.id))
		end

		self:_notifyTranslateTextRequest(request, false, "", nil)

		if not request.cancelled then
			while #self.translateTextQueue > 0 do
				self:_notifyTranslateTextRequest(table.remove(self.translateTextQueue, 1), false, "", nil)
			end
		end
	end)

	local ok, err = pcall(self.csgmeManager.TranslateText, self.csgmeManager, request.text, request.sourceLanguage, request.translateLanguage)

	if not ok and self.currentTranslateTextRequest == request then
		TimerManager.removeTimer(request.timerId)

		request.timerId = nil
		self.currentTranslateTextRequest = nil

		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("TranslateText call failed: requestId=%s error=%s", tostring(request.id), tostring(err))
		end

		self:_notifyTranslateTextRequest(request, false, "", nil)
		self:_startNextTranslateTextRequest()
	end
end

function GMEManager:TranslateText(text, sourceLanguage, translateLanguage, callback)
	self.translateTextRequestId = self.translateTextRequestId + 1

	local request = {
		id = self.translateTextRequestId,
		text = text,
		sourceLanguage = sourceLanguage or Const.COUNTRY_LANGUAGES_CODE.CN,
		translateLanguage = translateLanguage or Const.COUNTRY_LANGUAGES_CODE.CN,
		callback = callback
	}

	self.translateTextRequests[request.id] = request

	if not self:checkSDKValid() then
		self:_notifyTranslateTextRequest(request, false, "", nil)

		return request.id
	end

	if self.translateTextSuspended then
		self:_notifyTranslateTextRequest(request, false, "", nil)

		return request.id
	end

	self:_withPTTAuth(function()
		if request.cancelled then
			return
		end

		if self.translateTextSuspended then
			self:_notifyTranslateTextRequest(request, false, "", nil)

			return
		end

		table.insert(self.translateTextQueue, request)
		self:_startNextTranslateTextRequest()
	end, function(code)
		self:onReceiveError(code)
		self:_notifyTranslateTextRequest(request, false, "", nil)
	end)

	return request.id
end

function GMEManager:onEnterRoomComplete(error)
	local callback = self.enterRoomCallback

	self.enterRoomCallback = nil

	if error == 0 and self.switchRoomCallback == nil then
		self:_syncRtcRoomMemberStatus(self:GetRoomId())
	end

	if error == 0 and callback ~= nil then
		local teamInfo = pg.me and pg.me:getCurTeamInfo()
		local rtcRoomId = teamInfo and teamInfo.rtcRoomId and tostring(teamInfo.rtcRoomId)

		if not rtcRoomId then
			self:ExitRoom(callback)

			return
		elseif self:GetRoomId() ~= rtcRoomId then
			self:SwitchRoom(rtcRoomId, callback)

			return
		end
	end

	self:_notifyRoomResult(callback, error)
end

function GMEManager:onExitRoomComplete(error)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onExitRoomComplete")
	end

	local callback = self.exitRoomCallback

	self.exitRoomCallback = nil

	self:_notifyRoomResult(callback, error or 0)
end

function GMEManager:onRoomDisconnect(result, errorInfo)
	self:_syncRtcRoomMemberStatus(nil)

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onRoomDisconnect result=%s errorInfo=%s", tostring(result), tostring(errorInfo))
	end

	self.currentRoomId = nil

	local enterCallback, switchCallback, exitCallback = self.enterRoomCallback, self.switchRoomCallback, self.exitRoomCallback

	self.enterRoomCallback, self.switchRoomCallback, self.exitRoomCallback = nil

	facade:SendMessageCommand(MessageName.GME_ROOM_DISCONNECT, {})

	local code = result ~= 0 and result or -1

	self:_invokeCallback(enterCallback, code, "", false)
	self:_invokeCallback(switchCallback, code, "", false)
	self:_invokeCallback(exitCallback, 0, "", false)
end

function GMEManager:onRoomUpdateInfo(userIDList, eventID)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onRoomUpdateInfo %d , %s", eventID, inspect(userIDList))
	end

	if eventID == ITMG_EVENT_ID_USER_UPDATE.ENTER then
		facade:SendMessageCommand(MessageName.GME_ROOM_MEMBERS_CHANGE, {
			forceSet = true,
			uids = userIDList
		})
	elseif eventID == ITMG_EVENT_ID_USER_UPDATE.EXIT then
		facade:SendMessageCommand(MessageName.GME_ROOM_MEMBERS_CHANGE, {
			forceSet = false,
			uids = userIDList
		})
	elseif eventID == ITMG_EVENT_ID_USER_UPDATE.MIC_OPENED then
		-- block empty
	elseif eventID == ITMG_EVENT_ID_USER_UPDATE.MIC_CLOSED then
		-- block empty
	elseif eventID == ITMG_EVENT_ID_USER_UPDATE.HAS_AUDIO then
		facade:SendMessageCommand(MessageName.GME_ROOM_SPEAKING_MEMBERS_CHANGE, {
			forceSet = true,
			uids = userIDList
		})
	elseif eventID == ITMG_EVENT_ID_USER_UPDATE.NO_AUDIO then
		facade:SendMessageCommand(MessageName.GME_ROOM_SPEAKING_MEMBERS_CHANGE, {
			forceSet = false,
			uids = userIDList
		})
	end
end

function GMEManager:onRoomEvent(eventType, subType, data)
	if eventType == ROOM_EVENT_SWITCH_COMPLETE then
		local callback = self.switchRoomCallback

		self.switchRoomCallback = nil

		self:_notifyRoomResult(callback, subType)
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onRoomEvent type=%s subType=%s data=%s", tostring(eventType), tostring(subType), tostring(data))
	end
end

function GMEManager:onNetworkQualityStatistics(localQuality, remoteQualityList)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onNetworkQualityStatistics local=%s remote=%s", inspect(localQuality), inspect(remoteQualityList))
	end
end

function GMEManager:onRoomTypeChanged(roomType)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onRoomTypeChanged roomType=%s", tostring(roomType))
	end
end

function GMEManager:onRecordFirstAudioFrame()
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onRecordFirstAudioFrame")
	end
end

function GMEManager:onStreamingSpeechisRunning(text)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onStreamingSpeechisRunning", text)
	end
end

function GMEManager:onStreamingSpeechComplete(code, fileId, filePath, fileSize, duration, text, auditResult)
	if self.recordMode ~= RECORD_MODE_STREAMING then
		return
	end

	self:_resetRecordingState()

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("Streaming speech complete at=%.3f code=%s fileId=%s filePath=%s fileSize=%s duration=%s text=%s auditResult=%s", Time.realtimeSinceStartup, tostring(code), tostring(fileId), tostring(filePath), tostring(fileSize), tostring(duration), tostring(text), tostring(auditResult))
	end

	self:onReceiveError(code)

	local tooShort = code == 0 and (duration or 0) < MIN_RECORD_DURATION
	local cacheKey = code == 0 and self:_getVoiceCacheKey(fileId) or nil
	local success = code == 0 and not tooShort and cacheKey ~= nil

	if success and LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onStreamingSpeechComplete", fileId, filePath, fileSize, duration, text, auditResult)
	end

	if success then
		filePath = self:_normalizeRecordedFilePath(filePath, cacheKey)
		self.recordFiles[cacheKey] = filePath
	end

	if success then
		self:_notifyRecordStopped(fileId, filePath, fileSize, duration, text, auditResult, code, false)
	else
		self:_notifyRecordStopped(nil, nil, nil, nil, nil, nil, code, tooShort)
	end
end

function GMEManager:onPlayFileComplete(code, filepath)
	self:onReceiveError(code)

	if self:_consumeIgnorePlayComplete(filepath) then
		return
	end

	if self.curPlayingFilePath and filepath ~= self.curPlayingFilePath then
		return
	end

	if code ~= 0 then
		self.curPlayingFilePath = nil
		self.playFromSequence = false
		self.audioPlaySequence = {}
		self.curPlayingChannel = nil

		local callback = self.playFileCallback

		self.playFileCallback = nil

		self:_invokeCallback(callback, code, filepath)

		return
	end

	self.curPlayingFilePath = nil

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onPlayFileComplete", filepath)
	end

	local callback = self.playFileCallback

	if self.playFromSequence then
		self:_invokeCallback(callback, code, filepath)
		self:_playRecordedFileSeqTop()

		if not self.playFromSequence then
			self.playFileCallback = nil
		end
	else
		self.audioPlaySequence = {}
		self.playFileCallback = nil

		self:_invokeCallback(callback, code, filepath)
	end
end

function GMEManager:onUploadFileComplete(code, filePath, fileId, auditResult)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("upload complete at=%.3f code=%s fileId=%s filePath=%s auditResult=%s", Time.realtimeSinceStartup, tostring(code), tostring(fileId), tostring(filePath), tostring(auditResult))
	end

	self:_completeUploadFileRequest(code, filePath, fileId, auditResult)
end

function GMEManager:onDownloadFileAuditComplete(code, filePath, fileId, auditResult)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onDownloadFileAuditComplete code=%s filePath=%s fileId=%s auditResult=%s", tostring(code), tostring(filePath), tostring(fileId), tostring(auditResult))
	end

	local cacheKey = self:_getVoiceCacheKey(fileId)

	self:_completeDownloadRecordedFile(code, filePath, fileId, cacheKey, auditResult)
end

function GMEManager:_completeDownloadRecordedFile(code, filePath, fileId, cacheKey, auditResult)
	if not cacheKey then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("Download callback missing fileId: code=%s filePath=%s", tostring(code), tostring(filePath))
		end

		return
	end

	local expectedPath = self.downloadFileRequestPaths[cacheKey]

	if not self.downloadFileRequesting[cacheKey] or not self:_isSameRecordFilePath(filePath, expectedPath) then
		if code == 0 and self.csgmeManager:RecordFileExists(filePath) then
			local cachedFilePath = self:_normalizeRecordedFilePath(filePath, cacheKey)

			if self.csgmeManager:RecordFileExists(cachedFilePath) then
				self.recordFiles[cacheKey] = cachedFilePath
			end
		end

		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("Ignore stale download callback: code=%s fileId=%s filePath=%s", tostring(code), tostring(fileId), tostring(filePath))
		end

		return
	end

	self:_cancelDownloadFileTimeout(cacheKey)

	self.downloadFileRequesting[cacheKey] = nil
	self.downloadFileRequestPaths[cacheKey] = nil

	local waitingToPlay = self.pendingPlayFileId ~= nil and self.pendingPlayFileId == cacheKey

	if waitingToPlay then
		self.pendingPlayFileId = nil
	end

	if code == 0 then
		filePath = self:_normalizeRecordedFilePath(filePath, cacheKey)

		if not self.csgmeManager:RecordFileExists(filePath) then
			code = -1

			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("Downloaded record file does not exist: fileId=%s filePath=%s", tostring(fileId), tostring(filePath))
			end
		else
			self.recordFiles[cacheKey] = filePath
		end
	end

	self:onReceiveError(code)

	if code == 0 then
		if waitingToPlay then
			if self.playFromSequence then
				self:_playRecordedFileSeqTop()
			else
				self:_playRecordedFile(filePath, fileId)
			end
		end
	elseif waitingToPlay then
		if self.playFromSequence then
			if self.audioPlaySequence[1] == fileId then
				table.remove(self.audioPlaySequence, 1)
			end

			self:_playRecordedFileSeqTop()

			if not self.playFromSequence then
				self.playFileCallback = nil
			end
		else
			local playCallback = self.playFileCallback

			self.playFileCallback = nil

			self:_invokeCallback(playCallback, code, filePath)
		end
	end

	local callbacks = self.downloadFileCallbacks[cacheKey]

	self.downloadFileCallbacks[cacheKey] = nil

	for _, callback in ipairs(callbacks or {}) do
		self:_invokeCallback(callback, code, filePath, fileId, auditResult)
	end
end

function GMEManager:onTranslateTextComplete(code, targetText)
	self:onReceiveError(code)

	local request = self.currentTranslateTextRequest

	self.currentTranslateTextRequest = nil

	if not request then
		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("onTranslateTextComplete ignored: no pending request")
		end

		self:_resumeTranslateText("late callback arrived")

		return
	end

	TimerManager.removeTimer(request.timerId)

	request.timerId = nil

	if code ~= 0 then
		self:_notifyTranslateTextRequest(request, false, "", nil)
		self:_startNextTranslateTextRequest()

		return
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onTranslateTextComplete")
	end

	local decoded, res = pcall(json.decode, targetText)

	if not decoded or type(res) ~= "table" then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("onTranslateTextComplete decode failed : %s", tostring(targetText))
		end

		self:_notifyTranslateTextRequest(request, false, "", nil)
		self:_startNextTranslateTextRequest()

		return
	end

	if tonumber(res.result) ~= 0 then
		self:_notifyTranslateTextRequest(request, false, "", res)
		self:_startNextTranslateTextRequest()

		return
	end

	local targetList = res.target_text
	local first = type(targetList) == "table" and targetList[1] or nil

	if first == nil then
		self:_notifyTranslateTextRequest(request, false, "", res)
		self:_startNextTranslateTextRequest()

		return
	end

	self:_notifyTranslateTextRequest(request, true, first.translated_text or "", res)
	self:_startNextTranslateTextRequest()
end

function GMEManager:onRecordFileComplete(code, filePath, fileSize, duration)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onRecordFileComplete code=%s filePath=%s fileSize=%s duration=%s", tostring(code), tostring(filePath), tostring(fileSize), tostring(duration))
	end

	if self.recordMode ~= RECORD_MODE_LOCAL then
		return
	end

	self:_resetRecordingState()
	self:restoreIOSRecordState()
	self:onReceiveError(code)

	local tooShort = code == 0 and (duration or 0) < MIN_RECORD_DURATION
	local callback = self.localRecordStopCallback

	self.localRecordStopCallback = nil

	if code == 0 and not tooShort then
		local cacheKey = filePath and filePath:match("([%da-fA-F]+)%.ogg$") or nil

		if cacheKey and #cacheKey == 64 then
			self.recordFiles[string.lower(cacheKey)] = filePath
		end

		self:_invokeCallback(callback, filePath, fileSize, duration, code, false)
	else
		self:_invokeCallback(callback, nil, nil, nil, code, tooShort)
	end
end

function GMEManager:onSpeechToTextAuditComplete(code, fileId, result, auditResult)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onSpeechToTextAuditComplete code=%s fileId=%s result=%s auditResult=%s", tostring(code), tostring(fileId), tostring(result), tostring(auditResult))
	end

	self:onReceiveError(code)
end

function GMEManager:onSpeechToTextTargetTextComplete(code, fileId, result, auditResult, targetText)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onSpeechToTextTargetTextComplete code=%s fileId=%s result=%s auditResult=%s targetText=%s", tostring(code), tostring(fileId), tostring(result), tostring(auditResult), tostring(targetText))
	end

	self:onReceiveError(code)
end

function GMEManager:onTextToSpeechComplete(code, serialNumber, fileId)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("onTextToSpeechComplete code=%s serialNumber=%s fileId=%s", tostring(code), tostring(serialNumber), tostring(fileId))
	end

	self:onReceiveError(code)
end

function GMEManager:_cancelTranslateTimers()
	if self.currentTranslateTextRequest and self.currentTranslateTextRequest.timerId then
		TimerManager.removeTimer(self.currentTranslateTextRequest.timerId)

		self.currentTranslateTextRequest.timerId = nil
	end

	if self.translateSuspendTimerId then
		TimerManager.removeTimer(self.translateSuspendTimerId)

		self.translateSuspendTimerId = nil
	end
end

function GMEManager:checkSDKValid()
	return ClientSwitch.EnableGMESDK and self.csgmeManager
end

function GMEManager:_withPTTAuth(onSuccess, onFailed)
	if not self:checkSDKValid() then
		self:_invokeCallback(onFailed, -1)

		return
	end

	self:connect()
	self:getUserSign(function(userSig)
		if not self:checkSDKValid() or string.isNilOrEmpty(userSig) then
			self:_invokeCallback(onFailed, -1)

			return
		end

		local code = self.csgmeManager:ApplyPTTAuthBuffer(userSig)

		if code ~= 0 then
			self:_invokeCallback(onFailed, code)

			return
		end

		self:_invokeCallback(onSuccess)
	end)
end

function GMEManager:getRecordFileName()
	local sourceName = string.format("%s_%s_%s", tostring(pg.me.uid), os.date("!%Y_%m_%d_%H_%M_%S"), tostring(Time.realtimeSinceStartup))

	return Sha256.hex(sourceName) .. ".ogg"
end

function GMEManager:_getDownloadFileName(cacheKey)
	if string.isNilOrEmpty(cacheKey) then
		return nil
	end

	return cacheKey .. ".ogg"
end

function GMEManager:getRecordedFilePath(fileId)
	local cacheKey = self:_getVoiceCacheKey(fileId)

	return cacheKey and self:_getCachedRecordedFilePath(cacheKey) or ""
end

function GMEManager:onReceiveError(errorCode)
	if errorCode == 0 then
		return
	end

	if LoggerManager.checkLogger(LoggerConst.WARN) then
		logger:warn("GME onReceiveError", errorCode)
	end

	facade:SendMessageCommand(MessageName.GME_ERROR, {
		code = errorCode,
		tipKey = GME_ERROR_MESSAGE[errorCode]
	})
end

function GMEManager:decodeUserSigIdentity(userSig)
	if string.isNilOrEmpty(userSig) then
		return nil, nil
	end

	local success, payload = pcall(function()
		local standardBase64 = userSig:gsub("%*", "+"):gsub("%-", "/"):gsub("_", "=")
		local compressed = base64.decode(standardBase64)
		local jsonText = zlib.inflate()(compressed)

		return json.decode(jsonText)
	end)

	if not success or type(payload) ~= "table" then
		return nil, nil
	end

	return tostring(payload["TLS.identifier"]), tostring(payload["TLS.sdkappid"])
end

function GMEManager:_invokeCallback(callback, ...)
	if not callback then
		return
	end

	local ok, err = xpcall(callback, debug.traceback, ...)

	if not ok and LoggerManager.checkLogger(LoggerConst.ERROR) then
		logger:error("GME callback failed: %s", tostring(err))
	end
end

return GMEManager
