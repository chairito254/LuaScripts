-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetDetailUIProxy.lua

local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local Utils = require("Common.Utils.Utils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local PetLevelData = require("Data.pet_level_data")
local PetData = require("Data.pet_data")
local PetConfigData = require("Data.pet_config_data")
local Time = require("Core.Common.Time")
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local ClientHomelandUtils = require("Utils.ClientHomelandUtils")
local PetResearchContentData = require("Data.pet_research_content_data")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local NoticeDef = require("Common.NoticeDef")
local PetRenameValidator = require("Utils.PetRenameValidator")
local string_format = string.format

return function(PetManagementUtils)
	function PetManagementUtils._renderInfoPanel(infoPanelTrans)
		PetManagementUtils._findInfoPanelObjects(infoPanelTrans)
		PetManagementUtils._rebindLoadedContainerObjects()
		PetManagementUtils._initInfoPanelView()
	end

	function PetManagementUtils._rebindLoadedContainerObjects()
		if PetManagementUtils.panelAbilityUContainer:CheckURLLoaded() then
			PetManagementUtils._findPanelAbilityUContainerObjects()
		end

		if PetManagementUtils.panelSkillUContainer:CheckURLLoaded() then
			PetManagementUtils._findPanelSkillUContainerObjects()
		end

		if PetManagementUtils.panelInfoUContainer:CheckURLLoaded() then
			PetManagementUtils._findPanelInfoUContainerObjects()
		end
	end

	function PetManagementUtils._findInfoPanelObjects(infoPanelTrans)
		PetManagementUtils.objectReference = infoPanelTrans:GetComponent("ObjectReference")
		PetManagementUtils.attributeBtn = PetManagementUtils.objectReference:GetRefValue("attributeBtn")
		PetManagementUtils.skillBtn = PetManagementUtils.objectReference:GetRefValue("skillBtn")
		PetManagementUtils.infoBtn = PetManagementUtils.objectReference:GetRefValue("infoBtn")
		PetManagementUtils.rightPanelUComponent = PetManagementUtils.objectReference:GetRefValue("rightPanelUComponent")
		PetManagementUtils.panelAbilityUContainer = PetManagementUtils.objectReference:GetRefValue("panelAbilityUContainer")
		PetManagementUtils.panelSkillUContainer = PetManagementUtils.objectReference:GetRefValue("panelSkillUContainer")
		PetManagementUtils.panelInfoUContainer = PetManagementUtils.objectReference:GetRefValue("panelInfoUContainer")
		PetManagementUtils.previewed = nil
	end

	function PetManagementUtils._findPanelAbilityUContainerObjects()
		PetManagementUtils.panelAbilityUContainerObjectReference = PetManagementUtils.panelAbilityUContainer.content.transform:GetComponent("ObjectReference")
		PetManagementUtils.title = PetManagementUtils.panelAbilityUContainerObjectReference:GetRefValue("title")
		PetManagementUtils.detail = PetManagementUtils.panelAbilityUContainerObjectReference:GetRefValue("detail")
		PetManagementUtils.titleObjectReference = PetManagementUtils.title.transform:GetComponent("ObjectReference")
		PetManagementUtils.petNameUText = PetManagementUtils.titleObjectReference:GetRefValue("petNameUText")
		PetManagementUtils.name01USDFText = PetManagementUtils.titleObjectReference:GetRefValue("name01USDFText")
		PetManagementUtils.nameShineUSDFText = PetManagementUtils.titleObjectReference:GetRefValue("nameShineUSDFText")
		PetManagementUtils.petElementUList = PetManagementUtils.titleObjectReference:GetRefValue("petElementUList")
		PetManagementUtils.numCPUText = PetManagementUtils.titleObjectReference:GetRefValue("numCPUText")
		PetManagementUtils.btnRenameUButton = PetManagementUtils.titleObjectReference:GetRefValue("btnRenameUButton")
		PetManagementUtils.btnFavoriteUButton = PetManagementUtils.titleObjectReference:GetRefValue("btnFavoriteUButton")
		PetManagementUtils.numLevelUText = PetManagementUtils.titleObjectReference:GetRefValue("numLevelUText")
		PetManagementUtils.expSlider = PetManagementUtils.titleObjectReference:GetRefValue("expSlider")
		PetManagementUtils.typeImage = PetManagementUtils.titleObjectReference:GetRefValue("typeImage")
		PetManagementUtils.typeDesc = PetManagementUtils.titleObjectReference:GetRefValue("typeDesc")
		PetManagementUtils.listTagUList = PetManagementUtils.titleObjectReference:GetRefValue("listTagUList")
		PetManagementUtils.starUContainer = PetManagementUtils.titleObjectReference:GetRefValue("starUContainer")
		PetManagementUtils.detailObjectReference = PetManagementUtils.detail.transform:GetComponent("ObjectReference")
		PetManagementUtils.hpNum = PetManagementUtils.detailObjectReference:GetRefValue("hpNum")
		PetManagementUtils.atkNum = PetManagementUtils.detailObjectReference:GetRefValue("atkNum")
		PetManagementUtils.defNum = PetManagementUtils.detailObjectReference:GetRefValue("defNum")
		PetManagementUtils.regenNum = PetManagementUtils.detailObjectReference:GetRefValue("regenNum")
		PetManagementUtils.defMagNum = PetManagementUtils.detailObjectReference:GetRefValue("defMagNum")
		PetManagementUtils.atkMagNum = PetManagementUtils.detailObjectReference:GetRefValue("atkMagNum")
		PetManagementUtils.propNumGroup = {
			PetManagementUtils.hpNum,
			PetManagementUtils.atkNum,
			PetManagementUtils.defNum,
			PetManagementUtils.regenNum,
			PetManagementUtils.defMagNum,
			PetManagementUtils.atkMagNum
		}
		PetManagementUtils.propTitleGroup = {
			PetManagementUtils.detailObjectReference:GetRefValue("hpTitle"),
			PetManagementUtils.detailObjectReference:GetRefValue("atkTitle"),
			PetManagementUtils.detailObjectReference:GetRefValue("defTitle"),
			PetManagementUtils.detailObjectReference:GetRefValue("regenTitle"),
			PetManagementUtils.detailObjectReference:GetRefValue("defMagTitle"),
			PetManagementUtils.detailObjectReference:GetRefValue("atkMagTitle")
		}
		PetManagementUtils.propTitle2Group = {
			PetManagementUtils.detailObjectReference:GetRefValue("txtHPUSDFText"),
			PetManagementUtils.detailObjectReference:GetRefValue("txtATKUSDFText"),
			PetManagementUtils.detailObjectReference:GetRefValue("txtDEFUSDFText"),
			PetManagementUtils.detailObjectReference:GetRefValue("txtSPDUSDFText"),
			PetManagementUtils.detailObjectReference:GetRefValue("txtSDEFUSDFText"),
			PetManagementUtils.detailObjectReference:GetRefValue("txtSATKUSDFText")
		}
		PetManagementUtils.hpCmp = PetManagementUtils.detailObjectReference:GetRefValue("hpCmp")
		PetManagementUtils.atkCmp = PetManagementUtils.detailObjectReference:GetRefValue("atkCmp")
		PetManagementUtils.defCmp = PetManagementUtils.detailObjectReference:GetRefValue("defCmp")
		PetManagementUtils.regenCmp = PetManagementUtils.detailObjectReference:GetRefValue("regenCmp")
		PetManagementUtils.defMagCmp = PetManagementUtils.detailObjectReference:GetRefValue("defMagCmp")
		PetManagementUtils.atkMagCmp = PetManagementUtils.detailObjectReference:GetRefValue("atkMagCmp")
		PetManagementUtils.propCmpGroup = {
			PetManagementUtils.hpCmp,
			PetManagementUtils.atkCmp,
			PetManagementUtils.defCmp,
			PetManagementUtils.regenCmp,
			PetManagementUtils.defMagCmp,
			PetManagementUtils.atkMagCmp
		}
		PetManagementUtils.hpLevelCmp = PetManagementUtils.detailObjectReference:GetRefValue("hpLevelCmp")
		PetManagementUtils.atkLevelCmp = PetManagementUtils.detailObjectReference:GetRefValue("atkLevelCmp")
		PetManagementUtils.defLevelCmp = PetManagementUtils.detailObjectReference:GetRefValue("defLevelCmp")
		PetManagementUtils.regenLevelCmp = PetManagementUtils.detailObjectReference:GetRefValue("regenLevelCmp")
		PetManagementUtils.defMagLevelCmp = PetManagementUtils.detailObjectReference:GetRefValue("defMagLevelCmp")
		PetManagementUtils.atkMagLevelCmp = PetManagementUtils.detailObjectReference:GetRefValue("atkMagLevelCmp")
		PetManagementUtils.propLevelCmpGroup = {
			PetManagementUtils.hpLevelCmp,
			PetManagementUtils.atkLevelCmp,
			PetManagementUtils.defLevelCmp,
			PetManagementUtils.regenLevelCmp,
			PetManagementUtils.defMagLevelCmp,
			PetManagementUtils.atkMagLevelCmp
		}
		PetManagementUtils.hpLv = PetManagementUtils.detailObjectReference:GetRefValue("hpLv")
		PetManagementUtils.atkLv = PetManagementUtils.detailObjectReference:GetRefValue("atkLv")
		PetManagementUtils.defLv = PetManagementUtils.detailObjectReference:GetRefValue("defLv")
		PetManagementUtils.regenLv = PetManagementUtils.detailObjectReference:GetRefValue("regenLv")
		PetManagementUtils.defMagLv = PetManagementUtils.detailObjectReference:GetRefValue("defMagLv")
		PetManagementUtils.atkMagLv = PetManagementUtils.detailObjectReference:GetRefValue("atkMagLv")
		PetManagementUtils.propLevelGroup = {
			PetManagementUtils.hpLv,
			PetManagementUtils.atkLv,
			PetManagementUtils.defLv,
			PetManagementUtils.regenLv,
			PetManagementUtils.defMagLv,
			PetManagementUtils.atkMagLv
		}
		PetManagementUtils.defaultRadar = PetManagementUtils.detailObjectReference:GetRefValue("defaultRadar")
		PetManagementUtils.addedRadar = PetManagementUtils.detailObjectReference:GetRefValue("addedRadar")
		PetManagementUtils.root = PetManagementUtils.detailObjectReference:GetRefValue("root")
		PetManagementUtils.newRatioNodeUComp = PetManagementUtils.detailObjectReference:GetRefValue("newRatioNodeUComp")
		PetManagementUtils.btnSwitchMaxUButton = PetManagementUtils.detailObjectReference:GetRefValue("btnSwitchMaxUButton")
		PetManagementUtils.characterUWidget = PetManagementUtils.detailObjectReference:GetRefValue("characterUWidget")
		PetManagementUtils.btnTalentUButton = PetManagementUtils.detailObjectReference:GetRefValue("btnTalentUButton")
		PetManagementUtils.accessListUList = PetManagementUtils.detailObjectReference:GetRefValue("accessListUList")
		PetManagementUtils.btnRareTraitUButton = PetManagementUtils.detailObjectReference:GetRefValue("btnRareTraitUButton")
		PetManagementUtils.featureIcon = PetManagementUtils.detailObjectReference:GetRefValue("featureIcon")
		PetManagementUtils.btnDetailUButton = PetManagementUtils.detailObjectReference:GetRefValue("btnDetailUButton")

		local hideF1 = PetManagementUtils.param and PetManagementUtils.param.hideBtnFavorite
		local ctrlConfig = PetManagementUtils.param and PetManagementUtils.param.ctrlConfig or {}
		local hideF2 = ctrlConfig.isForbidFavoriteBtn or false

		if hideF1 or hideF2 then
			PetManagementUtils.btnFavoriteUButton:SetActive(false)
		end

		function PetManagementUtils.btnFavoriteUButton.luaClick()
			PetManagementUtils._onClickFavoriteBtn()
		end

		function PetManagementUtils.btnRenameUButton.luaClick()
			PetRenameValidator.tryShowRenamePet(function()
				PetManagementDataHelper.showRename(PetManagementUtils.petId, PetManagementDataHelper.RENAME_FOR_PET)
			end)
		end

		function PetManagementUtils.btnSwitchMaxUButton.luaClick()
			PetManagementUtils._previewMaxLevel(true)
		end

		PetManagementUtils.characterUWidget.gameObject:SetActiveEx(true)

		function PetManagementUtils.btnTalentUButton.luaTooltipPopup(_, flag)
			PetManagementUtils.btnTalentUButton.isSelected = flag

			PetManagementUtils.btnTalentUButton:TryChangePage("button", flag and 5 or 0)
		end

		if PetManagementUtils.param and PetManagementUtils.param.extraLogic then
			PetManagementUtils.param.extraLogic()
		end
	end

	function PetManagementUtils.clearAbilityUContainerObjects()
		PetManagementUtils.panelAbilityUContainerObjectReference = nil
		PetManagementUtils.title = nil
		PetManagementUtils.detail = nil
		PetManagementUtils.titleObjectReference = nil
		PetManagementUtils.petNameUText = nil
		PetManagementUtils.name01USDFText = nil
		PetManagementUtils.nameShineUSDFText = nil
		PetManagementUtils.petElementUList = nil
		PetManagementUtils.numCPUText = nil
		PetManagementUtils.btnRenameUButton = nil
		PetManagementUtils.btnFavoriteUButton = nil
		PetManagementUtils.numLevelUText = nil
		PetManagementUtils.expSlider = nil
		PetManagementUtils.listTagUList = nil
		PetManagementUtils.typeImage = nil
		PetManagementUtils.typeDesc = nil
		PetManagementUtils.starUContainer = nil
		PetManagementUtils.m_starComp = nil
		PetManagementUtils.detailObjectReference = nil
		PetManagementUtils.hpNum = nil
		PetManagementUtils.atkNum = nil
		PetManagementUtils.defNum = nil
		PetManagementUtils.regenNum = nil
		PetManagementUtils.defMagNum = nil
		PetManagementUtils.atkMagNum = nil
		PetManagementUtils.propNumGroup = nil
		PetManagementUtils.propTitleGroup = nil
		PetManagementUtils.propTitle2Group = nil
		PetManagementUtils.hpCmp = nil
		PetManagementUtils.atkCmp = nil
		PetManagementUtils.defCmp = nil
		PetManagementUtils.regenCmp = nil
		PetManagementUtils.defMagCmp = nil
		PetManagementUtils.atkMagCmp = nil
		PetManagementUtils.propCmpGroup = nil
		PetManagementUtils.hpLevelCmp = nil
		PetManagementUtils.atkLevelCmp = nil
		PetManagementUtils.defLevelCmp = nil
		PetManagementUtils.regenLevelCmp = nil
		PetManagementUtils.defMagLevelCmp = nil
		PetManagementUtils.atkMagLevelCmp = nil
		PetManagementUtils.propLevelCmpGroup = nil
		PetManagementUtils.hpLv = nil
		PetManagementUtils.atkLv = nil
		PetManagementUtils.defLv = nil
		PetManagementUtils.regenLv = nil
		PetManagementUtils.defMagLv = nil
		PetManagementUtils.atkMagLv = nil
		PetManagementUtils.propLevelGroup = nil
		PetManagementUtils.defaultRadar = nil
		PetManagementUtils.addedRadar = nil
		PetManagementUtils.root = nil
		PetManagementUtils.newRatioNodeUComp = nil
		PetManagementUtils.btnSwitchMaxUButton = nil
		PetManagementUtils.characterUWidget = nil
		PetManagementUtils.btnTalentUButton = nil
		PetManagementUtils.accessListUList = nil
		PetManagementUtils.btnRareTraitUButton = nil
		PetManagementUtils.featureIcon = nil
		PetManagementUtils.btnDetailUButton = nil
	end

	function PetManagementUtils._findPanelSkillUContainerObjects()
		PetManagementUtils.panelSkillUContainerObjectReference = PetManagementUtils.panelSkillUContainer.content.transform:GetComponent("ObjectReference")
		PetManagementUtils.skillUWidget = PetManagementUtils.panelSkillUContainerObjectReference:GetRefValue("skillUWidget")
		PetManagementUtils.btnSkillPresetsUButton = PetManagementUtils.panelSkillUContainerObjectReference:GetRefValue("btnSkillPresetsUButton")
		PetManagementUtils.skillPresetName = PetManagementUtils.panelSkillUContainerObjectReference:GetRefValue("skillPresetName")
		PetManagementUtils.carryItemUComponent = PetManagementUtils.panelSkillUContainerObjectReference:GetRefValue("carryItemUComponent")

		local carryItemObjectReference = PetManagementUtils.carryItemUComponent:GetComponent("ObjectReference")

		PetManagementUtils.listGemsUList = carryItemObjectReference:GetRefValue("listGemsUList")
		PetManagementUtils.skillUWidgetObjectReference = PetManagementUtils.skillUWidget.transform:GetComponent("ObjectReference")
		PetManagementUtils.btnUniqueSkillUButton = PetManagementUtils.skillUWidgetObjectReference:GetRefValue("btnUniqueSkillUButton")
		PetManagementUtils.btnNormalSkill1UButton = PetManagementUtils.skillUWidgetObjectReference:GetRefValue("btnNormalSkill1UButton")
		PetManagementUtils.btnNormalSkill2UButton = PetManagementUtils.skillUWidgetObjectReference:GetRefValue("btnNormalSkill2UButton")
		PetManagementUtils.btnExploreSkillUButton = PetManagementUtils.skillUWidgetObjectReference:GetRefValue("btnExploreSkillUButton")
		PetManagementUtils.btnFeaturesUButton = PetManagementUtils.skillUWidgetObjectReference:GetRefValue("btnFeaturesUButton")

		local txtUniqueUSDFText = PetManagementUtils.skillUWidgetObjectReference:GetRefValue("txtUniqueUSDFText")

		ClientTextUtils.setText(txtUniqueUSDFText, pg.getGameString("PETSKILL_ULTIMATE"))

		function PetManagementUtils.btnSkillPresetsUButton.luaClick()
			PetManagementUtils._onClickSkillPresetsButton()
		end

		if PetManagementUtils.param and PetManagementUtils.param.extraLogic then
			PetManagementUtils.param.extraLogic()
		end
	end

	function PetManagementUtils.clearSkillUContainerObjects()
		PetManagementUtils.panelSkillUContainerObjectReference = nil
		PetManagementUtils.skillUWidget = nil
		PetManagementUtils.btnSkillPresetsUButton = nil
		PetManagementUtils.skillPresetName = nil
		PetManagementUtils.carryItemUComponent = nil
		PetManagementUtils.listGemsUList = nil
		PetManagementUtils.skillUWidgetObjectReference = nil
		PetManagementUtils.btnUniqueSkillUButton = nil
		PetManagementUtils.btnNormalSkill1UButton = nil
		PetManagementUtils.btnNormalSkill2UButton = nil
		PetManagementUtils.btnExploreSkillUButton = nil
		PetManagementUtils.btnFeaturesUButton = nil

		if PetManagementUtils.param and PetManagementUtils.param.extraLogic then
			PetManagementUtils.param.extraLogic = nil
		end
	end

	function PetManagementUtils._findPanelInfoUContainerObjects()
		PetManagementUtils.panelInfoUContainerObjectReference, PetManagementUtils.panelInfoDetailObjectReference = LuaUIUtils.getPetPanelInfoObjectReferences(PetManagementUtils.panelInfoUContainer.content)
		PetManagementUtils.beenText = PetManagementUtils.panelInfoUContainerObjectReference:GetRefValue("beenText")
		PetManagementUtils.infoPetNameExtra = PetManagementUtils.panelInfoUContainerObjectReference:GetRefValue("infoPetNameExtra")
		PetManagementUtils.rawImageRawImagePro = PetManagementUtils.panelInfoUContainerObjectReference:GetRefValue("rawImageRawImagePro")
		PetManagementUtils.uINodePetPanelInfoUComponent = PetManagementUtils.panelInfoUContainerObjectReference:GetRefValue("uINodePetPanelInfoUComponent")
		PetManagementUtils.accessListUListHome = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("accessListUList")
		PetManagementUtils.btnTalentUButtonHome = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("btnTalentUButton")
		PetManagementUtils.abilityListUList = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("abilityListUList")
		PetManagementUtils.txtTitleTalentUSDFText = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("txtTitleTalentUSDFText")
		PetManagementUtils.btnAbilityUButton = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("btnAbilityUButton")
		PetManagementUtils.sourceUWidget = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("sourceUWidget")
		PetManagementUtils.txtSourceUBaseText = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("txtSourceUBaseText")
		PetManagementUtils.textUSDFText = PetManagementUtils.panelInfoUContainerObjectReference:GetRefValue("textUSDFText")
		PetManagementUtils.txtNumLiveUSDFText = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("txtNumLiveUSDFText")
		PetManagementUtils.txtTitleLiveUSDFText = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("txtTitleLiveUSDFText")
		PetManagementUtils.btnLiveUButton = PetManagementUtils.panelInfoDetailObjectReference:GetRefValue("btnLiveUButton")

		if PetManagementUtils.rawImageRawImageProData then
			PetManagementUtils.rawImageRawImageProData:setRawImageProRef(PetManagementUtils.rawImageRawImagePro)

			PetManagementUtils.rawImageRawImageProData = nil
		end

		if PetManagementUtils.param and PetManagementUtils.param.extraLogic then
			PetManagementUtils.param.extraLogic()
		end
	end

	function PetManagementUtils.clearInfoUContainerObjects()
		PetManagementUtils.panelInfoUContainerObjectReference = nil
		PetManagementUtils.panelInfoDetailObjectReference = nil
		PetManagementUtils.petDesc = nil
		PetManagementUtils.beenText = nil
		PetManagementUtils.infoPetName = nil
		PetManagementUtils.infoPetNameExtra = nil
		PetManagementUtils.txtDetailUSDFText = nil
		PetManagementUtils.rawImageRawImagePro = nil
		PetManagementUtils.nameShineUSDFText1 = nil
		PetManagementUtils.nameShineUSDFText2 = nil
		PetManagementUtils.uINodePetPanelInfoUComponent = nil
		PetManagementUtils.accessListUListHome = nil
		PetManagementUtils.btnTalentUButtonHome = nil
		PetManagementUtils.abilityListUList = nil
		PetManagementUtils.txtTitleTalentUSDFText = nil
		PetManagementUtils.hobbyListUList = nil
		PetManagementUtils.btnAbilityUButton = nil
		PetManagementUtils.btnHobbyUButton = nil
		PetManagementUtils.sourceUWidget = nil
		PetManagementUtils.txtSourceUBaseText = nil
		PetManagementUtils.btnPetManualUButton = nil
		PetManagementUtils.textUSDFText = nil
		PetManagementUtils.txtNumLiveUSDFText = nil
		PetManagementUtils.txtTitleLiveUSDFText = nil
		PetManagementUtils.btnLiveUButton = nil

		if PetManagementUtils.param and PetManagementUtils.param.extraLogic then
			PetManagementUtils.param = nil
		end
	end

	function PetManagementUtils._initInfoPanelView()
		local restoreContext = PetManagementUtils._captureContextRestorer()

		function PetManagementUtils.attributeBtn.luaClick()
			restoreContext()
			PetManagementUtils._switchPetInfoTopPages(0)
		end

		function PetManagementUtils.skillBtn.luaClick()
			restoreContext()
			PetManagementUtils._switchPetInfoTopPages(1)
		end

		function PetManagementUtils.infoBtn.luaClick()
			restoreContext()
			PetManagementUtils._switchPetInfoTopPages(2)
		end

		PetManagementUtils.defaultSelectTabIndex = PetManagementUtils.param and PetManagementUtils.param.defaultSelectTabIndex or 0

		if PetManagementUtils.param.noNeedTabIndex then
			PetManagementUtils.defaultSelectTabIndex = nil
		end
	end

	function PetManagementUtils._chooseTabButton(index)
		return
	end

	function PetManagementUtils._switchPetInfoTopPages(index)
		PetManagementUtils.pageIndex = index or 0

		PetManagementUtils.rightPanelUComponent:TryChangePage("tabInfo", PetManagementUtils.pageIndex)

		if PetManagementUtils.pageIndex == 0 then
			if not PetManagementUtils.panelAbilityUContainer:CheckURLLoaded() then
				PetManagementUtils.panelAbilityUContainer:LoadDefaultUrlManually(function(obj)
					if IsNil(obj) then
						return
					end

					PetManagementUtils._findPanelAbilityUContainerObjects()

					if PetManagementUtils.panelAbilityUContainerData then
						PetManagementUtils._renderPetInfoCard(PetManagementUtils.panelAbilityUContainerData)
						PetManagementUtils._setTotalAttribute(PetManagementUtils.panelAbilityUContainerData.id)
						PetManagementUtils._resetBtnState()
						PetManagementUtils._previewMaxLevel()
						PetManagementUtils._refreshGiftList(PetManagementUtils.panelAbilityUContainerData)

						PetManagementUtils.panelAbilityUContainerData = nil
					end
				end)
			else
				PetManagementUtils._previewMaxLevel()
			end

			if PetManagementUtils.defaultRadar and PetManagementUtils.defaultRatioGroup then
				PetManagementUtils.defaultRadar:SetSixProps(PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_HP_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_ATK_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_DEF_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_DEF_MAG_IDX], PetManagementUtils.defaultRatioGroup[Const.BASE_PROPERTY_ATK_MAG_IDX])
			end

			if PetManagementUtils.addedRadar and PetManagementUtils.addedRatioGroup then
				PetManagementUtils.addedRadar:SetSixProps(PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_HP_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_ATK_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_DEF_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_EP_REGEN_FORCE_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_DEF_MAG_IDX], PetManagementUtils.addedRatioGroup[Const.BASE_PROPERTY_ATK_MAG_IDX])
			end
		elseif PetManagementUtils.pageIndex == 1 then
			if not PetManagementUtils.panelSkillUContainer:CheckURLLoaded() then
				PetManagementUtils.panelSkillUContainer:LoadDefaultUrlManually(function(obj)
					if IsNil(obj) then
						return
					end

					PetManagementUtils._findPanelSkillUContainerObjects()

					if PetManagementUtils.panelSkillUContainerData then
						PetManagementUtils._setCarryItem(PetManagementUtils.panelSkillUContainerData.id)
						PetManagementUtils._setFeature(PetManagementUtils.panelSkillUContainerData.id)
						PetManagementUtils._refreshSkillList(PetManagementUtils.panelSkillUContainerData.id)

						PetManagementUtils.panelSkillUContainerData = nil
					end
				end)
			end
		elseif PetManagementUtils.pageIndex == 2 and not PetManagementUtils.panelInfoUContainer:CheckURLLoaded() then
			PetManagementUtils.panelInfoUContainer:LoadDefaultUrlManually(function(obj)
				if IsNil(obj) then
					return
				end

				PetManagementUtils._findPanelInfoUContainerObjects()

				if PetManagementUtils.panelInfoUContainerData then
					PetManagementUtils._refreshInfo(PetManagementUtils.panelInfoUContainerData)

					PetManagementUtils.panelInfoUContainerData = nil
				end
			end)
		end

		if PetManagementUtils.onPetInfoPageChange then
			PetManagementUtils.onPetInfoPageChange(PetManagementUtils.pageIndex)
		end
	end

	function PetManagementUtils._refreshPetInfoDetail(data)
		if data.empty or data.isEmpty then
			PetManagementUtils.currentPetInfoData = nil
			PetManagementUtils.petId = nil

			PetManagementUtils.rightPanelUComponent:TryChangePage("tabInfo", 3)

			return
		else
			PetManagementUtils.currentPetInfoData = data

			PetManagementUtils._initPetTagAnimLastLabel(data.id, data.label)
			PetManagementUtils._switchPetInfoTopPages(PetManagementUtils.pageIndex)

			PetManagementUtils.petId = data.id
			PetManagementUtils.iconName = data.iconName
			PetManagementUtils.label = data.label
			PetManagementUtils.templateId = data.templateId

			if PetManagementUtils.panelAbilityUContainer:CheckURLLoaded() then
				PetManagementUtils._renderPetInfoCard(data)
				PetManagementUtils._setTotalAttribute(data.id)
				PetManagementUtils._resetBtnState()
				PetManagementUtils._previewMaxLevel()
				PetManagementUtils._refreshGiftList(data)
			else
				PetManagementUtils.panelAbilityUContainerData = data
			end

			if PetManagementUtils.panelSkillUContainer:CheckURLLoaded() then
				PetManagementUtils._setCarryItem(data.id)
				PetManagementUtils._setFeature(data.id)
				PetManagementUtils._refreshSkillList(data.id)
			else
				PetManagementUtils.panelSkillUContainerData = data
			end

			if PetManagementUtils.panelInfoUContainer:CheckURLLoaded() then
				PetManagementUtils._refreshInfo(data)
			else
				PetManagementUtils.panelInfoUContainerData = data
			end

			if PetManagementUtils.defaultSelectTabIndex then
				PetManagementUtils._chooseTabButton(PetManagementUtils.defaultSelectTabIndex)
				PetManagementUtils._switchPetInfoTopPages(PetManagementUtils.defaultSelectTabIndex)
			end
		end
	end

	function PetManagementUtils._getPetTagAnimRecordKey(petId, labelMask)
		return string_format("pet_tag_anim_%s_%s", tostring(petId), tostring(labelMask))
	end

	function PetManagementUtils._initPetTagAnimLastLabel(petId, label)
		if not petId then
			return
		end

		PetManagementUtils.m_petTagAnimLastLabelMap = PetManagementUtils.m_petTagAnimLastLabelMap or {}

		if PetManagementUtils.m_petTagAnimLastLabelMap[petId] == nil then
			PetManagementUtils.m_petTagAnimLastLabelMap[petId] = label or Const.PET_LABEL_MASK.NORMAL
		end
	end

	function PetManagementUtils._getPetTagLabelMask(tagData)
		if not tagData then
			return nil
		end

		if tagData.labelMask then
			return tagData.labelMask
		end

		if tagData.tIndex == 1 then
			if tagData.shinyIndex == 0 then
				return Const.PET_LABEL_MASK.SHINY
			elseif tagData.shinyIndex == 1 then
				return Const.PET_LABEL_MASK.MAGIC
			end
		elseif tagData.tIndex == 2 then
			local label = tagData.label

			if bit.band(label or 0, Const.PET_LABEL_MASK.ELITE) ~= 0 then
				return Const.PET_LABEL_MASK.ELITE
			elseif bit.band(label or 0, Const.PET_LABEL_MASK.BOSS) ~= 0 then
				return Const.PET_LABEL_MASK.BOSS
			end
		end

		return nil
	end

	function PetManagementUtils._isPetTagLabelAdded(oldLabel, newLabel, labelMask)
		if oldLabel == nil or not labelMask then
			return false
		end

		return bit.band(oldLabel or 0, labelMask) == 0 and bit.band(newLabel or 0, labelMask) ~= 0
	end

	function PetManagementUtils._canPlayPetTagFirstGotAnim(petId, labelMask)
		if not pg or not pg.me or not petId or not labelMask then
			return false
		end

		local recordKey = PetManagementUtils._getPetTagAnimRecordKey(petId, labelMask)

		return pg.me:getRedDotRecord(Const.CLIENT_KEY.PET_TAG_ANIM_RECORD, recordKey, true)
	end

	function PetManagementUtils._recordPetTagFirstGotAnim(petId, labelMask)
		if not pg or not pg.me or not petId or not labelMask then
			return
		end

		if pg.game.petManage:shouldSkipPetRedDotRecord(pg.me, petId) then
			return
		end

		local recordKey = PetManagementUtils._getPetTagAnimRecordKey(petId, labelMask)

		pg.me:setRedDotRecord(Const.CLIENT_KEY.PET_TAG_ANIM_RECORD, recordKey, false)
	end

	function PetManagementUtils._markFirstGotPetTagAnim(petId, newLabel, tagDatas)
		if not petId then
			return
		end

		PetManagementUtils.m_petTagAnimLastLabelMap = PetManagementUtils.m_petTagAnimLastLabelMap or {}

		local oldLabel = PetManagementUtils.m_petTagAnimLastLabelMap[petId]

		PetManagementUtils.m_petTagAnimLastLabelMap[petId] = newLabel or Const.PET_LABEL_MASK.NORMAL

		if oldLabel == nil or not tagDatas then
			return
		end

		for _, tagData in pairs(tagDatas) do
			local labelMask = PetManagementUtils._getPetTagLabelMask(tagData)

			if PetManagementUtils._isPetTagLabelAdded(oldLabel, newLabel, labelMask) and PetManagementUtils._canPlayPetTagFirstGotAnim(petId, labelMask) then
				tagData.playTagAnim = true
				tagData.playTagAnimPetId = petId
				tagData.playTagAnimLabelMask = labelMask
			end
		end
	end

	function PetManagementUtils._tryPlayPetTagAnim(button, data)
		if not button or not data or not data.playTagAnim then
			return
		end

		data.playTagAnim = false

		PetManagementUtils._recordPetTagFirstGotAnim(data.playTagAnimPetId, data.playTagAnimLabelMask)

		local anim = button:GetComponent("Animation")

		if anim then
			anim:Stop()
			anim:Play()
		end
	end

	function PetManagementUtils._refreshPetTagList(data, onlyIfPending)
		if not data or not PetManagementUtils.listTagUList then
			return false
		end

		local tagDatas = LuaUIUtils.getPetTagList(data) or {}

		PetManagementUtils._markFirstGotPetTagAnim(data.id, data.label, tagDatas)

		local hasPendingAnim = false

		for _, tagData in pairs(tagDatas) do
			if tagData.playTagAnim then
				hasPendingAnim = true

				break
			end
		end

		if onlyIfPending and not hasPendingAnim then
			return false
		end

		function PetManagementUtils.listTagUList.luaRenderItem(button, idx, tagData)
			LuaUIUtils.renderPetTagList(button, tagData)
			PetManagementUtils._tryPlayPetTagAnim(button, tagData)

			local templateId = tagData and tagData.templateId
			local label = tagData and tagData.label
			local bodySizeType = tagData and tagData.bodySizeType

			LuaUIUtils.setPetTagLabelToolTip(button, LuaUIUtils.getPetTagInfo(templateId, label, bodySizeType, data.shinyStyle))
		end

		PetManagementUtils.listTagUList:SetList(tagDatas)

		return true
	end

	function PetManagementUtils._renderPetInfoCard(data)
		PetManagementUtils.petNameStr = PetManagementDataHelper.getPetName(PetManagementUtils.petId)

		if pg.game.setting:getShowDebugId() then
			PetManagementUtils.petNameStr = PetManagementUtils.petNameStr .. tostring(data.templateId)
		end

		PetManagementUtils._refreshPetName(PetManagementUtils.petNameStr)

		function PetManagementUtils.petElementUList.luaRenderItem(button, _, data1)
			LuaUIUtils.setElementButtonNew(button, data1.element, true, data.templateId)
		end

		PetManagementUtils.petElementUList:SetList(data.elementNames)

		local pet = pg.me:getPetInfo(PetManagementUtils.petId)
		local cpValue = pet:isCatchReporting() and "???" or data.cp

		ClientTextUtils.setText(PetManagementUtils.numCPUText, ClientTextUtils.concatByLanguage(pg.getGameString("CP"), cpValue))

		if data.gender == Const.GENDER_TYPE_MALE then
			PetManagementUtils.rightPanelUComponent:TryChangePage("Gender", 0)
		elseif data.gender == Const.GENDER_TYPE_FEMALE then
			PetManagementUtils.rightPanelUComponent:TryChangePage("Gender", 1)
		else
			PetManagementUtils.rightPanelUComponent:TryChangePage("Gender", 2)
		end

		ClientTextUtils.setText(PetManagementUtils.numLevelUText, data.level)

		local maxExp = PetLevelData[data.level + 1] ~= nil and PetLevelData[data.level + 1].needExp or 0

		PetManagementUtils.expSlider.value = maxExp == 0 and 1 or data.exp / maxExp

		if data.isShiny then
			PetManagementUtils.rightPanelUComponent:TryChangePage("isFlash", 1)
		else
			PetManagementUtils.rightPanelUComponent:TryChangePage("isFlash", 0)
		end

		if data.isBoss then
			PetManagementUtils.title:TryChangePage("isBoss", 1)
		else
			PetManagementUtils.title:TryChangePage("isBoss", 0)
		end

		if data.isVariant then
			PetManagementUtils.title:TryChangePage("isChange", 1)
		else
			PetManagementUtils.title:TryChangePage("isChange", 0)
		end

		local titleObjectReference = PetManagementUtils.titleObjectReference
		local btnIsChangeUButton = titleObjectReference:GetRefValue("btnIsChangeUButton")
		local isChangeTipsUWidget = titleObjectReference:GetRefValue("isChangeTipsUWidget")

		isChangeTipsUWidget:SetActive(false)
		LuaUIUtils.bindVariantPetDetailButton(btnIsChangeUButton, isChangeTipsUWidget, data)

		local petType = PetData[PetManagementUtils.templateId].functionId

		PetManagementUtils.typeImage.url = PetConfigData.petFunctionIcon[petType]

		ClientTextUtils.setText(PetManagementUtils.typeDesc, pg.getLocalizationText(PetConfigData[string.format("petFunctionText%s", petType)]) or "")
		PetManagementUtils.m_refreshStarUpContainer(PetManagementUtils.petId, PetManagementUtils.starUContainer)
		PetManagementUtils._refreshPetTagList(data, false)
	end

	function PetManagementUtils._refreshPetName(petName)
		ClientTextUtils.setText(PetManagementUtils.petNameUText, petName)
		ClientTextUtils.setText(PetManagementUtils.name01USDFText, petName)
		ClientTextUtils.setText(PetManagementUtils.nameShineUSDFText, petName)

		if PetManagementUtils.infoPetNameExtra then
			ClientTextUtils.setText(PetManagementUtils.infoPetNameExtra, petName)
		end
	end

	function PetManagementUtils.applyGiftListItem(button, data1)
		if IsNil(button) then
			return
		end

		local objectReference = button:GetComponent("ObjectReference")

		if IsNil(objectReference) then
			return
		end

		local iconUImage = objectReference:GetRefValue("iconUImage")
		local rayBoxUWidget = objectReference:GetRefValue("rayBoxUWidget")

		if not Utils.isTable(data1) or data1.empty then
			if not IsNil(iconUImage) then
				iconUImage.url = ""
			end

			return
		end

		if not IsNil(iconUImage) then
			iconUImage.url = data1.icon
		end

		if not IsNil(rayBoxUWidget) and rayBoxUWidget.gameObject then
			rayBoxUWidget.gameObject:SetActiveEx(false)
		end

		button:TryChangePage("Quality", data1.quality)
	end

	function PetManagementUtils._refreshGiftList(data)
		local isForbidPetPropUseBtn = PetManagementUtils.param and PetManagementUtils.param.isForbidPetPropUseBtn

		function PetManagementUtils.btnTalentUButton.luaClick()
			local talentData = {}

			talentData.targetRect = PetManagementUtils.btnTalentUButton
			talentData.autoHor = true
			talentData.hierarchyMode = 2
			talentData.sortingOrder = 2
			talentData.type = UIConst.GIFT_TYPE.BATTLE
			talentData.showType = UIConst.GIFT_SHOW_TYPE.GIFT
			talentData.giftType = UIConst.GIFT_TYPE.HOME
			talentData.breedTalent = data.breedTalent

			if not isForbidPetPropUseBtn then
				talentData.petId = data.id
			end

			talentData.extra = {
				openFun = function()
					PetManagementUtils.btnTalentUButton.isSelected = true

					PetManagementUtils.btnTalentUButton:TryChangePage("button", 5)
				end,
				closeFun = function()
					PetManagementUtils.btnTalentUButton.isSelected = false

					PetManagementUtils.btnTalentUButton:TryChangePage("button", 0)
				end
			}

			pg.global.ui:open(UIConst.UI_ID_PET_GIFT_TIPS, talentData)
		end

		function PetManagementUtils.accessListUList.luaRenderItem(button, _, data1)
			PetManagementUtils.applyGiftListItem(button, data1)
		end

		PetManagementUtils.accessListUList:SetList(data.breedTalent)
	end

	function PetManagementUtils._setCarryItem(petId)
		PetManagementUtils.carryItemUComponent.gameObject:SetActiveEx(true)

		local objectReference = PetManagementUtils.carryItemUComponent:GetComponent("ObjectReference")
		local iconPropUImage = objectReference:GetRefValue("iconPropUImage")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local txtStrengthenUSDFText = objectReference:GetRefValue("txtStrengthenUSDFText")
		local carryData = pg.global.ui.petTrainingNew.model:getPetEquipCarry(petId)

		if not carryData then
			PetManagementUtils.carryItemUComponent:TryChangePage("Empty", 1)
		else
			PetManagementUtils.carryItemUComponent:TryChangePage("Empty", 0)

			local isRecommend = LuaUIUtils.checkCarryIsRecommend(petId, carryData.itemId)

			PetManagementUtils.carryItemUComponent:TryChangePage("GoodState", isRecommend and 1 or 0)
			PetManagementUtils.carryItemUComponent:TryChangePage("Quality", carryData.quality)

			iconPropUImage.url = carryData.icon

			ClientTextUtils.setText(txtNameUSDFText, carryData.name)
			ClientTextUtils.setText(txtStrengthenUSDFText, "+" .. carryData.cLevel)

			if PetManagementUtils.listGemsUList then
				LuaUIUtils.refreshCarryAssistInfo(PetManagementUtils.listGemsUList, nil, carryData, true)
			end
		end
	end

	function PetManagementUtils._refreshInfo(data)
		local isForbidPetPropUseBtn = PetManagementUtils.param and PetManagementUtils.param.isForbidPetPropUseBtn

		function PetManagementUtils.btnLiveUButton.luaRenderTooltip(btn, com)
			local objectReference = com.transform:GetComponent("ObjectReference")
			local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")

			ClientTextUtils.setText(txtNameUSDFText, pg.getGameString("HOMELAND_COMFORT_TIP"))
		end

		ClientTextUtils.setText(PetManagementUtils.txtTitleLiveUSDFText, pg.getGameString("HOMELAND_COMPOSE_LIVE_VALUE") .. ":")
		ClientTextUtils.setText(PetManagementUtils.txtTitleTalentUSDFText, pg.getGameString("PET_INFO_PERSONALITY_TITLE") .. ":")
		ClientTextUtils.setText(PetManagementUtils.txtNumLiveUSDFText, ClientHomelandUtils.getPetComfortValueById(data.id))

		local wishingStarButton = LuaUIUtils.bindHomeWishingStarOutput(PetManagementUtils.panelInfoDetailObjectReference, data)
		local delegate = PetManagementUtils.delegateTable

		if delegate and delegate.onWishingStarOutputBound then
			delegate.onWishingStarOutputBound(wishingStarButton)
		end

		ClientTextUtils.setText(PetManagementUtils.beenText, pg.getFormatText(pg.getGameString("BEEN_WITH"), math.round((Time.secondCache * 1000 - data.time) / 1000 / 3600 / 24)))
		ClientTextUtils.setText(PetManagementUtils.textUSDFText, PetManagementUtils.getDisplayBookNumberText(data))

		local petCubeItemId = data and data.cubeItemId

		LuaUIUtils.refreshPetPanelInfoCubeAndBackground(petCubeItemId, PetManagementUtils.panelInfoUContainerObjectReference)
		PetManagementUtils._refreshPetName(PetManagementUtils.petNameStr)

		if data.isShiny then
			PetManagementUtils.uINodePetPanelInfoUComponent:TryChangePage("isFlash", 1)
		else
			PetManagementUtils.uINodePetPanelInfoUComponent:TryChangePage("isFlash", 0)
		end

		if data.isBoss then
			PetManagementUtils.uINodePetPanelInfoUComponent:TryChangePage("isBoss", 1)
		else
			PetManagementUtils.uINodePetPanelInfoUComponent:TryChangePage("isBoss", 0)
		end

		function PetManagementUtils.btnTalentUButtonHome.luaClick()
			local talentData = {}

			talentData.targetRect = PetManagementUtils.uINodePetPanelInfoUComponent
			talentData.autoHor = true
			talentData.type = UIConst.GIFT_TYPE.HOME
			talentData.showType = UIConst.GIFT_SHOW_TYPE.GIFT
			talentData.giftType = UIConst.GIFT_TYPE.HOME
			talentData.breedTalent = data.breedTalent

			if not isForbidPetPropUseBtn then
				talentData.petId = data.id
			end

			talentData.extra = {
				openFun = function()
					PetManagementUtils.btnTalentUButtonHome.isSelected = true

					PetManagementUtils.btnTalentUButtonHome:TryChangePage("button", 5)
				end,
				closeFun = function()
					if not PetManagementUtils.btnTalentUButtonHome then
						return
					end

					PetManagementUtils.btnTalentUButtonHome.isSelected = false

					PetManagementUtils.btnTalentUButtonHome:TryChangePage("button", 0)
				end
			}

			pg.global.ui:open(UIConst.UI_ID_PET_GIFT_TIPS, talentData)
		end

		function PetManagementUtils.btnAbilityUButton.luaClick()
			local abilityData = PetManagementUtils._getHomeAbilityData()
			local talentData = {}

			talentData.targetRect = PetManagementUtils.uINodePetPanelInfoUComponent
			talentData.autoHor = true
			talentData.showType = UIConst.GIFT_SHOW_TYPE.ABILITY
			talentData.abilityData = abilityData

			pg.global.ui:open(UIConst.UI_ID_PET_GIFT_TIPS, talentData)
		end

		if PetManagementUtils.petManagementSceneCtrl and PetManagementUtils.petManagementSceneCtrl.scene then
			PetManagementUtils.petManagementSceneCtrl:previewPet(PetManagementUtils.petId)
		end

		PetManagementUtils._refreshGiftInfoList(data)
		PetManagementUtils._refreshSource(data)
	end

	function PetManagementUtils._refreshSource(data)
		local source = PetManagementDataHelper.getPetSource(data.id)
		local showSource = source ~= nil and source ~= ""

		PetManagementUtils.sourceUWidget:SetActive(showSource)

		if showSource then
			local playerName = ""
			local playerInfo = pg.game.chat:getPlayerInfo(source)

			if playerInfo then
				playerName = playerInfo.playerName or ""
			end

			local _h = PetManagementUtils._platformHooks

			playerName = _h and _h.refreshSourcePlayerName and _h.refreshSourcePlayerName(PetManagementUtils, data, source, playerName, playerInfo) or playerName

			local tip = string.gsub(pg.getGameString("PET_EXCHANGE_SOURCE"), "{0}", playerName)

			ClientTextUtils.setText(PetManagementUtils.txtSourceUBaseText, tip)
		end
	end

	function PetManagementUtils._refreshGiftInfoList(data)
		function PetManagementUtils.accessListUListHome.luaRenderItem(button, _, itemData)
			if itemData.empty then
				return
			end

			local objectReference = button:GetComponent("ObjectReference")
			local iconUImage = objectReference:GetRefValue("iconUImage")
			local rayBoxUWidget = objectReference:GetRefValue("rayBoxUWidget")

			iconUImage.url = itemData.icon

			rayBoxUWidget.gameObject:SetActiveEx(false)
			button:TryChangePage("Quality", itemData.quality)
		end

		PetManagementUtils.accessListUListHome:SetList(data.breedTalent)

		function PetManagementUtils.abilityListUList.luaRenderItem(button, _, itemData)
			LuaUIUtils.renderHomeAbility(button, itemData.id, itemData.level)
		end

		PetManagementUtils.abilityListUList:SetList(PetManagementUtils._getHomeAbilityData())
	end

	function PetManagementUtils._getHomeAbilityData()
		local homeAbility = PetData[PetManagementUtils.templateId].homeAbility
		local abilityData = {}

		if not homeAbility then
			return abilityData
		end

		for id, ability in pairs(homeAbility) do
			local data = {}

			data.id = id
			data.level = ability

			table.insert(abilityData, data)
		end

		return abilityData
	end

	function PetManagementUtils.checkHomePetOperationLocked(petId)
		local petInfo = petId and pg.me and pg.me:getPetInfo(petId)
		local isInHomeCamp = petInfo and HomeLandUtils.isPetInHomeCamp(petInfo.id)

		if not petInfo or not pg.me:isPetPutInHomeland(petInfo) and not isInHomeCamp then
			return false
		end

		pg.global.showBubbleMessageById(NoticeDef.HOME_ERROR_PET_OPERATION_FORBIDDEN)

		return true
	end

	function PetManagementUtils._previewSceneProcess()
		if PetManagementUtils.rawImageRawImagePro then
			PetManagementUtils.petManagementSceneCtrl:setRawImageProRef(PetManagementUtils.rawImageRawImagePro)
		else
			PetManagementUtils.rawImageRawImageProData = PetManagementUtils.petManagementSceneCtrl
		end
	end
end
