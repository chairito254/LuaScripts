-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientPlayerObComponent.lua

local CommonConst = require("Common.Const.Const")
local Class = require("Core.Framework.Class")
local MessageName = require("Const.MessageName")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local UIConst = require("Const.UIConst")
local TimerManager = require("Core.Timer.TimerManager")
local EModelUtils = require("Entities.Utils.EModelUtils")
local LuaUIUtils = require("Utils.LuaUIUtils")
local Vector3 = Vector3
local ClientPlayerObComponent = Class.Component("ClientPlayerObComponent")
local OBSERVE_CHECK_INTERVAL = 0.2

local function getEModel(entity)
	if not entity or entity.destroyed then
		return
	end

	return entity.eModel
end

function ClientPlayerObComponent:ctor()
	self.observeTargetUid = nil
	self.isTransferring = false
	self.transferTimeoutTimer = nil
	self.observeFollowBackup = nil
	self.observeCheckTimer = nil
	self.observeFollowActive = false
	self.robEggPvpUIRestorePending = false
end

function ClientPlayerObComponent:start()
	return
end

function ClientPlayerObComponent:resetCameraToMe()
	if pg.me == self and getEModel(self) then
		pg.game.camera:setTargetPlayer(self, 0)
	end
end

function ClientPlayerObComponent:startObserveCheck()
	if self.observeCheckTimer then
		return
	end

	self.observeCheckTimer = TimerManager.addRepeatTimer(OBSERVE_CHECK_INTERVAL, function()
		self:onObserveCheck()
	end, true)
end

function ClientPlayerObComponent:stopObserveCheck()
	if self.observeCheckTimer then
		TimerManager.removeTimer(self.observeCheckTimer)

		self.observeCheckTimer = nil
	end
end

function ClientPlayerObComponent:getObserveFollowEModel()
	if pg.me ~= self then
		return
	end

	local eModel = getEModel(self)

	if not eModel then
		return
	end

	self:addEModelComponent(CommonConst.COMPONENT_INDEX_FOLLOW)

	return eModel
end

function ClientPlayerObComponent:backupObserveFollowComponent(followEModel)
	if self.observeFollowBackup then
		return
	end

	local followEntity = followEModel.followEntity

	self.observeFollowBackup = {
		followEntityId = followEntity and followEntity.id or nil,
		enableFollow = followEModel.enableFollow,
		checkFollowVisible = followEModel.checkFollowVisible
	}
end

function ClientPlayerObComponent:setObserveFollowTarget(targetEntity)
	local observeEModel = self:getObserveFollowEModel()

	if not observeEModel then
		return false
	end

	local followEntityEModel

	if targetEntity then
		followEntityEModel = getEModel(targetEntity)

		if not followEntityEModel then
			return false
		end

		self:backupObserveFollowComponent(observeEModel)
	elseif not self.observeFollowBackup then
		return true
	end

	observeEModel.enableFollow = true
	observeEModel.checkFollowVisible = false
	observeEModel.followEntity = followEntityEModel

	return true
end

function ClientPlayerObComponent:restoreObserveFollowComponent()
	local backup = self.observeFollowBackup

	self.observeFollowBackup = nil
	self.observeFollowActive = false

	if not backup then
		return
	end

	local observeEModel = self:getObserveFollowEModel()

	if not observeEModel then
		return
	end

	local followEntity = backup.followEntityId and pg.getEntity(backup.followEntityId)

	observeEModel.followEntity = getEModel(followEntity)
	observeEModel.enableFollow = backup.enableFollow
	observeEModel.checkFollowVisible = backup.checkFollowVisible
end

function ClientPlayerObComponent:getObserveTargetEntity()
	if not self.observeTargetUid then
		return nil
	end

	local targetEntity = pg.getEntityByUid(self.observeTargetUid)
	local targetEModel = getEModel(targetEntity)

	if targetEModel and targetEntity.isInScene and targetEModel.isModelLoaded then
		return targetEntity
	end

	return nil
