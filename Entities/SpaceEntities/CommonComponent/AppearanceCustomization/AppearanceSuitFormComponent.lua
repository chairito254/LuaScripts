-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceSuitFormComponent.lua

local NoticeDef = require("Common.NoticeDef")
local Class = require("Core.Framework.Class")
local AppearanceFormConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormConfig")
local AppearanceSuitFormData = require("Data.appearance_suit_form_data")
local logger = require("Core.Log.LoggerManager").getLogger("AppearanceSuitFormComponent")
local AppearanceSuitFormComponent = Class.LiteClass("AppearanceSuitFormComponent")

function AppearanceSuitFormComponent:ctor(context)
	self.context = context
	self.owner = context.owner
end

function AppearanceSuitFormComponent:getConfig(itemId, appearanceData, suitData, formData)
	local config = suitData and suitData[itemId] or appearanceData and appearanceData[itemId]

	if not config or config.form == nil then
		return {}
	end

	return AppearanceFormConfig.buildList(config.form, formData or AppearanceSuitFormData)
end

function AppearanceSuitFormComponent:isWorn(itemId, appearanceData, suitData)
	if not self.owner then
		return false
	end

	local suit = suitData and suitData[itemId]
	local ids = suit and suit.appearanceList or {
		itemId
	}

	if not AppearanceFormConfig.isConfigTable(ids) or #ids == 0 then
		return false
	end

	local authoritative = self.owner.curShow and self.owner.curShow.suitId == itemId

	if suit and not authoritative then
		local cached = self.owner.curShow and self.owner.curShow.suitId or 0

		if cached ~= 0 or suit.hair and suit.hair ~= 0 or suit.makeup and suit.makeup ~= 0 or suit.kit and next(suit.kit) or suit.jewelryList and next(suit.jewelryList) then
			return false
		end
	end

	local hasClothes = false

	for _, id in ipairs(ids) do
		local config = appearanceData[id]

		if not config or config.type ~= 2 and not authoritative then
			return false
		end

		if config.type == 2 then
			hasClothes = true

			if not self.context.formModelComponent:isWorn(id, config) then
				return false
			end
		end
	end

	return hasClothes
end

function AppearanceSuitFormComponent:getAppearanceAt(point)
	if type(self.owner.getAppearanceConfigId) == "function" then
		return self.owner:getAppearanceConfigId(point, true, true) or 0
	end

	return self.owner.curShow and self.owner.curShow.customShow and self.owner.curShow.customShow[point] or 0
end

function AppearanceSuitFormComponent:capturePreviewBase(appearanceData)
	local slots = {}

	for _, config in pairs(appearanceData) do
		for _, point in ipairs(config.points or {}) do
			if slots[point] == nil then
				slots[point] = self:getAppearanceAt(point)
			end
		end
	end

	return {
		suitId = self.owner.curShow and self.owner.curShow.suitId or 0,
		slots = slots
	}
end

function AppearanceSuitFormComponent:previewBaseMatches(state)
	if not state.preview then
		return true
	end

	local base = state.previewBase

	if not base or base.suitId ~= (self.owner.curShow and self.owner.curShow.suitId or 0) then
		return false
	end

	for point, id in pairs(base.slots) do
		if self:getAppearanceAt(point) ~= id then
			return false
		end
	end

	return true
end

function AppearanceSuitFormComponent:getState()
	return self.context and self.context.model.data.suitFormState
end

function AppearanceSuitFormComponent:getSelectedIndex(itemId, appearanceData, suitData)
	local state = self:getState()

	if not state or not self:previewBaseMatches(state) or not state.preview and not self:isWorn(state.itemId, appearanceData, suitData) then
		return 0
	end

	if state.itemId == itemId then
		return state.index
	end

	return 0
end

function AppearanceSuitFormComponent:handleApplyFailure(request, previous, itemId, index, isCanceled, onFailed)
	if not self.context or self.context.disposed or self.context.model.data.formRequest ~= request then
		return
	end

	self.context.model.data.formRequest = nil
	self.context.model.data.formAnimation = nil

	self.context.model:rollbackSuitFormState(itemId, previous)

	if self.owner.refreshAppearanceAttachEffects then
		self.owner:refreshAppearanceAttachEffects()
	end

	if not isCanceled then
		logger:error("suit form load failed: itemId=%s index=%s noticeId=%s", tostring(itemId), tostring(index), tostring(NoticeDef.ERROR_SERVICE_CALLBACK))

		if pg and pg.global then
			pg.global.showBubbleMessageRaw(pg.getGameString("FORM_LOAD_FAIL_TOAST"))
		end

		if onFailed then
			onFailed()
		end
	end
