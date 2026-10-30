-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\VehicleEntities\\ClientBalloon.lua

local class = require("Core.Framework.Class")
local ClientBubble = require("Entities.SpaceEntities.VehicleEntities.ClientBubble")
local Utils = require("Common.Utils.Utils")
local ClientBalloon = class.Class("ClientBalloon", ClientBubble)
local AudioConst = require("Const.AudioConst")
local Const = require("Common.Const.Const")
local ConflictTypes = require("Common.ConflictTypes")
local NoticeDef = require("Common.NoticeDef")
local TimerManager = require("Core.Timer.TimerManager")
local PetPrototypeData = require("Data.pet_prototype_data")
local VehicleSeatData = require("Data.vehicle_seat_data")
local Components = {}

class.AddComponents(ClientBalloon, Components)

function ClientBalloon:ctor(entityId)
	ClientBalloon.super.ctor(self, entityId)
end

function ClientBalloon:tryMount(ent)
	if not ent or self.balloonSwitchRequest or self.balloonDestroyRequested then
		return
	end

	ClientBalloon.super.tryMount(self, ent)
end

function ClientBalloon:tryMountInControl(petEnt)
	local seatIndex = self:getClosestSeat(petEnt)
	local seatId = self:getVehicleConfig().seats[seatIndex]
	local seatData = seatId and VehicleSeatData[seatId]
	local petData = PetPrototypeData[petEnt.petInfo.petPrototypeId] or {}

	if not seatData or not seatData.petInControl or not seatData.forbidBigBodyLevel or (petData.cameraDistModeId or 1) < seatData.forbidBigBodyLevel then
		return ClientBalloon.super.tryMountInControl(self, petEnt)
	end

	local player = petEnt:getMasterEntity()

	if bit.band(2^Const.ACTOR_TYPE_PLAYER, seatData.actorFilter or 0) == 0 then
		self:breakForSwitchFailure()

		return
	end

	local request = {
		player = player,
		pet = petEnt
	}

	self.balloonSwitchRequest = request
	request.timer = TimerManager.addTimer(5, function()
		request.timer = nil

		if self.balloonSwitchRequest == request then
			self:finishBalloonSwitch(request)
		end
	end)

	local accepted = player:requestSwitchToPlayer(Const.CLIENT_SWITCH_REASON.Vehicle, {
		[ConflictTypes.FALL_ST] = true
	}, function()
		self:finishBalloonSwitch(request)
	end)

	if not accepted and self.balloonSwitchRequest == request then
		self:clearBalloonSwitchRequest()
		self:breakForSwitchFailure()
	end
end

function ClientBalloon:clearBalloonSwitchRequest()
	local request = self.balloonSwitchRequest

	self.balloonSwitchRequest = nil

	if request and request.timer then
		TimerManager.removeTimer(request.timer)

		request.timer = nil
	end
end

function ClientBalloon:finishBalloonSwitch(request)
	if self.balloonSwitchRequest ~= request then
		return
	end

	self:clearBalloonSwitchRequest()

	local player = request.player

	if self.isDestroyed or not self.eModel or self.balloonDestroyRequested or player.isDestroyed or player ~= pg.me then
		return
	end

	if player:isControllingPet() then
		if self.entityCount == 0 and player:getCurPetEntity() == request.pet then
			self:breakForSwitchFailure()
		end

		return
	end

	pg.global.showBubbleMessage(NoticeDef.BALLOON_PET_BODY_TOO_BIG)

	if self.entityCount ~= 0 or self:getClosestSeat(player) == 0 then
		return
	end

	self:tryMount(player)
end

function ClientBalloon:breakForSwitchFailure()
	if self.isDestroyed or not self.eModel or self.balloonDestroyRequested then
		return
	end

	self:clientDestroy()
	pg.global.showBubbleMessage(NoticeDef.BALLOON_PET_BODY_TOO_BIG)
end

function ClientBalloon:clientDestroy(reason)
	if self.balloonDestroyRequested then
		return
	end

	self.balloonDestroyRequested = true

	self:clearBalloonSwitchRequest()
	ClientBalloon.super.clientDestroy(self, reason)
end

function ClientBalloon:destroy()
	self:clearBalloonSwitchRequest()
	ClientBalloon.super.destroy(self)
end

function ClientBalloon:onEntityDismount(entity, seatId)
	self:clientDestroy()
	ClientBalloon.super.onEntityDismount(self, entity, seatId)
end

function ClientBalloon:onTriggerEnter(userData, entId, collisionProtected)
	local ent = pg.getEntity(entId)

	if ent == self then
		return
	end

	if self.entityCount == 0 and ent and (Utils.isChest(ent) or Utils.isEnvObj(ent)) and ent.getIsKinematic and ent:getIsKinematic() then
		if not collisionProtected then
			self:clientDestroy()
		end

		return
	end

	ClientBalloon.super.onTriggerEnter(self, userData, entId)
end

function ClientBalloon:onEnterControl()
	ClientBalloon.super.onEnterControl(self)
	pg.game.audio:playEvent("SFX_InsideBubble_Loop")
	pg.game.audio:trySetState(AudioConst.WATER_IN_OUT, AudioConst.WATER_IN_OUT_Inside)
end

function ClientBalloon:onExitControl()
	pg.game.audio:stopEvent("SFX_InsideBubble_Loop")
	pg.game.audio:trySetState(AudioConst.WATER_IN_OUT, AudioConst.WATER_IN_OUT_Outside)
	ClientBalloon.super.onExitControl(self)
end

return ClientBalloon
