-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\Tips\\Items\\A1TipArea\\WorldRaceFinishMoreItem.lua

local Class = require("Core.Framework.Class")
local WorldRaceFinishItem = require("Guis.Panels.Tips.Items.A1TipArea.WorldRaceFinishItem")
local ClientTextUtils = require("Utils.ClientTextUtils")
local WorldRaceFinishMoreItem = Class.LightClass("WorldRaceFinishMoreItem", WorldRaceFinishItem)

function WorldRaceFinishMoreItem:renderItem(item, data)
	local objectReference = item:GetComponent("ObjectReference")

	self.rootUComponent = objectReference:GetRefValue("rootUComponent")
	self.subUSDFText = objectReference:GetRefValue("subUSDFText")
	self.numUImage = objectReference:GetRefValue("numUImage")

	local num1USDFText = objectReference:GetRefValue("num1USDFText")
	local num2USDFText = objectReference:GetRefValue("num2USDFText")
	local num3USDFText = objectReference:GetRefValue("num3USDFText")
	local titleUSDFText = objectReference:GetRefValue("titleUSDFText")
	local rank = math.max(tonumber(data.rank) or 1, 1)

	ClientTextUtils.setText(num1USDFText, "1")
	ClientTextUtils.setText(num2USDFText, "2")
	ClientTextUtils.setText(num3USDFText, "3")
	ClientTextUtils.setText(titleUSDFText, tostring(rank))

	self.numUImage.url = string.format("$UI_Img_HUD_Racing_Ranking_Finish_Num%d.png", rank)

	self.rootUComponent:TryChangePage("State", math.min(rank - 1, 3))
	ClientTextUtils.setText(self.subUSDFText, pg.getGameString("RACING_FINISH_GAME_MULT"))
end

return WorldRaceFinishMoreItem
