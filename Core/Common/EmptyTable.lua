-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Common\\EmptyTable.lua

local function rejectWrite(_, key)
	error(string.format("Cannot modify shared EMPTY_TABLE, key=%s", tostring(key)), 2)
end

local EMPTY_TABLE = setmetatable({}, {
	__metatable = "READONLY_EMPTY_TABLE",
	__newindex = rejectWrite
})

return EMPTY_TABLE
