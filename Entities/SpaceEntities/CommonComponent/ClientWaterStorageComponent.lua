-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientWaterStorageComponent.lua

local Class = require("Core.Framework.Class")
local Utils = require("Common.Utils.Utils")
local ClientUtils = require("Utils.ClientUtils")
local MessageName = require("Const.MessageName")
local Const = require("Common.Const.Const")
local AttributeConst = require("Common.Const.AttributeConst")
local ElementBuffData = require("Data.element_buff_data")
local PetData = require("Data.pet_data")
local PetProtoTypeData = require("Data.pet_prototype_data")
local AbilityParamData = require("Data.ability_param_data")
local EventConst = require("Const.EventConst")
local Time = require("Core.Common.Time")
local WATER_FEEDBACK_PENDING_SECONDS = 5
local WATER_INITIALIZE_RETRY_SECONDS = 0.2
local ClientWaterStorageComponent = Class.Component("ClientWaterStorageComponent")

function ClientWaterStorageComponent:ctor()
	self.element = 1
	self._waterStorageRevision = 0
	self._waterStorageReady = false
end

function ClientWaterStorageComponent:init(dict)
	if not self.isMainPet then
		return
	end

	self:buildConfigData()
end

function ClientWaterStorageComponent:start()
	self._waterStorageStarted = true

	self:tryInitializeWaterStorage()
end

function ClientWaterStorageComponent:bindExploreBuffChangeEvent()
	if self.exploreBuffChangeHandler ~= nil or self.eventEmitter == nil then
		return
	end

	function self.exploreBuffChangeHandler()
		if not self._waterStorageDestroyed then
			self:computeExploreAddVal()
		end
	end

	self.eventEmitter:addEventListener(EventConst.ON_BUFF_CHANGE, self.exploreBuffChangeHandler)
end

function ClientWaterStorageComponent:unbindExploreBuffChangeEvent()
	if self.exploreBuffChangeHandler == nil then
		return
	end

	local handler = self.exploreBuffChangeHandler

	self.exploreBuffChangeHandler = nil

	if self.eventEmitter then
		self.eventEmitter:removeEventListener(EventConst.ON_BUFF_CHANGE, handler)
	end
end

function ClientWaterStorageComponent:EVENT_onBindBuffChange(buffChangeData)
	if not self.isMainPet or self._waterStorageDestroyed then
		return
	end

	if not self.maxWater then
		return
	end

	if buffChangeData == nil or buffChangeData.templateId == nil then
		return
	end

	local bindBuffCfg = ElementBuffData[self.element]
	local bindBuffId = bindBuffCfg and bindBuffCfg.buffId

	if self.isMainPet and bindBuffId == buffChangeData.templateId then
		self:computeExploreAddVal()
	end
end

function ClientWaterStorageComponent:buildConfigData()
	local petInfo = self:getBattlePetInfo()
	local petProtoTypeData = petInfo and PetProtoTypeData[petInfo.petPrototypeId or 0]

	if petProtoTypeData == nil then
		return false
	end

	self.maxWater = petProtoTypeData.maxWater
	self.canUseVal = petProtoTypeData.waterMinRuling
	self.defaultAddVal = petProtoTypeData.selfRecover
	self.inBuffAddVal = petProtoTypeData.waterRecover
	self.waterConfigData = nil

	return true
end

function ClientWaterStorageComponent:getWaterConfigData()
	local config = self.waterConfigData

	if not config or config.maxWater ~= self.maxWater or config.costVal ~= self.canUseVal or config.addVal ~= self.defaultAddVal or config.extraAddVal ~= self.inBuffAddVal then
		config = {
			maxWater = self.maxWater,
			costVal = self.canUseVal,
			addVal = self.defaultAddVal,
			extraAddVal = self.inBuffAddVal
		}
		self.waterConfigData = config
	end

	return config
end

function ClientWaterStorageComponent:getCurrentExploreBuffOwners()
	local mainPlayer = pg.me

	if mainPlayer then
		return {
			mainPlayer,
			self
		}
	end

	return {
		self
	}
end

function ClientWaterStorageComponent:computeExploreAddVal()
	local buffOwners = self:getCurrentExploreBuffOwners()
	local buffList = {}
	local bindBuffCfg = ElementBuffData[self.element]
	local bindBuffId = bindBuffCfg and bindBuffCfg.buffId
	local hasBindBuff = false

	for _, buffOwner in ipairs(buffOwners) do
		if buffOwner and buffOwner.actorBuff then
			local buff = buffOwner.actorBuff:findOneBuffByTemplateId(bindBuffId)

			if buff then
				hasBindBuff = true

				break
			end
		end
	end

	local oldAddVal = self.curAddVal

	self.curAddVal = hasBindBuff and self.inBuffAddVal + self.defaultAddVal or self.defaultAddVal

	if self._waterStorageReady and oldAddVal ~= self.curAddVal then
		self:publishWaterStorageSnapshot("recovery_changed")
	end

	return buffList, buffOwners, hasBindBuff
