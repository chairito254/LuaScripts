-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientVehicleOpComponent.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local GlobalData = require("Core.Client.GlobalData")
local class = require("Core.Framework.Class")
local vehicle_seat_data = require("Data.vehicle_seat_data")
local vehicle_seat_attach_data = require("Data.vehicle_seat_attach_data")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local VehicleUtils = require("Common.Utils.VehicleUtils")
local SceneUtils = require("Common.Utils.SceneUtils")
local AiConst = require("Common.Const.AiConst")
local ClientConst = require("Const.ClientConst")
local NoticeDef = require("Common.NoticeDef")
local SceneData = require("Data.scene_data")
local MessageName = require("Const.MessageName")
local EventConst = require("Const.EventConst")
local UIConst = require("Const.UIConst")
local CallbackHandler = require("Core.Common.CallbackHandler")
local EntityManager = require("Core.Common.EntityManager")
local Time = require("Core.Common.Time")
local RIDE_NOTICE_KEYS = {
	invite_pending = "VEHICLE_RIDE_INVITE_PENDING",
	invite_accepted = "VEHICLE_RIDE_INVITE_ACCEPTED",
	unavailable = "VEHICLE_RIDE_UNAVAILABLE",
	invite_rejected = "VEHICLE_RIDE_INVITE_REJECTED",
	full = "VEHICLE_RIDE_FULL",
	invite_expired = "VEHICLE_RIDE_INVITE_EXPIRED",
	cancelled = "VEHICLE_RIDE_CANCELLED",
	invite_cancelled = "VEHICLE_RIDE_INVITE_CANCELLED",
	expired = "VEHICLE_RIDE_EXPIRED",
	invite_boarded = "VEHICLE_RIDE_INVITE_BOARDED",
	rejected = "VEHICLE_RIDE_REJECTED",
	accepted = "VEHICLE_RIDE_ACCEPTED",
	pending = "VEHICLE_RIDE_PENDING"
}
local VEHICLE_MOUNT_REQUEST_TIMEOUT = 5
local RIDE_REQUEST_INVITE = 1
local ClientVehicleOpComponent = class.Component("ClientVehicleOpComponent")

function ClientVehicleOpComponent:ctor()
	self.onVehicleActorId = 0
	self.seatId = 0
	self.rideEndTime = 0
	self.vehicleDestroyTime = 0
	self.mountRequest = nil
	self.vehicleBodyMountSessionId = 0
	self.isIndependentPetVehiclePassenger = false
	self.vehicleRideRequestSerial = 0
	self.pendingVehicleRideRequestId = 0
	self.vehicleRideRestoring = false
	self._onVehicleEnterSpace = nil
end

function ClientVehicleOpComponent:init(dict)
	self.onVehicleActorId = dict.onVehicleActorId
	self.seatId = dict.seatId
	self.rideEndTime = dict.rideEndTime
	self.vehicleDestroyTime = dict.vehicleDestroyTime
	self.vehicleBodyMountSessionId = dict.vehicleBodyMountSessionId or 0
	self.vehicleRideRestoring = self.onVehicleActorId ~= 0

	return true
end

function ClientVehicleOpComponent:checkVehicleBodyAnimationAllowsMount(vehicleId)
	local vehicle = pg.getEntityByActorId(vehicleId)

	if vehicle and vehicle.canMountByBodyAnimation then
		return vehicle:canMountByBodyAnimation()
	end

	return true
end

function ClientVehicleOpComponent:EVENT_PostInitialized()
	self.postInitialized = true

	self:refreshVehicle()
	self:refreshVehicleRideTipTopLogo()
end

function ClientVehicleOpComponent:clearVehicleRestoreListener()
	if self._onVehicleEnterSpace == nil then
		return
	end

	EntityManager.eventEmitter:removeEventListener(EventConst.ENTITY_ENTER_SPACE, self._onVehicleEnterSpace)

	self._onVehicleEnterSpace = nil

	EntityManager.eventEmitter:removeEventListener(EventConst.ENTITY_LEAVE_SPACE, self._onVehicleLeaveSpace)

	self._onVehicleLeaveSpace = nil
