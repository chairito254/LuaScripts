-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\ClientTimeControlComponent.lua

local Class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local AbilityConst = require("Common.Const.AbilityConst")
local TimerManager = require("Core.Timer.TimerManager")
local ClientTimeControlComponent = Class.Component("ClientTimeControlComponent")

function ClientTimeControlComponent:ctor()
	self.timeScale = 1
	self.baseTimeScale = 1
	self.frameFreezeScale = 1
	self.currScaledTime = 0
	self.scaledTimeAnchor = nil
	self.timeScaleTimer = nil
	self.timeScaleMap = {}
	self.timeScaleMgr = nil
end

function ClientTimeControlComponent:checkUseSimpleTimeScale()
	return self.useSimpleTimeScale
end

function ClientTimeControlComponent:onEnterSpace()
	if self.timeScaleMgr then
		self.timeScaleMgr:unRegisterEnt(self.id, self)
	end

	self.timeScaleMgr = self.space.timeScaleMgr

	if self.timeScaleMgr then
		self.timeScaleMgr:registerEnt(self.id, self, self.useSimpleTimeScale)
	end

	self:refreshTimeScale(true)
end

function ClientTimeControlComponent:onLeaveSpace()
	if self.timeScaleMgr then
		self.timeScaleMgr:unRegisterEnt(self.id, self)
	end

	self.timeScaleMgr = nil

	self:refreshTimeScale()
end

function ClientTimeControlComponent:refreshTimeScale(forceRefresh)
	if self.timeScaleMgr then
		local timeScale = 1

		if self.useSimpleTimeScale then
			timeScale = self.timeScaleMgr.globalTimeZoneScale
		else
			timeScale = self.timeScaleMgr:getTimeScale(self)
		end

		self:setTimeScale(timeScale, nil, forceRefresh)
	else
		self:setTimeScale(1, nil, forceRefresh)
	end
end

function ClientTimeControlComponent:getSelfTimeScale()
	if not self.timeScaleMgr then
		return self.timeScale
	end

	return self.timeScale * self.timeScaleMgr:getGlobalFreeze(self)
end

function ClientTimeControlComponent:getFinalTimeScale()
	return self:getSelfTimeScale() * self:getGameTimeScale()
end

function ClientTimeControlComponent:clearAllTimeScale()
	if self.timeScaleMgr and not self.useSimpleTimeScale then
		self.timeScaleMgr:settleEntScaledTime(self)
	end

	table.clear(self.timeScaleMap)

	self.baseTimeScale = 1
	self.frameFreezeScale = 1
	self.timeScale = 1

	self:applyTimeScale()
end

function ClientTimeControlComponent:setTimeScale(timeScale, key, forceRefresh)
	key = key or AbilityConst.TIME_SCALE_KEY_DEFAULT

	if timeScale ~= 1 and self.isDead and self:isDead() then
		return
	end

	if self.timeScaleMap[key] ~= timeScale then
		if self.timeScaleMgr and not self.useSimpleTimeScale then
			self.timeScaleMgr:settleEntScaledTime(self)
		end

		self.timeScaleMap[key] = timeScale
		self.baseTimeScale = 1
		self.frameFreezeScale = 1

		for scaleKey, v in pairs(self.timeScaleMap) do
			if scaleKey == AbilityConst.TIME_SCALE_KEY_FRAME_FREEZE then
				self.frameFreezeScale = v
			else
				self.baseTimeScale = self.baseTimeScale * v
			end
		end

		self.timeScale = self.baseTimeScale * self.frameFreezeScale

		self:applyTimeScale()
	elseif forceRefresh then
		self:applyTimeScale()
	end
end

function ClientTimeControlComponent:applyTimeScale()
	self:postComponentMethod("EVENT_TimeScaleChanged", self.timeScale)

	if self.eModel then
		local gameTimeScale = self:getGameTimeScale()

		self.eModel:SetTimeScale(gameTimeScale * self.timeScale)
	end
end

function ClientTimeControlComponent:getCurrScaledTime()
	local timeScaleMgr = self.timeScaleMgr

	if timeScaleMgr then
		if self.useSimpleTimeScale then
			return timeScaleMgr.globalScaledTime
		end

		if timeScaleMgr.freezeScaledTime == nil then
			timeScaleMgr:initializeFreezeScaledTime()
		end

		local anchor = self.scaledTimeAnchor

		if anchor ~= nil then
			return self.currScaledTime + (timeScaleMgr.freezeScaledTime - anchor) * self.timeScale
		end

		if timeScaleMgr.entities[self.id] == self then
			error("Missing scaled time anchor for registered entity: " .. tostring(self.id))
		end

		return self.currScaledTime
	end

	return Time.realSecondCache
end

function ClientTimeControlComponent:EVENT_EModelCreate()
	self:applyTimeScale()
end

function ClientTimeControlComponent:EVENT_BeControlled()
	return
end

return ClientTimeControlComponent
