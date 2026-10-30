-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonConfirm\\CommonConfirmView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local CommonConfirmView = Class.LightClass("CommonConfirmView", UIView)

function CommonConfirmView:findObjects()
	self.objectReference = self.transform:GetComponent("ObjectReference")
	self.title = self.objectReference:GetRefValue("title")
	self.subTitle = self.objectReference:GetRefValue("subTitle")
	self.cancelBtn = self.objectReference:GetRefValue("cancelBtn")
	self.confirmBtn = self.objectReference:GetRefValue("confirmBtn")
	self.listCheckBox = self.objectReference:GetRefValue("listCheckBoxUList")
	self.btnNextUButton = self.objectReference:GetRefValue("btnNextUButton")
	self.bgBlurUWidget = self.objectReference:GetRefValue("bgBlurUWidget")
	self.nextBtnText = self.btnNextUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
	self.nextBtnLockImage = self.btnNextUButton:GetComponent("ObjectReference"):GetRefValue("lockUImage")
	self.cancelBtnText = self.cancelBtn:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
	self.confirmBtnText = self.confirmBtn:GetComponent("ObjectReference"):GetRefValue("txtNameUText")
	self.qrCodeUContainer = self.objectReference:GetRefValue("qRcodeUContainer")
	self.confirmHotKeyContent = self.confirmBtn.transform:GetComponent("ObjectReference"):GetRefValue("keyHotKeyContent")
	self.cancelHotKeyContent = self.cancelBtn.transform:GetComponent("ObjectReference"):GetRefValue("keyHotKeyContent")
	self.nextHotKeyContent = self.btnNextUButton.transform:GetComponent("ObjectReference"):GetRefValue("keyHotKeyContent")
	self.imgPetUContainer = self.objectReference:GetRefValue("imgPetUContainer")
end

function CommonConfirmView:registerObjects()
	return
end

function CommonConfirmView:initView()
	self.qrCodeTex = nil
	self.qrCodeRawImage = nil
	self.qrCodeText = nil
end

function CommonConfirmView:setQRCodeContent(content)
	self.qrCodeRawImage = nil
	self.qrCodeText = nil

	if not content then
		return false
	end

	local objectReference = content:GetComponent("ObjectReference")

	if not objectReference then
		return false
	end

	self.qrCodeRawImage = objectReference:GetRefValue("qrCodeRawImage")
	self.qrCodeText = objectReference:GetRefValue("qrCodeText")

	return self.qrCodeRawImage ~= nil and self.qrCodeText ~= nil
end

function CommonConfirmView:delayDestroyUIView()
	UIView.delayDestroyUIView(self)

	if self.qrCodeTex then
		CS.UnityEngine.Object.Destroy(self.qrCodeTex)

		self.qrCodeTex = nil
	end
end

return CommonConfirmView
