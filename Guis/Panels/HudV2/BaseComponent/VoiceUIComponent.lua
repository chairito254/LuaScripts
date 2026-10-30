-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HudV2\\BaseComponent\\VoiceUIComponent.lua

local Class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local MessageName = require("Const.MessageName")
local ClientConst = require("Const.ClientConst")
local HotkeyConst = require("Const.HotkeyConst")
local SettingFuncListData = require("Data.setting_func_list_data")
local ClientSettingUtils = require("Utils.ClientSettingUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientUtils = require("Utils.ClientUtils")
local Utils = require("Common.Utils.Utils")
local HudBaseComponent = require("Guis.Panels.HudV2.HudBaseComponent")
local VoiceUIComponent = Class.LightClass("VoiceUIComponent", HudBaseComponent)

VoiceUIComponent.TOOLTIP_PRESS_DURATION = 0.3
VoiceUIComponent.messages = {
	[MessageName.SPEECH_ROOM_MEMBER_STATE_CHANGE] = {
		"refreshSpeechState",
		true
	},
	[MessageName.SPEECH_ROOM_STATE_CHANGE] = {
		"onSpeechRoomStateChange",
		true
	},
	[MessageName.SYNC_TEAM_INFO] = {
		"refreshVisible",
		true
	},
	[MessageName.TEAM_ENTER_DUNGEON] = {
		"refreshVisible",
		true
	},
	[MessageName.TEAM_SPEECH_SPEAK_TYPE_CHANGE] = {
		"refreshSpeakType",
		true
	},
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"onInputDeviceChanged",
		true
	}
}

function VoiceUIComponent:onCtor()
	self.buttonPressStartTime = nil
	self.hotkeyPressStartTime = nil
	self.buttonPressing = false
	self.hotkeyPressing = false
	self.pushToTalkMicOpened = false
	self.voiceTooltipOpen = false
	self.voiceTooltipMoveBlocked = false
end

function VoiceUIComponent:findObjects()
	self.btnVoiceUButton = self.transform:GetComponent("UButton")
end

function VoiceUIComponent:getSpeakTypeSettingInfo()
	for _, settingInfo in ipairs(SettingFuncListData) do
		if settingInfo.funcType == ClientConst.SettingFuncType.TeamSpeechSpeakType and ClientUtils.checkIsOpenToCurPlatform(settingInfo) then
			return settingInfo
		end
	end

	error("VoiceUIComponent: teamSpeechSpeakType setting config is missing for current platform")
end

function VoiceUIComponent:renderTooltip(popup)
	local objectReference = popup:GetComponent("ObjectReference")
	local listUList = objectReference:GetRefValue("listUList")
	local settingInfo = self:getSpeakTypeSettingInfo()
	local optionData = ClientSettingUtils.getOptionsData({
		info = settingInfo
	})

	function listUList.luaRenderItem(button, index, data)
		local itemObjectReference = button:GetComponent("ObjectReference")
		local txtNameUSDFText = itemObjectReference:GetRefValue("txtNameUSDFText")

		ClientTextUtils.setText(txtNameUSDFText, data.label)
		button:TryChangePage("Type", data.value)

		button.isSelected = ClientSettingUtils.get_teamSpeechSpeakType(optionData) == index

		function button.luaClick()
			ClientSettingUtils.applyPlayerSettingValue(settingInfo.funcType, data.value, settingInfo.funcParam)
			ClientSettingUtils.setLog(settingInfo.funcType, data.value)
			listUList:SetList(optionData)
		end
	end

	listUList:SetList(optionData)
end

function VoiceUIComponent:setVoiceTooltipMoveBlocked(blocked)
	if self.voiceTooltipMoveBlocked == blocked then
		return
	end

	self.voiceTooltipMoveBlocked = blocked

	pg.game.input:setInputActionEnabled(HotkeyConst.INPUT_MAP_ACTION_KEY.Move, not blocked, HotkeyConst.INPUT_BLOCK_FLAG.VOICE_TOOLTIP)

	if blocked then
		pg.global.inputMgr:SetMoveAxis(0, 0, 0)
	end
end

function VoiceUIComponent:refreshVoiceTooltipMoveBlocked()
	self:setVoiceTooltipMoveBlocked(self.voiceTooltipOpen and pg.game.input:isUsingGamepad())
end

function VoiceUIComponent:onVoiceTooltipPopup(isOpen)
	self.voiceTooltipOpen = isOpen

	self:refreshVoiceTooltipMoveBlocked()
end

function VoiceUIComponent:onInputDeviceChanged()
	self:refreshVoiceTooltipMoveBlocked()
end

function VoiceUIComponent:initView()
	self:bindManualPushTalk()

	function self.btnVoiceUButton.luaPress()
		if pg.game.setting:getTeamSpeechFreeTalk() then
			return
		end

		self:onVoiceInputPress(false)
	end

	function self.btnVoiceUButton.luaRelease()
		if pg.game.setting:getTeamSpeechFreeTalk() then
			self.btnVoiceUButton:OpenTooltip()

			return
		end

		self:onVoiceInputRelease(false)
	end

	function self.btnVoiceUButton.luaRenderTooltip(_, popup)
		self:renderTooltip(popup)
	end

	function self.btnVoiceUButton.luaTooltipPopup(_, isOpen)
		self:onVoiceTooltipPopup(isOpen)
	end

	self:refreshVisible()
	self:refreshSpeakType()
	self:refreshSpeechState()
end

