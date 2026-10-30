-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\SandBox\\BeeFlower.lua

local Class = require("Core.Framework.Class")
local LevelItem = require("GameApp.Sandbox.LevelItem")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local SandboxConst = require("Common.Const.SandboxConst")
local ClientLevelUtils = require("Utils.ClientLevelUtils")
local logger = LoggerManager.getLogger("BeeFlower", "Sandbox", LoggerConst.ERROR)
local BeeFlower = Class.LightClass("BeeFlower", LevelItem)

function BeeFlower:ctor(sandbox, spawnInfo, syncInfo)
	BeeFlower.super.ctor(self, sandbox, spawnInfo, syncInfo)
end

function BeeFlower:onInit()
	self.majorCompId = self.spawnInfo.majorCompId
	self.actionPrototypeId = 0
	self.noBeePetNoticeId = 0
	self.harvestAnimKey = ""
	self._playersInRange = {}
	self._interactRegistered = false
	self.beePetTemplateIdSet = {}
	self._harvestAnimationState = nil
	self._ownsHarvestState = false
	self._harvestPetId = nil
	self._harvestAnimationTimer = nil
	self._harvestPlayer = nil
	self._harvestPetEntity = nil
end

function BeeFlower:onSandboxReady()
	BeeFlower.super.onSandboxReady(self)

	if self.shell and self.majorCompId then
		self.beeFlowerSB = self.shell:GetComponentById(self.majorCompId)
	end

	if self.beeFlowerSB then
		self.actionPrototypeId = self.beeFlowerSB.actionPrototypeId or 0
		self.noBeePetNoticeId = self.beeFlowerSB.noBeePetNoticeId or 0
		self.harvestAnimKey = self.beeFlowerSB.harvestAnimKey or ""
		self.beePetTemplateIdSet = {}

		local list = self.beeFlowerSB.beePetTemplateIds

		if list then
			for i = 0, list.Count - 1 do
				self.beePetTemplateIdSet[list[i]] = true
			end
		end
	end

	self:_applyVisualForState(self.syncInfo.state or SandboxConst.BEE_FLOWER_STATE.CLOSED)
	self:_applyHarvestCount(self.syncInfo.harvestCount or 0)
end

function BeeFlower:onLocalSubComponentInteract(subComponentId)
	if self.syncInfo.state ~= SandboxConst.BEE_FLOWER_STATE.OPEN then
		return
	end

	local player = pg.me

	if not player or not player.isControllingPet or not player:isControllingPet() then
		return
	end

	local petEnt = player.getCurPetEntity and player:getCurPetEntity() or nil

	if not petEnt or not self.beePetTemplateIdSet[petEnt.templateId] or self._harvestAnimationState then
		return
	end

	self._harvestPetId = petEnt.id

	self:_playHarvestAnimation(petEnt.id)
end

function BeeFlower:RPC_SC_PlayHarvestAnimation(petId)
	if self._harvestAnimationState then
		return
	end

	self:_clearHarvestAnimation()

	self._harvestPetId = petId

	if self:_playHarvestAnimation(petId) then
		return
	end

	local timerId

	timerId = self:addTimer(0, function()
		if self._harvestAnimationTimer ~= timerId then
			return
		end

		self._harvestAnimationTimer = nil

		if not self:_playHarvestAnimation(petId) then
			self:_clearHarvestAnimation()
		end
	end)
	self._harvestAnimationTimer = timerId
end

function BeeFlower:_playHarvestAnimation(petId)
	if self._harvestAnimationState then
		return true
	end

	if not self._harvestPetId then
		return true
	end

	if self.harvestAnimKey == "" then
		self:_clearHarvestAnimation()

		return true
	end

	local petEnt = petId and pg.getEntity(petId) or nil

	if not petEnt then
		return false
	end

	local state = petEnt.playAnimation and petEnt:playAnimation(self.harvestAnimKey) or nil

	if not NotNil(state) then
		self:_clearHarvestAnimation()

		return true
	end

	self._harvestAnimationState = state

	local player = pg.me
	local controlledPet = player and player.getCurPetEntity and player:getCurPetEntity() or nil

	if player and player.isControllingPet and player:isControllingPet() and controlledPet and controlledPet.id == petId then
		self._harvestPlayer = player
		self._harvestPetEntity = petEnt
		self._ownsHarvestState = true
		player.isHarvesting = true
		petEnt.isHarvesting = true
	end

	state:AddEndCallback(function(reason)
		self:_endHarvestAnimation(state, reason)
	end)

	return true
end

function BeeFlower:_endHarvestAnimation(state, reason)
	if not state or self._harvestAnimationState ~= state then
		return
	end

	self:_clearHarvestAnimation()
end

