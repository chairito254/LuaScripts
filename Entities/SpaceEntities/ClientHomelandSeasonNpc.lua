-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\ClientHomelandSeasonNpc.lua

local Class = require("Core.Framework.Class")
local ClientPuppet = require("Entities.SpaceEntities.ClientPuppet")
local ClientUtils = require("Utils.ClientUtils")
local DialogueConst = require("Const.DialogueConst")
local InteractionConst = require("Common.Const.InteractionConst")
local Time = require("Core.Common.Time")
local TimeUtils = require("Common.Utils.TimeUtils")
local HomeSeasonConfigData = require("Data.home_season_config_data")
local HomeSeasonPumpkinData = require("Data.home_season_pumpkin_data")
local InteractData = require("Data.interact_data")
local Lume = require("Core.Common.lume")
local HOME_SEASON_NPC_TYPE_CAMP_DAILY = 2
local ClientHomelandSeasonNpc = Class.Class("ClientHomelandSeasonNpc", ClientPuppet)

function ClientHomelandSeasonNpc:start()
	ClientHomelandSeasonNpc.super.start(self)

	self.lastHomeSeasonNpcPhase = self.homeSeasonNpcPhase or 0
	self.pendingUpgradePhase = nil

	local interactionId = self:getHomeSeasonNpcInteractionId() or InteractionConst.DEFAULT_INTERACTION_PROTOTYPE_ID
	local interactConfig = InteractData[interactionId] or {}

	self.interactionListData = {
		{
			globalId = self:getGlobalId(),
			actionPrototypeId = interactionId,
			interactionType = InteractionConst.INTERACTION_TYPE_ENT_FUNC,
			overrideInteractDis = interactConfig.interactiveDist,
			canInteractiveFunc = function()
				return self:canHomeSeasonNpcInteractive()
			end,
			interactFunc = function()
				self:npcFuncInteract(InteractionConst.DEFAULT_INTERACTION_CUSTOM_ID, 1)
			end
		}
	}

	self:postComponentMethod("EVENT_InitInteractionList")

	if not self:isCampDailyRewardNpc() then
		self:refreshHomeSeasonNpcScale()
	end
end

function ClientHomelandSeasonNpc:onEnterSpace()
	ClientHomelandSeasonNpc.super.onEnterSpace(self)
	self:refreshHomeSeasonNpcScale()
end

function ClientHomelandSeasonNpc:isCampDailyRewardNpc()
	return tonumber(self.homeSeasonNpcType) == HOME_SEASON_NPC_TYPE_CAMP_DAILY
end

function ClientHomelandSeasonNpc:getHomeSeasonNpcInteractionId()
	if not self:isCampDailyRewardNpc() then
		return HomeSeasonConfigData.homeSeasonOrderNpcInterationId
	end

	return HomeSeasonConfigData.homeSeasonCampRewardNpcInterationId
end

function ClientHomelandSeasonNpc:canClaimHomeSeasonDailyCampReward()
	local dayKey = tonumber(pg.me and pg.me.homeSeasonDailyCampRewardDayKey) or 0
	local todayKey = TimeUtils.getServerDayBegin(Time.secondCache)

	return dayKey == 0 or dayKey ~= todayKey
end

function ClientHomelandSeasonNpc:canHomeSeasonNpcInteractive()
	local space = pg.me and pg.me.space

	if not space then
		return false
	end

	if self:isCampDailyRewardNpc() then
		return space.isSelfHomeCamp and space:isSelfHomeCamp(pg.me) and self:canClaimHomeSeasonDailyCampReward()
	end

	return space:isSelfHomeland(pg.me)
end

function ClientHomelandSeasonNpc:getInteractionListData()
	return self.interactionListData
end

