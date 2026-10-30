-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Speech\\SpeechSystem.lua

local Class = require("Core.Framework.Class")
local SystemBase = require("GameApp.Core.SystemBase")
local MessageName = require("Const.MessageName")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local json = require("json")
local EventConst = require("Const.EventConst")
local UIConst = require("Const.UIConst")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("GMEManager")
local SpeechSystem = Class.LightClass("SpeechSystem", SystemBase)
local SpeechRoomStateIndex = {
	Muted = 3,
	Speaking = 2,
	InRoom = 1
}

SpeechSystem.AudioPlaySourceType = {
	ServerDownload = 2,
	SelfRecord = 1,
	Unknown = 0
}

function SpeechSystem:toggleMembers(memberSet, uids, stateIndex, forceSet)
	if not uids or #uids == 0 then
		return
	end

	local state = forceSet == nil and true or forceSet

	for _, uid in ipairs(uids) do
		if not memberSet[uid] then
			memberSet[uid] = {}
		end

		memberSet[uid][stateIndex] = state
	end
end

function SpeechSystem:onCtor()
	SystemBase.onCtor(self)

	self.speechRoomMembers = {}
	self.manualMutedMembers = {}
	self.platformMutedMembers = {}
	self.appliedMutedMembers = {}
	self.isAudioListening = false
	self.listeningStateListeners = {}
	self.audioFileInfos = {}
end

function SpeechSystem:onTick()
	if not pg.me or not pg.global.gmeManager:IsRoomEntered() then
		return
	end

	local teamInfo = pg.me:getCurTeamInfo()

	if teamInfo and teamInfo.rtcRoomId then
		return
	end

	self:onExitSpeechRoomResult()
	pg.global.gmeManager:ExitRoom()
end

