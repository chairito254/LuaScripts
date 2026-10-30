-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\ClientTeamRoomFollowSpriteVirtualEntity.lua

local Class = require("Core.Framework.Class")
local ClientConst = require("Const.ClientConst")
local ClientModelUtils = require("Utils.ClientModelUtils")
local ClientFollowSpriteVirtualEntity = require("Entities.ClientFollowSpriteVirtualEntity")
local ClientTeamRoomFollowSpriteVirtualEntity = Class.Class("ClientTeamRoomFollowSpriteVirtualEntity", ClientFollowSpriteVirtualEntity)

function ClientTeamRoomFollowSpriteVirtualEntity:start()
	ClientFollowSpriteVirtualEntity.start(self)

	if self.interludeTimer then
		self:removeTimer(self.interludeTimer)

		self.interludeTimer = nil
	end

	self.interludeSequence = 0

	self:scheduleNextInterlude()
end

function ClientTeamRoomFollowSpriteVirtualEntity:scheduleNextInterlude()
	self.interludeSequence = self.interludeSequence + 1

	local seed = math.abs(self.actorId or 0) * 37 + self.interludeSequence * 17
	local delay = 6 + seed % 41 / 10

	self.interludeTimer = self:addTimer(delay, function()
		self.interludeTimer = nil

		self:tryPlayInterlude()
		self:scheduleNextInterlude()
	end)
end

function ClientTeamRoomFollowSpriteVirtualEntity:refreshVisible()
	ClientFollowSpriteVirtualEntity.refreshVisible(self)
	self:setActive(ClientConst.MODEL_VISIBLE_KEY.ROBEGG_SPRITE, true)
end

function ClientTeamRoomFollowSpriteVirtualEntity:refreshAppearance()
	if IsNil(self.eModel) then
		return
	end

	self:setModelLayer(ClientConst.LayerDefine.LAYER_UI_SCENE)

	local configData = self:getConfigData()
	local modelView = self.eModel.modelModelView
	local extraData = ClientModelUtils.getModelExtraInfo(configData, 0)

	ClientModelUtils.applyModelAppearance(modelView.modelInfo, configData, extraData)

	modelView.modelInfo.physiqueModelInfo.isAlwaysAnimate = true

	modelView:RefreshModels()
end

return ClientTeamRoomFollowSpriteVirtualEntity
