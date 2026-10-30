-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\TopLogo\\Component\\TopLogoSpaceFollowComponent.lua

local Class = require("Core.Framework.Class")
local Time = require("Core.Common.Time")
local EventConst = require("Const.EventConst")
local SysConfigData = require("Data.sys_config_data")
local TopLogoItemComponent = require("Guis.Panels.TopLogo.Component.TopLogoItemComponent")
local TopLogoConst = require("Const.TopLogoConst")
local AppearanceActionData = require("Data.appearance_action_data")
local TopLogoSpaceFollowComponent = Class.LightClass("TopLogoSpaceFollowComponent", TopLogoItemComponent)

function TopLogoSpaceFollowComponent.resolveVehicleStateFromEntity(entity)
	local owner = entity and (entity.master or entity.getMasterEntity and entity:getMasterEntity() or entity)

	if not owner then
		return nil
	end

	local target = owner
	local info = owner.vehicleRideTipInfo

	if owner == pg.me then
		target = pg.pawn or owner

		if owner._localVehicleRideTipInfo ~= nil then
			info = owner._localVehicleRideTipInfo
		end
	elseif owner.isControllingPet and owner:isControllingPet() then
		target = owner:getCurPetEntity()
	end

	local valid = target == entity and info and (info.requestId or 0) > 0 and (info.expireAt or 0) > Time.getSecond()

	if valid then
		return info
	end

	return nil
end

function TopLogoSpaceFollowComponent.resolveFriendStateFromEntity(entity)
	local topLogoData = entity and entity.topLogoData
	local info = topLogoData and topLogoData.spaceFollowInfo

	if info and info.expireAt > Time.getSecond() then
		return info
	end

	if topLogoData then
		topLogoData.spaceFollowInfo = nil
	end

	return nil
end

function TopLogoSpaceFollowComponent:ctor(refUContainer, topLogoItem)
	TopLogoSpaceFollowComponent.super.ctor(self, refUContainer, topLogoItem)
end

function TopLogoSpaceFollowComponent:onCtor()
	self:restoreStateFromEntity()
end

function TopLogoSpaceFollowComponent:shouldBeActive()
	return self.commandVisible == true
end

function TopLogoSpaceFollowComponent:innerGetVisible()
	return TopLogoSpaceFollowComponent.super.innerGetVisible(self) and self.commandVisible == true
end

function TopLogoSpaceFollowComponent:resetRender()
	self:hideCountDown()

	self.countDown = nil
	self.rootComponent = nil
	self.followIconUImage = nil

	TopLogoSpaceFollowComponent.super.resetRender(self)
end

function TopLogoSpaceFollowComponent:onDestroy()
	self.entity.eventEmitter:removeEventListener(EventConst.TOPLOGO_FRIEND_INTERACT, self.onShowCountDown)
	self:killTimer(self.m_expireTimer)

	self.m_expireTimer = nil
	self.m_expireAt = nil
	self.m_expireVersion = (self.m_expireVersion or 0) + 1

	self:hideCountDown()
	TopLogoSpaceFollowComponent.super.onDestroy(self)

	self.m_cacheSaceFollowFunc = nil
end

function TopLogoSpaceFollowComponent:findObjects()
	local objectReference = self.refUContainer.content:GetComponent("ObjectReference")

	self.countDown = objectReference:GetRefValue("countDown")
	self.rootComponent = objectReference:GetRefValue("rootComponent")
	self.followIconUImage = objectReference:GetRefValue("followIconUImage")
end

function TopLogoSpaceFollowComponent:addListener()
	if not self.countDown then
		return
	end

	function self.countDown.luaFinished()
		self:restoreStateFromEntity()
	end
end

function TopLogoSpaceFollowComponent:initUI()
	self:restoreStateFromEntity()
end

