-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\CustomTypes\\PetShinyStyleRandomMap.lua

local CustomDict = require("Core.PropertySync.CustomDict")
local class = require("Core.Framework.Class")
local lume = require("Core.Common.lume")
local Utils = require("Common.Utils.Utils")
local SysConfigData = require("Data.sys_config_data")
local PetShinyStyleRandomMap = class.LiteClass("PetShinyStyleRandomMap", CustomDict)

function PetShinyStyleRandomMap:randomShinyStyleRareLimit()
	local limitWeightDict = {}

	for _, limitConfig in ipairs(SysConfigData.createShinyStyleRareLimit or {}) do
		local numLow = math.floor(tonumber(limitConfig[1]) or 0)
		local numUp = math.floor(tonumber(limitConfig[2]) or 0)
		local weight = tonumber(limitConfig[3]) or 0

		if numLow > 0 and numLow <= numUp and weight > 0 then
			for limit = numLow, numUp do
				limitWeightDict[limit] = (limitWeightDict[limit] or 0) + weight
			end
		end
	end

	self.rareCountLimit = lume.weightedchoice(limitWeightDict) or 0
	self.noRareCount = 0

	return self.rareCountLimit
end

function PetShinyStyleRandomMap:ensureShinyStyleRareLimit()
	if (self.rareCountLimit or 0) <= 0 then
		return self:randomShinyStyleRareLimit()
	end

	return self.rareCountLimit
end

function PetShinyStyleRandomMap:resolveCreateShinyStyle(shinyStyle, randomGroup, label)
	local rareCountLimit = self:ensureShinyStyleRareLimit()
	local noRareCount = (self.noRareCount or 0) + 1

	self.noRareCount = noRareCount
	randomGroup = tonumber(randomGroup) or 1
	shinyStyle = tonumber(shinyStyle) or 0

	if shinyStyle <= 0 then
		shinyStyle = Utils.randomPetShinyStyle(randomGroup, label, nil)
	end

	local isRare = Utils.isRarePetShinyStyle(shinyStyle)
	local forceRare = not isRare and rareCountLimit > 0 and rareCountLimit <= noRareCount

	if forceRare then
		local rareShinyStyle = Utils.randomPetRareShinyStyle(randomGroup, label, nil)

		if rareShinyStyle and rareShinyStyle > 0 then
			shinyStyle = rareShinyStyle
			isRare = true
		end
	end

	if isRare then
		self:randomShinyStyleRareLimit()
	end

	return shinyStyle, forceRare, noRareCount, rareCountLimit
end

function PetShinyStyleRandomMap:getPetRandomInfo(petId, upsert)
	if not petId or petId == "" then
		return nil
	end

	local info = self[petId]

	if not info and upsert then
		self[petId] = {}
		info = self[petId]
	end

	return info
end

function PetShinyStyleRandomMap:shouldForceRare(petInfo)
	if not petInfo then
		return false
	end

	local info = self:getPetRandomInfo(petInfo.id, true)

	if not info then
		return false
	end

	local lastRareShinyStyle = info.lastRareShinyStyle or 0

	if lastRareShinyStyle <= 0 and Utils.isRarePetShinyStyle(petInfo.shinyStyle) then
		info.lastRareShinyStyle = petInfo.shinyStyle
	end

	local rareLimit = tonumber(SysConfigData.rerollShinyStyleRareLimit) or 0

	if rareLimit <= 0 then
		return false
	end

	info.washNoRareCount = (info.washNoRareCount or 0) + 1

	return rareLimit <= info.washNoRareCount
end

function PetShinyStyleRandomMap:getLastRareShinyStyle(petId)
	local info = self:getPetRandomInfo(petId, false)

	return info and info.lastRareShinyStyle or 0
end

function PetShinyStyleRandomMap:recordRandomResult(petId, shinyStyle, isRare)
	local info = self:getPetRandomInfo(petId, isRare)

	if not info then
		return
	end

	if isRare then
		info.washNoRareCount = 0
		info.lastRareShinyStyle = shinyStyle
	end
end

return PetShinyStyleRandomMap