end

function ClientVehicleOpComponent:waitVehicleEntityRestore()
	if self._onVehicleEnterSpace ~= nil then
		return
	end

	self._onVehicleEnterSpace = CallbackHandler(self, "onVehicleEnterSpace")

	EntityManager.eventEmitter:addEventListener(EventConst.ENTITY_ENTER_SPACE, self._onVehicleEnterSpace)

	self._onVehicleLeaveSpace = CallbackHandler(self, "onVehicleLeaveSpace")

	EntityManager.eventEmitter:addEventListener(EventConst.ENTITY_LEAVE_SPACE, self._onVehicleLeaveSpace)
end

function ClientVehicleOpComponent:onVehicleEnterSpace(entity)
	if entity.actorId ~= self.onVehicleActorId then
		return
	end

	self:clearVehicleRestoreListener()
	self:refreshVehicle()
end

function ClientVehicleOpComponent:onVehicleLeaveSpace(entity)
	if entity.actorId ~= self.onVehicleActorId then
		return
	end

	self:clearVehicleRestoreListener()
	self:clearLocalVehicleRideState()
end

function ClientVehicleOpComponent:clearLocalVehicleRideState()
	if self.curVehicle then
		self:onDismount()
	elseif self.authority == Const.AUTHORITY_MASTER and not Utils.isHomePet(self) and not self.isIndependentPetVehiclePassenger then
		pg.me:unregisterInRiding(self)

		self.curSeatId = 0
		self.isIndependentPetVehiclePassenger = false

		self:refreshMountVisible()
	end

	self.onVehicleActorId = 0
	self.seatId = 0
	self.rideEndTime = 0
	self.vehicleDestroyTime = 0
	self.pendingVehicleRideRequestId = 0
	self.vehicleRideRestoring = false

	self:clearVehicleRestoreListener()
	self:updateState()
end

function ClientVehicleOpComponent:beginVehicleMountRequest(vehicleId)
	if self.mountRequest then
		return
	end

	if not self:checkVehicleBodyAnimationAllowsMount(vehicleId) then
		return
	end

	self.vehicleRideRequestSerial = self.vehicleRideRequestSerial + 1

	local request = {
		id = self.vehicleRideRequestSerial,
		vehicleId = vehicleId
	}

	self.mountRequest = request
	request.timerId = self:addTimer(VEHICLE_MOUNT_REQUEST_TIMEOUT, function()
		if self.mountRequest == request then
			request.timerId = nil

			self:clearVehicleMountRequest()
		end
	end)

	return request.id
end

function ClientVehicleOpComponent:mountVehicle(vehicleId, seatId)
	local requestId = self:beginVehicleMountRequest(vehicleId)

	if requestId then
		self:serverMsg("RPC_CS_MountVehicle", vehicleId, seatId, requestId)
	end
end

function ClientVehicleOpComponent:updateState()
	if self.updateStateCache then
		self:updateStateCache("SPECIAL_VEHICLE_RIDE_ST")
		self:updateStateCache("RIDING_ST")
	end
end

function ClientVehicleOpComponent:mainPlayerMountVehicle(vehicleId)
	local requestId = self:beginVehicleMountRequest(vehicleId)

	if requestId then
		self:serverMsg("RPC_CS_StartDriveVehicle", vehicleId, requestId)
	end
end

function ClientVehicleOpComponent:clearVehicleMountRequest()
	local request = self.mountRequest

	if not request then
		return
	end

	self.mountRequest = nil

	if request.timerId then
		self:removeTimer(request.timerId)
	end
end

function ClientVehicleOpComponent:finishVehicleMountRequest(requestId)
	local request = self.mountRequest

	if request and request.id == requestId then
		self:clearVehicleMountRequest()
	end
end

function ClientVehicleOpComponent:RPC_SC_MountVehicleResult(requestId, result)
	self:finishVehicleMountRequest(requestId)
end