function BeeFlower:_clearHarvestAnimation()
	if self._harvestAnimationTimer then
		self:removeTimer(self._harvestAnimationTimer)

		self._harvestAnimationTimer = nil
	end

	self._harvestPetId = nil
	self._harvestAnimationState = nil

	local player = self._harvestPlayer

	self._harvestPlayer = nil

	local petEnt = self._harvestPetEntity

	self._harvestPetEntity = nil

	if player and self._ownsHarvestState then
		player.isHarvesting = false
	end

	if petEnt and self._ownsHarvestState then
		petEnt.isHarvesting = false
	end

	self._ownsHarvestState = false
end

function BeeFlower:onValueChange(key, oldValue, value, isInit)
	BeeFlower.super.onValueChange(self, key, oldValue, value, isInit)

	if key == "state" then
		self:_applyVisualForState(value)
		self:_refreshInteract()
	elseif key == "harvestCount" then
		self:_applyHarvestCount(value)
	end
end

function BeeFlower:_applyHarvestCount(harvestCount)
	if self.beeFlowerSB then
		self.beeFlowerSB:SetHarvestCount(harvestCount or 0)
	end
end

function BeeFlower:_applyVisualForState(state)
	if LoggerManager.checkLogger(LoggerConst.DEBUG) then
		logger:debug("BeeFlower:_applyVisualForState id=%s state=%s", tostring(self.id), tostring(state))
	end
end

function BeeFlower:_hasAnyPlayerInRange()
	if self.beeFlowerSB and self.beeFlowerSB.HasAnyActorInRange then
		return self.beeFlowerSB:HasAnyActorInRange()
	end

	return next(self._playersInRange) ~= nil
end

function BeeFlower:onPlayerEnterRange(actorId)
	if not actorId then
		return
	end

	self._playersInRange[actorId] = true

	self:_refreshInteract()
end

function BeeFlower:onPlayerLeaveRange(actorId)
	if not actorId then
		return
	end

	self._playersInRange[actorId] = nil

	self:_refreshInteract()
end

function BeeFlower:_refreshInteract()
	if not pg.me then
		return
	end

	if not self.beeFlowerSB then
		return
	end

	if not self.actionPrototypeId or self.actionPrototypeId <= 0 then
		return
	end

	local shouldRegister = self:_hasAnyPlayerInRange() and self.syncInfo.state == SandboxConst.BEE_FLOWER_STATE.OPEN

	if shouldRegister == self._interactRegistered then
		return
	end

	if shouldRegister then
		local pos = self.shell and self.shell.transform and self.shell.transform.position or nil
		local beeFlowerSB = self.beeFlowerSB

		ClientLevelUtils.onInteract(function()
			if beeFlowerSB then
				beeFlowerSB:TryHarvest()
			end
		end, true, self.actionPrototypeId, pos, self.id)
	else
		ClientLevelUtils.onInteract(nil, false, self.actionPrototypeId, nil, self.id)
	end

	self._interactRegistered = shouldRegister
end

function BeeFlower:_findFirstBeePetId(set)
	if not pg or not pg.me then
		return nil
	end

	local prepareList = pg.me.petPrepareList

	if prepareList then
		for _, petId in ipairs(prepareList) do
			local petInfo = pg.me.getPetInfo and pg.me:getPetInfo(petId)

			if petInfo and petInfo.templateId and set[petInfo.templateId] then
				return petId
			end
		end
	end

	local pets = pg.me.getPets and pg.me:getPets()

	if pets then
		for petId, petInfo in pairs(pets) do
			if petInfo and petInfo.templateId and set[petInfo.templateId] then
				return petId
			end
		end
	end

	return nil
end

function BeeFlower:requestHarvest()
	if self.syncInfo.state ~= SandboxConst.BEE_FLOWER_STATE.OPEN then
		return
	end

	if not pg.me then
		return
	end

	local set = self.beePetTemplateIdSet or {}

	if pg.me:isControllingPet() then
		local curPetId = pg.me.curCombatPetId
		local curPetInfo = curPetId and pg.me.getPetInfo and pg.me:getPetInfo(curPetId)

		if curPetInfo and curPetInfo.templateId and set[curPetInfo.templateId] then
			self:serverMsg("RPC_CS_Harvest")
			self:onLocalSubComponentInteract(nil)

			return
		end
	end

	local beePetId = self:_findFirstBeePetId(set)

	if beePetId then
		pg.me:requestQuickLinkPet(beePetId)
	elseif self.noBeePetNoticeId and self.noBeePetNoticeId > 0 and pg.global and pg.global.ui and pg.global.ui.tips then
		pg.global.ui.tips:showTextTipById(self.noBeePetNoticeId)
	end
end

function BeeFlower:destroy()
	self:_clearHarvestAnimation()

	self._playersInRange = {}

	self:_refreshInteract()

	self._playersInRange = nil
	self.beeFlowerSB = nil

	BeeFlower.super.destroy(self)
end

return BeeFlower
