-- chunkname: @E:\\dev\\jkroot\\ws\\workspace\\WinPublish\\proj\\p4dir\\client\\LuaScripts\\Guis\\Panels\\HomelandFurnitureDesign\\HomelandFurnitureDesignCtrl.lua

local logger = require("Core.Log.LoggerManager").getLogger("HomelandFurnitureDesignCtrl")
local MessageName = require("Const.MessageName")
local Class = require("Core.Framework.Class")
local UICtrl = require("Guis.UICtrl")
local ClientTextUtils = require("Utils.ClientTextUtils")
local ClientHomelandUtils = require("Utils.ClientHomelandUtils")
local UIConst = require("Const.UIConst")
local Const = require("Common.Const.Const")
local Utils = require("Common.Utils.Utils")
local HomeLandUtils = require("Common.Utils.HomeLandUtils")
local HomeBlueprintConst = require("Common.Const.HomeBlueprintConst")
local HomeBlueprintUtils = require("Common.Homeland.HomeBlueprintUtils")
local HomelandAreaData = require("Data.homeland_area_data")
local HomelandFurnitureDesignCtrl = Class.LightClass("HomelandFurnitureDesignCtrl", UICtrl)
local HOME_CAR_AREA_ID = -1

HomelandFurnitureDesignCtrl.messages = {
	[MessageName.HOMELAND_BLUEPRINT_LIST_RESULT] = {
		"onBlueprintListResult",
		true
	},
	[MessageName.HOMELAND_BLUEPRINT_UPLOAD_RESULT] = {
		"onBlueprintListResult",
		true
	},
	[MessageName.HOMELAND_BLUEPRINT_DELETE_UPLOADED_RESULT] = {
		"onBlueprintListResult",
		true
	}
}

function HomelandFurnitureDesignCtrl:onCreate(info)
	UICtrl.onCreate(self, info)

	self.carGroup = info and info.carGroup
	self.chooseDesign = nil
	self.chooseCompose = nil
	self.selectData = nil
	self.homeBlueprintCoverImageKeys = {}

	self:initFurnitureDesignPageInfo()
end