function ClientVehicleOpComponent:canMountVehicle(vehicleId)
	local entity = pg.getEntityByActorId(vehicleId)

	if entity and entity.getClosestSeat then
		local seatId = entity:getClosestSeat(self)

		if seatId and seatId > 0 then
			return true
		end
	end

	return false
end

function ClientVehicleOpComponent:refreshMountVisible()
	local vehicleVisible = true

	if self.curVehicle and self.curVehicle.visible ~= nil then
		vehicleVisible = self.curVehicle.visible
	end

	self:setModelVisible(ClientConst.MODEL_VISIBLE_KEY.VEHICLE_PARENT, vehicleVisible)
end

function ClientVehicleOpComponent:RPC_SC_UpdateVehicleOp(vehicleInfo)
	self.vehicleRideRestoring = false
	self.onVehicleActorId = vehicleInfo.onVehicleActorId
	self.seatId = vehicleInfo.seatId
	self.rideEndTime = vehicleInfo.rideEndTime
	self.vehicleDestroyTime = vehicleInfo.vehicleDestroyTime
	self.vehicleBodyMountSessionId = vehicleInfo.vehicleBodyMountSessionId or 0

	self:updateState()
	self:refreshVehicle()
end

function ClientVehicleOpComponent:reportVehicleBodyAnimationPhase(vehicleActorId, sessionId, entered)
	if not self.isMainAuthority or self.isClientEnt or sessionId == 0 then
		return
	end

	self:serverMsg("RPC_CS_ReportVehicleBodyAnimationPhase", vehicleActorId, sessionId, entered)
end

function ClientVehicleOpComponent:isActiveSpecialVehicleRide()
	local vehicle = self.curVehicle

	return vehicle ~= nil and vehicle.isSpecialVehicleRide and vehicle:isSpecialVehicleRide() and vehicle:isActiveVehicleRideDriver(self.actorId) and not vehicle:isVehicleRideExitPending(self.actorId)
end

function ClientVehicleOpComponent:requestVehicleRideExit(event)
	local vehicle = self.curVehicle

	if not vehicle or not vehicle:isActiveVehicleRideDriver(self.actorId) then
		return
	end

	self.vehicleRideRequestSerial = self.vehicleRideRequestSerial + 1
	self.pendingVehicleRideRequestId = self.vehicleRideRequestSerial

	vehicle:requestVehicleRideExit(self, self.pendingVehicleRideRequestId, event)
end

function ClientVehicleOpComponent:reportVehicleRideMotionState(motionState)
	local vehicle = self.curVehicle

	if vehicle then
		vehicle:reportVehicleRideMotionState(self, motionState)
	end
end

function ClientVehicleOpComponent:isVehicleRideExitPending()
	local vehicle = self.curVehicle

	return vehicle ~= nil and vehicle:isVehicleRideExitPending(self.actorId)
end

function ClientVehicleOpComponent:isVehicleRideExitPendingForEvent(event)
	local vehicle = self.curVehicle

	return vehicle ~= nil and vehicle:isVehicleRideExitPendingForEvent(self.actorId, event)
end

function ClientVehicleOpComponent:RPC_SC_VehicleRideCommandResult(info)
	self:finishVehicleMountRequest(info.requestId)

	if info.requestId == self.pendingVehicleRideRequestId then
		self.pendingVehicleRideRequestId = 0
	end

	local vehicle = pg.getEntityByActorId(info.vehicleActorId)

	if vehicle and vehicle.onVehicleRideCommandResult then
		vehicle:onVehicleRideCommandResult(info)
	end

	facade:SendMessageCommand(MessageName.VEHICLE_RIDE_COMMAND_RESULT, info)
end

function ClientVehicleOpComponent:inviteRideVehicle(vehicleActorId, targetUid)
	local now = Time.secondCache

	if self.lastRideInviteTime and now - self.lastRideInviteTime < 1 then
		return
	end

	self.lastRideInviteTime = now

	self:serverMsg("RPC_CS_InviteRideVehicle", vehicleActorId, targetUid)
end

