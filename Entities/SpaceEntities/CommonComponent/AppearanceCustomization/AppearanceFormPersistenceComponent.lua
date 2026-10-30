-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceFormPersistenceComponent.lua

local NoticeDef = require("Common.NoticeDef")
local Class = require("Core.Framework.Class")
local AppearanceSuitData = require("Data.appearance_suit_data")
local AppearanceData = require("Data.appearance_data")
local AppearanceFormPersistenceComponent = Class.LiteClass("AppearanceFormPersistenceComponent")

function AppearanceFormPersistenceComponent:ctor(context)
	self.context = context
	self.owner = context.owner
end

function AppearanceFormPersistenceComponent:getSession()
	local view = self.owner.eModel and self.owner.eModel.modelModelView

	return self.context.model:getFormSync(view)
end

function AppearanceFormPersistenceComponent:getAuthoritativeForm(player, suitId)
	return self.context.model:getServerForm(suitId, player)
end

function AppearanceFormPersistenceComponent:onServerChanged()
	if not self.owner or not self.context then
		return
	end

	local current = self:getSession()

	current.queued = nil
	current.localSelection = nil
	current.attempted = {}
	current.errors = {}
end

function AppearanceFormPersistenceComponent:observeLocalSelection(current, suitId, serverFormId)
	if current.suitId ~= suitId then
		current.suitId = suitId
		current.observed = {}
		current.attempted = {}
		current.errors = {}
	end

	current.localSelection = {
		suitId = suitId,
		serverFormId = serverFormId
	}
end

function AppearanceFormPersistenceComponent:reportOnce(current, key, message)
	if current.errors[key] == message then
		return true
	end

	current.errors[key] = message

	return false, message
end

function AppearanceFormPersistenceComponent:sendForm(player, current, suitId, formId)
	local submissions = self.context.model.data.formSubmissions

	if not submissions then
		submissions = {}
		self.context.model.data.formSubmissions = submissions
	end

	local lastSubmittedFormId = submissions[suitId]
	local serverFormId = self:getAuthoritativeForm(player, suitId)

	if serverFormId == formId and (lastSubmittedFormId == nil or lastSubmittedFormId == formId) then
		return true
	end

	if type(player.serverMsg) ~= "function" then
		current.localSelection = nil

		return false, NoticeDef.ERROR_INVALID_CONTEXT
	end

	local ok, err = pcall(player.serverMsg, player, "RPC_CS_SetAppearanceSuitForm", suitId, formId)

	if not ok then
		current.localSelection = nil

		return false, err
	end

	self:observeLocalSelection(current, suitId, serverFormId)

	submissions[suitId] = formId
	current.attempted[suitId] = nil
	current.errors[suitId] = nil

	return true
end

function AppearanceFormPersistenceComponent:save(suitId, index)
	local suit = AppearanceSuitData[suitId]

	if not suit or suit.form == nil then
		return true
	end

	if not self.owner then
		return false, NoticeDef.ERROR_ENTITY_NOT_EXIST
	end

	if type(index) ~= "number" or index < 0 or index % 1 ~= 0 then
		return false, NoticeDef.ERROR_CLIENT_PARAM
	end

	local current = self:getSession()

	current.queued = nil

	local formId = index == 0 and 0 or suit.form[index]

	if index ~= 0 and (type(formId) ~= "number" or formId <= 0) then
		return false, NoticeDef.ERROR_CLIENT_PARAM
	end

	if not self.context.suitFormComponent:isWorn(suitId, AppearanceData, AppearanceSuitData) then
		return false, NoticeDef.ERROR_INVALID_STATUS
	end

	if not current.view then
		return false, NoticeDef.ERROR_INVALID_CONTEXT
	end

	if not current.view.firstLoaded then
		current.queued = {
			suitId = suitId,
			index = index,
			formId = formId
		}

		return true
	end

	current.queued = nil

	return self:sendForm(self.owner, current, suitId, formId)
end

