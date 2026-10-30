-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomeBookSeasonSwitch\\HomeBookSeasonSwitchModel.lua

local Class = require("Core.Framework.Class")
local UIModel = require("Guis.UIModel")
local HomeBookDataUtils = require("Utils.HomeBookDataUtils")
local HomeBookSeasonSwitchModel = Class.LightClass("HomeBookSeasonSwitchModel", UIModel)

function HomeBookSeasonSwitchModel:setContext(info)
	info = info or {}
	self.currentSeasonId = info.currentSeasonId or HomeBookDataUtils.getDisplaySeasonId()
	self.onSelect = info.onSelect
end

function HomeBookSeasonSwitchModel.getSeasonTemplateIndex(seasonId, templateCount)
	if seasonId < 1 then
		return nil
	end

	local tIndex = seasonId - 1

	if templateCount <= 0 then
		return nil
	end

	if tIndex < 0 or templateCount <= tIndex then
		return nil
	end

	return tIndex
end

function HomeBookSeasonSwitchModel:getCardList(templateCount)
	local cards = {}

	for _, seasonId in ipairs(HomeBookDataUtils.getSwitchableSeasonIds()) do
		if HomeBookDataUtils.isSeasonStarted(seasonId) then
			local tIndex = HomeBookSeasonSwitchModel.getSeasonTemplateIndex(seasonId, templateCount)

			if tIndex then
				local card = HomeBookDataUtils.getSeasonSwitchCardData(seasonId, self.currentSeasonId)

				if card then
					card.tIndex = tIndex
					cards[#cards + 1] = card
				end
			end
		end
	end

	return cards
end

return HomeBookSeasonSwitchModel
