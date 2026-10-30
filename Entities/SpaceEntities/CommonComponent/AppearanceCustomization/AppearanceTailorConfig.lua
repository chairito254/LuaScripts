-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Entities\\SpaceEntities\\CommonComponent\\AppearanceCustomization\\AppearanceTailorConfig.lua

local AppearanceTailorConfig = {}
local AppearanceFormConfig = require("Entities.SpaceEntities.CommonComponent.AppearanceCustomization.AppearanceFormConfig")

function AppearanceTailorConfig.getOption(config, index)
	if not config or config.type ~= 2 or not AppearanceFormConfig.isConfigTable(config.tailor) then
		return nil
	end

	local row = config.tailor[index]

	if not AppearanceFormConfig.isConfigTable(row) then
		return nil
	end

	local structured = AppearanceFormConfig.isConfigTable(row[1])
	local meshes = structured and row[1] or row

	if #meshes == 0 then
		return nil
	end

	for _, name in ipairs(meshes) do
		if type(name) ~= "string" or name == "" then
			return nil
		end
	end

	local icon = structured and row[2] or nil

	return {
		meshes = meshes,
		icon = type(icon) == "string" and icon ~= "" and icon or nil,
		name = structured and row[3] or nil,
		initialClaim = structured and row[4] or nil
	}
end

function AppearanceTailorConfig.isUnlocked(entity, itemId, index, appearanceData)
	if index == 0 then
		return true
	end

	local option = AppearanceTailorConfig.getOption(appearanceData[itemId], index)

	if not option then
		return false
	end

	if option.initialClaim == 1 then
		return true
	end

	local player = entity and (entity.copyEntity or entity)
	local unlocks = player and player.tailorUnlockInfos
	local unlocked = unlocks and unlocks[itemId]

	return unlocked ~= nil and not not unlocked[index]
end

return AppearanceTailorConfig