function AppearanceFormPersistenceComponent:restorePreview(suitId)
	local player = self.owner and self.owner.copyEntity

	if not player or player == self.owner then
		return true
	end

	local suit = AppearanceSuitData[suitId]

	if not suit or suit.form == nil then
		return true
	end

	local formId = self:getAuthoritativeForm(player, suitId)

	if formId == nil then
		return true
	end

	local index = formId == 0 and 0 or nil

	for candidate, id in ipairs(suit.form) do
		if id == formId then
			index = candidate

			break
		end
	end

	if index == nil then
		return false, NoticeDef.ERROR_CONFIG_NIL
	end

	local state = self.context.suitFormComponent:getState()

	if (not state or state.itemId == suitId) and self.context.suitFormComponent:getSelectedIndex(suitId, AppearanceData, AppearanceSuitData) == index then
		return true
	end

	return self.context.suitFormComponent:preview(suitId, index, AppearanceData, AppearanceSuitData)
end

function AppearanceFormPersistenceComponent:restore()
	if not self.owner then
		return true
	end

	local current = self:getSession()

	if not current.view or not current.view.firstLoaded then
		return true
	end

	local queued = current.queued

	if queued then
		current.queued = nil

		if self.context.suitFormComponent:isWorn(queued.suitId, AppearanceData, AppearanceSuitData) and self.context.suitFormComponent:getSelectedIndex(queued.suitId, AppearanceData, AppearanceSuitData) == queued.index then
			local ok, err = self:sendForm(self.owner, current, queued.suitId, queued.formId)

			if not ok then
				return false, err
			end
		end
	end

	local suitId = self.context.formModelComponent:getWornFormSuitId(AppearanceData, AppearanceSuitData)

	if current.suitId ~= suitId then
		current.suitId = suitId
		current.localSelection = nil
		current.observed = {}
		current.attempted = {}
		current.errors = {}
	end

	local suit = AppearanceSuitData[suitId]

	if not suit or suit.form == nil or not self.context.suitFormComponent:isWorn(suitId, AppearanceData, AppearanceSuitData) then
		return true
	end

	local formId = self:getAuthoritativeForm(self.owner, suitId)

	if formId == nil then
		return true
	end

	local submissions = self.context.model.data.formSubmissions

	if submissions and submissions[suitId] == formId then
		submissions[suitId] = nil

		if next(submissions) == nil then
			self.context.model.data.formSubmissions = nil
		end
	end

	local localSelection = current.localSelection

	if localSelection then
		if localSelection.suitId == suitId and localSelection.serverFormId == formId then
			return true
		end

		current.localSelection = nil
	end

	if current.observed[suitId] ~= formId then
		current.observed[suitId] = formId
		current.attempted[suitId] = nil
		current.errors[suitId] = nil
	end

	local index = formId == 0 and 0 or nil

	for candidate, id in ipairs(suit.form) do
		if id == formId then
			index = candidate

			break
		end
	end

	if index == nil then
		return self:reportOnce(current, suitId, NoticeDef.ERROR_CONFIG_NIL)
	end

	local state = self.context.suitFormComponent:getState()
	local selectedIndex = self.context.suitFormComponent:getSelectedIndex(suitId, AppearanceData, AppearanceSuitData)
	local attempt = current.attempted[suitId]
	local matchesServer = selectedIndex == index and (not state or state.itemId == suitId)

	if not matchesServer and (not state or not state.rebuilding) and (not attempt or attempt.formId ~= formId or attempt.state ~= state) then
		local ok, err = self.context.suitFormComponent:apply(suitId, index, AppearanceData, AppearanceSuitData)

		current.attempted[suitId] = {
			formId = formId,
			state = self.context.suitFormComponent:getState()
		}

		if not ok then
			return self:reportOnce(current, suitId, err)
		end
	end

	return true
end

function AppearanceFormPersistenceComponent:destroy()
	self.owner = nil
	self.context = nil
end

return AppearanceFormPersistenceComponent