function ClientVehicleOpComponent:acceptRideVehicleInvite(vehicleActorId, ownerUid, accept, sessionId, inviteId)
	self:serverMsg("RPC_CS_AcceptRideVehicleInvite", vehicleActorId, ownerUid, accept, sessionId, inviteId)
end

function ClientVehicleOpComponent:applyRideVehicle(vehicleActorId)
	local now = Time.secondCache

	if self.lastRideApplyTime and now - self.lastRideApplyTime < 1 then
		return
	end

	self.lastRideApplyTime = now

	self:serverMsg("RPC_CS_ApplyRideVehicle", vehicleActorId)
end

function ClientVehicleOpComponent:approveRideVehicleApply(vehicleActorId, applicantUid, approve, sessionId, requestId)
	self:serverMsg("RPC_CS_ApproveRideVehicleApply", vehicleActorId, applicantUid, approve, sessionId, requestId)
end

function ClientVehicleOpComponent:setLocalVehicleRideTipInfo(info, forceSync)
	if not self.isMainPlayer or self.isDestroyed then
		return
	end

	local previous = self._localVehicleRideTipInfo
	local unchanged = previous and previous.vehicleActorId == info.vehicleActorId and previous.sessionId == info.sessionId and previous.requestId == info.requestId and previous.createdAt == info.createdAt and previous.expireAt == info.expireAt

	if unchanged and not forceSync then
		return
	end

	if not unchanged then
		self._localVehicleRideTipInfo = info

		self:refreshVehicleRideTipTopLogo()
	end

	self:serverMsg("RPC_CS_SetVehicleRideTip", info)
end

function ClientVehicleOpComponent:refreshVehicleRideTipTopLogo()
	if not self.postInitialized or self.isDestroyed or not Utils.isPlayer(self) then
		return
	end

	local target = self

	if self.isMainPlayer then
		target = pg.pawn or self
	elseif self:isControllingPet() then
		target = self:getCurPetEntity()
	end

	if not target then
		return
	end

	local info = self.isMainPlayer and self._localVehicleRideTipInfo or self.vehicleRideTipInfo
	local visible = info and info.expireAt and info.expireAt > Time.secondCache
	local component

	if visible then
		component = target:ensureToplogoComponent(UIConst.TOPLOGO_COMPONENT.SPACE_FOLLOW, "vehicle_ride_tip")
	else
		component = target:peekToplogoComponent(UIConst.TOPLOGO_COMPONENT.SPACE_FOLLOW)
	end

	if component then
		component:restoreStateFromEntity()
	end
end

function ClientVehicleOpComponent:on_vehicleRideTipInfo_changed(oldVal, newVal)
	if self.isMainPlayer and self._localVehicleRideTipInfo then
		return
	end

	self:refreshVehicleRideTipTopLogo()
end

function ClientVehicleOpComponent:RPC_SC_RideVehicleRequestCreated(info)
	if not self.isMainPlayer or info.expireAt <= Time.secondCache then
		return
	end

	local isInvite = info.kind == RIDE_REQUEST_INVITE
	local playerId = isInvite and info.ownerUid or info.passengerUid
	local playerInfo = pg.game.chat:getPlayerInfo(playerId) or {
		headIcon = 1,
		playerName = isInvite and info.ownerName or info.passengerName
	}
	local titleKey = isInvite and "VEHICLE_RIDE_INVITE_TITLE" or "VEHICLE_RIDE_APPLY_TITLE"

	pg.global.ui.tips:addHudNotice(playerId, playerInfo, pg.getGameString(titleKey), info.expireAt - info.createdAt, function()
		return self:submitVehicleRideRequest(info, true)
	end, function()
		return self:submitVehicleRideRequest(info, false)
	end, nil, {
		overrideYesText = "VEHICLE_RIDE_AGREE",
		isVehicleRide = true,
		tIndex = 0,
		expireAt = info.expireAt,
		createdAt = info.createdAt,
		rideRequest = info
	})
end

