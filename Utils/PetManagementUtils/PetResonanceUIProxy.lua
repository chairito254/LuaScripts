-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetResonanceUIProxy.lua

local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local TimerManager = require("Core.Timer.TimerManager")
local string_format = string.format

return function(PetManagementUtils)
	function PetManagementUtils.m_refreshStarUpContainer(petId, starUContainer, forbidToolTip)
		if not petId or not starUContainer then
			return
		end

		local curResonanceInfo = PetManagementUtils.getPetStarUpInfo(petId)
		local stage = curResonanceInfo.resonanceStage or 0
		local level = curResonanceInfo.resonanceLevel or 0
		local curStageStarUrl = PetManagementUtils.getStarItemUrl(stage)

		starUContainer:SetUrlWithCallback(curStageStarUrl, function()
			if not petId then
				return
			end

			local starUCont = starUContainer.content
			local PetResonaceStarComponent = require("Guis.Panels.PetTrainingNew.Component.SubNodeComps.PetResonaceStarComponent")

			PetManagementUtils.m_starComp = PetResonaceStarComponent.new(starUCont)

			if PetManagementUtils.m_starComp then
				PetManagementUtils.m_starComp:updateAndRefresh(petId, {
					stage = stage,
					lv = level,
					pos = UIConst.STARCOMP_POS.PETINFO
				}, forbidToolTip)
			end
		end)
	end

	function PetManagementUtils.refreshPetStarupPopInfo(petId, refUComp, extraInfo)
		extraInfo = extraInfo or {}

		local forbidCultivateWay = extraInfo.forbidCultivateWay or false
		local objectReference = refUComp:GetComponent("ObjectReference")
		local starUContainer = objectReference:GetRefValue("starUContainer")
		local txtLvUSDFText = objectReference:GetRefValue("txtLvUSDFText")
		local btnCultivateUButton = objectReference:GetRefValue("btnCultivateUButton")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local listUList = objectReference:GetRefValue("listUList")
		local emptyTxtUSDFText = objectReference:GetRefValue("emptyTxtUSDFText")

		PetManagementUtils.m_refreshStarUpContainer(petId, starUContainer, true)

		local curStarStage, curStar = PetManagementUtils.getPetCurStarSLv(petId)

		curStarStage = curStarStage or 0
		curStar = curStar or 0

		local lvFStr = pg.getGameString("PET_STARUP_POP_LV")

		lvFStr = (not lvFStr or lvFStr == "PET_STARUP_POP_LV") and "%dStage-%dstar" or lvFStr

		ClientTextUtils.setText(txtLvUSDFText, string_format(lvFStr, curStarStage, curStar))

		function btnCultivateUButton.luaClick()
			if PetManagementUtils.checkHomePetOperationLocked(petId) then
				return
			end

			LuaUIUtils.tryOpenPetCultivateUI({
				toPage = Const.PetCulPageNames.STARUP,
				petId = petId
			})
		end

		ClientTextUtils.setText(txtNameUSDFText, pg.getGameString("PET_GOTO_STARUP"))

		if forbidCultivateWay then
			TimerManager.addNextFrameCb(function()
				btnCultivateUButton:SetActive(false)
			end)
		end

		function listUList.luaRenderItem(button, index, data)
			local objectReference = button:GetComponent("ObjectReference")
			local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
			local txtNumUSDFText = objectReference:GetRefValue("txtNumUSDFText")

			ClientTextUtils.setText(txtNameUSDFText, data.l10nName)
			ClientTextUtils.setText(txtNumUSDFText, data.newVDispTxt)
		end

		local finalAttrs = PetManagementUtils.getPetFinalTargeResonanceStagelvDisplayAttrs2(petId, curStarStage, curStar)

		listUList:SetList(finalAttrs)

		if #finalAttrs == 0 then
			ClientTextUtils.setText(emptyTxtUSDFText, pg.getGameString("PET_STARUP_POP_NO_ATTR"))
		else
			ClientTextUtils.setText(emptyTxtUSDFText, "")
		end

		local isMax = PetManagementUtils.isMaxedResonance(curStarStage, curStar)

		refUComp:TryChangePage("Max", isMax and 1 or 0)
	end
end
