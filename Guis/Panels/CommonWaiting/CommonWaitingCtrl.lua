-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonWaiting\\CommonWaitingCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local CommonWaitingCtrl = Class.LightClass("CommonWaitingCtrl", UICtrl)

function CommonWaitingCtrl:onOpen(info)
	self._waitingReady = false

	UICtrl.onOpen(self, info)

	if IsNil(self.view.textLoadingUBaseText) then
		return
	end

	ClientTextUtils.setText(self.view.textLoadingUBaseText, info and info.text or "")
end

function CommonWaitingCtrl:onPostOpen(info, isReOpen)
	UICtrl.onPostOpen(self, info, isReOpen)

	if IsNil(self.view.textLoadingUBaseText) then
		return
	end

	pg.global.ui:refreshModelWidget()

	self._waitingReady = true
end

function CommonWaitingCtrl:isWaitingReady()
	return self._waitingReady == true and self:checkUIAssetReady() and self:checkUIVisible() == true and not IsNil(self.view.widget) and not self.view.widget.isClosing
end

function CommonWaitingCtrl:isWaitingOwner(token)
	return token ~= nil and self:checkUIOpen() and self._openInfo ~= nil and self._openInfo.waitingToken == token
end

function CommonWaitingCtrl:checkUIShowVirtualMouseCursor()
	return false
end

function CommonWaitingCtrl:onDestroy()
	self._waitingReady = false

	if self.view then
		self.view:setViewVisible(false)
	end

	UICtrl.onDestroy(self)
	pg.global.ui:refreshModelWidget()
end

return CommonWaitingCtrl