function SpeechSystem:resetSpeechRoomState()
	local memberUids = {}

	for uid in pairs(self.speechRoomMembers) do
		memberUids[#memberUids + 1] = uid
	end

	self:toggleMembers(self.speechRoomMembers, memberUids, SpeechRoomStateIndex.InRoom, false)
	self:toggleMembers(self.speechRoomMembers, memberUids, SpeechRoomStateIndex.Speaking, false)
	self:toggleMembers(self.speechRoomMembers, memberUids, SpeechRoomStateIndex.Muted, false)
	self:refreshMemberSpeakingTopLogoState()

	self.speechRoomMembers = {}
	self.manualMutedMembers = {}
	self.platformMutedMembers = {}
	self.appliedMutedMembers = {}
	self.muteOwnerUid, self.muteRoomId = nil
end

function SpeechSystem:ensureMuteContext()
	local ownerUid = pg and pg.me and tostring(pg.me.uid) or ""
	local manager = pg and pg.global and pg.global.gmeManager
	local roomId = manager and manager.currentRoomId or nil

	if self.muteOwnerUid ~= ownerUid or self.muteRoomId ~= roomId then
		self.muteOwnerUid, self.muteRoomId = ownerUid, roomId
		self.manualMutedMembers = {}
		self.platformMutedMembers = {}
		self.appliedMutedMembers = {}

		local memberUids = {}

		for uid in pairs(self.speechRoomMembers) do
			memberUids[#memberUids + 1] = uid
		end

		self:toggleMembers(self.speechRoomMembers, memberUids, SpeechRoomStateIndex.Muted, false)
	end
end

function SpeechSystem:clearSpeechRoomState()
	local hooks = SpeechSystem._platformHooks

	if hooks and hooks.quitSpeechChannel then
		hooks.quitSpeechChannel(self)
	end

	self:resetSpeechRoomState()
end

function SpeechSystem:onLogin()
	self:resetSpeechRoomState()
end

function SpeechSystem:onClear()
	self:clearSpeechRoomState()
end

function SpeechSystem:onDestroy()
	self:clearSpeechRoomState()
end

function SpeechSystem:getMessageBindMap()
	return {
		[MessageName.GME_ROOM_DISCONNECT] = "onGMERoomDisconnect",
		[MessageName.GME_ROOM_MEMBERS_CHANGE] = "onGMERoomMembersChange",
		[MessageName.GME_ROOM_SPEAKING_MEMBERS_CHANGE] = "onGMERoomSpeakingMembersChange",
		[MessageName.GME_RECORD_WILL_STOP] = "onGMERecordWillStop",
		[MessageName.GME_ERROR] = "onGMEError",
		[MessageName.GME_PLAY_FILE_START] = "onGMEPlayFileStart"
	}
end

function SpeechSystem:onGMERoomDisconnect()
	self:onExitSpeechRoomResult()
end

function SpeechSystem:onGMERoomMembersChange(body)
	if not pg.global.gmeManager:IsRoomEntered() then
		return
	end

	self:updateSpeechRoomMembers(body and body.uids, body and body.forceSet)
end

function SpeechSystem:onGMERoomSpeakingMembersChange(body)
	if not pg.global.gmeManager:IsRoomEntered() then
		return
	end

	self:updateSpeakingMembers(body and body.uids, body and body.forceSet)
end

function SpeechSystem:onGMERecordWillStop()
	if pg.me and self:checkMemberInRoom(pg.me.uid) and pg.game.setting:getTeamSpeechFreeTalk() then
		pg.global.gmeManager:EnableMic(true, true)
	else
		pg.global.gmeManager:EnableMic(false, false)
	end
end

function SpeechSystem:onGMEError(body)
	if not body or not body.tipKey then
		return
	end

	pg.global.showBubbleMessageRaw(pg.getGameString(body.tipKey))
end

function SpeechSystem:onGMEPlayFileStart(body)
	if not body then
		return
	end

	self:refreshAudioListeningState(true, body.filePath)

	if body.fromSequence and body.fileId and pg.me then
		pg.global.prefsCacheUtils:setBool(ClientConst.PrefKey.ChatAudioAlreadyPlayed .. pg.me.uid .. body.fileId, true)
	end
end

function SpeechSystem:onEnterSpeechRoomResult(code, roomId, isRoomEntered)
	if isRoomEntered == false then
		self:onExitSpeechRoomResult()

		return
	end

	if code ~= 0 or isRoomEntered == nil then
		return
	end

	local teamInfo = pg.me and pg.me:getCurTeamInfo()
	local expectedRoomId = teamInfo and teamInfo.rtcRoomId and tostring(teamInfo.rtcRoomId)

	if string.isNilOrEmpty(roomId) or roomId ~= expectedRoomId then
		if LoggerManager.checkLogger(LoggerConst.WARN) then
			logger:warn("Speech room state differs from team: roomId=%s expectedRoomId=%s isRoomEntered=%s", tostring(roomId), tostring(expectedRoomId), tostring(isRoomEntered))
		end

		self:onExitSpeechRoomResult()

		return
	end

	self:ensureMuteContext()

	local gmeManager = pg.global.gmeManager

	gmeManager:EnableMic(pg.game.setting:getTeamSpeechFreeTalk(), true)
	gmeManager:EnableSpeaker(true, true)
	gmeManager:SetSpeakerVolume(pg.game.setting:getTeamVol())
	self:joinSpeechChannel()
end

function SpeechSystem:onExitSpeechRoomResult()
	pg.global.gmeManager:EnableSpeaker(false, true)
	pg.global.gmeManager:EnableMic(false, true)
	self:quitSpeechChannel()
end

function SpeechSystem:onRecordStopped(fileId, filePath, fileSize, duration, text, auditResult, code, tooShort)
	if tooShort then
		pg.global.showBubbleMessageRaw(pg.getGameString("VOICE_RECORD_AUDIO_TOO_SHORT"))

		return
	end

	if fileId == nil then
		return
	end

	self:setCurLocalAudioFile(fileId, filePath, fileSize, duration, text, auditResult)
end

function SpeechSystem:onUploadFileResult(code, filePath, fileId, auditResult, sourceFilePath)
	local contextFilePath = sourceFilePath or filePath

	if code ~= 0 then
		self:onUploadFileFailed(contextFilePath, code)

		return
	end

	self:onUploadFileComplete(fileId, filePath, auditResult, contextFilePath)
end

function SpeechSystem:joinSpeechChannel()
	local hooks = SpeechSystem._platformHooks

	if hooks and hooks.joinSpeechChannel then
		hooks.joinSpeechChannel(self)
	end

	facade:SendMessageCommand(MessageName.SPEECH_ROOM_STATE_CHANGE, {
		inSpeechRoom = true
	})
	facade:SendMessageCommand(MessageName.SPEECH_ROOM_MEMBER_STATE_CHANGE)
	pg.global.ui.tips:showTextTip(pg.getGameString("TEAM_SPEECH_SELF_ENTER_CHANNEL"))
end

function SpeechSystem:quitSpeechChannel()
	local isInRoom = pg.me and self:checkMemberInRoom(pg.me.uid)

	self:clearSpeechRoomState()
	facade:SendMessageCommand(MessageName.SPEECH_ROOM_STATE_CHANGE, {
		inSpeechRoom = false
	})
	facade:SendMessageCommand(MessageName.SPEECH_ROOM_MEMBER_STATE_CHANGE)
	pg.global.ui.tips:showTextTip(pg.getGameString("TEAM_SPEECH_SELF_EXIT_CHANNEL"))
	pg.global.ui.tips:refreshShortCutKey()
end

function SpeechSystem:updateSpeechRoomMembers(uids, forceSet)
	if table.contains(uids, pg.me.uid) and forceSet then
		self:resetSpeechRoomState()
	end

	self:toggleMembers(self.speechRoomMembers, uids, SpeechRoomStateIndex.InRoom, forceSet)

	if forceSet == false then
		self:toggleMembers(self.speechRoomMembers, uids, SpeechRoomStateIndex.Speaking, false)
		self:toggleMembers(self.speechRoomMembers, uids, SpeechRoomStateIndex.Muted, false)

		for _, uid in ipairs(uids or {}) do
			local key = tostring(uid)

			self.manualMutedMembers[key] = nil
			self.platformMutedMembers[key] = nil
			self.appliedMutedMembers[key] = nil
		end
	end

	local hooks = SpeechSystem._platformHooks

	if hooks and hooks.updateSpeechRoomMembers then
		hooks.updateSpeechRoomMembers(self, uids)
	end

	self:refreshMemberSpeakingTopLogoState()
	pg.global.ui.tips:refreshShortCutKey()
	facade:SendMessageCommand(MessageName.SPEECH_ROOM_MEMBER_STATE_CHANGE)
end

function SpeechSystem:updateSpeakingMembers(uids, forceSet)
	local inRoomUids = {}

	for _, uid in ipairs(uids or {}) do
		if self:checkMemberInRoom(uid) then
			inRoomUids[#inRoomUids + 1] = uid
		end
	end

	self:toggleMembers(self.speechRoomMembers, inRoomUids, SpeechRoomStateIndex.Speaking, forceSet)
	self:refreshMemberSpeakingTopLogoState()
	facade:SendMessageCommand(MessageName.SPEECH_ROOM_MEMBER_STATE_CHANGE)

	local hooks = SpeechSystem._platformHooks

	if hooks and hooks.updateSpeakingMembers then
		hooks.updateSpeakingMembers(self, inRoomUids)
	end
end

function SpeechSystem:refreshMemberSpeakingTopLogoState()
	local roomMembers = self:getSpeechRoomMembers()

	for memberUid, _ in pairs(roomMembers) do
		local memberEnt = pg.getEntityByUid(memberUid)

		if memberEnt then
			local targetEnt = memberEnt

			if memberEnt == pg.me then
				targetEnt = pg.pawn or memberEnt
			elseif memberEnt:isControllingPet() then
				targetEnt = memberEnt:getCurPetEntity()
			end

			local speaking = self:checkMemberSpeakingVisible(memberUid)

			if targetEnt then
				if speaking then
					targetEnt:ensureToplogoComponent(UIConst.TOPLOGO_COMPONENT.TEAM_SPEECH)
				end

				targetEnt.eventEmitter:emit(EventConst.TOPLOGO_TEAM_SPEECH, speaking)
			end
		end
	end
end

function SpeechSystem:applyMemberMute(uid, forceApply)
	self:ensureMuteContext()

	local key = tostring(uid)
	local isMuted = self.manualMutedMembers[key] == true or self.platformMutedMembers[key] == true

	if not forceApply and self.appliedMutedMembers[key] == isMuted then
		return
	end

	if isMuted then
		pg.global.gmeManager:MutedUser(uid)
	else
		pg.global.gmeManager:UnMutedUser(uid)
	end

	self.appliedMutedMembers[key] = isMuted

	self:toggleMembers(self.speechRoomMembers, {
		uid
	}, SpeechRoomStateIndex.Muted, isMuted)
	self:refreshMemberSpeakingTopLogoState()
	facade:SendMessageCommand(MessageName.SPEECH_ROOM_MEMBER_STATE_CHANGE)
end

function SpeechSystem:updateMutedMembers(uid, isMuted)
	self:ensureMuteContext()

	self.manualMutedMembers[tostring(uid)] = isMuted == true

	self:applyMemberMute(uid)
end

function SpeechSystem:updatePlatformMutedMembers(uid, isMuted, forceApply)
	self:ensureMuteContext()

	self.platformMutedMembers[tostring(uid)] = isMuted == true

	self:applyMemberMute(uid, forceApply)
end

function SpeechSystem:checkMemberMuted(uid)
	self:ensureMuteContext()

	local key = tostring(uid)

	return self.manualMutedMembers[key] == true or self.platformMutedMembers[key] == true
end

function SpeechSystem:checkMemberSpeakingVisible(uid)
	if not pg or not pg.me or not self:checkMemberInRoom(pg.me.uid) then
		return false
	end

	return self:checkMemberInRoom(uid) and self:checkMemberSpeaking(uid) and not self:checkMemberMuted(uid)
end

function SpeechSystem:checkMemberInRoom(uid)
	if not pg.global.gmeManager:IsRoomEntered() then
		return false
	end

	if self.speechRoomMembers[uid] then
		return self.speechRoomMembers[uid][SpeechRoomStateIndex.InRoom] or false
	end

	return false
end

function SpeechSystem:checkMemberSpeaking(uid)
	if not pg.global.gmeManager:IsRoomEntered() then
		return false
	end

	if self.speechRoomMembers[uid] then
		return self.speechRoomMembers[uid][SpeechRoomStateIndex.Speaking] or false
	end

	return false
end

function SpeechSystem:getSpeechRoomMembers()
	return self.speechRoomMembers
end

function SpeechSystem:setCurLocalAudioFile(fileID, filePath, fileSize, duration, text, auditResult)
	self.curAudioFile = {
		fileID = fileID,
		filePath = filePath,
		fileSize = fileSize,
		duration = duration,
		text = text,
		auditResult = auditResult
	}
end

function SpeechSystem:clearCurLocalAudioFile()
	self.curAudioFile = nil
end

function SpeechSystem:playCurLocalAudioFile()
	if self.curAudioFile then
		self:playAudioFile(self.curAudioFile)
	end
end

function SpeechSystem:stopPlayAudioFile()
	pg.global.gmeManager:StopPlayFile()
	self:refreshAudioListeningState(false, self.curAudioFile and self.curAudioFile.filePath or "")
end

function SpeechSystem:getCurAudioFile()
	return self.curAudioFile
end

function SpeechSystem:playAudioFile(audioFile)
	if not audioFile or string.isNilOrEmpty(audioFile.fileID) then
		return false
	end

	pg.global.gmeManager:PlayRecordedFile(audioFile.fileID, function(code, filePath)
		self:onPlayFileComplete(filePath)
	end)

	return true
end

function SpeechSystem:onPlayFileComplete(filepath)
	self:refreshAudioListeningState(false, filepath)
end

function SpeechSystem:refreshAudioListeningState(isListening, filePath)
	self.isAudioListening = isListening

	for _, listener in ipairs(self.listeningStateListeners) do
		listener(isListening, filePath)
	end
end

function SpeechSystem:addListeningStateListener(listener)
	if not listener then
		return
	end

	for _, oldListener in ipairs(self.listeningStateListeners) do
		if oldListener == listener then
			listener(self.isAudioListening)

			return
		end
	end

	table.insert(self.listeningStateListeners, listener)
	listener(self.isAudioListening)
end

function SpeechSystem:removeListeningStateListener(listener)
	if not listener then
		return
	end

	for i = #self.listeningStateListeners, 1, -1 do
		if self.listeningStateListeners[i] == listener then
			table.remove(self.listeningStateListeners, i)
		end
	end
end

local function decodeGMEAuditResult(auditResult)
	if string.isNilOrEmpty(auditResult) then
		return nil
	end

	local success, auditInfo = pcall(json.decode, auditResult)

	if not success or type(auditInfo) ~= "table" then
		return nil
	end

	return auditInfo
end

function SpeechSystem:sendRecordedAudioMessage(fileID, filePath, duration, text, auditResult)
	if pg.global.ui and pg.global.ui.chat and pg.global.ui.chat.chatComponent then
		local auditInfo = decodeGMEAuditResult(auditResult)
		local auditedText = auditInfo and auditInfo.AsrText
		local messageText = not string.isNilOrEmpty(auditedText) and auditedText or text
		local audioInfoForSend = {
			fileID = fileID,
			filePath = filePath,
			duration = math.round((duration or 0) / 1000)
		}

		if string.isNilOrEmpty(messageText) then
			messageText = ""
		end

		local extraInfo = {
			[Const.CHAT_EXTRA_TYPE.Voice] = json.encode(audioInfoForSend)
		}

		local function sendAudioMessage()
			pg.global.ui.chat.chatComponent:sendMessage(messageText, pg.game.chat.subMessageType.Audio, nil, nil, extraInfo)
		end

		pg.me:sensitiveWordsCheck(messageText, function()
			sendAudioMessage()
		end)
	end
end

function SpeechSystem:onUploadFileComplete(fileID, filePath, auditResult, sourceFilePath)
	local audioOriginInfo = self:popAudioFileInfo(sourceFilePath or filePath)

	if not audioOriginInfo then
		return
	end

	self:sendRecordedAudioMessage(fileID, filePath, (audioOriginInfo.duration or 0) * 1000, audioOriginInfo.text, auditResult or audioOriginInfo.auditResult)
end

function SpeechSystem:setAudioFileInfo(filePath, duration, text, auditResult)
	if string.isNilOrEmpty(filePath) then
		return
	end

	if not self.audioFileInfos[filePath] then
		self.audioFileInfos[filePath] = {}
	end

	table.insert(self.audioFileInfos[filePath], {
		duration = math.round(duration / 1000),
		text = text,
		auditResult = auditResult
	})
end

function SpeechSystem:getAudioFileInfo(filePath)
	if string.isNilOrEmpty(filePath) then
		return nil
	end

	local infoQueue = self.audioFileInfos[filePath]

	if not infoQueue or #infoQueue == 0 then
		return nil
	end

	return infoQueue[1]
end

function SpeechSystem:popAudioFileInfo(filePath)
	if string.isNilOrEmpty(filePath) then
		return nil
	end

	local infoQueue = self.audioFileInfos[filePath]

	if not infoQueue or #infoQueue == 0 then
		return nil
	end

	local info = table.remove(infoQueue, 1)

	if #infoQueue == 0 then
		self.audioFileInfos[filePath] = nil
	end

	return info
end

function SpeechSystem:onUploadFileFailed(filePath, code)
	self:popAudioFileInfo(filePath)
end

function SpeechSystem:handlePlayerVoiceState(button, data)
	local objectReference = button.transform:GetComponent("ObjectReference")
	local btnVoiceUButton = objectReference:GetRefValue("btnVoiceUButton")

	btnVoiceUButton.luaClick = nil

	if not self:checkMemberInRoom(pg.me.uid) then
		button:TryChangePage("ChannelState", data.uid == pg.me.uid and 3 or 0)
		button:TryChangePage("Voice", 0)

		return
	end

	local isInSpeechRoom = self:checkMemberInRoom(data.uid)

	if data.uid == pg.me.uid then
		button:TryChangePage("ChannelState", isInSpeechRoom and 2 or 3)

		function btnVoiceUButton.luaClick()
			pg.global.showBubbleMessageRaw(pg.getGameString("CANNOT_MUTE_MYSELF"))
		end
	elseif isInSpeechRoom then
		local muted = self:checkMemberMuted(data.uid)
		local _h = SpeechSystem._platformHooks

		if not muted and _h and _h.handlePlayerVoiceState then
			local platformMuted = _h.handlePlayerVoiceState(self, data, muted)

			if type(platformMuted) == "boolean" then
				muted = platformMuted
			end
		end

		button:TryChangePage("ChannelState", muted and 1 or 0)

		function btnVoiceUButton.luaClick()
			local currentMuted = self:checkMemberMuted(data.uid)
			local hooks = SpeechSystem._platformHooks

			if hooks and hooks.handlePlayerVoiceState and hooks.handlePlayerVoiceState(self, data, currentMuted) == true then
				return
			end

			self:updateMutedMembers(data.uid, not currentMuted)
		end
	else
		button:TryChangePage("ChannelState", 3)
	end

	button:TryChangePage("Voice", self:checkMemberSpeakingVisible(data.uid) and 1 or 0)
end

function SpeechSystem:bindJoinSpeech(gameObject)
	local teamSpeechBind = KeyBindingPro.GetOrAddKeyBindingByName(gameObject, "teamSpeechBind")

	teamSpeechBind.isVirtual = true
	teamSpeechBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.TeamSpeech
	teamSpeechBind.priority = 10000

	function teamSpeechBind.luaTrigger(inputInfo)
		if self:checkMemberInRoom(pg.me.uid) or pg.me:isInSingleTeam() then
			return true
		end

		if inputInfo.phase == "Performed" then
			pg.me:joinSpeechChannel({
				notifyDenied = true
			})
		end

		if inputInfo.phase == "Checked" then
			return false
		end
	end
end

return SpeechSystem
