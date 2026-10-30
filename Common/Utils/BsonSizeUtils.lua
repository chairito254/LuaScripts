-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Utils\\BsonSizeUtils.lua

local BsonSizeUtils = {}
local BSON_TYPE_BYTES = {
	["nil"] = 0,
	boolean = 1,
	number = 8,
	string = 5
}

local function getBsonKeySize(key)
	return #tostring(key) + 1
end

local function getTableBsonSize(value, visited)
	local valueType = type(value)

	if valueType == "table" then
		if visited[value] then
			return 0, 0
		end

		visited[value] = true

		local size = 5
		local count = 0

		for k, v in pairs(value) do
			local childSize = getTableBsonSize(v, visited)

			size = size + 1 + getBsonKeySize(k) + childSize
			count = count + 1
		end

		visited[value] = nil

		return size, count
	elseif valueType == "string" then
		return BSON_TYPE_BYTES.string + #value, 0
	end

	return BSON_TYPE_BYTES[valueType] or 0, 0
end

function BsonSizeUtils.getEstimatedSize(value)
	if not value then
		return 0, 0
	end

	return getTableBsonSize(value, {})
end

return BsonSizeUtils