function HomelandFurnitureDesignCtrl:addListener()
	function self.view.btnBackUButton.luaClick()
		self:close()
	end

	function self.view.btnImportUButton.luaClick()
		self:onImportBtnClick()
	end

	function self.view.btnApplyUButton.luaClick()
		self:onApplyBtnClick()
	end

	function self.view.btnViewUButton.luaClick()
		if not self.selectData then
			return
		end

		local homeIdList = {}

		for _, info in ipairs(self.selectData.ornaments) do
			table.insert(homeIdList, info.homeId)
		end

		local nameText = self.selectData.name
		local descText = self.selectData.desc

		if self.chooseDesign == UIConst.HOME_DESIGN_MODE.SYSTEMDESIGN then
			nameText = pg.getLocalizationText(self.selectData.name)
			descText = pg.getLocalizationText(self.selectData.desc)
		end

		pg.global.ui.homelandFurnitureComposeDetail:open({
			designIndex = self.chooseDesign,
			composeIndex = self.chooseCompose,
			carGroup = self.carGroup,
			detailData = {
				homeIdList = homeIdList,
				ornaments = self.selectData.ornaments,
				anchorPos3 = self.selectData.anchorPos3,
				areaId = self.selectData.areaId,
				occupiedPlotCount = self.selectData.occupiedPlotCount,
				rangeSize = #(self.selectData.size or {}) > 0 and self.selectData.size or {
					0,
					0,
					0
				},
				loadValue = self.selectData.loadValue,
				comfortValue = self.selectData.comfortValue,
				code = self.selectData._id or "",
				name = nameText,
				description = descText,
				ownerName = self.selectData.ownerName,
				coverImageKeys = self.selectData.coverImageKeys,
				image = self.selectData.image
			}
		})
	end

	function self.view.btnCopyIDUButton.luaClick()
		if not self.selectData then
			return
		end

		local copyText

		if self.chooseDesign == UIConst.HOME_DESIGN_MODE.MYDESIGN then
			copyText = self.selectData._id
		elseif self.chooseDesign == UIConst.HOME_DESIGN_MODE.SHAREDESIGN then
			copyText = self.selectData.ownerName
		end

		if string.isNilOrEmpty(copyText) then
			return
		end

		UIUtils.ClipboardWriter(copyText)
		pg.global.ui.tips:showTextTip(pg.getGameString("GM_TIPS_COPY_SUCCESS"))
	end

	function self.view.selectorUSelector.luaRenderPopup(_, uList)
		function uList.luaRenderItem(button, _, data)
			local objectReference = button:GetComponent("ObjectReference")
			local txtUText = objectReference:GetRefValue("txtUText")

			ClientTextUtils.setText(txtUText, data.label)
		end
	end

	function self.view.selectorUSelector.luaOnPopupChanged()
		self:refreshConsoleBarState()
	end

	function self.view.selectorUSelector.luaOptionClick(_, data)
		self.view.selectorUSelector:ClosePopup()

		local carGroup
		local isSceneMatched = pg.me:isInSelfHomeland()

		if data.areaId == HOME_CAR_AREA_ID then
			local space = pg.me.space

			isSceneMatched = space and space.isSelfHomeCamp and space:isSelfHomeCamp(pg.me)

			if isSceneMatched then
				carGroup = pg.game.homeCar:getHomeCarGroup(pg.me.uid)
				isSceneMatched = carGroup and carGroup.campCarEnt
			end
		end

		if not isSceneMatched then
			pg.global.showBubbleMessageRaw(pg.getGameString("HOMELAND_COMPOSE_AREA_NOT_MATCH"))

			return
		end

		if data.areaId == Const.HOMELAND_AREA_TYPE.BUILD and pg.game.home:checkAreaLocked(data.areaId) then
			pg.global.showBubbleMessageRaw(pg.getGameString("HOMELAND_PLAN_AREA_NOT_UNLOCKED"))

			return
		end

		self:openCreatePlanDetail(data.areaId, carGroup)
	end

	function self.view.listTabUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local name1 = objectReference:GetRefValue("name1")
		local name2 = objectReference:GetRefValue("name2")

		ClientTextUtils.setText(name1, data.name)
		ClientTextUtils.setText(name2, data.name)

		function button.luaClick()
			local composeIndex = self.chooseCompose or 1

			self:refreshPageInfo(data.designIndex, composeIndex, self.chooseAreaId)
		end
	end

	function self.view.listTabIconUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local iconUImage = objectReference:GetRefValue("iconUImage")
		local textUBaseText = objectReference:GetRefValue("textUBaseText")

		iconUImage.url = data.icon

		ClientTextUtils.setText(textUBaseText, data.name)

		function button.luaClick()
			local designIndex = self.chooseDesign or 1

			self:refreshPageInfo(designIndex, data.composeIndex, self.chooseAreaId)
		end
	end

	function self.view.listDesignUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local playerUWidget = objectReference:GetRefValue("playerUWidget")
		local txtPlayerNameUSDFText = objectReference:GetRefValue("txtPlayerNameUSDFText")
		local txtNameUSDFText = objectReference:GetRefValue("txtNameUSDFText")
		local txtDisableUSDFText = objectReference:GetRefValue("txtDisableUSDFText")
		local txtNumUSDFText = objectReference:GetRefValue("txtNumUSDFText")
		local imgPicUImage = objectReference:GetRefValue("imgPicUImage")
		local iconAreaUImage = objectReference:GetRefValue("iconAreaUImage")

		playerUWidget:SetActive(self.chooseDesign == UIConst.HOME_DESIGN_MODE.SHAREDESIGN)
		ClientTextUtils.setText(txtPlayerNameUSDFText, data.ownerName or "")

		iconAreaUImage.url = nil

		if self.chooseCompose == UIConst.HOME_COMPOSE_MODE.PLAN then
			if data.areaId == Const.HOMELAND_AREA_TYPE.PRODUCE then
				iconAreaUImage.url = "$UI_Img_Home_Edit_ProductArea.png"
			elseif data.areaId == Const.HOMELAND_AREA_TYPE.BUILD then
				iconAreaUImage.url = "$UI_Img_Home_Edit_BuildArea.png"
			elseif data.areaId == HOME_CAR_AREA_ID then
				iconAreaUImage.url = "$UI_Img_Home_Edit_TravelArea.png"
			end
		end

		local occupiedPlotCount = data.occupiedPlotCount or 0

		if self.chooseCompose == UIConst.HOME_COMPOSE_MODE.PLAN and data.areaId == HOME_CAR_AREA_ID then
			occupiedPlotCount = 1
		end

		ClientTextUtils.setText(txtNumUSDFText, occupiedPlotCount)

		local nameText = data.name

		if self.chooseDesign == UIConst.HOME_DESIGN_MODE.SYSTEMDESIGN then
			nameText = pg.getLocalizationText(data.name)
		end

		ClientTextUtils.setText(txtNameUSDFText, nameText or "")
		button:TryChangePage("Disable", data.isDisabled and 1 or 0)
		ClientTextUtils.setText(txtDisableUSDFText, data.disableText or "")
		self.view.widget:TryChangePage("Type", self.chooseCompose - 1)

		local imageKey = data.coverImageKeys and data.coverImageKeys[1]
		local imageUrl = self.chooseDesign == UIConst.HOME_DESIGN_MODE.SYSTEMDESIGN and data.image or nil

		self.homeBlueprintCoverImageKeys[button] = imageKey
		imgPicUImage.sprite = nil
		imgPicUImage.url = nil

		if not string.isNilOrEmpty(imageUrl) then
			self.homeBlueprintCoverImageKeys[button] = nil

			button:TryChangePage("NoPic", 0)

			imgPicUImage.url = imageUrl
		elseif string.isNilOrEmpty(imageKey) then
			button:TryChangePage("NoPic", 1)
		else
			button:TryChangePage("NoPic", 0)

			imgPicUImage.url = data.coverImageKey or data.icon or ""

			pg.me:loadHomeBlueprintCoverImage(imageKey, function(sprite)
				local imageKeys = self.homeBlueprintCoverImageKeys

				if not self.view or not imageKeys or imageKeys[button] ~= imageKey or not NotNil(imgPicUImage) then
					return
				end

				imgPicUImage.url = nil
				imgPicUImage.sprite = sprite
			end)
		end

		function button.luaClick()
			self:refreshDesignDetail(data)
		end
	end

	function self.view.listDetailsUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local txtSizeUSDFText = objectReference:GetRefValue("txtSizeUSDFText")
		local txtSizeNumUSDFText = objectReference:GetRefValue("txtSizeNumUSDFText")

		ClientTextUtils.setText(txtSizeUSDFText, data.name)
		ClientTextUtils.setText(txtSizeNumUSDFText, data.info)
	end

	function self.view.listTab3thUList.luaRenderItem(button, index, data)
		local objectReference = button:GetComponent("ObjectReference")
		local txtNameUBaseText = objectReference:GetRefValue("txtNameUBaseText")

		ClientTextUtils.setText(txtNameUBaseText, data.name)

		function button.luaClick()
			local composeIndex = self.chooseCompose or 1
			local designIndex = self.chooseDesign or 1

			self:refreshPageInfo(designIndex, composeIndex, data.areaId)
		end
	end

	if pg.global.navMgr then
		self:addNavFocusListener(function()
			if self.view then
				self:refreshConsoleBarState()
			end
		end, "HomelandFurnitureDesign")
	end
