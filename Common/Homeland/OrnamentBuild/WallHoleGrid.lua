-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Homeland\\OrnamentBuild\\WallHoleGrid.lua

local Class = require("Core.Framework.Class")
local ResLoader = require("GameApp.ResLoad.ResLoader")
local WallHoleGrid = Class.LightClass("WallHoleGrid")

WallHoleGrid.RES_ID = "$P_Gridlines.prefab"
WallHoleGrid.CELL_SIZE = 0.5

function WallHoleGrid:ctor()
	self.slots = {}
end

function WallHoleGrid.getGridOffset(width, height)
	return width * 0.5 + WallHoleGrid.CELL_SIZE * 0.5, height * 0.5 + WallHoleGrid.CELL_SIZE * 0.5
end

function WallHoleGrid:apply(slot)
	local obj = slot.loader.obj

	if IsNil(obj) then
		return
	end

	local transform = obj.transform

	transform.position = Vector3(slot.x, slot.y, slot.z)
	transform.rotation = Quaternion(slot.qx, slot.qy, slot.qz, slot.qw)
	transform.localScale = Vector3(slot.width * 0.1, slot.height * 0.1, slot.height * 0.1)

	if not slot.renderer then
		slot.renderer = obj:GetComponent(typeof(CS.UnityEngine.Renderer))
		slot.sourceMaterial = slot.renderer.sharedMaterial
		slot.material = CS.UnityEngine.Material(slot.sourceMaterial)
		slot.renderer.sharedMaterial = slot.material
	end

	local offsetX, offsetY = WallHoleGrid.getGridOffset(slot.width, slot.height)

	slot.material:SetFloat("_GridMode", 0)
	slot.material:SetFloat("_GridSpacing", WallHoleGrid.CELL_SIZE)
	slot.material:SetVector("_GridOffset", Vector4(offsetX, offsetY, 0, 0))
	slot.material:SetVector("_SubGridAlpha", Vector4(0, 0, 0, 0))
	slot.loader:setActive(slot.visible)
end

function WallHoleGrid:show(index, position, rotation, width, height)
	local slot = self.slots[index]
	local isNew = not slot

	if isNew then
		slot = {
			loader = ResLoader.new()
		}
		self.slots[index] = slot
	end

	slot.x, slot.y, slot.z = position.x, position.y, position.z
	slot.qx, slot.qy, slot.qz, slot.qw = rotation.x, rotation.y, rotation.z, rotation.w
	slot.width, slot.height = width, height
	slot.visible = true

	if isNew then
		slot.loader:load(self.RES_ID, function()
			if self.slots[index] ~= slot then
				slot.loader:clear()

				return
			end

			self:apply(slot)
		end, true)
	else
		self:apply(slot)
	end
end

function WallHoleGrid:hideAfter(count)
	for index = count + 1, #self.slots do
		local slot = self.slots[index]

		if slot.visible then
			slot.visible = false

			slot.loader:setActive(false)
		end
	end
end

function WallHoleGrid:clear()
	local oldSlots = self.slots

	self.slots = {}

	for _, slot in ipairs(oldSlots) do
		if slot.material then
			if not IsNil(slot.renderer) then
				slot.renderer.sharedMaterial = slot.sourceMaterial
			end

			CS.UnityEngine.Object.Destroy(slot.material)

			slot.material = nil
		end

		slot.loader:destroy()
	end
end

return WallHoleGrid