end

function AppearanceSuitFormComponent:applyForm(itemId, index, appearanceData, suitData, formData, preview, onFailed)
	if type(index) ~= "number" or index < 0 or index % 1 ~= 0 then
		return false, NoticeDef.ERROR_CLIENT_PARAM
	end

	if not self.owner or not self.context or self.context.disposed then
		return false, NoticeDef.ERROR_ENTITY_NOT_EXIST
	end

	if preview and pg and self.owner == pg.me then
		return false, NoticeDef.ERROR_INVALID_TARGET
	end

	if not preview and not self:isWorn(itemId, appearanceData, suitData) then
		return false, NoticeDef.ERROR_INVALID_STATUS
	end

	local list, err = self:getConfig(itemId, appearanceData, suitData, formData)

	if not list then
		return false, err
	end

	if index > #list then
		return false, NoticeDef.ERROR_CLIENT_PARAM
	end

	self.context.model.data.formAnimation = nil

	local canceled, cancelError = self.context.resources:cancel()

	if not canceled then
		return false, cancelError
	end

	local previous = self.context.model.data.suitFormState
	local request = {}

	self.context.model.data.formRequest = request
	self.context.model.data.suitFormState = index > 0 and {
		itemId = itemId,
		index = index,
		form = list[index],
		appearanceData = appearanceData,
		suitData = suitData,
		preview = preview or nil,
		previewBase = preview and self:capturePreviewBase(appearanceData) or nil
	} or nil

	local function onLoadFailed(isCanceled)
		self:handleApplyFailure(request, previous, itemId, index, isCanceled, onFailed)
	end

	local ok

	if index == 0 then
		ok, err = self.context.resources:restore(onLoadFailed)
	else
		ok, err = self.context.resources:apply(list[index], onLoadFailed)
	end

	if not ok then
		self.context.model.data.suitFormState = previous
	end

	if self.owner.refreshAppearanceAttachEffects then
		self.owner:refreshAppearanceAttachEffects()
	end

	if not ok then
		return false, err
	end

	if previous and (previous.itemId ~= itemId or previous.index ~= index) then
		local previousPlayable = previous.form.playable

		if previousPlayable and previousPlayable ~= "" and self.owner.stopAnimation then
			self.owner:stopAnimation(previousPlayable, 0)
		end
	end

	return true
end

function AppearanceSuitFormComponent:apply(itemId, index, appearanceData, suitData, formData)
	return self:applyForm(itemId, index, appearanceData, suitData, formData, false)
end

function AppearanceSuitFormComponent:preview(itemId, index, appearanceData, suitData, formData, onFailed)
	return self:applyForm(itemId, index, appearanceData, suitData, formData, true, onFailed)
end

function AppearanceSuitFormComponent:copyState(target, appearanceData, suitData)
	assert(target, NoticeDef.ERROR_ENTITY_NOT_EXIST)
	assert(target.appearanceCustomization and not target.appearanceCustomization.disposed and not target.appearanceCustomizationDisposed, NoticeDef.ERROR_INVALID_STATUS)

	local state = self:getState()

	if state and state.preview and pg and target == pg.me then
		return false, NoticeDef.ERROR_INVALID_TARGET
	end

	if not state or state.preview or not self:isWorn(state.itemId, appearanceData, suitData) or not target.appearanceCustomization.suitFormComponent:isWorn(state.itemId, appearanceData, suitData) then
		target.appearanceCustomization.model.data.formAnimation = nil
		target.appearanceCustomization.model.data.suitFormState = nil

		target.appearanceCustomization.resources:forget()

		return true
	end

	local ok, err = self.context.resources:copyState(target)

	if not ok then
		return false, err
	end

	ok, err = target.appearanceCustomization.resources:apply(state.form)

	if not ok then
		local restored, restoreError = target.appearanceCustomization.resources:restore()

		target.appearanceCustomization.model.data.formAnimation = nil
		target.appearanceCustomization.model.data.suitFormState = nil

		if target.refreshAppearanceAttachEffects then
			target:refreshAppearanceAttachEffects()
		end

		if not restored then
			logger:error("%s; %s", tostring(err), tostring(restoreError))

			return false, restoreError
		end

		return false, err
	end

	target.appearanceCustomization.model.data.suitFormState = {
		itemId = state.itemId,
		index = state.index,
		form = state.form,
		appearanceData = appearanceData,
		suitData = suitData
	}

	return true
