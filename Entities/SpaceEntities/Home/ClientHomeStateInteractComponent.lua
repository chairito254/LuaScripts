-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\Home\\ClientHomeStateInteractComponent.lua

local Class = require("Core.Framework.Class")
local InteractionConst = require("Common.Const.InteractionConst")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local ClientHomeStateInteractComponent = Class.Component("ClientHomeStateInteractComponent")

function ClientHomeStateInteractComponent:init(dict)
	self._needStateInteraction = HomeLandUtils.getHomeInteractionConfig(self.homeTemplateId) ~= nil

	return true
end

function ClientHomeStateInteractComponent:EVENT_InitInteractionList()
	if not self._needStateInteraction then
		return
	end

	local entries = HomeLandUtils.getHomeInteractionConfig(self.homeTemplateId)
	local configData = self:getConfigData()

	self.interactionListData = self.interactionListData or {}

	for entryId, entry in ipairs(entries) do
		table.insert(self.interactionListData, {
			skipHomelandCheck = true,
			interactionType = InteractionConst.INTERACTION_TYPE_ENT_FUNC,
			globalId = self:getGlobalId(),
			actionPrototypeId = entry.actionPrototypeId,
			overrideInteractDis = configData.interactDistance,
			canInteractiveFunc = function()
				return self:getOrnamentInteractionState() == entry.fromState
			end,
			interactFunc = function()
				self:doSwitchInteract(entryId)
			end
		})
	end
end

function ClientHomeStateInteractComponent:EVENT_onModelLoaded()
	if not self._needStateInteraction then
		return
	end

	local state = self:getOrnamentInteractionState()

	if state ~= 0 then
		HomeLandUtils.restoreHomeInteractionState(self, state)
	end
end

function ClientHomeStateInteractComponent:_getOrnamentOwnerEntity()
	local homeSpace = HomeLandUtils.getHomeSpace(self)

	if homeSpace and homeSpace.ornamentInteractionStateMap then
		return homeSpace
	end

	if self.carGroup and self.carGroup.campCarEnt then
		return self.carGroup.campCarEnt
	end

	return nil
end

function ClientHomeStateInteractComponent:getOrnamentInteractionState()
	if not self._needStateInteraction then
		return 0
	end

	local owner = self:_getOrnamentOwnerEntity()

	if not owner then
		return 0
	end

	local states = owner.ornamentInteractionStateMap

	if not states then
		return
	end

	return states[self.ornamentId] or 0
end

function ClientHomeStateInteractComponent:isOrnamentSwitchOpen()
	local state = self:getOrnamentInteractionState()

	return state ~= nil and state ~= 0
end

function ClientHomeStateInteractComponent:doSwitchInteract(entryId)
	local owner = self:_getOrnamentOwnerEntity()

	if owner and owner.changeOrnamentSwitch then
		owner:changeOrnamentSwitch(self.ornamentId, entryId)
	end
end

function ClientHomeStateInteractComponent:onOrnamentInteractionStateChanged(oldState, newState)
	if not self._needStateInteraction or not self.isModelLoaded then
		return
	end

	local entry = HomeLandUtils.getHomeInteractionTransition(self.homeTemplateId, oldState, newState)

	if not entry then
		return
	end

	HomeLandUtils.applyHomeInteractionEntry(self, entry, false)
	pg.game.home:markShadowLightDirty()
end

return ClientHomeStateInteractComponent
