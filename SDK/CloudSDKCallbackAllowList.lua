-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\SDK\\CloudSDKCallbackAllowList.lua

local ALLOWED_CALLBACKS = {
	platform = {
		getSocialInfo = true,
		unbind = true,
		bind = true,
		logout = true,
		createRole = true,
		enterGame = true,
		reconcilePayments = true,
		pay = true,
		getProductsInfo = true,
		feedStatusChange = true,
		getLaunchOptionsSync = true,
		focusInCallback = true,
		funtapCheckUser = true,
		refreshSocial = true,
		qrcodeLogin = true
	},
	common = {
		login = true,
		initFunStore = true,
		reportAchievement = true,
		showAchievements = true,
		webViewClosed = true,
		openFunStore = true
	},
	tools = {
		getClientIPInfo = true,
		loginGameCenter = true
	},
	privacy = {
		open = true
	}
}

return function(module, func)
	local moduleCallbacks = ALLOWED_CALLBACKS[module]

	return moduleCallbacks ~= nil and moduleCallbacks[func] == true
end