end

function HomelandFurnitureDesignCtrl:refreshConsoleBarState()
	local currentFocusedGroupName = pg.global.navMgr.CurrentFocusedGroupName
	local currentFocusedUContent = pg.global.navMgr.CurrentFocusedUContent
	local isChoose = false

	if not IsNil(self.view.selectorUSelector) and self.view.selectorUSelector.isPopup then
		isChoose = true
	end

	CS.XGUI.Navigation.ConsoleBar.SetStateForAll("HomelandFurnitureDesign_Choose", isChoose)
end

function HomelandFurnitureDesignCtrl:getDesignDisableText(data, composeIndex)
	if composeIndex ~= UIConst.HOME_COMPOSE_MODE.PLAN then
		return nil
	end

	local areaId = tonumber(data.areaId)

	if areaId == HOME_CAR_AREA_ID then
		local space = pg.me.space

		if not space or not space.isSelfHomeCamp or not space:isSelfHomeCamp(pg.me) then
			return pg.getGameString("HOMELAND_COMPOSE_AREA_NOT_MATCH")
		end

		return nil
	end

	local isHomelandPlan = areaId == Const.HOMELAND_AREA_TYPE.PRODUCE or areaId == Const.HOMELAND_AREA_TYPE.BUILD

	if not isHomelandPlan or not pg.me:isInSelfHomeland() then
		return pg.getGameString("HOMELAND_COMPOSE_AREA_NOT_MATCH")
	end

	if pg.game.home:checkAreaLocked(areaId) then
		return pg.getGameString("HOMELAND_PLAN_AREA_NOT_UNLOCKED")
	end

	local requiredPlotCount = tonumber(data.occupiedPlotCount) or 0

	if requiredPlotCount > ClientHomelandUtils.getUnlockedPlotCount(areaId) then
		return pg.getGameString("HOMELAND_COMPOSE_LAND_NOT_ENOUGH")
	end

	return nil
