-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\Setting\\DeviceVideoOverride.lua

local DeviceVideoOverride = {
	enabled = true,
	defaults = {
		postTaa5TapSharpen = true,
		transparentInIndependentPass = false,
		transparentInOnePass = false
	},
	valueTypes = {
		postTaa5TapSharpen = "bool",
		transparentInIndependentPass = "bool",
		transparentInOnePass = "bool"
	},
	rules = {
		{
			id = "android_transparency_independent_pass",
			platforms = {
				Android = true
			},
			values = {
				transparentInIndependentPass = true,
				transparentInOnePass = false
			}
		},
		{
			id = "ios_transparency_independent_pass",
			platforms = {
				IOS = true
			},
			values = {
				transparentInIndependentPass = true,
				transparentInOnePass = false
			}
		}
	}
}

local function matchesRule(rule, platform, deviceModel)
	if rule.platforms and not rule.platforms[platform] then
		return false
	end

	if rule.deviceModels and not rule.deviceModels[deviceModel] then
		return false
	end

	return true
end

function DeviceVideoOverride.resolve(key, requestedValue, platform, deviceModel)
	if not DeviceVideoOverride.enabled then
		return requestedValue
	end

	local effectiveValue = requestedValue

	for _, rule in ipairs(DeviceVideoOverride.rules) do
		if matchesRule(rule, platform, deviceModel) and rule.values[key] ~= nil then
			effectiveValue = rule.values[key]
		end
	end

	return effectiveValue
end

return DeviceVideoOverride
