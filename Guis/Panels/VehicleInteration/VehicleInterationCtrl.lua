-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\VehicleInteration\\VehicleInterationCtrl.lua

local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local MessageName = require("Const.MessageName")
local VehicleInterationCtrl = Class.LightClass("VehicleInterationCtrl", UICtrl)
local KeyBindingPro = CS.FunPlus.WorldX.GUIS.Panels.Utils.KeyBindingPro
local HotkeyConst = require("Const.HotkeyConst")
local UIConst = require("Const.UIConst")
local LuaUIUtils = require("Utils.LuaUIUtils")
local TimeUtils = require("Common.Utils.TimeUtils")
local Time = require("Core.Common.Time")
local ClientTextUtils = require("Utils.ClientTextUtils")
local SPECIAL_VEHICLE_RIDE_JUMP_ACTION = "special_vehicle_ride_jump"

VehicleInterationCtrl.messages = {
	[MessageName.INPUT_DEVICE_CHANGED] = {
		"onInputDeviceChanged",
		true
	},
	[MessageName.ON_CEHICLE_SEAT_MAP_CHANGED] = {
		"onUpdateInterationShow",
		true
	},
	[MessageName.VEHICLE_RIDE_AUTHORITY_CHANGED] = {
		"onVehicleRideAuthorityChanged",
		true
	}
}

local KEY_BOARD_MAP = {
	"Hud/VehicleSkillQ",
	"Hud/VehicleSkillE",
	"Hud/VehicleSkillR"
}

function VehicleInterationCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.info = info
	self.campAddOnCounting = false

	facade:sendMsgToUI(MessageName.VEHICLE_SHOW_STATE_CHANGED, {
		showVehicleInter = true
	})
	self:showPictures()
	self:setExitBtnInfo()

	self.updateTimer = pg.pawn.rideEndTime or 0
	self.vehicleDestroyTime = pg.pawn.vehicleDestroyTime or -1

	self:setVehicleCountTimeInfo()
end

function VehicleInterationCtrl:onShow()
	return
end

function VehicleInterationCtrl:onDestroy()
	self:clearUpdateTimer()

	self.campAddOnCounting = false

	UICtrl.onDestroy(self)
	facade:sendMsgToUI(MessageName.VEHICLE_SHOW_STATE_CHANGED, {
		showVehicleInter = false
	})
end

function VehicleInterationCtrl:addListener()
	function self.view.seatListUList.luaRenderItem(button, index, data)
		self:renderSeatItem(button, index, data)
	end

	function self.view.interListUList.luaRenderItem(button, index, data)
		self:renderInterationIndexItem(button, index, data)
	end

	local closeBind = KeyBindingPro.GetOrAddKeyBindingByName(self.view.btnExitObjectReference.gameObject, "closeBind")
	local btnExit = self.view.btnExitObjectReference:GetComponent("UButton")
	local btnIocn = self.view.btnExitObjectReference:GetRefValue("iconUImage")

	btnIocn.url = "$UI_Icon_VehicleAction_Exit.png"
	closeBind.isVirtual = false
	closeBind.priority = 10
	closeBind.actionPath = "Hud/VehicleSkillT"

	function closeBind.luaTrigger(inputInfo)
		if not self:canActiveDismount() then
			return
		end

		btnExit:luaClick()
	end

	local keyHotKeyContent = self.view.btnExitObjectReference:GetRefValue("keyHotKeyContent")

	keyHotKeyContent:SetHotKeyPaths("Hud/VehicleSkillT")
end

function VehicleInterationCtrl:onUpdateInterationShow()
	if self.info then
		self:showPictures()
		self:setExitBtnInfo()

		if not self.campAddOnCounting then
			self.updateTimer = pg.pawn.rideEndTime or 0
			self.vehicleDestroyTime = pg.pawn.vehicleDestroyTime or -1

			self:setVehicleCountTimeInfo()
		end
	end
