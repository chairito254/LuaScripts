-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LoginServerMaintenance\\LoginServerMaintenanceCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local CallbackHandler = require("Core.Common.CallbackHandler")
local LoginServerMaintenanceCtrl = Class.LightClass("LoginServerMaintenanceCtrl", UICtrl)

function LoginServerMaintenanceCtrl:addListener()
	self.view.btnCloseUButton.luaClick = CallbackHandler(self, "onCloseClick")
	self.view.btnConfirmUButton.luaClick = CallbackHandler(self, "onCloseClick")
	self.view.btnOfficialWebsiteUButton.luaClick = CallbackHandler(self, "onOfficialWebsiteClick")
end

function LoginServerMaintenanceCtrl:onCloseClick()
	self:closePanel()
end

function LoginServerMaintenanceCtrl:onOfficialWebsiteClick()
	local callback = self.officialWebsiteCallback

	self:closePanel()

	if callback then
		callback()
	end
end

function LoginServerMaintenanceCtrl:onOpen(info)
	UICtrl.onOpen(self, info)

	info = info or {}
	self.officialWebsiteCallback = info.officialWebsiteCallback

	ClientTextUtils.setText(self.view.txtTitleUSDFText, pg.getGameString("MAINTENANCE_SYSTEM_IN_PROGRESS"))
	ClientTextUtils.setText(self.view.txtDetailUSDFText, info.description or "")
	ClientTextUtils.setText(self.view.txtConfirmUSDFText, pg.getGameString("MAINTENANCE_SYSTEM_CONFIRM"))
	ClientTextUtils.setText(self.view.txtOfficialWebsiteUSDFText, pg.getGameString("MAINTENANCE_SYSTEM_GO_TO_OFFICIAL_WEBSITE"))
end

function LoginServerMaintenanceCtrl:onDestroy()
	self.view.btnCloseUButton.luaClick = nil
	self.view.btnConfirmUButton.luaClick = nil
	self.view.btnOfficialWebsiteUButton.luaClick = nil
	self.officialWebsiteCallback = nil

	UICtrl.onDestroy(self)
end

return LoginServerMaintenanceCtrl