end

function HomelandFurnitureDesignCtrl:onApplyBtnClick()
	if self.chooseCompose ~= UIConst.HOME_COMPOSE_MODE.PLAN or not self.selectData then
		return
	end

	local data = self.selectData
	local areaId = tonumber(data.areaId)
	local isHomeCampPlan = areaId == HOME_CAR_AREA_ID
	local isHomelandPlan = areaId == Const.HOMELAND_AREA_TYPE.PRODUCE or areaId == Const.HOMELAND_AREA_TYPE.BUILD
	local isSceneMatched = false
	local homeSpace

	if isHomeCampPlan then
		local space = pg.me.space

		isSceneMatched = space and space.isSelfHomeCamp and space:isSelfHomeCamp(pg.me)

		if isSceneMatched then
			local carGroup = pg.game.homeCar:getHomeCarGroup(pg.me.uid)

			homeSpace = carGroup and carGroup.campCarEnt
			isSceneMatched = homeSpace ~= nil
		end
	elseif isHomelandPlan then
		isSceneMatched = pg.me:isInSelfHomeland()
		homeSpace = isSceneMatched and pg.me.space or nil
	end

	if not isSceneMatched then
		pg.global.showBubbleMessageRaw(pg.getGameString("HOMELAND_COMPOSE_AREA_NOT_MATCH"))

		return
	end

	local requiredPlotCount = tonumber(data.occupiedPlotCount) or 0

	if isHomelandPlan and requiredPlotCount > ClientHomelandUtils.getUnlockedPlotCount(areaId) then
		pg.global.showBubbleMessageRaw(pg.getGameString("HOMELAND_COMPOSE_LAND_NOT_ENOUGH"))

		return
	end

	local isFurnitureEnough = ClientHomelandUtils.checkPlanFurnitureEnough(data, areaId, homeSpace, isHomeCampPlan)
	local blueprintId = data._id
	local targetPos3 = data.anchorPos3

	if blueprintId == nil then
		pg.me:showBlueprintNotice(Const.HOME_BLUEPRINT_OP_RETURN_CODE.ERROR_PARAM)

		return
	end

	local sourceType = self.chooseDesign
	local targetYawAngle = 0

	if isHomelandPlan then
		targetYawAngle = pg.game.home:getAreaOrnamentDefaultYaw(areaId) * HomeLandUtils.ORNAMENT_ROTATION_INT_BASE
	end

	local confirmText = isFurnitureEnough and pg.getGameString("HOMELAND_PLAN_APPLY_CONFIRM") or pg.getGameString("HOMELANDV_PLANV_LACK")

	pg.global.showConfirmMsgRaw(pg.getGameString("RELEASE_WARN"), confirmText, function()
		pg.me:buildHomeBlueprint(sourceType, tostring(blueprintId), targetPos3, targetYawAngle, areaId, function(isAccepted)
			if not isAccepted then
				return
			end

			pg.global.ui:closeAllNormalPanel()
			pg.global.ui.tips:showTextTip(pg.getGameString("HOMELAND_PLAN_APPLY_SUCCESS"))
		end)
	end)
