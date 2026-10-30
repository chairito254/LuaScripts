-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Core\\Framework\\SafeCallback.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local try = require("Core.Framework.Exception")
local CommonRepo = require("Core.Common.CommonRepo")
local logger = LoggerManager.getLogger("SafeCallback")
local xpcall = xpcall
local traceback = debug.traceback
local SafeCallback

if jit then
	function SafeCallback(cb, ...)
		local status, ret = xpcall(cb, traceback, ...)

		if not status then
			local ex = ret or "unknown error occurred"

			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("SafeCallback traceback occurred \n", ex)
			end
		end
	end
else
	function SafeCallback(cb, ...)
		local args = {
			...
		}
		local paramCount = select("#", ...)
		local status, err = xpcall(function()
			cb(unpack(args, 1, paramCount))
		end, traceback)

		if not status then
			local ex = err or "unknown error occurred"

			if LoggerManager.checkLogger(LoggerConst.ERROR) then
				logger:error("SafeCallback traceback occurred \n", ex)
			end
		end
	end
end

return SafeCallback
