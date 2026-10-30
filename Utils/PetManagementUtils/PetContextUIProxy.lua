-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetContextUIProxy.lua

local EMPTY_TABLE = require("Core.Common.EmptyTable")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local UIConst = require("Const.UIConst")
local TimerManager = require("Core.Timer.TimerManager")
local PetResearchUtils = require("Guis.Utils.PetResearchUtils")
local MessageName = require("Const.MessageName")

return function(PetManagementUtils)
	function PetManagementUtils._setContextOwner(owner)
		PetManagementUtils.contextOwner = owner
	end

	function PetManagementUtils.isContextOwner(owner)
		if owner == nil then
			return true
		end

		return PetManagementUtils.contextOwner == owner
	end

	function PetManagementUtils.initTemplate(infoPanelTrans, midPanelTrans, param)
		PetManagementUtils.subDisplayType = UIConst.PET_SLOT_SUB_DISPLAY_TYPE.Normal
		PetManagementUtils.param = param

		PetManagementUtils._setContextOwner(param and param.owner or nil)
		PetManagementUtils._dealPreProcess()
		PetManagementUtils._renderInfoPanel(infoPanelTrans)
		PetManagementUtils._renderMidPanel(midPanelTrans)

		if PetManagementUtils.param.uiScene then
			PetManagementUtils.petManagementSceneCtrl = PetManagementUtils.param.uiScene

			PetManagementUtils._previewSceneProcess()
		end
	end

	function PetManagementUtils.initSimpleMidTemplate(midPanelTrans, param, isForbidAutoSelected, subDisplayType)
		PetManagementUtils.subDisplayType = subDisplayType or UIConst.PET_SLOT_SUB_DISPLAY_TYPE.Normal

		if isForbidAutoSelected then
			PetManagementUtils.selectSlot = nil
		end

		PetManagementUtils.onlyRenderMidPanel = true
		PetManagementUtils.param = param

		PetManagementUtils._setContextOwner(param and param.owner or nil)
		PetManagementUtils._dealPreProcess()
		PetManagementUtils._renderMidPanel(midPanelTrans)
	end

	function PetManagementUtils.initSimpleInfoTemplate(infoPanelTrans, param)
		PetManagementUtils.subDisplayType = UIConst.PET_SLOT_SUB_DISPLAY_TYPE.Normal
		PetManagementUtils.param = param

		PetManagementUtils._setContextOwner(param and param.owner or nil)
		PetManagementUtils._renderInfoPanel(infoPanelTrans)

		if PetManagementUtils.param.uiScene then
			PetManagementUtils.petManagementSceneCtrl = PetManagementUtils.param.uiScene

			PetManagementUtils._previewSceneProcess()
		end
	end

	function PetManagementUtils.showPetInfo(petInfo)
		PetManagementUtils._refreshPetInfoDetail(petInfo)
	end

	function PetManagementUtils._innerDestroy()
		for key, value in pairs(PetManagementUtils) do
			if type(value) ~= "function" then
				PetManagementUtils[key] = nil
			end
		end

		PetManagementUtils.onFilterListRenderFinished = nil
		PetManagementUtils.onNormalListRenderFinished = nil
		PetManagementUtils.onPetInfoPageChange = nil

		if PetManagementUtils.homeOpenTimerId then
			TimerManager.removeTimer(PetManagementUtils.homeOpenTimerId)
		end

		for _, timer in pairs(PetManagementUtils.m_filterTimers or EMPTY_TABLE) do
			if timer then
				TimerManager.removeTimer(timer)
			end
		end

		PetManagementUtils.m_filterTimers = nil

		PetManagementUtils.clearPetAttributeTimer()
	end

	function PetManagementUtils.destroyTemplate(owner)
		if owner ~= nil and not PetManagementUtils.isContextOwner(owner) then
			return false
		end

		PetManagementUtils._innerDestroy()

		PetResearchUtils.inDetailLoading = nil

		return true
	end

	function PetManagementUtils.initMsg(ctrl)
		if not ctrl.messages then
			ctrl.messages = {}
		end

		function ctrl:refreshPetBox(info)
			PetManagementUtils._refreshPetList()
			PetManagementUtils._refreshBoxSelector()
		end

		function ctrl:onPetCustomNameChanged(info)
			local petId = info.petId

			if petId == PetManagementUtils.petId then
				local name = PetManagementDataHelper.getPetName(petId)

				PetManagementUtils._refreshPetName(name)
			end
		end

		function ctrl:onBoxNameChanged(info)
			PetManagementUtils._refreshBoxSelector()
			PetManagementUtils._refreshSingleBoxSelectorItemName(info.index, info.newName)
		end

		function ctrl:onPetFavoriteChanged(info)
			TimerManager.addNextFrameCb(function()
				PetManagementUtils._resetBtnState()
				PetManagementUtils._refreshSingleCardFavoriteState(info[1], info[2])
				PetManagementUtils.refreshPetList()
			end)
		end

		function ctrl:onPetFavoriteTypeChanged(info)
			TimerManager.addNextFrameCb(function()
				local petId = info[1]
				local favoriteType = info[2] or 0

				PetManagementUtils._resetBtnState()
				PetManagementUtils._refreshSingleCardFavoriteState(petId, favoriteType > 0)
				PetManagementUtils.refreshPetList()

				local petInfo = pg.me:getPetInfo(petId)

				if petInfo then
					PetManagementUtils.onPetFavoriteChanged(petInfo)
				end
			end)
		end

		function ctrl:onPetCurAbilityChanged(info)
			local petId = info.petId

			if petId == PetManagementUtils.petId then
				PetManagementUtils._refreshSkillList(petId)
			end
		end

		function ctrl:event_CarryEquipped(info)
			PetManagementUtils._setCarryItem(info.petId)
		end

		function ctrl:event_CarryUnload(info)
			PetManagementUtils._setCarryItem(info.petId)
		end

		function ctrl.onPetTagAnimRecordUpdate()
			if PetManagementUtils.currentPetInfoData then
				PetManagementUtils._refreshPetTagList(PetManagementUtils.currentPetInfoData, true)
			end
		end

		function ctrl.onHomelandWishStarChanged()
			local petInfo = PetManagementUtils.currentPetInfoData

			if not petInfo or petInfo.id ~= PetManagementUtils.petId or not PetManagementUtils.panelInfoUContainer or not PetManagementUtils.panelInfoUContainer:CheckURLLoaded() or not PetManagementUtils.panelInfoDetailObjectReference then
				return
			end

			LuaUIUtils.refreshHomeWishingStarOutput(PetManagementUtils.panelInfoDetailObjectReference, petInfo)
		end

		ctrl.messages[MessageName.PET_BOX_MAP_UPDATE] = {
			"refreshPetBox",
			true
		}
		ctrl.messages[MessageName.PET_CUSTOM_NAME_CHANGED] = {
			"onPetCustomNameChanged",
			true
		}
		ctrl.messages[MessageName.ON_BOX_NAME_CHANGE] = {
			"onBoxNameChanged",
			true
		}
		ctrl.messages[MessageName.PET_FAVORITE_CHANGE] = {
			"onPetFavoriteChanged",
			true
		}
		ctrl.messages[MessageName.PET_FAVORITE_TYPE_CHANGE] = {
			"onPetFavoriteTypeChanged",
			true
		}
		ctrl.messages[MessageName.PLAYER_PET_CUR_ABILITY_CHANGED] = {
			"onPetCurAbilityChanged",
			true
		}
		ctrl.messages[MessageName.CARRY_EQUIP] = {
			"event_CarryEquipped",
			true
		}
		ctrl.messages[MessageName.CARRY_UNLOAD] = {
			"event_CarryUnload",
			true
		}
		ctrl.messages[MessageName.PET_TAG_ANIM_RECORD_UPDATE] = {
			"onPetTagAnimRecordUpdate",
			true
		}
		ctrl.messages[MessageName.HOMELAND_WISH_STAR_CHANGED] = {
			"onHomelandWishStarChanged",
			true
		}
	end

	function PetManagementUtils.setOnFilterListRenderFinishedCb(cb)
		PetManagementUtils.onFilterListRenderFinished = cb
	end

	function PetManagementUtils.setOnNormalListRenderFinishedCb(cb)
		PetManagementUtils.onNormalListRenderFinished = cb
	end

	function PetManagementUtils.setListButtonDelegateTable(t, owner)
		PetManagementUtils.delegateTable = t
		PetManagementUtils.delegateOwner = owner
	end

	function PetManagementUtils._hasPetListContext()
		if PetManagementUtils.inFilterMode then
			return PetManagementUtils.boxPetFilterList ~= nil
		end

		return PetManagementUtils.boxPetNewListContainers ~= nil
	end

	function PetManagementUtils._hasMidPanelContext()
		return PetManagementUtils.boxSelector ~= nil and PetManagementUtils._hasPetListContext()
	end

	function PetManagementUtils._hasInfoPanelContext()
		return PetManagementUtils.rightPanelUComponent ~= nil and PetManagementUtils.attributeBtn ~= nil and PetManagementUtils.skillBtn ~= nil and PetManagementUtils.infoBtn ~= nil and PetManagementUtils.panelAbilityUContainer ~= nil and PetManagementUtils.panelSkillUContainer ~= nil and PetManagementUtils.panelInfoUContainer ~= nil
	end

	function PetManagementUtils.hasTemplateContext(owner)
		if owner ~= nil and not PetManagementUtils.isContextOwner(owner) then
			return false
		end

		if owner ~= nil and PetManagementUtils.delegateOwner ~= owner then
			return false
		end

		return PetManagementUtils.hasAnyTemplateContext()
	end

	function PetManagementUtils.hasAnyTemplateContext()
		return PetManagementUtils.delegateTable ~= nil and PetManagementUtils._hasInfoPanelContext() and PetManagementUtils._hasMidPanelContext()
	end

	function PetManagementUtils.hasOtherTemplateContext(owner)
		return PetManagementUtils.contextOwner ~= owner and PetManagementUtils.hasAnyTemplateContext()
	end

	function PetManagementUtils._restoreContextIfNeeded(owner, contextRestoreCb)
		if owner == nil then
			return
		end

		if PetManagementUtils.hasTemplateContext(owner) then
			return
		end

		if PetManagementUtils.hasOtherTemplateContext(owner) then
			return
		end

		if contextRestoreCb then
			contextRestoreCb()
		end
	end

	function PetManagementUtils._captureContextRestorer()
		local owner = PetManagementUtils.contextOwner
		local contextRestoreCb = PetManagementUtils.param and PetManagementUtils.param.contextRestoreCb

		return function()
			PetManagementUtils._restoreContextIfNeeded(owner, contextRestoreCb)
		end
	end
end