end

function ClientWaterStorageComponent:onUpdateExplore()
	if not self._waterStorageReady or self._waterStorageAttribute ~= self.actorCombatAttribute or self._waterStorageOwner ~= pg.me or self._waterStorageDestroyed or not self._waterStorageOwner or not self._waterStorageOwner:isPetWaterStorageSessionReady() then
		self:tryInitializeWaterStorage()

		return
	end

	self.actorCombatAttribute:changeWater(self.curAddVal)

	self.curVal = self.actorCombatAttribute:getCurWater()
end

function ClientWaterStorageComponent:checkExploreTimer()
	if self:isFullExploreValue() then
		if self.exploreRecoveryTimer ~= nil then
			self:removeTimer(self.exploreRecoveryTimer)

			self.exploreRecoveryTimer = nil
		end
	elseif self.exploreRecoveryTimer == nil then
		local attribute = self._waterStorageAttribute
		local timerId

		timerId = self:addRepeatTimer(1, function()
			if self.exploreRecoveryTimer == timerId and self._waterStorageAttribute == attribute then
				self:onUpdateExplore()
			end
		end)
		self.exploreRecoveryTimer = timerId
	end
end

function ClientWaterStorageComponent:isFullExploreValue()
	local curVal = self.actorCombatAttribute:getCurWater()
	local maxVal = self.actorCombatAttribute:getMaxWater()

	return maxVal <= curVal
end

function ClientWaterStorageComponent:onWaterCurChange(old, new)
	if not self._waterStorageReady or self._waterStorageAttribute ~= self.actorCombatAttribute or self._waterStorageOwner ~= pg.me or self._waterStorageDestroyed or not self._waterStorageOwner or not self._waterStorageOwner:isPetWaterStorageSessionReady() then
		return
	end

	self.curVal = new
	self._waterStorageValue = new

	self._waterStorageOwner:setPetCurWater(self.id, new, self.maxWater)
	self:checkExploreTimer()
	self:publishWaterStorageSnapshot("value_changed", old, new)
end

function ClientWaterStorageComponent:checkCanCastExploreSkill()
	return self:tryInitializeWaterStorage() and self:getCurWaterVal() >= self.canUseVal
end

function ClientWaterStorageComponent:checkMainControlPet()
	if self.isMainPet and pg.pawn == self then
		return true
	end

	return false
end

function ClientWaterStorageComponent:getCurWaterVal()
	return self.actorCombatAttribute:getCurWater()
end

function ClientWaterStorageComponent:getCurWaterRecoveryVal()
	return self.curAddVal
end

function ClientWaterStorageComponent:costWater(value)
	if not self:tryInitializeWaterStorage() then
		return false
	end

	if value > 0 then
		value = -value
	end

	self.actorCombatAttribute:changeWater(value)
end

function ClientWaterStorageComponent:isFastRecovery()
	if self.curAddVal and self.defaultAddVal then
		return self.curAddVal > self.defaultAddVal
	end

	return false
end

function ClientWaterStorageComponent:recordExplore()
	local owner = self._waterStorageOwner

	if owner == nil or self._waterStorageValue == nil or not owner:isPetWaterStorageSessionReady() then
		return
	end

	if not owner:isInAnyFormation(self.id) then
		owner:setPetCurWater(self.id, 0, self.maxWater)
	elseif self:isDead() then
		owner:setPetCurWater(self.id, nil)
	else
		owner:setPetCurWater(self.id, self._waterStorageValue, self.maxWater)
	end
end

function ClientWaterStorageComponent:recoveryExplore(owner, attribute)
	local maxVal = attribute:getMaxWater()
	local saveVal = owner:getPetCurWater(self.id, maxVal)

	attribute:setCurWater(math.max(0, math.min(maxVal, saveVal)))
end

function ClientWaterStorageComponent:destroy()
	self._waterStorageDestroyed = true
	self._waterStorageReady = false
	self._waterStorageFeedback = nil

	ClientUtils.tryWithLogErrorEx(self.cancelWaterStorageInitializeRetry, self)
	ClientUtils.tryWithLogErrorEx(self.unbindWaterStorageNotify, self)
	ClientUtils.tryWithLogErrorEx(self.unbindExploreBuffChangeEvent, self)

	if self.exploreRecoveryTimer ~= nil then
		local timerId = self.exploreRecoveryTimer

		self.exploreRecoveryTimer = nil

		ClientUtils.tryWithLogErrorEx(self.removeTimer, self, timerId)
	end

	if self.delayTimer ~= nil then
		local timerId = self.delayTimer

		self.delayTimer = nil

		ClientUtils.tryWithLogErrorEx(self.removeTimer, self, timerId)
	end

	ClientUtils.tryWithLogErrorEx(self.recordExplore, self)

	self._waterStorageOwner = nil
	self._waterStorageValue = nil