end

function HomelandFurnitureDesignCtrl:onImportBtnClick()
	if self.chooseDesign ~= UIConst.HOME_DESIGN_MODE.SHAREDESIGN then
		return
	end

	local isPlan = self.chooseCompose == UIConst.HOME_COMPOSE_MODE.PLAN
	local blueprintKind = isPlan and HomeBlueprintConst.BLUEPRINT_KIND.PLAN or HomeBlueprintConst.BLUEPRINT_KIND.COMBINATION
	local importTitleKey = isPlan and "HOMELAND_COMPOSE_IMPORT_PLAN" or "HOMELAND_COMPOSE_IMPORT_COMBINATION"
	local inputTitleKey = isPlan and "HOMELAND_COMPOSE_PLAN_CODE" or "HOMELAND_COMPOSE_INPUT_COMBINATION_CODE"

	pg.global.ui.tips:showCommonInput(pg.getGameString(importTitleKey), function(inputText)
		local code = string.trim(inputText or "")

		if string.isNilOrEmpty(code) then
			return
		end

		pg.me:saveOtherHomeBlueprint(code, blueprintKind)
	end, nil, {
		errorHide = true,
		noSensitiveWordsCheck = true,
		characterLimit = HomeBlueprintConst.DEFAULT_CONFIG.blueprintCodeLength or 8,
		inputTitle = inputTitleKey
	})
end

function HomelandFurnitureDesignCtrl:openCreatePlanDetail(areaId, carGroup)
	local ornamentIdList = {}
	local homeIdList = {}
	local loadValue = 0
	local comfortValue = 0
	local homeSpace = pg.me.space

	if areaId == HOME_CAR_AREA_ID then
		homeSpace = carGroup.campCarEnt
	end

	for ornamentId, ornamentInfo in pairs(homeSpace.ornament) do
		local ornamentAreaId = ornamentInfo.areaId or Const.HOMELAND_AREA_TYPE.PRODUCE

		if areaId == HOME_CAR_AREA_ID or ornamentAreaId == areaId and not homeSpace:isTrashOrnament(ornamentId) then
			table.insert(ornamentIdList, ornamentId)
			table.insert(homeIdList, ornamentInfo.homeId)

			loadValue = loadValue + ClientHomelandUtils.getLoadValueById(ornamentInfo.homeId)
			comfortValue = comfortValue + ClientHomelandUtils.getComfortValueById(ornamentInfo.homeId)
		end
	end

	if #ornamentIdList == 0 then
		pg.global.showBubbleMessageRaw(pg.getGameString("HOMELAND_PLAN_EMPTY_AREA"))

		return
	end

	local plotNumber = areaId == HOME_CAR_AREA_ID and 0 or ClientHomelandUtils.getUnlockedPlotCount(areaId)

	pg.global.ui.homelandFurnitureComposeDetail:open({
		designIndex = UIConst.HOME_DESIGN_MODE.CREATE,
		composeIndex = UIConst.HOME_COMPOSE_MODE.PLAN,
		carGroup = carGroup,
		detailData = {
			ornamentIdList = ornamentIdList,
			homeIdList = homeIdList,
			areaId = areaId,
			occupiedPlotCount = plotNumber,
			loadValue = loadValue,
			comfortValue = comfortValue
		}
	})
end