end

function AppearanceSuitFormComponent:prune(appearanceData, suitData)
	local state = self:getState()

	if state and (not self:previewBaseMatches(state) or not state.preview and not self:isWorn(state.itemId, appearanceData, suitData)) then
		self.context.model.data.formAnimation = nil

		local ok, err = self.context.resources:restore()

		if not ok then
			return false, err
		end

		self.context.model.data.suitFormState = nil
	end

	return true
end

function AppearanceSuitFormComponent:beforeRebuild()
	self.context.model.data.formAnimation = nil

	if self.context.model.data.suitFormState then
		local ok, err = self.context.resources:restore()

		if ok then
			self.context.model.data.suitFormState.rebuilding = true
		end

		return ok, err
	end

	return true
end

function AppearanceSuitFormComponent:afterRebuild(appearanceData, suitData)
	local state = self:getState()

	if not state then
		return true
	end

	self.context.resources:forget()

	state.rebuilding = nil

	if not self:previewBaseMatches(state) or not state.preview and not self:isWorn(state.itemId, appearanceData, suitData) then
		self.context.model.data.suitFormState = nil

		return true
	end

	return self.context.resources:apply(state.form)
end

function AppearanceSuitFormComponent:resolveResource(itemId, config, partId)
	local state = self:getState()

	if not state or state.rebuilding or not self:previewBaseMatches(state) then
		return nil
	end

	if not state.preview and not self.context.formModelComponent:isWorn(itemId, config) then
		return nil
	end

	local requiredPoints = partId and {
		partId
	} or config.points

	for _, row in ipairs(state.form.rows) do
		local matches = true

		for _, point in ipairs(requiredPoints or {}) do
			local found = false

			for _, formPoint in ipairs(row.points) do
				if formPoint == point then
					found = true

					break
				end
			end

			if not found then
				matches = false

				break
			end
		end

		if matches and requiredPoints and #requiredPoints > 0 then
			return row.res
		end
	end

	return nil
end

function AppearanceSuitFormComponent:getActions()
	local state = self:getState()

	return state and not state.preview and self:isWorn(state.itemId, state.appearanceData, state.suitData) and state.form.action or {}
end

function AppearanceSuitFormComponent:getPlayable(itemId)
	local state = self:getState()

	return state and self:previewBaseMatches(state) and state.itemId == itemId and (state.preview or self:isWorn(itemId, state.appearanceData, state.suitData)) and state.form.playable or nil
end

function AppearanceSuitFormComponent:requestSwitchAnimation(itemId, onReady)
	if not self.context or self.context.disposed or not self.owner then
		return false
	end

	local data = self.context.model.data

	data.formAnimation = nil

	local state = data.suitFormState
	local view = self.owner.eModel and self.owner.eModel.modelModelView
	local playable = self:getPlayable(itemId)

	if not state or state.preview and not onReady or not data.formRequest or not view or not playable or playable == "" then
		return false
	end

	data.formAnimation = {
		request = data.formRequest,
		itemId = itemId,
		playable = playable,
		view = view,
		state = state,
		onReady = onReady
	}

	return self:tryPlaySwitchAnimation()
end

function AppearanceSuitFormComponent:tryPlaySwitchAnimation()
	if not self.context or self.context.disposed or not self.owner then
		return false
	end

	local data = self.context.model.data
	local animation = data.formAnimation

	if not animation then
		return false
	end

	local view = self.owner.eModel and self.owner.eModel.modelModelView

	if data.formRequest ~= animation.request or data.suitFormState ~= animation.state or view ~= animation.view or self:getPlayable(animation.itemId) ~= animation.playable then
		data.formAnimation = nil

		return false
	end

	if not view.firstLoaded or not view:IsAnimatorRead() then
		return false
	end

	data.formAnimation = nil

	if animation.onReady then
		animation.onReady(animation.playable)
	else
		self.owner:playTrivialAnimation(animation.playable)
	end

	return true
end

function AppearanceSuitFormComponent:destroy()
	if not self.context then
		return
	end

	self.context.model.data.formRequest = nil
	self.context.model.data.formAnimation = nil
	self.context.model.data.suitFormState = nil
	self.owner = nil
	self.context = nil
end

return AppearanceSuitFormComponent