function ClientVehicleOpComponent:submitVehicleRideRequest(info, accept)
	if self.isDestroyed or info.expireAt <= Time.secondCache then
		return true
	end

	if info.submitted then
		return false
	end

	info.submitted = true

	if info.kind == RIDE_REQUEST_INVITE then
		self:acceptRideVehicleInvite(info.vehicleActorId, info.ownerUid, accept, info.sessionId, info.requestId)
	else
		self:approveRideVehicleApply(info.vehicleActorId, info.passengerUid, accept, info.sessionId, info.requestId)
	end

	return false
end

function ClientVehicleOpComponent:RPC_SC_RideVehicleRequestResult(info)
	if not self.isMainPlayer then
		return
	end

	pg.global.ui.tips:finishVehicleRideRequest(info)

	local success = info.result == NoticeDef.SUCCESS or info.result == NoticeDef.VEHICLE_MOUNT_SUCCESS

	if not success then
		local textKey = info.result == NoticeDef.VEHICLE_MOUNT_FAIL_FULL and "VEHICLE_RIDE_FULL" or "VEHICLE_RIDE_UNAVAILABLE"

		pg.global.showBubbleMessageRaw(pg.getGameString(textKey))
	end
end

function ClientVehicleOpComponent:RPC_SC_RideVehicleNotice(info)
	facade:SendMessageCommand(MessageName.VEHICLE_RIDE_NOTICE_RECEIVED, info)

	local textKey = RIDE_NOTICE_KEYS[info.status]

	if self.isMainPlayer and textKey then
		pg.global.showBubbleMessageRaw(pg.getGameString(textKey))
	end
end

function ClientVehicleOpComponent:dismountVehicle(vehicleId)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		self.logger:info("ClientVehicleOpComponent dismountVehicle vehicleId %s", vehicleId)
	end

	self:serverMsg("RPC_CS_DismountVehicle", vehicleId)
	facade:SendMessageCommand(MessageName.DISMOUNT_SELF)
end

function ClientVehicleOpComponent:canActiveDismountVehicle()
	local vehicle = self.curVehicle

	if vehicle and vehicle.canActiveDismount then
		return vehicle:canActiveDismount()
	end

	return true
end

function ClientVehicleOpComponent:dismountSelf()
	local vehicleId = self.onVehicleActorId

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		self.logger:info("ClientVehicleOpComponent dismountVehicle vehicleId %s", vehicleId)
	end

	if vehicleId == 0 then
		self:clearVehicleMountRequest()
		self:clearLocalVehicleRideState()
		facade:SendMessageCommand(MessageName.DISMOUNT_SELF)

		return
	end

	if not self:canActiveDismountVehicle() then
		return
	end

	if self.curVehicle and self.curVehicle.isActiveVehicleRideDriver and self.curVehicle:isActiveVehicleRideDriver(self.actorId) then
		self:requestVehicleRideExit("active_dismount")

		return
	end

	self:serverMsg("RPC_CS_DismountVehicle", vehicleId)
	facade:SendMessageCommand(MessageName.DISMOUNT_SELF)
end

function ClientVehicleOpComponent:RPC_CS_DismountVehicleSeat(vehicleActorId)
	if LoggerManager.checkLogger(LoggerConst.INFO) then
		self.logger:info("ClientVehicleOpComponent RPC_CS_DismountVehicleSeat vehicleActorId %s", vehicleActorId)
	end

	self:serverMsg("RPC_CS_DismountVehicleSeat", vehicleActorId)
end

function ClientVehicleOpComponent:exchangeSeatVehicle(vehicleActorId, srcSeatId, dstSeatId)
	self:serverMsg("RPC_CS_ExchangeSeat", vehicleActorId, srcSeatId, dstSeatId)
end

function ClientVehicleOpComponent:onVehicleProgressFinished(vehicle)
	self:serverMsg("RPC_CS_ProgressFull", vehicle.actorId, self.actorId)
end

function ClientVehicleOpComponent:openVehicleSimpleChat()
	if self.isMainPlayer ~= true then
		return
	end

	local vehicleConfig = self.curVehicle and self.curVehicle.getVehicleConfig and self.curVehicle:getVehicleConfig()

	if vehicleConfig == nil or vehicleConfig.isopenchat ~= 1 then
		return
	end

	pg.global.ui.hudV2:openChat(false)
