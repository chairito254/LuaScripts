-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\LoginServerMaintenance\\LoginServerMaintenanceView.lua

local Class = require("Core.Framework.Class")
local UIView = require("Guis.UIView")
local LoginServerMaintenanceView = Class.LightClass("LoginServerMaintenanceView", UIView)

function LoginServerMaintenanceView:findObjects()
	local objectReference = self.transform:GetComponent("ObjectReference")

	self.txtTitleUSDFText = objectReference:GetRefValue("txtTitleUSDFText")
	self.txtDetailUSDFText = objectReference:GetRefValue("txtDetailUSDFText")
	self.txtConfirmUSDFText = objectReference:GetRefValue("txtConfirmUSDFText")
	self.txtOfficialWebsiteUSDFText = objectReference:GetRefValue("txtOfficialWebsiteUSDFText")
	self.btnCloseUButton = objectReference:GetRefValue("btnCloseUButton")
	self.btnConfirmUButton = objectReference:GetRefValue("btnConfirmUButton")
	self.btnOfficialWebsiteUButton = objectReference:GetRefValue("btnOfficialWebsiteUButton")
end

function LoginServerMaintenanceView:registerObjects()
	return
end

function LoginServerMaintenanceView:initView()
	self.txtTitleUSDFText.disabledLocalization = true
	self.txtDetailUSDFText.disabledLocalization = true
	self.txtConfirmUSDFText.disabledLocalization = true
	self.txtOfficialWebsiteUSDFText.disabledLocalization = true
end

return LoginServerMaintenanceView
