-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Common\\Homeland\\ServerOrnamentBuildAttachManager.lua

local Class = require("Core.Framework.Class")
local OrnamentBuildAttachManager = require("Common.Homeland.OrnamentBuildAttachManager")
local ServerOrnamentBuildAttachManager = Class.LightClass("ServerOrnamentBuildAttachManager", OrnamentBuildAttachManager)

function ServerOrnamentBuildAttachManager:ctor()
	ServerOrnamentBuildAttachManager.super.ctor(self)
end

function ServerOrnamentBuildAttachManager:onOrnamentRemove(ornamentId)
	if self.attachData[ornamentId] then
		self.attachData[ornamentId] = nil
	end

	for childOrnamentId, attachInfo in pairs(self.attachData) do
		if attachInfo.parentId == ornamentId then
			self.attachData[childOrnamentId] = nil
		end
	end

	self:removeWallHoleData(ornamentId)
end

function ServerOrnamentBuildAttachManager:replaceWallHoleSource(holeId, wallCodes)
	local stored = self.ornamentBuildExtraData.wallHoleData
	local changed = false

	for wallId, wallData in pairs(stored) do
		if wallData[holeId] ~= wallCodes[wallId] then
			local remaining = {}

			for sourceId, code in pairs(wallData) do
				remaining[sourceId] = code
			end

			remaining[holeId] = wallCodes[wallId]
			stored[wallId] = next(remaining) and remaining or nil
			changed = true
		end
	end

	for wallId, code in pairs(wallCodes) do
		if not stored[wallId] then
			stored[wallId] = {
				[holeId] = code
			}
			changed = true
		end
	end

	return changed
end

function ServerOrnamentBuildAttachManager:applyWallHoleData(wallHoleData, clientIdMap)
	if not wallHoleData then
		return false
	end

	local changed = false

	for holeId, wallCodes in pairs(wallHoleData) do
		local realHoleId = self:getRealOrnamentId(holeId, clientIdMap)

		if realHoleId then
			local resolved = {}
			local attachInfo = self.attachData[realHoleId]

			if attachInfo and (attachInfo.slotId or 0) == 0 and self:checkAttachValid(realHoleId, attachInfo.parentId, 0) then
				for wallId, code in pairs(wallCodes) do
					local realWallId = self:getRealOrnamentId(wallId, clientIdMap)

					if realWallId and realWallId ~= realHoleId and self.ornament[realWallId] and type(code) == "number" and code > 0 and code <= 65535 and code == math.floor(code) then
						resolved[realWallId] = code
					end
				end
			end

			local sourceChanged = self:replaceWallHoleSource(realHoleId, resolved)

			changed = changed or sourceChanged
		end
	end

	return changed
end

function ServerOrnamentBuildAttachManager:removeWallHoleData(ornamentId)
	local stored = self.ornamentBuildExtraData.wallHoleData

	stored[ornamentId] = nil

	for wallId, wallData in pairs(stored) do
		local changed = false
		local remaining = {}

		for holeId, code in pairs(wallData) do
			local attachInfo = self.attachData[holeId]

			if holeId == ornamentId or not self.ornament[holeId] or not attachInfo or attachInfo.parentId == ornamentId or not self.ornament[attachInfo.parentId] then
				changed = true
			else
				remaining[holeId] = code
			end
		end

		if changed then
			stored[wallId] = next(remaining) and remaining or nil
		end
	end
end

function ServerOrnamentBuildAttachManager:getRealOrnamentId(ornamentId, clientIdMap)
	if ornamentId >= 0 then
		return ornamentId
	end

	return clientIdMap[ornamentId]
end

function ServerOrnamentBuildAttachManager:applyBuildExtraData(buildExtraData, clientIdMap)
	local changed = false
	local attachData = buildExtraData.attachData

	if attachData then
		for childOrnamentId, attachInfo in pairs(attachData) do
			local realChildId = self:getRealOrnamentId(childOrnamentId, clientIdMap)
			local realParentId = self:getRealOrnamentId(attachInfo.parentId, clientIdMap)

			if not realParentId or realParentId == 0 then
				local cleared = self:clearAttachData(realChildId)

				changed = changed or cleared
			end
		end

		for childOrnamentId, attachInfo in pairs(attachData) do
			local realChildId = self:getRealOrnamentId(childOrnamentId, clientIdMap)
			local realParentId = self:getRealOrnamentId(attachInfo.parentId, clientIdMap)

			if not realParentId or realParentId == 0 then
				-- block empty
			else
				local valid = self:addAttachData(realChildId, realParentId, attachInfo.slotId)

				if not valid then
					local cleared = self:clearAttachData(realChildId)

					changed = changed or cleared
				else
					changed = true
				end
			end
		end
	end

	local holesChanged = self:applyWallHoleData(buildExtraData.wallHoleData, clientIdMap)

	return changed or holesChanged
end

function ServerOrnamentBuildAttachManager:clearAttachData(ornamentId)
	if not ornamentId then
		return false
	end

	local changed = self:replaceWallHoleSource(ornamentId, {})

	if self.attachData[ornamentId] then
		self.attachData[ornamentId] = nil
		changed = true
	end

	return changed
end

function ServerOrnamentBuildAttachManager:addAttachData(ornamentId, parentOrnamentId, slotId)
	slotId = slotId or 0

	if not self:checkAttachValid(ornamentId, parentOrnamentId, slotId) then
		return false
	end

	local previous = self.attachData[ornamentId]

	if not previous or previous.parentId ~= parentOrnamentId or previous.slotId ~= slotId then
		self:replaceWallHoleSource(ornamentId, {})
	end

	self.attachData[ornamentId] = {
		parentId = parentOrnamentId,
		slotId = slotId
	}

	return true
end

return ServerOrnamentBuildAttachManager
