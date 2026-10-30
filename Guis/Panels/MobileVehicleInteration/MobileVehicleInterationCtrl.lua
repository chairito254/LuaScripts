-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\MobileVehicleInteration\\MobileVehicleInterationCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local ClientTextUtils = require("Utils.ClientTextUtils")
local MobileVehicleInterationCtrl = Class.LightClass("MobileVehicleInterationCtrl", UICtrl)

MobileVehicleInterationCtrl.messages = {
	[MessageName.ON_CEHICLE_SEAT_MAP_CHANGED] = {
		"refreshButtons",
		true
	},
	[MessageName.VEHICLE_RIDE_AUTHORITY_CHANGED] = {
		"onVehicleRideAuthorityChanged",
		true
	}
}

function MobileVehicleInterationCtrl:onCreate(info)
	self.info = info
	self.jumpPressed = false
	self.mainButtonPressIsJump = nil

	UICtrl.onCreate(self, info)
	self:refreshButtons()
	facade:sendMsgToUI(MessageName.VEHICLE_SHOW_STATE_CHANGED, {
		showVehicleInter = true
	})
end

function MobileVehicleInterationCtrl:addListener()
	function self.view.mainButton.luaPress()
		self.mainButtonPressIsJump = self.mainButtonIsJump

		if not self.mainButtonIsJump then
			return
		end

		if not self:isVehicleController() then
			self:refreshButtons()

			return
		end

		self.jumpPressed = true

		pg.game.controller:onHandleJump(true)
	end

	function self.view.mainButton.luaRelease()
		self:releaseJump()
	end

	function self.view.mainButton.luaClick()
		local wasJump = self.mainButtonPressIsJump

		self.mainButtonPressIsJump = nil

		if not wasJump and not self.mainButtonIsJump and not self:isVehicleController() then
			self:onExitClick()
		end
	end

	function self.view.closeButton.luaClick()
		self:onExitClick()
	end
end

function MobileVehicleInterationCtrl:onExitClick()
	self:releaseJump()

	if not self:canActiveDismount() then
		return
	end

	pg.pawn:dismountSelf()
end

function MobileVehicleInterationCtrl:canActiveDismount()
	local pawn = pg.pawn

	return pawn == nil or pawn.canActiveDismountVehicle == nil or pawn:canActiveDismountVehicle()
end

function MobileVehicleInterationCtrl:setButtonContent(button, text, icon)
	local objectReference = button:GetComponent("ObjectReference")
	local nameText = objectReference:GetRefValue("txtNameUText")
	local iconImage = objectReference:GetRefValue("iconUImage")

	ClientTextUtils.setText(nameText, text)

	iconImage.url = icon
end

function MobileVehicleInterationCtrl:refreshButtons()
	local isController = self:isVehicleController()

	self.mainButtonIsJump = isController

	if not isController then
		self:releaseJump()
	end

	local vehicle = pg.getEntity(self.info.vehicleId)

	if not vehicle then
		self.view.mainButton:SetActiveFastest(false)
		self.view.closeButton:SetActiveFastest(false)

		return
	end

	local config = vehicle:getVehicleConfig()
	local canLeaveSeat = config.canLeaveSeat == 1

	if isController then
		local jumpText = pg.getLocalizationText(pg.getGameString("VEHICLE_JUMP"))

		self:setButtonContent(self.view.mainButton, jumpText, "$UI_SkillIcon_VehicleJumping.png")
	else
		self:setButtonContent(self.view.mainButton, pg.getGameString("VEHICLE_EXIT"), "$UI_SkillIcon_CloseBig.png")
	end

	self.view.mainButton:SetActiveFastest(isController or canLeaveSeat, true)
	self.view.closeButton:SetActiveFastest(isController and canLeaveSeat, true)
end

function MobileVehicleInterationCtrl:isVehicleController()
	local vehicle = pg.getEntity(self.info.vehicleId)
	local pawn = pg.pawn

	return vehicle ~= nil and pawn ~= nil and vehicle:isActiveVehicleRideDriver(pawn.actorId) and not vehicle:isVehicleRideExitPending(pawn.actorId)
end

function MobileVehicleInterationCtrl:onVehicleRideAuthorityChanged(vehicleId)
	if self.info.vehicleId == vehicleId then
		self:refreshButtons()
	end
end

function MobileVehicleInterationCtrl:releaseJump()
	if not self.jumpPressed then
		return
	end

	self.jumpPressed = false

	pg.game.controller:onHandleJump(false)
end

function MobileVehicleInterationCtrl:onHide()
	self:releaseJump()
	UICtrl.onHide(self)
end

function MobileVehicleInterationCtrl:onDestroy()
	self:releaseJump()

	self.info = nil

	UICtrl.onDestroy(self)
	facade:sendMsgToUI(MessageName.VEHICLE_SHOW_STATE_CHANGED, {
		showVehicleInter = false
	})
end

return MobileVehicleInterationCtrl