end

function ClientVehicleOpComponent:closeVehicleSimpleChat()
	if self.isMainPlayer ~= true then
		return
	end

	local hudV2 = pg.global.ui.hudV2
	local quickChat

	if hudV2 ~= nil and hudV2.LD ~= nil then
		quickChat = hudV2.LD.quickChat
	end

	if quickChat ~= nil then
		quickChat:leaveSimpleChatMode()
	end
end

function ClientVehicleOpComponent:syncVehicleChatTypingToMe(uid, vehicleActorId, typingType)
	if self.isMainPlayer == true or pg.me == nil or tonumber(pg.me.onVehicleActorId) ~= tonumber(vehicleActorId) then
		return
	end

	if typingType ~= nil then
		pg.me:notifyPlayerTyping({
			uid
		}, typingType)

		return
	end

	local quickChat = pg.global.ui.hudV2 and pg.global.ui.hudV2.LD and pg.global.ui.hudV2.LD.quickChat

	if quickChat ~= nil then
		quickChat:syncVehicleTypingToUid(uid, vehicleActorId)
	else
		pg.me:notifyPlayerTyping({
			uid
		}, ClientConst.PlayerTyping.None)
	end
end

function ClientVehicleOpComponent:refreshVehicle()
	if self.postInitialized ~= true then
		return
	end

	local vehicleId = self.onVehicleActorId
	local seatId = self.seatId
	local vehicle = pg.getEntityByActorId(vehicleId)

	if vehicle == self.curVehicle and self.curSeatId == seatId then
		self:clearVehicleRestoreListener()

		return
	end

	if vehicleId == 0 then
		self:clearLocalVehicleRideState()

		return
	end

	if vehicle == nil then
		self:waitVehicleEntityRestore()

		return
	end

	self:clearVehicleRestoreListener()

	if self.curVehicle then
		self:onDismount()
	end

	self:onMount(vehicle, seatId)
end

function ClientVehicleOpComponent:destroy()
	if self.isMainPlayer then
		pg.global.ui.tips:clearVehicleRideNotices()
	end

	self:clearVehicleMountRequest()
	self:clearVehicleRestoreListener()
end

function ClientVehicleOpComponent:onMount(vehicle, seatId)
	self.curVehicle = vehicle
	self.curSeatId = seatId

	vehicle:entityMount(self, seatId)

	self.isIndependentPetVehiclePassenger = Utils.isPet(self) and not self.isInControl and VehicleUtils.isPetOnlyVehicle(vehicle)

	if not Utils.isHomePet(self) and not self.isIndependentPetVehiclePassenger then
		pg.me:registerInRiding(self, vehicle)
	end

	self:postComponentMethod("EVENT_OnEnterVehicle", vehicle, seatId)

	if self.authority == Const.AUTHORITY_MASTER and (self.isMainPlayer or self.isInControl) and pg.me and pg.me.setKeepAwayState then
		pg.me:setKeepAwayState(ClientConst.SpaceFollowKeepAwayReason.Vehicle, true)
	end

	self:refreshMountVisible()
	self:openVehicleSimpleChat()
	self:syncVehicleChatTypingToMe(self.uid, vehicle.actorId)

	if vehicle.onVehicleRideActorMounted then
		vehicle:onVehicleRideActorMounted(self)
	end

	self.vehicleRideRestoring = false
end

