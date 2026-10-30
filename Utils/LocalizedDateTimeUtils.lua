-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\LocalizedDateTimeUtils.lua

local LocalizedDateTimeUtils = {}
local DATE_ORDERS = {
	[0] = "YMD",
	"YMD",
	"MDY",
	"YMD",
	"YMD",
	"DMY",
	"DMY",
	"DMY",
	"DMY",
	"DMY",
	"DMY",
	"DMY",
	"DMY"
}

local function getDateOrder(language)
	language = language == nil and (pg and pg.languageType or 0) or language

	return DATE_ORDERS[language] or "YMD"
end

local function joinDate(fields, order, separator)
	local result = {}

	for field in order:gmatch(".") do
		if fields[field] then
			result[#result + 1] = fields[field]
		end
	end

	return table.concat(result, separator)
end

function LocalizedDateTimeUtils.format(t, style, language, dateSeparator)
	style = style or "dateTimeSeconds"

	local time = string.format("%02d:%02d", t.hour or 0, t.min or 0)

	if style == "timeSeconds" or style == "dateTimeSeconds" or style == "monthDayTimeSeconds" then
		time = time .. string.format(":%02d", t.sec or 0)
	end

	if style == "time" or style == "timeSeconds" then
		return time
	end

	local omitYear = style == "monthDay" or style == "monthDayTime" or style == "monthDayTimeSeconds"
	local fields = {
		Y = not omitYear and string.format("%04d", t.year) or nil,
		M = string.format("%02d", t.month),
		D = style ~= "yearMonth" and string.format("%02d", t.day) or nil
	}
	local date = joinDate(fields, getDateOrder(language), dateSeparator or "/")

	if style == "date" or style == "monthDay" or style == "yearMonth" then
		return date
	end

	assert(style == "dateTime" or style == "dateTimeSeconds" or style == "monthDayTime" or style == "monthDayTimeSeconds", "unknown localized date style: " .. tostring(style))

	return date .. " " .. time
end

local function reorderDatePattern(group, order)
	local fields = {}

	for token in group:gmatch("%%[Yymd]") do
		local field = (token == "%Y" or token == "%y") and "Y" or token == "%m" and "M" or "D"

		fields[field] = token
	end

	local tokens = {}

	for field in order:gmatch(".") do
		if fields[field] then
			tokens[#tokens + 1] = fields[field]
		end
	end

	local index = 0

	return (group:gsub("%%[Yymd]", function(token)
		index = index + 1

		return tokens[index] or token
	end))
end

function LocalizedDateTimeUtils.formatPattern(pattern, timestamp, language)
	local result = {}
	local cursor = 1
	local order = getDateOrder(language)

	while true do
		local first, last = pattern:find("%%[Yymd][/%.%-%s]*%%[Yymd]", cursor)

		if not first then
			result[#result + 1] = pattern:sub(cursor)

			break
		end

		local group = pattern:sub(first, last)
		local third = pattern:sub(last + 1):match("^[/%.%-%s]*%%[Yymd]")

		if third then
			local token = third:match("%%[Yymd]")

			if not group:find(token, 1, true) then
				last = last + #third
				group = group .. third
			end
		end

		result[#result + 1] = pattern:sub(cursor, first - 1) .. reorderDatePattern(group, order)
		cursor = last + 1
	end

	return os.date(table.concat(result), timestamp)
end

return LocalizedDateTimeUtils
