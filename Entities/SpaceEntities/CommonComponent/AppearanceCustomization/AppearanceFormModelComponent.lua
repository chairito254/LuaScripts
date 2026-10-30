-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceFormModelComponent.lua

local NoticeDef = require("Common.NoticeDef")
local Class = require("Core.Framework.Class")
local AppearanceSuitData = require("Data.appearance_suit_data")
local AppearanceFormConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormConfig")
local AppearanceFormModelComponent = Class.LiteClass("AppearanceFormModelComponent")

function AppearanceFormModelComponent:ctor(context)
	self.context = context
	self.owner = context.owner
end

function AppearanceFormModelComponent:getMembers(itemId, appearanceData, suitData)
	local suit = suitData and suitData[itemId]

	if suit and AppearanceFormConfig.isConfigTable(suit.appearanceList) then
		return suit.appearanceList
	end

	local config = appearanceData and appearanceData[itemId]

	return config and config.type == 2 and {
		itemId
	} or {}
end

function AppearanceFormModelComponent:getMaxIndex(config)
	local count = 0
	local resources = config and config.res1

	if AppearanceFormConfig.isConfigTable(resources) then
		for index = 1, 2 do
			if type(resources[index]) ~= "string" or resources[index] == "" then
				break
			end

			count = index
		end
	end

	return count
end

function AppearanceFormModelComponent:isWorn(itemId, config)
	if not config or config.type ~= 2 or not AppearanceFormConfig.isConfigTable(config.points) or #config.points == 0 then
		return false
	end

	for _, point in ipairs(config.points) do
		local currentId

		if type(self.owner.getAppearanceConfigId) == "function" then
			currentId = self.owner:getAppearanceConfigId(point, true, true)
		else
			currentId = self.owner.curShow and self.owner.curShow.customShow and self.owner.curShow.customShow[point]
		end

		if currentId ~= itemId then
			return false
		end
	end

	return true
end

function AppearanceFormModelComponent:getEffectiveIndex(config, index)
	return index <= self:getMaxIndex(config) and index or 0
end

function AppearanceFormModelComponent:getPartFormIndex(itemId, config)
	if not self.owner then
		return 0
	end

	local saved = self.context.model.data.formState and self.context.model.data.formState[itemId]

	if self.context.model.data.formState then
		return self:getEffectiveIndex(config, saved or 0)
	end

	if not self.owner or not self:isWorn(itemId, config) then
		return 0
	end

	local parts = self.owner.eModel and self.owner.eModel.modelModelViewPartModelInfo

	if not parts then
		return 0
	end

	for index = 1, self:getMaxIndex(config) do
		local matches = true

		for _, point in ipairs(config.points) do
			if parts:GetPartResId(point) ~= config.res1[index] then
				matches = false

				break
			end
		end

		if matches then
			return index
		end
	end

	return 0
end

function AppearanceFormModelComponent:captureState(appearanceData)
	local captured = {}
	local existing = self.context.model.data.formState

	if existing then
		for id, index in pairs(existing) do
			if self:isWorn(id, appearanceData[id]) then
				captured[id] = index
			end
		end
	else
		for id, config in pairs(appearanceData) do
			if config.type == 2 and self:isWorn(id, config) then
				captured[id] = self:getPartFormIndex(id, config)
			end
		end
	end

	return captured
end

function AppearanceFormModelComponent:clearCopiedState()
	if not self.context or self.context.disposed then
		return false, NoticeDef.ERROR_INVALID_STATUS
	end

	self.context.model.data.formRequest = nil
	self.context.model.data.formAnimation = nil

	local ok, err = self.context.resources:cancel()

	if not ok then
		return false, err
	end

	ok, err = self.context.resources:forget()

	if not ok then
		return false, err
	end

	self.context.model.data.formState = nil
	self.context.model.data.suitFormState = nil
	self.context.model.data.formSync = nil

	return true
end

function AppearanceFormModelComponent:copyState(target, appearanceData)
	assert(target, NoticeDef.ERROR_ENTITY_NOT_EXIST)
	assert(target.appearanceCustomization and not target.appearanceCustomization.disposed and not target.appearanceCustomizationDisposed, NoticeDef.ERROR_INVALID_STATUS)

	local ok, err = self.context.suitFormComponent:copyState(target, appearanceData, AppearanceSuitData)

	if not ok then
		error(err)
	end

	local copied = {}

	for id, index in pairs(self:captureState(appearanceData)) do
		local config = appearanceData[id]

		if self:isWorn(id, config) and target.appearanceCustomization.formModelComponent:isWorn(id, config) then
			copied[id] = self:getEffectiveIndex(config, index)
		end
	end

	target.appearanceCustomization.model.data.formState = copied
end

function AppearanceFormModelComponent:prune(appearanceData)
	if self.context.suitFormComponent:getState() then
		local ok, err = self.context.suitFormComponent:prune(appearanceData, AppearanceSuitData)

		if not ok then
			error(err)
		end
	end

	self.context.model.data.formState = self:captureState(appearanceData)
end

function AppearanceFormModelComponent:resolveResource(clothesId, config)
	local resource = self.context.suitFormComponent:resolveResource(clothesId, config)

	if resource then
		return resource
	end

	local index = self:getPartFormIndex(clothesId, config)

	index = self:getEffectiveIndex(config, index)

	return index > 0 and config.res1[index] or config.res
end

