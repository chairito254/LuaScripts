-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonTextInput\\CommonTextInputCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local CommonTextInputCtrl = Class.LightClass("CommonTextInputCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")
local SysConfigData = require("Data.sys_config_data")

function CommonTextInputCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
	ClientTextUtils.setText(self.view.txtTitleUSDFText, info.title)

	self.confirmCb = info.confirmCb
	self.maxLen = info.maxLen or 20
	self.needSensitiveWordsCheck = info.needSensitiveWordsCheck == true

	self.view.inputFieldUTMPInputField:SetCharacterLimit(self.maxLen * 2, true)

	self.view.inputFieldUTMPInputField.text = info.initialInputText
	self.nameLen = 0

	if not string.isNilOrEmpty(info.initialInputText) then
		self.newArgs, self.nameLen = ClientTextUtils.getValidName(info.initialInputText, self.maxLen)
	end

	ClientTextUtils.setText(self.view.textNumUSDFText, self.nameLen .. "/" .. self.maxLen * 2)
end

function CommonTextInputCtrl:normalizeInputText()
	local validText, nameLen, changed = ClientTextUtils.normalizeInputFieldText(self.view.inputFieldUTMPInputField, self.maxLen)

	self.newArgs = validText
	self.nameLen = nameLen

	ClientTextUtils.setText(self.view.textNumUSDFText, nameLen .. "/" .. self.maxLen * 2)

	if changed then
		return false
	end

	return true
end

function CommonTextInputCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:close()
	end

	self:bindHotKeyPerform("Common/ClosePanelCommon", function()
		self.view.btnCloseUButton.luaClick()
	end, self.view.widget.gameObject)

	function self.view.btnCancelUButton.luaClick()
		self:close()
	end

	function self.view.btnConfirmUButton.luaClick()
		if not self:normalizeInputText() then
			return
		end

		local inputText = self.newArgs

		if self.needSensitiveWordsCheck and not string.isNilOrEmpty(inputText) then
			pg.me:sensitiveWordsCheck(inputText, function(text)
				if not self.view then
					return
				end

				self:close()

				if self.confirmCb then
					self.confirmCb(text)
				end
			end)

			return
		end

		self:close()

		if self.confirmCb then
			self.confirmCb(inputText)
		end
	end

	function self.view.inputFieldUTMPInputField.luaValueChanged(newText)
		self.newArgs, self.nameLen = ClientTextUtils.getValidName(newText, self.maxLen)

		ClientTextUtils.setText(self.view.textNumUSDFText, self.nameLen .. "/" .. self.maxLen * 2)
	end

	function self.view.inputFieldUTMPInputField.luaEndEdit()
		self:normalizeInputText()
	end

	function self.view.inputFieldUTMPInputField.luaEndEdit()
		self:normalizeInputText()
	end
end

return CommonTextInputCtrl