function HomelandFurnitureDesignCtrl:initFurnitureDesignPageInfo()
	ClientTextUtils.setText(self.view.tMPUSDFText, pg.getGameString("HOMELAND_COMPOSE_DESIGN_TITLE"))
	ClientTextUtils.setText(self.view.placeHolderUSDFText, pg.getGameString("HOMELAND_COMPOSE_CREATE_PLAN"))
	ClientTextUtils.setText(self.view.txtDetailUSDFText, pg.getGameString("HOMELAND_COMPOSE_VIEW_DETAIL"))
	ClientTextUtils.setText(self.view.txtApplyUSDFText, pg.getGameString("HOMELAND_COMPOSE_APPLY_PLAN"))

	local areaOptions

	if pg.me.space:isHomeCamp() then
		areaOptions = {
			{
				label = pg.getGameString("HOMECAR_RV_ROOFTOP"),
				areaId = HOME_CAR_AREA_ID
			}
		}
	else
		areaOptions = {
			{
				label = ClientTextUtils.getLocalizationText(HomelandAreaData[Const.HOMELAND_AREA_TYPE.PRODUCE].name),
				areaId = Const.HOMELAND_AREA_TYPE.PRODUCE
			},
			{
				label = ClientTextUtils.getLocalizationText(HomelandAreaData[Const.HOMELAND_AREA_TYPE.BUILD].name),
				areaId = Const.HOMELAND_AREA_TYPE.BUILD
			}
		}
	end

	self.view.selectorUSelector:SetOptions(areaOptions)

	local areaTabList = {
		{
			tIndex = 0,
			name = pg.getGameString("ALL")
		},
		{
			tIndex = 1,
			name = ClientTextUtils.getLocalizationText(HomelandAreaData[Const.HOMELAND_AREA_TYPE.PRODUCE].name),
			areaId = Const.HOMELAND_AREA_TYPE.PRODUCE
		},
		{
			tIndex = 1,
			name = ClientTextUtils.getLocalizationText(HomelandAreaData[Const.HOMELAND_AREA_TYPE.BUILD].name),
			areaId = Const.HOMELAND_AREA_TYPE.BUILD
		},
		{
			tIndex = 2,
			name = pg.getGameString("HOMECAR_RV_ROOFTOP"),
			areaId = HOME_CAR_AREA_ID
		}
	}

	self.view.listTab3thUList:SetList(areaTabList)
	self.view.listTab3thUList:SelectItem(0, false)

	local pageList = {}

	table.insert(pageList, {
		tIndex = 0,
		name = pg.getGameString("HOMELAND_COMPOSE_MY_DESIGN"),
		designIndex = UIConst.HOME_DESIGN_MODE.MYDESIGN
	})
	table.insert(pageList, {
		tIndex = 1,
		name = pg.getGameString("HOMELAND_COMPOSE_SYSTEM_DESIGN"),
		designIndex = UIConst.HOME_DESIGN_MODE.SYSTEMDESIGN
	})
	table.insert(pageList, {
		tIndex = 2,
		name = pg.getGameString("HOMELAND_COMPOSE_SHARE_DESIGN"),
		designIndex = UIConst.HOME_DESIGN_MODE.SHAREDESIGN
	})
	self.view.listTabUList:SetList(pageList)

	local modelList = {}

	table.insert(modelList, {
		icon = "$UI_Img_HomeDesign_TabIcon_Compose.png",
		name = pg.getGameString("HOMELAND_COMPOSE_COMBINATION"),
		composeIndex = UIConst.HOME_COMPOSE_MODE.COMBINATION
	})
	table.insert(modelList, {
		icon = "$UI_Img_HomeDesign_TabIcon_Plan.png",
		name = pg.getGameString("HOMELAND_COMPOSE_PLAN"),
		composeIndex = UIConst.HOME_COMPOSE_MODE.PLAN
	})
	self.view.listTabIconUList:SetList(modelList)

	local designIndex = self.chooseDesign or 1
	local composeIndex = self.chooseCompose or 1
	local res1, button1 = self.view.listTabUList:TryGetChildAt(designIndex - 1)

	if res1 then
		button1.isSelected = true
	end

	local res2, button2 = self.view.listTabIconUList:TryGetChildAt(composeIndex - 1)

	if res2 then
		button2.isSelected = true
	end

	self:refreshPageInfo(designIndex, composeIndex)
end

