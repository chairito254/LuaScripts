-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Component\\InputFieldUIComponent.lua

local ClientTextUtils = require("Utils.ClientTextUtils")
local UIComponent = require("Guis.Helper.UIComponent")
local Class = require("Core.Framework.Class")
local InputFieldUIComponent = Class.LightClass("InputFieldUIComponent", UIComponent)
local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")

function InputFieldUIComponent:findObjects()
	self.container = self.transform:GetComponent("UContainer")
end

function InputFieldUIComponent:registerObjectInner()
	self.objectReference = self.container.content:GetComponent("ObjectReference")
	self.txtName = self.objectReference:GetRefValue("txtName")
	self.inputField = self.objectReference:GetRefValue("inputField")
	self.btnConfirm = self.objectReference:GetRefValue("btnConfirm")
	self.btnCancel = self.objectReference:GetRefValue("btnCancel")
	self.errorTextUText = self.objectReference:GetRefValue("errorTextUText")
	self.placeHolderUText = self.objectReference:GetRefValue("placeHolderUText")
	self.btnCloseUButton = self.objectReference:GetRefValue("btnCloseUButton")
	self.nextTimeUWidget = self.objectReference:GetRefValue("nextTimeUWidget")
	self.nextTimeUButton = self.objectReference:GetRefValue("nextTimeUButton")
	self.nextTimeText = self.objectReference:GetRefValue("nextTimeText")
end

function InputFieldUIComponent:initView()
	self:hide()
end

function InputFieldUIComponent:onHide()
	self.ctrl:componentSetIsModel("InputField", false)
end

function InputFieldUIComponent:onShow()
	self.ctrl:componentSetIsModel("InputField", true)
end

function InputFieldUIComponent:showInput(title, confirmCb, cancelCb, extraConfig, loadCb)
	if not self.container:CheckURLLoaded() then
		self.container:LoadDefaultUrlManually(function()
			self:registerObjectInner()
			self:showInputInternal(title, confirmCb, cancelCb, extraConfig)

			if loadCb then
				loadCb()
			end
		end)
	else
		self:showInputInternal(title, confirmCb, cancelCb, extraConfig)

		if loadCb then
			loadCb()
		end
	end
end

function InputFieldUIComponent:showInputInternal(title, confirmCb, cancelCb, extraConfig)
	extraConfig = extraConfig or {}

	local characterLimit = extraConfig.characterLimit or 14

	if characterLimit > 0 then
		local patten = pg.getGameString("INPUT_FIELD_CHAR_RESTRICTION")

		ClientTextUtils.setText(self.placeHolderUText, pg.getFormatText(patten, tostring(characterLimit)))
		self.inputField:SetCharacterLimit(characterLimit, true)
	else
		ClientTextUtils.setText(self.placeHolderUText, "")
		self.inputField:SetCharacterLimit(0, true)
	end

	ClientTextUtils.setText(self.inputField, extraConfig.text or "")
	LuaUIUtils.setUIViewVisible(self.errorTextUText, false)

	function self.btnConfirm.luaClick()
		local inputText = self.inputField.text

		if confirmCb and confirmCb(inputText) then
			return
		end

		self:hide()
	end

	function self.btnCancel.luaClick()
		self:hide()

		if cancelCb then
			cancelCb()
		end
	end

	function self.btnCloseUButton.luaClick()
		self:hide()

		if cancelCb then
			cancelCb()
		end
	end

	ClientTextUtils.setText(self.txtName, pg.getLocalizationText(title))

	if extraConfig and extraConfig.hint then
		self.nextTimeUWidget:SetActiveFastest(true)

		function self.nextTimeUButton.luaSelectChanged(isSelected)
			if extraConfig.hintCb then
				extraConfig.hintCb(isSelected)
			end
		end

		if extraConfig.hintDesc then
			ClientTextUtils.setText(self.nextTimeText, extraConfig.hintDesc)
		end
	else
		self.nextTimeUWidget:SetActiveFastest(false)
	end

	self:show()
end

return InputFieldUIComponent
