-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceCustomizationModel.lua

local Class = require("Core.Framework.Class")
local EMPTY_TABLE = require("Core.Common.EmptyTable")
local AppearanceCustomizationModel = Class.LiteClass("AppearanceCustomizationModel")

function AppearanceCustomizationModel:ctor(owner)
	self.owner = owner
	self.disposed = false
	self.data = {}
end

function AppearanceCustomizationModel:getServerEntity()
	return self.owner and (self.owner.copyEntity or self.owner)
end

function AppearanceCustomizationModel:getServerForm(suitId, player)
	if not self.owner then
		return nil
	end

	player = player or self:getServerEntity()

	if not player or suitId == nil then
		return nil
	end

	local show = player.curShow
	local formId

	if show and show.suitId == suitId and show.formId ~= nil then
		formId = show.formId
	elseif player.suitFormInfos ~= nil then
		formId = player.suitFormInfos[suitId] or 0
	end

	return formId
end

function AppearanceCustomizationModel:getServerTailor(itemId)
	local player = self:getServerEntity()

	if not player then
		return nil
	end

	local show = player.curShow
	local worn = false

	for _, id in pairs(show and show.customShow or {}) do
		if id == itemId then
			worn = true

			break
		end
	end

	local index

	if show and show.tailorInfos ~= nil and (worn or player.tailorInfos == nil) then
		index = show.tailorInfos[itemId] or 0
	elseif player.tailorInfos ~= nil then
		index = player.tailorInfos[itemId] or 0
	end

	return index
end

function AppearanceCustomizationModel:getFormSync(view)
	if not self.owner then
		return nil
	end

	local current = self.data.formSync

	if not current or current.view ~= view then
		current = {
			view = view,
			attempted = {},
			observed = {},
			errors = {}
		}
		self.data.formSync = current
	end

	return current
end

function AppearanceCustomizationModel:rollbackSuitFormState(itemId, previous)
	if self.disposed then
		return
	end

	local failed = self.data.suitFormState

	self.data.suitFormState = previous

	local sync = self.data.formSync
	local attempted = sync and sync.attempted[itemId]

	if attempted and attempted.state == failed then
		attempted.state = previous
	end
end

function AppearanceCustomizationModel:destroy()
	if self.disposed then
		return
	end

	self.disposed = true
	self.owner = nil

	local data = self.data

	self.data = EMPTY_TABLE

	for key in pairs(data) do
		data[key] = nil
	end
end

return AppearanceCustomizationModel
