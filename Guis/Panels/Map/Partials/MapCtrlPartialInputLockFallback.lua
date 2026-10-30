-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Map\\Partials\\MapCtrlPartialInputLockFallback.lua

local MAP_INPUT_FALLBACK_SECONDS = 7

return function(MapCtrl)
	function MapCtrl:_beginMapInputLock()
		self.view.mapScroll.zoomTool.muteZoom = true

		self.view.blockRayboxUWidget.gameObject:SetActiveEx(true)
		self.view.mapScroll:SetScrollDisabled(true)

		return self:_armMapInputFallback()
	end

	function MapCtrl:_endMapInputLock(timer)
		if timer ~= self.mapInputFallbackTimer then
			return false
		end

		self.view.mapScroll.zoomTool.muteZoom = false

		self.view.blockRayboxUWidget.gameObject:SetActiveEx(false)
		self.view.mapScroll:SetScrollDisabled(false)
		self:_cancelMapInputFallback(timer)

		return true
	end

	function MapCtrl:_armMapInputFallback()
		self:_cancelMapInputFallback()

		local timer = self:startTimer(function()
			if timer ~= self.mapInputFallbackTimer then
				return
			end

			self.mapInputFallbackTimer = nil

			self:_restoreMapInputIfLocked()
		end, MAP_INPUT_FALLBACK_SECONDS, false)

		self.mapInputFallbackTimer = timer

		return timer
	end

	function MapCtrl:_cancelMapInputFallback(timer)
		if timer and timer ~= self.mapInputFallbackTimer then
			return
		end

		if not self.mapInputFallbackTimer then
			return
		end

		self:killTimer(self.mapInputFallbackTimer)

		self.mapInputFallbackTimer = nil
	end

	function MapCtrl:_restoreMapInputIfLocked()
		if not self.view or not self.view.mapScroll or not self.view.blockRayboxUWidget then
			return
		end

		if self.view.mapScroll.zoomTool.muteZoom then
			self.view.mapScroll.zoomTool.muteZoom = false

			self.view.mapScroll:SetScrollDisabled(false)
		end

		if self.view.blockRayboxUWidget.gameObject.activeSelf then
			self.view.blockRayboxUWidget.gameObject:SetActiveEx(false)
		end
	end
end
