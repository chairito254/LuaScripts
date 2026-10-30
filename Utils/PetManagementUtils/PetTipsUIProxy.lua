-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetTipsUIProxy.lua

local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local ClientTextUtils = require("Utils.ClientTextUtils")
local PetDetailPropertyData = require("Data.pet_detail_property_data")
local Lume = require("Core.Common.lume")

return function(PetManagementUtils)
	function PetManagementUtils.renderReleaseTips(petInfos, widgetTipsUWidget, txtTipsUSDFText, richTextColor, needCultivation)
		local shinyCount = 0
		local magicCount = 0
		local rainBowCount = 0
		local variantCount = 0
		local bossCount = 0
		local ratingCount = 0
		local darkCount = 0
		local cultivationCount = 0

		for _, petInfo in pairs(petInfos) do
			if petInfo.isShiny then
				shinyCount = shinyCount + 1
			end

			if petInfo.isRainbow then
				rainBowCount = rainBowCount + 1
			end

			if petInfo.isDark then
				darkCount = darkCount + 1
			end

			if petInfo.isVariant then
				variantCount = variantCount + 1
			end

			if petInfo.isBoss then
				bossCount = bossCount + 1
			end

			if petInfo.rating and petInfo.rating >= 3 and not petInfo.isCatchReportingStatus then
				ratingCount = ratingCount + 1
			end

			if needCultivation then
				local isCultivated = petInfo.isCultivated

				if isCultivated == nil then
					isCultivated = pg.game.petManage:hasPetCultivation(petInfo.id)
				end

				if isCultivated then
					cultivationCount = cultivationCount + 1
				end
			end
		end

		if shinyCount <= 0 and rainBowCount <= 0 and darkCount <= 0 and variantCount <= 0 and bossCount <= 0 and ratingCount <= 0 and magicCount < 1 and cultivationCount <= 0 then
			widgetTipsUWidget.gameObject:SetActiveEx(false)

			return
		end

		widgetTipsUWidget.gameObject:SetActiveEx(true)

		local numCount = Lume.count(petInfos)

		if richTextColor then
			numCount = string.format("<color=%s>%d</color>", richTextColor, numCount)
		else
			numCount = string.format("<style=Hint_BgL>%d</style>", numCount)
		end

		local txt = string.format(pg.getGameString("PET_MANAGEMENT_RELEASE_CHECK_1"), numCount)

		local function appendCountText(count, description)
			if count > 0 then
				local subNumCount = count

				if richTextColor then
					subNumCount = string.format("<color=%s>%d</color>", richTextColor, count)
				else
					subNumCount = string.format("<style=Hint_BgL>%d</style>", count)
				end

				txt = txt .. string.format(pg.getGameString("PET_MANAGEMENT_RELEASE_CHECK_2"), subNumCount, description)
			end
		end

		appendCountText(shinyCount, pg.getGameString("PET_MANAGEMENT_SHINY"))
		appendCountText(darkCount, pg.getGameString("PET_MANAGEMENT_DARK"))
		appendCountText(rainBowCount, pg.getGameString("PET_MANAGEMENT_RAINBOW"))
		appendCountText(variantCount, pg.getGameString("PET_MANAGEMENT_COLOUR"))
		appendCountText(bossCount, pg.getGameString("PET_MANAGEMENT_BOSS"))
		appendCountText(ratingCount, pg.getGameString("PET_MANAGEMENT_TALENT"))

		if needCultivation then
			appendCountText(cultivationCount, pg.getGameString("PET_MANAGEMENT_CULTIVATION"))
		end

		if cultivationCount > 0 then
			txt = txt .. pg.getGameString("PET_RELEASE_TIP_IMPORT_USEITEM")
		end

		txt = txt:gsub("，%s*$", ""):gsub(",%s*$", "")

		ClientTextUtils.setText(txtTipsUSDFText, txt)

		return txt
	end

	function PetManagementUtils.customRefreshBuffInfoTooltip(component, group, customData)
		local objectReference = component:GetComponent("ObjectReference")
		local buffNameUText = objectReference:GetRefValue("buffNameUText")
		local buffDetailUText = objectReference:GetRefValue("buffDetailUText")
		local iconUImage = objectReference:GetRefValue("iconUImage")
		local buffNumUText = objectReference:GetRefValue("buffNumUText")
		local txtAddUSDFText = objectReference:GetRefValue("txtAddUSDFText")
		local imgBgBaseUWidget = objectReference:GetRefValue("imgBgBaseUWidget")
		local txtTagBaseUSDFText = objectReference:GetRefValue("txtTagBaseUSDFText")
		local imgBgAddUWidget = objectReference:GetRefValue("imgBgAddUWidget")
		local txtTagAddUSDFText = objectReference:GetRefValue("txtTagAddUSDFText")

		iconUImage:SetActive(true)

		group = group or PetManagementDataHelper.BuffInfoToolTipType.Buff
		customData = customData or {}

		component:TryChangePage("GroupType", group - 1)
		component:TryChangePage("InfoState", 1)

		if group == PetManagementDataHelper.BuffInfoToolTipType.Buff then
			local buffName = customData.buffName or ""
			local buffDesc = customData.buffDesc or ""
			local buffIcon = customData.buffIcon or ""

			ClientTextUtils.setText(buffNameUText, buffName)
			ClientTextUtils.setText(buffDetailUText, buffDesc)

			iconUImage.url = buffIcon
		elseif group == PetManagementDataHelper.BuffInfoToolTipType.Quality then
			local quality = customData.quality or 0
			local buffName = pg.getLocalizationText(customData.buffName or "")
			local buffDesc = pg.getLocalizationText(customData.buffDesc or "")
			local buffIcon = customData.buffIcon or ""

			component:TryChangePage("Quality", quality)
			ClientTextUtils.setText(buffNameUText, buffName)
			ClientTextUtils.setText(buffDetailUText, buffDesc)

			iconUImage.url = buffIcon
		elseif group == PetManagementDataHelper.BuffInfoToolTipType.Cultivate then
			local index = customData.index or 0
			local recommend = customData.recommend or {}
			local propertyEnhanced = customData.propertyEnhanced or false
			local propLevel = customData.propLevel or {}
			local info = PetDetailPropertyData[index] and PetDetailPropertyData[index][1]

			if LuaUIUtils.tableContains(recommend, index) then
				component:TryChangePage("GoodState", 1)
			else
				component:TryChangePage("GoodState", 0)
			end

			component:TryChangePage("Updated", propertyEnhanced and 1 or 0)
			ClientTextUtils.setText(buffNameUText, pg.getLocalizationText(info.propName))
			ClientTextUtils.setText(buffDetailUText, pg.getLocalizationText(info.dec))

			iconUImage.url = info.icon
			propLevel = propLevel or {}

			ClientTextUtils.setText(txtAddUSDFText, string.format("+%d", propLevel.baseAndActiveTotalLv))
			ClientTextUtils.setText(txtTagBaseUSDFText, pg.getGameString("PET_BASE_VALUE_DESC") .. " " .. propLevel.complexBaseLv)
			ClientTextUtils.setText(txtTagAddUSDFText, pg.getGameString("PET_ADD_VALUE_DESC") .. " " .. propLevel.learnt)
			imgBgAddUWidget:SetActive(propLevel.baseAndActiveTotalLv > 0)
		end
	end
end