end

function ClientPlayerObComponent:snapMeToTarget(targetEntity)
	if pg.me ~= self or not getEModel(self) or not getEModel(targetEntity) then
		return
	end

	EModelUtils.setAgentPositionAndRotation(self, targetEntity:getPosition(), targetEntity:getRotation(), true)
end

function ClientPlayerObComponent:unbindObserveTarget()
	if not self.observeFollowActive then
		return
	end

	if self:setObserveFollowTarget(nil) then
		self.observeFollowActive = false
	end

	self:resetCameraToMe()
end

function ClientPlayerObComponent:applyObserveBinding()
	if not self.observeTargetUid then
		return false
	end

	if self.isTransferring then
		self:unbindObserveTarget()

		return false
	end

	if self.space and self.space.sceneId == CommonConst.ROB_EGG_SCENE_ID and self.observeTargetUid == self.uid then
		self:unbindObserveTarget()

		return true
	end

	local targetEntity = self:getObserveTargetEntity()

	if not targetEntity then
		self:unbindObserveTarget()

		return false
	end

	local observeEModel = self:getObserveFollowEModel()
	local targetEModel = getEModel(targetEntity)

	if not observeEModel or not targetEModel then
		return false
	end

	local bindingValid = self.observeFollowActive and self.observeFollowBackup ~= nil and observeEModel.followEntity == targetEModel and observeEModel.enableFollow == true and observeEModel.checkFollowVisible == false

	if not bindingValid then
		if not self:setObserveFollowTarget(targetEntity) then
			return false
		end

		self.observeFollowActive = true

		self:snapMeToTarget(targetEntity)
		self:resetCameraToMe()
	end

	return true
end

function ClientPlayerObComponent:onObserveCheck()
	self:applyObserveBinding()
end

function ClientPlayerObComponent:applyObserveInitialPosition(info)
	if not info or not info.pos or pg.me ~= self or not getEModel(self) then
		return
	end

	EModelUtils.setAgentPositionAndRotation(self, Vector3.Convert(info.pos), self:getRotation(), true)
end

function ClientPlayerObComponent:onEnterSpectate()
	if pg.me ~= self then
		return
	end

	local obTargetUid = self.space and self.space.obTargetUid

	if not obTargetUid then
		return
	end

	local target = obTargetUid[self.uid]

	if target then
		self:enterObserveMode({
			targetUid = target
		})
	end
end

function ClientPlayerObComponent:RPC_SC_PlayerEnterObserveMode(info)
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("RPC_SC_PlayerEnterObserveMode")
	end

	self:enterObserveMode(info)
end

function ClientPlayerObComponent:RPC_SC_ObservedTargetWillTransfer()
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("RPC_SC_ObservedTargetWillTransfer")
	end

	if pg.me ~= self then
		return
	end

	self.isTransferring = true

	self:unbindObserveTarget()

	if self.transferTimeoutTimer then
		TimerManager.removeTimer(self.transferTimeoutTimer)
	end

	self.transferTimeoutTimer = TimerManager.addTimer(5, function()
		self.isTransferring = false
		self.transferTimeoutTimer = nil

		self:applyObserveBinding()
	end)
end

