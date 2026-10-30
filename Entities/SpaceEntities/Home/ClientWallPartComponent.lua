-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\Home\\ClientWallPartComponent.lua

local Class = require("Core.Framework.Class")
local Const = require("Common.Const.Const")
local ClientConst = require("Const.ClientConst")
local WallHoleUtils = require("Common.Homeland.OrnamentBuild.WallHoleUtils")
local ClientWallPartComponent = Class.Component("ClientWallPartComponent")

function ClientWallPartComponent:tryLoadWallParts(config)
	if not pg.game.home.ENABLE_WALL_HOLE then
		return false
	end

	local wall = WallHoleUtils.getWallConfig(self.homeTemplateId)

	if not wall then
		return false
	end

	if not self.wallPartConfig then
		self.wallPartConfig = wall
		self.wallPartNodes = {}
		self.wallPartLoaded = {}
		self.wholeWallPart = {
			prefabResID = config.prefabResID
		}

		self:refreshWallPartRendererBatch()
		self.eModel:InitItemParts(Const.COMPONENT_IDX_ITEM)
	end

	self:refreshWallParts()

	return true
end

function ClientWallPartComponent:refreshWallPartRendererBatch()
	if self.tempDisableRendererBatch then
		self:tempDisableRendererBatch(ClientConst.DisableBatchReason.WALL_PART_HIDDEN, self.visible == false)
	end
end

function ClientWallPartComponent:refreshWallParts()
	if not self.wallPartConfig or self.isDestroyed then
		return
	end

	local holes = self.previewWallHoles

	if holes == nil or not pg.game.home.ENABLE_WALL_HOLE then
		holes = pg.game.home:getOrnamentWallHoles(self.ornamentId, self.space)
	end

	local desired, hasCoveredCells = WallHoleUtils.selectParts(self.wallPartConfig, holes)

	if not hasCoveredCells then
		desired = {
			[0] = self.wholeWallPart
		}
	end

	local previous = self.wallPartNodes

	self.wallPartNodes = desired

	for partId, node in pairs(previous) do
		if desired[partId] ~= node then
			self.wallPartLoaded[partId] = nil

			self.eModel:RemoveItemPart(Const.COMPONENT_IDX_ITEM, partId)
			pg.game.home:refreshShadows()
		end
	end

	for partId, node in pairs(desired) do
		if previous[partId] ~= node or self.wallPartLoaded[partId] == false then
			self.wallPartLoaded[partId] = nil

			local position = node.position
			local rotation = node.rotation

			self.eModel:LoadItemPart(Const.COMPONENT_IDX_ITEM, partId, node.prefabResID, position and Vector3(position[1], position[2], position[3]) or Vector3.zero, rotation and Quaternion.Euler(rotation[1], rotation[2], rotation[3]) or Quaternion.identity, Vector3.one)
		end
	end

	self:tryFinishWallPartLoad()
end

function ClientWallPartComponent:refreshWallPartColliders()
	if self.templateEntityType then
		self.eModel:SetHomeObjectTemplateCollider(Const.COMPONENT_IDX_PHYSX)
	else
		self.eModel:SetHomeObjectCollider(Const.COMPONENT_IDX_PHYSX)
	end

	self.eModel:SetTag(Const.COMPONENT_IDX_PHYSX, Const.TAG_ACTOR, self.actorId, 0)
end

function ClientWallPartComponent:onItemPartLoaded(partId, success)
	if not self.wallPartNodes or not self.wallPartNodes[partId] then
		return
	end

	if not success then
		self.wallPartLoaded[partId] = false

		self.logger:error("Wall part load failed, ornamentId=%s, partId=%s", tostring(self.ornamentId), tostring(partId))

		return
	end

	self.wallPartLoaded[partId] = true

	self:refreshWallPartColliders()

	if self.wallPartModelNotified and self.innerSetEditorOutline then
		self:innerSetEditorOutline(self.enableHomeEditorOutline, self.homeEditorMaterialId, self.overrideOutlineMatId, true)
	end

	self:tryFinishWallPartLoad()
	pg.game.home:refreshShadows()
end

function ClientWallPartComponent:tryFinishWallPartLoad()
	if self.wallPartModelNotified then
		return
	end

	for partId in pairs(self.wallPartNodes) do
		if not self.wallPartLoaded[partId] then
			return
		end
	end

	self.wallPartModelNotified = true

	self:onItemModelLoaded()
end

return ClientWallPartComponent
