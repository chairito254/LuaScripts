-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\Utils\\BillboardEntityBridge.lua

local BillboardData = require("Data.pet_billboard_data")
local PuppetData = require("Data.puppet_data")
local ClientConst = require("Const.ClientConst")
local EntityCountConfig = require("GameApp.EntityCount.Config.EntityCountConfig")
local Class = require("Core.Framework.Class")
local billboardEntityManager
local BillboardEntityBridge = Class.OldLightClass("BillboardEntityBridge", nil, true)

function BillboardEntityBridge:ctor()
	billboardEntityManager = appFacade.billboardEntityManager
	self.staticIds = {}
	self.displayX, self.displayZ = {}, {}
	self.owners = {}
	self.registeredConfigs = {}
	self.templateScales = {}
end

function BillboardEntityBridge.getForEntityType(entityType)
	if entityType ~= "ClientPuppet" or not ClientConst.ENABLE_BILLBOARD_ENTITY then
		return nil
	end

	return BillboardEntityBridge.GetInstance()
end

function BillboardEntityBridge:captureTransform(entity, summaryPosition)
	local position = entity and entity:getPosition() or summaryPosition
	local px, py, pz = position[1], position[2], position[3]

	if not entity then
		return px, py, pz, 0, 0, 0, 1
	end

	local rotation = entity:getRotation()

	return px, py, pz, rotation[1], rotation[2], rotation[3], rotation[4], entity:getModelScale()
end

function BillboardEntityBridge:_getTemplateScale(templateId)
	local scale = self.templateScales[templateId]

	if scale == nil then
		local puppet = PuppetData[templateId]

		scale = puppet and puppet.modelScale or 1
		self.templateScales[templateId] = scale
	end

	return scale
end

function BillboardEntityBridge:_getConfig(templateId)
	local key = templateId
	local config = BillboardData[key]

	if not config then
		local puppet = PuppetData[templateId]

		key = puppet and puppet.refId
		config = key and BillboardData[key]
	end

	return key, config
end

function BillboardEntityBridge:_isOutsideRange(templateId, px, pz)
	local _, config = self:_getConfig(templateId)
	local playerPos = pg.playerPos

	if not config or not playerPos then
		return false
	end

	local range = EntityCountConfig.billboardDistanceMeters
	local dx, dz = math.abs(px - playerPos[1]), math.abs(pz - playerPos[3])

	return range < dx or range < dz
end

function BillboardEntityBridge:_ensureConfig(templateId)
	local key, config = self:_getConfig(templateId)

	if not config then
		return nil
	end

	if not self.registeredConfigs[key] then
		local center, size = config.center, config.size

		if not billboardEntityManager:RegisterConfig(key, config.texturePath, center[1], center[2], center[3], size[1], size[2], size[3], size[4]) then
			return nil
		end

		self.registeredConfigs[key] = true
	end

	return key
end

function BillboardEntityBridge:has(id)
	return self.staticIds[id] ~= nil
end

function BillboardEntityBridge:show(id, templateId, position, staticId)
	if not position then
		return false
	end

	if self.staticIds[id] == staticId and staticId ~= nil then
		if self:_isOutsideRange(templateId, self.displayX[id], self.displayZ[id]) then
			return true
		end

		self:remove(id)

		return false
	end

	return self:showAt(id, templateId, position[1], position[2], position[3], 0, 0, 0, 1, nil, staticId)
end

function BillboardEntityBridge:_getAvailableStaticIdKey(id, templateId, staticId)
	if id == nil or templateId == nil or staticId == nil then
		return nil
	end

	if self.owners[staticId] == nil or self.owners[staticId] == id then
		return staticId
	end
end

function BillboardEntityBridge:showAt(id, templateId, px, py, pz, qx, qy, qz, qw, scale, staticId)
	local identity = self:_getAvailableStaticIdKey(id, templateId, staticId)

	if not identity then
		return false
	end

	if not self:_isOutsideRange(templateId, px, pz) then
		self:remove(id)

		return false
	end

	scale = scale or self:_getTemplateScale(templateId)

	local previousStaticId = self.staticIds[id]

	if previousStaticId == staticId then
		billboardEntityManager:SetTransform(staticId, px, py, pz, qx, qy, qz, qw, scale)
	else
		local key = self:_ensureConfig(templateId)

		if not key then
			return false
		end

		if not billboardEntityManager:TrackCounted(staticId, key, px, py, pz, qx, qy, qz, qw, scale) then
			return false
		end

		if previousStaticId then
			self:remove(id)
		end

		self.staticIds[id] = staticId
		self.owners[identity] = id
	end

	self.displayX[id], self.displayZ[id] = px, pz

	return true
end

function BillboardEntityBridge:updatePosition(id, position)
	local staticId = self.staticIds[id]

	if not staticId or not position then
		return false
	end

	billboardEntityManager:SetPosition(staticId, position[1], position[2], position[3])

	self.displayX[id], self.displayZ[id] = position[1], position[3]

	return true
end

function BillboardEntityBridge:remove(id)
	local staticId = self.staticIds[id]

	if not staticId then
		return false
	end

	self.staticIds[id] = nil
	self.displayX[id], self.displayZ[id] = nil
	self.owners[staticId] = nil

	billboardEntityManager:Remove(staticId)

	return true
end

function BillboardEntityBridge:clear()
	billboardEntityManager:Clear()

	for id in pairs(self.staticIds) do
		self.staticIds[id], self.displayX[id], self.displayZ[id] = nil
	end

	for staticId in pairs(self.owners) do
		self.owners[staticId] = nil
	end

	for key in pairs(self.registeredConfigs) do
		self.registeredConfigs[key] = nil
	end

	for templateId in pairs(self.templateScales) do
		self.templateScales[templateId] = nil
	end
end

return BillboardEntityBridge
