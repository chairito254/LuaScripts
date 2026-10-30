-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\SeasonCalendar\\SeasonTreeActivityItemRenderer.lua

local ClientTextUtils = require("Utils.ClientTextUtils")
local SeasonTreeActivityItemRenderer = {}

function SeasonTreeActivityItemRenderer.renderList(listUList, itemList)
	if not listUList then
		return
	end

	function listUList.luaRenderItem(button, index, itemData)
		SeasonTreeActivityItemRenderer.renderItem(button, itemData)
	end

	listUList:SetList(itemList or {})
end

function SeasonTreeActivityItemRenderer.renderItem(button, itemData)
	if not button or not itemData then
		return
	end

	button.luaClick = nil

	button:TryChangePage("State", itemData.state or 0)

	local objectReference = button:GetComponent("ObjectReference")

	if not objectReference then
		return
	end

	local petIconUImage = objectReference:GetRefValue("petIconUImage")
	local petIcon2UImage = objectReference:GetRefValue("petIcon2UImage")
	local weekUSDFText = objectReference:GetRefValue("weekUSDFText")
	local timeUSDFText = objectReference:GetRefValue("timeUSDFText")
	local indexUImage = objectReference:GetRefValue("indexUImage")
	local iconUrl = itemData.icon or ""

	if petIconUImage then
		petIconUImage.url = iconUrl
	end

	if petIcon2UImage then
		petIcon2UImage.url = iconUrl
	end

	if indexUImage then
		indexUImage.url = "$UI_Img_Event_Season_Overview_Bar_Num" .. itemData.index .. ".png"
	end

	local weekText = itemData.text and pg.getLocalizationText(itemData.text) or ""

	ClientTextUtils.setText(weekUSDFText, weekText)
	ClientTextUtils.setText(timeUSDFText, itemData.timeText or "")
end

return SeasonTreeActivityItemRenderer
