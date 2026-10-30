-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Utils\\PetManagementUtils\\PetBoxUIProxy.lua

local TimeUtils = require("Common.Utils.TimeUtils")
local Const = require("Common.Const.Const")
local LuaUIUtils = require("Utils.LuaUIUtils")
local PetManagementDataHelper = require("Utils.PetManagementDataHelper")
local Utils = require("Common.Utils.Utils")
local ClientTextUtils = require("Utils.ClientTextUtils")
local UIConst = require("Const.UIConst")
local TimerManager = require("Core.Timer.TimerManager")
local Time = require("Core.Common.Time")
local AddressDataConst = require("Const.AddressDataConst")
local ClientConst = require("Const.ClientConst")
local HomeCampUtils = require("Utils.HomeCampUtils")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local UICtrl = require("Guis.UICtrl")
local PetWarehouseConst = require("GameApp.PetManage.PetWarehouseConst")

return function(PetManagementUtils)
	function PetManagementUtils._dealPreProcess()
		PetManagementDataHelper.selectSortId = nil
		PetManagementDataHelper.isDescending = nil
		PetManagementUtils.inFilterMode = false
		PetManagementDataHelper.filter = nil

		if PetManagementUtils.param and PetManagementUtils.param.selectPetId then
			local slot, box = LuaUIUtils.getPetBelongBoxAndSlotId(PetManagementUtils.param.selectPetId)

			if not slot or not box then
				return
			end

			PetManagementDataHelper.setSelectBoxId(box)

			PetManagementUtils.selectSlot = slot - 1
		end
	end

	function PetManagementUtils._renderMidPanel(midPanelTrans)
		PetManagementUtils._findMidPanelObjects(midPanelTrans)
		PetManagementUtils._initMidPanelView()
	end

	function PetManagementUtils._findMidPanelObjects(midPanelTrans)
		PetManagementUtils.minPanelObjectReference = midPanelTrans:GetComponent("ObjectReference")
		PetManagementUtils.midPanelUComponent = PetManagementUtils.minPanelObjectReference:GetRefValue("midPanelUComponent")
		PetManagementUtils.boxPetNew = PetManagementUtils.minPanelObjectReference:GetRefValue("boxPetNew")
		PetManagementUtils.boxPetFilterList = PetManagementUtils.minPanelObjectReference:GetRefValue("boxPetFilterList")
		PetManagementUtils.boxSelector = PetManagementUtils.minPanelObjectReference:GetRefValue("boxSelector")
		PetManagementUtils.btnLeftUButton = PetManagementUtils.minPanelObjectReference:GetRefValue("btnLeftUButton")
		PetManagementUtils.btnRightUButton = PetManagementUtils.minPanelObjectReference:GetRefValue("btnRightUButton")
		PetManagementUtils.btnFilterUButton = PetManagementUtils.minPanelObjectReference:GetRefValue("btnFilterUButton")
		PetManagementUtils.btnFilter1UButton = PetManagementUtils.minPanelObjectReference:GetRefValue("btnFilter1UButton")
		PetManagementUtils.btnCleanFilterUButton = PetManagementUtils.minPanelObjectReference:GetRefValue("btnCleanFilterUButton")
		PetManagementUtils.btnLeftHotKeyContent = PetManagementUtils.minPanelObjectReference:GetRefValue("btnLeftHotKeyContent")
		PetManagementUtils.btnRightHotKeyContent = PetManagementUtils.minPanelObjectReference:GetRefValue("btnRightHotKeyContent")

		local boxPbFilter2 = midPanelTrans:Find("ListControl/PbFilter2")

		PetManagementUtils.boxPbFilter2Go = boxPbFilter2 and boxPbFilter2.gameObject or nil
		PetManagementUtils.boxPetNewListContainers = {}

		for i = 0, 23 do
			PetManagementUtils.boxPetNewListContainers[i] = PetManagementUtils.boxPetNew.transform:GetChild(i).transform:GetComponent("UContainer")
		end
	end

	function PetManagementUtils._initMidPanelView()
		local restoreContext = PetManagementUtils._captureContextRestorer()

		function PetManagementUtils.btnLeftUButton.luaClick()
			restoreContext()
			PetManagementUtils._switchBoxPages(true)

			local delegate = PetManagementUtils.delegateTable

			if delegate and delegate.gamepadPetBoxPageHandledByPrefab and delegate.onGamepadPetBoxPageSwitched then
				delegate.onGamepadPetBoxPageSwitched()
			end
		end

		function PetManagementUtils.btnRightUButton.luaClick()
			restoreContext()
			PetManagementUtils._switchBoxPages(false)

			local delegate = PetManagementUtils.delegateTable

			if delegate and delegate.gamepadPetBoxPageHandledByPrefab and delegate.onGamepadPetBoxPageSwitched then
				delegate.onGamepadPetBoxPageSwitched()
			end
		end

		local delegate = PetManagementUtils.delegateTable

		if not delegate or not delegate.gamepadPetBoxPageHandledByPrefab then
			UICtrl.bindHotKeyPerform(nil, "Hud/LeftTriggerPagePrev", function()
				local currentDelegate = PetManagementUtils.delegateTable

				if not currentDelegate or not currentDelegate.canGamepadSwitchPetBoxPage or currentDelegate.canGamepadSwitchPetBoxPage() then
					PetManagementUtils.btnLeftUButton.luaClick()

					if currentDelegate and currentDelegate.onGamepadPetBoxPageSwitched then
						currentDelegate.onGamepadPetBoxPageSwitched()
					end
				end
			end, PetManagementUtils.btnLeftUButton.gameObject)
			UICtrl.bindHotKeyPerform(nil, "Hud/RightTriggerPageNxt", function()
				local currentDelegate = PetManagementUtils.delegateTable

				if not currentDelegate or not currentDelegate.canGamepadSwitchPetBoxPage or currentDelegate.canGamepadSwitchPetBoxPage() then
					PetManagementUtils.btnRightUButton.luaClick()

					if currentDelegate and currentDelegate.onGamepadPetBoxPageSwitched then
						currentDelegate.onGamepadPetBoxPageSwitched()
					end
				end
			end, PetManagementUtils.btnRightUButton.gameObject)

			if PetManagementUtils.btnLeftHotKeyContent then
				PetManagementUtils.btnLeftHotKeyContent:SetHotKeyPaths("Hud/LeftTriggerPagePrev")
				PetManagementUtils.btnRightHotKeyContent:SetHotKeyPaths("Hud/RightTriggerPageNxt")
			end
		end

		UICtrl.bindHotKeyPerform(nil, "Hud/InteractScroll", function(_, inputInfo)
			return PetManagementUtils._onPerformPetBoxScroll(inputInfo, restoreContext)
		end, PetManagementUtils.btnLeftUButton.gameObject, "petBoxScroll")

		function PetManagementUtils.btnFilterUButton.luaClick()
			restoreContext()
			PetManagementUtils._openFilterPanel()
		end

		function PetManagementUtils.btnFilter1UButton.luaClick()
			restoreContext()
			PetManagementUtils._openFilterPanel()
		end

		function PetManagementUtils.btnCleanFilterUButton.luaClick()
			restoreContext()
			PetManagementUtils._endFilter()
		end

		function PetManagementUtils.boxPetFilterList.luaRenderItem(button, index, data)
			if PetManagementUtils.displayType == UIConst.PET_SLOT_DISPLAY_TYPE.Homeland then
				PetManagementUtils._setHomeBoxPetListData(button, index, data)
			else
				PetManagementUtils._setBoxPetListData(button, index, data)
			end

			local ctrlConfig = PetManagementUtils.param and PetManagementUtils.param.ctrlConfig or {}
			local isForbidUBtnDrag = ctrlConfig.isForbidUBtnDrag or false

			if isForbidUBtnDrag then
				button.draggable = false
			end
		end

		PetManagementUtils.midPanelUComponent:TryChangePage("State", PetManagementUtils.inFilterMode and 1 or 0)
		PetManagementUtils._refreshPetList()
		PetManagementUtils._refreshBoxSelector()
	end

	function PetManagementUtils.refreshPetList(selectedIndex)
		PetManagementUtils._refreshPetList(selectedIndex)
	end

	function PetManagementUtils.tryAddCachePetsByBoxId(selectBoxId, petInfos, type)
		if not type then
			return
		end
	end

	function PetManagementUtils._refreshPetList()
		if not PetManagementUtils._hasPetListContext() then
			return
		end

		PetManagementUtils.inFightPetInfos = PetManagementDataHelper.getGroupInfoById(PetManagementDataHelper.getSelectGroupId())

		local selectBoxId = PetManagementDataHelper.getSelectBoxId()
		local petInfos

		if PetManagementUtils.inFilterMode then
			petInfos = PetManagementDataHelper.getFilteredPetsInfo()
		else
			petInfos = PetManagementDataHelper.getBoxInfoById(selectBoxId)
		end

		PetManagementUtils.petInfos = petInfos

		local ctrlConfig = PetManagementUtils.param and PetManagementUtils.param.ctrlConfig or {}
		local isForbidUBtnDrag = ctrlConfig.isForbidUBtnDrag or false

		if PetManagementUtils.inFilterMode then
			function PetManagementUtils.boxPetFilterList.luaFinishRender(_)
				if PetManagementUtils.selectSlot then
					PetManagementUtils._refreshPetSelectedStatus(PetManagementUtils.selectSlot)
				end

				if PetManagementUtils.onFilterListRenderFinished then
					PetManagementUtils.onFilterListRenderFinished()
				end
			end

			PetManagementUtils.boxPetFilterList:SetList(petInfos)
		else
			local isHome = PetManagementUtils.displayType == UIConst.PET_SLOT_DISPLAY_TYPE.Homeland

			for i = 0, #PetManagementUtils.boxPetNewListContainers do
				local data = petInfos[i + 1]
				local isShowEmpty = PetManagementUtils._isShowHeadPetEmpty(data.id, data.isEmpty)

				if isShowEmpty then
					PetManagementUtils.boxPetNewListContainers[i].url = AddressDataConst.PET_EMPTY_SLOT
				elseif isHome then
					PetManagementUtils.boxPetNewListContainers[i].url = AddressDataConst.PET_HOME_MANAGE_SLOT
				else
					PetManagementUtils.boxPetNewListContainers[i].url = AddressDataConst.PET_NORMAL_SLOT
				end

				local uBtn = PetManagementUtils.boxPetNewListContainers[i].content:GetComponent("UButton")

				if isHome then
					PetManagementUtils._setHomeBoxPetListData(uBtn, i, data)
				else
					PetManagementUtils._setBoxPetListData(uBtn, i, data)
				end

				uBtn.dataFromUList = data

				if isForbidUBtnDrag then
					uBtn.draggable = false
				end
			end

			if PetManagementUtils.selectSlot then
				PetManagementUtils._refreshPetSelectedStatus(PetManagementUtils.selectSlot)
			end

			if PetManagementUtils.onNormalListRenderFinished then
				PetManagementUtils.onNormalListRenderFinished()
			end
		end
	end

	function PetManagementUtils.setSelectedPet(index, isMultiSelect)
		PetManagementUtils._refreshPetSelectedStatus(index, isMultiSelect)
	end

	function PetManagementUtils._isShowHeadPetEmpty(petId, isRealEmpty)
		return isRealEmpty
	end

	function PetManagementUtils.getPetListPressData(button, data)
		if Utils.isTable(button) and Utils.isTable(button.dataFromUList) then
			return button.dataFromUList
		end

		return data
	end

	function PetManagementUtils.resolveSelectedPetDisplayData(sData, selectButton)
		local liveData = PetManagementDataHelper.resolveLivePetDisplayData(sData)

		if Utils.isTable(liveData) and Utils.isTable(selectButton) then
			selectButton.dataFromUList = liveData
		end

		return liveData
	end

	function PetManagementUtils._setHomeBoxPetListData(button, index, data)
		button.name = index + 1
		button.enabledTooltip = false

		local restoreContext = PetManagementUtils._captureContextRestorer()

		function button.luaPress()
			restoreContext()

			local pressData = PetManagementUtils.getPetListPressData(button, data)
			local needRefresh = true

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaPress then
				needRefresh = PetManagementUtils.delegateTable.luaPress(button, index, pressData) ~= false
			end

			if needRefresh then
				PetManagementUtils._refreshPetSelectedStatus(index, nil, button, pressData)
			end
		end

		local isShowEmpty = PetManagementUtils._isShowHeadPetEmpty(data.id, data.isEmpty)

		if isShowEmpty then
			button.draggable = false

			return
		end

		function button.luaClick()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaClick then
				PetManagementUtils.delegateTable.luaClick(button, index, data)
			end
		end

		function button.luaHover()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaHover then
				PetManagementUtils.delegateTable.luaHover(button, index, data)
			end
		end

		function button.luaUnhover()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaUnhover then
				PetManagementUtils.delegateTable.luaUnhover(button, index, data)
			end
		end

		function button.luaTryChangePage(name, pageIdx, lastPageIdx)
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaTryChangePage then
				PetManagementUtils.delegateTable.luaTryChangePage(name, pageIdx, lastPageIdx)
			end
		end

		function button.luaEnterDropWidget(target)
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaEnterDropWidget then
				PetManagementUtils.delegateTable.luaEnterDropWidget(data, target)
			end
		end

		function button.luaExitDropWidget()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaExitDropWidget then
				PetManagementUtils.delegateTable.luaExitDropWidget()
			end
		end

		button.dynamicUpdateDropWidget = PetManagementUtils.dynamicUpdateDropWidget

		local getShowAppearanceTags = PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.getShowAppearanceTags

		LuaUIUtils.renderHomePetHead(button, data, nil, {
			showAppearanceTags = getShowAppearanceTags and getShowAppearanceTags() or false
		})

		local objectReference = button:GetComponent("ObjectReference")
		local txtUsedUSDFText = objectReference:GetRefValue("txtUsedUSDFText")
		local showInGamePlayBattle = pg.game.petManage:getPetIsInGamePlayBattle(data.id)

		button:TryChangePage("state", showInGamePlayBattle and 1 or 0)

		if txtUsedUSDFText then
			txtUsedUSDFText:SetActive(showInGamePlayBattle)

			if showInGamePlayBattle then
				ClientTextUtils.setText(txtUsedUSDFText, pg.getGameString("NOT_CAN_REALSE_INBATTLE"))
			end
		end

		button.draggable = not showInGamePlayBattle

		function button.luaBeginDrag()
			restoreContext()

			PetManagementUtils.isPetBoxDragging = true

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaBeginDrag then
				PetManagementUtils.delegateTable.luaBeginDrag(button, index, data)
			end
		end

		function button.luaDrag(pointerPosition)
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaDrag then
				PetManagementUtils.delegateTable.luaDrag(data, pointerPosition)
			end
		end

		function button.luaEndDrag(dropWidget, rayBox, pointerPosition)
			PetManagementUtils.isPetBoxDragging = false

			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaEndDrag then
				PetManagementUtils.delegateTable.luaEndDrag(button, dropWidget, rayBox, data, pointerPosition)
			end
		end

		local battleNum = -1

		for i, v in pairs(PetManagementUtils.inFightPetInfos) do
			if v.id == data.id then
				battleNum = i - 1

				break
			end
		end

		if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.renderExtraLogic then
			PetManagementUtils.delegateTable.renderExtraLogic(button, index, data)
		end
	end

	function PetManagementUtils._setBoxPetListData(button, index, data)
		button.name = index + 1
		button.dataFromUList = data
		button.enabledTooltip = false

		local restoreContext = PetManagementUtils._captureContextRestorer()

		function button.luaPress()
			restoreContext()

			local pressData = PetManagementUtils.getPetListPressData(button, data)
			local needRefresh = true

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaPress then
				needRefresh = PetManagementUtils.delegateTable.luaPress(button, index, pressData) ~= false
			end

			if needRefresh then
				PetManagementUtils._refreshPetSelectedStatus(index, nil, button, pressData)
			end
		end

		local isShowEmpty = PetManagementUtils._isShowHeadPetEmpty(data.id, data.isEmpty)

		if isShowEmpty then
			button.draggable = false

			return
		end

		local objectReference = button:GetComponent("ObjectReference")
		local battleNumUContainer = objectReference:GetRefValue("battleNumUContainer")
		local listCharUContainer = objectReference:GetRefValue("listCharUContainer")

		listCharUContainer:LoadDefaultUrlManually()

		local exploreSkillEquipped = listCharUContainer.content:GetComponent("UList")

		function button.luaClick()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaClick then
				PetManagementUtils.delegateTable.luaClick(button, index, data)
			end
		end

		function button.luaHover()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaHover then
				PetManagementUtils.delegateTable.luaHover(button, index, data)
			end
		end

		function button.luaUnhover()
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaUnhover then
				PetManagementUtils.delegateTable.luaUnhover(button, index, data)
			end
		end

		function button.luaTryChangePage(name, pageIdx, lastPageIdx)
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaTryChangePage then
				PetManagementUtils.delegateTable.luaTryChangePage(name, pageIdx, lastPageIdx)
			end
		end

		LuaUIUtils.renderPetHead(button, data)
		button:TryChangePage("isBoss", 0)

		if data.id and data.id == PetManagementUtils.curSelectPetId then
			button:TryChangePage("button", 5)

			button.isSelected = true
		else
			button:TryChangePage("button", 0)

			button.isSelected = false
		end

		button.draggable = true

		PetManagementUtils._showFilterLabel(button, data)

		function button.luaBeginDrag()
			restoreContext()

			PetManagementUtils.isPetBoxDragging = true

			local numCPUText = button.replicaWidget.gameObject:GetComponent("ObjectReference"):GetRefValue("numCPUSDFText")
			local pet = pg.me:getPetInfo(data.id)

			if pet and pet:isCatchReporting() then
				ClientTextUtils.setText(numCPUText, "???")
			else
				ClientTextUtils.setText(numCPUText, data.cp or "")
			end

			PetManagementUtils._showFilterLabel(button.replicaWidget, data, function()
				if PetManagementUtils.isPetBoxDragging ~= true then
					return false
				end

				if IsNil(button.replicaWidget) then
					return false
				end

				return true
			end)

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaBeginDrag then
				PetManagementUtils.delegateTable.luaBeginDrag(button, index, data)
			end
		end

		function button.luaDrag(pointerPosition)
			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaDrag then
				PetManagementUtils.delegateTable.luaDrag(data, pointerPosition)
			end
		end

		function button.luaEndDrag(dropWidget, rayBox, pointerPosition)
			PetManagementUtils.isPetBoxDragging = false

			restoreContext()

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.luaEndDrag then
				PetManagementUtils.delegateTable.luaEndDrag(button, dropWidget, rayBox, data, pointerPosition)
			end
		end

		function exploreSkillEquipped.luaRenderItem(b, _, d)
			b:TryChangePage("Char", d.index - 1)
			b:TryChangePage("Quality", d.quality)
		end

		local explorePets = PetManagementDataHelper.getExploreGroupInfo()
		local exploreIndexes = {}

		for k, v in pairs(explorePets) do
			if v.id == data.id then
				exploreIndexes[#exploreIndexes + 1] = {
					index = k,
					quality = data.exploreSkillIndexLevel[k]
				}
			end
		end

		if #exploreIndexes <= 0 then
			exploreSkillEquipped.gameObject:SetActiveEx(false)
		else
			exploreSkillEquipped.gameObject:SetActiveEx(true)
			exploreSkillEquipped:SetList(exploreIndexes)
		end

		local battleNum = -1

		for i, v in pairs(PetManagementUtils.inFightPetInfos) do
			if v.id == data.id then
				battleNum = i - 1

				break
			end
		end

		if battleNum == -1 then
			if battleNumUContainer:CheckURLLoaded() then
				battleNumUContainer:DestroyContent()
			end
		elseif battleNumUContainer:CheckURLLoaded() then
			battleNumUContainer.content:TryChangePage("number", battleNum)
		else
			battleNumUContainer:LoadDefaultUrlManually(function(widget)
				widget:TryChangePage("number", battleNum)
			end)
		end

		if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.renderExtraLogic then
			PetManagementUtils.delegateTable.renderExtraLogic(button, index, data)
		end
	end

	function PetManagementUtils.clearBatchSelect()
		local buttons, lastIndex
		local petInfos = PetManagementUtils.petInfos

		buttons, lastIndex = PetManagementUtils._getPetListButtons()

		if not buttons or not petInfos then
			return
		end

		for i = 0, lastIndex do
			local isEmpty = petInfos[i + 1].isEmpty
			local uBtn = buttons[i]

			uBtn.draggable = not isEmpty
			uBtn.isSelected = false

			uBtn:TryChangePage("Batch", 0)
		end
	end

	function PetManagementUtils._getPetListButtons()
		local buttons, lastIndex

		if PetManagementUtils.inFilterMode then
			if not PetManagementUtils.boxPetFilterList then
				return
			end

			buttons = PetManagementUtils.boxPetFilterList:GetAllButtons()

			if not buttons or buttons.Length <= 0 then
				return
			end

			lastIndex = buttons.Length - 1
		else
			if not PetManagementUtils.boxPetNewListContainers then
				return
			end

			buttons = {}

			for i = 0, #PetManagementUtils.boxPetNewListContainers do
				local container = PetManagementUtils.boxPetNewListContainers[i]

				if not container or not container.content then
					return
				end

				buttons[i] = container.content:GetComponent("UButton")
			end

			lastIndex = #buttons
		end

		return buttons, lastIndex
	end

	function PetManagementUtils._refreshPetSelectedStatus(index, isMultiSelect, selectedButton, selectedData)
		local findIndex, buttons, lastIndex

		buttons, lastIndex = PetManagementUtils._getPetListButtons()

		if not buttons then
			return
		end

		if isMultiSelect ~= nil then
			local targetButton = selectedButton

			if not targetButton and PetManagementUtils.inFilterMode and index ~= nil then
				local _, btn = PetManagementUtils.boxPetFilterList:TryGetChildAt(index)

				targetButton = btn
			end

			targetButton = targetButton or buttons[index]

			if not targetButton then
				return
			end

			if isMultiSelect then
				targetButton:TryChangePage("Batch", 1)
			else
				targetButton:TryChangePage("Batch", 0)
			end
		else
			local selectData = selectedData
			local selectButton = selectedButton

			if PetManagementUtils.inFilterMode and selectData == nil and index ~= nil then
				selectData = PetManagementUtils.petInfos and PetManagementUtils.petInfos[index + 1]

				local _, btn = PetManagementUtils.boxPetFilterList:TryGetChildAt(index)

				selectButton = btn
			end

			for i = 0, lastIndex do
				buttons[i]:TryChangePage("button", 0)

				local isTarget

				if selectButton then
					isTarget = buttons[i] == selectButton
				elseif index ~= nil then
					isTarget = i == index
				end

				if isTarget then
					buttons[i].isSelected = true
					PetManagementUtils.selectedBtn = buttons[i]
					findIndex = i
				else
					buttons[i].isSelected = false
				end
			end

			local sData = selectData

			if not sData and findIndex and buttons[findIndex] then
				sData = buttons[findIndex].dataFromUList
			end

			if not sData then
				return
			end

			local targetButton = selectButton or findIndex and buttons[findIndex]

			sData = PetManagementUtils.resolveSelectedPetDisplayData(sData, targetButton)

			if not sData then
				return
			end

			if not PetManagementUtils.onlyRenderMidPanel then
				PetManagementUtils._refreshPetInfoDetail(sData)
			end

			PetManagementUtils.curSelectPetId = sData.id

			if PetManagementUtils.delegateTable and PetManagementUtils.delegateTable.selectedChanged then
				local selectedBtn = selectButton or findIndex and buttons[findIndex]

				PetManagementUtils.delegateTable.selectedChanged(sData, selectedBtn)
			end
		end
	end

	function PetManagementUtils._refreshBoxSelector()
		if not PetManagementUtils.boxSelector then
			return
		end

		local petBoxMap = pg.me.petBoxMap
		local boxInfos = PetManagementDataHelper.getBoxInfos()
		local selectBoxId = PetManagementDataHelper.getSelectBoxId()
		local objRef = PetManagementUtils.boxSelector:GetComponent("ObjectReference")
		local boxName = objRef:GetRefValue("boxName")
		local lockUButton = objRef:GetRefValue("lockUButton")
		local txtNameUText = objRef:GetRefValue("txtNameUText")
		local customName = petBoxMap[selectBoxId].customName
		local count = petBoxMap[selectBoxId].count
		local slotCount = petBoxMap[selectBoxId].slotCount
		local lockStatus = petBoxMap[selectBoxId]:isLocked()
		local isHideLockIcon = PetManagementUtils.isHidePetBoxEditorLockIcon
		local countStr = string.format("(%d/%d)", count, slotCount)
		local boxNameContent = ""

		if customName and customName ~= "" then
			boxNameContent = string.format("%s %s", customName, countStr)
		else
			boxNameContent = string.format("%s %s %s", pg.getGameString("DEFAULT_PET_BOX_NAME"), selectBoxId, countStr)
		end

		ClientTextUtils.setText(boxName, boxNameContent)
		ClientTextUtils.setText(txtNameUText, boxNameContent)

		if isHideLockIcon then
			lockUButton:SetActive(false)

			lockUButton.luaClick = nil
		else
			lockUButton:SetActive(true)
			lockUButton:TryChangePage("Lock", lockStatus and 1 or 0)

			function lockUButton.luaClick()
				PetManagementUtils._boxLockBtnFunction(selectBoxId, true)
			end
		end

		PetManagementDataHelper.setBoxSelectorLuaRenderPopup(PetManagementUtils.boxSelector, {
			boxInfos = boxInfos,
			boxNameContent = boxNameContent,
			selectBoxId = selectBoxId,
			isHideLockIcon = isHideLockIcon and true or false,
			onRenderPopup = function(_, list)
				PetManagementUtils.boxSelectorTempList = list
			end,
			renderItemLockState = function(_, lockUButton1, boxIdx)
				lockUButton1:TryChangePage("Lock", petBoxMap[boxIdx]:isLocked() and 1 or 0)
			end,
			onSelectBox = function(boxIdx)
				PetManagementUtils._switchBoxToIdx(boxIdx)
			end,
			onLockBox = function(boxIdx)
				PetManagementUtils._boxLockBtnFunction(boxIdx)
			end,
			onRenameBox = function(boxIdx)
				PetManagementUtils.boxSelector:ClosePopup()
				PetManagementDataHelper.showRename(boxIdx, PetManagementDataHelper.RENAME_FOR_BOX)
			end
		})
		PetManagementUtils.boxSelector:SetOptions(boxInfos)

		if PetManagementUtils.boxSelector.isPopup then
			PetManagementUtils._refreshLockStatusWhenPopup()
		end
	end

	function PetManagementUtils._refreshSingleBoxSelectorItemName(index, newName)
		local popupInst = PetManagementUtils.boxSelector:GetPopupInstance()
		local objectReference = popupInst:GetComponent("ObjectReference")
		local listUList = objectReference:GetRefValue("listUList")
		local _, btn = listUList:TryGetChildAt(index - 1)
		local objectReference1 = btn:GetComponent("ObjectReference")
		local nameUText = objectReference1:GetRefValue("nameUText")

		ClientTextUtils.setText(nameUText, newName)
	end

	function PetManagementUtils._boxLockBtnFunction(boxId, ignorePopup)
		local boxPetInfo = pg.me.petBoxMap[boxId]

		local function popupFunc()
			local hintShowTs = pg.global.prefsCacheUtils:getInt("boxLockHintHideFlagTs", 0, ClientConst.CACHE_TYPE_FLAG.USER)

			if hintShowTs + 86400 <= Time.secondCache then
				if not ignorePopup then
					PetManagementUtils.boxSelector:InteractPopup(false)
				end

				pg.global.showConfirmMsgRaw(pg.getGameString("LOCK_BOX"), pg.getGameString("LOCK_BOX_TIPS"), function()
					pg.me:serverMsg("RPC_CS_PetBoxSwitchLocked", boxId, not boxPetInfo:isManualLocked(), Const.PetBoxType.PET_BOX)

					if not ignorePopup then
						PetManagementUtils.boxSelector:InteractPopup(true)
					end

					if PetManagementUtils.boxLockHintHideFlag then
						pg.global.prefsCacheUtils:setInt("boxLockHintHideFlagTs", Time.secondCache, ClientConst.CACHE_TYPE_FLAG.USER)
						pg.global.prefsCacheUtils:save()
					end
				end, nil, function()
					if not ignorePopup then
						PetManagementUtils.boxSelector:InteractPopup(true)
					end
				end, nil, nil, {
					hint = true,
					hintDesc = string.format(pg.getGameString("DISABLE_HINT"), 1),
					hintCb = function(isSelected)
						if isSelected then
							PetManagementUtils.boxLockHintHideFlag = true
						else
							PetManagementUtils.boxLockHintHideFlag = nil
						end
					end
				})
			else
				pg.me:serverMsg("RPC_CS_PetBoxSwitchLocked", boxId, not boxPetInfo:isManualLocked(), Const.PetBoxType.PET_BOX)
			end
		end

		PetManagementDataHelper.sendSwitchPetBoxManualLocked(boxId, popupFunc)
	end

	function PetManagementUtils._refreshLockStatusWhenPopup()
		if PetManagementUtils.boxSelectorTempList == nil then
			return
		end

		local petBoxMap = pg.me.petBoxMap
		local btns = PetManagementUtils.boxSelectorTempList:GetAllButtons()

		for i = 0, btns.Length - 1 do
			local objectReference = btns[i]:GetComponent("ObjectReference")
			local lockUButton1 = objectReference:GetRefValue("lockUButton1")

			lockUButton1:TryChangePage("Lock", petBoxMap[btns[i].dataFromUList.idx]:isLocked() and 1 or 0)
		end
	end

	function PetManagementUtils._switchBoxToIdx(index)
		if not PetManagementUtils._hasMidPanelContext() then
			return
		end

		PetManagementUtils.selectSlot = nil

		PetManagementDataHelper.setSelectBoxId(index)
		PetManagementUtils._onBoxMapSequenceChanged()
		PetManagementUtils.boxSelector:ClosePopup()
	end

	function PetManagementUtils._getIndexOfSelectedBoxIdInSequence()
		local petBoxMapSequence = pg.me.petBoxMap.sequence:getRawTable()
		local boxId = PetManagementDataHelper.getSelectBoxId()
		local indexOfSequence

		for i = 1, #petBoxMapSequence do
			if boxId == petBoxMapSequence[i] then
				indexOfSequence = i

				return petBoxMapSequence, indexOfSequence
			end
		end

		return petBoxMapSequence, indexOfSequence
	end

	function PetManagementUtils._switchBoxPages(isPre)
		if PetManagementUtils.inFilterMode then
			return
		end

		if not PetManagementUtils._hasMidPanelContext() then
			return
		end

		local sequence, indexOfSequence = PetManagementUtils._getIndexOfSelectedBoxIdInSequence()

		if not indexOfSequence then
			return
		end

		local index = isPre and indexOfSequence - 1 or indexOfSequence + 1

		if index < 1 then
			index = #sequence
		end

		if index > #sequence then
			index = 1
		end

		PetManagementUtils._switchBoxToIdx(sequence[index])
	end

	function PetManagementUtils._isPetBoxDragging()
		if PetManagementUtils.isPetBoxDragging then
			return true
		end

		if pg and pg.global and pg.global.navMgr and pg.global.navMgr.IsDragging then
			return true
		end

		if CS and CS.XGUI and CS.XGUI.UComponent then
			local draggingWidget = CS.XGUI.UComponent.draggingWidget

			if draggingWidget ~= nil and (IsNil == nil or not IsNil(draggingWidget)) then
				return true
			end
		end

		return false
	end

	function PetManagementUtils._onPerformPetBoxScroll(inputInfo, restoreContext)
		if pg and pg.game and pg.game.input and pg.game.input.isUsingGamepad and pg.game.input:isUsingGamepad() then
			return true
		end

		if PetManagementUtils._isPetBoxDragging() then
			return true
		end

		if PetManagementUtils.inFilterMode then
			return true
		end

		if PetManagementUtils.boxSelector and PetManagementUtils.boxSelector.isPopup then
			return true
		end

		local isPre = PetManagementDataHelper.getSwitchBoxPageIsPre(inputInfo and inputInfo.valueVec2 and inputInfo.valueVec2.y)

		if isPre == nil then
			return true
		end

		if restoreContext then
			restoreContext()
		end

		PetManagementUtils._switchBoxPages(isPre)

		return false
	end

	function PetManagementUtils._onBoxMapSequenceChanged()
		PetManagementUtils._refreshPetList()
		PetManagementUtils._refreshBoxSelector()
	end

	function PetManagementUtils._refreshSingleCardFavoriteState(petId, show)
		local btns, lastIndex

		btns, lastIndex = PetManagementUtils._getPetListButtons()

		if not btns then
			return
		end

		for i = 0, lastIndex do
			if not btns[i].dataFromUList.isEmpty then
				local objectReference = btns[i]:GetComponent("ObjectReference")
				local iconFavUContainer = objectReference:GetRefValue("iconFavUContainer")
				local petIdDisplay = objectReference:GetRefValue("petIdDisplay")

				if petIdDisplay.gameObject.name == petId then
					if show then
						iconFavUContainer.content.gameObject:SetActiveEx(true)
						iconFavUContainer.content:InvokeCallback(CS.XGUI.EInvokeTime.User2)
					else
						iconFavUContainer.content:InvokeCallback(CS.XGUI.EInvokeTime.User1)
					end
				end
			end
		end
	end

	function PetManagementUtils.getCurFilterType()
		return PetManagementUtils.displayType or UIConst.PET_SLOT_DISPLAY_TYPE.Normal
	end

	function PetManagementUtils.isHomelandFilter()
		local curType = PetManagementUtils.getCurFilterType()

		return curType == UIConst.PET_SLOT_DISPLAY_TYPE.Homeland
	end

	function PetManagementUtils._openFilterPanel()
		pg.global.ui:open(UIConst.UI_ID_PET_MANAGEMENT_FILTER, {
			filterType = PetManagementUtils.getCurFilterType(),
			sortId = PetManagementDataHelper.getSelectSortId(),
			isDescending = PetManagementDataHelper.getSortSwitchStatus(),
			filter = PetManagementDataHelper.filter,
			doFilterCallback = function(filter, sortId, isDescending, showLabelInfo)
				PetManagementDataHelper.showLabelInfo = showLabelInfo
				PetManagementDataHelper.selectSortId = sortId
				PetManagementDataHelper.isDescending = isDescending

				PetManagementDataHelper.setFilter(filter)
				PetManagementUtils._startFilter()
			end
		})
		PetManagementUtils.boxSelector:ClosePopup()
	end

	function PetManagementUtils._startFilter(forceHideNormalFilter)
		local petInfos = PetManagementDataHelper.getFilteredPetsInfo()

		if #petInfos <= 0 then
			pg.global.showBubbleMessageRaw(pg.getGameString("EMPTY_FILTER"))
			PetManagementUtils._endFilter()

			return
		end

		PetManagementUtils.inFilterMode = true

		PetManagementUtils._refreshPetList()
		PetManagementUtils._refreshBoxSelector()
		PetManagementUtils.midPanelUComponent:TryChangePage("State", 1)

		local timers = PetManagementUtils.m_filterTimers or {}

		if timers.endFilterTimer then
			TimerManager.removeTimer(timers.endFilterTimer)

			timers.endFilterTimer = nil
		end

		timers.endFilterTimer = TimerManager.addTimer(0.05, function()
			if NotNil(PetManagementUtils.boxPbFilter2Go) then
				PetManagementUtils.boxPbFilter2Go:SetActiveEx(not forceHideNormalFilter)
			end
		end)
		PetManagementUtils.m_filterTimers = timers
	end

	function PetManagementUtils._endFilter()
		PetManagementDataHelper.selectSortId = 0

		PetManagementDataHelper.setFilter({})

		PetManagementUtils.inFilterMode = false

		PetManagementUtils._refreshPetList()
		PetManagementUtils._refreshBoxSelector()
		PetManagementUtils.midPanelUComponent:TryChangePage("State", 0)
	end

	function PetManagementUtils._innerSelectSlot(index)
		local btns = PetManagementUtils._getPetListButtons()

		if not btns or not btns[index - 1] then
			return
		end

		btns[index - 1].luaPress()
	end

	function PetManagementUtils.selectPet(petId)
		local slot, box = LuaUIUtils.getPetBelongBoxAndSlotId(petId)

		if not slot or not box then
			return
		end

		PetManagementUtils._switchBoxToIdx(box)
		PetManagementUtils._innerSelectSlot(slot)
	end

	function PetManagementUtils.applyPetQualityRatingText(petQualityUContainer, data, isValid)
		if IsNil(petQualityUContainer) then
			return
		end

		local isCatchReporting = false

		if data ~= nil then
			isCatchReporting = data.isCatchReportingStatus == true
		end

		if isCatchReporting then
			petQualityUContainer:DestroyContent()

			return
		end

		petQualityUContainer:LoadDefaultUrlManually()

		if IsNil(petQualityUContainer.content) then
			return
		end

		local ratingIndex = 0

		if data ~= nil and data.rating ~= nil then
			ratingIndex = data.rating
		end

		petQualityUContainer.content:TryChangePage("Quality", ratingIndex)

		local function applyText()
			if isValid ~= nil and not isValid() then
				return
			end

			if IsNil(petQualityUContainer) or IsNil(petQualityUContainer.content) then
				return
			end

			local transform = petQualityUContainer.content.transform

			if transform == nil then
				return
			end

			local textT = transform:Find("Detail/Text")

			if textT == nil then
				return
			end

			local text = textT:GetComponent("USDFText")

			if IsNil(text) then
				return
			end

			local ratingStr = Const.STAGE_TO_RATING_STR[ratingIndex + 1] or ""

			ClientTextUtils.setText(text, pg.getGameString(ratingStr))
		end

		applyText()
		TimerManager.addNextFrameCb(applyText)
	end

	function PetManagementUtils._showFilterLabel(btn, data, isValid)
		local sortCondition = PetManagementDataHelper.getSelectSortId()
		local objectReference = btn:GetComponent("ObjectReference")
		local panelCPUContainer = objectReference:GetRefValue("panelCPUContainer")
		local panelCharListUContainer = objectReference:GetRefValue("panelCharListUContainer")
		local txtBoxUImage = objectReference:GetRefValue("txtBoxUImage")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local petQualityUContainer = objectReference:GetRefValue("petQualityUContainer")
		local petRareUContainer = objectReference:GetRefValue("petRareUContainer")
		local petRareNmlUContainer = objectReference:GetRefValue("petRareNmlUContainer")

		if not PetManagementDataHelper.showLabelInfo then
			panelCPUContainer:SetActive(true)

			panelCharListUContainer.renderOpacity = 1
			txtBoxUImage.renderOpacity = 0

			petQualityUContainer:DestroyContent()
			petRareUContainer:DestroyContent()
			petRareNmlUContainer:DestroyContent()

			return
		end

		if PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 0 then
			panelCPUContainer:SetActive(true)

			panelCharListUContainer.renderOpacity = 1
			txtBoxUImage.renderOpacity = 0

			petQualityUContainer:DestroyContent()
			petRareUContainer:DestroyContent()
			petRareNmlUContainer:DestroyContent()
		elseif PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 1 then
			panelCPUContainer:SetActive(false)

			panelCharListUContainer.renderOpacity = 0
			txtBoxUImage.renderOpacity = 1

			petQualityUContainer:DestroyContent()
			petRareUContainer:DestroyContent()
			petRareNmlUContainer:DestroyContent()
			txtNameUSDFText:SetActive(true)

			if sortCondition == PetManagementDataHelper.SORT_IDX.TIME then
				local seconds = (Time.secondCache * 1000 - data.time) / 1000

				ClientTextUtils.setText(txtNameUSDFText, TimeUtils.getFormatStringDay(seconds))
			elseif sortCondition == PetManagementDataHelper.SORT_IDX.BOOK_NUM then
				ClientTextUtils.setText(txtNameUSDFText, PetManagementUtils.getDisplayBookNumberText(data))
			elseif sortCondition == PetManagementDataHelper.SORT_IDX.LEVEL then
				ClientTextUtils.setText(txtNameUSDFText, ClientTextUtils.formatShortLevel(data.level))
			else
				ClientTextUtils.setText(txtNameUSDFText, "")

				txtBoxUImage.renderOpacity = 0

				txtNameUSDFText:SetActive(true)
			end
		elseif PetManagementDataHelper.FILTER_LABEL_TYPE[sortCondition] == 2 then
			panelCPUContainer:SetActive(false)

			panelCharListUContainer.renderOpacity = 0
			txtBoxUImage.renderOpacity = 0

			PetManagementUtils.applyPetQualityRatingText(petQualityUContainer, data, isValid)
			petRareUContainer:DestroyContent()
			petRareNmlUContainer:DestroyContent()
		else
			panelCPUContainer:SetActive(false)

			panelCharListUContainer.renderOpacity = 0
			txtBoxUImage.renderOpacity = 0

			petQualityUContainer:DestroyContent()

			if data.hasRareFeature == 1 then
				petRareUContainer:LoadDefaultUrlManually()
				petRareNmlUContainer:DestroyContent()
			else
				petRareUContainer:DestroyContent()
				petRareNmlUContainer:LoadDefaultUrlManually()
			end
		end
	end

	function PetManagementUtils.renderFightPetSupport(button, data)
		local objectReference = button:GetComponent("ObjectReference")
		local btnDelUButton = objectReference:GetRefValue("btnDelUButton")
		local nameUText = objectReference:GetRefValue("nameUText")
		local hpBarUHealthbar = objectReference:GetRefValue("hpBarUHealthbar")
		local iconUImage = objectReference:GetRefValue("iconUImage")
		local elementsUList = objectReference:GetRefValue("elementsUList")
		local iconOrientationUImage = objectReference:GetRefValue("iconOrientationUImage")
		local nameShineUSDFText = objectReference:GetRefValue("nameShineUSDFText")
		local nameShineUSDFText1 = objectReference:GetRefValue("nameShineUSDFText1")
		local deleteHotKeyContent = objectReference:GetRefValue("deleteHotKeyContent")
		local skillUWidget = objectReference:GetRefValue("skillUWidget")
		local skillNameUWidget = objectReference:GetRefValue("skillNameUWidget")
		local iconSkillUImage = objectReference:GetRefValue("iconSkillUImage")
		local skillCostNumUSDFText = objectReference:GetRefValue("skillCostNumUSDFText")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local flshIconUButton = objectReference:GetRefValue("flshIconUButton")

		LuaUIUtils.disablePetTagIconNav(objectReference)

		function elementsUList.luaRenderItem(btn, idx, eleData)
			LuaUIUtils.setElementButtonNew(btn, eleData.element, false)
		end

		local coreAbilityInfo = LuaUIUtils.getCoreAbilityInfo(data)

		if coreAbilityInfo then
			skillUWidget.gameObject:SetActiveEx(true)
			skillNameUWidget.gameObject:SetActiveEx(true)

			iconSkillUImage.url = LuaUIUtils.getSkillIcon(coreAbilityInfo.icon)

			ClientTextUtils.setText(skillCostNumUSDFText, coreAbilityInfo.epCost or 0)

			local name = ""

			if coreAbilityInfo.tagShowList and #coreAbilityInfo.tagShowList > 0 then
				name = coreAbilityInfo.tagShowList[1].tagName
			end

			ClientTextUtils.setText(txtNameUSDFText, pg.getLocalizationText(name))
		else
			skillUWidget.gameObject:SetActiveEx(false)
			skillNameUWidget.gameObject:SetActiveEx(false)
		end

		iconOrientationUImage.url = data.petTypeUrl

		if data.isShiny then
			button:TryChangePage("isFlash", 1)
			flshIconUButton:TryChangePage("Type", 0)
		elseif data.isMagic then
			button:TryChangePage("isFlash", 2)
			flshIconUButton:TryChangePage("Type", 1)
		else
			button:TryChangePage("isFlash", 0)
		end

		PetManagementDataHelper.tryChangePetHeadBossTagPage(button, data.label)
		button:TryChangePage("isChange", data.isVariant and 1 or 0)
		iconUImage:SetUrlWithCallback(LuaUIUtils.getPetIcon(data.iconName, LuaUIUtils.PET_ICON, data.label, data.gender), function()
			return
		end)
		elementsUList:SetList(data.elementNames)

		if data.gender == Const.GENDER_TYPE_MALE then
			button:TryChangePage("Gender", 0)
		elseif data.gender == Const.GENDER_TYPE_FEMALE then
			button:TryChangePage("Gender", 1)
		else
			button:TryChangePage("Gender", 2)
		end

		if data.customName and data.customName ~= "" then
			ClientTextUtils.setText(nameUText, data.customName)
			ClientTextUtils.setText(nameShineUSDFText, data.customName)
			ClientTextUtils.setText(nameShineUSDFText1, data.customName)
		else
			ClientTextUtils.setText(nameUText, pg.getLocalizationText(data.name))
			ClientTextUtils.setText(nameShineUSDFText, pg.getLocalizationText(data.name))
			ClientTextUtils.setText(nameShineUSDFText1, pg.getLocalizationText(data.name))
		end

		local hpRatio = data.hpRatio or 1

		hpBarUHealthbar.maxHp = 1
		hpBarUHealthbar.hp = hpRatio

		button:TryChangePage("Dead", hpRatio <= 0 and 1 or 0)
	end

	function PetManagementUtils.getBoxLockState(boxInfo)
		local BoxLockState = PetManagementDataHelper.BoxLockState

		if boxInfo:isTempLocked() then
			return BoxLockState.TEMP_LOCKED
		elseif boxInfo:isLocked() then
			return BoxLockState.LOCKED
		end

		return BoxLockState.UNLOCKED
	end

	function PetManagementUtils.setIsHidePetBoxEditorLockIcon(isHide)
		PetManagementUtils.isHidePetBoxEditorLockIcon = isHide
	end

	function PetManagementUtils.buildMoveOverflowPlan(petCount, targetEmpty, totalEmpty, hasTargetBox)
		petCount = tonumber(petCount) or 0
		targetEmpty = math.max(tonumber(targetEmpty) or 0, 0)
		totalEmpty = math.max(tonumber(totalEmpty) or 0, 0)

		if hasTargetBox then
			if petCount <= targetEmpty then
				return {
					needConfirm = false,
					showTargetOnly = true,
					allowOverflow = false,
					fitCount = petCount
				}
			end

			return {
				needConfirm = true,
				showTargetOnly = true,
				targetCount = targetEmpty,
				overflowCount = math.min(petCount, totalEmpty)
			}
		end

		if petCount <= totalEmpty then
			return {
				needConfirm = false,
				showTargetOnly = false,
				allowOverflow = true,
				fitCount = petCount
			}
		end

		return {
			needConfirm = true,
			showTargetOnly = false,
			targetCount = 0,
			overflowCount = math.min(petCount, totalEmpty)
		}
	end

	function PetManagementUtils.notifyMoveTargetAreaNotEnough()
		pg.global.showBubbleMessageById(PetWarehouseConst.PetWarehouseNotice.TARGET_AREA_NOT_ENOUGH)
	end

	function PetManagementUtils.takeMoveOverflowFit(plan, useTargetOnly)
		local count = 0

		if useTargetOnly then
			count = tonumber(plan and plan.targetCount) or 0
		else
			count = tonumber(plan and plan.overflowCount) or 0
		end

		if count <= 0 then
			PetManagementUtils.notifyMoveTargetAreaNotEnough()

			return nil
		end

		return count
	end

	function PetManagementUtils.showMoveOverflowConfirm(plan, callbacks)
		callbacks = callbacks or {}

		local text = PetWarehouseConst.PetWarehouseText
		local title = pg.getGameString(text.OVERFLOW_TITLE)
		local extraInfo = {
			okBtnDesc = pg.getGameString(text.OVERFLOW_TO_OTHERS),
			okBtnType = UIConst.MENU_EXIT_BTN_TYPE.Confirm
		}

		if plan and plan.showTargetOnly then
			extraInfo.cancelBtnDesc = pg.getFormatText(pg.getGameString(text.OVERFLOW_TARGET_ONLY), tostring(tonumber(plan.targetCount) or 0))
			extraInfo.nextBtnDesc = pg.getGameString(text.OVERFLOW_CANCEL)
			extraInfo.cancelType = UIConst.MENU_EXIT_BTN_TYPE.Unknown
			extraInfo.nextBtnType = UIConst.MENU_EXIT_BTN_TYPE.Cancel

			pg.global.showConfirmMsgRaw(title, pg.getGameString(text.OVERFLOW_DESC), callbacks.onOverflow, nil, callbacks.onTargetOnly, true, callbacks.onCancel, extraInfo)

			return
		end

		extraInfo.cancelBtnDesc = pg.getGameString(text.OVERFLOW_CANCEL)
		extraInfo.cancelType = UIConst.MENU_EXIT_BTN_TYPE.Cancel

		pg.global.showConfirmMsgRaw(title, pg.getGameString(text.OVERFLOW_DESC_NO_TARGET), callbacks.onOverflow, nil, callbacks.onCancel, false, nil, extraInfo)
	end

	function PetManagementUtils.collectManualWritableSlots(petBoxMap, preferBoxId, preferSlot, count, allowOverflow)
		local result = {}

		if not Utils.isTable(petBoxMap) then
			return result
		end

		local sequence = petBoxMap.sequence

		if sequence == nil then
			return result
		end

		count = tonumber(count) or 0

		if count <= 0 then
			return result
		end

		preferBoxId = tonumber(preferBoxId)

		if preferBoxId == 0 then
			preferBoxId = nil
		end

		preferSlot = tonumber(preferSlot)

		if preferSlot == 0 then
			preferSlot = nil
		end

		if allowOverflow == nil then
			allowOverflow = true
		end

		local reservedSlotsByBox = {}

		local function isSlotFree(boxId, slot)
			local box = petBoxMap[boxId]

			if not box then
				return false
			end

			if box.canManualMove and not box:canManualMove() then
				return false
			end

			if slot < 1 or slot > (tonumber(box.slotCount) or 0) then
				return false
			end

			if box[slot] then
				return false
			end

			local reserved = reservedSlotsByBox[boxId]

			if Utils.isTable(reserved) and reserved[slot] then
				return false
			end

			return true
		end

		local function reserve(boxId, slot)
			result[#result + 1] = {
				boxId = boxId,
				slot = slot
			}
			reservedSlotsByBox[boxId] = reservedSlotsByBox[boxId] or {}
			reservedSlotsByBox[boxId][slot] = true
		end

		local seqCount = #sequence

		if seqCount <= 0 then
			return result
		end

		local startCursor = 1

		if preferBoxId ~= nil then
			for index = 1, seqCount do
				if tonumber(sequence[index]) == preferBoxId then
					startCursor = index

					break
				end
			end
		end

		while count > #result do
			local found = false

			if preferBoxId ~= nil and preferSlot ~= nil and isSlotFree(preferBoxId, preferSlot) then
				reserve(preferBoxId, preferSlot)

				found = true
			else
				local searchCount = seqCount

				if allowOverflow == false then
					searchCount = 1
				end

				for offset = 0, searchCount - 1 do
					local sequenceIndex = (startCursor + offset - 1) % seqCount + 1
					local boxId = sequence[sequenceIndex]
					local box = petBoxMap[boxId]

					if box then
						for slot = 1, tonumber(box.slotCount) or 0 do
							if isSlotFree(boxId, slot) then
								reserve(boxId, slot)

								found = true

								break
							end
						end
					end

					if found then
						break
					end
				end
			end

			if not found then
				break
			end
		end

		return result
	end
end
