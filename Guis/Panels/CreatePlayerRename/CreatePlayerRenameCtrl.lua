-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CreatePlayerRename\\CreatePlayerRenameCtrl.lua

local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local CreatePlayerRenameCtrl = Class.LightClass("CreatePlayerRenameCtrl", UICtrl)
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("CreatePlayerRenameCtrl")
local Const = require("Common.Const.Const")
local SysNoticeData = require("Data.sys_notice_data")
local SysConfigData = require("Data.sys_config_data")
local csSDKManager = CS.FunPlus.WorldX.SDK.SDKManager

CreatePlayerRenameCtrl.messages = {}

function CreatePlayerRenameCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function CreatePlayerRenameCtrl:normalizeInputText()
	local validText, _, changed = ClientTextUtils.normalizeInputFieldText(self.view.inputField, SysConfigData.playerNameMaxLen)

	self.newArgs = validText

	if changed then
		return false
	end

	return true
end

function CreatePlayerRenameCtrl:addListener()
	function self.view.inputField.luaValueChanged(name)
		self:onNameChanged(name)
	end

	function self.view.inputField.luaEndEdit()
		self:normalizeInputText()
	end

	function self.view.btnRandom.luaClick()
		self:randomName()
	end

	function self.view.btnEnter.luaClick()
		self:submitRename()
	end
end

function CreatePlayerRenameCtrl:onDestroy()
	UICtrl.onDestroy(self)
	LuaUIUtils.resetPlayerState()
end

function CreatePlayerRenameCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self.view.inputField:SetCharacterLimit(SysConfigData.playerNameMaxLen * 2, true)

	self.canSubmit = true

	LuaUIUtils.openWristWatch()
	self.view.inputField:Select()
	csSDKManager.PatchFlowSDKLog(30027, "", "", "")
end

function CreatePlayerRenameCtrl:randomName()
	local randomName = self.model:getRandomName()

	self.view.inputField:SetTextWithoutNotify(randomName)
end

function CreatePlayerRenameCtrl:onNameChanged(name)
	name = self.model:getValidName(name)
end

function CreatePlayerRenameCtrl:submitRename()
	if not self:normalizeInputText() then
		return
	end

	local newName = self.newArgs

	if string.isNilOrEmpty(newName) then
		self.view.rootComponent:TryChangePage("Tips", 1)
		ClientTextUtils.setText(self.view.txtTips, pg.getGameString("TAG_NAME_NULL"))

		return
	end

	if ClientTextUtils.containsBlank(newName) then
		self.view.rootComponent:TryChangePage("Tips", 1)
		ClientTextUtils.setText(self.view.txtTips, pg.getGameString("PLAYER_NAME_CONTAINS_BLANK"))

		return
	end

	if ClientTextUtils.containsRichText(newName) then
		self.view.rootComponent:TryChangePage("Tips", 1)
		ClientTextUtils.setText(self.view.txtTips, pg.getGameString("CONTENT_CONTAINS_RICH_TEXT"))

		return
	end

	if not self.view.inputField:CanRenderText(newName) then
		self.view.rootComponent:TryChangePage("Tips", 1)
		ClientTextUtils.setText(self.view.txtTips, pg.getGameString("NAME_NOT_VALID"))

		return
	end

	if not self.canSubmit then
		return
	end

	self.canSubmit = false

	logger:info("@zqd createNameResult1: ", newName)

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info("@zqd create user name: ", newName)
	end

	pg.me:serverMsg("RPC_CS_ChangePlayerName", newName)
end

function CreatePlayerRenameCtrl:createNameResult(errorCode)
	logger:info("@zqd createNameResult2: ", errorCode)

	if errorCode == Const.CHANGE_NAME_RETURN_CODE.SUCCESS then
		self.view.rootComponent:TryChangePage("Tips", 0)
		self.view.rootComponent:TryChangePage("Pass", 1)
		self:dismiss()

		return
	end

	self.canSubmit = true

	self.view.rootComponent:TryChangePage("Tips", 1)
	self.view.rootComponent:TryChangePage("Pass", 0)

	local noticeId = Const.CHANGE_NAME_RESULT_NOTICE_IDS[errorCode]

	if noticeId ~= nil then
		local noticeData = SysNoticeData[noticeId]

		if noticeData == nil then
			logger:error("noticeId不在这个表里", noticeId)

			return
		end

		ClientTextUtils.setText(self.view.txtTips, pg.getLocalizationText(noticeData.text))
	end
end

return CreatePlayerRenameCtrl
