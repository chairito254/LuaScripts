-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\Home\\ClientHomelandWorkComponent.lua

local Class = require("Core.Framework.Class")
local HomeObjectData = require("Data.home_object_data")
local HomelandFacilityData = require("Data.homeland_facility_data")
local HomelandFormulaData = require("Data.homeland_formula_data")
local InteractionConst = require("Common.Const.InteractionConst")
local HomelandOperateData = require("Data.homeland_operate_data")
local ClientConst = require("Const.ClientConst")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local GlobalData = require("Core.Client.GlobalData")
local EventConst = require("Const.EventConst")
local AIUtils = require("Common.Utils.AIUtils")
local AiConst = require("Common.Const.AiConst")
local HomelandConfigData = require("Data.homeland_config_data")
local HOME_PET_WORK_LOVE_SOUND_EMOTION = "Love"
local HOME_PET_WORK_LOVE_SOUND_TRIGGER_PROBABILITY = 0.5
local ClientHomelandWorkComponent = Class.Component("ClientHomelandWorkComponent")

function ClientHomelandWorkComponent:init(dict)
	self.homePetWorkLoveSoundTimer = nil

	if Utils.isHomePet(self) then
		AIUtils.pauseBt(self, AiConst.PauseBtReason.HomeInitPetData)
	end

	return true
end

function ClientHomelandWorkComponent:onEnterSpace()
	self:initAllocationData()
end

function ClientHomelandWorkComponent:initAllocationData()
	if self.space:isHomeland() then
		if Utils.isHomePet(self) then
			self.allocationInfo = GlobalData.Space.allocation[self.id]

			AIUtils.resumeBt(self, AiConst.PauseBtReason.HomeInitPetData)
		elseif Utils.isPlayer(self) then
			self.allocationInfo = GlobalData.Space.playerAllocation[self.id]
		end

		if self.allocationInfo then
			self.eventEmitter:emit(EventConst.HOMELAND_WORK_STATE_CHANGED)
		end
	else
		AIUtils.resumeBt(self, AiConst.PauseBtReason.HomeInitPetData)
	end

	self:refreshHomePetWorkLoveSoundTimer()
end

function ClientHomelandWorkComponent:setAllocationInfo(allocationInfo)
	self.allocationInfo = allocationInfo

	self.eventEmitter:emit(EventConst.HOMELAND_WORK_STATE_CHANGED)
	self:postComponentMethod("onHomelandAIPlanChanged")
	self:refreshHomePetWorkLoveSoundTimer()
end

function ClientHomelandWorkComponent:destroy()
	self:clearHomePetWorkLoveSoundTimer()
end

function ClientHomelandWorkComponent:isHomePetWorkingAtFacility()
	if not Utils.isHomePet(self) or not self.petInfo or not self.space or not self.space:isHomeland() or not Utils.checkHomePetStateValid(self.petInfo, self.space) then
		return false
	end

	local allocationInfo = self.allocationInfo

	if not allocationInfo or allocationInfo.opId < Const.HOMELAND_FACILITY_OP_TYPE.MAX_OPER_STATE then
		return false
	end

	return self.space.facility[allocationInfo.ornamentId] ~= nil
end

function ClientHomelandWorkComponent:clearHomePetWorkLoveSoundTimer()
	if self.homePetWorkLoveSoundTimer then
		self:removeTimer(self.homePetWorkLoveSoundTimer)

		self.homePetWorkLoveSoundTimer = nil
	end
end

function ClientHomelandWorkComponent:refreshHomePetWorkLoveSoundTimer()
	if not self:isHomePetWorkingAtFacility() then
		self:clearHomePetWorkLoveSoundTimer()

		return
	end

	if self.homePetWorkLoveSoundTimer then
		return
	end

	local time = HomelandConfigData.homePetVocalizationInterval or 30

	self.homePetWorkLoveSoundTimer = self:addRepeatTimer(time, function()
		self:playHomePetWorkLoveSound()
	end)
end

function ClientHomelandWorkComponent:playHomePetWorkLoveSound()
	if not self:isHomePetWorkingAtFacility() then
		self:clearHomePetWorkLoveSoundTimer()

		return
	end

	if math.random() >= HOME_PET_WORK_LOVE_SOUND_TRIGGER_PROBABILITY then
		return
	end

	local petTemplateId = self.petInfo.templateId
	local audioEmitter = self.eModel and self.eModel.audioEmitter

	if not petTemplateId or not audioEmitter or IsNil(audioEmitter) then
		return
	end

	pg.game.audio:playPetEmotionSound(petTemplateId, HOME_PET_WORK_LOVE_SOUND_EMOTION, audioEmitter)
end

function ClientHomelandWorkComponent:onHomeEventChanged()
	self:refreshHomePetWorkLoveSoundTimer()
end

function ClientHomelandWorkComponent:onTransportStart()
	self.eventEmitter:emit(EventConst.HOMELAND_TRANSPORT_STATE_CHANGED)
end

function ClientHomelandWorkComponent:onTransportEnd()
	self.eventEmitter:emit(EventConst.HOMELAND_TRANSPORT_STATE_CHANGED)
end

function ClientHomelandWorkComponent:onTransportChanged()
	self.eventEmitter:emit(EventConst.HOMELAND_TRANSPORT_STATE_CHANGED)
end

function ClientHomelandWorkComponent:RPC_SC_PetStartRestTeleportEffect()
	self.suppressNextHomeRestVehicleDropPosition = true

	if self.onVehicleActorId ~= 0 then
		return
	end

	self:playEffect("Eff_Switch_Hit")
end

function ClientHomelandWorkComponent:RPC_SC_PetEndRestTeleportEffect()
	self.suppressNextHomeRestVehicleDropPosition = nil
end

return ClientHomelandWorkComponent