function ClientVehicleOpComponent:onDismount()
	if self.curVehicle == nil then
		return
	end

	if self.curVehicle.isDestroyed then
		if LoggerManager.checkLogger(LoggerConst.WARN) then
			self.logger:warn("onDismount curVehicle already destroyed, entityDismount first, vehicleId %s seatId %s", self.curVehicle.actorId, self.curSeatId)
		end

		self.curVehicle:entityDismount(self, self.curSeatId)
	end

	if self.isMainPlayer ~= true then
		self:syncVehicleChatTypingToMe(self.uid, self.curVehicle.actorId, ClientConst.PlayerTyping.None)
		pg.game.chat:showEntityMessageTypingByUid(self.uid, ClientConst.PlayerTyping.None)
	end

	self:closeVehicleSimpleChat()

	if self.curVehicle.onVehicleRideActorDismounted then
		self.curVehicle:onVehicleRideActorDismounted(self)
	end

	if not Utils.isHomePet(self) and not self.isIndependentPetVehiclePassenger then
		pg.me:unregisterInRiding(self)
	end

	self:postComponentMethod("EVENT_OnExitVehicle", self.curVehicle, self.curSeatId)

	if self.authority == Const.AUTHORITY_MASTER and (self.isMainPlayer or self.isInControl) and pg.me and pg.me.setKeepAwayState then
		pg.me:setKeepAwayState(ClientConst.SpaceFollowKeepAwayReason.Vehicle, false)
	end

	if self.curVehicle ~= nil and not self.curVehicle.isDestroyed then
		self.curVehicle:entityDismount(self, self.curSeatId)
	end

	self.curVehicle = nil
	self.curSeatId = 0
	self.isIndependentPetVehiclePassenger = false

	self:refreshMountVisible()
end

function ClientVehicleOpComponent:tryAutoMountBonfire(tryCount)
	tryCount = tryCount or 10

	if not GlobalData.RespawnBonfirePointId then
		return
	end

	if self.autoMountBonfireTimerId then
		self:removeTimer(self.autoMountBonfireTimerId)

		self.autoMountBonfireTimerId = nil
	end

	self.autoMountBonfireTimerId = self:addRepeatTimer(1, function()
		tryCount = tryCount - 1

		local ok, err = self:autoMountBonfire()

		if ok or tryCount <= 0 then
			self:removeTimer(self.autoMountBonfireTimerId)

			self.autoMountBonfireTimerId = nil
			GlobalData.RespawnBonfirePointId = nil
		end

		self.logger:debug("tryAutoMountBonfire, ok=%s, err=%s, remainTryCount=%s", ok, NoticeDef.getRepr(err), tryCount)
	end)
end

function ClientVehicleOpComponent:autoMountBonfire()
	local CHECK_DISTANCE_POINT = 10
	local CHECK_DISTANCE_ACTOR = 10
	local sdd = SceneData[self.space and self.space.sceneId]

	if sdd == nil or not ToBool(sdd.isBonfire) then
		return false, NoticeDef.ERROR_SCENE_VALID
	end

	local pointId = GlobalData.RespawnBonfirePointId

	if pointId == nil then
		return false, NoticeDef.ERROR_INVALID_STATUS
	end

	local mainSceneId = SceneUtils.getMainSceneId(self.space.sceneId)
	local position = SceneUtils.getMapMarkPositionById(mainSceneId, pointId)

	if position == nil then
		return false, NoticeDef.ERROR_POSITION_VALID
	end

	local distance = Vector3.Distance(self:getPosition(), position)

	if CHECK_DISTANCE_POINT < distance then
		return false, NoticeDef.ERROR_INVALID_DISTANCE
	end

	local ClientBonfire = require("Entities.SpaceEntities.VehicleEntities.ClientBonfire")
	local actorIds = self:entitiesInRange(CHECK_DISTANCE_ACTOR, Const.SEARCH_USR_TYPE_OTHER)

	if #actorIds > 0 then
		for _, actorId in ipairs(actorIds) do
			local ent = pg.getEntityByActorId(actorId)

			if ent and class.isInstanceOf(ent, ClientBonfire) and self:checkEnterVehicle(nil, ent.getVehicleConfig and ent:getVehicleConfig().enterConflictType) then
				ent:tryMount(self)
				self.logger:debug("autoMountBonfire %s tryMount %s", self:repr(), ent:repr())

				return true, NoticeDef.SUCCESS
			end
		end
	end

	return false, NoticeDef.ERROR_INVALID_TARGET
end

return ClientVehicleOpComponent
