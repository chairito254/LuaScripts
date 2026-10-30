-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceTailorComponent.lua

local NoticeDef = require("Common.NoticeDef")
local AppearanceFormConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormConfig")
local Class = require("Core.Framework.Class")
local AppearanceTailorConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceTailorConfig")
local AppearanceData = require("Data.appearance_data")
local AppearanceTailorComponent = Class.LiteClass("AppearanceTailorComponent")

function AppearanceTailorComponent:ctor(context)
	self.context = context
	self.owner = context.owner
end

function AppearanceTailorComponent:getMeshes(config, index)
	if not config or config.type ~= 2 or not AppearanceFormConfig.isConfigTable(config.tailor) or type(index) ~= "number" or index < 0 or index % 1 ~= 0 then
		return nil
	end

	if index == 0 then
		return {}
	end

	local option = AppearanceTailorConfig.getOption(config, index)

	return option and option.meshes
end

function AppearanceTailorComponent:isDefaultForm(itemId)
	local state = self.context.suitFormComponent:getState()

	if not state or self.context.suitFormComponent:getSelectedIndex(state.itemId, state.appearanceData, state.suitData) == 0 then
		return true
	end

	for _, memberId in ipairs(self.context.formModelComponent:getMembers(state.itemId, state.appearanceData, state.suitData)) do
		if memberId == itemId then
			return false
		end
	end

	return true
end

function AppearanceTailorComponent:apply(itemId, index, config)
	if not self.owner or not self.context or self.context.disposed then
		return
	end

	local meshes = self:getMeshes(config, index)

	if not meshes or not self.context.formModelComponent:isWorn(itemId, config) then
		return
	end

	if not self:isDefaultForm(itemId) then
		meshes = {}
	end

	local view = self.owner.eModel and self.owner.eModel.modelModelView
	local parts = view and self.owner.eModel.modelModelViewPartModelInfo
	local partModel = view and view.partModel
	local point = config.points and config.points[1]

	if not parts or not partModel or not point or not partModel:IsPartModelLoaded(point) then
		return
	end

	if parts:GetPartResId(point) ~= config.res then
		return
	end

	local visibility = {}

	for optionIndex in ipairs(config.tailor) do
		local option = AppearanceTailorConfig.getOption(config, optionIndex)

		if option then
			for _, name in ipairs(option.meshes) do
				visibility[name] = true
			end
		end
	end

	for name in pairs(visibility) do
		partModel:SetRenderVisibleBySuffix(point, name, true)
	end

	for _, name in ipairs(meshes) do
		partModel:SetRenderVisibleBySuffix(point, name, false)
	end
end

function AppearanceTailorComponent:getSavedIndex(itemId)
	if not self.owner then
		return 0
	end

	return self.context.model:getServerTailor(itemId) or 0
end

function AppearanceTailorComponent:getSelectedIndex(itemId)
	local choice = self.owner and self.owner.copyEntity and self.owner.copyEntity ~= self.owner and self.context.model.data.tailorSelections

	if choice and choice[itemId] ~= nil then
		return choice[itemId]
	end

	return self:getSavedIndex(itemId)
end

function AppearanceTailorComponent:select(itemId, index, appearanceData)
	local config = appearanceData[itemId]

	if not self.owner or not self.context or self.context.disposed or not self.owner.eModel or not self:getMeshes(config, index) or not AppearanceTailorConfig.isUnlocked(self.owner, itemId, index, appearanceData) or not self.context.formModelComponent:isWorn(itemId, config) then
		return false
	end

	local view = self.owner.eModel.modelModelView
	local parts = view and self.owner.eModel.modelModelViewPartModelInfo
	local point = config.points and config.points[1]

	if not parts or not view.partModel or not point then
		return false
	end

	local isPreview = self.owner.copyEntity and self.owner.copyEntity ~= self.owner

	if not isPreview and (parts:GetPartResId(point) ~= config.res or not self:isDefaultForm(itemId)) then
		return false
	end

	local nextSelection = {}

	for id, selected in pairs(self.context.model.data.tailorSelections or {}) do
		nextSelection[id] = selected
	end

	nextSelection[itemId] = index
	self.context.model.data.tailorSelections = nextSelection

	if self:isDefaultForm(itemId) then
		self:apply(itemId, index, config)
	end

	return true
end

function AppearanceTailorComponent:submit()
	local choices = self.owner and self.context.model.data.tailorSelections

	if not choices or next(choices) == nil then
		return true
	end

	local player = self.owner.copyEntity or self.owner
	local changes = {}

	for itemId, index in pairs(choices) do
		if index ~= self:getSavedIndex(itemId) then
			if not AppearanceTailorConfig.isUnlocked(self.owner, itemId, index, AppearanceData) then
				return false, NoticeDef.FUNC_NOT_UNLOCK
			end

			changes[itemId] = index
		end
	end

	if next(changes) == nil then
		self.context.model.data.tailorSelections = nil

		return true
	end

	if type(player.serverMsg) ~= "function" then
		return false, NoticeDef.ERROR_INVALID_CONTEXT
	end

	local ok, err = pcall(player.serverMsg, player, "RPC_CS_SetAppearanceTaiors", changes)

	if not ok then
		return false, err
	end

	self.context.model.data.tailorSelections = nil

	return true
end

function AppearanceTailorComponent:reapply(appearanceData)
	if not self.owner then
		return
	end

	local ids = {}

	for itemId in pairs(self.context.model.data.tailorSelections or {}) do
		ids[itemId] = true
	end

	local show = self.owner.curShow

	for _, slots in ipairs({
		self.owner.customShow or {},
		self.owner.customShowPreview or {},
		show and show.customShow or {}
	}) do
		for _, itemId in pairs(slots) do
			ids[itemId] = true
		end
	end

	for itemId in pairs(ids) do
		self:apply(itemId, self:getSelectedIndex(itemId), appearanceData[itemId])
	end
end

function AppearanceTailorComponent:destroy()
	if not self.context then
		return
	end

	self.context.model.data.tailorSelections = nil
	self.owner = nil
	self.context = nil
end

return AppearanceTailorComponent