function ClientPlayerObComponent:enterObserveMode(info)
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("enterObserveMode")
	end

	if pg.me ~= self or not info then
		return
	end

	local targetUid = info.targetUid

	if not targetUid then
		return
	end

	if self.space and self.space.sceneId == CommonConst.ROB_EGG_SCENE_ID then
		self.robEggPvpUIRestorePending = true
	end

	local targetChanged = self.observeTargetUid ~= targetUid

	self.observeTargetUid = targetUid

	if targetChanged then
		self:unbindObserveTarget()
	end

	self.isTransferring = false

	if self.transferTimeoutTimer then
		TimerManager.removeTimer(self.transferTimeoutTimer)

		self.transferTimeoutTimer = nil
	end

	self:applyObserveInitialPosition(info)
	self:resetCameraToMe()

	local function notifyObservePlayerChanged()
		facade:sendMsgToUI(MessageName.ON_OBSERVE_PLAYER_CHANGED)
	end

	if not pg.global.ui:checkUIOpen(UIConst.UI_DEATH_SPECTATE) then
		local whiteList = {
			[UIConst.UI_ID_TOPLOGO] = true
		}
		local keepPvpTips = self.space and self.space:isGrabEgg() and self.space.isPvp == true

		if keepPvpTips then
			whiteList[UIConst.UI_ID_TIPS] = true
		end

		pg.global.ui:closeAllUIPanel(whiteList)

		if keepPvpTips then
			pg.global.ui:open(UIConst.UI_ID_TIPS)
		end

		pg.global.ui:open(UIConst.UI_DEATH_SPECTATE, nil, notifyObservePlayerChanged)
		pg.game.camera.playerCameraMode:resetCameraZoom(true)

		pg.game.input.lockCameraZoom = true
	else
		notifyObservePlayerChanged()
	end

	self:startObserveCheck()
	self:applyObserveBinding()
end

function ClientPlayerObComponent:RPC_SC_PlayerExitObserveMode()
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("RPC_SC_PlayerExitObserveMode")
	end

	local restorePending = self.robEggPvpUIRestorePending

	if pg.me == self then
		pg.global.ui:close(UIConst.UI_DEATH_SPECTATE)
	end

	self:clearState()

	self.robEggPvpUIRestorePending = restorePending

	self:tryRestoreRobEggPvpUI()

	local space = self.space

	if pg.me == self and space and space.isPvp == true and space:isGrabEgg() then
		facade:sendMsgToUI(MessageName.ON_OBSERVE_PLAYER_CHANGED)
	end
end

function ClientPlayerObComponent:onLifeRevival()
	self:tryRestoreRobEggPvpUI()
end

function ClientPlayerObComponent:tryRestoreRobEggPvpUI()
	if not self.robEggPvpUIRestorePending or pg.me ~= self or self.destroyed or self.observeTargetUid ~= nil or self.life ~= CommonConst.LIFE_ALIVE then
		return
	end

	self.robEggPvpUIRestorePending = false

	if not self.space or self.space.sceneId ~= CommonConst.ROB_EGG_SCENE_ID then
		return
	end

	LuaUIUtils.openPlayerGameplayUI()
end

function ClientPlayerObComponent:exitObserverMode()
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("exitObserverMode")
	end

	if pg.me == self then
		self:serverMsg("RPC_CS_RequestExitObMode")
	end
end

function ClientPlayerObComponent:changeObservePlayer(isNext)
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		self.logger:debug("changeObservePlayer", isNext)
	end

	if pg.me == self then
		self:serverMsg("RPC_CS_SwitchObTarget", isNext)
	end
end

function ClientPlayerObComponent:preDestroy()
	self:clearState()
end

function ClientPlayerObComponent:clearState()
	local wasObserving = self.observeTargetUid ~= nil

	self.robEggPvpUIRestorePending = false
	self.observeTargetUid = nil
	self.isTransferring = false
	self.observeFollowActive = false

	self:stopObserveCheck()

	if self.transferTimeoutTimer then
		TimerManager.removeTimer(self.transferTimeoutTimer)

		self.transferTimeoutTimer = nil
	end

	if not wasObserving then
		self.observeFollowBackup = nil

		return
	end

	self:restoreObserveFollowComponent()

	if pg.me and pg.me ~= self then
		return
	end

	self:resetCameraToMe()
	pg.global.ui:close(UIConst.UI_DEATH_SPECTATE)

	pg.game.input.lockCameraZoom = false
end

return ClientPlayerObComponent
