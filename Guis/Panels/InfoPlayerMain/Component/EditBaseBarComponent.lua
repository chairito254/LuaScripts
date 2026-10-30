-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\InfoPlayerMain\\Component\\EditBaseBarComponent.lua

local Class = require("Core.Framework.Class")
local UIComponent = require("Guis.Helper.UIComponent")
local EditBaseBarComponent = Class.LightClass("EditBaseBarComponent", UIComponent)
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local SysConfigData = require("Data.sys_config_data")
local CallbackHandler = require("Core.Common.CallbackHandler")
local MessageName = require("Const.MessageName")
local PlayerForbidConst = require("Common.Const.PlayerForbidConst")

EditBaseBarComponent.messages = {
	[MessageName.PLAYER_VOICE_SIGNATURE_CHANGE] = {
		"refreshVoiceSignatureState",
		true
	}
}

function EditBaseBarComponent:onCtor(info)
	self.playerInfo = info.playerInfo
	self.voiceRecordStarting = false
	self.voiceRecordStartSeq = 0
	self.voiceRecording = false

	function self.refreshPanelHandler(order)
		self.order = order

		self:refreshEditBasicBarPanel()
	end
end

function EditBaseBarComponent:initView()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.btnEditName = objectReference:GetRefValue("btnEditName")
	self.txtNameEdit = objectReference:GetRefValue("txtNameEdit")
	self.btnEditSignature = objectReference:GetRefValue("btnEditSignature")
	self.txtSignatureEdit = objectReference:GetRefValue("txtSignatureEdit")
	self.txtNameEditTitle = objectReference:GetRefValue("txtNameEditTitle")
	self.txtSignatureEditTitle = objectReference:GetRefValue("txtSignatureEditTitle")
	self.btnVoiceNewUButton = objectReference:GetRefValue("btnVoiceNewUButton")
	self.btnVoiceAgainUButton = objectReference:GetRefValue("btnVoiceAgainUButton")
	self.btnDelVoiceUButton = objectReference:GetRefValue("btnDelVoiceUButton")
	self.txtVoiceUSDFText = objectReference:GetRefValue("txtVoiceUSDFText")
	self.btnDelVoiceNewUButton = objectReference:GetRefValue("btnDelVoiceNewUButton")
	self.btnListenUButton = objectReference:GetRefValue("btnListenUButton")

	ClientTextUtils.setText(self.txtNameEditTitle, pg.getGameString("PLAYER_NAME"))
	ClientTextUtils.setText(self.txtSignatureEditTitle, pg.getGameString("PLAYER_SIGNATURE"))

	function self.btnEditName.luaClick()
		pg.game.speech:stopPlayAudioFile()

		if LuaUIUtils.checkFeatureForbid(PlayerForbidConst.PLAYER_SWITCH.CHANGE_PLAYER_NAME) then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_CHANGE_NAME, {
			initialInputText = self.playerInfo.playerName or ""
		})
	end

	function self.btnEditSignature.luaClick()
		pg.game.speech:stopPlayAudioFile()

		if LuaUIUtils.checkFeatureForbid(PlayerForbidConst.PLAYER_SWITCH.CHANGE_PLAYER_SIGNATURE) then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_COMMON_TEXT_INPUT, {
			title = pg.getGameString("EDIT_SHOW_SIGNATURE"),
			initialInputText = self.playerInfo.showSignature or "",
			maxLen = SysConfigData.playerSignatureMaxLen or 20,
			confirmCb = function(inputText)
				if LuaUIUtils.checkFeatureForbid(PlayerForbidConst.PLAYER_SWITCH.CHANGE_PLAYER_SIGNATURE) then
					return
				end

				pg.me:serverMsg("RPC_CS_SetShowSignature", inputText)
			end
		})
	end

	function self.btnDelVoiceUButton.luaClick()
		self.view.panelEditWidget:TryChangePage("VoiceSignature", 0)
		pg.me:serverMsg("RPC_CS_SetVoiceSignature", "")
		pg.game.speech:stopPlayAudioFile()
	end

	function self.listeningStateListener(isListening)
		if isListening then
			self.view.widget:InvokeCallback(CS.XGUI.EInvokeTime.User1)
		else
			self.view.widget:InvokeCallback(CS.XGUI.EInvokeTime.User2)
		end
	end

	function self.btnListenUButton.luaClick()
		local voiceInfo = string.split(pg.me.voiceSignature, "|")

		pg.global.gmeManager:PlayRecordedFile(voiceInfo[2], function(code, filePath)
			pg.game.speech:onPlayFileComplete(filePath)
		end)
	end

	function self.btnVoiceAgainUButton.luaClick()
		pg.game.speech:stopPlayAudioFile()
		self.view.panelEditWidget:TryChangePage("VoiceSignature", 2)
	end

	function self.btnVoiceNewUButton.luaPress()
		pg.game.speech:clearCurLocalAudioFile()
		pg.game.speech:stopPlayAudioFile()

		self.voiceRecordStartSeq = self.voiceRecordStartSeq + 1

		local requestSeq = self.voiceRecordStartSeq

		self.voiceRecordStarting = true
		self.voiceRecording = false

		local resolved = false
		local started = false
		local accepted = pg.global.gmeManager:StartStreamingRecording(nil, nil, function(success)
			if requestSeq ~= self.voiceRecordStartSeq then
				if success then
					pg.global.gmeManager:CancelRecording()
				end

				return
			end

			resolved = true
			started = success == true
			self.voiceRecordStarting = false
			self.voiceRecording = started

			if not started and self.view then
				local hasVoiceSignature = not string.isNilOrEmpty(pg.me.voiceSignature)

				self.view.panelEditWidget:TryChangePage("VoiceSignature", hasVoiceSignature and 1 or 0)
			end
		end)

		if accepted ~= true or resolved and not started then
			self.voiceRecordStarting = false
			self.voiceRecording = false
		end

		if not self.voiceRecordStarting and not self.voiceRecording and self.view then
			local hasVoiceSignature = not string.isNilOrEmpty(pg.me.voiceSignature)

			self.view.panelEditWidget:TryChangePage("VoiceSignature", hasVoiceSignature and 1 or 0)
		end
	end

	function self.btnVoiceNewUButton.luaRelease()
		if self.voiceRecordStarting then
			self.voiceRecordStartSeq = self.voiceRecordStartSeq + 1
			self.voiceRecordStarting = false

			pg.global.gmeManager:CancelPendingStreamingRecording()

			local hasVoiceSignature = not string.isNilOrEmpty(pg.me.voiceSignature)

			self.view.panelEditWidget:TryChangePage("VoiceSignature", hasVoiceSignature and 1 or 0)

			return
		end

		if not self.voiceRecording then
			return
		end

		self.voiceRecording = false

		pg.global.gmeManager:StopStreamingRecording(function(fileID, filePath, fileSize, duration, text, auditResult, code, tooShort)
			pg.game.speech:onRecordStopped(fileID, filePath, fileSize, duration, text, auditResult, code, tooShort)

			if not self.view then
				return
			end

			if fileID then
				pg.me:serverMsg("RPC_CS_SetVoiceSignature", math.floor(duration / 1000) .. "|" .. fileID)
			end
		end)
	end

	function self.btnDelVoiceNewUButton.luaClick()
		local hasVoiceSignature = not string.isNilOrEmpty(pg.me.voiceSignature)

		self.view.panelEditWidget:TryChangePage("VoiceSignature", hasVoiceSignature and 1 or 0)
	end