end

function VehicleInterationCtrl:showPictures()
	local isManagerSeat = self.model:getVehicleSeatManage(self.info.vehicleId)
	local list = self.model:getVehicleSeatList(self.info.vehicleId)

	LuaUIUtils.setUIVisible(self.view.seatListUList, isManagerSeat)
	LuaUIUtils.setUIVisible(self.view.bg, isManagerSeat)
	LuaUIUtils.setUIVisible(self.view.detailUWidget, isManagerSeat)

	if isManagerSeat then
		self.curGamepadSeatIndex = 0

		self.view.seatListUList:SetList(list)

		if pg.game.input:isUsingGamepad() then
			local ret, seatFirst = self.view.seatListUList:TryGetChildAt(0)

			if ret then
				seatFirst.luaClick()
			end
		end

		self:bindHotKeyPerform(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadLeftTrigger, function()
			self.curGamepadSeatIndex = self.curGamepadSeatIndex - 1 >= 0 and self.curGamepadSeatIndex - 1 or 0

			local ret, seat = self.view.seatListUList:TryGetChildAt(self.curGamepadSeatIndex)

			if ret then
				seat.luaClick()
			end
		end)
		self:bindHotKeyPerform(HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadRightTrigger, function()
			self.curGamepadSeatIndex = self.curGamepadSeatIndex + 1 < #list and self.curGamepadSeatIndex + 1 or #list - 1

			local ret, seat = self.view.seatListUList:TryGetChildAt(self.curGamepadSeatIndex)

			if ret then
				seat.luaClick()
			end
		end)
	end

	local seatState = self.model:getSeatOwnState(pg.pawn.seatId)

	if self.model.SEAT_ENTITY_TYPE.PET == seatState or self.model.SEAT_ENTITY_TYPE.PLAYER == seatState then
		local interactionList = self.model:getVehicleSeatInterationList(pg.pawn.seatId)

		if self:isVehicleRideDriver() then
			interactionList[#interactionList + 1] = {
				icon = "$UI_SkillIcon_VehicleJumping.png",
				actionType = SPECIAL_VEHICLE_RIDE_JUMP_ACTION,
				name = pg.getGameString("VEHICLE_JUMP")
			}
		end

		self.view.interListUList:SetList(interactionList)
	end
end

function VehicleInterationCtrl:isSpecialVehicleRide()
	local vehicle = pg.getEntity(self.info.vehicleId)

	if not vehicle then
		return false
	end

	return vehicle:getVehicleConfig().specialVehicleRide == true
end

function VehicleInterationCtrl:isVehicleRideDriver()
	local vehicle = pg.getEntity(self.info.vehicleId)
	local pawn = pg.pawn

	return vehicle ~= nil and pawn ~= nil and vehicle:getVehicleConfig().specialVehicleRide == true and vehicle:isActiveVehicleRideDriver(pawn.actorId) and not vehicle:isVehicleRideExitPending(pawn.actorId)
end

function VehicleInterationCtrl:onVehicleRideAuthorityChanged(vehicleId)
	if self.info.vehicleId == vehicleId then
		self:onUpdateInterationShow()
	end
end