end

function ClientWaterStorageComponent:unbindWaterStorageNotify()
	local attribute = self._waterStorageAttribute
	local notifyId = self._waterStorageNotifyId

	self._waterStorageNotifyId = nil
	self._waterStorageAttribute = nil

	if attribute and notifyId then
		attribute:unregisterAttributeNotify(AttributeConst.water_cur, notifyId)
	end
end

function ClientWaterStorageComponent:getWaterStorageSnapshot()
	local attribute = self.actorCombatAttribute
	local maxValue = attribute and attribute:getMaxWater() or 0
	local ready = self._waterStorageReady == true and attribute == self._waterStorageAttribute and self._waterStorageOwner ~= nil and self._waterStorageOwner == pg.me and self._waterStorageOwner:isPetWaterStorageSessionReady() and maxValue > 0
	local feedback = self._waterStorageFeedback

	if feedback and Time.getTickSecond() >= feedback.expiresAt then
		self._waterStorageFeedback = nil
		feedback = nil
	end

	return {
		entity = self,
		revision = self._waterStorageRevision or 0,
		ready = ready,
		value = ready and attribute:getCurWater() or nil,
		maxValue = ready and maxValue or nil,
		costValue = self.canUseVal,
		baseRecoveryValue = self.defaultAddVal,
		recoveryValue = self.curAddVal,
		fastRecovery = ready and self:isFastRecovery() or false,
		feedback = feedback
	}
end

function ClientWaterStorageComponent:publishWaterStorageSnapshot(reason, old, new)
	if not self._waterStorageReady then
		return
	end

	self._waterStorageRevision = (self._waterStorageRevision or 0) + 1

	local snapshot = self:getWaterStorageSnapshot()

	if not snapshot.ready then
		return
	end

	if not self:checkMainControlPet() then
		self._waterStorageFeedback = nil
	elseif snapshot.fastRecovery and snapshot.value < snapshot.maxValue then
		self._waterStorageFeedback = nil
	elseif type(old) == "number" and type(new) == "number" then
		local kind

		if new < old then
			kind = "consumed"
		elseif old < snapshot.maxValue and new >= snapshot.maxValue then
			kind = "full"
		end

		if kind then
			self._waterStorageFeedback = {
				revision = snapshot.revision,
				kind = kind,
				expiresAt = Time.getTickSecond() + WATER_FEEDBACK_PENDING_SECONDS
			}
		end
	end

	snapshot.feedback = self._waterStorageFeedback
	snapshot.reason = reason
	snapshot.oldValue = old
	snapshot.newValue = new

	if self:checkMainControlPet() then
		facade:sendMsgToUI(MessageName.PET_EXPLORE_SKILL_VAL_CHANGED, snapshot)
	end
end

function ClientWaterStorageComponent:markWaterStorageFeedbackShown(revision, duration, exitDuration)
	local feedback = self._waterStorageFeedback
	local now = Time.getTickSecond()

	if not feedback or feedback.revision ~= revision or now >= feedback.expiresAt then
		return
	end

	if not feedback.shownAt then
		feedback.shownAt = now
		feedback.holdUntil = now + (feedback.remainingHold or duration)
		feedback.remainingHold = nil
		feedback.expiresAt = feedback.holdUntil + (exitDuration or 0)
	end

	return feedback
end

function ClientWaterStorageComponent:discardWaterStorageFeedback()
	self._waterStorageFeedback = nil
end

function ClientWaterStorageComponent:suspendWaterStorageFeedback(revision)
	local feedback = self._waterStorageFeedback

	if not feedback or feedback.revision ~= revision then
		return
	end

	if not feedback.shownAt then
		if feedback.entryStartedAt then
			feedback.entryStartedAt = nil
			feedback.expiresAt = Time.getTickSecond() + WATER_FEEDBACK_PENDING_SECONDS
		end

		return
	end

	local remaining = (feedback.holdUntil or feedback.expiresAt) - Time.getTickSecond()

	if remaining <= 0 then
		self._waterStorageFeedback = nil

		return
	end

	feedback.remainingHold = remaining
	feedback.entryStartedAt = nil
	feedback.shownAt = nil
	feedback.holdUntil = nil
	feedback.expiresAt = Time.getTickSecond() + WATER_FEEDBACK_PENDING_SECONDS
