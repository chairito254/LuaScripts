-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Net\\Http\\PsnAuthPolicy.lua

local Const = require("Common.Const.PlatformPsnAuthConst")
local M = {}

function M.getError(response)
	if type(response) ~= "table" or response.error == nil then
		return "none"
	end

	if Const.OAUTH_ERRORS[response.error] then
		return response.error
	end

	return "unknown_oauth_error"
end

function M.isTransient(reply, response)
	local err = M.getError(response)

	if Const.TERMINAL_OAUTH_ERRORS[err] or err == "invalid_grant" then
		return false
	end

	local status = reply and reply.header and tonumber(reply.header.HTTP_STATUS)

	if status and status >= 400 and status < 500 then
		return Const.RETRYABLE_STATUS[status] == true
	end

	if status and status >= 200 and status < 300 then
		return false
	end

	return Const.RETRYABLE_STATUS[status] == true or reply == nil or (status == nil or status == 0) and reply.err ~= 0
end

function M.getRetryAfter(reply, now)
	local header = reply and reply.header

	if header == nil then
		return 0
	end

	local value

	for name, field in pairs(header) do
		if string.lower(name) == "retry-after" then
			value = tostring(field)

			break
		end
	end

	if value == nil then
		return 0
	end

	value = value:match("^%s*(.-)%s*$")

	if value:match("^%d+$") then
		local seconds = tonumber(value)

		if seconds < math.huge then
			return seconds
		end

		return 0
	end

	local day, month, year, hour, minute, second = value:match("^%a+, (%d%d) (%a%a%a) (%d%d%d%d) (%d%d):(%d%d):(%d%d) GMT$")

	if day == nil then
		day, month, year, hour, minute, second = value:match("^%a+, (%d%d)%-(%a%a%a)%-(%d%d) (%d%d):(%d%d):(%d%d) GMT$")

		if year then
			local currentYear = tonumber(os.date("!%Y", now))

			year = math.floor(currentYear / 100) * 100 + tonumber(year)

			if year > currentYear + 50 then
				year = year - 100
			end
		end
	end

	if day == nil then
		month, day, hour, minute, second, year = value:match("^%a%a%a (%a%a%a) +(%d%d?) (%d%d):(%d%d):(%d%d) (%d%d%d%d)$")
	end

	month, day, year = Const.MONTHS[month], tonumber(day), tonumber(year)
	hour, minute, second = tonumber(hour), tonumber(minute), tonumber(second)

	if not month or not day or not year or day < 1 or day > 31 or hour > 23 or minute > 59 or second > 59 then
		return 0
	end

	local adjustedYear = year - (month <= 2 and 1 or 0)
	local era = math.floor(adjustedYear / 400)
	local yearOfEra = adjustedYear - era * 400
	local dayOfYear = math.floor((153 * (month + (month > 2 and -3 or 9)) + 2) / 5) + day - 1
	local days = era * 146097 + yearOfEra * 365 + math.floor(yearOfEra / 4) - math.floor(yearOfEra / 100) + dayOfYear - 719468
	local epoch = days * 86400 + hour * 3600 + minute * 60 + second

	if os.date("!%Y-%m-%d", epoch) ~= string.format("%04d-%02d-%02d", year, month, day) then
		return 0
	end

	return math.max(0, epoch - now)
end

return M
