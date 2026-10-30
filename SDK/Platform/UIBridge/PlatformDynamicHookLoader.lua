-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\Platform\\UIBridge\\PlatformDynamicHookLoader.lua

local M = {}

function M.safeRequire(modulePath)
	local ok, result = pcall(require, modulePath)

	if not ok then
		print("[PlatformUIBridgeLoader] safeRequire failed: " .. tostring(modulePath) .. " - " .. tostring(result))

		return nil
	end

	return result
end

function M.registerDynamicHook(targetModulePath, methodName, hookModulePath, hookName)
	return M.registerDynamicHooks(targetModulePath, hookModulePath, {
		{
			methodName = methodName,
			hookName = hookName
		}
	})
end

function M.registerDynamicHooks(targetModulePath, hookModulePath, hooks, exposeField)
	local hookModule = M.safeRequire(hookModulePath)

	if hookModule == nil then
		return nil
	end

	local target = M.safeRequire(targetModulePath)

	if target == nil then
		return nil
	end

	if exposeField ~= nil then
		rawset(target, exposeField, hookModule)
	end

	if not rawget(target, "_platformHooks") then
		rawset(target, "_platformHooks", {})
	end

	for _, hook in ipairs(hooks) do
		local methodName = hook.methodName
		local hookName = hook.hookName or methodName

		rawget(target, "_platformHooks")[methodName] = function(...)
			local currentHookModule = require(hookModulePath)
			local hookFn = currentHookModule and currentHookModule[hookName]

			assert(type(hookFn) == "function", string.format("[PlatformUIBridgeLoader] dynamic hook missing: %s.%s", tostring(hookModulePath), tostring(hookName)))

			return hookFn(...)
		end
	end

	return target
end

function M.registerDynamicMembers(targetModulePath, hookModulePath, members, exposeField)
	local hookModule = M.safeRequire(hookModulePath)

	if hookModule == nil then
		return nil
	end

	local target = M.safeRequire(targetModulePath)

	if target == nil then
		return nil
	end

	if exposeField ~= nil then
		rawset(target, exposeField, hookModule)
	end

	for _, member in ipairs(members) do
		local fieldName = member.fieldName
		local hookName = member.hookName or fieldName

		if member.memberType == "value" then
			rawset(target, fieldName, hookModule[hookName])
		else
			rawset(target, fieldName, function(...)
				local currentHookModule = require(hookModulePath)
				local hookFn = currentHookModule and currentHookModule[hookName]

				assert(type(hookFn) == "function", string.format("[PlatformUIBridgeLoader] dynamic member missing: %s.%s", tostring(hookModulePath), tostring(hookName)))

				return hookFn(...)
			end)
		end
	end

	return target
end

function M.loadDynamicModule(modulePath, initName)
	local module = M.safeRequire(modulePath)

	if module == nil then
		return nil
	end

	if initName ~= nil then
		local initFn = module[initName]

		assert(type(initFn) == "function", string.format("[PlatformUIBridgeLoader] dynamic init missing: %s.%s", tostring(modulePath), tostring(initName)))
		initFn()
	end

	return module
end

return M
