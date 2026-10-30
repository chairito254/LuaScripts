-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\VehicleEntities\\ClientBubble.lua

local class = require("Core.Framework.Class")
local ClientVehicle = require("Entities.SpaceEntities.VehicleEntities.ClientVehicle")
local InteractionConst = require("Common.Const.InteractionConst")
local MessageName = require("Const.MessageName")
local Utils = require("Common.Utils.Utils")
local EffectConst = require("Const.EffectConst")
local ClientBubble = class.Class("ClientBubble", ClientVehicle)
local Time = require("Core.Common.Time")
local ClientConst = require("Const.ClientConst")
local CallbackHandler = require("Core.Common.CallbackHandler")
local ConflictTypes = require("Common.ConflictTypes")
local Const = require("Common.Const.Const")
local RouteController = require("GameApp.Controller.RouteController")
local DandelionController = require("GameApp.Controller.DandelionController")
local VehicleInteractUtils = require("Entities.SpaceEntities.VehicleEntities.VehicleInteractUtils")
local VehicleUtils = require("Common.Utils.VehicleUtils")
local vehicle_seat_data = require("Data.vehicle_seat_data")
local Components = {}

class.AddComponents(ClientBubble, Components)

local PUPPET_SEAT_FILTER_BIT = {
	BOSS = 16,
	ELITE = 8,
	NPC = 4,
	WILD_MONSTER = 2,
	HOME_PET = 1
}

function ClientBubble:ctor(entityId)
	ClientBubble.super.ctor(self, entityId)
end

function ClientBubble:init(bdict)
	ClientBubble.super.init(self, bdict)

	local vehicleData = self:getVehicleConfig()
	local playInteractIds = VehicleInteractUtils.toInteractIdList(vehicleData.playInteractId)

	self.playInteractData = {
		actionPrototypeId = playInteractIds[1],
		overrideType = InteractionConst.INTERACTION_TYPE_QUICK_PHOTO,
		globalId = self:getGlobalId(),
		interactFunc = function()
			self:doSkill1()
		end
	}

	return true
end

function ClientBubble:onDoSkill1()
	self:clientDestroy()
end

function ClientBubble:onPrefabModelLoaded()
	ClientBubble.super.onPrefabModelLoaded(self)

	return true
end

function ClientBubble:onEntityMount(entity, seatId)
	ClientBubble.super.onEntityMount(self, entity, seatId)
end

function ClientBubble:onEnterControl()
	ClientBubble.super.onEnterControl(self)
	facade:SendMessageCommand(MessageName.ENTER_TRIGGER, self.playInteractData)
	pg.global.ui.tips:refreshHotKeyHint(true)
end

function ClientBubble:onExitControl()
	facade:SendMessageCommand(MessageName.LEAVE_TRIGGER, self.playInteractData)
	pg.global.ui.tips:refreshHotKeyHint(true)
	ClientBubble.super.onExitControl(self)
end

function ClientBubble:getControllerData()
	local data = ClientBubble.super.getControllerData(self)
	local config = self:getVehicleConfig()

	data.duration = config.duration
	data.rideDuration = config.rideDuration
	data.warningDuration = config.warningDuration

	return data
end

function ClientBubble:isConfigKinematic()
	return false
end

function ClientBubble:getActorController(player)
	return DandelionController.new(player, self)
end

local BUBBLE_REJECT_TIP_KEY = {
	BOSS = "BUBBLE_CANNOT_WRAP_BOSS",
	ELITE = "BUBBLE_CANNOT_WRAP_ELITE"
}

function ClientBubble:tryRejectUnsupportedPuppet(ent)
	local tipKey

	if Utils.isBoss(ent) then
		tipKey = BUBBLE_REJECT_TIP_KEY.BOSS
	elseif Utils.isElite(ent) then
		tipKey = BUBBLE_REJECT_TIP_KEY.ELITE
	else
		return false
	end

	local seatIds = self:getVehicleConfig().seats

	for index = 1, #seatIds do
		local seatData = vehicle_seat_data[seatIds[index]]

		if VehicleUtils.isSeatActorAllowed(ent, seatData) then
			return false
		end
	end

	pg.global.ui.tips:showTextTip(pg.getGameString(tipKey))
	self:clientDestroy()

	return true
end

function ClientBubble:onTriggerEnter(userData, entId)
	ClientBubble.super.onTriggerEnter(self, userData)

	local ent = pg.getEntity(entId)

	if ent == self then
		return
	end

	if self:tryRejectUnsupportedPuppet(ent) then
		return
	end

	self:tryMount(ent)
end

function ClientBubble:onTriggerBreak(entId)
	return
end

function ClientBubble:clientDestroy()
	self:serverMsg("RPC_CS_RequestDestroy")
end

function ClientBubble:destroy()
	facade:SendMessageCommand(MessageName.LEAVE_TRIGGER, self.playInteractData)
	pg.global.ui.tips:refreshHotKeyHint(true)
	ClientBubble.super.destroy(self)
end

return ClientBubble