function HomelandFurnitureDesignCtrl:refreshPageInfo(designIndex, composeIndex, areaId, force)
	if not force and self.chooseDesign == designIndex and self.chooseCompose == composeIndex and self.chooseAreaId == areaId then
		return
	end

	local designList = self:getDesignList(designIndex, composeIndex)

	if designList then
		designList = Utils.deepCopyTable(designList)

		local enabledDesignList = {}
		local disabledDesignList = {}

		for _, data in ipairs(designList) do
			local isAreaMatched = composeIndex == UIConst.HOME_COMPOSE_MODE.COMBINATION or areaId == nil or data.areaId == areaId

			if isAreaMatched then
				data.disableText = self:getDesignDisableText(data, composeIndex)
				data.isDisabled = data.disableText ~= nil

				if data.isDisabled then
					table.insert(disabledDesignList, data)
				else
					table.insert(enabledDesignList, data)
				end
			end
		end

		for _, data in ipairs(disabledDesignList) do
			table.insert(enabledDesignList, data)
		end

		designList = enabledDesignList
	end

	self.chooseDesign = designIndex
	self.chooseCompose = composeIndex
	self.chooseAreaId = areaId

	self.view.widget:TryChangePage("Type", composeIndex - 1)

	local maxPage = 0
	local blueprintKind = composeIndex == UIConst.HOME_COMPOSE_MODE.PLAN and HomeBlueprintConst.BLUEPRINT_KIND.PLAN or HomeBlueprintConst.BLUEPRINT_KIND.COMBINATION

	if designIndex == UIConst.HOME_DESIGN_MODE.MYDESIGN then
		maxPage = HomeBlueprintUtils.getUploadBlueprintLimit(pg.me, blueprintKind)
	elseif designIndex == UIConst.HOME_DESIGN_MODE.SHAREDESIGN then
		maxPage = HomeBlueprintUtils.getSavedOtherBlueprintLimit(pg.me, blueprintKind)
	end

	local numText = composeIndex == UIConst.HOME_COMPOSE_MODE.COMBINATION and pg.getGameString("HOMELAND_COMPOSE_COMBINATION_COUNT") or pg.getGameString("HOMELAND_COMPOSE_PLAN_COUNT")
	local designCountText = numText .. ": " .. (designList and #designList or 0)

	if composeIndex ~= UIConst.HOME_COMPOSE_MODE.PLAN or areaId == nil then
		designCountText = designCountText .. "/" .. maxPage
	end

	ClientTextUtils.setText(self.view.txtNumUSDFText, designCountText)
	self.view.txtNumUSDFText:SetActive(designIndex == UIConst.HOME_DESIGN_MODE.MYDESIGN or designIndex == UIConst.HOME_DESIGN_MODE.SHAREDESIGN)

	local importText = composeIndex == UIConst.HOME_COMPOSE_MODE.COMBINATION and pg.getGameString("HOMELAND_COMPOSE_IMPORT_COMBINATION") or pg.getGameString("HOMELAND_COMPOSE_IMPORT_PLAN")

	ClientTextUtils.setText(self.view.txtImportUSDFText, importText)

	local codeText = composeIndex == UIConst.HOME_COMPOSE_MODE.COMBINATION and pg.getGameString("HOMELAND_COMPOSE_COMBINATION_CODE") or pg.getGameString("HOMELAND_COMPOSE_PLAN_CODE")

	if designIndex == UIConst.HOME_DESIGN_MODE.SHAREDESIGN then
		codeText = pg.getGameString("HOMELAND_COMPOSE_DESIGNER")
	end

	ClientTextUtils.setText(self.view.txtCodeUSDFText, codeText .. ": ")
	self.view.btnImportUButton:SetActive(designIndex == UIConst.HOME_DESIGN_MODE.SHAREDESIGN)
	self.view.selectorUSelector:SetActive(composeIndex == UIConst.HOME_COMPOSE_MODE.PLAN and designIndex == UIConst.HOME_DESIGN_MODE.MYDESIGN)

	if not designList then
		return
	elseif #designList == 0 then
		self.view.widget:TryChangePage("Empty", 1)

		local emptyText = composeIndex == UIConst.HOME_COMPOSE_MODE.COMBINATION and pg.getGameString("HOMELAND_COMPOSE_EMPTY_COMBINATION") or pg.getGameString("HOMELAND_COMPOSE_EMPTY_PLAN")
		local specialEmptyText = pg.getGameString("HOMELAND_COMPOSE_EMPTY_COMBINATION_MY")

		ClientTextUtils.setText(self.view.txtEmptyUSDFText, designIndex == UIConst.HOME_DESIGN_MODE.MYDESIGN and composeIndex == UIConst.HOME_COMPOSE_MODE.COMBINATION and specialEmptyText or emptyText)
		ClientTextUtils.setText(self.view.txtNullUSDFText, emptyText)

		return
	end

	self.view.widget:TryChangePage("Empty", 0)
	self.view.listDesignUList:SetList(designList)
	self:refreshDesignDetail(designList[1])
end

function HomelandFurnitureDesignCtrl:getDesignList(designIndex, composeIndex)
	local designList = pg.me:getHomeBlueprintCachedList(designIndex, composeIndex)

	return designList
end

function HomelandFurnitureDesignCtrl:onBlueprintListResult(response)
	response = response or {}

	if not response.flag then
		return
	end

	local designIndex = response.sourceType
	local blueprintKind = tonumber(response.blueprintKind) or HomeBlueprintConst.BLUEPRINT_KIND.COMBINATION

	if designIndex == self.chooseDesign and blueprintKind == self.chooseCompose then
		self:refreshPageInfo(designIndex, self.chooseCompose, self.chooseAreaId, true)
	end
end

function HomelandFurnitureDesignCtrl:refreshDesignDetail(data)
	self.selectData = data

	self.view.btnCopyIDUButton:SetActive(self.chooseDesign == UIConst.HOME_DESIGN_MODE.MYDESIGN or self.chooseDesign == UIConst.HOME_DESIGN_MODE.SHAREDESIGN)

	local nameText = data.name
	local descText = data.desc

	if self.chooseDesign == UIConst.HOME_DESIGN_MODE.SYSTEMDESIGN then
		nameText = pg.getLocalizationText(data.name)
		descText = pg.getLocalizationText(data.desc)
	end

	ClientTextUtils.setText(self.view.txtTitleUSDFText, nameText or "")
	ClientTextUtils.setText(self.view.txtDecoUSDFText, descText or "")

	if self.chooseDesign == UIConst.HOME_DESIGN_MODE.MYDESIGN then
		ClientTextUtils.setText(self.view.txtIDUSDFText, data._id)
	elseif self.chooseDesign == UIConst.HOME_DESIGN_MODE.SHAREDESIGN then
		ClientTextUtils.setText(self.view.txtIDUSDFText, data.ownerName)
	end

	local detailList = {}

	if self.chooseCompose == UIConst.HOME_COMPOSE_MODE.PLAN then
		local areaName

		if data.areaId == HOME_CAR_AREA_ID then
			areaName = pg.getGameString("HOMECAR_RV_ROOFTOP")
		else
			areaName = ClientTextUtils.getLocalizationText(HomelandAreaData[data.areaId].name)
		end

		table.insert(detailList, {
			name = pg.getGameString("HOMELAND_PLAN_APPLICABLE_AREA"),
			info = areaName
		})

		local occupiedPlotCount = data.areaId == HOME_CAR_AREA_ID and 1 or data.occupiedPlotCount or 0

		table.insert(detailList, {
			name = pg.getGameString("HOMELAND_PLAN_PLOT_COUNT"),
			info = tostring(occupiedPlotCount)
		})
	else
		local rangeSize = data.size

		if not rangeSize or #rangeSize == 0 then
			rangeSize = {
				0,
				0,
				0
			}
		end

		table.insert(detailList, {
			name = pg.getGameString("HOMELAND_COMPOSE_SIZE"),
			info = rangeSize[1] .. "×" .. rangeSize[2] .. "×" .. rangeSize[3]
		})
	end

	table.insert(detailList, {
		name = pg.getGameString("HOMELAND_COMPOSE_ITEM_COUNT"),
		info = tostring(#data.ornaments)
	})
	self.view.listDetailsUList:SetList(detailList)
end

function HomelandFurnitureDesignCtrl:onDestroy()
	self.homeBlueprintCoverImageKeys = nil

	UICtrl.onDestroy(self)

	self.chooseDesign = nil
	self.chooseCompose = nil
	self.chooseAreaId = nil
	self.selectData = nil
end

function HomelandFurnitureDesignCtrl:onOpen(info)
	UICtrl.onOpen(self, info)
end

function HomelandFurnitureDesignCtrl:onShow()
	return
end

function HomelandFurnitureDesignCtrl:onHide()
	return
end

return HomelandFurnitureDesignCtrl
