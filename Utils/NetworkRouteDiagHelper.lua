-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\NetworkRouteDiagHelper.lua

local Time = require("Core.Common.Time")
local TimerManager = require("Core.Timer.TimerManager")
local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local logger = LoggerManager.getLogger("NetworkRouteDiagHelper")
local NetworkRouteDiagHelper = {}
local MAX_TTL = 30
local TIMEOUT_SEC = 12
local DNS_TIMEOUT_SEC = 5
local PROBE_TIMEOUT_MS = 500
local POLL_INTERVAL_SEC = 0.05

function NetworkRouteDiagHelper.trace(host, callback, result)
	result = result or {}
	result.status = "RUNNING"
	result.hops = {}
	result.maxTtl = MAX_TTL
	result.host = host

	local started = Time.realtimeSinceStartup
	local deadline = started + TIMEOUT_SEC
	local finished = false
	local timerId, address, task, probeRequestId
	local resolving = false
	local ttl = 1

	local function complete(status, note, canceled)
		if finished then
			return
		end

		finished = true
		result.status = status
		result.note = note

		if timerId then
			TimerManager.removeTimer(timerId)

			timerId = nil
		end

		if probeRequestId then
			appFacade.httpManager:LuaCancelRouteProbe(probeRequestId)

			probeRequestId = nil
		end

		task = nil

		if not canceled then
			callback(result)
		end
	end

	local function sendProbe()
		local remainingMs = math.floor((deadline - Time.realtimeSinceStartup) * 1000)

		if remainingMs <= 0 then
			complete("INCOMPLETE", "Route trace timed out before sending next probe")

			return
		end

		task = {
			IsCompleted = false,
			IsCanceled = false,
			IsFaulted = false
		}
		probeRequestId = appFacade.httpManager:LuaRouteProbe(address:ToString(), ttl, math.min(PROBE_TIMEOUT_MS, remainingMs), function(err, statusName, replyAddress, roundtripTime)
			if not task or finished then
				return
			end

			if err ~= 0 then
				task.IsFaulted = true
				task.Exception = "ICMP probe unavailable"
				task.Result = nil
			else
				task.Result = {
					Status = err == 0 and 0 or -1,
					StatusName = statusName,
					Address = replyAddress,
					RoundtripTime = roundtripTime
				}
			end

			task.IsCompleted = true
		end)
	end

	local function step()
		if Time.realtimeSinceStartup >= deadline then
			complete("INCOMPLETE", "Route trace timed out before reaching the target")

			return
		end

		if not task.IsCompleted then
			if resolving and Time.realtimeSinceStartup - started >= DNS_TIMEOUT_SEC then
				complete("UNAVAILABLE", "System DNS resolution for route tracing timed out")
			end

			return
		end

		if task.IsFaulted then
			local err = task.Exception

			if LoggerManager.checkLogger(LoggerConst.INFO) then
				logger:info("[NetworkDiag] Route trace task failed: %s", tostring(err))
			end

			complete("UNAVAILABLE", "Asynchronous route tracing failed")

			return
		end

		if task.IsCanceled then
			complete("INCOMPLETE", "Route tracing task was canceled")

			return
		end

		if resolving then
			local addresses = task.Result

			if addresses.Length == 0 then
				complete("UNAVAILABLE", "System DNS returned no address for route tracing")

				return
			end

			address = addresses[0]

			for i = 0, addresses.Length - 1 do
				if addresses[i].AddressFamily == CS.System.Net.Sockets.AddressFamily.InterNetwork then
					address = addresses[i]

					break
				end
			end

			result.targetIp = address:ToString()
			resolving = false

			sendProbe()

			return
		end

		local reply = task.Result
		local replyStatus = reply and reply.Status

		if not replyStatus or replyStatus < 0 then
			if LoggerManager.checkLogger(LoggerConst.INFO) then
				logger:info("[NetworkDiag] Route trace reply has no Status: %s", tostring(reply))
			end

			complete("UNAVAILABLE", "ICMP reply status is unavailable in this build")

			return
		end

		local status = reply.StatusName
		local replyAddress = reply.Address
		local hop = {
			ttl = ttl,
			address = replyAddress,
			status = status
		}

		result.hops[#result.hops + 1] = hop

		if status == "Success" then
			if not replyAddress or replyAddress ~= address:ToString() then
				complete("INCOMPLETE", "ICMP reply address differs from the target; hop count cannot be confirmed")

				return
			end

			hop.latencyMs = tonumber(reply.RoundtripTime)
			result.hopCount = ttl

			complete("COMPLETE", "Hop count is derived from packet TTL; the ICMP path is for reference only")

			return
		end

		if status ~= "TtlExpired" and status ~= "TimedOut" then
			complete("INCOMPLETE", "Route tracing stopped: " .. status)

			return
		end

		if ttl >= MAX_TTL then
			complete("INCOMPLETE", "Maximum TTL reached before reaching the target")

			return
		end

		ttl = ttl + 1

		sendProbe()
	end

	local poll

	function poll()
		timerId = nil

		if finished then
			return
		end

		local ok, err = pcall(step)

		if not ok then
			if LoggerManager.checkLogger(LoggerConst.INFO) then
				logger:info("[NetworkDiag] Route trace polling failed: %s", tostring(err))
			end

			complete("UNAVAILABLE", "The current runtime cannot complete ICMP/TTL tracing")
		end

		if not finished then
			timerId = TimerManager.addTimer(POLL_INTERVAL_SEC, poll)
		end
	end

	local ok, err = pcall(function()
		local parsed, parsedAddress = pcall(CS.System.Net.IPAddress.Parse, host)

		if parsed then
			address = parsedAddress
			result.targetIp = address:ToString()

			sendProbe()
		else
			resolving = true
			task = CS.System.Net.Dns.GetHostAddressesAsync(host)
		end
	end)

	if ok then
		poll()
	else
		if LoggerManager.checkLogger(LoggerConst.INFO) then
			logger:info("[NetworkDiag] Route trace startup failed: %s", tostring(err))
		end

		complete("UNAVAILABLE", "The current runtime cannot start ICMP/TTL tracing")
	end

	return function()
		complete("INCOMPLETE", "Overall diagnosis ended; completed route trace data was retained", true)
	end
end

return NetworkRouteDiagHelper