function VoiceUIComponent:bindManualPushTalk()
	self.teamSpeechTalkBind = KeyBindingPro.GetOrAddKeyBindingByName(self.transform.gameObject, "teamSpeechTalkBind")
	self.teamSpeechTalkBind.isVirtual = true
	self.teamSpeechTalkBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.TeamPushTalk

	function self.teamSpeechTalkBind.luaTrigger(inputInfo)
		if not self:isInTeamSpeechRoom() then
			return true
		end

		if inputInfo.phase == "Checked" then
			return false
		end

		if inputInfo.phase == "Performed" then
			if pg.game.setting:getTeamSpeechFreeTalk() then
				return
			end

			self:onVoiceInputPress(true)
		elseif inputInfo.phase == "Canceled" then
			if pg.game.setting:getTeamSpeechFreeTalk() then
				self.btnVoiceUButton:OpenTooltip()

				return
			end

			self:onVoiceInputRelease(true)
		end
	end

	local objectReference = self.btnVoiceUButton.transform:GetComponent("ObjectReference")
	local keyHotKeyContent = objectReference:GetRefValue("keyHotKeyContent")

	keyHotKeyContent:SetHotKeyPaths(HotkeyConst.INPUT_MAP_ACTION_KEY.TeamPushTalk)
end

function VoiceUIComponent:isInTeamSpeechRoom()
	return pg.me and pg.me:isInSpeechChannel(pg.me.uid) or false
end

function VoiceUIComponent:isInMultiPlayerTeam()
	return pg.me and pg.me:isInTeam(true) or false
end

function VoiceUIComponent:onVoiceInputPress(isHotkey)
	if not self:isInTeamSpeechRoom() then
		return
	end

	if isHotkey then
		if self.hotkeyPressing then
			return
		end

		self.hotkeyPressing = true
		self.hotkeyPressStartTime = Time.realtimeSinceStartup

		self.btnVoiceUButton:TryChangePage("button", 1)
	else
		if self.buttonPressing then
			return
		end

		self.buttonPressing = true
		self.buttonPressStartTime = Time.realtimeSinceStartup
	end

	if pg.game.setting:getTeamSpeechFreeTalk() then
		return
	end

	self.btnVoiceUButton:TryChangePage("Speak", 1)

	if self.pushToTalkMicOpened then
		return
	end

	self.pushToTalkMicOpened = true

	pg.global.gmeManager:EnableMic(true, true)
end

function VoiceUIComponent:onVoiceInputRelease(isHotkey)
	local pressStartTime

	if isHotkey then
		pressStartTime = self.hotkeyPressStartTime
		self.hotkeyPressStartTime = nil
		self.hotkeyPressing = false
	else
		pressStartTime = self.buttonPressStartTime
		self.buttonPressStartTime = nil
		self.buttonPressing = false
	end

	if not self.buttonPressing and not self.hotkeyPressing then
		if isHotkey then
			self.btnVoiceUButton:TryChangePage("button", 0)
		end

		self.btnVoiceUButton:TryChangePage("Speak", 0)
		self:stopPushToTalk()
	end

	if pressStartTime and self:isInTeamSpeechRoom() and Time.realtimeSinceStartup - pressStartTime <= self.TOOLTIP_PRESS_DURATION then
		self.btnVoiceUButton:OpenTooltip()
	end
end

function VoiceUIComponent:clearVoiceInputState()
	self.buttonPressStartTime = nil
	self.hotkeyPressStartTime = nil
	self.buttonPressing = false
	self.hotkeyPressing = false

	self.btnVoiceUButton:TryChangePage("Speak", 0)
	self:stopPushToTalk()
end

function VoiceUIComponent:stopPushToTalk()
	if not self.pushToTalkMicOpened then
		return
	end

	self.pushToTalkMicOpened = false

	if not pg.game.setting:getTeamSpeechFreeTalk() then
		pg.global.gmeManager:EnableMic(false, true)
	end
end

function VoiceUIComponent:refreshSpeechState()
	local speaking = pg.me and pg.game.speech:checkMemberSpeaking(pg.me.uid)

	self.btnVoiceUButton:TryChangePage("State", speaking and 1 or 0)
end

function VoiceUIComponent:refreshSpeakType()
	local freeTalk = pg.game.setting:getTeamSpeechFreeTalk()

	self.btnVoiceUButton:TryChangePage("Type", freeTalk and 1 or 0)
end

function VoiceUIComponent:setRoomVisible(visible)
	if pg.space and Utils.isWorldRacingDungeonSpaceType(pg.space.spaceType) then
		visible = false
	end

	if visible then
		self:show()

		return
	end

	self:clearVoiceInputState()
	self:hide()
end

function VoiceUIComponent:refreshVisible()
	self:setRoomVisible(self:isInMultiPlayerTeam() and self:isInTeamSpeechRoom())
end

function VoiceUIComponent:onSpeechRoomStateChange(info)
	self:setRoomVisible(self:isInMultiPlayerTeam() and info.inSpeechRoom or false)
	self:refreshSpeakType()
	self:refreshSpeechState()
end

function VoiceUIComponent:onHide()
	self.btnVoiceUButton:CloseTooltip()
	self:onVoiceTooltipPopup(false)
end

function VoiceUIComponent:onDestroy()
	self:clearVoiceInputState()
	self.btnVoiceUButton:CloseTooltip()
	self:onVoiceTooltipPopup(false)

	self.teamSpeechTalkBind.luaTrigger = nil
	self.teamSpeechTalkBind = nil
	self.btnVoiceUButton.luaPress = nil
	self.btnVoiceUButton.luaRelease = nil
	self.btnVoiceUButton.luaRenderTooltip = nil
	self.btnVoiceUButton.luaTooltipPopup = nil

	HudBaseComponent.onDestroy(self)
end

return VoiceUIComponent
