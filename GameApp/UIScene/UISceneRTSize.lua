-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\GameApp\\UIScene\\UISceneRTSize.lua

local LoggerManager = require("Core.Log.LoggerManager")
local LoggerConst = require("Core.Log.LoggerConst")
local Const = require("Common.Const.Const")
local UISceneConst = require("GameApp.UIScene.UISceneConst")
local logger = LoggerManager.getLogger("UISceneRT")
local UISceneRTSize = {}

function UISceneRTSize.getPlatform()
	local setting = pg.game.setting

	if setting:isConsolePlatform() then
		return UISceneConst.RT_PLATFORM.CONSOLE
	end

	if setting:isMobileRenderPlatform() then
		return UISceneConst.RT_PLATFORM.MOBILE
	end

	return UISceneConst.RT_PLATFORM.PC
end

function UISceneRTSize.alignUp(value, alignment)
	return math.floor((value + alignment - 1) / alignment) * alignment
end

function UISceneRTSize.estimateMemoryMB(width, height)
	return width * height * 8 / 1048576
end

function UISceneRTSize.calc(rawImagePro, overrideScale, logContext)
	logContext = logContext or "<unknown>"

	if IsNil(rawImagePro) then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error("RT size calc failed: rawImagePro is nil or destroyed.", logContext)
		end

		return nil, nil, UISceneConst.RT_FAIL_INVALID_PARAM
	end

	local uiWidth, uiHeight = rawImagePro:GetScreenPixelSize()

	if uiWidth <= 0 or uiHeight <= 0 then
		return nil, nil, UISceneConst.RT_FAIL_LAYOUT_NOT_READY
	end

	local widgetScale = rawImagePro.renderTextureScale

	if widgetScale <= 0 then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error(string.format("RT size calc failed: invalid renderTextureScale=%s on RawImagePro. %s", tostring(widgetScale), logContext))
		end

		return nil, nil, UISceneConst.RT_FAIL_INVALID_PARAM
	end

	local extraScale = overrideScale or 1

	if extraScale <= 0 then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error(string.format("RT size calc failed: invalid overrideScale=%s. %s", tostring(extraScale), logContext))
		end

		return nil, nil, UISceneConst.RT_FAIL_INVALID_PARAM
	end

	local platform = UISceneRTSize.getPlatform()
	local quality = pg.game.setting:getVideoQuality()
	local qualityScaleOfPlatform = UISceneConst.RT_QUALITY_SCALE[platform]

	if qualityScaleOfPlatform[quality] == nil then
		if LoggerManager.checkLogger(LoggerConst.ERROR) then
			logger:error(string.format("RT size calc got unexpected videoQuality=%s, fallback to HIGH. %s", tostring(quality), logContext))
		end

		quality = Const.VIDEO_QUALITY.HIGH
	end

	local platformScale = UISceneConst.RT_PLATFORM_SCALE[platform]
	local qualityScale = qualityScaleOfPlatform[quality]
	local effectiveScale = platformScale * qualityScale * widgetScale * extraScale
	local width = uiWidth * effectiveScale
	local height = uiHeight * effectiveScale
	local scaledWidth, scaledHeight = width, height
	local maxLongSide = rawImagePro.renderTextureMaxLongSide
	local maxLongSideFromImage = maxLongSide > 0

	if not maxLongSideFromImage then
		maxLongSide = UISceneConst.RT_MAX_LONG_SIDE[platform][quality]
	end

	local longSide = math.max(width, height)

	if maxLongSide < longSide then
		local ratio = maxLongSide / longSide

		width = width * ratio
		height = height * ratio
	end

	local minLongSide = math.min(UISceneConst.RT_MIN_LONG_SIDE, maxLongSide)

	longSide = math.max(width, height)

	if longSide < minLongSide then
		local ratio = minLongSide / longSide

		width = width * ratio
		height = height * ratio
	end

	local alignment = UISceneConst.RT_ALIGNMENT
	local finalWidth, finalHeight

	if height <= width then
		finalWidth = UISceneRTSize.alignUp(width, alignment)
		finalHeight = math.max(1, math.floor(finalWidth * height / width + 0.5))
	else
		finalHeight = UISceneRTSize.alignUp(height, alignment)
		finalWidth = math.max(1, math.floor(finalHeight * width / height + 0.5))
	end

	if LoggerManager.checkLogger(LoggerConst.INFO) then
		logger:info(string.format("%s image=%s | uiPixel=%dx%d platform=%s quality=%s | scale=%.3f*%.3f*%.3f*%.3f=%.4f -> %.0fx%.0f" .. " | maxLongSide=%d(%s) -> %.0fx%.0f | alignLong%d -> %dx%d mem=%.2fMB", logContext, rawImagePro.name, uiWidth, uiHeight, UISceneConst.RT_PLATFORM_NAME[platform], UISceneConst.RT_QUALITY_NAME[quality] or tostring(quality), platformScale, qualityScale, widgetScale, extraScale, effectiveScale, scaledWidth, scaledHeight, maxLongSide, maxLongSideFromImage and "image" or "global", width, height, alignment, finalWidth, finalHeight, UISceneRTSize.estimateMemoryMB(finalWidth, finalHeight)))
	end

	return finalWidth, finalHeight
end

return UISceneRTSize
