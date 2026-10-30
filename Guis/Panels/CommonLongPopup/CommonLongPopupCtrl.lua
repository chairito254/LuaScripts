-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\CommonLongPopup\\CommonLongPopupCtrl.lua

local UICtrl = require("Guis.UICtrl")
local Class = require("Core.Framework.Class")
local CommonLongPopupCtrl = Class.LightClass("CommonLongPopupCtrl", UICtrl)
local ClientTextUtils = require("Utils.ClientTextUtils")

function CommonLongPopupCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
	self:setContent(info.title, info.content)
	self:bindCommonLongPopupBtnEvents(info)
end

function CommonLongPopupCtrl:addListener()
	return
end

function CommonLongPopupCtrl:onShow()
	UICtrl.onShow(self)
	self:refreshDoubleRewardContent()
end

function CommonLongPopupCtrl:refreshDoubleRewardContent()
	local container = self.view.doubleRewardUContainer

	if not container then
		return
	end

	if container.gameObject.activeInHierarchy and container.isVisible then
		container:LoadDefaultUrlManually()
	else
		container:DestroyContent()
	end
end

function CommonLongPopupCtrl:onHide()
	local container = self.view.doubleRewardUContainer

	if container then
		container:DestroyContent()
	end

	UICtrl.onHide(self)
end

function CommonLongPopupCtrl:onDestroy()
	local container = self.view.doubleRewardUContainer

	if container then
		container:DestroyContent()
	end

	UICtrl.onDestroy(self)
end

function CommonLongPopupCtrl:setContent(title, content)
	if title then
		ClientTextUtils.setText(self.view.titleText, title)
	end

	ClientTextUtils.setText(self.view.contextText, content)
	self.view.confirmHotKeyContent:SetHotKeyPaths("Common/Confirm")
	self.view.cancelHotKeyContent:SetHotKeyPaths("Common/Cancel")
end

function CommonLongPopupCtrl:bindCommonLongPopupBtnEvents(infos)
	function self.view.cancelBtn.luaClick()
		self:dismiss()
	end

	function self.view.confirmBtn.luaClick()
		if infos.confirmCb then
			infos.confirmCb()
			self:dismiss()
		end
	end
end

return CommonLongPopupCtrl