end

function ClientWaterStorageComponent:beginWaterStorageFeedbackPresentation(revision, animationDuration)
	local feedback = self._waterStorageFeedback
	local now = Time.getTickSecond()

	if not feedback or feedback.revision ~= revision or feedback.shownAt or feedback.entryStartedAt or now >= feedback.expiresAt then
		return
	end

	feedback.entryStartedAt = now
	feedback.expiresAt = math.max(feedback.expiresAt, now + animationDuration + WATER_FEEDBACK_PENDING_SECONDS)
end

function ClientWaterStorageComponent:tryInitializeWaterStorage()
	if not self._waterStorageStarted or self._waterStorageDestroyed or not self.isMainPet or self._waterStorageInitializing then
		return false
	end

	local owner = pg.me
	local attribute = self.actorCombatAttribute

	if self._waterStorageReady and self._waterStorageAttribute == attribute and self._waterStorageOwner == owner and owner and owner:isPetWaterStorageSessionReady() then
		return true
	end

	self._waterStorageReady = false
	self._waterStorageFeedback = nil

	self:unbindWaterStorageNotify()

	if self.exploreRecoveryTimer ~= nil then
		self:removeTimer(self.exploreRecoveryTimer)

		self.exploreRecoveryTimer = nil
	end

	if self._waterStorageOwner and self._waterStorageOwner ~= owner then
		self:cancelWaterStorageInitializeRetry()

		return false
	end

	if not owner or not owner:isPetWaterStorageSessionReady() or self.masterId ~= nil and self.masterId ~= owner.id or not attribute or not self:buildConfigData() then
		self:scheduleWaterStorageInitializeRetry()

		return false
	end

	if not self.maxWater or self.maxWater <= 0 then
		owner:setPetCurWater(self.id, nil)

		self._waterStorageValue = nil

		self:cancelWaterStorageInitializeRetry()

		return false
	end

	if self.canUseVal == nil or self.defaultAddVal == nil or self.inBuffAddVal == nil then
		self:scheduleWaterStorageInitializeRetry()

		return false
	end

	self:cancelWaterStorageInitializeRetry()

	self._waterStorageInitializing = true

	local ok, err = pcall(self.initializeWaterStorage, self, owner, attribute)

	self._waterStorageInitializing = nil

	if not ok then
		self._waterStorageReady = false

		self:unbindWaterStorageNotify()

		if self.exploreRecoveryTimer ~= nil then
			self:removeTimer(self.exploreRecoveryTimer)

			self.exploreRecoveryTimer = nil
		end

		self:unbindExploreBuffChangeEvent()
		error(err, 0)
	end

	self:publishWaterStorageSnapshot("ready")

	return true
end

function ClientWaterStorageComponent:initializeWaterStorage(owner, attribute)
	attribute:setMaxWater(self.maxWater)
	self:recoveryExplore(owner, attribute)

	self._waterStorageAttribute = attribute

	local notifyId

	notifyId = attribute:registerAttributeNotify(AttributeConst.water_cur, function(_, old, new)
		if self._waterStorageNotifyId == notifyId and self._waterStorageAttribute == attribute and self.actorCombatAttribute == attribute then
			self:onWaterCurChange(old, new)
		end
	end)
	self._waterStorageNotifyId = notifyId

	self:computeExploreAddVal()
	self:bindExploreBuffChangeEvent()

	self._waterStorageReady = true

	self:checkExploreTimer()

	self._waterStorageOwner = owner
	self._waterStorageValue = attribute:getCurWater()

	owner:setPetCurWater(self.id, self._waterStorageValue, self.maxWater)
end

function ClientWaterStorageComponent:scheduleWaterStorageInitializeRetry()
	if self._waterStorageInitializeTimer ~= nil then
		return
	end

	local token = {}

	self._waterStorageInitializeToken = token
	self._waterStorageInitializeTimer = self:addTimer(WATER_INITIALIZE_RETRY_SECONDS, function()
		if self._waterStorageInitializeToken ~= token or self._waterStorageDestroyed then
			return
		end

		self._waterStorageInitializeTimer = nil
		self._waterStorageInitializeToken = nil

		self:tryInitializeWaterStorage()
	end)
end

function ClientWaterStorageComponent:cancelWaterStorageInitializeRetry()
	self._waterStorageInitializeToken = nil

	if self._waterStorageInitializeTimer ~= nil then
		local timerId = self._waterStorageInitializeTimer

		self._waterStorageInitializeTimer = nil

		self:removeTimer(timerId)
	end
end

return ClientWaterStorageComponent
