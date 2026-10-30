-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceFormConfig.lua

local NoticeDef = require("Common.NoticeDef")
local Utils = require("Common.Utils.Utils")
local AppearanceFormConfig = {}

function AppearanceFormConfig.isConfigTable(value)
	if not Utils.isTable(value) then
		return false
	end

	if type(value) ~= "userdata" then
		return true
	end

	local ok, isBdd = pcall(function()
		return value._BddData_
	end)

	return ok and isBdd == true
end

function AppearanceFormConfig.positiveInteger(value)
	return type(value) == "number" and value > 0 and value < math.huge and value % 1 == 0
end

function AppearanceFormConfig.copyArray(value)
	local copied = {}

	for i, item in ipairs(value) do
		copied[i] = item
	end

	return copied
end

function AppearanceFormConfig.validArray(value, allowEmpty)
	if not AppearanceFormConfig.isConfigTable(value) then
		return false
	end

	local count = 0

	for key, item in pairs(value) do
		if not AppearanceFormConfig.positiveInteger(key) or not AppearanceFormConfig.positiveInteger(item) then
			return false
		end

		count = count + 1
	end

	if not allowEmpty and count == 0 then
		return false
	end

	for i = 1, count do
		if value[i] == nil then
			return false
		end
	end

	return true
end

function AppearanceFormConfig.sameArray(left, right)
	if #left ~= #right then
		return false
	end

	for i, value in ipairs(left) do
		if value ~= right[i] then
			return false
		end
	end

	return true
end

function AppearanceFormConfig.mergeMetadata(result, row)
	if row.limit ~= nil and row.limit ~= 0 then
		if not AppearanceFormConfig.positiveInteger(row.limit) then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		if result.limit ~= nil and result.limit ~= row.limit then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		result.limit = row.limit
	end

	for _, field in ipairs({
		"icon",
		"playable",
		"action",
		"name"
	}) do
		local value = row[field]

		if value ~= nil then
			local isAction = field == "action"

			if isAction and not AppearanceFormConfig.validArray(value, true) or not isAction and type(value) ~= "string" and (field ~= "name" or type(value) ~= "number" or value % 1 ~= 0) then
				return nil, NoticeDef.ERROR_CONFIG_NIL
			end

			local nonEmpty = isAction and #value > 0 or not isAction and value ~= ""

			if nonEmpty then
				local previous = result[field]

				if previous ~= nil and (not isAction or not AppearanceFormConfig.sameArray(previous, value)) and (isAction or previous ~= value) then
					return nil, NoticeDef.ERROR_CONFIG_NIL
				end

				if previous == nil then
					result[field] = isAction and AppearanceFormConfig.copyArray(value) or value
				end
			end
		end
	end

	return true
end

function AppearanceFormConfig.parse(formId, formData)
	if not AppearanceFormConfig.positiveInteger(formId) then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	if not AppearanceFormConfig.isConfigTable(formData) then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	local source = formData[formId]

	if source == nil then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	if not AppearanceFormConfig.isConfigTable(source) then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	local indices = {}

	for index in pairs(source) do
		if not AppearanceFormConfig.positiveInteger(index) then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		indices[#indices + 1] = index
	end

	if #indices == 0 then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	table.sort(indices)

	local firstRow = source[1]
	local result = {
		id = formId,
		rows = {},
		initialClaim = AppearanceFormConfig.isConfigTable(firstRow) and firstRow.initialClaim or nil
	}

	for _, index in ipairs(indices) do
		local row = source[index]

		if not AppearanceFormConfig.isConfigTable(row) then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		if type(row.res) ~= "string" or row.res == "" then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		if not AppearanceFormConfig.validArray(row.points, false) then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		local ok, err = AppearanceFormConfig.mergeMetadata(result, row)

		if not ok then
			return nil, err
		end

		result.rows[#result.rows + 1] = {
			index = index,
			points = AppearanceFormConfig.copyArray(row.points),
			res = row.res
		}
	end

	return result
end

function AppearanceFormConfig.buildList(formIds, formData)
	if formIds == nil then
		return {}
	end

	if not AppearanceFormConfig.validArray(formIds, true) then
		return nil, NoticeDef.ERROR_CONFIG_NIL
	end

	local result, seen = {}, {}

	for _, formId in ipairs(formIds) do
		if seen[formId] then
			return nil, NoticeDef.ERROR_CONFIG_NIL
		end

		local form, err = AppearanceFormConfig.parse(formId, formData)

		if not form then
			return nil, err
		end

		seen[formId] = true
		result[#result + 1] = form
	end

	return result
end

return AppearanceFormConfig
