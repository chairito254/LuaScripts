-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceFormResourceComponent.lua

local NoticeDef = require("Common.NoticeDef")
local Class = require("Core.Framework.Class")
local AppearanceData = require("Data.appearance_data")
local json = require("json")
local AppearanceFormBridgeMethod = {
	Plan = "Plan",
	Forget = "Forget",
	CopyState = "CopyState",
	Cancel = "Cancel",
	Restore = "Restore",
	Apply = "Apply"
}
local AppearanceFormResourceComponent = Class.LiteClass("AppearanceFormResourceComponent")

function AppearanceFormResourceComponent:ctor(context)
	self.context = context
	self.owner = context.owner
end

function AppearanceFormResourceComponent:viewOf(entity)
	return entity and entity.eModel and entity.eModel.modelModelView
end

function AppearanceFormResourceComponent:bridgeCall(method, ...)
	local args = {
		...
	}
	local count = select("#", ...)
	local ok, result = pcall(function()
		local bridge = CS.FunPlus.WorldX.Model.AppearanceFormResourceBridge

		return bridge[method](unpack(args, 1, count))
	end)

	if not ok then
		return false, result
	end

	if method == AppearanceFormBridgeMethod.Forget then
		return true
	end

	if result == true then
		return true
	end

	return false, NoticeDef.ERROR_SERVICE_CALLBACK
end

function AppearanceFormResourceComponent:prepareRequest(entity, form)
	if not self:viewOf(entity) then
		return nil, NoticeDef.ERROR_INVALID_CONTEXT
	end

	if not form or type(form.rows) ~= "table" or #form.rows == 0 then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	local request = {
		id = form.id,
		rows = {},
		occupiedSlots = {}
	}

	for _, row in ipairs(form.rows) do
		if type(row.res) ~= "string" or row.res == "" or type(row.points) ~= "table" or #row.points == 0 then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		local points = {}

		for i, point in ipairs(row.points) do
			points[i] = point
		end

		local copied = {
			index = row.index,
			res = row.res,
			points = points
		}

		if points[1] == 201 then
			for _, config in pairs(AppearanceData) do
				if config.type == 5 and config.res == row.res and config.socket then
					copied.socket = config.socket

					break
				end
			end
		end

		request.rows[#request.rows + 1] = copied
	end

	for point = 101, 201 do
		if point <= 110 or point == 201 then
			local id

			if type(entity.getAppearanceConfigId) == "function" then
				id = entity:getAppearanceConfigId(point, true, true)
			else
				id = entity.curShow and entity.curShow.customShow and entity.curShow.customShow[point]
			end

			local config = id and AppearanceData[id]

			if config and config.res then
				request.occupiedSlots[#request.occupiedSlots + 1] = {
					point = point,
					res = config.res
				}
			end
		end
	end

	if #request.occupiedSlots == 0 then
		request.occupiedSlots = nil
	end

	return request
end

function AppearanceFormResourceComponent:invokeForm(method, entity, form, onFailed)
	local request, err = self:prepareRequest(entity, form)

	if not request then
		return false, err
	end

	local avatarJson = entity.avatarConfig

	if avatarJson and avatarJson ~= "" then
		avatarJson = decompressFromStr(avatarJson)
	end

	local ok, bridgeError

	if method == AppearanceFormBridgeMethod.Apply then
		ok, bridgeError = self:bridgeCall(method, self:viewOf(entity), json.encode(request), entity.avatarPresetKey or 0, avatarJson or "", onFailed)
	else
		ok, bridgeError = self:bridgeCall(method, self:viewOf(entity), json.encode(request), entity.avatarPresetKey or 0, avatarJson or "")
	end

	if not ok then
		return false, bridgeError
	end

	return true, request
end

function AppearanceFormResourceComponent:plan(form)
	local ok, result = self:invokeForm(AppearanceFormBridgeMethod.Plan, self.owner, form)

	if not ok then
		return nil, result
	end

	return result
end

function AppearanceFormResourceComponent:apply(form, onFailed)
	local ok, result = self:invokeForm(AppearanceFormBridgeMethod.Apply, self.owner, form, onFailed)

	if not ok then
		return false, result
	end

	return true
end

function AppearanceFormResourceComponent:restore(onFailed)
	return self:bridgeCall(AppearanceFormBridgeMethod.Restore, self:viewOf(self.owner), onFailed)
end

function AppearanceFormResourceComponent:cancel()
	return self:bridgeCall(AppearanceFormBridgeMethod.Cancel, self:viewOf(self.owner))
end

function AppearanceFormResourceComponent:copyState(target)
	assert(target, NoticeDef.ERROR_ENTITY_NOT_EXIST)
	assert(target.appearanceCustomization and not target.appearanceCustomization.disposed and not target.appearanceCustomizationDisposed, NoticeDef.ERROR_INVALID_STATUS)

	return self:bridgeCall(AppearanceFormBridgeMethod.CopyState, self:viewOf(self.owner), self:viewOf(target))
end

function AppearanceFormResourceComponent:forget()
	return self:bridgeCall(AppearanceFormBridgeMethod.Forget, self:viewOf(self.owner))
end

function AppearanceFormResourceComponent:destroy()
	self.owner = nil
	self.context = nil
end

return AppearanceFormResourceComponent