function TopLogoSpaceFollowComponent:addEntityListener()
	function self.m_cacheSaceFollowFunc(loaded)
		if loaded then
			self:restoreStateFromEntity()
		end
	end

	function self.onShowCountDown(isVisible, showType, actionId)
		local topLogoData = self.entity.topLogoData

		if isVisible == true then
			local now = Time.getSecond()

			topLogoData.spaceFollowInfo = {
				showType = showType,
				actionId = actionId,
				createdAt = now,
				expireAt = now + 10
			}
		else
			topLogoData.spaceFollowInfo = nil
		end

		self:restoreStateFromEntity()
	end

	self.entity.eventEmitter:addEventListener(EventConst.TOPLOGO_FRIEND_INTERACT, self.onShowCountDown)
end

function TopLogoSpaceFollowComponent:restoreStateFromEntity()
	local now = Time.getSecond()
	local friendInfo = TopLogoSpaceFollowComponent.resolveFriendStateFromEntity(self.entity)
	local vehicleInfo = TopLogoSpaceFollowComponent.resolveVehicleStateFromEntity(self.entity)
	local state = vehicleInfo or friendInfo

	self.commandVisible = state ~= nil
	self.showType = vehicleInfo and 3 or friendInfo and friendInfo.showType or 0
	self.actionId = not vehicleInfo and friendInfo and friendInfo.actionId or nil
	self.m_displayState = state

	local expireAt = state and state.expireAt

	if friendInfo then
		expireAt = expireAt and math.min(expireAt, friendInfo.expireAt)
	end

	if self.m_expireAt ~= expireAt then
		self:killTimer(self.m_expireTimer)

		self.m_expireAt = expireAt
		self.m_expireTimer = nil
		self.m_expireVersion = (self.m_expireVersion or 0) + 1

		if expireAt then
			local version = self.m_expireVersion

			self.m_expireTimer = self:startTimer(function()
				if self.m_expireVersion ~= version then
					return
				end

				self.m_expireTimer = nil
				self.m_expireAt = nil

				self:restoreStateFromEntity()
			end, math.max(0, expireAt - now), false)
		end
	end

	self:refreshVisible(true)
	self:notifyActiveStateChanged(self:shouldBeActive())

	if not self:checkSpaceFollowItemVisible() then
		self:hideCountDown()
	elseif self:checkContainerLoaded() then
		self:handleCountDown()
	elseif self.topLogoItem:isTopLogoPrefabReady() then
		self:checkAndLoadUContainerUrlSupportAsync(self.m_cacheSaceFollowFunc, TopLogoConst.REF_CONTAINER_LOADED_CALLBACK_GROUP.CB_FUNC1)
	end
end

function TopLogoSpaceFollowComponent:handleCountDown()
	if IsNil(self.rootComponent) then
		return
	end

	local state = self.m_displayState
	local remaining = state and state.expireAt - Time.getSecond() or 0

	self.rootComponent:SetActiveFastest(remaining > 0)

	if remaining <= 0 then
		return
	end

	if NotNil(self.countDown) then
		local total = math.max(remaining, state.expireAt - (state.createdAt or 0))

		self.countDown:Play(remaining, total)
	end

	self.rootComponent:TryChangePage("IconState", self.showType)

	if self.actionId then
		self.followIconUImage.url = AppearanceActionData[self.actionId] and AppearanceActionData[self.actionId].icon or ""
	end
end

function TopLogoSpaceFollowComponent:checkSpaceFollowItemVisible()
	return self:checkFinalVisible() and self.commandVisible == true
end

function TopLogoSpaceFollowComponent:removeCountDown()
	self:restoreStateFromEntity()
end

function TopLogoSpaceFollowComponent:hideCountDown()
	if NotNil(self.countDown) then
		self.countDown:Stop()
	end

	if IsNil(self.rootComponent) then
		return
	end

	self.rootComponent:SetActiveFastest(false)
end

function TopLogoSpaceFollowComponent:checkTopLogoCompUpdate()
	return false
end

function TopLogoSpaceFollowComponent:refreshTopLogoInfo(callFromUpdate)
	self:restoreStateFromEntity()
end

function TopLogoSpaceFollowComponent:getInitMaxDistance()
	return SysConfigData.NPC_TOPLOGO_DISTANCE
end

return TopLogoSpaceFollowComponent