function AppearanceFormModelComponent:getSelectedIndex(itemId, appearanceData, suitData)
	local config = suitData and suitData[itemId] or appearanceData and appearanceData[itemId]

	if config and config.form ~= nil then
		return self.context.suitFormComponent:getSelectedIndex(itemId, appearanceData, suitData)
	end

	if not self.owner then
		return 0
	end

	local ids = self:getMembers(itemId, appearanceData, suitData)
	local count = 0

	for _, id in ipairs(ids) do
		count = math.max(count, self:getMaxIndex(appearanceData[id]))
	end

	for candidate = 0, count do
		local matches = true

		for _, id in ipairs(ids) do
			local config = appearanceData[id]

			if self:isWorn(id, config) then
				local selected = self:getPartFormIndex(id, config)

				if self:getEffectiveIndex(config, candidate) ~= selected then
					matches = false

					break
				end
			end
		end

		if matches then
			return candidate
		end
	end

	return nil
end

function AppearanceFormModelComponent:preview(itemId, index, appearanceData, suitData, onFailed)
	if not self.owner or pg and self.owner == pg.me then
		return false, NoticeDef.ERROR_INVALID_TARGET
	end

	local config = suitData and suitData[itemId] or appearanceData and appearanceData[itemId]

	if config and config.form ~= nil then
		return self.context.suitFormComponent:preview(itemId, index, appearanceData, suitData, nil, onFailed)
	end

	return self:apply(itemId, index, appearanceData, suitData)
end

function AppearanceFormModelComponent:apply(itemId, index, appearanceData, suitData)
	local config = suitData and suitData[itemId] or appearanceData and appearanceData[itemId]

	if config and config.form ~= nil then
		return self.context.suitFormComponent:apply(itemId, index, appearanceData, suitData)
	end

	if not self.owner or type(index) ~= "number" or index < 0 or index > 2 or index % 1 ~= 0 then
		return false
	end

	local view = self.owner.eModel and self.owner.eModel.modelModelView
	local parts = view and self.owner.eModel.modelModelViewPartModelInfo

	if not parts then
		return false
	end

	local ids = self:getMembers(itemId, appearanceData, suitData)
	local maximum = 0
	local changes = {}

	for _, id in ipairs(ids) do
		local config = appearanceData[id]

		maximum = math.max(maximum, self:getMaxIndex(config))

		if self:isWorn(id, config) then
			local selected = self:getEffectiveIndex(config, index)
			local resource = selected > 0 and config.res1[selected] or config.res

			if type(resource) ~= "string" or resource == "" then
				return false
			end

			local points = {}

			for i, point in ipairs(config.points) do
				points[i] = point
			end

			changes[#changes + 1] = {
				id = id,
				index = selected,
				res = resource,
				points = points
			}
		end
	end

	if #changes == 0 or maximum < index then
		return false
	end

	local nextState = self:captureState(appearanceData)
	local changed = false

	for _, change in ipairs(changes) do
		if parts:GetPartResId(change.points[1]) ~= change.res then
			parts:ModifyPartItem(change.res, change.points)

			changed = true
		end

		nextState[change.id] = change.index
	end

	self.context.model.data.formState = nextState

	if changed then
		self.context:refreshModels(view)
	end

	return true
end

function AppearanceFormModelComponent:getFullSuitFormCount(suitId, appearanceData, suitData)
	if not self.owner or not self.owner.curShow or not suitId or suitId <= 0 then
		return 0
	end

	local suit = suitData and suitData[suitId]

	if not suit or not AppearanceFormConfig.isConfigTable(suit.appearanceList) then
		return 0
	end

	local cachedSuitId = self.owner.curShow.suitId or 0

	if cachedSuitId ~= suitId then
		if cachedSuitId ~= 0 then
			return 0
		end

		if suit.hair and suit.hair ~= 0 or suit.makeup and suit.makeup ~= 0 or suit.kit and next(suit.kit) or suit.jewelryList and next(suit.jewelryList) then
			return 0
		end
	end

	local count = 0

	for _, id in ipairs(suit.appearanceList) do
		local config = appearanceData[id]

		if not config or cachedSuitId ~= suitId and config.type ~= 2 then
			return 0
		end

		if config.type == 2 then
			if not self:isWorn(id, config) then
				return 0
			end

			count = math.max(count, self:getMaxIndex(config))
		end
	end

	if suit.form ~= nil then
		local forms = self.context.suitFormComponent:getConfig(suitId, appearanceData, suitData)

		return forms and #forms or 0
	end

	return count
end

function AppearanceFormModelComponent:getWornFormSuitId(appearanceData, suitData)
	local show = self.owner and self.owner.curShow

	if not show then
		return 0
	end

	local cachedSuitId = show.suitId or 0

	if cachedSuitId > 0 then
		return cachedSuitId
	end

	local candidates = {}

	for _, itemId in pairs(show.customShow or {}) do
		local config = appearanceData and appearanceData[itemId]

		if config and config.type == 2 then
			for _, suitId in ipairs(config.suit or {}) do
				local suit = suitData and suitData[suitId]

				if suit and (not suit.body or table.contains(suit.body, self.owner.body)) then
					candidates[suitId] = true

					break
				end
			end
		end
	end

	local selected = 0

	for suitId in pairs(candidates) do
		if self:getFullSuitFormCount(suitId, appearanceData, suitData) > 0 and (selected == 0 or suitId < selected) then
			selected = suitId
		end
	end

	return selected
end

function AppearanceFormModelComponent:cycleFullSuit(suitId, appearanceData, suitData)
	local count = self:getFullSuitFormCount(suitId, appearanceData, suitData)

	if count == 0 then
		return false
	end

	local selected = self:getSelectedIndex(suitId, appearanceData, suitData) or 0
	local nextIndex = (selected + 1) % (count + 1)
	local ok, err = self:apply(suitId, nextIndex, appearanceData, suitData)

	if not ok then
		return false, err
	end

	return true, nextIndex
end

function AppearanceFormModelComponent:destroy()
	if not self.context then
		return
	end

	self.context.model.data.formState = nil
	self.owner = nil
	self.context = nil
end

return AppearanceFormModelComponent
