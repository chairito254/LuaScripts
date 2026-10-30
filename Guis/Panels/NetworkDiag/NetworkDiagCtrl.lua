-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\NetworkDiag\\NetworkDiagCtrl.lua

local UICtrl = require("Guis.UICtrl")
local Class = require("Core.Framework.Class")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientUtils = require("Utils.ClientUtils")
local NetworkDiagCtrl = Class.LightClass("NetworkDiagCtrl", UICtrl)

function NetworkDiagCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.reportContent = info and info.content or ""

	ClientTextUtils.setText(self.view.txtTitleText, pg.getGameString("NETWORK_DIAG_TITLE"))

	local detailDescUSDText = self.view.scrollRectRectTransform:Find("View/Content"):GetComponent("USDFText")

	ClientTextUtils.setText(detailDescUSDText, self.reportContent)
	self:showCopyButton()
end

function NetworkDiagCtrl:showCopyButton()
	local btnText = self.view.btnConfirmUButton:GetComponent("ObjectReference"):GetRefValue("txtNameUText")

	ClientTextUtils.setText(btnText, pg.getGameString("NETWORK_DIAG_COPY_BTN"))
end

function NetworkDiagCtrl:addListener()
	function self.view.btnCloseUButton.luaClick()
		self:dismiss()
	end

	function self.view.btnConfirmUButton.luaClick()
		CS.UnityEngine.GUIUtility.systemCopyBuffer = self.reportContent

		ClientUtils.showBubbleMessageRaw(pg.getGameString("NETWORK_DIAG_COPY_SUCCESS"))
	end
end

return NetworkDiagCtrl