end

function EditBaseBarComponent:refreshEditBasicBarPanel()
	ClientTextUtils.setText(self.txtNameEdit, self.playerInfo.playerName or "")
	ClientTextUtils.setText(self.txtSignatureEdit, string.isNilOrEmpty(self.playerInfo.showSignature) and pg.getGameString("NO_PLAYER_SIGNATURE") or self.playerInfo.showSignature)
	self:refreshVoiceSignatureState()
end

function EditBaseBarComponent:refreshVoiceSignatureState(newV)
	local curVoiceSignature = newV or pg.me.voiceSignature
	local hasVoiceSignature = not string.isNilOrEmpty(curVoiceSignature)

	self.view.panelEditWidget:TryChangePage("VoiceSignature", hasVoiceSignature and 1 or 0)

	if hasVoiceSignature then
		local voiceSignatureInfo = string.split(curVoiceSignature, "|")

		ClientTextUtils.setText(self.txtVoiceUSDFText, math.floor(tonumber(voiceSignatureInfo[1])) .. "\"")
	end

	pg.game.speech:addListeningStateListener(self.listeningStateListener)
end

function EditBaseBarComponent:onDestroy()
	self.voiceRecordStartSeq = self.voiceRecordStartSeq + 1

	if self.voiceRecordStarting then
		pg.global.gmeManager:CancelPendingStreamingRecording()
	elseif self.voiceRecording then
		pg.global.gmeManager:CancelRecording()
	end

	self.voiceRecordStarting = false
	self.voiceRecording = false

	pg.game.speech:removeListeningStateListener(self.listeningStateListener)
end

return EditBaseBarComponent
