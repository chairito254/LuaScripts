-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetNavigationUIProxy.lua

local UIConst = require("Const.UIConst")
local PetResearchContentData = require("Data.pet_research_content_data")
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local MessageName = require("Const.MessageName")
local ClientUtils = require("Utils.ClientUtils")
local string_format = string.format

return function(PetManagementUtils)
	function PetManagementUtils._openPropertyPanel(inputPetId)
		local petId = inputPetId and inputPetId or PetManagementUtils.petId

		if not petId then
			return
		end

		local petInfo = pg.me:getPetInfo(petId)

		if not petInfo or petInfo:isCatchReporting() then
			return
		end

		pg.global.ui:open(UIConst.UI_ID_PET_PROPERTY, {
			curPetId = petId
		}, function()
			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.openPropertyPanelCb then
				PetManagementUtils.delegateTable.openPropertyPanelCb()
			end
		end)
	end

	function PetManagementUtils._onClickSkillPresetsButton()
		pg.global.ui:open(UIConst.UI_ID_PET_SKILL_REPLACE_QUICK, {
			notPetManagement = true,
			curPetId = PetManagementUtils.petId,
			templateId = PetManagementUtils.templateId
		})
	end

	function PetManagementUtils.onEvolveClick(petId, petTemplateId, extraInfo)
		local researchContentData = PetResearchContentData[petTemplateId]

		if not researchContentData then
			pg.global.showBubbleMessageRaw(pg.getGameString("TRAINING_NOT_VALID"))

			return
		end

		PetResearchUtils.openBranchSelect(petId, nil, extraInfo)
	end

	function PetManagementUtils.onPetLvUpClick(petId, iconName, label, directToLevelBreak)
		local petData = pg.me:getPetInfo(petId)

		if petData == nil then
			return
		end

		label = label or petData.label

		local propList = {
			150001,
			150002,
			150003
		}
		local args = {
			title = pg.getGameString("USE_EXP_PROP"),
			petId = petId,
			iconName = iconName,
			label = label
		}

		args.selectList = propList

		function args.confirmCb(itemMap)
			return
		end

		args.directToLevelBreak = directToLevelBreak

		pg.global.ui:open(UIConst.UI_ID_COMMON_SELECT_USE, args)
	end

	function PetManagementUtils.popupResetAllocatePoint(petId, totalUsedPPoint, sucCallBack)
		if not petId then
			return
		end

		local isFree = PetManagementUtils.redDot_GetFreeResetPPointsState(petId)

		if isFree then
			ClientUtils.showConfirmRaw(pg.getGameString("RELEASE_WARN"), pg.getGameString("PET_NEW_ATTR_APLLY_TIPS_FIRST_FREE"), function()
				PetManagementUtils.tryReqResetEffort(petId, true, sucCallBack)
			end)
		else
			local fStr = pg.getGameString("PET_NEW_ATTR_APLLY_TIPS1")

			fStr = (not fStr or fStr == "PET_NEW_ATTR_APLLY_TIPS1") and "ResetNeedCost%s" or fStr

			local resetCostInfo = PetManagementUtils.getResetEffortCostInfo()

			pg.global.showCommonTipUse(pg.getGameString("RELEASE_WARN"), string_format(fStr, totalUsedPPoint or 0), resetCostInfo, function()
				PetManagementUtils.tryReqResetEffort(petId, false, sucCallBack)
			end)
		end
	end

	function PetManagementUtils.debugPopBreakPop(stage, lv)
		facade:sendMsgToUI(MessageName.PET_RESONANCE_CHANGE_DEBUG, {
			stage = stage,
			lv = lv
		})
	end
end
