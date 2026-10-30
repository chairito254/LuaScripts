-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetSkillUIProxy.lua

local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local ClientTextUtils = require("Utils.ClientTextUtils")
local AbilityConst = require("Common.Const.AbilityConst")
local TimerManager = require("Core.Timer.TimerManager")
local AbilityUtils = require("Common.Utils.AbilityUtils")
local SkillTagData = require("Data.skill_tag_data")

return function(PetManagementUtils)
	function PetManagementUtils._setFeature(petId)
		local featureInfo, _ = PetManagementDataHelper.getCurCharacter(petId)
		local petInfo = pg.me:getPetInfo(petId)

		PetManagementUtils.renderPetFeature(PetManagementUtils.btnFeaturesUButton, featureInfo, petInfo)
	end

	function PetManagementUtils.renderSkill(petId, skillType, skillBtn)
		if skillType == AbilityConst.EXPLORE_ABILITY then
			local skillInfo = PetManagementDataHelper.getPetSkillInfos(petId, skillType)

			PetManagementUtils._renderExploreSkillCmp(skillBtn, skillInfo)
		elseif skillType == AbilityConst.ULTIMATE_ABILITY or skillType == AbilityConst.WEAPON_SKILL_ABILITY or skillType == AbilityConst.WEAPON_SKILL_ABILITY2 then
			local skillInfo = PetManagementDataHelper.getPetSkillInfos(petId, skillType)

			PetManagementUtils._renderSkillCmp(skillBtn, skillInfo, false, skillType == AbilityConst.ULTIMATE_ABILITY, pg.me:getPetInfo(petId))
		else
			return
		end
	end

	function PetManagementUtils.renderSkillWithAbilityId(abilityId, abilityType, skillBtn)
		local skillInfo = PetManagementDataHelper.getSkillInfosByAbilityId(abilityId, abilityType)

		if skillInfo.tags and skillInfo.tags[1] and SkillTagData[skillInfo.tags[1]] then
			skillInfo.tagName = SkillTagData[skillInfo.tags[1]].tagName
		end

		PetManagementUtils._renderSkillCmp(skillBtn, skillInfo, true)
	end

	function PetManagementUtils._refreshSkillList(petId)
		local ultSkillInfo = PetManagementDataHelper.getPetSkillInfos(petId, AbilityConst.ULTIMATE_ABILITY)
		local qSkillInfo = PetManagementDataHelper.getPetSkillInfos(petId, AbilityConst.WEAPON_SKILL_ABILITY)
		local eSkillInfo = PetManagementDataHelper.getPetSkillInfos(petId, AbilityConst.WEAPON_SKILL_ABILITY2)
		local exploreSkillInfo = PetManagementDataHelper.getPetSkillInfos(petId, AbilityConst.EXPLORE_ABILITY)
		local petInfo = pg.me:getPetInfo(petId)

		LuaUIUtils.refreshPetCareerTrait(PetManagementUtils.panelSkillUContainerObjectReference, petInfo.templateId)
		PetManagementUtils._renderSkillCmp(PetManagementUtils.btnUniqueSkillUButton, ultSkillInfo, false, true, petInfo)
		PetManagementUtils._renderSkillCmp(PetManagementUtils.btnNormalSkill1UButton, qSkillInfo, nil, nil, petInfo)

		PetManagementUtils.btnNormalSkill1UButton.draggable = false

		PetManagementUtils._renderSkillCmp(PetManagementUtils.btnNormalSkill2UButton, eSkillInfo, nil, nil, petInfo)

		PetManagementUtils.btnNormalSkill2UButton.draggable = false

		PetManagementUtils._renderExploreSkillCmp(PetManagementUtils.btnExploreSkillUButton, exploreSkillInfo)
		TimerManager.addNextFrameCb(function()
			local petInfo = pg.me:getPetInfo(petId)

			if not petInfo or not petInfo.abilityPresetMap then
				return
			end

			local presetName = petInfo.abilityPresetMap[petInfo.curAbilityPreset] and petInfo.abilityPresetMap[petInfo.curAbilityPreset].name

			if presetName and presetName ~= "" then
				ClientTextUtils.setText(PetManagementUtils.skillPresetName, presetName)
			else
				ClientTextUtils.setText(PetManagementUtils.skillPresetName, ClientTextUtils.concatByLanguage(pg.getGameString("ABILITY_PLAN"), petInfo.curAbilityPreset))
			end
		end)
	end

	function PetManagementUtils._renderSkillCmp(button, data, hideElement, isUnique, petInfo)
		if not data then
			button.enabledTooltip = false

			button:SetActive(false)

			return
		end

		button:SetActive(true)

		local objectReference = button:GetComponent("ObjectReference")
		local iconNormalUImage = objectReference:GetRefValue("iconNormalUImage")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local elementUButton = objectReference:GetRefValue("elementUButton")
		local skillNameUWidget = objectReference:GetRefValue("skillNameUWidget")
		local uniqueUWidget = objectReference:GetRefValue("uniqueUWidget")
		local txtUniqueUSDFText = objectReference:GetRefValue("txtUniqueUSDFText")

		button:TryChangePage("State", 0)
		button:TryChangePage("Element", 0)
		button:TryChangePage("State", 1)
		button:TryChangePage("IsRare", ToInt(AbilityUtils.isRareAbilityId(data.abilityId)))
		skillNameUWidget.gameObject:SetActiveEx(true)
		ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.name))

		if data.tagName then
			ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.tagName))
		end

		iconNormalUImage.url = LuaUIUtils.getSkillIcon(data.icon)

		if data.elementType and not hideElement then
			button:TryChangePage("Element", 1)
			LuaUIUtils.setElementButtonNew(elementUButton, data.elementType)
		end

		button.enabledTooltip = true

		function button.luaTooltipPopup(_, flag)
			button:TryChangePage("Selected", flag and 1 or 0)
		end

		LuaUIUtils.setRenderSKillTooTip(button, data, nil, petInfo)

		if uniqueUWidget and txtUniqueUSDFText then
			uniqueUWidget:SetActive(isUnique)
			ClientTextUtils.setText(txtUniqueUSDFText, isUnique and pg.getGameString("PETSKILL_ULTIMATE") or "")
		end
	end

	function PetManagementUtils._renderExploreSkillCmp(button, data)
		if not data then
			button.enabledTooltip = false

			button:SetActive(false)

			return
		end

		button:SetActive(true)

		local objectReference = button:GetComponent("ObjectReference")
		local iconNormalUImage = objectReference:GetRefValue("iconNormalUImage")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

		button:TryChangePage("State", 0)
		button:TryChangePage("Element", 0)
		button:TryChangePage("State", 1)

		iconNormalUImage.url = LuaUIUtils.getSkillIcon(data.icon)

		ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(data.name))

		button.enabledTooltip = true

		function button.luaTooltipPopup(_, flag)
			button:TryChangePage("Selected", flag and 1 or 0)
		end

		LuaUIUtils.setRenderExploreToolTips(button, data)
	end

	function PetManagementUtils.renderPetFeature(button, featureInfo, petInfo)
		if featureInfo then
			local objectReference = button:GetComponent("ObjectReference")
			local iconFeatureUImage = objectReference:GetRefValue("iconFeatureUImage")

			button:TryChangePage("IsRare", featureInfo.rare or 0)
			button:TryChangePage("State", 1)

			iconFeatureUImage.url = featureInfo.icon
			button.enabledTooltip = true

			function button.luaTooltipPopup(_, flag)
				button:TryChangePage("Selected", flag and 1 or 0)
			end

			LuaUIUtils.setRenderFeatureToolTips(button, featureInfo, petInfo)
		else
			button.enabledTooltip = false

			button:TryChangePage("IsRare", 0)
			button:TryChangePage("State", 0)
		end
	end
end
