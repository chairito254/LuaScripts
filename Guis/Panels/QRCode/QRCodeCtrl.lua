-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\QRCode\\QRCodeCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("QRCodeCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local EventOfficialGroupData = require("Data.event_official_group_data")
local QRCodeCtrl = Class.LightClass("QRCodeCtrl", UICtrl)
local URL_CODE_STATE = 0
local IMAGE_CODE_STATE = 1

QRCodeCtrl.messages = {}

function QRCodeCtrl:onCreate(info)
	UICtrl.onCreate(self, info)
end

function QRCodeCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:dismiss()
	end
end

function QRCodeCtrl:onDestroy()
	if self.qrCodeTex then
		CS.UnityEngine.Object.Destroy(self.qrCodeTex)

		self.qrCodeTex = nil
	end

	UICtrl.onDestroy(self)
end

function QRCodeCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	if info and not string.isNilOrEmpty(info.url) then
		self:showUrlCode(info.url, info.desc)

		return
	end

	local desc = info and info.desc or nil

	if info and info.id then
		local officialData = EventOfficialGroupData[info.id]

		if officialData then
			desc = pg.getLocalizationText(officialData.qrcodeDesc)
		end
	end

	self:showImageCode(info and info.codeUrl or nil, desc)
end

function QRCodeCtrl:showUrlCode(url, desc)
	if self.qrCodeTex then
		CS.UnityEngine.Object.Destroy(self.qrCodeTex)

		self.qrCodeTex = nil
	end

	self.view.rootUComponent:TryChangePage("SwitchingCode", URL_CODE_STATE)

	self.qrCodeTex = pg.global.qrCodeMgr:DrawQRCode(self.view.codeURawImage, url)

	ClientTextUtils.setText(self.view.text1UBaseText, desc or "")
end

function QRCodeCtrl:showImageCode(codeUrl, desc)
	self.view.rootUComponent:TryChangePage("SwitchingCode", IMAGE_CODE_STATE)

	if not string.isNilOrEmpty(codeUrl) then
		self.view.codeUImage.url = codeUrl
	end

	if desc ~= nil then
		ClientTextUtils.setText(self.view.text1UBaseText, desc)
	end
end

function QRCodeCtrl:onShow()
	return
end

function QRCodeCtrl:onHide()
	return
end

return QRCodeCtrl
