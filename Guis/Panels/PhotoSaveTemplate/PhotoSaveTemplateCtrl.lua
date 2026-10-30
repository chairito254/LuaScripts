-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\PhotoSaveTemplate\\PhotoSaveTemplateCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PhotoSaveTemplateCtrl = Class.LightClass("PhotoSaveTemplateCtrl", UICtrl)
local TitleLimit = 20
local ContentLimit = 100

PhotoSaveTemplateCtrl.messages = {}

function PhotoSaveTemplateCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
	self.view.titleInputUTMPInputField:SetCharacterLimit(TitleLimit, true)
	self.view.contentInputUTMPInputField:SetCharacterLimit(ContentLimit, true)

	self.title = nil
	self.content = nil
	self.templateInfo = info.templateInfo
	self.sprite = info.sprite
	self.successCallback = info.successCallback
	self.saving = false

	self:initView()
end

function PhotoSaveTemplateCtrl:setSaving(saving)
	self.saving = saving == true

	if self.view and self.view.btnConfirmUButton then
		self.view.btnConfirmUButton.interactable = not self.saving
	end
end

function PhotoSaveTemplateCtrl:addListener()
	function self.view.titleInputUTMPInputField.luaValueChanged(newName)
		local count = 0

		self.title, count = ClientTextUtils.getValidName(newName, TitleLimit / 2)
	end

	function self.view.contentInputUTMPInputField.luaValueChanged(newName)
		local count = 0

		self.content, count = ClientTextUtils.getValidName(newName, ContentLimit / 2)
	end

	function self.view.btnConfirmUButton.luaClick()
		if self.saving then
			return
		end

		self.title = ClientTextUtils.normalizeInputFieldText(self.view.titleInputUTMPInputField, TitleLimit / 2)
		self.content = ClientTextUtils.normalizeInputFieldText(self.view.contentInputUTMPInputField, ContentLimit / 2)

		if string.isNilOrEmpty(self.title) then
			pg.global.showBubbleMessageRaw(pg.getGameString("PHOTO_PRESET_TITLE"))

			return
		end

		if string.isNilOrEmpty(self.content) then
			pg.global.showBubbleMessageRaw(pg.getGameString("PHOTO_PRESET_DESC"))

			return
		end

		self:setSaving(true)

		local view = self.view
		local templateInfo = self.templateInfo
		local sprite = self.sprite
		local title = self.title
		local content = self.content

		local function isCurrentView()
			return self.view == view and self.templateInfo == templateInfo and self:checkUIOpen()
		end

		pg.me:sensitiveWordsCheck(title, function(text)
			pg.me:sensitiveWordsCheck(content, function(text)
				templateInfo.title = title
				templateInfo.desc = content

				pg.me:uploadPresetWithImgSprite(templateInfo, sprite, function(id, success)
					if not success then
						if isCurrentView() then
							self:setSaving(false)
						end

						return
					end

					pg.global.showBubbleMessageRaw(pg.getGameString("PHOTO_TEMPLATE_SAVED"))

					if not isCurrentView() then
						return
					end

					if self.successCallback then
						self.successCallback()
					end

					self:close()
				end)
			end, function()
				if isCurrentView() then
					self:setSaving(false)
				end
			end, {
				DetailType = "Photo_Description",
				Level = pg.me.level
			})
		end, function()
			if isCurrentView() then
				self:setSaving(false)
			end
		end, {
			DetailType = "Photo_Title",
			Level = pg.me.level
		})
	end

	function self.view.btnCancelUButton.luaClick()
		self:close()
	end
end

function PhotoSaveTemplateCtrl:onDestroy()
	UICtrl.onDestroy(self)
end

function PhotoSaveTemplateCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function PhotoSaveTemplateCtrl:onShow()
	return
end

function PhotoSaveTemplateCtrl:onHide()
	return
end

function PhotoSaveTemplateCtrl:initView()
	self.view.photoUImage.sprite = self.sprite

	ClientTextUtils.setText(self.view.titleLimitUBaseText, "")
	ClientTextUtils.setText(self.view.contentLimitUBaseText, "")
end

return PhotoSaveTemplateCtrl