function VehicleInterationCtrl:renderSeatItem(button, index, data)
	local objectReference = button:GetComponent("ObjectReference")
	local btnListUList = objectReference:GetRefValue("btnListUList")
	local seatState = self.model:getSeatOwnState(data.seatId)

	self:setSeatInfo(button, data, seatState)
	button:TryChangePage("Menu", 0)

	function button.luaClick()
		local seatState1 = self.model:getSeatOwnState(data.seatId)

		if self.model.SEAT_ENTITY_TYPE.EMPTY == seatState1 or self.model.SEAT_ENTITY_TYPE.PLAYER == seatState1 or self.model.SEAT_ENTITY_TYPE.PET == seatState1 then
			self.selectedIndex = data.seatId

			self:onSelectedSeatChanged(button, index, seatState1)

			function btnListUList.luaRenderItem(button1, index1, data1)
				self:renderSelectItem(button1, index1, data1)
			end

			if data.seatManage == 1 then
				local menuList = self.model:getSeatSelBtnList(data.seatId, data.steatIndex)

				button:TryChangePage("Menu", #menuList > 0 and 1 or 0)
				btnListUList:SetList(menuList)
			end
		end
	end
end

function VehicleInterationCtrl:renderInterationIndexItem(button, index, data)
	if data == nil then
		return
	end

	local objectReference = button.transform:GetComponent("ObjectReference")
	local txtNameUText = objectReference:GetRefValue("txtNameUText")
	local iconUImage = objectReference:GetRefValue("iconUImage")
	local btnNormalKeyBindingPro = objectReference:GetRefValue("btnNormalKeyBindingPro")

	ClientTextUtils.setText(txtNameUText, pg.getLocalizationText(data.name or ""))

	iconUImage.forceSyncLoad = true
	iconUImage.url = data.icon or ""

	function button.luaPress()
		self:onSkillClick(data, index)
	end

	function button.luaRelease()
		if data.actionType == SPECIAL_VEHICLE_RIDE_JUMP_ACTION then
			pg.game.controller:onHandleJump(false)
		end
	end

	local isSpecialRideJump = data.actionType == SPECIAL_VEHICLE_RIDE_JUMP_ACTION
	local skillBind = KeyBindingPro.GetOrAddKeyBindingByName(button.gameObject, "vehicleInteractionSkill")
	local keyHotKeyContent = objectReference:GetRefValue("keyHotKeyContent")

	if isSpecialRideJump then
		skillBind.isVirtual = false
		skillBind.priority = 10
		skillBind.actionPath = HotkeyConst.INPUT_MAP_ACTION_KEY.Player_Jump
		skillBind.luaTrigger = nil

		keyHotKeyContent:SetHotKeyPaths(HotkeyConst.INPUT_MAP_ACTION_KEY.Player_Jump)
	else
		local actionPath = KEY_BOARD_MAP[index + 1]

		skillBind.isVirtual = false
		skillBind.priority = 10
		skillBind.actionPath = actionPath

		function skillBind.luaTrigger(inputInfo)
			if inputInfo.phase == "Performed" then
				button:OnClickSimulate()

				return true
			end
		end

		keyHotKeyContent:SetHotKeyPaths(actionPath)
	end
end

function VehicleInterationCtrl:onSkillClick(data, index)
	if data == nil then
		return
	end

	if data.actionType == SPECIAL_VEHICLE_RIDE_JUMP_ACTION then
		if self:isVehicleRideDriver() then
			pg.game.controller:onHandleJump(true)
		end

		return
	end

	if data.skillId == 1 or data.skillId == 2 or data.skillId == 4 then
		local curVehicle = pg.getEntity(self.info.vehicleId)

		if curVehicle then
			if index == 0 then
				curVehicle:doSkill1()
			elseif index == 2 then
				curVehicle:doSkill2()
			elseif data.vehicleSkill and data.vehicleSkill > 0 then
				pg.me:doEvent(data.vehicleSkill)
			end
		end
	elseif data.vehicleSkill and data.vehicleSkill > 0 then
		pg.me:doEvent(data.vehicleSkill)
	end
end

function VehicleInterationCtrl:setVehicleCountTimeInfo()
	if self.campAddOnCounting then
		return
	end

	local duration, rideDuration, isHide = self.model:getVehicleDurationTime(self.info.vehicleId)

	LuaUIUtils.setUIVisible(self.view.panelTimeRectTransform, false)

	if isHide then
		return
	end

	local vehicleTime = pg.pawn.vehicleDestroyTime
	local time = pg.pawn.rideEndTime or 0

	if time <= 0 then
		time = vehicleTime
	end

	local countDown = time - Time.secondCache

	self.updateTimer = self:startTimer(function()
		if countDown > 0 then
			countDown = time - Time.secondCache

			ClientTextUtils.setText(self.view.numUBaseText, TimeUtils.timeToFormatStringMMSS(countDown))
			LuaUIUtils.setUIVisible(self.view.panelTimeRectTransform, duration > 0 or rideDuration > 0)
		else
			LuaUIUtils.setUIVisible(self.view.panelTimeRectTransform, false)
			self:clearUpdateTimer()
		end
	end, 0.3, true)
end

function VehicleInterationCtrl:setCampAddOnCountTimeInfo(count, total)
	if not self.view or not self.view.numUBaseText or not self.view.panelTimeRectTransform then
		return
	end

	self.campAddOnCounting = true

	self:clearUpdateTimer()

	local remain = math.max((total or 0) - (count or 0), 0)

	ClientTextUtils.setText(self.view.numUBaseText, TimeUtils.timeToFormatStringMMSS(remain))
	LuaUIUtils.setUIVisible(self.view.panelTimeRectTransform, true)
end

function VehicleInterationCtrl:clearCampAddOnCountTimeInfo()
	if not self.campAddOnCounting then
		return
	end

	self.campAddOnCounting = false

	if not self.view or not self.view.panelTimeRectTransform then
		return
	end

	LuaUIUtils.setUIVisible(self.view.panelTimeRectTransform, false)
	self:setVehicleCountTimeInfo()
end

function VehicleInterationCtrl:renderSelectItem(button, index, data)
	local objectReference = button.transform:GetComponent("ObjectReference")
	local txtNameUText = objectReference:GetRefValue("txtNameUText")

	ClientTextUtils.setText(txtNameUText, pg.getLocalizationText(data.name))
	button:TryChangePage("select", 0)

	function button.luaClick()
		local vehicleId = pg.pawn.onVehicleActorId
		local seatId = pg.pawn.seatId

		if self.model.SEAT_ACT_TYPE.ENTER == data.seat then
			local curVehicle = pg.getEntityByActorId(vehicleId)

			if curVehicle then
				local _, seatiIndex = self.model:setActorIdBySeatId(curVehicle, seatId)

				pg.me:exchangeSeatVehicle(pg.pawn.onVehicleActorId, seatiIndex or data.steatIndex - 1, data.steatIndex)
			end
		elseif self.model.SEAT_ACT_TYPE.EXCHANGE == data.seat then
			if pg.me:getCurPetEntity() and data.seatId == pg.me:getCurPetEntity().seatId then
				local curVehicle = pg.getEntityByActorId(vehicleId)

				if curVehicle then
					local _, seatiIndex = self.model:setActorIdBySeatId(curVehicle, seatId)

					pg.me:exchangeSeatVehicle(pg.pawn.onVehicleActorId, seatiIndex or data.steatIndex - 1, data.steatIndex)
				end
			end
		elseif self.model.SEAT_ACT_TYPE.TICK == data.seat then
			if pg.me:getCurPetEntity() and data.seatId == pg.me:getCurPetEntity().seatId then
				pg.me:getCurPetEntity():RPC_CS_DismountVehicleSeat(pg.me:getCurPetEntity().onVehicleActorId)
			end
		elseif self.model.SEAT_ACT_TYPE.EXIT == data.seat and self:canActiveDismount() then
			pg.pawn:dismountSelf()
		end

		button:TryChangePage("select", 1)
	end

	local keyHotKeyContent = objectReference:GetRefValue("keyHotKeyContent")
	local gamepadActionPath = index == 1 and HotkeyConst.INPUT_MAP_ACTION_KEY.GamepadButtonWest or "Hud/Interact"

	keyHotKeyContent:SetHotKeyPaths(gamepadActionPath)
	self:bindHotKeyPerform(gamepadActionPath, button.luaClick, button.gameObject)
end

function VehicleInterationCtrl:setSeatInfo(button, data, seatState)
	local seatType = self.model:getSeatTypeBySeatId(data.seatId)

	if self.model.SEAT_ENTITY_TYPE.OTHER == seatState or self.model.SEAT_ENTITY_TYPE.OTHER_PET == seatState then
		button:TryChangePage("SeatState", 2)

		if self.model.SEAT_ENTITY_TYPE.OTHER == seatState then
			button:TryChangePage("SeatType", 1)
		elseif self.model.SEAT_ENTITY_TYPE.OTHER_PET == seatState then
			button:TryChangePage("SeatType", 2)
		end
	elseif self.model.SEAT_ENTITY_TYPE.EMPTY == seatState then
		button:TryChangePage("SeatState", 0)

		if self.model.SEAT_TYPE.All == seatType then
			button:TryChangePage("SeatType", 0)
		elseif self.model.SEAT_TYPE.PLAYER == seatType then
			button:TryChangePage("SeatType", 1)
		elseif self.model.SEAT_TYPE.PET == seatType then
			button:TryChangePage("SeatType", 2)
		end
	elseif self.model.SEAT_ENTITY_TYPE.PLAYER == seatState or self.model.SEAT_ENTITY_TYPE.PET == seatState then
		button:TryChangePage("SeatState", 1)

		if self.model.SEAT_ENTITY_TYPE.PLAYER == seatState then
			button:TryChangePage("SeatType", 1)
		elseif self.model.SEAT_ENTITY_TYPE.PET == seatState then
			button:TryChangePage("SeatType", 2)
		end
	end
end

function VehicleInterationCtrl:onSelectedSeatChanged(button, index, seatState)
	local btns = self.view.seatListUList:GetAllButtons()

	for i = 0, btns.Length - 1 do
		if self.model.SEAT_ENTITY_TYPE.OTHER == seatState or self.model.SEAT_ENTITY_TYPE.OTHER_PET == seatState then
			-- block empty
		else
			btns[i]:TryChangePage("Menu", 0)

			local objectReference = btns[i]:GetComponent("ObjectReference")
			local iconUpUImage = objectReference:GetRefValue("iconUpUImage")

			if iconUpUImage then
				LuaUIUtils.setUIVisible(iconUpUImage, btns[i].dataFromUList.seatId == self.selectedIndex)
			end
		end
	end
end

function VehicleInterationCtrl:canActiveDismount()
	local pawn = pg.pawn

	return pawn == nil or pawn.canActiveDismountVehicle == nil or pawn:canActiveDismountVehicle()
end

function VehicleInterationCtrl:setExitBtnInfo()
	local btnExitObjectReference = self.view.btnExitObjectReference
	local btnExitUButton = btnExitObjectReference:GetComponent("UButton")
	local btnName = btnExitObjectReference:GetRefValue("txtNameUText")
	local canLeaveSeat = self.model:getVehicleCanLeaveSeat(self.info.vehicleId)

	LuaUIUtils.setUIVisible(self.view.btnExitObjectReference, canLeaveSeat)
	ClientTextUtils.setText(btnName, pg.getGameString("VEHICLE_EXIT"))

	function btnExitUButton.luaClick()
		if self:canActiveDismount() then
			pg.pawn:dismountSelf()
		end
	end
end

function VehicleInterationCtrl:setInterationBtnInfo(button, data)
	return
end

function VehicleInterationCtrl:onClose()
	pg.global.ui:close(UIConst.UI_ID_VEHICLE_INTERATION_PANEL)
end

function VehicleInterationCtrl:clearUpdateTimer()
	if self.updateTimer then
		self:killTimer(self.updateTimer)

		self.updateTimer = nil
	end
end

function VehicleInterationCtrl:onInputDeviceChanged(deviceType)
	return
end

return VehicleInterationCtrl
