-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Const\\PlatformPsnAuthConst.lua

local M = {}

M.MAX_ATTEMPTS = 4
M.RETRY_BASE_SECONDS = 1
M.RETRY_JITTER_RATIO = 0.2
M.MAX_RETRY_WAIT_SECONDS = 60
M.TRANSIENT_COOLDOWN_SECONDS = 60
M.TERMINAL_COOLDOWN_SECONDS = 300
M.HTTP_TIMEOUT_MS = 5000
M.AUTH_CODE_TIMEOUT_MS = 10000
M.AUTH_CODE_WAIT_SECONDS = 15
M.DEFAULT_EXPIRES_SECONDS = 3600
M.EXPIRY_MARGIN_SECONDS = 120
M.MAX_REDIRECTS = 3
M.HTTP_WATCHDOG_SECONDS = M.HTTP_TIMEOUT_MS / 1000 * (M.MAX_REDIRECTS + 1) + 1
M.RETRYABLE_STATUS = {
	[503] = true,
	[408] = true,
	[500] = true,
	[502] = true,
	[504] = true,
	[429] = true
}
M.OAUTH_ERRORS = {
	invalid_scope = true,
	unsupported_grant_type = true,
	unauthorized_client = true,
	server_error = true,
	invalid_client = true,
	invalid_request = true,
	invalid_grant = true,
	temporarily_unavailable = true,
	access_denied = true
}
M.TERMINAL_OAUTH_ERRORS = {
	invalid_scope = true,
	unsupported_grant_type = true,
	unauthorized_client = true,
	invalid_client = true,
	invalid_request = true,
	access_denied = true
}
M.MONTHS = {
	Dec = 12,
	Nov = 11,
	Oct = 10,
	Sep = 9,
	Aug = 8,
	Jul = 7,
	Jun = 6,
	May = 5,
	Apr = 4,
	Mar = 3,
	Feb = 2,
	Jan = 1
}

return M