function ClientHomelandSeasonNpc:npcFuncInteract(funcMenuId, index)
	if self:isCampDailyRewardNpc() then
		if not self:canHomeSeasonNpcInteractive() then
			return
		end

		return
	end

	local phase = self.homeSeasonNpcPhase or 0
	local npcConfig = HomeSeasonPumpkinData
	local pendingUpgradePhase = self.pendingUpgradePhase

	if pendingUpgradePhase then
		local pendingPhaseConfig = npcConfig[pendingUpgradePhase]

		self.pendingUpgradePhase = nil

		if pendingPhaseConfig and pendingPhaseConfig.upgradeDialogueId then
			pg.game.dialogue:playDialogueGraph(pendingPhaseConfig.upgradeDialogueId, nil, nil, {
				globalId = self:getGlobalId(),
				dialogueSrc = DialogueConst.SrcType.Interaction
			})

			return
		end
	end

	local pool = {}

	for currentPhase = 1, phase do
		local currentPhaseConfig = npcConfig[currentPhase]

		if currentPhaseConfig then
			local joinDialogueIds = currentPhaseConfig.joinDialogueIds or {}

			for _, dialogueId in ipairs(joinDialogueIds) do
				pool[dialogueId] = 1
			end
		end
	end

	if next(pool) == nil then
		return
	end

	local dialogueId = Lume.weightedchoice(pool)

	if not dialogueId then
		return
	end

	pg.game.dialogue:playDialogueGraph(dialogueId, nil, nil, {
		globalId = self:getGlobalId(),
		dialogueSrc = DialogueConst.SrcType.Interaction
	})
end

function ClientHomelandSeasonNpc:getHomeSeasonModelScale()
	if self:isCampDailyRewardNpc() then
		return nil
	end

	local phaseConfig = HomeSeasonPumpkinData[self.homeSeasonNpcPhase or 1]

	return phaseConfig and phaseConfig.modelScaleRange
end

function ClientHomelandSeasonNpc:refreshHomeSeasonNpcScale()
	if not self.eModel then
		return
	end

	local modelRoot = self.eModel.transform:Find("PlayerBody/ModelRoot")
	local PlayerBody = self.eModel.transform:Find("PlayerBody")

	if not modelRoot or not PlayerBody then
		return
	end

	local scale = self:getHomeSeasonModelScale()

	if not scale then
		if self:isCampDailyRewardNpc() then
			modelRoot.localScale = Vector3.New(1, 1, 1)
			PlayerBody.localScale = Vector3.New(1, 1, 1)

			if self.refreshTopLogoHeight then
				self:refreshTopLogoHeight()
			end
		end

		return
	end

	PlayerBody.localScale = Vector3.New(scale[1], scale[2], scale[3])
	modelRoot.localScale = Vector3.New(1, 1, 1)

	if self.refreshTopLogoHeight then
		self:refreshTopLogoHeight()
	end
end

function ClientHomelandSeasonNpc:onEModelCreateEffect()
	ClientHomelandSeasonNpc.super.onEModelCreateEffect(self)
	self:refreshHomeSeasonNpcScale()
end

function ClientHomelandSeasonNpc:onModelRefreshed()
	ClientHomelandSeasonNpc.super.onModelRefreshed(self)
	self:refreshHomeSeasonNpcScale()
end

function ClientHomelandSeasonNpc:on_homeSeasonNpcPhase_changed(ov, nv)
	local oldPhase = self.lastHomeSeasonNpcPhase or ov or 0
	local newPhase = nv or self.homeSeasonNpcPhase or 0

	self.lastHomeSeasonNpcPhase = newPhase

	self:refreshHomeSeasonNpcScale()

	if self:isCampDailyRewardNpc() then
		return
	end

	if oldPhase < newPhase and pg.me.space:isSelfHomeland(pg.me) then
		self.pendingUpgradePhase = newPhase
	end
end

function ClientHomelandSeasonNpc:getTopLogoFollowStrategy()
	return ClientUtils.getEntityTopLogoFollowStrategy(self)
end

function ClientHomelandSeasonNpc:getTopLogoHeight(strategy, entry)
	local height = ClientUtils.getEntityTopLogoHeight(self, strategy, entry)
	local scale = self:getHomeSeasonModelScale()
	local scaleY = scale and scale[2]

	if not height or not scaleY then
		return height
	end

	local offset = 2

	return height + scaleY * offset
end

return ClientHomelandSeasonNpc
